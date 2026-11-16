@echo off
chcp 65001 >nul
setlocal
echo Введите SSH-ссылку на НОВЫЙ пустой публичный репозиторий GitHub:
set /p TARGET_URL=
if "%TARGET_URL%"=="" goto empty
git remote add target "%TARGET_URL%"
if errorlevel 1 goto fail
git push -u target main
if errorlevel 1 goto fail
echo Готово: ветка main опубликована.
pause
exit /b 0
:empty
echo Ссылка не указана.
pause
exit /b 1
:fail
echo Не удалось опубликовать репозиторий. Проверьте SSH-ссылку и доступ.
pause
exit /b 1
