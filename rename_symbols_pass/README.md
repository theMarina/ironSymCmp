This is the command I use to run the pass:
```
opt -load-pass-plugin build/libhw1.so -passes='hw1' -disable-output ../vuln.bc
cmake .. && make && opt -load-pass-plugin ./libhw1.so -passes='hw1' ../../vuln.bc -o aa.bc
```

Looks like a useful sample code <https://llvm.org/doxygen/MetaRenamer_8cpp_source.html>
