
# Changes

    **Changelog**

- Support attributes (public, isolate_assignments, etc.) in configuration files.
- Add `-match` to `lint_off` to waive warnings.
- Link Verilator binary partially statically.
- Verilation speed improvements.
- Support `libgoogle-perftools-dev`'s `libtcmalloc` if available.
- Support `$readmem/$writemem` with assoc. arrarys.
- Support `type(expression)` operator and `$typename`.
- Support left justified `$display`.
- Support string character access via indexing.
- Support `enum.next(k)` with constant `k > 1`.
- Support parameter access from arrays of interfaces.
- Add parameter values in XML.
- Add `loc` column location in XML.
- Add error on misused define.
- Add parameter to set maximum signal width.
- Add warning on `genvar` in normal for loop.
- Fix VPI scope naming for public modules.
- Fix `FST` tracing of enums inside structs.
- Fix `WIDTH` warning on.


- Check version.
- Run the "Hello World" C++ complilation example [here](https://www.veripool.org/projects/verilator/wiki/Manual-verilator#EXAMPLE-C-EXECUTION)
