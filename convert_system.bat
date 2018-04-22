@echo off
echo .
echo ====================================================
echo Samsung Android Firmware System IMGs Utils
echo Coded by BlackMesa
echo Credits to KinglyWayne and Daniel van Dorp
echo ====================================================
if exist system.img.ext4.lz4 (
:: system.img @qcom
	echo -system.img.ext4.lz4 found! Extracting...
	echo .
	bin\lz4.exe -d system.img.ext4.lz4
	del /f /q system.img.ext4.lz4
	echo .
	echo -Converting system.img.ext4 to ext4...
	ren system.img.ext4 system.img
	echo .
	bin\simg2img.exe system.img system.ext4.img
	del /f /q system.img
	echo .
	echo system.img.ex4.lz4 converted succesfully!
	echo ====================================================
	goto apuserdata
) else if exist system.img.ext4 (
	echo -system.img.ext4 found! Converting to ext4...
	echo .
	ren system.img.ext4 system.img
	bin\simg2img.exe system.img system.ext4.img
	echo .
	del /f /q system.img
	echo system.img.ext4 converted succesfully!
	echo ====================================================
	goto apuserdata
) else if exist system.img.lz4 (
:: system.img @exynos/other socs
	echo -system.img.lz4 found! Extracting...
	echo .
	bin\lz4.exe -d system.img.lz4
	del /f /q system.img.lz4
	echo .
	echo -Now converting system.img to ext4...
	echo .
	bin\simg2img.exe system.img system.ext4.img
	del /f /q system.img
	echo .
	echo system.img.lz4 converted succesfully!
	echo ====================================================
	goto apuserdata
) else if exist system.img (
	echo -system.img found! Converting to ext4...
	echo .
	bin\simg2img.exe system.img system.ext4.img
	del /f /q system.img
	echo .
	echo system.img converted succesfully!
	echo ====================================================
	goto apuserdata
) else (
	echo No system.img/.ext4./.lz4 file found.
	echo ====================================================
	goto apuserdata
)
:apuserdata
if exist userdata.img.ext4.lz4 (
:: userdata.img @qcom
	echo -userdata.img.ext4.lz4 found! Extracting...
	echo .
	bin\lz4.exe -d userdata.img.ext4.lz4
	del /f /q userdata.img.ext4.lz4
	echo -Now converting userdata.img.ext4 to ext4...
	echo .
	ren userdata.img.ext4 userdata.img
	bin\simg2img.exe userdata.img userdata.ext4.img
	del /f /q userdata.img
	echo .
	echo userdata.img.ext4.lz4 converted succesfully!
	echo ====================================================
	goto aptreble
) else if exist userdata.img.ext4 (
	echo -userdata.img.ext4 found! Converting to ext4...
	echo .
	ren userdata.img.ext4 userdata.img
	bin\simg2img.exe userdata.img userdata.ext4.img
	del /f /q userdata.img
	echo .
	echo userdata.img.ext4 converted succesfully!
	echo ====================================================
	goto aptreble
) else if exist userdata.img.lz4 (
:: userdata.img @exynos/other socs
	echo -userdata.img.lz4 found! Extracting...
	echo .
	bin\lz4.exe -d userdata.img.lz4
	del /f /q userdata.img.lz4
	echo .
	echo -Now converting userdata.img to ext4...
	bin\simg2img.exe userdata.img userdata.ext4.img
	del /f /q userdata.img
	echo .
	echo userdata.img.lz4 converted succesfully!
	echo ====================================================
	goto aptreble
) else if exist userdata.img (
	echo -userdata.img found! Converting to ext4...
	echo .
	bin\simg2img.exe userdata.img userdata.ext4.img
	del /f /q userdata.img
	echo .
	echo userdata.img converted succesfully!
	echo ====================================================
	goto aptreble
) else (
	echo No userdata.img/.ext4./.lz4 file found.
	echo ====================================================
	goto aptreble
)

:aptreble
if exist vendor.img.ext4.lz4 (
:: vendor.img @qcom
	echo -vendor.img.ext4.lz4 found! Extracting...
	echo .
	bin\lz4.exe -d vendor.img.ext4.lz4
	del /f /q vendor.img.ext4.lz4
	echo -Now converting vendor.img.ext4 to ext4...
	echo .
	ren vendor.img.ext4 vendor.img
	bin\simg2img.exe vendor.img vendor.ext4.img
	del /f /q vendor.img
	echo .
	echo vendor.img.ext4.lz4 converted succesfully!
	echo ====================================================
	goto end
) else if exist vendor.img.ext4 (
	echo -vendor.img.ext4 found! Converting to ext4...
	echo .
	ren vendor.img.ext4 vendor.img
	bin\simg2img.exe vendor.img vendor.ext4.img
	del /f /q vendor.img
	echo .
	echo vendor.img.ext4 converted succesfully!
	echo ====================================================
	goto end
) else if exist vendor.img.lz4 (
:: vendor.img @exynos/other socs
	echo -vendor.img.lz4 found! Extracting...
	echo .
	bin\lz4.exe -d vendor.img.lz4
	del /f /q vendor.img.lz4
	echo .
	echo -Now converting vendor.img to ext4...
	bin\simg2img.exe vendor.img vendor.ext4.img
	del /f /q vendor.img
	echo .
	echo vendor.img.lz4 converted succesfully!
	echo ====================================================
	goto end
) else if exist vendor.img (
	echo -vendor.img found! Converting to ext4...
	echo .
	bin\simg2img.exe vendor.img vendor.ext4.img
	del /f /q vendor.img
	echo .
	echo vendor.img converted succesfully!
	echo ====================================================
	goto end
) else (
	echo No vendor.img/.ext4./.lz4 file found.
	echo ====================================================
	goto end
)

:end
echo Closing...
echo ====================================================
echo .
timeout /t 2 /nobreak > NUL
