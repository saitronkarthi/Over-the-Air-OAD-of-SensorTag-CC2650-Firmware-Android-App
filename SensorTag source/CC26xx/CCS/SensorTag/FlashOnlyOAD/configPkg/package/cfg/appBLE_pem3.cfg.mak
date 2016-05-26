# invoke SourceDir generated makefile for appBLE.pem3
appBLE.pem3: .libraries,appBLE.pem3
.libraries,appBLE.pem3: package/cfg/appBLE_pem3.xdl
	$(MAKE) -f D:\SensorTag_Source_2\simplelink\ble_cc26xx_2_01_00_44423\Projects\ble\SensorTag\CC26xx\CCS\Config/src/makefile.libs

clean::
	$(MAKE) -f D:\SensorTag_Source_2\simplelink\ble_cc26xx_2_01_00_44423\Projects\ble\SensorTag\CC26xx\CCS\Config/src/makefile.libs clean

