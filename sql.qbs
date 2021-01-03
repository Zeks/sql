import qbs 1.0
import qbs.Process
import qbs.Environment
import "../../BuildHelpers.js" as Funcs
import "../../BaseDefines.qbs" as Library
import "../../Precompiled.qbs" as Precompiled

Library{
name: "sql_abstractions"
type: "staticlibrary"
Depends { name: "cpp" }
Depends { name: "Environment"}
Depends { name: "Qt.core"}
Depends { name: "Qt.sql"}
Depends { name: "Qt.concurrent"}
Depends { name: "logger" }
Export{
    Depends { name: "cpp" }
    cpp.includePaths: [product.sourceDirectory + "/include"]
    cpp.staticLibraries: {
        var libs = []
        libs = ["pqxx", "pq"]
        return libs
    }
}

cpp.includePaths: [
                "../",
                "../../",
                product.sourceDirectory,
                product.sourceDirectory + "/include",
                product.sourceDirectory + "/../../third_party/fmt/include",
]
cpp.defines: base.concat(["FMT_HEADER_ONLY"])
files: [
        "include/sql_abstractions/shared_trick.h",
        "include/sql_abstractions/sql_connection_token.h",
        "include/sql_abstractions/sql_context.h",
        "include/sql_abstractions/sql_database.h",
        "include/sql_abstractions/sql_database_impl_base.h",
        "include/sql_abstractions/sql_database_impl_null.h",
        "include/sql_abstractions/sql_database_impl_pq.h",
        "include/sql_abstractions/sql_database_impl_sqlite.h",
        "include/sql_abstractions/sql_error.h",
        "include/sql_abstractions/sql_query.h",
        "include/sql_abstractions/sql_query_impl_base.h",
        "include/sql_abstractions/sql_query_impl_null.h",
        "include/sql_abstractions/sql_query_impl_pq.h",
        "include/sql_abstractions/sql_query_impl_sqlite.h",
        "include/sql_abstractions/sql_transaction.h",
        "include/sql_abstractions/sql_variant.h",
        "include/sql_abstractions/string_hasher.h",
        "include/sql_abstractions/string_streamer.h",
        "include/sql_abstractions/string_trimmer.h",
        "src/sql_context.cpp",
        "src/sql_database.cpp",
        "src/sql_database_impl_null.cpp",
        "src/sql_database_impl_pq.cpp",
        "src/sql_database_impl_sqlite.cpp",
        "src/sql_query.cpp",
        "src/sql_query_impl_null.cpp",
        "src/sql_query_impl_pq.cpp",
        "src/sql_query_impl_sqlite.cpp",
        "src/sql_transaction.cpp",
        "src/sql_variant.cpp",
    ]
//cpp.staticLibraries: {
//        var libs = []
//        libs = ["pqxx", "pq"]
//        return libs
//    }


}
