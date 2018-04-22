@echo off
echo .
echo ====================================================
echo Samsung Android Firmware Preload IMGs Utils
echo Coded by BlackMesa
echo Credits to KinglyWayne and Daniel van Dorp
echo ====================================================
if exist hidden.img.ext4.lz4 (
:: hidden.img @qcom
	echo -hidden.img.ext4.lz4 found! Extracting...
	echo .
	bin\lz4.exe -d hidden.img.ext4.lz4
	del /f /q hidden.img.ext4.lz4
	echo -Now converting hidden.img.ext4 to ext4...
	echo .
	ren hidden.img.ext4 hidden.img
	bin\simg2img.exe hidden.img hidden.ext4.img
	del /f /q hidden.img
	echo .
	echo hidden.img.ext4.lz4 converted succesfully!
	echo ====================================================
	goto end
) else if exist hidden.img.ext4 (
	echo -hidden.img.ext4 found! Converting to ext4...
	echo .
	ren hidden.img.ext4 hidden.img
	bin\simg2img.exe hidden.img hidden.ext4.img
	del /f /q hidden.img
	echo .
	echo hidden.img.ext4 converted succesfully!
	echo ====================================================
	goto end
) else if exist hidden.img.lz4 (
:: hidden.img @exynos/other socs
	echo -hidden.img.lz4 found! Extracting...
	echo .
	bin\lz4.exe -d hidden.img.lz4
	del /f /q hidden.img.lz4
	echo .
	echo -Now converting hidden.img to ext4...
	bin\simg2img.exe hidden.img hidden.ext4.img
	del /f /q hidden.img
	echo .
	echo hidden.img.lz4 converted succesfully!
	echo ====================================================
	goto end
) else if exist hidden.img (
	echo -hidden.img found! Converting to ext4...
	echo .
	bin\simg2img.exe hidden.img hidden.ext4.img
	del /f /q hidden.img
	echo .
	echo hidden.img converted succesfully!
	echo ====================================================
	goto end
) else (
	echo No hidden.img/.ext4./.lz4 file found.
	echo ====================================================
	goto end
)

:end
echo Closing...
echo ====================================================
echo .
timeout /t 2 /nobreak > NUL
