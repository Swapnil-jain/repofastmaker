git clone https://github.com/kiam001/android_device_motorola_cedric -b crdroid device/motorola/cedric
git clone https://github.com/kiam001/android_vendor_motorola_cedric vendor/motorola/cedric
git https://github.com/mvaisakh/eva_kernel/ -b eva-rel/eas+/3.18 kernel/motorola/msm8937
git clone https://github.com/LineageOS/android_packages_resources_devicesettings packages/resources/devicesettings
git clone https://github.com/kiam001/android_system_qcom system/qcom
repo init -u git://github.com/crdroidandroid/android.git -b 9.0
repo sync
. build/envsetup.sh
brunch cedric
echo done
