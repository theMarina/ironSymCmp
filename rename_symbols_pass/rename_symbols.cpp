#include <optional>

#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Instrumentation/PGOInstrumentation.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;

std::string g_prefix;

struct OpCounter : PassInfoMixin<OpCounter> {
	PreservedAnalyses run(Module &, ModuleAnalysisManager &);
};

void visit_func(
    Function &func,
    TargetLibraryInfo &target_lib
) {
	StringRef name = func.getName();
	LibFunc tmp;

	if (func.isDeclaration()) {
		llvm::errs() << "- Not renaming function \"" << name << "\"\n";
		return;
	}

	llvm::errs() << "+ Renaming function \"" << name << "\" ";

	func.setName(g_prefix + "_" + name);

	llvm::errs() << "to \"" << func.getName() << "\"\n";

}

/* New PM implementation. */
PreservedAnalyses OpCounter::run(
    Module &mod,
    ModuleAnalysisManager &analysis_mgr
) {
	// reads the enviroment variable
	g_prefix = getenv ("PREFIX");
	llvm::errs() << "g_prefix = " << g_prefix << "\n";
	if(g_prefix == "") {
		g_prefix = "prefix";
	}

	FunctionAnalysisManager &func_analysis_mgr =
		analysis_mgr.getResult<FunctionAnalysisManagerModuleProxy>(mod).getManager();

	for (auto &func : mod) {
		auto &target_lib = func_analysis_mgr.getResult<TargetLibraryAnalysis>(func);

		visit_func(func, target_lib);
	}

	// Rename all global variables
	for (auto GI = mod.global_begin(), GE = mod.global_end(); GI != GE; ++GI) {
		StringRef Name = GI->getName();
		if (Name.startswith("llvm.") || (!Name.empty() && Name[0] == 1))
			continue;

		if(GI->isDeclaration())
			continue;

		llvm::errs() << "+ Renaming global variable from \"" << GI->getName() << "\" ";
		GI->setName(g_prefix + "_" + Name);
		llvm::errs() << "to \"" << GI->getName() << "\"\n";
	}

	return PreservedAnalyses::all();
}

/* Register with new PM. */
llvm::PassPluginLibraryInfo getOpCounterPluginInfo()
{
	return {
		LLVM_PLUGIN_API_VERSION,
		"OpCounter",
		LLVM_VERSION_STRING,
		[](PassBuilder &pass_builder) {
			pass_builder.registerPipelineParsingCallback(
				[](StringRef name, ModulePassManager &mod_pass_mgr,
				ArrayRef<PassBuilder::PipelineElement>) {
					if (name == "hw1") {
						mod_pass_mgr.addPass(OpCounter());
						return true;
					}

					return false;
				}
			);
		}
	};
}

extern "C" LLVM_ATTRIBUTE_WEAK
::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo()
{
	return getOpCounterPluginInfo();
}

