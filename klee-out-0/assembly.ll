; ModuleID = 'linked.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
  br label %33

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
  br i1 %26, label %33, label %27

27:                                               ; preds = %13
  %28 = getelementptr i8, i8* %1, i32 4
  %29 = load i8, i8* %28, align 1
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %31, label %33

31:                                               ; preds = %27
  %32 = getelementptr i8, i8* %1, i32 6
  store i8 1, i8* %32, align 1
  br label %33

33:                                               ; preds = %13, %27, %31, %10
  ret i8* %1
}

; Function Attrs: noinline nounwind optnone sspstrong
define dso_local i32 @vuln_main() #1 !dbg !74 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void bitcast (i8* (i8*, i8*)* @vuln_rx_brake_routine to void (i8*, %struct.Bumper*)*)(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @vuln_buf, i32 0, i32 0), %struct.Bumper* @vuln_bumper), !dbg !78
  ret i32 0, !dbg !79
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
  br label %29

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
  br i1 %22, label %29, label %23

23:                                               ; preds = %13
  %24 = getelementptr i8, i8* %1, i32 4
  %25 = load i8, i8* %24, align 1
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %27, label %29

27:                                               ; preds = %23
  %28 = getelementptr i8, i8* %1, i32 6
  store i8 1, i8* %28, align 1
  br label %29

29:                                               ; preds = %13, %23, %27, %10
  ret i8* %1
}

; Function Attrs: noinline nounwind optnone sspstrong
define dso_local i32 @patched_main() #1 !dbg !80 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void bitcast (i8* (i8*, i8*)* @patched_rx_brake_routine to void (i8*, %struct.Bumper*)*)(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @patched_buf, i32 0, i32 0), %struct.Bumper* @patched_bumper), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: noinline nounwind optnone sspstrong
define dso_local i32 @main() #1 !dbg !83 {
  %1 = alloca i32, align 4
  %2 = alloca [8 x i8], align 1
  %3 = alloca %struct.Bumper, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [8 x i8]* %2, metadata !84, metadata !DIExpression()), !dbg !85
  %4 = bitcast [8 x i8]* %2 to i8*, !dbg !85
  %5 = call i8* @memcpy(i8* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @__const.main.buf, i32 0, i32 0), i64 8), !dbg !85
  %6 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i32 0, i32 0, !dbg !86
  call void @klee_make_symbolic(i8* %6, i32 8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0)), !dbg !87
  call void @llvm.dbg.declare(metadata %struct.Bumper* %3, metadata !88, metadata !DIExpression()), !dbg !106
  %7 = bitcast %struct.Bumper* %3 to i8*, !dbg !107
  call void @klee_make_symbolic(i8* %7, i32 20, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0)), !dbg !108
  %8 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i32 0, i32 0, !dbg !109
  %9 = call i8* @memcpy(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @vuln_buf, i32 0, i32 0), i8* %8, i64 8), !dbg !109
  %10 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i32 0, i32 0, !dbg !110
  %11 = call i8* @memcpy(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @patched_buf, i32 0, i32 0), i8* %10, i64 8), !dbg !110
  %12 = bitcast %struct.Bumper* %3 to i8*, !dbg !111
  %13 = call i8* @memcpy(i8* getelementptr inbounds (%struct.Bumper, %struct.Bumper* @vuln_bumper, i32 0, i32 0), i8* %12, i64 20), !dbg !111
  %14 = bitcast %struct.Bumper* %3 to i8*, !dbg !112
  %15 = call i8* @memcpy(i8* getelementptr inbounds (%struct.Bumper, %struct.Bumper* @patched_bumper, i32 0, i32 0), i8* %14, i64 20), !dbg !112
  %16 = call i32 @vuln_main(), !dbg !113
  %17 = call i32 @patched_main(), !dbg !114
  %18 = call i32 bitcast (i32 (i8*, i8*, i64)* @memcmp to i32 (i8*, i8*, i32)*)(i8* getelementptr inbounds (%struct.Bumper, %struct.Bumper* @patched_bumper, i32 0, i32 0), i8* getelementptr inbounds (%struct.Bumper, %struct.Bumper* @vuln_bumper, i32 0, i32 0), i32 20) #8, !dbg !115
  %19 = icmp eq i32 %18, 0, !dbg !115
  br i1 %19, label %20, label %21, !dbg !115

20:                                               ; preds = %0
  br label %23, !dbg !115

21:                                               ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 35, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #9, !dbg !115
  unreachable, !dbg !115

22:                                               ; No predecessors!
  br label %23, !dbg !115

23:                                               ; preds = %22, %20
  %24 = load i32, i32* %1, align 4, !dbg !116
  ret i32 %24, !dbg !116
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #3

declare void @klee_make_symbolic(i8*, i32, i8*) #4

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: noinline nounwind readonly sspstrong uwtable
define dso_local i32 @memcmp(i8* nonnull %0, i8* nonnull %1, i64 %2) #6 !dbg !117 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !126, metadata !DIExpression()), !dbg !127
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !128, metadata !DIExpression()), !dbg !129
  store i64 %2, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !130, metadata !DIExpression()), !dbg !131
  %10 = load i64, i64* %7, align 8, !dbg !132
  %11 = icmp ne i64 %10, 0, !dbg !134
  br i1 %11, label %12, label %39, !dbg !135

12:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata i8** %8, metadata !136, metadata !DIExpression()), !dbg !140
  %13 = load i8*, i8** %5, align 8, !dbg !141
  store i8* %13, i8** %8, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata i8** %9, metadata !142, metadata !DIExpression()), !dbg !143
  %14 = load i8*, i8** %6, align 8, !dbg !144
  store i8* %14, i8** %9, align 8, !dbg !143
  br label %15, !dbg !145

15:                                               ; preds = %35, %12
  %16 = load i8*, i8** %8, align 8, !dbg !146
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !146
  store i8* %17, i8** %8, align 8, !dbg !146
  %18 = load i8, i8* %16, align 1, !dbg !149
  %19 = zext i8 %18 to i32, !dbg !149
  %20 = load i8*, i8** %9, align 8, !dbg !150
  %21 = getelementptr inbounds i8, i8* %20, i32 1, !dbg !150
  store i8* %21, i8** %9, align 8, !dbg !150
  %22 = load i8, i8* %20, align 1, !dbg !151
  %23 = zext i8 %22 to i32, !dbg !151
  %24 = icmp ne i32 %19, %23, !dbg !152
  br i1 %24, label %25, label %35, !dbg !153

25:                                               ; preds = %15
  %26 = load i8*, i8** %8, align 8, !dbg !154
  %27 = getelementptr inbounds i8, i8* %26, i32 -1, !dbg !154
  store i8* %27, i8** %8, align 8, !dbg !154
  %28 = load i8, i8* %27, align 1, !dbg !156
  %29 = zext i8 %28 to i32, !dbg !156
  %30 = load i8*, i8** %9, align 8, !dbg !157
  %31 = getelementptr inbounds i8, i8* %30, i32 -1, !dbg !157
  store i8* %31, i8** %9, align 8, !dbg !157
  %32 = load i8, i8* %31, align 1, !dbg !158
  %33 = zext i8 %32 to i32, !dbg !158
  %34 = sub nsw i32 %29, %33, !dbg !159
  store i32 %34, i32* %4, align 4, !dbg !160
  br label %40, !dbg !160

35:                                               ; preds = %15
  %36 = load i64, i64* %7, align 8, !dbg !161
  %37 = add i64 %36, -1, !dbg !161
  store i64 %37, i64* %7, align 8, !dbg !161
  %38 = icmp ne i64 %37, 0, !dbg !162
  br i1 %38, label %15, label %39, !dbg !163, !llvm.loop !164

39:                                               ; preds = %35, %3
  store i32 0, i32* %4, align 4, !dbg !166
  br label %40, !dbg !166

40:                                               ; preds = %39, %25
  %41 = load i32, i32* %4, align 4, !dbg !167
  ret i32 %41, !dbg !167
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i8* @memcpy(i8* %0, i8* %1, i64 %2) #7 !dbg !168 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !173, metadata !DIExpression()), !dbg !174
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !175, metadata !DIExpression()), !dbg !176
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i8** %7, metadata !179, metadata !DIExpression()), !dbg !182
  %9 = load i8*, i8** %4, align 8, !dbg !183
  store i8* %9, i8** %7, align 8, !dbg !182
  call void @llvm.dbg.declare(metadata i8** %8, metadata !184, metadata !DIExpression()), !dbg !187
  %10 = load i8*, i8** %5, align 8, !dbg !188
  store i8* %10, i8** %8, align 8, !dbg !187
  br label %11, !dbg !189

11:                                               ; preds = %15, %3
  %12 = load i64, i64* %6, align 8, !dbg !190
  %13 = add i64 %12, -1, !dbg !190
  store i64 %13, i64* %6, align 8, !dbg !190
  %14 = icmp ugt i64 %12, 0, !dbg !191
  br i1 %14, label %15, label %21, !dbg !189

15:                                               ; preds = %11
  %16 = load i8*, i8** %8, align 8, !dbg !192
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !192
  store i8* %17, i8** %8, align 8, !dbg !192
  %18 = load i8, i8* %16, align 1, !dbg !193
  %19 = load i8*, i8** %7, align 8, !dbg !194
  %20 = getelementptr inbounds i8, i8* %19, i32 1, !dbg !194
  store i8* %20, i8** %7, align 8, !dbg !194
  store i8 %18, i8* %19, align 1, !dbg !195
  br label %11, !dbg !189, !llvm.loop !196

21:                                               ; preds = %11
  %22 = load i8*, i8** %4, align 8, !dbg !197
  ret i8* %22, !dbg !198
}

attributes #0 = { noinline }
attributes #1 = { noinline nounwind optnone sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline nounwind readonly sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!2, !39, !61, !63, !65}
!llvm.ident = !{!67, !67, !67, !67, !67}
!llvm.module.flags = !{!68, !69, !70, !71, !72, !73}

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
!63 = distinct !DICompileUnit(language: DW_LANG_C89, file: !64, producer: "clang version 10.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!64 = !DIFile(filename: "/home/mini/.cache/yay/klee/src/klee/runtime/FreeStanding/memcmp.c", directory: "/home/mini/.cache/yay/klee/src/build/runtime/FreeStanding")
!65 = distinct !DICompileUnit(language: DW_LANG_C89, file: !66, producer: "clang version 10.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!66 = !DIFile(filename: "/home/mini/.cache/yay/klee/src/klee/runtime/FreeStanding/memcpy.c", directory: "/home/mini/.cache/yay/klee/src/build/runtime/FreeStanding")
!67 = !{!"clang version 10.0.1 "}
!68 = !{i32 1, !"NumRegisterParameters", i32 0}
!69 = !{i32 7, !"Dwarf Version", i32 4}
!70 = !{i32 2, !"Debug Info Version", i32 3}
!71 = !{i32 1, !"wchar_size", i32 4}
!72 = !{i32 7, !"PIC Level", i32 2}
!73 = !{i32 7, !"PIE Level", i32 2}
!74 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 8, type: !75, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DISubroutineType(types: !76)
!76 = !{!77}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DILocation(line: 9, column: 3, scope: !74)
!79 = !DILocation(line: 10, column: 3, scope: !74)
!80 = distinct !DISubprogram(name: "main", scope: !40, file: !40, line: 8, type: !75, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !39, retainedNodes: !4)
!81 = !DILocation(line: 9, column: 3, scope: !80)
!82 = !DILocation(line: 10, column: 3, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !62, file: !62, line: 17, type: !75, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !61, retainedNodes: !4)
!84 = !DILocalVariable(name: "buf", scope: !83, file: !62, line: 19, type: !34)
!85 = !DILocation(line: 19, column: 16, scope: !83)
!86 = !DILocation(line: 20, column: 21, scope: !83)
!87 = !DILocation(line: 20, column: 2, scope: !83)
!88 = !DILocalVariable(name: "bumper", scope: !83, file: !62, line: 22, type: !89)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Bumper", file: !90, line: 9, size: 160, elements: !91)
!90 = !DIFile(filename: "./bumper.h", directory: "/home/mini/workspace/ironpatch/ironSymCmp")
!91 = !{!92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "outer_left", scope: !89, file: !90, line: 11, baseType: !12, size: 8)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "inner_left", scope: !89, file: !90, line: 12, baseType: !12, size: 8, offset: 8)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "inner_right", scope: !89, file: !90, line: 13, baseType: !12, size: 8, offset: 16)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "outer_right", scope: !89, file: !90, line: 14, baseType: !12, size: 8, offset: 24)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "has_flashed", scope: !89, file: !90, line: 16, baseType: !12, size: 8, offset: 32)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "brake_state", scope: !89, file: !90, line: 17, baseType: !12, size: 8, offset: 40)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "flash_lock", scope: !89, file: !90, line: 18, baseType: !12, size: 8, offset: 48)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "num_flashes", scope: !89, file: !90, line: 19, baseType: !12, size: 8, offset: 56)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "need_to_signal", scope: !89, file: !90, line: 21, baseType: !12, size: 8, offset: 64)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "left_lock", scope: !89, file: !90, line: 22, baseType: !12, size: 8, offset: 72)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "right_lock", scope: !89, file: !90, line: 22, baseType: !12, size: 8, offset: 80)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "signal", scope: !89, file: !90, line: 23, baseType: !12, size: 8, offset: 88)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "flash_timer", scope: !89, file: !90, line: 25, baseType: !29, size: 32, offset: 96)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "signal_timer", scope: !89, file: !90, line: 26, baseType: !29, size: 32, offset: 128)
!106 = !DILocation(line: 22, column: 16, scope: !83)
!107 = !DILocation(line: 23, column: 21, scope: !83)
!108 = !DILocation(line: 23, column: 2, scope: !83)
!109 = !DILocation(line: 25, column: 2, scope: !83)
!110 = !DILocation(line: 26, column: 2, scope: !83)
!111 = !DILocation(line: 28, column: 2, scope: !83)
!112 = !DILocation(line: 29, column: 2, scope: !83)
!113 = !DILocation(line: 31, column: 2, scope: !83)
!114 = !DILocation(line: 32, column: 2, scope: !83)
!115 = !DILocation(line: 35, column: 2, scope: !83)
!116 = !DILocation(line: 36, column: 1, scope: !83)
!117 = distinct !DISubprogram(name: "memcmp", scope: !118, file: !118, line: 42, type: !119, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !4)
!118 = !DIFile(filename: "klee/runtime/FreeStanding/memcmp.c", directory: "/home/mini/.cache/yay/klee/src")
!119 = !DISubroutineType(types: !120)
!120 = !{!77, !121, !121, !123}
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!123 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !124, line: 46, baseType: !125)
!124 = !DIFile(filename: "/usr/lib/clang/10.0.1/include/stddef.h", directory: "")
!125 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!126 = !DILocalVariable(name: "s1", arg: 1, scope: !117, file: !118, line: 42, type: !121)
!127 = !DILocation(line: 42, column: 24, scope: !117)
!128 = !DILocalVariable(name: "s2", arg: 2, scope: !117, file: !118, line: 42, type: !121)
!129 = !DILocation(line: 42, column: 40, scope: !117)
!130 = !DILocalVariable(name: "n", arg: 3, scope: !117, file: !118, line: 42, type: !123)
!131 = !DILocation(line: 42, column: 51, scope: !117)
!132 = !DILocation(line: 43, column: 7, scope: !133)
!133 = distinct !DILexicalBlock(scope: !117, file: !118, line: 43, column: 7)
!134 = !DILocation(line: 43, column: 9, scope: !133)
!135 = !DILocation(line: 43, column: 7, scope: !117)
!136 = !DILocalVariable(name: "p1", scope: !137, file: !118, line: 44, type: !138)
!137 = distinct !DILexicalBlock(scope: !133, file: !118, line: 43, column: 15)
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!140 = !DILocation(line: 44, column: 26, scope: !137)
!141 = !DILocation(line: 44, column: 31, scope: !137)
!142 = !DILocalVariable(name: "p2", scope: !137, file: !118, line: 44, type: !138)
!143 = !DILocation(line: 44, column: 36, scope: !137)
!144 = !DILocation(line: 44, column: 41, scope: !137)
!145 = !DILocation(line: 46, column: 5, scope: !137)
!146 = !DILocation(line: 47, column: 14, scope: !147)
!147 = distinct !DILexicalBlock(scope: !148, file: !118, line: 47, column: 11)
!148 = distinct !DILexicalBlock(scope: !137, file: !118, line: 46, column: 8)
!149 = !DILocation(line: 47, column: 11, scope: !147)
!150 = !DILocation(line: 47, column: 23, scope: !147)
!151 = !DILocation(line: 47, column: 20, scope: !147)
!152 = !DILocation(line: 47, column: 17, scope: !147)
!153 = !DILocation(line: 47, column: 11, scope: !148)
!154 = !DILocation(line: 48, column: 18, scope: !155)
!155 = distinct !DILexicalBlock(scope: !147, file: !118, line: 47, column: 27)
!156 = !DILocation(line: 48, column: 17, scope: !155)
!157 = !DILocation(line: 48, column: 26, scope: !155)
!158 = !DILocation(line: 48, column: 25, scope: !155)
!159 = !DILocation(line: 48, column: 23, scope: !155)
!160 = !DILocation(line: 48, column: 9, scope: !155)
!161 = !DILocation(line: 50, column: 14, scope: !137)
!162 = !DILocation(line: 50, column: 18, scope: !137)
!163 = !DILocation(line: 50, column: 5, scope: !148)
!164 = distinct !{!164, !145, !165}
!165 = !DILocation(line: 50, column: 22, scope: !137)
!166 = !DILocation(line: 52, column: 3, scope: !117)
!167 = !DILocation(line: 53, column: 1, scope: !117)
!168 = distinct !DISubprogram(name: "memcpy", scope: !169, file: !169, line: 12, type: !170, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !65, retainedNodes: !4)
!169 = !DIFile(filename: "klee/runtime/FreeStanding/memcpy.c", directory: "/home/mini/.cache/yay/klee/src")
!170 = !DISubroutineType(types: !171)
!171 = !{!172, !172, !121, !123}
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!173 = !DILocalVariable(name: "destaddr", arg: 1, scope: !168, file: !169, line: 12, type: !172)
!174 = !DILocation(line: 12, column: 20, scope: !168)
!175 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !168, file: !169, line: 12, type: !121)
!176 = !DILocation(line: 12, column: 42, scope: !168)
!177 = !DILocalVariable(name: "len", arg: 3, scope: !168, file: !169, line: 12, type: !123)
!178 = !DILocation(line: 12, column: 58, scope: !168)
!179 = !DILocalVariable(name: "dest", scope: !168, file: !169, line: 13, type: !180)
!180 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64)
!181 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!182 = !DILocation(line: 13, column: 9, scope: !168)
!183 = !DILocation(line: 13, column: 16, scope: !168)
!184 = !DILocalVariable(name: "src", scope: !168, file: !169, line: 14, type: !185)
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!186 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !181)
!187 = !DILocation(line: 14, column: 15, scope: !168)
!188 = !DILocation(line: 14, column: 21, scope: !168)
!189 = !DILocation(line: 16, column: 3, scope: !168)
!190 = !DILocation(line: 16, column: 13, scope: !168)
!191 = !DILocation(line: 16, column: 16, scope: !168)
!192 = !DILocation(line: 17, column: 19, scope: !168)
!193 = !DILocation(line: 17, column: 15, scope: !168)
!194 = !DILocation(line: 17, column: 10, scope: !168)
!195 = !DILocation(line: 17, column: 13, scope: !168)
!196 = distinct !{!196, !189, !192}
!197 = !DILocation(line: 18, column: 10, scope: !168)
!198 = !DILocation(line: 18, column: 3, scope: !168)
