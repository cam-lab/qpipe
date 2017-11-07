import qbs 1.0

Project {
    name: "qpipe" 

    references: [
        "src/qpipe-lib.qbs",
        "test/test_rx_pipe/test_rx_pipe.qbs",
        "test/test_tx_pipe/test_tx_pipe.qbs"
    ]
}

