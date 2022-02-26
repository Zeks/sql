cmake_minimum_required(VERSION 3.22.2)
project(Sql)

find_package(Qt5 REQUIRED COMPONENTS Core Sql Concurrent)

add_library(Sql STATIC
    "include/sql_abstractions/shared_trick.h"
    "include/sql_abstractions/sql_connection_token.h"
    "include/sql_abstractions/sql_context.h"
    "include/sql_abstractions/sql_database.h"
    "include/sql_abstractions/sql_database_impl_base.h"
    "include/sql_abstractions/sql_database_impl_null.h"
    "include/sql_abstractions/sql_database_impl_pq.h"
    "include/sql_abstractions/sql_database_impl_sqlite.h"
    "include/sql_abstractions/sql_error.h"
    "include/sql_abstractions/sql_query.h"
    "include/sql_abstractions/sql_query_impl_base.h"
    "include/sql_abstractions/sql_query_impl_null.h"
    "include/sql_abstractions/sql_query_impl_pq.h"
    "include/sql_abstractions/sql_query_impl_sqlite.h"
    "include/sql_abstractions/sql_transaction.h"
    "include/sql_abstractions/sql_variant.h"
    "include/sql_abstractions/string_hasher.h"
    "include/sql_abstractions/string_streamer.h"
    "include/sql_abstractions/string_trimmer.h"
    "src/sql_context.cpp"
    "src/sql_database.cpp"
    "src/sql_database_impl_null.cpp"
    "src/sql_database_impl_pq.cpp"
    "src/sql_database_impl_sqlite.cpp"
    "src/sql_query.cpp"
    "src/sql_query_impl_null.cpp"
    "src/sql_query_impl_pq.cpp"
    "src/sql_query_impl_sqlite.cpp"
    "src/sql_transaction.cpp"
    "src/sql_variant.cpp"
    )

target_link_libraries(Sql PUBLIC  Qt5::Core Qt5::Sql Qt5::Concurrent)
target_link_libraries(Sql PUBLIC  Logger)
target_link_libraries(Sql PRIVATE $<$<CXX_COMPILER_ID:GNU>:pqxx pq>)
target_compile_definitions(Sql PRIVATE "FMT_HEADER_ONLY"  $<IF:$<BOOL:${USE_POSTGRES}>,USE_POSTGRES,NO_POSTGRES>)
set_target_properties(Sql PROPERTIES OUTPUT_NAME "sql_abstractions")


target_include_directories(Sql PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/../
    ${CMAKE_CURRENT_LIST_DIR}/../../
    ${CMAKE_CURRENT_LIST_DIR}/
    ${CMAKE_CURRENT_LIST_DIR}/../../third_party/fmt/include
)
target_include_directories(Sql PUBLIC ${CMAKE_CURRENT_LIST_DIR}/include)


install(TARGETS Sql DESTINATION ${CMAKE_CURRENT_LIST_DIR}/../../debug)
