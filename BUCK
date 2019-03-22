load('//:subdir_glob.bzl', 'subdir_glob')
load('//:buckaroo_macros.bzl', 'buckaroo_deps')

prebuilt_cxx_library(
  name = 'pthread',
  header_only = True,
  exported_post_linker_flags = [
    '-lpthread',
  ],
)

unix_srcs = glob([
  'src/unix/*.c',
])

windows_srcs = [
  'src/hash/hash_win32.c',
  'src/transports/winhttp.c',
]

linux_headers = {
  'git2/sys/features.h': 'features.linux-x86_64.h',
}

macos_headers = {
  'git2/sys/features.h': 'features.macosx-x86_64.h',
}

windows_headers = {
  'git2/sys/features.h': 'features.windows-x86_64.h',
}

platform_srcs = unix_srcs + windows_srcs

cxx_library(
  name = 'git2',
  header_namespace = '',
  exported_headers = subdir_glob([
    ('include', '**/*.h'),
  ]),
  exported_platform_headers = [
    ('linux.*', linux_headers),
    ('macos.*', macos_headers),
    ('windows.*', windows_headers),
  ],
  headers = subdir_glob([
    ('src', '**/*.h'),
  ]),
  srcs = glob([
    'src/*.c',
    'src/allocators/*.c',
    'src/hash/*.c',
    'src/hash/sha1dc/*.c',
    'src/streams/*.c',
    'src/transports/*.c',
    'src/xdiff/*.c',
  ], exclude = platform_srcs + glob([
    'src/**/*hash_generic.c',
    'src/hash/**/*mbedtls.c',
  ])),
  platform_srcs = [
    ('linux.*', unix_srcs),
    ('macos.*', unix_srcs),
    ('windows.*', windows_srcs),
  ],
  deps = buckaroo_deps(),
  platform_deps = [
    ('linux.*', [ ':pthread' ]),
  ],
  visibility = [
    'PUBLIC',
  ],
)
