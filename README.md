# Over-the-Air-OAD-of-SensorTag-CC2650-Firmware-Android-App
IDE & Devices needed
SensorTag –CC2650STK from Texas Instruments
XDS110 USB debugger
Samsung Galaxy S4(API-19) or higher which supports Bluetooth Low energy)
Android Studio -1.4.1
Code Composer Studio- Version: 6.1.1.00022
1.Create the .bin file
In CCS open SensorTag project & replace the files in firmware modifications.zip
Create the hex files for application, stack following the 'Software developers guide.pdf'
Follow 'hex to bin final.txt' to produce the .bin file. It should be exactly 128kb
Or use the sample .bin files provided.
2. Android App
In a BLE supported phone with API19 or higher install sensphy
Transfer the .bin file to the Android phone
3. SensoTag
Have the TI SensorTag CC2650SDk with its default Sensortag project loaded & battery powered
4. OAD
Scan for the BLE devices
Connect to the SensorTag to be programmed
Select the .bin file to do the OAD
The programming will start & the progress will be indicated by the progressbar
The programming will be completed in 4 min Approx
The SensorTag will restart with the new firmware programmed over the air
