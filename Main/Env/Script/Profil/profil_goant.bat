REM 2161111:PHP profil_goant V01
REM @echo off
REM pause

if "%JAVA_HOME%" == "" goto error
REM 2161111:PHP custo
if "%ANT_HOME%" == "" goto error

REM 2161111:PHP confirm under local 
if not "%LIB_HOME%" == "" goto skip

set LIB_HOME=.\lib

:skip

echo.
echo Profil boot starts
echo -------------------

REM 2161111:PHP custo
:: set ANT_HOME=.\lib
set _JAVACMD=%_JAVA_HOME%\bin\java.exe
set ANT_ARGS=
set ANT_OPTS=
set ANT_CMD_LINE_ARGS=%1 %2 %3 %4 %5

set LOCALCLASSPATH=%JAVA_HOME%\lib\tools.jar
for %%i in (%LIB_HOME%\*.jar) do call lcpant.bat %%i

echo.
echo Building with classpath %LOCALCLASSPATH%

echo.
echo Starting Ant...

:runAntWithClasspath
:: "%_JAVACMD%" %ANT_OPTS% -classpath "%ANT_HOME%\lib\ant-launcher.jar" "-Dant.home=%ANT_HOME%" org.apache.tools.ant.launch.Launcher %ANT_ARGS% -cp "%CLASSPATH%" %ANT_CMD_LINE_ARGS%
:: "%_JAVACMD%" %ANT_OPTS% -classpath "%ANT_HOME%\lib\ant-launcher.jar" "-Dant.home=%ANT_HOME%" org.apache.tools.ant.launch.Launcher %ANT_ARGS% -cp "%LOCALCLASSPATH%" %ANT_CMD_LINE_ARGS%
REM 2161111:PHP standard under V01
REM %JAVA_HOME%\bin\java.exe %ANT_OPTS% -Dant.home="%ANT_HOME%" -classpath "%LOCALCLASSPATH%" org.apache.tools.ant.Main %1 %2 %3 %4 %5
%ANT_HOME%\bin\ant  %ANT_CMD_LINE_ARGS%

goto end

:error

echo "ERROR: Profil_goant: ANT_HOME and JAVA_HOME must be set 
echo.
echo "ERROR:============ Profil_goant  is not set ========================="

:end

set LOCALCLASSPATH=
set LIB_HOME=
