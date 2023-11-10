; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bst = type { %struct.bstnode* }
%struct.bstnode = type { i32, %struct.bstnode*, %struct.bstnode* }

@.str = private unnamed_addr constant [5 x i8] c"tree\00", align 1
@.str.1 = private unnamed_addr constant [53 x i8] c"/u1/dtompkins/.seashell/projects/_Final/q2-bst/bst.c\00", align 1
@__PRETTY_FUNCTION__.bst_insert = private unnamed_addr constant [35 x i8] c"void bst_insert(int, struct bst *)\00", align 1
@__PRETTY_FUNCTION__.bst_destroy = private unnamed_addr constant [31 x i8] c"void bst_destroy(struct bst *)\00", align 1

; Function Attrs: noinline nounwind optnone
define %struct.bst* @bst_create_empty() #0 {
entry:
  %tree = alloca %struct.bst*, align 8
  %call = call noalias i8* @malloc(i64 8) #3
  %0 = bitcast i8* %call to %struct.bst*
  store %struct.bst* %0, %struct.bst** %tree, align 8
  %1 = load %struct.bst*, %struct.bst** %tree, align 8
  %root = getelementptr inbounds %struct.bst, %struct.bst* %1, i32 0, i32 0
  store %struct.bstnode* null, %struct.bstnode** %root, align 8
  %2 = load %struct.bst*, %struct.bst** %tree, align 8
  ret %struct.bst* %2
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind optnone
define void @bst_insert(i32 %i, %struct.bst* %tree) #0 {
entry:
  %i.addr = alloca i32, align 4
  %tree.addr = alloca %struct.bst*, align 8
  %node = alloca %struct.bstnode*, align 8
  %parent = alloca %struct.bstnode*, align 8
  store i32 %i, i32* %i.addr, align 4
  store %struct.bst* %tree, %struct.bst** %tree.addr, align 8
  %0 = load %struct.bst*, %struct.bst** %tree.addr, align 8
  %tobool = icmp ne %struct.bst* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.1, i64 0, i64 0), i32 29, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__PRETTY_FUNCTION__.bst_insert, i64 0, i64 0)) #4
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.bst*, %struct.bst** %tree.addr, align 8
  %root = getelementptr inbounds %struct.bst, %struct.bst* %1, i32 0, i32 0
  %2 = load %struct.bstnode*, %struct.bstnode** %root, align 8
  store %struct.bstnode* %2, %struct.bstnode** %node, align 8
  store %struct.bstnode* null, %struct.bstnode** %parent, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end8, %if.end
  %3 = load %struct.bstnode*, %struct.bstnode** %node, align 8
  %tobool1 = icmp ne %struct.bstnode* %3, null
  br i1 %tobool1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load %struct.bstnode*, %struct.bstnode** %node, align 8
  %item = getelementptr inbounds %struct.bstnode, %struct.bstnode* %4, i32 0, i32 0
  %5 = load i32, i32* %item, align 8
  %6 = load i32, i32* %i.addr, align 4
  %cmp = icmp eq i32 %5, %6
  br i1 %cmp, label %if.then2, label %if.end3

if.then2:                                         ; preds = %while.body
  br label %if.end22

if.end3:                                          ; preds = %while.body
  %7 = load %struct.bstnode*, %struct.bstnode** %node, align 8
  store %struct.bstnode* %7, %struct.bstnode** %parent, align 8
  %8 = load i32, i32* %i.addr, align 4
  %9 = load %struct.bstnode*, %struct.bstnode** %node, align 8
  %item4 = getelementptr inbounds %struct.bstnode, %struct.bstnode* %9, i32 0, i32 0
  %10 = load i32, i32* %item4, align 8
  %cmp5 = icmp slt i32 %8, %10
  br i1 %cmp5, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.end3
  %11 = load %struct.bstnode*, %struct.bstnode** %node, align 8
  %left = getelementptr inbounds %struct.bstnode, %struct.bstnode* %11, i32 0, i32 1
  %12 = load %struct.bstnode*, %struct.bstnode** %left, align 8
  store %struct.bstnode* %12, %struct.bstnode** %node, align 8
  br label %if.end8

if.else7:                                         ; preds = %if.end3
  %13 = load %struct.bstnode*, %struct.bstnode** %node, align 8
  %right = getelementptr inbounds %struct.bstnode, %struct.bstnode* %13, i32 0, i32 2
  %14 = load %struct.bstnode*, %struct.bstnode** %right, align 8
  store %struct.bstnode* %14, %struct.bstnode** %node, align 8
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %15 = load %struct.bstnode*, %struct.bstnode** %parent, align 8
  %cmp9 = icmp eq %struct.bstnode* %15, null
  br i1 %cmp9, label %if.then10, label %if.else12

if.then10:                                        ; preds = %while.end
  %16 = load i32, i32* %i.addr, align 4
  %call = call %struct.bstnode* @new_leaf(i32 %16)
  %17 = load %struct.bst*, %struct.bst** %tree.addr, align 8
  %root11 = getelementptr inbounds %struct.bst, %struct.bst* %17, i32 0, i32 0
  store %struct.bstnode* %call, %struct.bstnode** %root11, align 8
  br label %if.end22

if.else12:                                        ; preds = %while.end
  %18 = load i32, i32* %i.addr, align 4
  %19 = load %struct.bstnode*, %struct.bstnode** %parent, align 8
  %item13 = getelementptr inbounds %struct.bstnode, %struct.bstnode* %19, i32 0, i32 0
  %20 = load i32, i32* %item13, align 8
  %cmp14 = icmp slt i32 %18, %20
  br i1 %cmp14, label %if.then15, label %if.else18

if.then15:                                        ; preds = %if.else12
  %21 = load i32, i32* %i.addr, align 4
  %call16 = call %struct.bstnode* @new_leaf(i32 %21)
  %22 = load %struct.bstnode*, %struct.bstnode** %parent, align 8
  %left17 = getelementptr inbounds %struct.bstnode, %struct.bstnode* %22, i32 0, i32 1
  store %struct.bstnode* %call16, %struct.bstnode** %left17, align 8
  br label %if.end21

if.else18:                                        ; preds = %if.else12
  %23 = load i32, i32* %i.addr, align 4
  %call19 = call %struct.bstnode* @new_leaf(i32 %23)
  %24 = load %struct.bstnode*, %struct.bstnode** %parent, align 8
  %right20 = getelementptr inbounds %struct.bstnode, %struct.bstnode* %24, i32 0, i32 2
  store %struct.bstnode* %call19, %struct.bstnode** %right20, align 8
  br label %if.end21

if.end21:                                         ; preds = %if.else18, %if.then15
  br label %if.end22

if.end22:                                         ; preds = %if.then2, %if.end21, %if.then10
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: noinline nounwind optnone
define internal %struct.bstnode* @new_leaf(i32 %i) #0 {
entry:
  %i.addr = alloca i32, align 4
  %leaf = alloca %struct.bstnode*, align 8
  store i32 %i, i32* %i.addr, align 4
  %call = call noalias i8* @malloc(i64 24) #3
  %0 = bitcast i8* %call to %struct.bstnode*
  store %struct.bstnode* %0, %struct.bstnode** %leaf, align 8
  %1 = load i32, i32* %i.addr, align 4
  %2 = load %struct.bstnode*, %struct.bstnode** %leaf, align 8
  %item = getelementptr inbounds %struct.bstnode, %struct.bstnode* %2, i32 0, i32 0
  store i32 %1, i32* %item, align 8
  %3 = load %struct.bstnode*, %struct.bstnode** %leaf, align 8
  %left = getelementptr inbounds %struct.bstnode, %struct.bstnode* %3, i32 0, i32 1
  store %struct.bstnode* null, %struct.bstnode** %left, align 8
  %4 = load %struct.bstnode*, %struct.bstnode** %leaf, align 8
  %right = getelementptr inbounds %struct.bstnode, %struct.bstnode* %4, i32 0, i32 2
  store %struct.bstnode* null, %struct.bstnode** %right, align 8
  %5 = load %struct.bstnode*, %struct.bstnode** %leaf, align 8
  ret %struct.bstnode* %5
}

; Function Attrs: noinline nounwind optnone
define void @bst_destroy(%struct.bst* %tree) #0 {
entry:
  %tree.addr = alloca %struct.bst*, align 8
  store %struct.bst* %tree, %struct.bst** %tree.addr, align 8
  %0 = load %struct.bst*, %struct.bst** %tree.addr, align 8
  %tobool = icmp ne %struct.bst* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.1, i64 0, i64 0), i32 62, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__PRETTY_FUNCTION__.bst_destroy, i64 0, i64 0)) #4
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.bst*, %struct.bst** %tree.addr, align 8
  %root = getelementptr inbounds %struct.bst, %struct.bst* %1, i32 0, i32 0
  %2 = load %struct.bstnode*, %struct.bstnode** %root, align 8
  call void @free_bstnode(%struct.bstnode* %2)
  %3 = load %struct.bst*, %struct.bst** %tree.addr, align 8
  %4 = bitcast %struct.bst* %3 to i8*
  call void @free(i8* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal void @free_bstnode(%struct.bstnode* %node) #0 {
entry:
  %node.addr = alloca %struct.bstnode*, align 8
  store %struct.bstnode* %node, %struct.bstnode** %node.addr, align 8
  %0 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %tobool = icmp ne %struct.bstnode* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %left = getelementptr inbounds %struct.bstnode, %struct.bstnode* %1, i32 0, i32 1
  %2 = load %struct.bstnode*, %struct.bstnode** %left, align 8
  call void @free_bstnode(%struct.bstnode* %2)
  %3 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %right = getelementptr inbounds %struct.bstnode, %struct.bstnode* %3, i32 0, i32 2
  %4 = load %struct.bstnode*, %struct.bstnode** %right, align 8
  call void @free_bstnode(%struct.bstnode* %4)
  %5 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %6 = bitcast %struct.bstnode* %5 to i8*
  call void @free(i8* %6) #3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!1 = !{i32 1, !"wchar_size", i32 4}
