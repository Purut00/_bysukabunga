@echo off
set "PATH=%PATH%;C:\Program Files\nodejs"
call npm install
call npm install -D tailwindcss postcss autoprefixer
