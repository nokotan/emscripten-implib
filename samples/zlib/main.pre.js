Module["preRun"] = [
    function()
    {
        if (ENVIRONMENT_IS_NODE)
        {
            FS.mkdir("/working")
            FS.mount(NODEFS, { root: '.' }, '/working');
        }
    }
];
