; ModuleID = 'linked.bc'
source_filename = "llvm-link"

%struct.Bumper = type { i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i32, i32 }

@llvm.compiler.used = appending global [2 x i8*] [i8* bitcast (i8* (i8*, i8*)* @vuln_rx_brake_routine to i8*), i8* bitcast (i8* (i8*, i8*)* @patched_rx_brake_routine to i8*)], section "llvm.metadata"
@vuln___anvill_stack_minus_4 = global i8 0
@vuln___anvill_stack_minus_3 = global i8 0
@vuln___anvill_stack_minus_2 = global i8 0
@vuln___anvill_stack_minus_1 = global i8 0
@vuln___anvill_stack_0 = global i8 0
@vuln___anvill_stack_plus_1 = global i8 0
@vuln___anvill_stack_plus_2 = global i8 0
@vuln___anvill_stack_plus_3 = global i8 0
@vuln___anvill_stack_plus_4 = global i8 0
@vuln___anvill_stack_plus_5 = global i8 0
@vuln___anvill_stack_plus_6 = global i8 0
@vuln___anvill_stack_plus_7 = global i8 0
@vuln___anvill_stack_plus_8 = global i8 0
@vuln___anvill_stack_plus_9 = global i8 0
@vuln___anvill_stack_plus_10 = global i8 0
@vuln___anvill_stack_plus_11 = global i8 0
@vuln_buf = common dso_local global [8 x i8] zeroinitializer, align 1, !dbg !0
@vuln_bumper = common dso_local global %struct.Bumper zeroinitializer, align 4, !dbg !6
@patched___anvill_stack_minus_4 = global i8 0
@patched___anvill_stack_minus_3 = global i8 0
@patched___anvill_stack_minus_2 = global i8 0
@patched___anvill_stack_minus_1 = global i8 0
@patched___anvill_stack_0 = global i8 0
@patched___anvill_stack_plus_1 = global i8 0
@patched___anvill_stack_plus_2 = global i8 0
@patched___anvill_stack_plus_3 = global i8 0
@patched___anvill_stack_plus_4 = global i8 0
@patched___anvill_stack_plus_5 = global i8 0
@patched___anvill_stack_plus_6 = global i8 0
@patched___anvill_stack_plus_7 = global i8 0
@patched___anvill_stack_plus_8 = global i8 0
@patched___anvill_stack_plus_9 = global i8 0
@patched___anvill_stack_plus_10 = global i8 0
@patched___anvill_stack_plus_11 = global i8 0
@patched_buf = common dso_local global [8 x i8] zeroinitializer, align 1, !dbg !37
@patched_bumper = common dso_local global %struct.Bumper zeroinitializer, align 4, !dbg !42
@__const.main.buf = private unnamed_addr constant [8 x i8] c"\00\01\02\03\04\05\06\07", align 1
@.str = private unnamed_addr constant [4 x i8] c"buf\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"bumper\00", align 1
@.str.2 = private unnamed_addr constant [59 x i8] c"memcmp(&patched_bumper, &vuln_bumper, sizeof(bumper)) == 0\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"superglue.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

; Function Attrs: noinline
define i8* @vuln_rx_brake_routine(i8* %0, i8* %1) #0 {
  %3 = getelementptr i8, i8* %0, i32 4
  %4 = load i8, i8* %3, align 1
  %5 = and i8 %4, 12
  %6 = icmp eq i8 %5, 0
  %7 = getelementptr i8, i8* %1, i32 5
  %8 = xor i1 %6, true
  %9 = zext i1 %8 to i8
  store i8 %9, i8* %7, align 1
  br i1 %6, label %10, label %13

10:                                               ; preds = %2
  %11 = getelementptr i8, i8* %1, i32 6
  store i8 0, i8* %11, align 1
  %12 = getelementptr i8, i8* %1, i32 4
  store i8 0, i8* %12, align 1
  br label %34

13:                                               ; preds = %2
  %14 = getelementptr i8, i8* %0, i32 2
  %15 = load i8, i8* %14, align 1
  %16 = getelementptr i8, i8* %0, i32 3
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i16
  %19 = shl nuw i16 %18, 8
  %20 = zext i8 %15 to i16
  %21 = or i16 %19, %20
  %22 = icmp eq i16 %21, 0
  %23 = zext i1 %22 to i8
  %24 = lshr i8 %17, 7
  %25 = or i8 %24, %23
  %26 = icmp eq i8 %25, 1
  br i1 %26, label %31, label %27

27:                                               ; preds = %13
  %28 = getelementptr i8, i8* %1, i32 4
  %29 = load i8, i8* %28, align 1
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %32, label %31

31:                                               ; preds = %27, %13
  br label %34

32:                                               ; preds = %27
  %33 = getelementptr i8, i8* %1, i32 6
  store i8 1, i8* %33, align 1
  br label %34

34:                                               ; preds = %32, %31, %10
  ret i8* %1
}

; Function Attrs: noinline nounwind optnone sspstrong
define dso_local i32 @vuln_main() #1 !dbg !70 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void bitcast (i8* (i8*, i8*)* @vuln_rx_brake_routine to void (i8*, %struct.Bumper*)*)(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @vuln_buf, i32 0, i32 0), %struct.Bumper* @vuln_bumper), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: noinline
define i8* @patched_rx_brake_routine(i8* %0, i8* %1) #0 {
  %3 = getelementptr i8, i8* %0, i32 4
  %4 = load i8, i8* %3, align 1
  %5 = and i8 %4, 12
  %6 = icmp eq i8 %5, 0
  %7 = getelementptr i8, i8* %1, i32 5
  %8 = xor i1 %6, true
  %9 = zext i1 %8 to i8
  store i8 %9, i8* %7, align 1
  br i1 %6, label %10, label %13

10:                                               ; preds = %2
  %11 = getelementptr i8, i8* %1, i32 6
  store i8 0, i8* %11, align 1
  %12 = getelementptr i8, i8* %1, i32 4
  store i8 0, i8* %12, align 1
  br label %30

13:                                               ; preds = %2
  %14 = getelementptr i8, i8* %0, i32 2
  %15 = load i8, i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = getelementptr i8, i8* %0, i32 3
  %18 = load i8, i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = shl nuw nsw i32 %19, 8
  %21 = or i32 %20, %16
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %27, label %23

23:                                               ; preds = %13
  %24 = getelementptr i8, i8* %1, i32 4
  %25 = load i8, i8* %24, align 1
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %28, label %27

27:                                               ; preds = %23, %13
  br label %30

28:                                               ; preds = %23
  %29 = getelementptr i8, i8* %1, i32 6
  store i8 1, i8* %29, align 1
  br label %30

30:                                               ; preds = %28, %27, %10
  ret i8* %1
}

; Function Attrs: noinline nounwind optnone sspstrong
define dso_local i32 @patched_main() #1 !dbg !76 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void bitcast (i8* (i8*, i8*)* @patched_rx_brake_routine to void (i8*, %struct.Bumper*)*)(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @patched_buf, i32 0, i32 0), %struct.Bumper* @patched_bumper), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: noinline nounwind optnone sspstrong
define dso_local i32 @main() #1 !dbg !79 {
  %1 = alloca i32, align 4
  %2 = alloca [8 x i8], align 1
  %3 = alloca %struct.Bumper, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [8 x i8]* %2, metadata !80, metadata !DIExpression()), !dbg !81
  %4 = bitcast [8 x i8]* %2 to i8*, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %4, i8* align 1 getelementptr inbounds ([8 x i8], [8 x i8]* @__const.main.buf, i32 0, i32 0), i32 8, i1 false), !dbg !81
  %5 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i32 0, i32 0, !dbg !82
  call void @klee_make_symbolic(i8* %5, i32 8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0)), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.Bumper* %3, metadata !84, metadata !DIExpression()), !dbg !102
  %6 = bitcast %struct.Bumper* %3 to i8*, !dbg !103
  call void @klee_make_symbolic(i8* %6, i32 20, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0)), !dbg !104
  %7 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i32 0, i32 0, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 getelementptr inbounds ([8 x i8], [8 x i8]* @vuln_buf, i32 0, i32 0), i8* align 1 %7, i32 8, i1 false), !dbg !105
  %8 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i32 0, i32 0, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 getelementptr inbounds ([8 x i8], [8 x i8]* @patched_buf, i32 0, i32 0), i8* align 1 %8, i32 8, i1 false), !dbg !106
  %9 = bitcast %struct.Bumper* %3 to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 getelementptr inbounds (%struct.Bumper, %struct.Bumper* @vuln_bumper, i32 0, i32 0), i8* align 4 %9, i32 20, i1 false), !dbg !107
  %10 = bitcast %struct.Bumper* %3 to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 getelementptr inbounds (%struct.Bumper, %struct.Bumper* @patched_bumper, i32 0, i32 0), i8* align 4 %10, i32 20, i1 false), !dbg !108
  %11 = call i32 @vuln_main(), !dbg !109
  %12 = call i32 @patched_main(), !dbg !110
  %13 = call i32 @memcmp(i8* getelementptr inbounds (%struct.Bumper, %struct.Bumper* @patched_bumper, i32 0, i32 0), i8* getelementptr inbounds (%struct.Bumper, %struct.Bumper* @vuln_bumper, i32 0, i32 0), i32 20) #7, !dbg !111
  %14 = icmp eq i32 %13, 0, !dbg !111
  br i1 %14, label %15, label %16, !dbg !111

15:                                               ; preds = %0
  br label %18, !dbg !111

16:                                               ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 35, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #8, !dbg !111
  unreachable, !dbg !111

17:                                               ; No predecessors!
  br label %18, !dbg !111

18:                                               ; preds = %17, %15
  %19 = load i32, i32* %1, align 4, !dbg !112
  ret i32 %19, !dbg !112
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #3

declare void @klee_make_symbolic(i8*, i32, i8*) #4

; Function Attrs: nounwind readonly
declare i32 @memcmp(i8*, i8*, i32) #5

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #6

attributes #0 = { noinline }
attributes #1 = { noinline nounwind optnone sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2, !39, !61}
!llvm.ident = !{!63, !63, !63}
!llvm.module.flags = !{!64, !65, !66, !67, !68, !69}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 5, type: !34, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "glue.c", directory: "/home/mini/workspace/ironpatch/ironSymCmp/vuln")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "bumper", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Bumper", file: !9, line: 9, size: 160, elements: !10)
!9 = !DIFile(filename: "./../bumper.h", directory: "/home/mini/workspace/ironpatch/ironSymCmp/vuln")
!10 = !{!11, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !33}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "outer_left", scope: !8, file: !9, line: 11, baseType: !12, size: 8)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !13, line: 24, baseType: !14)
!13 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !15, line: 38, baseType: !16)
!15 = !DIFile(filename: "/usr/include/bits/types.h", directory: "")
!16 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "inner_left", scope: !8, file: !9, line: 12, baseType: !12, size: 8, offset: 8)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "inner_right", scope: !8, file: !9, line: 13, baseType: !12, size: 8, offset: 16)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "outer_right", scope: !8, file: !9, line: 14, baseType: !12, size: 8, offset: 24)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "has_flashed", scope: !8, file: !9, line: 16, baseType: !12, size: 8, offset: 32)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "brake_state", scope: !8, file: !9, line: 17, baseType: !12, size: 8, offset: 40)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "flash_lock", scope: !8, file: !9, line: 18, baseType: !12, size: 8, offset: 48)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "num_flashes", scope: !8, file: !9, line: 19, baseType: !12, size: 8, offset: 56)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "need_to_signal", scope: !8, file: !9, line: 21, baseType: !12, size: 8, offset: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "left_lock", scope: !8, file: !9, line: 22, baseType: !12, size: 8, offset: 72)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "right_lock", scope: !8, file: !9, line: 22, baseType: !12, size: 8, offset: 80)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "signal", scope: !8, file: !9, line: 23, baseType: !12, size: 8, offset: 88)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "flash_timer", scope: !8, file: !9, line: 25, baseType: !29, size: 32, offset: 96)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !30, line: 7, baseType: !31)
!30 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "")
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !15, line: 156, baseType: !32)
!32 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "signal_timer", scope: !8, file: !9, line: 26, baseType: !29, size: 32, offset: 128)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 64, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 8)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "buf", scope: !39, file: !40, line: 5, type: !34, isLocal: false, isDefinition: true)
!39 = distinct !DICompileUnit(language: DW_LANG_C99, file: !40, producer: "clang version 10.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !41, splitDebugInlining: false, nameTableKind: None)
!40 = !DIFile(filename: "glue.c", directory: "/home/mini/workspace/ironpatch/ironSymCmp/patched")
!41 = !{!37, !42}
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "bumper", scope: !39, file: !40, line: 6, type: !44, isLocal: false, isDefinition: true)
!44 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Bumper", file: !45, line: 9, size: 160, elements: !46)
!45 = !DIFile(filename: "./../bumper.h", directory: "/home/mini/workspace/ironpatch/ironSymCmp/patched")
!46 = !{!47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "outer_left", scope: !44, file: !45, line: 11, baseType: !12, size: 8)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "inner_left", scope: !44, file: !45, line: 12, baseType: !12, size: 8, offset: 8)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "inner_right", scope: !44, file: !45, line: 13, baseType: !12, size: 8, offset: 16)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "outer_right", scope: !44, file: !45, line: 14, baseType: !12, size: 8, offset: 24)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "has_flashed", scope: !44, file: !45, line: 16, baseType: !12, size: 8, offset: 32)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "brake_state", scope: !44, file: !45, line: 17, baseType: !12, size: 8, offset: 40)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "flash_lock", scope: !44, file: !45, line: 18, baseType: !12, size: 8, offset: 48)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "num_flashes", scope: !44, file: !45, line: 19, baseType: !12, size: 8, offset: 56)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "need_to_signal", scope: !44, file: !45, line: 21, baseType: !12, size: 8, offset: 64)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "left_lock", scope: !44, file: !45, line: 22, baseType: !12, size: 8, offset: 72)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "right_lock", scope: !44, file: !45, line: 22, baseType: !12, size: 8, offset: 80)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "signal", scope: !44, file: !45, line: 23, baseType: !12, size: 8, offset: 88)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "flash_timer", scope: !44, file: !45, line: 25, baseType: !29, size: 32, offset: 96)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "signal_timer", scope: !44, file: !45, line: 26, baseType: !29, size: 32, offset: 128)
!61 = distinct !DICompileUnit(language: DW_LANG_C99, file: !62, producer: "clang version 10.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!62 = !DIFile(filename: "superglue.c", directory: "/home/mini/workspace/ironpatch/ironSymCmp")
!63 = !{!"clang version 10.0.1 "}
!64 = !{i32 1, !"NumRegisterParameters", i32 0}
!65 = !{i32 7, !"Dwarf Version", i32 4}
!66 = !{i32 2, !"Debug Info Version", i32 3}
!67 = !{i32 1, !"wchar_size", i32 4}
!68 = !{i32 7, !"PIC Level", i32 2}
!69 = !{i32 7, !"PIE Level", i32 2}
!70 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 8, type: !71, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!73}
!73 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!74 = !DILocation(line: 9, column: 3, scope: !70)
!75 = !DILocation(line: 10, column: 3, scope: !70)
!76 = distinct !DISubprogram(name: "main", scope: !40, file: !40, line: 8, type: !71, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !39, retainedNodes: !4)
!77 = !DILocation(line: 9, column: 3, scope: !76)
!78 = !DILocation(line: 10, column: 3, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !62, file: !62, line: 17, type: !71, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !61, retainedNodes: !4)
!80 = !DILocalVariable(name: "buf", scope: !79, file: !62, line: 19, type: !34)
!81 = !DILocation(line: 19, column: 16, scope: !79)
!82 = !DILocation(line: 20, column: 21, scope: !79)
!83 = !DILocation(line: 20, column: 2, scope: !79)
!84 = !DILocalVariable(name: "bumper", scope: !79, file: !62, line: 22, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Bumper", file: !86, line: 9, size: 160, elements: !87)
!86 = !DIFile(filename: "./bumper.h", directory: "/home/mini/workspace/ironpatch/ironSymCmp")
!87 = !{!88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101}
!88 = !DIDerivedType(tag: DW_TAG_member, name: "outer_left", scope: !85, file: !86, line: 11, baseType: !12, size: 8)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "inner_left", scope: !85, file: !86, line: 12, baseType: !12, size: 8, offset: 8)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "inner_right", scope: !85, file: !86, line: 13, baseType: !12, size: 8, offset: 16)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "outer_right", scope: !85, file: !86, line: 14, baseType: !12, size: 8, offset: 24)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "has_flashed", scope: !85, file: !86, line: 16, baseType: !12, size: 8, offset: 32)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "brake_state", scope: !85, file: !86, line: 17, baseType: !12, size: 8, offset: 40)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "flash_lock", scope: !85, file: !86, line: 18, baseType: !12, size: 8, offset: 48)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "num_flashes", scope: !85, file: !86, line: 19, baseType: !12, size: 8, offset: 56)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "need_to_signal", scope: !85, file: !86, line: 21, baseType: !12, size: 8, offset: 64)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "left_lock", scope: !85, file: !86, line: 22, baseType: !12, size: 8, offset: 72)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "right_lock", scope: !85, file: !86, line: 22, baseType: !12, size: 8, offset: 80)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "signal", scope: !85, file: !86, line: 23, baseType: !12, size: 8, offset: 88)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "flash_timer", scope: !85, file: !86, line: 25, baseType: !29, size: 32, offset: 96)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "signal_timer", scope: !85, file: !86, line: 26, baseType: !29, size: 32, offset: 128)
!102 = !DILocation(line: 22, column: 16, scope: !79)
!103 = !DILocation(line: 23, column: 21, scope: !79)
!104 = !DILocation(line: 23, column: 2, scope: !79)
!105 = !DILocation(line: 25, column: 2, scope: !79)
!106 = !DILocation(line: 26, column: 2, scope: !79)
!107 = !DILocation(line: 28, column: 2, scope: !79)
!108 = !DILocation(line: 29, column: 2, scope: !79)
!109 = !DILocation(line: 31, column: 2, scope: !79)
!110 = !DILocation(line: 32, column: 2, scope: !79)
!111 = !DILocation(line: 35, column: 2, scope: !79)
!112 = !DILocation(line: 36, column: 1, scope: !79)
