@ECHO OFF
SETLOCAL EnableDelayedExpansion
SET me=%~n0
SET parent=%~dp0
set R_Script="C:\Program Files\R\R-3.4.2\bin\RScript.exe"
cd src

git pull

::re-render Driver.Rmd into index.html
cd src
%R_Script% -e "rmarkdown::render('Driver.Rmd',output_file='C:/Users/Work/Desktop/Github/Senior-Project/index.html')"

cd %parent%
git add *
git commit -m "Automated push."
git push

echo Finished Successfully.
pause