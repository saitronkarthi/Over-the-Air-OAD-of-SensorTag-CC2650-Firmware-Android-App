package com.example.dell.sensphy;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.ArrayList;
import java.util.logging.Handler;
import java.util.UUID;

import android.animation.AnimatorSet;
import android.graphics.Color;
import android.view.MenuItem;
import android.view.WindowManager;
import android.widget.ArrayAdapter;
import android.app.AlertDialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCallback;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattDescriptor;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothProfile;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Environment;
import android.text.method.ScrollingMovementMethod;
import android.util.Log;
import android.content.BroadcastReceiver;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanFilter;
import android.bluetooth.le.ScanSettings;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.MotionEvent;
import android.view.View;
import android.view.Menu;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.content.IntentFilter;
import android.widget.Toast;
import android.widget.AdapterView.OnItemClickListener;


public class MainActivity extends AppCompatActivity {

    private boolean stScanning = false;
    public  static String  BleDevAddr,BleDisServices;
    private String BleDevName;
    private Handler mHandler;
    private ScanSettings settings;
    public static BluetoothGatt stBluetoothGatt = null;
    private BluetoothGattCallback callback1;
    private List<ScanFilter> scanfilter = new ArrayList<ScanFilter>();
    private ScanCallback callback;
    private static String TAG = "MainActivity";

    public final static String EXTRA_ADDRESS="EXTRA_ADDRESS";
    public final static String EXTRA_MESSAGE ="com.example.dell.sensphy.MESSAGE";
    public final static String EXTRA_STATUS="EXTRA_STATUS";
    public static final String EXTRA_UUID="EXTRA_UUID";
    public final static String EXTRA_DATA="EXTRA_DATA";
    public final static String ACTION_DATA_READ = "ACTION_DATA_READ";
    public final static String ACTION_DATA_WRITE = "ACTION_DATA_WRITE";
    private volatile boolean blocking = false;
    private final Lock lock = new ReentrantLock();
    private volatile bleRequest curBleRequest = null;

     public boolean stBluetoothConnStatus ;
    private static MainActivity stThis  = null;
    public static MainActivity getInstance() {
        return stThis ;
    }
    private String CurrBleFWVer;

    public final static String EXTRA_FW_REV_STRING = "EXTRA_FW_REV_STRING";
    private static final String dISFirmwareREV_UUID = "00002a26-0000-1000-8000-00805f9b34fb";
    public final static String ACTION_FW_REV_UPDATED = "ACTION_FW_REV_UPDATED";

    private boolean stIsReceiving = false;
    public static final String ACTION_PREPARE_FOR_OAD = "ACTION_PREPARE_FOR_OAD";
    public  static final String dISService_UUID = "0000180a-0000-1000-8000-00805f9b34fb";
       private String stDirectoryName ;
    private File stDir;
    private String address;

    // Programming parameters
    public final static String ACTION_GATT_CONNECTED = "ACTION_GATT_CONNECTED";
    public final static String ACTION_GATT_DISCONNECTED="ACTION_GATT_DISCONNECTED";
    public final static String ACTION_GATT_SERVICES_DISCOVERED = "ACTION_GATT_SERVICES_DISCOVERED";
    private static final short OAD_CONN_INTERVAL = 6; // 15 milliseconds
    private static final short OAD_SUPERVISION_TIMEOUT = 50; // 500 milliseconds
    private static final int GATT_WRITE_TIMEOUT = 300; // Milliseconds
    public  static final String oadService_UUID = "f000ffc0-0451-4000-b000-000000000000";
    private static final int FILE_BUFFER_SIZE = 0x40000;
    public static final String FW_CUSTOM_DIRECTORY = Environment.DIRECTORY_DOWNLOADS;
    private static final String FW_FILE_0_91 = "CC2650SensorTag_BLE_All_v0.91.bin";
    private static final String FW_FILE_1_01 = "CC2650SensorTag_BLE_All_v1.01.bin";
    public volatile int lastGattStatus = 0; //Success
    private BluetoothGatt stBtGatt  = null;

    private static final int OAD_BLOCK_SIZE = 16;
    private static final int HAL_FLASH_WORD_SIZE = 4;
    private static final int OAD_BUFFER_SIZE = 2 + OAD_BLOCK_SIZE;
    private static final int OAD_IMG_HDR_SIZE = 8;
    private static final long TIMER_INTERVAL = 1000;
    private static final int SEND_INTERVAL = 20; // Milliseconds
    private static final int BLOCKS_PER_CONNECTION = 20;
    public final static int GATT_TIMEOUT = 150;

    // GUI
    private TextView Services_Disc;

    private TextView stTargImage ;
    private TextView stFileImage ;
    private TextView stProgressInfo ;
    private TextView stLog ;
    private ProgressBar stProgressBar;
    private Button stBtnLoadA;
    private Button stBtnLoadB;
    private Button stBtnLoadC;
    private Button stBtnStart;
    private Button scanBtn;
    private ListView devListView;
    private ArrayAdapter<String> BTArrayAdapter;
    private LinkedList<String> addressesFound = new LinkedList<String>();

    //File Bluetooth download
    private TextView stTwDirName;
    private List<String> stFileList;
    String[] stDownloadFileList;

    // SensorTag BLE
    private BluetoothGattService stOadService;
    private BluetoothGattService stConnControlService;
    private List<BluetoothGattCharacteristic> stCharListOad;
    private List<BluetoothGattCharacteristic> stCharListCc;
    private List<BluetoothGattService> serviceList;
    private BluetoothGattCharacteristic stCharIdentify = null;
    private BluetoothGattCharacteristic stCharBlock = null;
    private BluetoothGattCharacteristic stCharConnReq = null;
    public BluetoothAdapter stBtAdapter = BluetoothAdapter.getDefaultAdapter();
        private BluetoothManager stBluetoothManager = null;
    public static final UUID CLIENT_CHARACTERISTIC_CONFIG = UUID.fromString("00002902-0000-1000-8000-00805f9b34fb");

    private BluetoothDevice stBluetoothDevice = null;
    private String stBluetoothDeviceAddress;

    // OAD Programming part
    private final byte[] stFileBuffer = new byte[FILE_BUFFER_SIZE];
    private final byte[] stOadBuffer = new byte[OAD_BUFFER_SIZE];
    private ImgHdr stFileImgHdr;
    private ImgHdr stTargImgHdr;
    private Timer stTimer = null;
    private ProgInfo stProgInfo = new ProgInfo();
    private TimerTask stTimerTask = null;
    private float firmwareRevision;
    private boolean slowAlgo = true;
    private int fastAlgoMaxPackets = BLOCKS_PER_CONNECTION;
    private String internalFWFilename;
    private int packetsSent = 0;

    private boolean stServiceOk = false;
    private boolean stProgramming = false;
    private IntentFilter stIntentFilter;

    public final static String ACTION_DATA_NOTIFY = "ACTION_DATA_NOTIFY";
    private ListView stLwFileList;
    private ScrollView stScrollView;
    public final static String EXTRA_FILENAME ="EXTRA_FILENAME";
    private volatile LinkedList<bleRequest> procQueue;
    private volatile LinkedList<bleRequest> nonBlockQueue;
    private class ProgInfo {
        int iBytes = 0; // Number of bytes programmed
        short iBlocks = 0; // Number of blocks programmed
        short nBlocks = 0; // Total number of blocks
        int iTimeElapsed = 0; // Time elapsed in milliseconds

        void reset() {
            iBytes = 0;
            iBlocks = 0;
            iTimeElapsed = 0;
            nBlocks = (short) (stFileImgHdr.len / (OAD_BLOCK_SIZE / HAL_FLASH_WORD_SIZE));
        }
    }

    private static IntentFilter makeGattUpdateIntentFilter() {
        final IntentFilter fi = new IntentFilter();
        fi.addAction(ACTION_GATT_SERVICES_DISCOVERED);
        fi.addAction(ACTION_DATA_NOTIFY);
        fi.addAction(ACTION_DATA_WRITE);
        fi.addAction(ACTION_DATA_READ);
        fi.addAction(ACTION_FW_REV_UPDATED);
        fi.addAction(ACTION_PREPARE_FOR_OAD);
        return fi;
    }

    public void onStart(View v) {
        if (stProgramming) {
            stopProgramming();
        } else {
            startProgramming();
        }
    }

    public void waitIdle(int timeout) {
        while (timeout-- > 0) {
            try {
                Thread.sleep(1);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

   // @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        this.initialize();
        return 1;
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (!stIsReceiving) {

            registerReceiver(mGattUpdateReceiver, makeGattUpdateIntentFilter());
            stIsReceiving = true;
        }

    }

    // Program block Queue.
    public enum bleRequestOperation {
        wrBlocking,
        wr,
        rdBlocking,
        rd,
        nsBlocking,
    }

    public enum bleRequestStatus {
        not_queued,
        queued,
        processing,
        timeout,
        done,
        no_such_request,
        failed,
    }

    public class bleRequest {
        public int id;
        public BluetoothGattCharacteristic characteristic;
        public bleRequestOperation operation;
        public volatile bleRequestStatus status;
        public int timeout;
        public int curTimeout;
        public boolean notifyenable;
    }

    private void unlockBlockingThread(int status) {
        this.lastGattStatus = status;
        this.blocking = false;
    }

    private class ImgHdr {
        short crc0;
        short crc1;
        short ver;
        int len;
        byte[] uid = new byte[4];
        short addr;
        byte imgType;

        ImgHdr(byte[] buf) {
            this.len = ((32 * 0x1000) / (16 / 4));
            this.ver = 0;
            this.uid[0] = this.uid[1] = this.uid[2] = this.uid[3] = 'E';
            this.addr = 0;
            this.imgType = 1; //EFL_OAD_IMG_TYPE_APP
            this.crc0 = calcImageCRC((int)0,buf);
            crc1 = (short)0xFFFF;
        }

        byte[] getRequest() {
            byte[] tmp = new byte[16];
            tmp[0] = loUint16((short) this.crc0);
            tmp[1] = hiUint16((short) this.crc0);
            tmp[2] = loUint16((short) this.crc1);
            tmp[3] = hiUint16((short) this.crc1);
            tmp[4] = loUint16(this.ver);
            tmp[5] = hiUint16(this.ver);
            tmp[6] = loUint16((short)this.len);
            tmp[7] = hiUint16((short)this.len);
            tmp[8] = tmp[9] = tmp[10] = tmp[11] = this.uid[0];
            tmp[12] =loUint16(this.addr);
            tmp[13] =hiUint16(this.addr);
            tmp[14] = imgType;
            tmp[15] = (byte)0xFF;
            return tmp;
        }

        short calcImageCRC(int page, byte[] buf) {
            short crc = 0;
            long addr = page * 0x1000;

            byte pageBeg = (byte)page;
            byte pageEnd = (byte)(this.len / (0x1000 / 4));
            int osetEnd = ((this.len - (pageEnd * (0x1000 / 4))) * 4);

            pageEnd += pageBeg;


            while (true) {
                int oset;

                for (oset = 0; oset < 0x1000; oset++) {
                    if ((page == pageBeg) && (oset == 0x00)) {
                        //Skip the CRC and shadow.
                        oset += 3;
                    }
                    else if ((page == pageEnd) && (oset == osetEnd)) {
                        crc = this.crc16(crc,(byte)0x00);
                        crc = this.crc16(crc,(byte)0x00);

                        return crc;
                    }
                    else {
                        crc = this.crc16(crc,buf[(int)(addr + oset)]);
                    }
                }
                page += 1;
                addr = page * 0x1000;
            }


        }

        short crc16(short crc, byte val) {
            final int poly = 0x1021;
            byte cnt;
            for (cnt = 0; cnt < 8; cnt++, val <<= 1) {
                byte msb;
                if ((crc & 0x8000) == 0x8000) {
                    msb = 1;
                }
                else msb = 0;

                crc <<= 1;
                if ((val & 0x80) == 0x80) {
                    crc |= 0x0001;
                }
                if (msb == 1) {
                    crc ^= poly;
                }
            }

            return crc;
        }

    }

    public static byte loUint16(short v) {
        return (byte) (v & 0xFF);
    }

    public static byte hiUint16(short v) {
        return (byte) (v >> 8);
    }

    public static short buildUint16(byte hi, byte lo) {
        return (short) ((hi << 8) + (lo & 0xff));
    }

   // 1.2 Scan for BLE Devices
    public void ScanBleDev(View view) {
       //clear the list
        BTArrayAdapter.clear();

        if(!stBtAdapter.isEnabled())
        {
            Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivity(enableBtIntent);
        }

        //start the scan process
        if (stBtAdapter != null) {
          stBtAdapter.startLeScan(mLeScanCallback);
        }
    }

    //1.3 Callback recd from BLE Device
    public BluetoothAdapter.LeScanCallback mLeScanCallback =
            new BluetoothAdapter.LeScanCallback() {
                @Override
                public void onLeScan(final BluetoothDevice device, final int rssi,
                                     byte[] scanRecord) {
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            if(!checkFoundList(device.getAddress())) {
                                //add the device to list
                                BTArrayAdapter.add(device.getName() + "\n" + device.getAddress());
                                BTArrayAdapter.notifyDataSetChanged();

                                //add the device to the array of addresses
                                addressesFound.add(device.getAddress());
                            }
                        }
                    });

                }
            };

    /*
    * This helper function will make sure that the
    * device that has already been discovered will
    * not get added again to the list of scan page
    * */
    private boolean checkFoundList(String address)
    {
        boolean res = false;

        if(addressesFound.contains(address))
        {
            res = true;
        }

        return res;
    }

    //2.0 Call connect fn & update GUI
    public void BleDevConnect(View view) {
        TextView tv2 = (TextView) findViewById(R.id.textView2);
        TextView tv3 = (TextView) findViewById(R.id.textView3);

        boolean BleDevConnectStatus= connect(BleDevAddr);

        if(BleDevConnectStatus==true)
        {
            tv2.setTextColor(Color.GREEN);
            tv2.setText("Connected");

        }
    }

    //2.1 Connect to the Device
    public boolean connect(final String address) {
        if (stBtAdapter == null || address == null) {
            return false;
        }
        final BluetoothDevice device = stBtAdapter.getRemoteDevice(address);
        stBluetoothManager=(BluetoothManager) getSystemService(Context.BLUETOOTH_SERVICE);
        int connectionState = stBluetoothManager.getConnectionState(device,
                BluetoothProfile.GATT);
        if (connectionState == BluetoothProfile.STATE_DISCONNECTED) {

            // Previously connected device. Try to reconnect.
            if (stBluetoothDeviceAddress != null
                    && address.equals(stBluetoothDeviceAddress) && stBluetoothGatt != null) {
                // Log.d(TAG, "Re-use GATT connection");
                if (stBluetoothGatt.connect()) {
                    stBluetoothConnStatus =true;
                    return true;
                } else {
                    // Log.w(TAG, "GATT re-connect failed.");
                    return false;
                }
            }

            if (device == null) {
                // Log.w(TAG, "Device not found.  Unable to connect.");
                return false;
            }
            // OnConnectionStateChanged Call back will be called
            stBluetoothGatt = device.connectGatt(this, false, mGattCallbacks);
            stBluetoothGatt.discoverServices();
            stBluetoothDeviceAddress = address;

        } else {
           return false;
        }
        return true;
    }

    //3.0 Display  service count -> deprecating discovered services from the UI.

    //4.0 Loading bin files in asset folder
    public void LoadFactoryImage(View v) {
        String fwString = CurrBleFWVer;
        Log.d(TAG, "File Version:" + fwString);
        String revNum = fwString.substring(0,fwString.indexOf(" ")); //"1.00";// by Karthi

        firmwareRevision = Float.parseFloat(revNum);
        if (firmwareRevision < 0.91) {
            internalFWFilename = FW_FILE_0_91;
            slowAlgo = true;
        }
        else if (firmwareRevision < 1.00) {
            internalFWFilename = FW_FILE_1_01;
            slowAlgo = true;
        }
        else {
            internalFWFilename = FW_FILE_1_01;
            slowAlgo = true;
        }
        setCharacteristicNotification(stCharBlock, true);
        if ( Build.VERSION.SDK_INT >= 21) Log.d("FWUpdateActivity_CC26xx", "Requested connection priority HIGH, result : " + stBluetoothGatt.requestConnectionPriority(BluetoothGatt.CONNECTION_PRIORITY_HIGH));
        setConnectionParameters();
        loadFile(internalFWFilename, true);//WIP
        updateGui();
    }

    //4.1 Write to GATT enabling to push notifications
    public int setCharacteristicNotification(
            BluetoothGattCharacteristic characteristic, boolean enable) {
        bleRequest req = new bleRequest();
        req.status = bleRequestStatus.not_queued;
        req.characteristic = characteristic;
        req.operation = bleRequestOperation.nsBlocking;
        req.notifyenable = enable;
        addRequestToQueue(req);
        boolean finished = false;
        while (!finished) {
            bleRequestStatus stat = pollForStatusofRequest(req);
            if (stat == bleRequestStatus.done) {
                finished = true;
                return 0;
            }
            else if (stat == bleRequestStatus.timeout) {
                finished = true;
                return -3;
            }
        }
        return -2;
    }

    //4.2 Adding requests to a Linked List as Queue
    public boolean addRequestToQueue(bleRequest req) {
        lock.lock();

        if (procQueue.peekLast() != null) {
            req.id = procQueue.peek().id++;
        }

        else {
            req.id = 0;
            procQueue.add(req);
        }
        lock.unlock();
        return true;
    }

    //4.3 Polling for requests from the thread
    public bleRequestStatus pollForStatusofRequest(bleRequest req) {
        lock.lock();
        if (req == curBleRequest) {
            bleRequestStatus stat = curBleRequest.status;
            if (stat == bleRequestStatus.done) {
                curBleRequest = null;
            }
            if (stat == bleRequestStatus.timeout) {
                curBleRequest = null;
            }
            lock.unlock();
            return stat;
        }
        else {
            lock.unlock();
            return bleRequestStatus.no_such_request;
        }
    }


    //4.4 Write OAD parameters to GATT Server
    private void setConnectionParameters() {
        // Connection interval is long enough for OAD (Android default- connection interval is 7.5 ms)
        byte[] value = {loUint16(OAD_CONN_INTERVAL), hiUint16(OAD_CONN_INTERVAL), loUint16(OAD_CONN_INTERVAL),
                hiUint16(OAD_CONN_INTERVAL), 0, 0, loUint16(OAD_SUPERVISION_TIMEOUT), hiUint16(OAD_SUPERVISION_TIMEOUT) };
        stCharConnReq.setValue(value);
        writeCharacteristic(stCharConnReq);
    }

    //4.5 Writing characteristics in a normal way (without queue)
    public int writeCharacteristic(BluetoothGattCharacteristic characteristic) {
        bleRequest req = new bleRequest();
        req.status = bleRequestStatus.not_queued;
        req.characteristic = characteristic;
        req.operation = bleRequestOperation.wrBlocking;
        addRequestToQueue(req);
        boolean finished = false;
        while (!finished) {
            bleRequestStatus stat = pollForStatusofRequest(req);
            if (stat == bleRequestStatus.done) {
                finished = true;
                return 0;
            }
            else if (stat == bleRequestStatus.timeout) {
                finished = true;
                return -3;
            }
        }
        return -2;
    }

    //4.6 Read the file into buffer
    private boolean loadFile(String filepath, boolean isAsset) {
        boolean fSuccess = false;

        // Load binary file
        try {
            // Read the file raw into a buffer
            InputStream stream;
            if (isAsset) {

                stream = getAssets().open(filepath);
            } else {

                File f = new File(filepath);
                stream = new FileInputStream(f);
            }
            stream.read(stFileBuffer, 0, stFileBuffer.length);
            stream.close();
        } catch (IOException e) {
            // Handle exceptions here
            stLog .setText("File open failed: " + filepath + "\n");
            return false;
        }

        if (!isAsset) {
            stFileImage .setText(filepath);
        }

        //Always enable button on CC26xx
        stBtnStart.setEnabled(true);
        stFileImgHdr = new ImgHdr(stFileBuffer);
        // Expected duration
        displayStats();
        // Log
        stLog .setText("Programming Image " + internalFWFilename + "\n");
        stLog .append("Ready to program device!\n");
        updateGui();

        return fSuccess;
    }

    //4.7 Updating GUI
    private void updateGui() {//WIP Karthi
        if (stProgramming) {
            stBtnStart.setText("Cancel");
            stBtnLoadA.setEnabled(false);
            stBtnLoadC.setEnabled(false);
        } else {

            stBtnStart.setText("Start Programming");
            stBtnLoadA.setEnabled(true);
            stBtnLoadC.setEnabled(true);
        }
    }

    //4.8 Time Calculation
    private void displayStats() {
        String txt;
        int byteRate;
        int sec = stProgInfo.iTimeElapsed / 1000;
        Log.d(TAG, "Seconds:" + Integer.toString((sec)));

        if (sec > 0) {
            byteRate = stProgInfo.iBytes / sec;
        } else {

            byteRate = 0;
            return;
        }
        float timeEstimate;

        timeEstimate = ((float)(stFileImgHdr.len *4) / (float)stProgInfo.iBytes) * sec;

        txt = String.format("Time: %d / %d sec", sec, (int) timeEstimate);
        txt += String.format("    Bytes: %d (%d/sec)", stProgInfo.iBytes, byteRate);
        stProgressInfo .setText(txt);

    }

    //5.0  Firmware Updation
    private void startProgramming() {
        stLog .append("Programming started\n");
        stProgramming = true;
        packetsSent = 0;
        updateGui();

        stCharIdentify.setValue(stFileImgHdr.getRequest());
        writeCharacteristic(stCharIdentify);

        // Initialize stats
        stProgInfo.reset();
        stTimer = new Timer();
        stTimerTask = new ProgTimerTask();
        stTimer.scheduleAtFixedRate(stTimerTask, 0, TIMER_INTERVAL);
    }

   //5.1 Timer Class for Thread
    private class ProgTimerTask extends TimerTask {
        @Override
        public void run() {
            stProgInfo.iTimeElapsed += TIMER_INTERVAL;
        }
    }


    private void stopDeviceActivity() {
        finishActivity(1);
    }

    private void broadcastUpdate(final String action, final String address,
                                 final int status) {
        final Intent intent = new Intent(action);
        intent.putExtra(EXTRA_ADDRESS, address);
       // test=address;
        intent.putExtra(EXTRA_STATUS, status);
        sendBroadcast(intent);//Commented fixed Karthik
    }

    private void broadcastUpdate(final String action,
                                 final BluetoothGattCharacteristic characteristic, final int status) {
        final Intent intent = new Intent(action);
        intent.putExtra(EXTRA_UUID, characteristic.getUuid().toString());
        intent.putExtra(EXTRA_DATA, characteristic.getValue());
        intent.putExtra(EXTRA_STATUS, status);
        sendBroadcast(intent);
    }
   // Callbacks from GATT
    // 2.2
    private BluetoothGattCallback mGattCallbacks = new BluetoothGattCallback() {
        // 2.3- Call back 2.1
        @Override
        public void onConnectionStateChange(BluetoothGatt gatt, int status,
                                            int newState) {
            if (stBluetoothGatt == null) {
                 //Log.e(TAG, "stBluetoothGatt nmblot created!");
                return;
            }
            BluetoothDevice device = gatt.getDevice();
            String address = device.getAddress();
            //2.4 Discover GATT Services
            gatt.discoverServices();
            // Log.d(TAG, "onConnectionStateChange (" + address + ") " + newState +
            // " status: " + status);
            try {
                switch (newState) {
                    case BluetoothProfile.STATE_CONNECTED:
                         broadcastUpdate(ACTION_GATT_CONNECTED, address, status);
                        //Toast.makeText(getApplicationContext(),"BluetoothProfile.STATE_CONNECTED", Toast.LENGTH_LONG).show();
                        break;
                    case BluetoothProfile.STATE_DISCONNECTED:
                        Log.d(TAG,"Disconnect Profile");
                        broadcastUpdate(ACTION_GATT_DISCONNECTED, address, status);
                        break;
                    default:
                        break;
                }
            } catch (NullPointerException e) {
                e.printStackTrace();
            }
        }

        //2.5 Callback for Services Discovered
        @Override
        public void onServicesDiscovered(BluetoothGatt gatt, int status) {

            BluetoothDevice device = gatt.getDevice();
            List<BluetoothGattService> services = gatt.getServices();
            serviceList=services;
            int NumServices=gatt.getServices().size();
            BleDisServices=Integer.toString(NumServices);
            Log.d(TAG, BleDisServices);

            broadcastUpdate(ACTION_GATT_SERVICES_DISCOVERED, device.getAddress(),
                    status);
        }

        //2.9 ReadCharacteristic callback
        @Override
        public void onCharacteristicRead(BluetoothGatt gatt,
                                         BluetoothGattCharacteristic characteristic, int status) {
                        broadcastUpdate(ACTION_DATA_READ, characteristic, status);
        }
        //5.4 WriteCharacteristic callback
        @Override
        public void onCharacteristicWrite(BluetoothGatt gatt,
                                          BluetoothGattCharacteristic characteristic, int status) {
            Log.d(TAG,"On char write");
            broadcastUpdate(ACTION_DATA_WRITE, characteristic, status);
        }

        //5.3 Characteristics changed Callback
        @Override
        public void onCharacteristicChanged(BluetoothGatt gatt,
                                            BluetoothGattCharacteristic characteristic) {
            Log.d(TAG,"onchar changed");
            broadcastUpdate(ACTION_DATA_NOTIFY, characteristic,
                    BluetoothGatt.GATT_SUCCESS);

        }

        //1.7 Reading the descritpor
        @Override
        public void onDescriptorRead(BluetoothGatt gatt,
                                     BluetoothGattDescriptor descriptor, int status) {
            Log.d(TAG, "Desc read");
            if (blocking)unlockBlockingThread(status);
            unlockBlockingThread(status);
        }

        //1.8 Writing GATT Config to the descriptor
        @Override
        public void onDescriptorWrite(BluetoothGatt gatt,
                                      BluetoothGattDescriptor descriptor, int status) {
            Log.d(TAG,"Desc write");
            if (blocking)unlockBlockingThread(status);
            // Log.i(TAG, "onDescriptorWrite: " + descriptor.getUuid().toString());
        }
    };

    //2.6 Broadcast receiver
    private final BroadcastReceiver mGattUpdateReceiver = new BroadcastReceiver() {
        //List <BluetoothGattService> serviceList;
        List <BluetoothGattCharacteristic> charList = new ArrayList<BluetoothGattCharacteristic>();

        @Override
        public void onReceive(final Context context, Intent intent) {
            final String action = intent.getAction();
            final int status = intent.getIntExtra(EXTRA_STATUS,BluetoothGatt.GATT_SUCCESS);
           //2.7 Extract Services and Characteristics
            if(ACTION_GATT_SERVICES_DISCOVERED.equals(action)) {
                Services_Disc=(TextView) findViewById(R.id.textView3);
                Services_Disc.setText(BleDisServices+ " services discovered.");
                if (serviceList.size() > 0) {
                    stOadService=serviceextract();
                    stCharListOad = stOadService.getCharacteristics();
                    stCharListCc = stConnControlService.getCharacteristics();

                    stServiceOk = stCharListOad.size() == 2 && stCharListCc.size() >= 3;
                    if (stServiceOk) {
                        stCharIdentify = stCharListOad.get(0);
                        stCharBlock = stCharListOad.get(1);
                        stCharBlock.setWriteType(BluetoothGattCharacteristic.WRITE_TYPE_DEFAULT);
                        stCharConnReq = stCharListCc.get(1);
                    }

                    for (int ii = 0; ii < serviceList.size(); ii++) {
                        BluetoothGattService s = serviceList.get(ii);
                        List<BluetoothGattCharacteristic> c = s.getCharacteristics();
                        if ((s.getUuid().toString().compareTo(dISService_UUID)) == 0) {
                            for (BluetoothGattCharacteristic cs : c)
                            {
                                if (cs.getUuid().toString().equals(dISFirmwareREV_UUID)) {
                                    BluetoothGattCharacteristic firmwareREVc = cs;
                                    //2.10 Oncharacteristic read callback firmWare version
                                    boolean bred=stBluetoothGatt.readCharacteristic(firmwareREVc);

                                }
                            }
                        }
                        if (c.size() > 0) {
                            for (int jj = 0; jj < c.size(); jj++) {
                                charList.add(c.get(jj));
                            }
                        }


                    }
//
                }

            }
            //2.11 For firmware version
            if(ACTION_DATA_READ.equals(action))
            {
                byte[] value = intent.getByteArrayExtra(EXTRA_DATA);
                String uuidStr = intent.getStringExtra(EXTRA_UUID);
                BluetoothGattCharacteristic systemIDc;
                    for (int ii = 0; ii < charList.size(); ii++) {
                    BluetoothGattCharacteristic BletempChar = charList.get(ii);
                    if ((BletempChar.getUuid().toString().equals(uuidStr))) {
                        systemIDc = BletempChar;
                        BluetoothGattCharacteristic firmwareREVc;
                        if (BletempChar.getUuid().toString().equals(dISFirmwareREV_UUID)) {
                            firmwareREVc = BletempChar;
                            if( firmwareREVc!=null){
                                String s = new String(firmwareREVc.getValue());
                                Log.d(TAG,"Read Action");
                                Log.d(TAG,s);
                                intent = new Intent(ACTION_FW_REV_UPDATED);
                                intent.putExtra(EXTRA_FW_REV_STRING, s);
                                context.sendBroadcast(intent);}
                        }
//
                        break;
                    }
                }
            }
            //2.12 Retrieve firmware version through onreceive again
            if (ACTION_FW_REV_UPDATED.equals(action)) {
                CurrBleFWVer= intent.getStringExtra(EXTRA_FW_REV_STRING);//karthik
                stTargImage .setText("Current Firmware Version : " + CurrBleFWVer);
                Log.d(TAG,"Upadted Action");

            }
            //5.2 Writing characteristics and Gatt will notify
            if (ACTION_DATA_WRITE.equals(action)) {
                int wrstatus = intent.getIntExtra(EXTRA_STATUS, BluetoothGatt.GATT_SUCCESS);

                //intent.putExtra(ACTION_DATA_NOTIFY, true);
                // CallNotify();
                if (wrstatus != BluetoothGatt.GATT_SUCCESS) {
                    Toast.makeText(context, "GATT error: status=" + wrstatus, Toast.LENGTH_SHORT).show();
                }
            }
            //5.5 Function call for programming
            if(ACTION_DATA_NOTIFY.equals(action))
            {
                Log.d(TAG,"Inside Notify");
                byte [] value = intent.getByteArrayExtra(EXTRA_DATA);
                String uuidStr = intent.getStringExtra(EXTRA_UUID);
                Log.d(TAG,uuidStr);
                Log.d(TAG, stCharBlock.getUuid().toString());

                if (uuidStr.equals(stCharIdentify.getUuid().toString())) {

                }
                if (uuidStr.equals(stCharBlock.getUuid().toString())) {

                    // Block check here :
                     String block = String.format("%02x%02x",value[1],value[0]);//karthi
                    Log.d(TAG,"Received block req:" + block);//karthi
                    Log.d(TAG, Boolean.toString(slowAlgo));
                    if (slowAlgo == true) {

                        programBlock();

                    }
                    else {

                        if (packetsSent != 0) packetsSent--;
                        if (packetsSent > 10) return;
                        while (packetsSent < fastAlgoMaxPackets) {
                            waitABit();
                            programBlock();
                        }
                    }
                }

            }

            if (ACTION_GATT_DISCONNECTED.equals(action)) {
                // GATT disconnect
                Log.d(TAG, "Disconnect inside action");
                stopDeviceActivity();
                if (status == BluetoothGatt.GATT_SUCCESS) {
                    //setBusy(false); commented for debugging next 3 lines
                    //mScanView.setStatus(stBluetoothDevice.getName() + " disconnected",
                    //      STATUS_DURATION);
                    Log.d(TAG,Integer.toString(status));
                }
            }





        }
    };


   //2.8 Retrieve OAD Service based on UUID
    public BluetoothGattService serviceextract(){
        if(serviceList.size()>0){

            for (int l = 0; l < serviceList.size(); l++) {
                BluetoothGattService s1 = serviceList.get(l);

                List<BluetoothGattCharacteristic> c1 = s1.getCharacteristics();
                if (c1.size() > 0) {
                    for (int jj = 0; jj < c1.size(); jj++) {
                        //charList.add(c1.get(jj));
                    }
                }
                if ((s1.getUuid().toString().compareTo("f000ccc0-0451-4000-b000-000000000000")) == 0) {
                    stConnControlService = s1;
                }
                if (isCorrectService(s1)) {
                    stOadService = s1;
                    //stConnControlService = s1;
                }


            }


        }
        return stOadService;
    };

    //2.9 Compare Discovered Service UUID
    public  boolean isCorrectService(BluetoothGattService service) {
        if ((service.getUuid().toString().compareTo(oadService_UUID)) == 0) {
            return true;
        }
        else return false;
    }

    //5.6 Writing each block of filedata in thread
    private void programBlock() {
        if (!stProgramming)
            return;

        if (stProgInfo.iBlocks < stProgInfo.nBlocks) {
            stProgramming = true;
            String msg = new String();

            // Prepare block
            stOadBuffer[0] = loUint16(stProgInfo.iBlocks);
            stOadBuffer[1] = hiUint16(stProgInfo.iBlocks);
            System.arraycopy(stFileBuffer, stProgInfo.iBytes, stOadBuffer, 2, OAD_BLOCK_SIZE);

            // Send block
            stCharBlock.setValue(stOadBuffer);
            boolean success = writeCharacteristicNonBlock(stCharBlock);
            Log.d("FwUpdateActivity_CC26xx","Sent block :" + stProgInfo.iBlocks);
            if (success) {
                // Update stats
                packetsSent++;
                stProgInfo.iBlocks++;
                stProgInfo.iBytes += OAD_BLOCK_SIZE;
                stProgressBar.setProgress((stProgInfo.iBlocks * 100) / stProgInfo.nBlocks);
                if (stProgInfo.iBlocks == stProgInfo.nBlocks) {
                    AlertDialog.Builder b = new AlertDialog.Builder(this);

                    b.setMessage("SensorTag will disconnect & reconnect, Scan & Cooect for new FW Version");
                    b.setTitle("Programming Completed");
                    b.setPositiveButton("OK",null);

                    AlertDialog d = b.create();
                    d.show();
                }
            } else {
                stProgramming = false;
                msg = "GATT writeCharacteristic failed\n";
            }
            if (!success) {
                stLog .append(msg);
            }
        } else {
            stProgramming = false;
        }
        if ((stProgInfo.iBlocks % 100) == 0) {
            // Display statistics each 100th block
            runOnUiThread(new Runnable() {
                public void run() {
                    displayStats();
                }
            });
        }

        if (!stProgramming) {
            runOnUiThread(new Runnable() {
                public void run() {
                    displayStats();
                    stopProgramming();
                }
            });
        }
    }

   //5.7 Writing characteristics to GATT by adding to Queue
    public boolean writeCharacteristicNonBlock(BluetoothGattCharacteristic characteristic) {
        bleRequest req = new bleRequest();
        req.status = bleRequestStatus.not_queued;
        req.characteristic = characteristic;
        req.operation = bleRequestOperation.wr;
        addRequestToQueue(req);
        return true;
    }

    //5.8 Adding time delay for Custom Images
    public void waitABit() {
        int waitTimeout = 20;
        while ((waitTimeout -= 10) > 0) {
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    //5.9 Reset Data and Update GUI after programming is completed
    private void stopProgramming() {
        stTimer.cancel();
        stTimer.purge();
        stTimerTask.cancel();
        stTimerTask = null;
        stProgramming = false;
        stProgressInfo .setText("");
        stProgressBar.setProgress(0);
        updateGui();

        setCharacteristicNotification(stCharBlock, false);
        if (stProgInfo.iBlocks == stProgInfo.nBlocks) {
            stLog .setText("Programming complete!\n");
        } else {
            stLog .append("Programming cancelled\n");
        }
        Log.d(TAG, "Gatt diconnect");
        stBluetoothGatt.disconnect();

    }

    public void goBack(View v)
    {
        //disconnect the device, if connected
        if(BleDisServices != null)
        {
            Log.d(TAG, "Go back close");
            stBluetoothGatt.disconnect();
            Intent intent = getIntent();
            finish();
            startActivity(intent);
        }

        //load the scan page
        setContentView(R.layout.scan_page);

        initScanPage();
    }

    /*
    * Function to initialize the scan page and its elements.
    * */
    private void initScanPage()
    {
       //define the scan button
        scanBtn = (Button) findViewById(R.id.search);

        //setting the on click event for scan button in scan_page
        scanBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ScanBleDev(v);
            }
        });

        devListView = (ListView) findViewById(R.id.deviceListView);

        // create the arrayAdapter that contains the BTDevices, and set it to the ListView
        BTArrayAdapter = new ArrayAdapter<String>(this,android.R.layout.simple_list_item_1);
        devListView.setAdapter(BTArrayAdapter);

        // Get list view
        ListView lv = (ListView)findViewById(R.id.deviceListView);

        // on selecting single device
        lv.setOnItemClickListener(new OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> parent, View view,
                                    int position, long id) {
                //Stop the bluetooth discovery
                stBtAdapter.stopLeScan(mLeScanCallback);

                //clear the addressesList
                addressesFound.clear();

                // get the item that has been clicked
                ListView list = (ListView) findViewById(R.id.deviceListView);
                String listItem = (String) list.getItemAtPosition(position);

                //calling the below function to show the next page with the selected item
                detailsPage(listItem);
            }
        });

        this.initialize();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent intent = getIntent();
        setContentView(R.layout.scan_page);
        if (!stBtAdapter.isEnabled()) {
            // Bluetooth is disabled, so ask the user to enable it
            Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivity(enableBtIntent);
        }

        //do the other initializations for the scan page
        initScanPage();
    }

    /*
    * Function to initialize the details page and its elements
    * */
    public void detailsPage(String target)
    {
        setContentView(R.layout.activity_main);

        stProgressBar = (ProgressBar) findViewById(R.id.pb_progress);
        stProgressInfo  = (TextView) findViewById(R.id.tw_info);
        stBtnStart = (Button) findViewById(R.id.btn_start);
        stBtnLoadA = (Button) findViewById(R.id.btn_load_a);
        stBtnLoadC = (Button) findViewById(R.id.btn_load_c);

        stLog  = (TextView) findViewById(R.id.tw_log);
        stLog .setMovementMethod(new ScrollingMovementMethod());
        stTargImage = (TextView) findViewById(R.id.tw_target);
        stFileImage  = (TextView) findViewById(R.id.tw_file);
        stLwFileList = (ListView) findViewById(R.id.lw_file);
        stScrollView=(ScrollView)findViewById(R.id.scrollView);
        stTwDirName = (TextView) findViewById(R.id.tw_directory);

        TextView tv = (TextView) findViewById(R.id.textView);
        TextView tv1=(TextView) findViewById(R.id.textView1);
        tv.setText("");

        // get the name and address of the device that was selected
        String lines[] = target.split("\\r?\\n");

        BleDevAddr = lines[1];
        BleDevName = lines[0];

        // set them for the details screen
        tv.setText(BleDevAddr);
        tv1.setText(BleDevName);

        this.initialize();
    }

    //1.0 Starts the Queue Process in a thread
    public boolean initialize() {
        stThis  = this;
        if (stBluetoothManager == null) {
            stBluetoothManager = (BluetoothManager) getSystemService(Context.BLUETOOTH_SERVICE);
            if (stBluetoothManager == null) {
                return false;
            }
        }

        stBtAdapter = stBluetoothManager.getAdapter();
        if (stBtAdapter == null) {
            return false;
        }

        procQueue = new LinkedList<bleRequest>();
        nonBlockQueue = new LinkedList<bleRequest>();


        Thread queueThread = new Thread() {
            @Override
            public void run() {
                while (true) {
                    executeQueue();
                    try {
                        Thread.sleep(0,100000);
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        };

        queueThread.start();
        return true;
    }

    //1.1 All requests are polled and added to the Queue
    private void executeQueue() {
        // Everything here is done on the queue
        lock.lock();

        if (curBleRequest != null) {
            Log.d(TAG, "executeQueue, curBleRequest running");
            try {
                curBleRequest.curTimeout++;
                if (curBleRequest.curTimeout > GATT_TIMEOUT) {
                    curBleRequest.status = bleRequestStatus.timeout;
                    curBleRequest = null;
                }
                Thread.sleep(10, 0);
            } catch (Exception e) {
                e.printStackTrace();
            }
            lock.unlock();
            return;
        }
        if (procQueue == null) {
            Log.d(TAG,"Null Proqueue");
            lock.unlock();
            return;
        }
        if (procQueue.size() == 0) {
            lock.unlock();
            return;
        }
        bleRequest procReq = procQueue.removeFirst();

        switch (procReq.operation) {
            case rd:
                //Read, do non blocking read
                Log.d(TAG,"Case 1");
                break;
            case rdBlocking:
                Log.d(TAG,"Case 2");
                //Normal (blocking) read
                if (procReq.timeout == 0) {
                    procReq.timeout = GATT_TIMEOUT;
                }
                procReq.curTimeout = 0;
                curBleRequest = procReq;
                int stat = sendBlockingReadRequest(procReq);
                if (stat == -2) {
                    Log.d(TAG,"executeQueue rdBlocking: error, BLE was busy or device disconnected");
                    lock.unlock();
                    return;
                }
                break;
            case wr:
                //Write, do non blocking write (Ex: OAD)
                Log.d(TAG,"Case 3");
                nonBlockQueue.add(procReq);
                sendNonBlockingWriteRequest(procReq);
                break;
            case wrBlocking:
                //Normal (blocking) write
                Log.d(TAG,"Case 4");
                if (procReq.timeout == 0) {
                    procReq.timeout = GATT_TIMEOUT;
                }
                curBleRequest = procReq;
                stat = sendBlockingWriteRequest(procReq);
                if (stat == -2) {
                    Log.d(TAG,"executeQueue wrBlocking: error, BLE was busy or device disconnected");
                    lock.unlock();
                    return;
                }
                break;
            case nsBlocking:
                Log.d(TAG,"Case 5");
                if (procReq.timeout == 0) {
                    procReq.timeout = GATT_TIMEOUT;
                }
                curBleRequest = procReq;
                stat = sendBlockingNotifySetting(procReq);
                if (stat == -2) {
                    Log.d(TAG,"executeQueue nsBlocking: error, BLE was busy or device disconnected");
                    lock.unlock();
                    return;
                }
                break;
            default:
                break;

        }
        lock.unlock();
    }

   //1.2 Read the Bluetooth characteristic
    public int sendBlockingReadRequest(bleRequest request) {
        request.status = bleRequestStatus.processing;
        int timeout = 0;
        if (!checkGatt()) {
            request.status = bleRequestStatus.failed;
            return -2;
        }
        stBluetoothGatt.readCharacteristic(request.characteristic);
        this.blocking = true; // Set read to be blocking
        while (this.blocking) {
            timeout ++;
            waitIdle(1);
            if (timeout > GATT_TIMEOUT) {this.blocking = false; request.status = bleRequestStatus.timeout; return -1;}  //Read failed TODO: Fix this to follow connection interval !
        }
        request.status = bleRequestStatus.done;
        return lastGattStatus;
    }

    //1.3 check if Gatt is initialised
    public boolean checkGatt() {
        if (stBtAdapter == null) {
            // Log.w(TAG, "BluetoothAdapter not initialized");
            return false;
        }
        if (stBluetoothGatt == null) {
            // Log.w(TAG, "BluetoothGatt not initialized");
            return false;
        }
        if (this.blocking) {
            Log.d(TAG,"Cannot start operation : Blocked");
            return false;
        }
        return true;

    }

    //1.4 Write Characteristic to Gatt (adding to Queue and writing)
    public int sendNonBlockingWriteRequest(bleRequest request) {
        request.status = bleRequestStatus.processing;
        if (!checkGatt()) {
            request.status = bleRequestStatus.failed;
            return -2;
        }
        stBluetoothGatt.writeCharacteristic(request.characteristic);
        return 0;
    }

    //1.5 Write characteristic to Gatt in normal way(without Queue)
    public int sendBlockingWriteRequest(bleRequest request) {
        request.status = bleRequestStatus.processing;
        int timeout = 0;
        if (!checkGatt()) {
            request.status = bleRequestStatus.failed;
            return -2;
        }
        stBluetoothGatt.writeCharacteristic(request.characteristic);
        this.blocking = true; // Set read to be blocking
        while (this.blocking) {
            timeout ++;
            waitIdle(1);
            if (timeout > GATT_TIMEOUT) {this.blocking = false; request.status = bleRequestStatus.timeout; return -1;}  //Read failed/
        }
        request.status = bleRequestStatus.done;
        return lastGattStatus;
    }


    //1.6 Setting GATT to notify by writing the descriptor
    public int sendBlockingNotifySetting(bleRequest request) {
        request.status = bleRequestStatus.processing;
        int timeout = 0;
        if (request.characteristic == null) {
            return -1;
        }
        if (!checkGatt())
            return -2;

        if (stBluetoothGatt.setCharacteristicNotification(request.characteristic, request.notifyenable)) {

            BluetoothGattDescriptor clientConfig = request.characteristic
                    .getDescriptor(CLIENT_CHARACTERISTIC_CONFIG);
            if (clientConfig != null) {

                if (request.notifyenable) {
                    clientConfig.setValue(BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE);
                } else {
                      clientConfig.setValue(BluetoothGattDescriptor.DISABLE_NOTIFICATION_VALUE);
                }
                stBluetoothGatt.writeDescriptor(clientConfig);
                this.blocking = true; // Set read to be blocking
                while (this.blocking) {
                    timeout ++;
                    waitIdle(1);
                    if (timeout > GATT_TIMEOUT) {this.blocking = false; request.status = bleRequestStatus.timeout; return -1;}  //Read failed TODO: Fix this to follow connection interval !
                }
                request.status = bleRequestStatus.done;
                return lastGattStatus;
            }
        }
        return -3;
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        if (id == R.id.action_about) {
            Builder alert = new AlertDialog.Builder(this);
            alert.setTitle("About");
            alert.setMessage("SensPhy"
                    + "\nVer. 17.1"
                    + "\n\nKartik"
                    + "\nSaroj"
                    + "\nSneha"
                    + "\nShwetabh");
            alert.setPositiveButton("OK", null);
            alert.show();
        }
        else if (id == R.id.action_exit) {
            Intent intent = new Intent(Intent.ACTION_MAIN);
            intent.addCategory(Intent.CATEGORY_HOME);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
        }

        return super.onOptionsItemSelected(item);
    }

    public void onLoadCustom(View v) {

        Intent i=new Intent(this,MainActivity.class);
        i.putExtra(EXTRA_MESSAGE,FW_CUSTOM_DIRECTORY);
        stDirectoryName  = i.getStringExtra(EXTRA_MESSAGE);
        stDir = Environment.getExternalStoragePublicDirectory(stDirectoryName );
        stFileList = new ArrayList<String>();

       if (stDir.exists()) {

           stTwDirName.setText(stDir.getAbsolutePath());
             String parentDirectory = stDir.getAbsolutePath();
            File dirFileObj = new File(parentDirectory);
           File[] files = dirFileObj.listFiles();
               for (File file : files) {
                if (!file.isDirectory()) {
                    if(file.getName().toLowerCase().endsWith((".bin")))
                    {
                    stFileList.add(file.getName());}
                }

            }
           if (stFileList.size() == 0)
           Toast.makeText(this, "No OAD images available", Toast.LENGTH_LONG).show();
           else
           {
               stDownloadFileList = new String[stFileList.size()]; // to get same size array
                stFileList.toArray(stDownloadFileList);
                ArrayAdapter<String> myAdapter=new
                        ArrayAdapter<String>(
                        this,
                        android.R.layout.simple_list_item_1,
                        stDownloadFileList);
                        stLwFileList.setAdapter(myAdapter);

               stLwFileList.setOnTouchListener(new View.OnTouchListener() {
                   @Override
                   public boolean onTouch(View v, MotionEvent event) {
                       stScrollView.requestDisallowInterceptTouchEvent(true);
                       int action = event.getActionMasked();
                       switch (action) {
                           case MotionEvent.ACTION_UP:
                               stScrollView.requestDisallowInterceptTouchEvent(false);
                               break;
                       }
                       return false;
                   }
               });
               stLwFileList.setOnItemClickListener(mFileClickListener);
           }

       }
       else {
        Toast.makeText(this, stDirectoryName  + " does not exist", Toast.LENGTH_LONG).show();
     }
    }

    private OnItemClickListener mFileClickListener = new OnItemClickListener() {
        public void onItemClick(AdapterView<?> myAdapter, View myView, int myItemInt, long mylng) {


            // A characteristic item has been selected
           String filename = (String) (stLwFileList.getItemAtPosition(myItemInt));
            setCharacteristicNotification(stCharBlock, true);
            if ( Build.VERSION.SDK_INT >= 21) Log.d("FWUpdateActivity_CC26xx", "Requested connection priority HIGH, result : " + stBluetoothGatt.requestConnectionPriority(BluetoothGatt.CONNECTION_PRIORITY_HIGH));
            setConnectionParameters();
            String filenamepath=stDir.getAbsolutePath()+"/"+filename;
            internalFWFilename=filenamepath;
            loadFile(stDir.getAbsolutePath()+"/"+filename, false);

        }
    };


    @Override
    public void onDestroy() {
        Log.d(TAG, "onDestroy");
        super.onDestroy();
        if (stTimerTask != null)
            stTimerTask.cancel();
        stTimer = null;
        getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
    }


}
