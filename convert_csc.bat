@echo off
echo .
echo ====================================================
echo Samsung Android Firmware CSC IMGs Utils
echo Coded by BlackMesa
echo Credits to KinglyWayne and Daniel van Dorp
echo ====================================================
if exist cache.img.ext4.lz4 (
:: cache.img @qcom
	echo -cache.img.ext4.lz4 found! Extracting...
	echo .
	bin\lz4.exe -d cache.img.ext4.lz4
	del /f /q cache.img.ext4.lz4
	echo .
	echo -Converting cache.img.ext4 to ext4...
	ren cache.img.ext4 cache.img
	echo .
	bin\simg2img.exe cache.img cache.ext4.img
	del /f /q cache.img
	echo .
	echo cache.img.ex4.lz4 converted succesfully!
	echo ====================================================
	goto treblecsc
) else if exist cache.img.ext4 (
	echo -cache.img.ext4 found! Converting to ext4...
	echo .
	ren cache.img.ext4 cache.img
	bin\simg2img.exe cache.img cache.ext4.img
	echo .
	del /f /q cache.img
	echo cache.img.ext4 converted succesfully!
	echo ====================================================
	goto treblecsc
) else if exist cache.img.lz4 (
:: cache.img @exynos/other socs
	echo -cache.img.lz4 found! Extracting...
	echo .
	bin\lz4.exe -d cache.img.lz4
	del /f /q cache.img.lz4
	echo .
	echo -Now converting cache.img to ext4...
	echo .
	bin\simg2img.exe cache.img cache.ext4.img
	del /f /q cache.img
	echo .
	echo cache.img.lz4 converted succesfully!
	echo ====================================================
	goto treblecsc
) else if exist cache.img (
	echo -cache.img found! Converting to ext4...
	echo .
	bin\simg2img.exe cache.img cache.ext4.img
	del /f /q cache.img
	echo .
	echo cache.img converted succesfully!
	echo ====================================================
	goto treblecsc
) else (
	echo No cache.img/.ext4./.lz4 file found.
	echo ====================================================
	goto treblecsc
)
:treblecsc
if exist odm.img.ext4.lz4 (
:: odm.img @qcom
	echo -odm.img.ext4.lz4 found! Extracting...
	echo .
	bin\lz4.exe -d odm.img.ext4.lz4
	del /f /q odm.img.ext4.lz4
	echo -Now converting odm.img.ext4 to ext4...
	echo .
	ren odm.img.ext4 odm.img
	bin\simg2img.exe odm.img odm.ext4.img
	del /f /q odm.img
	echo .
	echo odm.img.ext4.lz4 converted succesfully!
	echo ====================================================
	goto end
) else if exist odm.img.ext4 (
	echo -odm.img.ext4 found! Converting to ext4...
	echo .
	ren odm.img.ext4 odm.img
	bin\simg2img.exe odm.img odm.ext4.img
	del /f /q odm.img
	echo .
	echo odm.img.ext4 converted succesfully!
	echo ====================================================
	goto end
) else if exist odm.img.lz4 (
:: odm.img @exynos/other socs
	echo -odm.img.lz4 found! Extracting...
	echo .
	bin\lz4.exe -d odm.img.lz4
	del /f /q odm.img.lz4
	echo .
	echo -Now converting odm.img to ext4...
	bin\simg2img.exe odm.img odm.ext4.img
	del /f /q odm.img
	echo .
	echo odm.img.lz4 converted succesfully!
	echo ====================================================
	goto end
) else if exist odm.img (
	echo -odm.img found! Converting to ext4...
	echo .
	bin\simg2img.exe odm.img odm.ext4.img
	del /f /q odm.img
	echo .
	echo odm.img converted succesfully!
	echo ====================================================
	goto end
) else (
	echo No odm.img/.ext4./.lz4 file found.
	echo ====================================================
	goto end
)

:end
echo Closing...
echo ====================================================
echo .
timeout /t 2 /nobreak > NUL
