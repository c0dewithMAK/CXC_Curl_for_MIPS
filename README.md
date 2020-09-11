# CXC_Curl_for_MIPS
This repo talks about how one can cross compile curl executable for the Linux MIPS32 Architecture

Note: You need to have OpenSSL pre-installed and you should know the directory path where openssl.conf file is present. This path is to be used in 'curl_installation_for_linux_mips.sh' script.

Steps :
- First, get the curl open-source code from github -> 'git clone https://github.com/curl/curl.git'
- Second, copy and paste the script 'curl_installation_for_linux_mips.sh' into the cloned 'curl' directory.
- Third, you need to modify the script according to your cross-compiler and necessary library paths and also the installation directory paths.
- Fourth, give this script necessary execute permissions
- Fifth, execute it and let it install (Voila!)
