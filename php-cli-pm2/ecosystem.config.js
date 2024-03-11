module.exports = {
    apps: [{
        name: "test",
        script: "./test.php",
        interpreter: "/usr/local/bin/php",
        cwd: "/root/",
        watch: false,
        "out_file": "/dev/null"
    }, {
        name: "test2",
        script: "./test.php",
        interpreter: "/usr/local/bin/php",
        cwd: "/root/",
        watch: false,
        "out_file": "/dev/null"
    }]
}
