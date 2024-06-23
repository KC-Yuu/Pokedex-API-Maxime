@echo off
REM Set permissions (Windows doesn't have chmod, so this step is skipped)

REM Clean cache
rmdir /s /q tmp\cache

REM Install dependencies
call bundle install

echo Setup complete. You can now start the server with 'rails server'.
pause