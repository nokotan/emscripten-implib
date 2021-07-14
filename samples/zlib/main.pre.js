Module["preRun"] = [
    function()
    {
        FS.mkdir("/working")
        FS.mount(NODEFS, { root: '.' }, '/working');
    }
];

Module["dynamicLibraries"] = [ "libz.wasm" ]
