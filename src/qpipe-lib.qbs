import qbs 1.0
import qbs.FileInfo

Product {
    name: "ip_qpipe"
    type: "staticlibrary"
    files: [ "shared_mem.cpp",
             "ip_qpipe.cpp",
             "ip_qpipe_lib.cpp",
             "ip_qpipe.h",
             "qobject_p.h",
             "qsharedmemory.h",
             "qsharedmemory_p.h",
             "shared_mem.h" ] 


    property string buildVariant: qbs.buildVariant
    property string lib_dir: FileInfo.path(sourceDirectory + "/../../../libs/")

//    property bool slon: { console.info(lib_dir) }
    
    destinationDirectory: FileInfo.joinPaths(lib_dir, buildVariant)

//    property bool slonick: { console.info(destinationDirectory) }

    Depends { name: "cpp" }
    Depends { name: "Qt"; submodules: ["testlib"] }
    cpp.defines: ["ENA_FW_QT"]
    cpp.includePaths: ['../../../include']

    Group {
        name:      "Windows stuff"
        condition: qbs.targetOS.contains("windows")
        cpp.defines: "ENA_WIN_API"
    }
}


