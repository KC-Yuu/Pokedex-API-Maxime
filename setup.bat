@echo off
REM Set permissions (Windows doesn't have chmod, so this step is skipped)

REM Clean cache
rmdir /s /q tmp\cache

REM Install dependencies
call bundle install

REM Compile CSS with Tailwind
call rails tailwindcss:build

echo Setup terminé. Vous pouvez maintenant démarrer le serveur avec 'rails server'.
pause