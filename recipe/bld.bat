REM Avoid the the message printed to stderr about what problems are found
REM which confuses py6s

REM remove chocolatey gfortran
if "%CI%" == "azure" (
  rm "C:\ProgramData\Chocolatey\bin\gfortran.exe"
)

set FFLAGS="-ffpe-summary=none"

set PATH=%PATH:C:\Program Files\Git\usr\bin;=%

:: Configure.
cmake -G "MSYS Makefiles" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
make
if errorlevel 1 exit 1

:: Install.
make install
if errorlevel 1 exit 1
