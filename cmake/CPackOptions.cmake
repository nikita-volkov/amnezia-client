set(CPACK_COMPONENTS_ALL AmneziaVPN)

if (CPACK_GENERATOR STREQUAL productbuild)
    list(APPEND CPACK_COMPONENTS_ALL Uninstall)
endif()

if(NOT CODESIGN_INSTALLER_SIGNATURE)
    set(CODESIGN_INSTALLER_SIGNATURE    "$ENV{CODESIGN_INSTALLER_SIGNATURE}")
endif()
# Only define the identity variables when a signature is actually configured:
# pkgbuild/productbuild fail on an empty `--sign ""` (CMake >= 4 forwards
# defined-but-empty options), while leaving the variables undefined makes
# CPack produce unsigned packages.
if(CODESIGN_INSTALLER_SIGNATURE)
    set(CPACK_PRODUCTBUILD_IDENTITY_NAME    "${CODESIGN_INSTALLER_SIGNATURE}")
    set(CPACK_PKGBUILD_IDENTITY_NAME        "${CODESIGN_INSTALLER_SIGNATURE}")
endif()

if(NOT CODESIGN_INSTALLER_KEYCHAIN)
    set(CODESIGN_INSTALLER_KEYCHAIN     "$ENV{CODESIGN_INSTALLER_KEYCHAIN}")
endif()
if(CODESIGN_INSTALLER_KEYCHAIN)
    set(CPACK_PRODUCTBUILD_KEYCHAIN_PATH    "${CODESIGN_INSTALLER_KEYCHAIN}")
    set(CPACK_PKGBUILD_KEYCHAIN_PATH        "${CODESIGN_INSTALLER_KEYCHAIN}")
endif()
