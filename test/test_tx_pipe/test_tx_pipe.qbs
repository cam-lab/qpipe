import qbs 1.0
import qbs.FileInfo

Product {
    name:  "test_tx_pipe"
    type:  "application"
    files: ["main.cpp", 
            "../common/RawStreamTester.cpp"]

    property string buildVariant: qbs.buildVariant
    property string bin_dir: FileInfo.path(sourceDirectory + "/../../bin/")
    
    consoleApplication: true
    destinationDirectory: FileInfo.joinPaths(bin_dir, buildVariant)

    Depends { name: "cpp" }
    Depends { name: "Qt"; submodules: ["core"] }
    Depends { name: "ip_qpipe" }

    //cpp.defines: ["ENA_FW_QT"]
    cpp.includePaths: ['../../../../include']


    Group {
        name:      "Windows stuff"
        condition: qbs.targetOS.contains("windows")
        cpp.defines: "ENA_WIN_API"
    }
}

        
