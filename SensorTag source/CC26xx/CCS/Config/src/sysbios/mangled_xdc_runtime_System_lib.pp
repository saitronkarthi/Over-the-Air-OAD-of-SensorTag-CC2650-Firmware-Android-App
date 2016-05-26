# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.c"











 


 

# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Startup.h"





 















 




 




















 

# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/std.h"











 




# 1 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdarg.h"
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 




#pragma diag_push
#pragma CHECK_MISRA("-20.2")  
#pragma CHECK_MISRA("-19.10")  

# 51 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdarg.h"


typedef struct __va_list {
    void * __ap;
} va_list;












# 80 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdarg.h"

# 109 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdarg.h"



#pragma diag_pop



#pragma diag_push


 
 
#pragma CHECK_MISRA("-19.15")





#pragma diag_pop
# 18 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/std.h"
# 1 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stddef.h"
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 




#pragma diag_push
#pragma CHECK_MISRA("-19.7")  
#pragma CHECK_MISRA("-20.1")  
#pragma CHECK_MISRA("-20.2")  









typedef int ptrdiff_t;



typedef unsigned size_t;






typedef unsigned short wchar_t;




#pragma diag_push
#pragma CHECK_MISRA("-19.10")  

# 84 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stddef.h"





#pragma diag_pop









#pragma diag_push
#pragma CHECK_MISRA("-19.15")  

 
 
 
 
 
 
 
# 130 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stddef.h"

#pragma diag_pop
# 19 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/std.h"

 




 



typedef char            xdc_Char;
typedef unsigned char   xdc_UChar;
typedef short           xdc_Short;
typedef unsigned short  xdc_UShort;
typedef int             xdc_Int;
typedef unsigned int    xdc_UInt;
typedef long            xdc_Long;
typedef unsigned long   xdc_ULong;
typedef float           xdc_Float;
typedef double          xdc_Double;
typedef long double     xdc_LDouble;
typedef size_t          xdc_SizeT;
typedef va_list         xdc_VaList;

 

typedef unsigned short  xdc_Bool;        
typedef void            *xdc_Ptr;        
typedef const void      *xdc_CPtr;       
typedef char            *xdc_String;     
typedef const char      *xdc_CString;    









 
# 70 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/std.h"
  typedef int             (*xdc_Fxn)();    




 
# 1 "C:/ti/tirtos_simplelink_2_13_00_06/products/bios_6_42_00_08/packages/ti/targets/arm/elf/std.h"










 



 










 
# 1 "C:\\ti\\tirtos_simplelink_2_13_00_06\\products\\bios_6_42_00_08\\packages\\ti\\targets\\arm\\elf\\M3.h"







 







 








 






 






 






 






 






 








 
# 86 "C:\\ti\\tirtos_simplelink_2_13_00_06\\products\\bios_6_42_00_08\\packages\\ti\\targets\\arm\\elf\\M3.h"






 
# 109 "C:\\ti\\tirtos_simplelink_2_13_00_06\\products\\bios_6_42_00_08\\packages\\ti\\targets\\arm\\elf\\M3.h"






 


# 29 "C:/ti/tirtos_simplelink_2_13_00_06/products/bios_6_42_00_08/packages/ti/targets/arm/elf/std.h"


 
# 1 "C:/ti/tirtos_simplelink_2_13_00_06/products/bios_6_42_00_08/packages/ti/targets/std.h"










 




 




 




 




# 1 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdint.h"
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



 

    typedef   signed char   int8_t;
    typedef unsigned char  uint8_t;
    typedef          short  int16_t;
    typedef unsigned short uint16_t;
    typedef          int    int32_t;
    typedef unsigned int   uint32_t;


    typedef          long long  int64_t;
    typedef unsigned long long uint64_t;

 

    typedef  int8_t   int_least8_t;
    typedef uint8_t  uint_least8_t;

    typedef  int16_t  int_least16_t;
    typedef uint16_t uint_least16_t;
    typedef  int32_t  int_least32_t;
    typedef uint32_t uint_least32_t;


    typedef  int64_t  int_least64_t;
    typedef uint64_t uint_least64_t;

 

    typedef  int32_t  int_fast8_t;
    typedef uint32_t uint_fast8_t;
    typedef  int32_t  int_fast16_t;
    typedef uint32_t uint_fast16_t;

    typedef  int32_t  int_fast32_t;
    typedef uint32_t uint_fast32_t;


    typedef  int64_t  int_fast64_t;
    typedef uint64_t uint_fast64_t;

 
    typedef          int intptr_t;
    typedef unsigned int uintptr_t;

 
    typedef          long long intmax_t;
    typedef unsigned long long uintmax_t;





 


 






















# 125 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdint.h"






# 137 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdint.h"


















 









# 172 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdint.h"








 







 

# 196 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdint.h"





 






# 32 "C:/ti/tirtos_simplelink_2_13_00_06/products/bios_6_42_00_08/packages/ti/targets/std.h"

# 42 "C:/ti/tirtos_simplelink_2_13_00_06/products/bios_6_42_00_08/packages/ti/targets/std.h"




 
# 73 "C:/ti/tirtos_simplelink_2_13_00_06/products/bios_6_42_00_08/packages/ti/targets/std.h"

# 92 "C:/ti/tirtos_simplelink_2_13_00_06/products/bios_6_42_00_08/packages/ti/targets/std.h"



 
typedef int_least8_t    xdc_Int8;
typedef uint_least8_t   xdc_UInt8;
typedef int_least16_t   xdc_Int16;
typedef uint_least16_t  xdc_UInt16;
typedef int_least32_t   xdc_Int32;
typedef uint_least32_t  xdc_UInt32;


    typedef int_least64_t   xdc_Int64;
    typedef uint_least64_t   xdc_UInt64;


# 120 "C:/ti/tirtos_simplelink_2_13_00_06/products/bios_6_42_00_08/packages/ti/targets/std.h"



 

    typedef uint8_t     xdc_Bits8;


    typedef uint16_t    xdc_Bits16;


    typedef uint32_t    xdc_Bits32;


    typedef uint64_t    xdc_Bits64;




 
typedef intptr_t        xdc_IArg;
typedef uintptr_t       xdc_UArg;



 





 




 








 




# 181 "C:/ti/tirtos_simplelink_2_13_00_06/products/bios_6_42_00_08/packages/ti/targets/std.h"





 

# 33 "C:/ti/tirtos_simplelink_2_13_00_06/products/bios_6_42_00_08/packages/ti/targets/arm/elf/std.h"





 

# 81 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/std.h"
# 113 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/std.h"










 




 


typedef long long               xdc_LLong;
typedef unsigned long long      xdc_ULLong;

# 147 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/std.h"






 

static inline xdc_Ptr xdc_iargToPtr(xdc_IArg a) { return ((xdc_Ptr)a); }
static inline xdc_Ptr xdc_uargToPtr(xdc_UArg a) { return ((xdc_Ptr)a); }



static inline xdc_Fxn xdc_iargToFxn(xdc_IArg a) { return ((xdc_Fxn)a); }
static inline xdc_Fxn xdc_uargToFxn(xdc_UArg a) { return ((xdc_Fxn)a); }








 
typedef union {
    xdc_Float f;
    xdc_IArg  a;
} xdc_FloatData;

static inline xdc_IArg xdc_floatToArg(xdc_Float f)
{
     xdc_FloatData u;
     u.f = f;

     return (u.a);
}

static inline xdc_Float xdc_argToFloat(xdc_IArg a)
{
     xdc_FloatData u;
     u.a = a;

     return (u.f);
}


 




 



# 208 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/std.h"



typedef xdc_Char        Char;
typedef xdc_UChar       UChar;
typedef xdc_Short       Short;
typedef xdc_UShort      UShort;
typedef xdc_Int         Int;
typedef xdc_UInt        UInt;
typedef xdc_Long        Long;
typedef xdc_ULong       ULong;
typedef xdc_LLong       LLong;
typedef xdc_ULLong      ULLong;
typedef xdc_Float       Float;
typedef xdc_Double      Double;
typedef xdc_LDouble     LDouble;
typedef xdc_SizeT       SizeT;
typedef xdc_VaList      VaList;

typedef xdc_IArg        IArg;
typedef xdc_UArg        UArg;
typedef xdc_Bool        Bool;
typedef xdc_Int8        Int8;
typedef xdc_Int16       Int16;
typedef xdc_Int32       Int32;
typedef xdc_Fxn         Fxn;
typedef xdc_Ptr         Ptr;

typedef xdc_String      String;

typedef xdc_CString     CString;

typedef xdc_UInt8       UInt8;
typedef xdc_UInt16      UInt16;
typedef xdc_UInt32      UInt32;

 



 




typedef xdc_UInt8       Uint8;
typedef xdc_UInt16      Uint16;
typedef xdc_UInt32      Uint32;
typedef xdc_UInt        Uns;





 

typedef xdc_Int64       Int64;
typedef xdc_UInt64      UInt64;





 

typedef xdc_Bits8       Bits8;



typedef xdc_Bits16      Bits16;



typedef xdc_Bits32      Bits32;



typedef xdc_Bits64      Bits64;




 






 
# 304 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/std.h"







 

















  

















 







 

# 51 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Startup.h"

# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/xdc.h"











 



 







 






 





























 
# 69 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/xdc.h"




 















 

# 53 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Startup.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types__prologue.h"











 



 


 

# 54 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/package.defs.h"





 







 

typedef struct xdc_runtime_IModule_Fxns__ xdc_runtime_IModule_Fxns__;
typedef const xdc_runtime_IModule_Fxns__* xdc_runtime_IModule_Module;



 




 

typedef struct xdc_runtime_Core_ObjDesc xdc_runtime_Core_ObjDesc;



 




 

typedef struct xdc_runtime_Diags_DictElem xdc_runtime_Diags_DictElem;



 

typedef struct xdc_runtime_Error_Data xdc_runtime_Error_Data;
typedef struct xdc_runtime_Error_Block xdc_runtime_Error_Block;
typedef struct xdc_runtime_Error_Module_State xdc_runtime_Error_Module_State;



 




 

typedef struct xdc_runtime_IGateProvider_Fxns__ xdc_runtime_IGateProvider_Fxns__;
typedef const xdc_runtime_IGateProvider_Fxns__* xdc_runtime_IGateProvider_Module;
typedef struct xdc_runtime_IGateProvider_Params xdc_runtime_IGateProvider_Params;
typedef struct xdc_runtime_IGateProvider___Object { xdc_runtime_IGateProvider_Fxns__* __fxns; xdc_Bits32 __label; } *xdc_runtime_IGateProvider_Handle;



 

typedef struct xdc_runtime_GateNull_Fxns__ xdc_runtime_GateNull_Fxns__;
typedef const xdc_runtime_GateNull_Fxns__* xdc_runtime_GateNull_Module;
typedef struct xdc_runtime_GateNull_Params xdc_runtime_GateNull_Params;
typedef struct xdc_runtime_GateNull_Object xdc_runtime_GateNull_Object;
typedef struct xdc_runtime_GateNull_Struct xdc_runtime_GateNull_Struct;
typedef xdc_runtime_GateNull_Object* xdc_runtime_GateNull_Handle;
typedef struct xdc_runtime_GateNull_Object__ xdc_runtime_GateNull_Instance_State;
typedef xdc_runtime_GateNull_Object* xdc_runtime_GateNull_Instance;



 

typedef struct xdc_runtime_Log_EventRec xdc_runtime_Log_EventRec;



 

typedef struct xdc_runtime_ILogger_Fxns__ xdc_runtime_ILogger_Fxns__;
typedef const xdc_runtime_ILogger_Fxns__* xdc_runtime_ILogger_Module;
typedef struct xdc_runtime_ILogger_Params xdc_runtime_ILogger_Params;
typedef struct xdc_runtime_ILogger___Object { xdc_runtime_ILogger_Fxns__* __fxns; xdc_Bits32 __label; } *xdc_runtime_ILogger_Handle;



 

typedef struct xdc_runtime_IFilterLogger_Fxns__ xdc_runtime_IFilterLogger_Fxns__;
typedef const xdc_runtime_IFilterLogger_Fxns__* xdc_runtime_IFilterLogger_Module;
typedef struct xdc_runtime_IFilterLogger_Params xdc_runtime_IFilterLogger_Params;
typedef struct xdc_runtime_IFilterLogger___Object { xdc_runtime_IFilterLogger_Fxns__* __fxns; xdc_Bits32 __label; } *xdc_runtime_IFilterLogger_Handle;



 

typedef struct xdc_runtime_LoggerBuf_Entry xdc_runtime_LoggerBuf_Entry;
typedef struct xdc_runtime_LoggerBuf_Module_State xdc_runtime_LoggerBuf_Module_State;
typedef struct xdc_runtime_LoggerBuf_Fxns__ xdc_runtime_LoggerBuf_Fxns__;
typedef const xdc_runtime_LoggerBuf_Fxns__* xdc_runtime_LoggerBuf_Module;
typedef struct xdc_runtime_LoggerBuf_Params xdc_runtime_LoggerBuf_Params;
typedef struct xdc_runtime_LoggerBuf_Object xdc_runtime_LoggerBuf_Object;
typedef struct xdc_runtime_LoggerBuf_Struct xdc_runtime_LoggerBuf_Struct;
typedef xdc_runtime_LoggerBuf_Object* xdc_runtime_LoggerBuf_Handle;
typedef struct xdc_runtime_LoggerBuf_Object__ xdc_runtime_LoggerBuf_Instance_State;
typedef xdc_runtime_LoggerBuf_Object* xdc_runtime_LoggerBuf_Instance;



 

typedef struct xdc_runtime_LoggerCallback_Fxns__ xdc_runtime_LoggerCallback_Fxns__;
typedef const xdc_runtime_LoggerCallback_Fxns__* xdc_runtime_LoggerCallback_Module;
typedef struct xdc_runtime_LoggerCallback_Params xdc_runtime_LoggerCallback_Params;
typedef struct xdc_runtime_LoggerCallback_Object xdc_runtime_LoggerCallback_Object;
typedef struct xdc_runtime_LoggerCallback_Struct xdc_runtime_LoggerCallback_Struct;
typedef xdc_runtime_LoggerCallback_Object* xdc_runtime_LoggerCallback_Handle;
typedef struct xdc_runtime_LoggerCallback_Object__ xdc_runtime_LoggerCallback_Instance_State;
typedef xdc_runtime_LoggerCallback_Object* xdc_runtime_LoggerCallback_Instance;



 

typedef struct xdc_runtime_LoggerSys_Fxns__ xdc_runtime_LoggerSys_Fxns__;
typedef const xdc_runtime_LoggerSys_Fxns__* xdc_runtime_LoggerSys_Module;
typedef struct xdc_runtime_LoggerSys_Params xdc_runtime_LoggerSys_Params;
typedef struct xdc_runtime_LoggerSys_Object xdc_runtime_LoggerSys_Object;
typedef struct xdc_runtime_LoggerSys_Struct xdc_runtime_LoggerSys_Struct;
typedef xdc_runtime_LoggerSys_Object* xdc_runtime_LoggerSys_Handle;
typedef struct xdc_runtime_LoggerSys_Object__ xdc_runtime_LoggerSys_Instance_State;
typedef xdc_runtime_LoggerSys_Object* xdc_runtime_LoggerSys_Instance;



 




 

typedef struct xdc_runtime_Memory_Stats xdc_runtime_Memory_Stats;
typedef struct xdc_runtime_Memory_Module_State xdc_runtime_Memory_Module_State;



 

typedef struct xdc_runtime_IHeap_Fxns__ xdc_runtime_IHeap_Fxns__;
typedef const xdc_runtime_IHeap_Fxns__* xdc_runtime_IHeap_Module;
typedef struct xdc_runtime_IHeap_Params xdc_runtime_IHeap_Params;
typedef struct xdc_runtime_IHeap___Object { xdc_runtime_IHeap_Fxns__* __fxns; xdc_Bits32 __label; } *xdc_runtime_IHeap_Handle;



 

typedef struct xdc_runtime_HeapMin_Fxns__ xdc_runtime_HeapMin_Fxns__;
typedef const xdc_runtime_HeapMin_Fxns__* xdc_runtime_HeapMin_Module;
typedef struct xdc_runtime_HeapMin_Params xdc_runtime_HeapMin_Params;
typedef struct xdc_runtime_HeapMin_Object xdc_runtime_HeapMin_Object;
typedef struct xdc_runtime_HeapMin_Struct xdc_runtime_HeapMin_Struct;
typedef xdc_runtime_HeapMin_Object* xdc_runtime_HeapMin_Handle;
typedef struct xdc_runtime_HeapMin_Object__ xdc_runtime_HeapMin_Instance_State;
typedef xdc_runtime_HeapMin_Object* xdc_runtime_HeapMin_Instance;



 

typedef struct xdc_runtime_HeapStd_Module_State xdc_runtime_HeapStd_Module_State;
typedef struct xdc_runtime_HeapStd_Fxns__ xdc_runtime_HeapStd_Fxns__;
typedef const xdc_runtime_HeapStd_Fxns__* xdc_runtime_HeapStd_Module;
typedef struct xdc_runtime_HeapStd_Params xdc_runtime_HeapStd_Params;
typedef struct xdc_runtime_HeapStd_Object xdc_runtime_HeapStd_Object;
typedef struct xdc_runtime_HeapStd_Struct xdc_runtime_HeapStd_Struct;
typedef xdc_runtime_HeapStd_Object* xdc_runtime_HeapStd_Handle;
typedef struct xdc_runtime_HeapStd_Object__ xdc_runtime_HeapStd_Instance_State;
typedef xdc_runtime_HeapStd_Object* xdc_runtime_HeapStd_Instance;



 

typedef struct xdc_runtime_Registry_Module_State xdc_runtime_Registry_Module_State;



 

typedef struct xdc_runtime_Rta_CommandPacket xdc_runtime_Rta_CommandPacket;
typedef struct xdc_runtime_Rta_ResponsePacket xdc_runtime_Rta_ResponsePacket;



 

typedef struct xdc_runtime_Startup_IdMap xdc_runtime_Startup_IdMap;
typedef struct xdc_runtime_Startup_Module_State xdc_runtime_Startup_Module_State;



 

typedef struct xdc_runtime_System_ParseData xdc_runtime_System_ParseData;
typedef struct xdc_runtime_System_Module_State xdc_runtime_System_Module_State;



 

typedef struct xdc_runtime_ISystemSupport_Fxns__ xdc_runtime_ISystemSupport_Fxns__;
typedef const xdc_runtime_ISystemSupport_Fxns__* xdc_runtime_ISystemSupport_Module;



 

typedef struct xdc_runtime_SysCallback_Fxns__ xdc_runtime_SysCallback_Fxns__;
typedef const xdc_runtime_SysCallback_Fxns__* xdc_runtime_SysCallback_Module;



 

typedef struct xdc_runtime_SysMin_Module_State xdc_runtime_SysMin_Module_State;
typedef struct xdc_runtime_SysMin_Fxns__ xdc_runtime_SysMin_Fxns__;
typedef const xdc_runtime_SysMin_Fxns__* xdc_runtime_SysMin_Module;



 

typedef struct xdc_runtime_SysStd_Fxns__ xdc_runtime_SysStd_Fxns__;
typedef const xdc_runtime_SysStd_Fxns__* xdc_runtime_SysStd_Module;



 

typedef struct xdc_runtime_Text_Node xdc_runtime_Text_Node;
typedef struct xdc_runtime_Text_MatchVisState xdc_runtime_Text_MatchVisState;
typedef struct xdc_runtime_Text_PrintVisState xdc_runtime_Text_PrintVisState;
typedef struct xdc_runtime_Text_Module_State xdc_runtime_Text_Module_State;



 

typedef struct xdc_runtime_ITimestampClient_Fxns__ xdc_runtime_ITimestampClient_Fxns__;
typedef const xdc_runtime_ITimestampClient_Fxns__* xdc_runtime_ITimestampClient_Module;



 

typedef struct xdc_runtime_Timestamp_Fxns__ xdc_runtime_Timestamp_Fxns__;
typedef const xdc_runtime_Timestamp_Fxns__* xdc_runtime_Timestamp_Module;



 

typedef struct xdc_runtime_ITimestampProvider_Fxns__ xdc_runtime_ITimestampProvider_Fxns__;
typedef const xdc_runtime_ITimestampProvider_Fxns__* xdc_runtime_ITimestampProvider_Module;



 

typedef struct xdc_runtime_TimestampNull_Fxns__ xdc_runtime_TimestampNull_Fxns__;
typedef const xdc_runtime_TimestampNull_Fxns__* xdc_runtime_TimestampNull_Module;



 

typedef struct xdc_runtime_TimestampStd_Fxns__ xdc_runtime_TimestampStd_Fxns__;
typedef const xdc_runtime_TimestampStd_Fxns__* xdc_runtime_TimestampStd_Module;



 

typedef struct xdc_runtime_Types_CordAddr__ xdc_runtime_Types_CordAddr__;
typedef struct xdc_runtime_Types_GateRef__ xdc_runtime_Types_GateRef__;
typedef struct xdc_runtime_Types_Label xdc_runtime_Types_Label;
typedef struct xdc_runtime_Types_Site xdc_runtime_Types_Site;
typedef struct xdc_runtime_Types_Timestamp64 xdc_runtime_Types_Timestamp64;
typedef struct xdc_runtime_Types_FreqHz xdc_runtime_Types_FreqHz;
typedef struct xdc_runtime_Types_RegDesc xdc_runtime_Types_RegDesc;
typedef struct xdc_runtime_Types_Vec xdc_runtime_Types_Vec;
typedef struct xdc_runtime_Types_Link xdc_runtime_Types_Link;
typedef struct xdc_runtime_Types_InstHdr xdc_runtime_Types_InstHdr;
typedef struct xdc_runtime_Types_PrmsHdr xdc_runtime_Types_PrmsHdr;
typedef struct xdc_runtime_Types_Base xdc_runtime_Types_Base;
typedef struct xdc_runtime_Types_SysFxns xdc_runtime_Types_SysFxns;
typedef struct xdc_runtime_Types_SysFxns2 xdc_runtime_Types_SysFxns2;



 

typedef struct xdc_runtime_IInstance_Fxns__ xdc_runtime_IInstance_Fxns__;
typedef const xdc_runtime_IInstance_Fxns__* xdc_runtime_IInstance_Module;
typedef struct xdc_runtime_IInstance_Params xdc_runtime_IInstance_Params;
typedef struct xdc_runtime_IInstance___Object { xdc_runtime_IInstance_Fxns__* __fxns; xdc_Bits32 __label; } *xdc_runtime_IInstance_Handle;



 

typedef struct xdc_runtime_LoggerBuf_TimestampProxy_Fxns__ xdc_runtime_LoggerBuf_TimestampProxy_Fxns__;
typedef const xdc_runtime_LoggerBuf_TimestampProxy_Fxns__* xdc_runtime_LoggerBuf_TimestampProxy_Module;



 

typedef struct xdc_runtime_LoggerBuf_Module_GateProxy_Fxns__ xdc_runtime_LoggerBuf_Module_GateProxy_Fxns__;
typedef const xdc_runtime_LoggerBuf_Module_GateProxy_Fxns__* xdc_runtime_LoggerBuf_Module_GateProxy_Module;
typedef struct xdc_runtime_LoggerBuf_Module_GateProxy_Params xdc_runtime_LoggerBuf_Module_GateProxy_Params;
typedef struct xdc_runtime_IGateProvider___Object *xdc_runtime_LoggerBuf_Module_GateProxy_Handle;



 

typedef struct xdc_runtime_LoggerSys_TimestampProxy_Fxns__ xdc_runtime_LoggerSys_TimestampProxy_Fxns__;
typedef const xdc_runtime_LoggerSys_TimestampProxy_Fxns__* xdc_runtime_LoggerSys_TimestampProxy_Module;



 

typedef struct xdc_runtime_Main_Module_GateProxy_Fxns__ xdc_runtime_Main_Module_GateProxy_Fxns__;
typedef const xdc_runtime_Main_Module_GateProxy_Fxns__* xdc_runtime_Main_Module_GateProxy_Module;
typedef struct xdc_runtime_Main_Module_GateProxy_Params xdc_runtime_Main_Module_GateProxy_Params;
typedef struct xdc_runtime_IGateProvider___Object *xdc_runtime_Main_Module_GateProxy_Handle;



 

typedef struct xdc_runtime_Memory_HeapProxy_Fxns__ xdc_runtime_Memory_HeapProxy_Fxns__;
typedef const xdc_runtime_Memory_HeapProxy_Fxns__* xdc_runtime_Memory_HeapProxy_Module;
typedef struct xdc_runtime_Memory_HeapProxy_Params xdc_runtime_Memory_HeapProxy_Params;
typedef struct xdc_runtime_IHeap___Object *xdc_runtime_Memory_HeapProxy_Handle;



 

typedef struct xdc_runtime_System_SupportProxy_Fxns__ xdc_runtime_System_SupportProxy_Fxns__;
typedef const xdc_runtime_System_SupportProxy_Fxns__* xdc_runtime_System_SupportProxy_Module;



 

typedef struct xdc_runtime_System_Module_GateProxy_Fxns__ xdc_runtime_System_Module_GateProxy_Fxns__;
typedef const xdc_runtime_System_Module_GateProxy_Fxns__* xdc_runtime_System_Module_GateProxy_Module;
typedef struct xdc_runtime_System_Module_GateProxy_Params xdc_runtime_System_Module_GateProxy_Params;
typedef struct xdc_runtime_IGateProvider___Object *xdc_runtime_System_Module_GateProxy_Handle;



 

typedef struct xdc_runtime_Timestamp_SupportProxy_Fxns__ xdc_runtime_Timestamp_SupportProxy_Fxns__;
typedef const xdc_runtime_Timestamp_SupportProxy_Fxns__* xdc_runtime_Timestamp_SupportProxy_Module;


# 55 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

 
typedef xdc_Bits16 xdc_runtime_Types_ModuleId;

 
typedef xdc_Bits16 xdc_runtime_Types_DiagsMask;

 
typedef xdc_Bits32 xdc_runtime_Types_Event;

 
typedef xdc_runtime_Types_Event xdc_runtime_Types_EventId;

 
struct xdc_runtime_Types_CordAddr__;

 
typedef xdc_runtime_Types_CordAddr__ *xdc_runtime_Types_CordAddr;

 
struct xdc_runtime_Types_GateRef__;

 
typedef xdc_runtime_Types_GateRef__ *xdc_runtime_Types_GateRef;

 
typedef xdc_Bits16 xdc_runtime_Types_RopeId;

 
enum xdc_runtime_Types_CreatePolicy {
    xdc_runtime_Types_STATIC_POLICY,
    xdc_runtime_Types_CREATE_POLICY,
    xdc_runtime_Types_DELETE_POLICY
};
typedef enum xdc_runtime_Types_CreatePolicy xdc_runtime_Types_CreatePolicy;

 
enum xdc_runtime_Types_OutputPolicy {
    xdc_runtime_Types_COMMON_FILE,
    xdc_runtime_Types_SEPARATE_FILE,
    xdc_runtime_Types_NO_FILE
};
typedef enum xdc_runtime_Types_OutputPolicy xdc_runtime_Types_OutputPolicy;

 
struct xdc_runtime_Types_Label {
    xdc_Ptr handle;
    xdc_runtime_Types_ModuleId modId;
    xdc_String iname;
    xdc_Bool named;
};

 
struct xdc_runtime_Types_Site {
    xdc_runtime_Types_ModuleId mod;
    xdc_CString file;
    xdc_Int line;
};

 
struct xdc_runtime_Types_Timestamp64 {
    xdc_Bits32 hi;
    xdc_Bits32 lo;
};

 
struct xdc_runtime_Types_FreqHz {
    xdc_Bits32 hi;
    xdc_Bits32 lo;
};

 
struct xdc_runtime_Types_RegDesc {
    xdc_runtime_Types_RegDesc *next;
    xdc_CString modName;
    xdc_runtime_Types_ModuleId id;
    xdc_runtime_Types_DiagsMask mask;
};




 

 
typedef xdc_Bits32 xdc_runtime_Types_LogEvent;

 
typedef void (*xdc_runtime_Types_LoggerFxn0)(xdc_Ptr, xdc_runtime_Types_LogEvent, xdc_runtime_Types_ModuleId);

 
typedef void (*xdc_runtime_Types_LoggerFxn1)(xdc_Ptr, xdc_runtime_Types_LogEvent, xdc_runtime_Types_ModuleId, xdc_IArg);

 
typedef void (*xdc_runtime_Types_LoggerFxn2)(xdc_Ptr, xdc_runtime_Types_LogEvent, xdc_runtime_Types_ModuleId, xdc_IArg, xdc_IArg);

 
typedef void (*xdc_runtime_Types_LoggerFxn4)(xdc_Ptr, xdc_runtime_Types_LogEvent, xdc_runtime_Types_ModuleId, xdc_IArg, xdc_IArg, xdc_IArg, xdc_IArg);

 
typedef void (*xdc_runtime_Types_LoggerFxn8)(xdc_Ptr, xdc_runtime_Types_LogEvent, xdc_runtime_Types_ModuleId, xdc_IArg, xdc_IArg, xdc_IArg, xdc_IArg, xdc_IArg, xdc_IArg, xdc_IArg, xdc_IArg);

 
struct xdc_runtime_Types_Vec {
    xdc_Int len;
    xdc_Ptr arr;
};

 
struct xdc_runtime_Types_Link {
    xdc_runtime_Types_Link *next;
    xdc_runtime_Types_Link *prev;
};

 
struct xdc_runtime_Types_InstHdr {
    xdc_runtime_Types_Link link;
};

 
struct xdc_runtime_Types_PrmsHdr {
    xdc_SizeT size;
    xdc_Ptr self;
    xdc_Ptr modFxns;
    xdc_Ptr instPrms;
};

 
struct xdc_runtime_Types_Base {
    xdc_runtime_Types_Base *base;
};

 
struct xdc_runtime_Types_SysFxns {
    xdc_Ptr (*__create)(xdc_Ptr, xdc_SizeT, xdc_Ptr, const xdc_Ptr, xdc_SizeT, xdc_runtime_Error_Block*);
    void (*__delete)(xdc_Ptr);
    xdc_runtime_Types_Label *(*__label)(xdc_Ptr, xdc_runtime_Types_Label*);
    xdc_runtime_Types_ModuleId __mid;
};

 
struct xdc_runtime_Types_SysFxns2 {
    xdc_Ptr (*__create)(xdc_Ptr, xdc_SizeT, xdc_Ptr, const xdc_UChar*, xdc_SizeT, xdc_runtime_Error_Block*);
    void (*__delete)(xdc_Ptr);
    xdc_runtime_Types_Label *(*__label)(xdc_Ptr, xdc_runtime_Types_Label*);
    xdc_runtime_Types_ModuleId __mid;
};




 

 
typedef xdc_Bits32 CT__xdc_runtime_Types_Module__diagsEnabled;
extern  const CT__xdc_runtime_Types_Module__diagsEnabled xdc_runtime_Types_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_Types_Module__diagsIncluded;
extern  const CT__xdc_runtime_Types_Module__diagsIncluded xdc_runtime_Types_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_Types_Module__diagsMask;
extern  const CT__xdc_runtime_Types_Module__diagsMask xdc_runtime_Types_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_Types_Module__gateObj;
extern  const CT__xdc_runtime_Types_Module__gateObj xdc_runtime_Types_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_Types_Module__gatePrms;
extern  const CT__xdc_runtime_Types_Module__gatePrms xdc_runtime_Types_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Types_Module__id;
extern  const CT__xdc_runtime_Types_Module__id xdc_runtime_Types_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_Types_Module__loggerDefined;
extern  const CT__xdc_runtime_Types_Module__loggerDefined xdc_runtime_Types_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_Types_Module__loggerObj;
extern  const CT__xdc_runtime_Types_Module__loggerObj xdc_runtime_Types_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Types_Module__loggerFxn0;
extern  const CT__xdc_runtime_Types_Module__loggerFxn0 xdc_runtime_Types_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Types_Module__loggerFxn1;
extern  const CT__xdc_runtime_Types_Module__loggerFxn1 xdc_runtime_Types_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Types_Module__loggerFxn2;
extern  const CT__xdc_runtime_Types_Module__loggerFxn2 xdc_runtime_Types_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Types_Module__loggerFxn4;
extern  const CT__xdc_runtime_Types_Module__loggerFxn4 xdc_runtime_Types_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Types_Module__loggerFxn8;
extern  const CT__xdc_runtime_Types_Module__loggerFxn8 xdc_runtime_Types_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_Types_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_Types_Module__startupDoneFxn xdc_runtime_Types_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_Types_Object__count;
extern  const CT__xdc_runtime_Types_Object__count xdc_runtime_Types_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Types_Object__heap;
extern  const CT__xdc_runtime_Types_Object__heap xdc_runtime_Types_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_Types_Object__sizeof;
extern  const CT__xdc_runtime_Types_Object__sizeof xdc_runtime_Types_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_Types_Object__table;
extern  const CT__xdc_runtime_Types_Object__table xdc_runtime_Types_Object__table__C;




 

 


 

extern xdc_Bool xdc_runtime_Types_Module__startupDone__S( void );




 

 


 


 


 
static inline CT__xdc_runtime_Types_Module__id xdc_runtime_Types_Module_id( void ) 
{
    return xdc_runtime_Types_Module__id__C;
}

 
static inline xdc_Bool xdc_runtime_Types_Module_hasMask( void ) 
{
    return xdc_runtime_Types_Module__diagsMask__C != 0;
}

 
static inline xdc_Bits16 xdc_runtime_Types_Module_getMask( void ) 
{
    return xdc_runtime_Types_Module__diagsMask__C != 0 ? *xdc_runtime_Types_Module__diagsMask__C : 0;
}

 
static inline void xdc_runtime_Types_Module_setMask( xdc_Bits16 mask ) 
{
    if (xdc_runtime_Types_Module__diagsMask__C != 0) *xdc_runtime_Types_Module__diagsMask__C = mask;
}




 

# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types__epilogue.h"











 



 



 





 





 



 

# 341 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"










 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 54 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Startup.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"





 













 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 52 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 55 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"





 














 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 53 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"





 














 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 53 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"





 




 

 
struct xdc_runtime_IInstance_Params {
    size_t __size;
    xdc_String name;
};




 

 
struct xdc_runtime_IInstance_Fxns__ {
    xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2 *__sysp;
    xdc_runtime_Types_SysFxns2 __sfxns;
};

 
extern const xdc_runtime_Types_Base xdc_runtime_IInstance_Interface__BASE__C;




 

 

extern xdc_runtime_IInstance_Handle xdc_runtime_IInstance_create(xdc_runtime_IInstance_Module, const xdc_runtime_IInstance_Params *, xdc_runtime_Error_Block *__eb);

 

extern void xdc_runtime_IInstance_delete(xdc_runtime_IInstance_Handle *);

 
static inline xdc_runtime_IInstance_Module xdc_runtime_IInstance_Handle_to_Module( xdc_runtime_IInstance_Handle inst )
{
    return inst->__fxns;
}

 
static inline xdc_runtime_Types_Label *xdc_runtime_IInstance_Handle_label( xdc_runtime_IInstance_Handle inst, xdc_runtime_Types_Label *lab )
{
    return inst->__fxns->__sysp->__label(inst, lab);
}

 
static inline xdc_runtime_Types_ModuleId xdc_runtime_IInstance_Module_id( xdc_runtime_IInstance_Module mod )
{
    return mod->__sysp->__mid;
}




 




 










 

# 155 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"


 

# 54 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"





 













 




 

# 104 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"




 

# 121 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"


 

# 57 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"





 















 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 54 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error__prologue.h"











 
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"





 















 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 54 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"





 













 




 

# 104 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"




 

# 121 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"


 

# 57 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"





 














 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 53 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"





 














 




 

# 132 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"




 

# 155 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"


 

# 54 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"





 













 




 

# 104 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"




 

# 121 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"


 

# 57 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"




 

 


 





 

 
struct xdc_runtime_IGateProvider_Params {
    size_t __size;
    const void *__self;
    void *__fxns;
    xdc_runtime_IInstance_Params *instance;
};




 

 
struct xdc_runtime_IGateProvider_Fxns__ {
    xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2 *__sysp;
    xdc_Bool (*query)(xdc_Int);
    xdc_IArg (*enter)(void*);
    void (*leave)(void*, xdc_IArg);
    xdc_runtime_Types_SysFxns2 __sfxns;
};

 
extern const xdc_runtime_Types_Base xdc_runtime_IGateProvider_Interface__BASE__C;




 

 

extern xdc_runtime_IGateProvider_Handle xdc_runtime_IGateProvider_create(xdc_runtime_IGateProvider_Module, const xdc_runtime_IGateProvider_Params *, xdc_runtime_Error_Block *__eb);

 

extern void xdc_runtime_IGateProvider_delete(xdc_runtime_IGateProvider_Handle *);

 
static inline xdc_runtime_IGateProvider_Module xdc_runtime_IGateProvider_Handle_to_Module( xdc_runtime_IGateProvider_Handle inst )
{
    return inst->__fxns;
}

 
static inline xdc_runtime_Types_Label *xdc_runtime_IGateProvider_Handle_label( xdc_runtime_IGateProvider_Handle inst, xdc_runtime_Types_Label *lab )
{
    return inst->__fxns->__sysp->__label(inst, lab);
}

 
static inline xdc_runtime_Types_ModuleId xdc_runtime_IGateProvider_Module_id( xdc_runtime_IGateProvider_Module mod )
{
    return mod->__sysp->__mid;
}

 
static inline xdc_Bool xdc_runtime_IGateProvider_query( xdc_runtime_IGateProvider_Module __inst, xdc_Int qual )
{
    return __inst->query(qual);
}

 
static inline xdc_IArg xdc_runtime_IGateProvider_enter( xdc_runtime_IGateProvider_Handle __inst )
{
    return __inst->__fxns->enter((void*)__inst);
}

 
static inline void xdc_runtime_IGateProvider_leave( xdc_runtime_IGateProvider_Handle __inst, xdc_IArg key )
{
    __inst->__fxns->leave((void*)__inst, key);
}




 






 

 
typedef xdc_Bool (*xdc_runtime_IGateProvider_query_FxnT)(xdc_Int);
static inline xdc_runtime_IGateProvider_query_FxnT xdc_runtime_IGateProvider_query_fxnP( xdc_runtime_IGateProvider_Module __inst )
{
    return (xdc_runtime_IGateProvider_query_FxnT)__inst->query;
}

 
typedef xdc_IArg (*xdc_runtime_IGateProvider_enter_FxnT)(void *);
static inline xdc_runtime_IGateProvider_enter_FxnT xdc_runtime_IGateProvider_enter_fxnP( xdc_runtime_IGateProvider_Handle __inst )
{
    return (xdc_runtime_IGateProvider_enter_FxnT)__inst->__fxns->enter;
}

 
typedef void (*xdc_runtime_IGateProvider_leave_FxnT)(void *, xdc_IArg);
static inline xdc_runtime_IGateProvider_leave_FxnT xdc_runtime_IGateProvider_leave_fxnP( xdc_runtime_IGateProvider_Handle __inst )
{
    return (xdc_runtime_IGateProvider_leave_FxnT)__inst->__fxns->leave;
}




 










 

# 227 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"


 

# 58 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/Main_Module_GateProxy.h"





 
















 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 55 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/Main_Module_GateProxy.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"





 














 




 

# 132 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"




 

# 155 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"


 

# 56 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/Main_Module_GateProxy.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"





 














 




 

# 192 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"




 

# 227 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"


 

# 59 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/Main_Module_GateProxy.h"




 

 


 





 

 
typedef xdc_Bits32 CT__xdc_runtime_Main_Module_GateProxy_Module__diagsEnabled;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__diagsEnabled xdc_runtime_Main_Module_GateProxy_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_Main_Module_GateProxy_Module__diagsIncluded;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__diagsIncluded xdc_runtime_Main_Module_GateProxy_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_Main_Module_GateProxy_Module__diagsMask;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__diagsMask xdc_runtime_Main_Module_GateProxy_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_Main_Module_GateProxy_Module__gateObj;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__gateObj xdc_runtime_Main_Module_GateProxy_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_Main_Module_GateProxy_Module__gatePrms;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__gatePrms xdc_runtime_Main_Module_GateProxy_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Main_Module_GateProxy_Module__id;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__id xdc_runtime_Main_Module_GateProxy_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_Main_Module_GateProxy_Module__loggerDefined;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__loggerDefined xdc_runtime_Main_Module_GateProxy_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_Main_Module_GateProxy_Module__loggerObj;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__loggerObj xdc_runtime_Main_Module_GateProxy_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Main_Module_GateProxy_Module__loggerFxn0;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__loggerFxn0 xdc_runtime_Main_Module_GateProxy_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Main_Module_GateProxy_Module__loggerFxn1;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__loggerFxn1 xdc_runtime_Main_Module_GateProxy_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Main_Module_GateProxy_Module__loggerFxn2;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__loggerFxn2 xdc_runtime_Main_Module_GateProxy_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Main_Module_GateProxy_Module__loggerFxn4;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__loggerFxn4 xdc_runtime_Main_Module_GateProxy_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Main_Module_GateProxy_Module__loggerFxn8;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__loggerFxn8 xdc_runtime_Main_Module_GateProxy_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_Main_Module_GateProxy_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_Main_Module_GateProxy_Module__startupDoneFxn xdc_runtime_Main_Module_GateProxy_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_Main_Module_GateProxy_Object__count;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Object__count xdc_runtime_Main_Module_GateProxy_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Main_Module_GateProxy_Object__heap;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Object__heap xdc_runtime_Main_Module_GateProxy_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_Main_Module_GateProxy_Object__sizeof;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Object__sizeof xdc_runtime_Main_Module_GateProxy_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_Main_Module_GateProxy_Object__table;
extern  const CT__xdc_runtime_Main_Module_GateProxy_Object__table xdc_runtime_Main_Module_GateProxy_Object__table__C;




 

 
struct xdc_runtime_Main_Module_GateProxy_Params {
    size_t __size;
    const void *__self;
    void *__fxns;
    xdc_runtime_IInstance_Params *instance;
    xdc_runtime_IInstance_Params __iprms;
};

 
struct xdc_runtime_Main_Module_GateProxy_Struct {
    const xdc_runtime_Main_Module_GateProxy_Fxns__ *__fxns;
    xdc_runtime_Types_CordAddr __name;
};




 

 
struct xdc_runtime_Main_Module_GateProxy_Fxns__ {
    xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2 *__sysp;
    xdc_Bool (*query)(xdc_Int);
    xdc_IArg (*enter)(xdc_runtime_Main_Module_GateProxy_Handle);
    void (*leave)(xdc_runtime_Main_Module_GateProxy_Handle, xdc_IArg);
    xdc_runtime_Types_SysFxns2 __sfxns;
};

 
extern const xdc_runtime_Main_Module_GateProxy_Fxns__ xdc_runtime_Main_Module_GateProxy_Module__FXNS__C;




 

 


 

extern xdc_runtime_Types_Label *xdc_runtime_Main_Module_GateProxy_Handle__label__S( xdc_Ptr obj, xdc_runtime_Types_Label *lab );

 

extern xdc_Bool xdc_runtime_Main_Module_GateProxy_Module__startupDone__S( void );

 

extern xdc_Ptr xdc_runtime_Main_Module_GateProxy_Object__create__S( xdc_Ptr __oa, xdc_SizeT __osz, xdc_Ptr __aa, const xdc_UChar *__pa, xdc_SizeT __psz, xdc_runtime_Error_Block *__eb );

 

extern xdc_runtime_Main_Module_GateProxy_Handle xdc_runtime_Main_Module_GateProxy_create( const xdc_runtime_Main_Module_GateProxy_Params *__prms, xdc_runtime_Error_Block *__eb );

 

extern void xdc_runtime_Main_Module_GateProxy_Object__delete__S( xdc_Ptr instp );

 

extern void xdc_runtime_Main_Module_GateProxy_delete(xdc_runtime_Main_Module_GateProxy_Handle *instp);

 

extern void xdc_runtime_Main_Module_GateProxy_Object__destruct__S( xdc_Ptr objp );

 

extern xdc_Ptr xdc_runtime_Main_Module_GateProxy_Object__get__S( xdc_Ptr oarr, xdc_Int i );

 

extern xdc_Ptr xdc_runtime_Main_Module_GateProxy_Object__first__S( void );

 

extern xdc_Ptr xdc_runtime_Main_Module_GateProxy_Object__next__S( xdc_Ptr obj );

 

extern void xdc_runtime_Main_Module_GateProxy_Params__init__S( xdc_Ptr dst, const void *src, xdc_SizeT psz, xdc_SizeT isz );

 

extern xdc_Bool xdc_runtime_Main_Module_GateProxy_Proxy__abstract__S( void );

 

extern xdc_Ptr xdc_runtime_Main_Module_GateProxy_Proxy__delegate__S( void );

 


extern xdc_Bool xdc_runtime_Main_Module_GateProxy_query__E( xdc_Int qual );

 


extern xdc_IArg xdc_runtime_Main_Module_GateProxy_enter__E( xdc_runtime_Main_Module_GateProxy_Handle __inst );

 


extern void xdc_runtime_Main_Module_GateProxy_leave__E( xdc_runtime_Main_Module_GateProxy_Handle __inst, xdc_IArg key );




 

 
static inline xdc_runtime_IGateProvider_Module xdc_runtime_Main_Module_GateProxy_Module_upCast( void )
{
    return (xdc_runtime_IGateProvider_Module)xdc_runtime_Main_Module_GateProxy_Proxy__delegate__S();
}

 


 
static inline xdc_runtime_IGateProvider_Handle xdc_runtime_Main_Module_GateProxy_Handle_upCast( xdc_runtime_Main_Module_GateProxy_Handle i )
{
    return (xdc_runtime_IGateProvider_Handle)i;
}

 


 
static inline xdc_runtime_Main_Module_GateProxy_Handle xdc_runtime_Main_Module_GateProxy_Handle_downCast( xdc_runtime_IGateProvider_Handle i )
{
    xdc_runtime_IGateProvider_Handle i2 = (xdc_runtime_IGateProvider_Handle)i;
if (xdc_runtime_Main_Module_GateProxy_Proxy__abstract__S()) return (xdc_runtime_Main_Module_GateProxy_Handle)i;
    return (void*)i2->__fxns == (void*)xdc_runtime_Main_Module_GateProxy_Proxy__delegate__S() ? (xdc_runtime_Main_Module_GateProxy_Handle)i : 0;
}

 





 

 


 


 


 
static inline CT__xdc_runtime_Main_Module_GateProxy_Module__id xdc_runtime_Main_Module_GateProxy_Module_id( void ) 
{
    return xdc_runtime_Main_Module_GateProxy_Module__id__C;
}

 


 


 
static inline void xdc_runtime_Main_Module_GateProxy_Params_init( xdc_runtime_Main_Module_GateProxy_Params *prms ) 
{
    if (prms) {
        xdc_runtime_Main_Module_GateProxy_Params__init__S(prms, 0, sizeof(xdc_runtime_Main_Module_GateProxy_Params), sizeof(xdc_runtime_IInstance_Params));
    }
}

 
static inline void xdc_runtime_Main_Module_GateProxy_Params_copy(xdc_runtime_Main_Module_GateProxy_Params *dst, const xdc_runtime_Main_Module_GateProxy_Params *src) 
{
    if (dst) {
        xdc_runtime_Main_Module_GateProxy_Params__init__S(dst, (const void *)src, sizeof(xdc_runtime_Main_Module_GateProxy_Params), sizeof(xdc_runtime_IInstance_Params));
    }
}




 










 

# 59 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"




 




 




 

 
typedef xdc_Bits32 CT__xdc_runtime_Main_Module__diagsEnabled;
extern  const CT__xdc_runtime_Main_Module__diagsEnabled xdc_runtime_Main_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_Main_Module__diagsIncluded;
extern  const CT__xdc_runtime_Main_Module__diagsIncluded xdc_runtime_Main_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_Main_Module__diagsMask;
extern  const CT__xdc_runtime_Main_Module__diagsMask xdc_runtime_Main_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_Main_Module__gateObj;
extern  const CT__xdc_runtime_Main_Module__gateObj xdc_runtime_Main_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_Main_Module__gatePrms;
extern  const CT__xdc_runtime_Main_Module__gatePrms xdc_runtime_Main_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Main_Module__id;
extern  const CT__xdc_runtime_Main_Module__id xdc_runtime_Main_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_Main_Module__loggerDefined;
extern  const CT__xdc_runtime_Main_Module__loggerDefined xdc_runtime_Main_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_Main_Module__loggerObj;
extern  const CT__xdc_runtime_Main_Module__loggerObj xdc_runtime_Main_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Main_Module__loggerFxn0;
extern  const CT__xdc_runtime_Main_Module__loggerFxn0 xdc_runtime_Main_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Main_Module__loggerFxn1;
extern  const CT__xdc_runtime_Main_Module__loggerFxn1 xdc_runtime_Main_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Main_Module__loggerFxn2;
extern  const CT__xdc_runtime_Main_Module__loggerFxn2 xdc_runtime_Main_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Main_Module__loggerFxn4;
extern  const CT__xdc_runtime_Main_Module__loggerFxn4 xdc_runtime_Main_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Main_Module__loggerFxn8;
extern  const CT__xdc_runtime_Main_Module__loggerFxn8 xdc_runtime_Main_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_Main_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_Main_Module__startupDoneFxn xdc_runtime_Main_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_Main_Object__count;
extern  const CT__xdc_runtime_Main_Object__count xdc_runtime_Main_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Main_Object__heap;
extern  const CT__xdc_runtime_Main_Object__heap xdc_runtime_Main_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_Main_Object__sizeof;
extern  const CT__xdc_runtime_Main_Object__sizeof xdc_runtime_Main_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_Main_Object__table;
extern  const CT__xdc_runtime_Main_Object__table xdc_runtime_Main_Object__table__C;




 

 


 

extern xdc_Bool xdc_runtime_Main_Module__startupDone__S( void );




 

 


 


 


 
static inline CT__xdc_runtime_Main_Module__id xdc_runtime_Main_Module_id( void ) 
{
    return xdc_runtime_Main_Module__id__C;
}

 
static inline xdc_Bool xdc_runtime_Main_Module_hasMask( void ) 
{
    return xdc_runtime_Main_Module__diagsMask__C != 0;
}

 
static inline xdc_Bits16 xdc_runtime_Main_Module_getMask( void ) 
{
    return xdc_runtime_Main_Module__diagsMask__C != 0 ? *xdc_runtime_Main_Module__diagsMask__C : 0;
}

 
static inline void xdc_runtime_Main_Module_setMask( xdc_Bits16 mask ) 
{
    if (xdc_runtime_Main_Module__diagsMask__C != 0) *xdc_runtime_Main_Module__diagsMask__C = mask;
}




 










 

# 222 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"



 

# 248 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"


 

# 14 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error__prologue.h"



 
typedef xdc_Bits32 xdc_runtime_Error_Id;


















 








 

# 55 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"





 













 




 

# 104 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"




 

# 121 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"


 

# 58 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 59 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"




 

 
enum xdc_runtime_Error_Policy {
    xdc_runtime_Error_TERMINATE,
    xdc_runtime_Error_UNWIND
};
typedef enum xdc_runtime_Error_Policy xdc_runtime_Error_Policy;

 

 
typedef void (*xdc_runtime_Error_HookFxn)(xdc_runtime_Error_Block*);

 


 
typedef xdc_IArg __T1_xdc_runtime_Error_Data__arg;
typedef xdc_IArg __ARRAY1_xdc_runtime_Error_Data__arg[2];
typedef __ARRAY1_xdc_runtime_Error_Data__arg __TA_xdc_runtime_Error_Data__arg;
struct xdc_runtime_Error_Data {
    __TA_xdc_runtime_Error_Data__arg arg;
};

 
typedef xdc_IArg __T1_xdc_runtime_Error_Block__xtra;
typedef xdc_IArg __ARRAY1_xdc_runtime_Error_Block__xtra[4];
typedef __ARRAY1_xdc_runtime_Error_Block__xtra __TA_xdc_runtime_Error_Block__xtra;
struct xdc_runtime_Error_Block {
    xdc_UInt16 unused;
    xdc_runtime_Error_Data data;
    xdc_runtime_Error_Id id;
    xdc_String msg;
    xdc_runtime_Types_Site site;
    __TA_xdc_runtime_Error_Block__xtra xtra;
};

 
typedef void (*xdc_runtime_Error_PolicyFxn)(xdc_runtime_Error_Block*, xdc_runtime_Types_ModuleId, xdc_CString, xdc_Int, xdc_runtime_Error_Id, xdc_IArg, xdc_IArg);




 




 

 
typedef xdc_Bits32 CT__xdc_runtime_Error_Module__diagsEnabled;
extern  const CT__xdc_runtime_Error_Module__diagsEnabled xdc_runtime_Error_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_Error_Module__diagsIncluded;
extern  const CT__xdc_runtime_Error_Module__diagsIncluded xdc_runtime_Error_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_Error_Module__diagsMask;
extern  const CT__xdc_runtime_Error_Module__diagsMask xdc_runtime_Error_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_Error_Module__gateObj;
extern  const CT__xdc_runtime_Error_Module__gateObj xdc_runtime_Error_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_Error_Module__gatePrms;
extern  const CT__xdc_runtime_Error_Module__gatePrms xdc_runtime_Error_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Error_Module__id;
extern  const CT__xdc_runtime_Error_Module__id xdc_runtime_Error_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_Error_Module__loggerDefined;
extern  const CT__xdc_runtime_Error_Module__loggerDefined xdc_runtime_Error_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_Error_Module__loggerObj;
extern  const CT__xdc_runtime_Error_Module__loggerObj xdc_runtime_Error_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Error_Module__loggerFxn0;
extern  const CT__xdc_runtime_Error_Module__loggerFxn0 xdc_runtime_Error_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Error_Module__loggerFxn1;
extern  const CT__xdc_runtime_Error_Module__loggerFxn1 xdc_runtime_Error_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Error_Module__loggerFxn2;
extern  const CT__xdc_runtime_Error_Module__loggerFxn2 xdc_runtime_Error_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Error_Module__loggerFxn4;
extern  const CT__xdc_runtime_Error_Module__loggerFxn4 xdc_runtime_Error_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Error_Module__loggerFxn8;
extern  const CT__xdc_runtime_Error_Module__loggerFxn8 xdc_runtime_Error_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_Error_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_Error_Module__startupDoneFxn xdc_runtime_Error_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_Error_Object__count;
extern  const CT__xdc_runtime_Error_Object__count xdc_runtime_Error_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Error_Object__heap;
extern  const CT__xdc_runtime_Error_Object__heap xdc_runtime_Error_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_Error_Object__sizeof;
extern  const CT__xdc_runtime_Error_Object__sizeof xdc_runtime_Error_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_Error_Object__table;
extern  const CT__xdc_runtime_Error_Object__table xdc_runtime_Error_Object__table__C;

 

typedef xdc_runtime_Error_PolicyFxn CT__xdc_runtime_Error_policyFxn;
extern  const CT__xdc_runtime_Error_policyFxn xdc_runtime_Error_policyFxn__C;

 

typedef xdc_runtime_Error_Id CT__xdc_runtime_Error_E_generic;
extern  const CT__xdc_runtime_Error_E_generic xdc_runtime_Error_E_generic__C;

 

typedef xdc_runtime_Error_Id CT__xdc_runtime_Error_E_memory;
extern  const CT__xdc_runtime_Error_E_memory xdc_runtime_Error_E_memory__C;

 

typedef xdc_runtime_Error_Id CT__xdc_runtime_Error_E_msgCode;
extern  const CT__xdc_runtime_Error_E_msgCode xdc_runtime_Error_E_msgCode__C;

 

typedef xdc_runtime_Error_Policy CT__xdc_runtime_Error_policy;
extern  const CT__xdc_runtime_Error_policy xdc_runtime_Error_policy__C;

 

typedef xdc_runtime_Error_HookFxn CT__xdc_runtime_Error_raiseHook;
extern  const CT__xdc_runtime_Error_raiseHook xdc_runtime_Error_raiseHook__C;

 




typedef xdc_UInt16 CT__xdc_runtime_Error_maxDepth;
extern  const CT__xdc_runtime_Error_maxDepth xdc_runtime_Error_maxDepth__C;





 

 


 

extern xdc_Bool xdc_runtime_Error_Module__startupDone__S( void );

 


extern xdc_Bool xdc_runtime_Error_check__E( xdc_runtime_Error_Block *eb );

 


extern xdc_runtime_Error_Data *xdc_runtime_Error_getData__E( xdc_runtime_Error_Block *eb );

 


extern xdc_UInt16 xdc_runtime_Error_getCode__E( xdc_runtime_Error_Block *eb );

 


extern xdc_runtime_Error_Id xdc_runtime_Error_getId__E( xdc_runtime_Error_Block *eb );

 


extern xdc_String xdc_runtime_Error_getMsg__E( xdc_runtime_Error_Block *eb );

 


extern xdc_runtime_Types_Site *xdc_runtime_Error_getSite__E( xdc_runtime_Error_Block *eb );

 


extern void xdc_runtime_Error_init__E( xdc_runtime_Error_Block *eb );

 


extern void xdc_runtime_Error_print__E( xdc_runtime_Error_Block *eb );

 


extern void xdc_runtime_Error_policyDefault__E( xdc_runtime_Error_Block *eb, xdc_runtime_Types_ModuleId mod, xdc_CString file, xdc_Int line, xdc_runtime_Error_Id id, xdc_IArg arg1, xdc_IArg arg2 );

 


extern void xdc_runtime_Error_policySpin__E( xdc_runtime_Error_Block *eb, xdc_runtime_Types_ModuleId mod, xdc_CString file, xdc_Int line, xdc_runtime_Error_Id id, xdc_IArg arg1, xdc_IArg arg2 );

 


extern void xdc_runtime_Error_raiseX__E( xdc_runtime_Error_Block *eb, xdc_runtime_Types_ModuleId mod, xdc_CString file, xdc_Int line, xdc_runtime_Error_Id id, xdc_IArg arg1, xdc_IArg arg2 );

 


extern void xdc_runtime_Error_setX__E( xdc_runtime_Error_Block *eb, xdc_runtime_Types_ModuleId mod, xdc_CString file, xdc_Int line, xdc_runtime_Error_Id id, xdc_IArg arg1, xdc_IArg arg2 );




 

 


 


 


 
static inline CT__xdc_runtime_Error_Module__id xdc_runtime_Error_Module_id( void ) 
{
    return xdc_runtime_Error_Module__id__C;
}

 
static inline xdc_Bool xdc_runtime_Error_Module_hasMask( void ) 
{
    return xdc_runtime_Error_Module__diagsMask__C != 0;
}

 
static inline xdc_Bits16 xdc_runtime_Error_Module_getMask( void ) 
{
    return xdc_runtime_Error_Module__diagsMask__C != 0 ? *xdc_runtime_Error_Module__diagsMask__C : 0;
}

 
static inline void xdc_runtime_Error_Module_setMask( xdc_Bits16 mask ) 
{
    if (xdc_runtime_Error_Module__diagsMask__C != 0) *xdc_runtime_Error_Module__diagsMask__C = mask;
}




 

# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error__epilogue.h"











 








 






 





 




 

# 341 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"










 

# 369 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"




 

# 425 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"


 

# 58 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Memory.h"





 















 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 54 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Memory.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"





 













 




 

# 104 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"




 

# 121 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"


 

# 57 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Memory.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"





 














 




 

# 202 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"




 

# 238 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"


 

# 58 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Memory.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"




 

# 369 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"




 

# 425 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"


 

# 59 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Memory.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/Memory_HeapProxy.h"





 
















 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 55 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/Memory_HeapProxy.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"





 














 




 

# 132 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"




 

# 155 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"


 

# 56 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/Memory_HeapProxy.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"





 














 




 

# 202 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"




 

# 238 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"


 

# 59 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/Memory_HeapProxy.h"




 




 

 
typedef xdc_Bits32 CT__xdc_runtime_Memory_HeapProxy_Module__diagsEnabled;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__diagsEnabled xdc_runtime_Memory_HeapProxy_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_Memory_HeapProxy_Module__diagsIncluded;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__diagsIncluded xdc_runtime_Memory_HeapProxy_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_Memory_HeapProxy_Module__diagsMask;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__diagsMask xdc_runtime_Memory_HeapProxy_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_Memory_HeapProxy_Module__gateObj;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__gateObj xdc_runtime_Memory_HeapProxy_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_Memory_HeapProxy_Module__gatePrms;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__gatePrms xdc_runtime_Memory_HeapProxy_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Memory_HeapProxy_Module__id;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__id xdc_runtime_Memory_HeapProxy_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_Memory_HeapProxy_Module__loggerDefined;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__loggerDefined xdc_runtime_Memory_HeapProxy_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_Memory_HeapProxy_Module__loggerObj;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__loggerObj xdc_runtime_Memory_HeapProxy_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Memory_HeapProxy_Module__loggerFxn0;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__loggerFxn0 xdc_runtime_Memory_HeapProxy_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Memory_HeapProxy_Module__loggerFxn1;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__loggerFxn1 xdc_runtime_Memory_HeapProxy_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Memory_HeapProxy_Module__loggerFxn2;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__loggerFxn2 xdc_runtime_Memory_HeapProxy_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Memory_HeapProxy_Module__loggerFxn4;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__loggerFxn4 xdc_runtime_Memory_HeapProxy_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Memory_HeapProxy_Module__loggerFxn8;
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__loggerFxn8 xdc_runtime_Memory_HeapProxy_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_Memory_HeapProxy_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_Memory_HeapProxy_Module__startupDoneFxn xdc_runtime_Memory_HeapProxy_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_Memory_HeapProxy_Object__count;
extern  const CT__xdc_runtime_Memory_HeapProxy_Object__count xdc_runtime_Memory_HeapProxy_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Memory_HeapProxy_Object__heap;
extern  const CT__xdc_runtime_Memory_HeapProxy_Object__heap xdc_runtime_Memory_HeapProxy_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_Memory_HeapProxy_Object__sizeof;
extern  const CT__xdc_runtime_Memory_HeapProxy_Object__sizeof xdc_runtime_Memory_HeapProxy_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_Memory_HeapProxy_Object__table;
extern  const CT__xdc_runtime_Memory_HeapProxy_Object__table xdc_runtime_Memory_HeapProxy_Object__table__C;




 

 
struct xdc_runtime_Memory_HeapProxy_Params {
    size_t __size;
    const void *__self;
    void *__fxns;
    xdc_runtime_IInstance_Params *instance;
    xdc_runtime_IInstance_Params __iprms;
};

 
struct xdc_runtime_Memory_HeapProxy_Struct {
    const xdc_runtime_Memory_HeapProxy_Fxns__ *__fxns;
    xdc_runtime_Types_CordAddr __name;
};




 

 
struct xdc_runtime_Memory_HeapProxy_Fxns__ {
    xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2 *__sysp;
    xdc_Ptr (*alloc)(xdc_runtime_Memory_HeapProxy_Handle, xdc_SizeT, xdc_SizeT, xdc_runtime_Error_Block*);
    void (*free)(xdc_runtime_Memory_HeapProxy_Handle, xdc_Ptr, xdc_SizeT);
    xdc_Bool (*isBlocking)(xdc_runtime_Memory_HeapProxy_Handle);
    void (*getStats)(xdc_runtime_Memory_HeapProxy_Handle, xdc_runtime_Memory_Stats*);
    xdc_runtime_Types_SysFxns2 __sfxns;
};

 
extern const xdc_runtime_Memory_HeapProxy_Fxns__ xdc_runtime_Memory_HeapProxy_Module__FXNS__C;




 

 


 

extern xdc_runtime_Types_Label *xdc_runtime_Memory_HeapProxy_Handle__label__S( xdc_Ptr obj, xdc_runtime_Types_Label *lab );

 

extern xdc_Bool xdc_runtime_Memory_HeapProxy_Module__startupDone__S( void );

 

extern xdc_Ptr xdc_runtime_Memory_HeapProxy_Object__create__S( xdc_Ptr __oa, xdc_SizeT __osz, xdc_Ptr __aa, const xdc_UChar *__pa, xdc_SizeT __psz, xdc_runtime_Error_Block *__eb );

 

extern xdc_runtime_Memory_HeapProxy_Handle xdc_runtime_Memory_HeapProxy_create( const xdc_runtime_Memory_HeapProxy_Params *__prms, xdc_runtime_Error_Block *__eb );

 

extern void xdc_runtime_Memory_HeapProxy_Object__delete__S( xdc_Ptr instp );

 

extern void xdc_runtime_Memory_HeapProxy_delete(xdc_runtime_Memory_HeapProxy_Handle *instp);

 

extern void xdc_runtime_Memory_HeapProxy_Object__destruct__S( xdc_Ptr objp );

 

extern xdc_Ptr xdc_runtime_Memory_HeapProxy_Object__get__S( xdc_Ptr oarr, xdc_Int i );

 

extern xdc_Ptr xdc_runtime_Memory_HeapProxy_Object__first__S( void );

 

extern xdc_Ptr xdc_runtime_Memory_HeapProxy_Object__next__S( xdc_Ptr obj );

 

extern void xdc_runtime_Memory_HeapProxy_Params__init__S( xdc_Ptr dst, const void *src, xdc_SizeT psz, xdc_SizeT isz );

 

extern xdc_Bool xdc_runtime_Memory_HeapProxy_Proxy__abstract__S( void );

 

extern xdc_Ptr xdc_runtime_Memory_HeapProxy_Proxy__delegate__S( void );

 


extern xdc_Ptr xdc_runtime_Memory_HeapProxy_alloc__E( xdc_runtime_Memory_HeapProxy_Handle __inst, xdc_SizeT size, xdc_SizeT align, xdc_runtime_Error_Block *eb );

 


extern void xdc_runtime_Memory_HeapProxy_free__E( xdc_runtime_Memory_HeapProxy_Handle __inst, xdc_Ptr block, xdc_SizeT size );

 


extern xdc_Bool xdc_runtime_Memory_HeapProxy_isBlocking__E( xdc_runtime_Memory_HeapProxy_Handle __inst );

 


extern void xdc_runtime_Memory_HeapProxy_getStats__E( xdc_runtime_Memory_HeapProxy_Handle __inst, xdc_runtime_Memory_Stats *stats );




 

 
static inline xdc_runtime_IHeap_Module xdc_runtime_Memory_HeapProxy_Module_upCast( void )
{
    return (xdc_runtime_IHeap_Module)xdc_runtime_Memory_HeapProxy_Proxy__delegate__S();
}

 


 
static inline xdc_runtime_IHeap_Handle xdc_runtime_Memory_HeapProxy_Handle_upCast( xdc_runtime_Memory_HeapProxy_Handle i )
{
    return (xdc_runtime_IHeap_Handle)i;
}

 


 
static inline xdc_runtime_Memory_HeapProxy_Handle xdc_runtime_Memory_HeapProxy_Handle_downCast( xdc_runtime_IHeap_Handle i )
{
    xdc_runtime_IHeap_Handle i2 = (xdc_runtime_IHeap_Handle)i;
if (xdc_runtime_Memory_HeapProxy_Proxy__abstract__S()) return (xdc_runtime_Memory_HeapProxy_Handle)i;
    return (void*)i2->__fxns == (void*)xdc_runtime_Memory_HeapProxy_Proxy__delegate__S() ? (xdc_runtime_Memory_HeapProxy_Handle)i : 0;
}

 





 

 


 


 


 
static inline CT__xdc_runtime_Memory_HeapProxy_Module__id xdc_runtime_Memory_HeapProxy_Module_id( void ) 
{
    return xdc_runtime_Memory_HeapProxy_Module__id__C;
}

 


 


 
static inline void xdc_runtime_Memory_HeapProxy_Params_init( xdc_runtime_Memory_HeapProxy_Params *prms ) 
{
    if (prms) {
        xdc_runtime_Memory_HeapProxy_Params__init__S(prms, 0, sizeof(xdc_runtime_Memory_HeapProxy_Params), sizeof(xdc_runtime_IInstance_Params));
    }
}

 
static inline void xdc_runtime_Memory_HeapProxy_Params_copy(xdc_runtime_Memory_HeapProxy_Params *dst, const xdc_runtime_Memory_HeapProxy_Params *src) 
{
    if (dst) {
        xdc_runtime_Memory_HeapProxy_Params__init__S(dst, (const void *)src, sizeof(xdc_runtime_Memory_HeapProxy_Params), sizeof(xdc_runtime_IInstance_Params));
    }
}




 










 

# 60 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Memory.h"




 

 


 
typedef xdc_UArg xdc_runtime_Memory_Size;

 
struct xdc_runtime_Memory_Stats {
    xdc_runtime_Memory_Size totalSize;
    xdc_runtime_Memory_Size totalFreeSize;
    xdc_runtime_Memory_Size largestFreeSize;
};




 




 

 
typedef xdc_Bits32 CT__xdc_runtime_Memory_Module__diagsEnabled;
extern  const CT__xdc_runtime_Memory_Module__diagsEnabled xdc_runtime_Memory_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_Memory_Module__diagsIncluded;
extern  const CT__xdc_runtime_Memory_Module__diagsIncluded xdc_runtime_Memory_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_Memory_Module__diagsMask;
extern  const CT__xdc_runtime_Memory_Module__diagsMask xdc_runtime_Memory_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_Memory_Module__gateObj;
extern  const CT__xdc_runtime_Memory_Module__gateObj xdc_runtime_Memory_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_Memory_Module__gatePrms;
extern  const CT__xdc_runtime_Memory_Module__gatePrms xdc_runtime_Memory_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Memory_Module__id;
extern  const CT__xdc_runtime_Memory_Module__id xdc_runtime_Memory_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_Memory_Module__loggerDefined;
extern  const CT__xdc_runtime_Memory_Module__loggerDefined xdc_runtime_Memory_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_Memory_Module__loggerObj;
extern  const CT__xdc_runtime_Memory_Module__loggerObj xdc_runtime_Memory_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Memory_Module__loggerFxn0;
extern  const CT__xdc_runtime_Memory_Module__loggerFxn0 xdc_runtime_Memory_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Memory_Module__loggerFxn1;
extern  const CT__xdc_runtime_Memory_Module__loggerFxn1 xdc_runtime_Memory_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Memory_Module__loggerFxn2;
extern  const CT__xdc_runtime_Memory_Module__loggerFxn2 xdc_runtime_Memory_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Memory_Module__loggerFxn4;
extern  const CT__xdc_runtime_Memory_Module__loggerFxn4 xdc_runtime_Memory_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Memory_Module__loggerFxn8;
extern  const CT__xdc_runtime_Memory_Module__loggerFxn8 xdc_runtime_Memory_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_Memory_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_Memory_Module__startupDoneFxn xdc_runtime_Memory_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_Memory_Object__count;
extern  const CT__xdc_runtime_Memory_Object__count xdc_runtime_Memory_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Memory_Object__heap;
extern  const CT__xdc_runtime_Memory_Object__heap xdc_runtime_Memory_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_Memory_Object__sizeof;
extern  const CT__xdc_runtime_Memory_Object__sizeof xdc_runtime_Memory_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_Memory_Object__table;
extern  const CT__xdc_runtime_Memory_Object__table xdc_runtime_Memory_Object__table__C;

 

typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Memory_defaultHeapInstance;
extern  const CT__xdc_runtime_Memory_defaultHeapInstance xdc_runtime_Memory_defaultHeapInstance__C;




 

 


 

extern xdc_Bool xdc_runtime_Memory_Module__startupDone__S( void );

 


extern xdc_Ptr xdc_runtime_Memory_alloc__E( xdc_runtime_IHeap_Handle heap, xdc_SizeT size, xdc_SizeT align, xdc_runtime_Error_Block *eb );

 


extern xdc_Ptr xdc_runtime_Memory_calloc__E( xdc_runtime_IHeap_Handle heap, xdc_SizeT size, xdc_SizeT align, xdc_runtime_Error_Block *eb );

 


extern void xdc_runtime_Memory_free__E( xdc_runtime_IHeap_Handle heap, xdc_Ptr block, xdc_SizeT size );

 


extern void xdc_runtime_Memory_getStats__E( xdc_runtime_IHeap_Handle heap, xdc_runtime_Memory_Stats *stats );

 


extern xdc_Bool xdc_runtime_Memory_query__E( xdc_runtime_IHeap_Handle heap, xdc_Int qual );

 


extern xdc_SizeT xdc_runtime_Memory_getMaxDefaultTypeAlign__E( void );

 


extern xdc_Ptr xdc_runtime_Memory_valloc__E( xdc_runtime_IHeap_Handle heap, xdc_SizeT size, xdc_SizeT align, xdc_Char value, xdc_runtime_Error_Block *eb );




 

 


 


 


 
static inline CT__xdc_runtime_Memory_Module__id xdc_runtime_Memory_Module_id( void ) 
{
    return xdc_runtime_Memory_Module__id__C;
}

 
static inline xdc_Bool xdc_runtime_Memory_Module_hasMask( void ) 
{
    return xdc_runtime_Memory_Module__diagsMask__C != 0;
}

 
static inline xdc_Bits16 xdc_runtime_Memory_Module_getMask( void ) 
{
    return xdc_runtime_Memory_Module__diagsMask__C != 0 ? *xdc_runtime_Memory_Module__diagsMask__C : 0;
}

 
static inline void xdc_runtime_Memory_Module_setMask( xdc_Bits16 mask ) 
{
    if (xdc_runtime_Memory_Module__diagsMask__C != 0) *xdc_runtime_Memory_Module__diagsMask__C = mask;
}




 










 

# 283 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Memory.h"




 

# 322 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Memory.h"


 

# 59 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"




 




 

 
struct xdc_runtime_IHeap_Params {
    size_t __size;
    const void *__self;
    void *__fxns;
    xdc_runtime_IInstance_Params *instance;
};




 

 
struct xdc_runtime_IHeap_Fxns__ {
    xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2 *__sysp;
    xdc_Ptr (*alloc)(void*, xdc_SizeT, xdc_SizeT, xdc_runtime_Error_Block*);
    void (*free)(void*, xdc_Ptr, xdc_SizeT);
    xdc_Bool (*isBlocking)(void*);
    void (*getStats)(void*, xdc_runtime_Memory_Stats*);
    xdc_runtime_Types_SysFxns2 __sfxns;
};

 
extern const xdc_runtime_Types_Base xdc_runtime_IHeap_Interface__BASE__C;




 

 

extern xdc_runtime_IHeap_Handle xdc_runtime_IHeap_create(xdc_runtime_IHeap_Module, const xdc_runtime_IHeap_Params *, xdc_runtime_Error_Block *__eb);

 

extern void xdc_runtime_IHeap_delete(xdc_runtime_IHeap_Handle *);

 
static inline xdc_runtime_IHeap_Module xdc_runtime_IHeap_Handle_to_Module( xdc_runtime_IHeap_Handle inst )
{
    return inst->__fxns;
}

 
static inline xdc_runtime_Types_Label *xdc_runtime_IHeap_Handle_label( xdc_runtime_IHeap_Handle inst, xdc_runtime_Types_Label *lab )
{
    return inst->__fxns->__sysp->__label(inst, lab);
}

 
static inline xdc_runtime_Types_ModuleId xdc_runtime_IHeap_Module_id( xdc_runtime_IHeap_Module mod )
{
    return mod->__sysp->__mid;
}

 
static inline xdc_Ptr xdc_runtime_IHeap_alloc( xdc_runtime_IHeap_Handle __inst, xdc_SizeT size, xdc_SizeT align, xdc_runtime_Error_Block *eb )
{
    return __inst->__fxns->alloc((void*)__inst, size, align, eb);
}

 
static inline void xdc_runtime_IHeap_free( xdc_runtime_IHeap_Handle __inst, xdc_Ptr block, xdc_SizeT size )
{
    __inst->__fxns->free((void*)__inst, block, size);
}

 
static inline xdc_Bool xdc_runtime_IHeap_isBlocking( xdc_runtime_IHeap_Handle __inst )
{
    return __inst->__fxns->isBlocking((void*)__inst);
}

 
static inline void xdc_runtime_IHeap_getStats( xdc_runtime_IHeap_Handle __inst, xdc_runtime_Memory_Stats *stats )
{
    __inst->__fxns->getStats((void*)__inst, stats);
}




 






 

 
typedef xdc_Ptr (*xdc_runtime_IHeap_alloc_FxnT)(void *, xdc_SizeT, xdc_SizeT, xdc_runtime_Error_Block*);
static inline xdc_runtime_IHeap_alloc_FxnT xdc_runtime_IHeap_alloc_fxnP( xdc_runtime_IHeap_Handle __inst )
{
    return (xdc_runtime_IHeap_alloc_FxnT)__inst->__fxns->alloc;
}

 
typedef void (*xdc_runtime_IHeap_free_FxnT)(void *, xdc_Ptr, xdc_SizeT);
static inline xdc_runtime_IHeap_free_FxnT xdc_runtime_IHeap_free_fxnP( xdc_runtime_IHeap_Handle __inst )
{
    return (xdc_runtime_IHeap_free_FxnT)__inst->__fxns->free;
}

 
typedef xdc_Bool (*xdc_runtime_IHeap_isBlocking_FxnT)(void *);
static inline xdc_runtime_IHeap_isBlocking_FxnT xdc_runtime_IHeap_isBlocking_fxnP( xdc_runtime_IHeap_Handle __inst )
{
    return (xdc_runtime_IHeap_isBlocking_FxnT)__inst->__fxns->isBlocking;
}

 
typedef void (*xdc_runtime_IHeap_getStats_FxnT)(void *, xdc_runtime_Memory_Stats*);
static inline xdc_runtime_IHeap_getStats_FxnT xdc_runtime_IHeap_getStats_fxnP( xdc_runtime_IHeap_Handle __inst )
{
    return (xdc_runtime_IHeap_getStats_FxnT)__inst->__fxns->getStats;
}




 










 

# 238 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IHeap.h"


 

# 56 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"




 

# 369 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"




 

# 425 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"


 

# 57 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"




 




 

 
struct xdc_runtime_IModule_Fxns__ {
    xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2 *__sysp;
    xdc_runtime_Types_SysFxns2 __sfxns;
};

 
extern const xdc_runtime_Types_Base xdc_runtime_IModule_Interface__BASE__C;




 

 
static inline xdc_runtime_Types_ModuleId xdc_runtime_IModule_Module_id( xdc_runtime_IModule_Module mod )
{
    return mod->__sysp->__mid;
}




 




 










 

# 121 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"


 

# 57 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Startup.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 58 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Startup.h"




 

 


 


 
typedef void (*xdc_runtime_Startup_InitFxn)(void);




 

 

extern void xdc_runtime_Startup_exec__I(void);

 
typedef xdc_Int (*xdc_runtime_Startup_SFxn)(xdc_Int);

 
struct xdc_runtime_Startup_IdMap {
    xdc_UInt ind;
    xdc_runtime_Types_ModuleId modId;
};




 

 
typedef xdc_Bits32 CT__xdc_runtime_Startup_Module__diagsEnabled;
extern  const CT__xdc_runtime_Startup_Module__diagsEnabled xdc_runtime_Startup_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_Startup_Module__diagsIncluded;
extern  const CT__xdc_runtime_Startup_Module__diagsIncluded xdc_runtime_Startup_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_Startup_Module__diagsMask;
extern  const CT__xdc_runtime_Startup_Module__diagsMask xdc_runtime_Startup_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_Startup_Module__gateObj;
extern  const CT__xdc_runtime_Startup_Module__gateObj xdc_runtime_Startup_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_Startup_Module__gatePrms;
extern  const CT__xdc_runtime_Startup_Module__gatePrms xdc_runtime_Startup_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Startup_Module__id;
extern  const CT__xdc_runtime_Startup_Module__id xdc_runtime_Startup_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_Startup_Module__loggerDefined;
extern  const CT__xdc_runtime_Startup_Module__loggerDefined xdc_runtime_Startup_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_Startup_Module__loggerObj;
extern  const CT__xdc_runtime_Startup_Module__loggerObj xdc_runtime_Startup_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Startup_Module__loggerFxn0;
extern  const CT__xdc_runtime_Startup_Module__loggerFxn0 xdc_runtime_Startup_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Startup_Module__loggerFxn1;
extern  const CT__xdc_runtime_Startup_Module__loggerFxn1 xdc_runtime_Startup_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Startup_Module__loggerFxn2;
extern  const CT__xdc_runtime_Startup_Module__loggerFxn2 xdc_runtime_Startup_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Startup_Module__loggerFxn4;
extern  const CT__xdc_runtime_Startup_Module__loggerFxn4 xdc_runtime_Startup_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Startup_Module__loggerFxn8;
extern  const CT__xdc_runtime_Startup_Module__loggerFxn8 xdc_runtime_Startup_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_Startup_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_Startup_Module__startupDoneFxn xdc_runtime_Startup_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_Startup_Object__count;
extern  const CT__xdc_runtime_Startup_Object__count xdc_runtime_Startup_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Startup_Object__heap;
extern  const CT__xdc_runtime_Startup_Object__heap xdc_runtime_Startup_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_Startup_Object__sizeof;
extern  const CT__xdc_runtime_Startup_Object__sizeof xdc_runtime_Startup_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_Startup_Object__table;
extern  const CT__xdc_runtime_Startup_Object__table xdc_runtime_Startup_Object__table__C;

 




typedef xdc_Int CT__xdc_runtime_Startup_maxPasses;
extern  const CT__xdc_runtime_Startup_maxPasses xdc_runtime_Startup_maxPasses__C;


 

typedef xdc_runtime_Startup_InitFxn __T1_xdc_runtime_Startup_firstFxns;
typedef struct { int length; xdc_runtime_Startup_InitFxn *elem; } __ARRAY1_xdc_runtime_Startup_firstFxns;
typedef __ARRAY1_xdc_runtime_Startup_firstFxns __TA_xdc_runtime_Startup_firstFxns;
typedef __TA_xdc_runtime_Startup_firstFxns CT__xdc_runtime_Startup_firstFxns;
extern  const CT__xdc_runtime_Startup_firstFxns xdc_runtime_Startup_firstFxns__C;

 

typedef xdc_runtime_Startup_InitFxn __T1_xdc_runtime_Startup_lastFxns;
typedef struct { int length; xdc_runtime_Startup_InitFxn *elem; } __ARRAY1_xdc_runtime_Startup_lastFxns;
typedef __ARRAY1_xdc_runtime_Startup_lastFxns __TA_xdc_runtime_Startup_lastFxns;
typedef __TA_xdc_runtime_Startup_lastFxns CT__xdc_runtime_Startup_lastFxns;
extern  const CT__xdc_runtime_Startup_lastFxns xdc_runtime_Startup_lastFxns__C;

 

typedef void (*CT__xdc_runtime_Startup_startModsFxn)(xdc_Int[], xdc_Int);
extern  const CT__xdc_runtime_Startup_startModsFxn xdc_runtime_Startup_startModsFxn__C;

 

typedef void (*CT__xdc_runtime_Startup_execImpl)(void);
extern  const CT__xdc_runtime_Startup_execImpl xdc_runtime_Startup_execImpl__C;

 

typedef xdc_runtime_Startup_SFxn __T1_xdc_runtime_Startup_sfxnTab;
typedef xdc_runtime_Startup_SFxn *__ARRAY1_xdc_runtime_Startup_sfxnTab;
typedef __ARRAY1_xdc_runtime_Startup_sfxnTab __TA_xdc_runtime_Startup_sfxnTab;
typedef __TA_xdc_runtime_Startup_sfxnTab CT__xdc_runtime_Startup_sfxnTab;
extern  const CT__xdc_runtime_Startup_sfxnTab xdc_runtime_Startup_sfxnTab__C;

 

typedef xdc_Bool __T1_xdc_runtime_Startup_sfxnRts;
typedef xdc_Bool *__ARRAY1_xdc_runtime_Startup_sfxnRts;
typedef __ARRAY1_xdc_runtime_Startup_sfxnRts __TA_xdc_runtime_Startup_sfxnRts;
typedef __TA_xdc_runtime_Startup_sfxnRts CT__xdc_runtime_Startup_sfxnRts;
extern  const CT__xdc_runtime_Startup_sfxnRts xdc_runtime_Startup_sfxnRts__C;




 

 


 

extern xdc_Bool xdc_runtime_Startup_Module__startupDone__S( void );

 


extern void xdc_runtime_Startup_exec__E( void );

 


extern xdc_Bool xdc_runtime_Startup_rtsDone__E( void );

 


extern void xdc_runtime_Startup_reset__I( void );

 


extern void xdc_runtime_Startup_startMods__I( xdc_Int state[], xdc_Int len );

 


extern xdc_Int xdc_runtime_Startup_getState__I( xdc_runtime_Types_ModuleId id );




 

 


 


 


 
static inline CT__xdc_runtime_Startup_Module__id xdc_runtime_Startup_Module_id( void ) 
{
    return xdc_runtime_Startup_Module__id__C;
}

 
static inline xdc_Bool xdc_runtime_Startup_Module_hasMask( void ) 
{
    return xdc_runtime_Startup_Module__diagsMask__C != 0;
}

 
static inline xdc_Bits16 xdc_runtime_Startup_Module_getMask( void ) 
{
    return xdc_runtime_Startup_Module__diagsMask__C != 0 ? *xdc_runtime_Startup_Module__diagsMask__C : 0;
}

 
static inline void xdc_runtime_Startup_Module_setMask( xdc_Bits16 mask ) 
{
    if (xdc_runtime_Startup_Module__diagsMask__C != 0) *xdc_runtime_Startup_Module__diagsMask__C = mask;
}




 










 

# 328 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Startup.h"




 






 
# 365 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Startup.h"





 

# 18 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.c"

# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Gate.h"





 















 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 54 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Gate.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Gate__prologue.h"











 
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"





 















 




 

# 207 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"




 

# 222 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"



 

# 248 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"


 

# 14 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Gate__prologue.h"

typedef xdc_runtime_Types_GateRef xdc_runtime_Gate_Ref;




























 

# 55 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Gate.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"





 













 




 

# 104 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"




 

# 121 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"


 

# 58 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Gate.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"





 














 




 

# 192 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"




 

# 227 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"


 

# 59 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Gate.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"




 

# 369 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"




 

# 425 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"


 

# 60 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Gate.h"




 

 




 




 

 
typedef xdc_Bits32 CT__xdc_runtime_Gate_Module__diagsEnabled;
extern  const CT__xdc_runtime_Gate_Module__diagsEnabled xdc_runtime_Gate_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_Gate_Module__diagsIncluded;
extern  const CT__xdc_runtime_Gate_Module__diagsIncluded xdc_runtime_Gate_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_Gate_Module__diagsMask;
extern  const CT__xdc_runtime_Gate_Module__diagsMask xdc_runtime_Gate_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_Gate_Module__gateObj;
extern  const CT__xdc_runtime_Gate_Module__gateObj xdc_runtime_Gate_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_Gate_Module__gatePrms;
extern  const CT__xdc_runtime_Gate_Module__gatePrms xdc_runtime_Gate_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Gate_Module__id;
extern  const CT__xdc_runtime_Gate_Module__id xdc_runtime_Gate_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_Gate_Module__loggerDefined;
extern  const CT__xdc_runtime_Gate_Module__loggerDefined xdc_runtime_Gate_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_Gate_Module__loggerObj;
extern  const CT__xdc_runtime_Gate_Module__loggerObj xdc_runtime_Gate_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Gate_Module__loggerFxn0;
extern  const CT__xdc_runtime_Gate_Module__loggerFxn0 xdc_runtime_Gate_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Gate_Module__loggerFxn1;
extern  const CT__xdc_runtime_Gate_Module__loggerFxn1 xdc_runtime_Gate_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Gate_Module__loggerFxn2;
extern  const CT__xdc_runtime_Gate_Module__loggerFxn2 xdc_runtime_Gate_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Gate_Module__loggerFxn4;
extern  const CT__xdc_runtime_Gate_Module__loggerFxn4 xdc_runtime_Gate_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Gate_Module__loggerFxn8;
extern  const CT__xdc_runtime_Gate_Module__loggerFxn8 xdc_runtime_Gate_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_Gate_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_Gate_Module__startupDoneFxn xdc_runtime_Gate_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_Gate_Object__count;
extern  const CT__xdc_runtime_Gate_Object__count xdc_runtime_Gate_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Gate_Object__heap;
extern  const CT__xdc_runtime_Gate_Object__heap xdc_runtime_Gate_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_Gate_Object__sizeof;
extern  const CT__xdc_runtime_Gate_Object__sizeof xdc_runtime_Gate_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_Gate_Object__table;
extern  const CT__xdc_runtime_Gate_Object__table xdc_runtime_Gate_Object__table__C;




 

 


 

extern xdc_Bool xdc_runtime_Gate_Module__startupDone__S( void );

 


extern xdc_IArg xdc_runtime_Gate_enterSystem__E( void );

 


extern void xdc_runtime_Gate_leaveSystem__E( xdc_IArg key );




 

 


 


 


 
static inline CT__xdc_runtime_Gate_Module__id xdc_runtime_Gate_Module_id( void ) 
{
    return xdc_runtime_Gate_Module__id__C;
}

 
static inline xdc_Bool xdc_runtime_Gate_Module_hasMask( void ) 
{
    return xdc_runtime_Gate_Module__diagsMask__C != 0;
}

 
static inline xdc_Bits16 xdc_runtime_Gate_Module_getMask( void ) 
{
    return xdc_runtime_Gate_Module__diagsMask__C != 0 ? *xdc_runtime_Gate_Module__diagsMask__C : 0;
}

 
static inline void xdc_runtime_Gate_Module_setMask( xdc_Bits16 mask ) 
{
    if (xdc_runtime_Gate_Module__diagsMask__C != 0) *xdc_runtime_Gate_Module__diagsMask__C = mask;
}




 

# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Gate__epilogue.h"











 

























 

# 216 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Gate.h"










 

# 237 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Gate.h"



 






 
# 268 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Gate.h"





 

# 20 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.c"

# 1 "C:\\ti\\xdctools_3_31_01_33_core\\packages\\xdc\\runtime\\package/internal/System.xdc.h"





 








# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.h"





 















 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 54 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"





 













 




 

# 104 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"




 

# 121 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"


 

# 57 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert.h"





 















 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 54 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert__prologue.h"











 


 
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"





 















 




 

# 207 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"




 

# 222 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"



 

# 248 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"


 

# 17 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert__prologue.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags.h"





 















 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 54 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags__prologue.h"











 









 
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"





 















 




 

# 207 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"




 

# 222 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"



 

# 248 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Main.h"


 

# 24 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags__prologue.h"






 









 










 






 





 






 

# 55 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"





 













 




 

# 104 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"




 

# 121 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"


 

# 58 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 59 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags.h"




 

 
typedef xdc_runtime_Types_DiagsMask xdc_runtime_Diags_Mask;

 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 
enum xdc_runtime_Diags_EventLevel {
    xdc_runtime_Diags_LEVEL1 = 0x0,
    xdc_runtime_Diags_LEVEL2 = 0x20,
    xdc_runtime_Diags_LEVEL3 = 0x40,
    xdc_runtime_Diags_LEVEL4 = 0x60
};
typedef enum xdc_runtime_Diags_EventLevel xdc_runtime_Diags_EventLevel;

 


 


 


 





 

 
struct xdc_runtime_Diags_DictElem {
    xdc_runtime_Types_ModuleId modId;
    xdc_runtime_Diags_Mask *maskAddr;
};




 

 
typedef xdc_Bits32 CT__xdc_runtime_Diags_Module__diagsEnabled;
extern  const CT__xdc_runtime_Diags_Module__diagsEnabled xdc_runtime_Diags_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_Diags_Module__diagsIncluded;
extern  const CT__xdc_runtime_Diags_Module__diagsIncluded xdc_runtime_Diags_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_Diags_Module__diagsMask;
extern  const CT__xdc_runtime_Diags_Module__diagsMask xdc_runtime_Diags_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_Diags_Module__gateObj;
extern  const CT__xdc_runtime_Diags_Module__gateObj xdc_runtime_Diags_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_Diags_Module__gatePrms;
extern  const CT__xdc_runtime_Diags_Module__gatePrms xdc_runtime_Diags_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Diags_Module__id;
extern  const CT__xdc_runtime_Diags_Module__id xdc_runtime_Diags_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_Diags_Module__loggerDefined;
extern  const CT__xdc_runtime_Diags_Module__loggerDefined xdc_runtime_Diags_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_Diags_Module__loggerObj;
extern  const CT__xdc_runtime_Diags_Module__loggerObj xdc_runtime_Diags_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Diags_Module__loggerFxn0;
extern  const CT__xdc_runtime_Diags_Module__loggerFxn0 xdc_runtime_Diags_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Diags_Module__loggerFxn1;
extern  const CT__xdc_runtime_Diags_Module__loggerFxn1 xdc_runtime_Diags_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Diags_Module__loggerFxn2;
extern  const CT__xdc_runtime_Diags_Module__loggerFxn2 xdc_runtime_Diags_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Diags_Module__loggerFxn4;
extern  const CT__xdc_runtime_Diags_Module__loggerFxn4 xdc_runtime_Diags_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Diags_Module__loggerFxn8;
extern  const CT__xdc_runtime_Diags_Module__loggerFxn8 xdc_runtime_Diags_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_Diags_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_Diags_Module__startupDoneFxn xdc_runtime_Diags_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_Diags_Object__count;
extern  const CT__xdc_runtime_Diags_Object__count xdc_runtime_Diags_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Diags_Object__heap;
extern  const CT__xdc_runtime_Diags_Object__heap xdc_runtime_Diags_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_Diags_Object__sizeof;
extern  const CT__xdc_runtime_Diags_Object__sizeof xdc_runtime_Diags_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_Diags_Object__table;
extern  const CT__xdc_runtime_Diags_Object__table xdc_runtime_Diags_Object__table__C;

 




typedef xdc_Bool CT__xdc_runtime_Diags_setMaskEnabled;
extern  const CT__xdc_runtime_Diags_setMaskEnabled xdc_runtime_Diags_setMaskEnabled__C;


 

typedef xdc_runtime_Diags_DictElem *CT__xdc_runtime_Diags_dictBase;
extern  const CT__xdc_runtime_Diags_dictBase xdc_runtime_Diags_dictBase__C;




 

 


 

extern xdc_Bool xdc_runtime_Diags_Module__startupDone__S( void );

 


extern void xdc_runtime_Diags_setMask__E( xdc_CString control );




 

 


 


 


 
static inline CT__xdc_runtime_Diags_Module__id xdc_runtime_Diags_Module_id( void ) 
{
    return xdc_runtime_Diags_Module__id__C;
}

 
static inline xdc_Bool xdc_runtime_Diags_Module_hasMask( void ) 
{
    return xdc_runtime_Diags_Module__diagsMask__C != 0;
}

 
static inline xdc_Bits16 xdc_runtime_Diags_Module_getMask( void ) 
{
    return xdc_runtime_Diags_Module__diagsMask__C != 0 ? *xdc_runtime_Diags_Module__diagsMask__C : 0;
}

 
static inline void xdc_runtime_Diags_Module_setMask( xdc_Bits16 mask ) 
{
    if (xdc_runtime_Diags_Module__diagsMask__C != 0) *xdc_runtime_Diags_Module__diagsMask__C = mask;
}




 

# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags__epilogue.h"











 
















 








 








 




 

# 309 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags.h"










 

# 330 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags.h"



 

# 389 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags.h"


 

# 18 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert__prologue.h"



 
typedef xdc_Bits32 xdc_runtime_Assert_Id;











 

 






 

# 55 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"





 













 




 

# 104 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"




 

# 121 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"


 

# 58 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags.h"





 















 




 

# 315 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags.h"




 

# 330 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags.h"



 

# 389 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Diags.h"


 

# 59 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"




 

# 369 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"




 

# 425 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Error.h"


 

# 60 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 61 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert.h"




 

 




 




 

 
typedef xdc_Bits32 CT__xdc_runtime_Assert_Module__diagsEnabled;
extern  const CT__xdc_runtime_Assert_Module__diagsEnabled xdc_runtime_Assert_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_Assert_Module__diagsIncluded;
extern  const CT__xdc_runtime_Assert_Module__diagsIncluded xdc_runtime_Assert_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_Assert_Module__diagsMask;
extern  const CT__xdc_runtime_Assert_Module__diagsMask xdc_runtime_Assert_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_Assert_Module__gateObj;
extern  const CT__xdc_runtime_Assert_Module__gateObj xdc_runtime_Assert_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_Assert_Module__gatePrms;
extern  const CT__xdc_runtime_Assert_Module__gatePrms xdc_runtime_Assert_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Assert_Module__id;
extern  const CT__xdc_runtime_Assert_Module__id xdc_runtime_Assert_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_Assert_Module__loggerDefined;
extern  const CT__xdc_runtime_Assert_Module__loggerDefined xdc_runtime_Assert_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_Assert_Module__loggerObj;
extern  const CT__xdc_runtime_Assert_Module__loggerObj xdc_runtime_Assert_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Assert_Module__loggerFxn0;
extern  const CT__xdc_runtime_Assert_Module__loggerFxn0 xdc_runtime_Assert_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Assert_Module__loggerFxn1;
extern  const CT__xdc_runtime_Assert_Module__loggerFxn1 xdc_runtime_Assert_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Assert_Module__loggerFxn2;
extern  const CT__xdc_runtime_Assert_Module__loggerFxn2 xdc_runtime_Assert_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Assert_Module__loggerFxn4;
extern  const CT__xdc_runtime_Assert_Module__loggerFxn4 xdc_runtime_Assert_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Assert_Module__loggerFxn8;
extern  const CT__xdc_runtime_Assert_Module__loggerFxn8 xdc_runtime_Assert_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_Assert_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_Assert_Module__startupDoneFxn xdc_runtime_Assert_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_Assert_Object__count;
extern  const CT__xdc_runtime_Assert_Object__count xdc_runtime_Assert_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Assert_Object__heap;
extern  const CT__xdc_runtime_Assert_Object__heap xdc_runtime_Assert_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_Assert_Object__sizeof;
extern  const CT__xdc_runtime_Assert_Object__sizeof xdc_runtime_Assert_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_Assert_Object__table;
extern  const CT__xdc_runtime_Assert_Object__table xdc_runtime_Assert_Object__table__C;

 

typedef xdc_runtime_Error_Id CT__xdc_runtime_Assert_E_assertFailed;
extern  const CT__xdc_runtime_Assert_E_assertFailed xdc_runtime_Assert_E_assertFailed__C;




 

 


 

extern xdc_Bool xdc_runtime_Assert_Module__startupDone__S( void );

 


extern void xdc_runtime_Assert_raise__I( xdc_runtime_Types_ModuleId mod, xdc_CString file, xdc_Int line, xdc_runtime_Assert_Id id );




 

 


 


 


 
static inline CT__xdc_runtime_Assert_Module__id xdc_runtime_Assert_Module_id( void ) 
{
    return xdc_runtime_Assert_Module__id__C;
}

 
static inline xdc_Bool xdc_runtime_Assert_Module_hasMask( void ) 
{
    return xdc_runtime_Assert_Module__diagsMask__C != 0;
}

 
static inline xdc_Bits16 xdc_runtime_Assert_Module_getMask( void ) 
{
    return xdc_runtime_Assert_Module__diagsMask__C != 0 ? *xdc_runtime_Assert_Module__diagsMask__C : 0;
}

 
static inline void xdc_runtime_Assert_Module_setMask( xdc_Bits16 mask ) 
{
    if (xdc_runtime_Assert_Module__diagsMask__C != 0) *xdc_runtime_Assert_Module__diagsMask__C = mask;
}




 

# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert__epilogue.h"











 




 







 
# 46 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert__epilogue.h"






 

# 217 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert.h"










 

# 238 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert.h"



 

# 264 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Assert.h"


 

# 58 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/ISystemSupport.h"





 













 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 52 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/ISystemSupport.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"





 













 




 

# 104 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"




 

# 121 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IModule.h"


 

# 55 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/ISystemSupport.h"




 




 

 
struct xdc_runtime_ISystemSupport_Fxns__ {
    xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2 *__sysp;
    void (*abort)(xdc_CString);
    void (*exit)(xdc_Int);
    void (*flush)(void);
    void (*putch)(xdc_Char);
    xdc_Bool (*ready)(void);
    xdc_runtime_Types_SysFxns2 __sfxns;
};

 
extern const xdc_runtime_Types_Base xdc_runtime_ISystemSupport_Interface__BASE__C;




 

 
static inline xdc_runtime_Types_ModuleId xdc_runtime_ISystemSupport_Module_id( xdc_runtime_ISystemSupport_Module mod )
{
    return mod->__sysp->__mid;
}

 
static inline void xdc_runtime_ISystemSupport_abort( xdc_runtime_ISystemSupport_Module __inst, xdc_CString str )
{
    __inst->abort(str);
}

 
static inline void xdc_runtime_ISystemSupport_exit( xdc_runtime_ISystemSupport_Module __inst, xdc_Int stat )
{
    __inst->exit(stat);
}

 
static inline void xdc_runtime_ISystemSupport_flush( xdc_runtime_ISystemSupport_Module __inst )
{
    __inst->flush();
}

 
static inline void xdc_runtime_ISystemSupport_putch( xdc_runtime_ISystemSupport_Module __inst, xdc_Char ch )
{
    __inst->putch(ch);
}

 
static inline xdc_Bool xdc_runtime_ISystemSupport_ready( xdc_runtime_ISystemSupport_Module __inst )
{
    return __inst->ready();
}




 






 

 
typedef void (*xdc_runtime_ISystemSupport_abort_FxnT)(xdc_CString);
static inline xdc_runtime_ISystemSupport_abort_FxnT xdc_runtime_ISystemSupport_abort_fxnP( xdc_runtime_ISystemSupport_Module __inst )
{
    return (xdc_runtime_ISystemSupport_abort_FxnT)__inst->abort;
}

 
typedef void (*xdc_runtime_ISystemSupport_exit_FxnT)(xdc_Int);
static inline xdc_runtime_ISystemSupport_exit_FxnT xdc_runtime_ISystemSupport_exit_fxnP( xdc_runtime_ISystemSupport_Module __inst )
{
    return (xdc_runtime_ISystemSupport_exit_FxnT)__inst->exit;
}

 
typedef void (*xdc_runtime_ISystemSupport_flush_FxnT)(void);
static inline xdc_runtime_ISystemSupport_flush_FxnT xdc_runtime_ISystemSupport_flush_fxnP( xdc_runtime_ISystemSupport_Module __inst )
{
    return (xdc_runtime_ISystemSupport_flush_FxnT)__inst->flush;
}

 
typedef void (*xdc_runtime_ISystemSupport_putch_FxnT)(xdc_Char);
static inline xdc_runtime_ISystemSupport_putch_FxnT xdc_runtime_ISystemSupport_putch_fxnP( xdc_runtime_ISystemSupport_Module __inst )
{
    return (xdc_runtime_ISystemSupport_putch_FxnT)__inst->putch;
}

 
typedef xdc_Bool (*xdc_runtime_ISystemSupport_ready_FxnT)(void);
static inline xdc_runtime_ISystemSupport_ready_FxnT xdc_runtime_ISystemSupport_ready_fxnP( xdc_runtime_ISystemSupport_Module __inst )
{
    return (xdc_runtime_ISystemSupport_ready_FxnT)__inst->ready;
}




 










 

# 211 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/ISystemSupport.h"


 

# 59 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"





 














 




 

# 192 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"




 

# 227 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"


 

# 60 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_SupportProxy.h"





 















 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 54 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_SupportProxy.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/ISystemSupport.h"





 













 




 

# 179 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/ISystemSupport.h"




 

# 211 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/ISystemSupport.h"


 

# 57 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_SupportProxy.h"




 




 

 
typedef xdc_Bits32 CT__xdc_runtime_System_SupportProxy_Module__diagsEnabled;
extern  const CT__xdc_runtime_System_SupportProxy_Module__diagsEnabled xdc_runtime_System_SupportProxy_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_System_SupportProxy_Module__diagsIncluded;
extern  const CT__xdc_runtime_System_SupportProxy_Module__diagsIncluded xdc_runtime_System_SupportProxy_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_System_SupportProxy_Module__diagsMask;
extern  const CT__xdc_runtime_System_SupportProxy_Module__diagsMask xdc_runtime_System_SupportProxy_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_System_SupportProxy_Module__gateObj;
extern  const CT__xdc_runtime_System_SupportProxy_Module__gateObj xdc_runtime_System_SupportProxy_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_System_SupportProxy_Module__gatePrms;
extern  const CT__xdc_runtime_System_SupportProxy_Module__gatePrms xdc_runtime_System_SupportProxy_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_System_SupportProxy_Module__id;
extern  const CT__xdc_runtime_System_SupportProxy_Module__id xdc_runtime_System_SupportProxy_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_System_SupportProxy_Module__loggerDefined;
extern  const CT__xdc_runtime_System_SupportProxy_Module__loggerDefined xdc_runtime_System_SupportProxy_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_System_SupportProxy_Module__loggerObj;
extern  const CT__xdc_runtime_System_SupportProxy_Module__loggerObj xdc_runtime_System_SupportProxy_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_System_SupportProxy_Module__loggerFxn0;
extern  const CT__xdc_runtime_System_SupportProxy_Module__loggerFxn0 xdc_runtime_System_SupportProxy_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_System_SupportProxy_Module__loggerFxn1;
extern  const CT__xdc_runtime_System_SupportProxy_Module__loggerFxn1 xdc_runtime_System_SupportProxy_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_System_SupportProxy_Module__loggerFxn2;
extern  const CT__xdc_runtime_System_SupportProxy_Module__loggerFxn2 xdc_runtime_System_SupportProxy_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_System_SupportProxy_Module__loggerFxn4;
extern  const CT__xdc_runtime_System_SupportProxy_Module__loggerFxn4 xdc_runtime_System_SupportProxy_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_System_SupportProxy_Module__loggerFxn8;
extern  const CT__xdc_runtime_System_SupportProxy_Module__loggerFxn8 xdc_runtime_System_SupportProxy_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_System_SupportProxy_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_System_SupportProxy_Module__startupDoneFxn xdc_runtime_System_SupportProxy_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_System_SupportProxy_Object__count;
extern  const CT__xdc_runtime_System_SupportProxy_Object__count xdc_runtime_System_SupportProxy_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_System_SupportProxy_Object__heap;
extern  const CT__xdc_runtime_System_SupportProxy_Object__heap xdc_runtime_System_SupportProxy_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_System_SupportProxy_Object__sizeof;
extern  const CT__xdc_runtime_System_SupportProxy_Object__sizeof xdc_runtime_System_SupportProxy_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_System_SupportProxy_Object__table;
extern  const CT__xdc_runtime_System_SupportProxy_Object__table xdc_runtime_System_SupportProxy_Object__table__C;




 

 
struct xdc_runtime_System_SupportProxy_Fxns__ {
    xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2 *__sysp;
    void (*abort)(xdc_CString);
    void (*exit)(xdc_Int);
    void (*flush)(void);
    void (*putch)(xdc_Char);
    xdc_Bool (*ready)(void);
    xdc_runtime_Types_SysFxns2 __sfxns;
};

 
extern const xdc_runtime_System_SupportProxy_Fxns__ xdc_runtime_System_SupportProxy_Module__FXNS__C;




 

 


 

extern xdc_runtime_Types_Label *xdc_runtime_System_SupportProxy_Handle__label__S( xdc_Ptr obj, xdc_runtime_Types_Label *lab );

 

extern xdc_Bool xdc_runtime_System_SupportProxy_Module__startupDone__S( void );

 

extern xdc_Ptr xdc_runtime_System_SupportProxy_Object__create__S( xdc_Ptr __oa, xdc_SizeT __osz, xdc_Ptr __aa, const xdc_UChar *__pa, xdc_SizeT __psz, xdc_runtime_Error_Block *__eb );

 

extern void xdc_runtime_System_SupportProxy_Object__delete__S( xdc_Ptr instp );

 

extern void xdc_runtime_System_SupportProxy_Object__destruct__S( xdc_Ptr objp );

 

extern xdc_Ptr xdc_runtime_System_SupportProxy_Object__get__S( xdc_Ptr oarr, xdc_Int i );

 

extern xdc_Ptr xdc_runtime_System_SupportProxy_Object__first__S( void );

 

extern xdc_Ptr xdc_runtime_System_SupportProxy_Object__next__S( xdc_Ptr obj );

 

extern void xdc_runtime_System_SupportProxy_Params__init__S( xdc_Ptr dst, const void *src, xdc_SizeT psz, xdc_SizeT isz );

 

extern xdc_Bool xdc_runtime_System_SupportProxy_Proxy__abstract__S( void );

 

extern xdc_Ptr xdc_runtime_System_SupportProxy_Proxy__delegate__S( void );

 


extern void xdc_runtime_System_SupportProxy_abort__E( xdc_CString str );

 


extern void xdc_runtime_System_SupportProxy_exit__E( xdc_Int stat );

 


extern void xdc_runtime_System_SupportProxy_flush__E( void );

 


extern void xdc_runtime_System_SupportProxy_putch__E( xdc_Char ch );

 


extern xdc_Bool xdc_runtime_System_SupportProxy_ready__E( void );




 

 
static inline xdc_runtime_ISystemSupport_Module xdc_runtime_System_SupportProxy_Module_upCast( void )
{
    return (xdc_runtime_ISystemSupport_Module)xdc_runtime_System_SupportProxy_Proxy__delegate__S();
}

 





 

 


 


 


 
static inline CT__xdc_runtime_System_SupportProxy_Module__id xdc_runtime_System_SupportProxy_Module_id( void ) 
{
    return xdc_runtime_System_SupportProxy_Module__id__C;
}

 


 





 










 

# 61 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_Module_GateProxy.h"





 
















 




 




















 



# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"





 















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"




 

# 362 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"



 

# 423 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/Types.h"


 

# 55 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_Module_GateProxy.h"
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"





 














 




 

# 132 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"




 

# 155 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IInstance.h"


 

# 56 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_Module_GateProxy.h"


# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"





 














 




 

# 192 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"




 

# 227 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/IGateProvider.h"


 

# 59 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_Module_GateProxy.h"




 

 


 





 

 
typedef xdc_Bits32 CT__xdc_runtime_System_Module_GateProxy_Module__diagsEnabled;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__diagsEnabled xdc_runtime_System_Module_GateProxy_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_System_Module_GateProxy_Module__diagsIncluded;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__diagsIncluded xdc_runtime_System_Module_GateProxy_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_System_Module_GateProxy_Module__diagsMask;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__diagsMask xdc_runtime_System_Module_GateProxy_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_System_Module_GateProxy_Module__gateObj;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__gateObj xdc_runtime_System_Module_GateProxy_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_System_Module_GateProxy_Module__gatePrms;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__gatePrms xdc_runtime_System_Module_GateProxy_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_System_Module_GateProxy_Module__id;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__id xdc_runtime_System_Module_GateProxy_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_System_Module_GateProxy_Module__loggerDefined;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__loggerDefined xdc_runtime_System_Module_GateProxy_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_System_Module_GateProxy_Module__loggerObj;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__loggerObj xdc_runtime_System_Module_GateProxy_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_System_Module_GateProxy_Module__loggerFxn0;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__loggerFxn0 xdc_runtime_System_Module_GateProxy_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_System_Module_GateProxy_Module__loggerFxn1;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__loggerFxn1 xdc_runtime_System_Module_GateProxy_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_System_Module_GateProxy_Module__loggerFxn2;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__loggerFxn2 xdc_runtime_System_Module_GateProxy_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_System_Module_GateProxy_Module__loggerFxn4;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__loggerFxn4 xdc_runtime_System_Module_GateProxy_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_System_Module_GateProxy_Module__loggerFxn8;
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__loggerFxn8 xdc_runtime_System_Module_GateProxy_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_System_Module_GateProxy_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_System_Module_GateProxy_Module__startupDoneFxn xdc_runtime_System_Module_GateProxy_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_System_Module_GateProxy_Object__count;
extern  const CT__xdc_runtime_System_Module_GateProxy_Object__count xdc_runtime_System_Module_GateProxy_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_System_Module_GateProxy_Object__heap;
extern  const CT__xdc_runtime_System_Module_GateProxy_Object__heap xdc_runtime_System_Module_GateProxy_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_System_Module_GateProxy_Object__sizeof;
extern  const CT__xdc_runtime_System_Module_GateProxy_Object__sizeof xdc_runtime_System_Module_GateProxy_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_System_Module_GateProxy_Object__table;
extern  const CT__xdc_runtime_System_Module_GateProxy_Object__table xdc_runtime_System_Module_GateProxy_Object__table__C;




 

 
struct xdc_runtime_System_Module_GateProxy_Params {
    size_t __size;
    const void *__self;
    void *__fxns;
    xdc_runtime_IInstance_Params *instance;
    xdc_runtime_IInstance_Params __iprms;
};

 
struct xdc_runtime_System_Module_GateProxy_Struct {
    const xdc_runtime_System_Module_GateProxy_Fxns__ *__fxns;
    xdc_runtime_Types_CordAddr __name;
};




 

 
struct xdc_runtime_System_Module_GateProxy_Fxns__ {
    xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2 *__sysp;
    xdc_Bool (*query)(xdc_Int);
    xdc_IArg (*enter)(xdc_runtime_System_Module_GateProxy_Handle);
    void (*leave)(xdc_runtime_System_Module_GateProxy_Handle, xdc_IArg);
    xdc_runtime_Types_SysFxns2 __sfxns;
};

 
extern const xdc_runtime_System_Module_GateProxy_Fxns__ xdc_runtime_System_Module_GateProxy_Module__FXNS__C;




 

 


 

extern xdc_runtime_Types_Label *xdc_runtime_System_Module_GateProxy_Handle__label__S( xdc_Ptr obj, xdc_runtime_Types_Label *lab );

 

extern xdc_Bool xdc_runtime_System_Module_GateProxy_Module__startupDone__S( void );

 

extern xdc_Ptr xdc_runtime_System_Module_GateProxy_Object__create__S( xdc_Ptr __oa, xdc_SizeT __osz, xdc_Ptr __aa, const xdc_UChar *__pa, xdc_SizeT __psz, xdc_runtime_Error_Block *__eb );

 

extern xdc_runtime_System_Module_GateProxy_Handle xdc_runtime_System_Module_GateProxy_create( const xdc_runtime_System_Module_GateProxy_Params *__prms, xdc_runtime_Error_Block *__eb );

 

extern void xdc_runtime_System_Module_GateProxy_Object__delete__S( xdc_Ptr instp );

 

extern void xdc_runtime_System_Module_GateProxy_delete(xdc_runtime_System_Module_GateProxy_Handle *instp);

 

extern void xdc_runtime_System_Module_GateProxy_Object__destruct__S( xdc_Ptr objp );

 

extern xdc_Ptr xdc_runtime_System_Module_GateProxy_Object__get__S( xdc_Ptr oarr, xdc_Int i );

 

extern xdc_Ptr xdc_runtime_System_Module_GateProxy_Object__first__S( void );

 

extern xdc_Ptr xdc_runtime_System_Module_GateProxy_Object__next__S( xdc_Ptr obj );

 

extern void xdc_runtime_System_Module_GateProxy_Params__init__S( xdc_Ptr dst, const void *src, xdc_SizeT psz, xdc_SizeT isz );

 

extern xdc_Bool xdc_runtime_System_Module_GateProxy_Proxy__abstract__S( void );

 

extern xdc_Ptr xdc_runtime_System_Module_GateProxy_Proxy__delegate__S( void );

 


extern xdc_Bool xdc_runtime_System_Module_GateProxy_query__E( xdc_Int qual );

 


extern xdc_IArg xdc_runtime_System_Module_GateProxy_enter__E( xdc_runtime_System_Module_GateProxy_Handle __inst );

 


extern void xdc_runtime_System_Module_GateProxy_leave__E( xdc_runtime_System_Module_GateProxy_Handle __inst, xdc_IArg key );




 

 
static inline xdc_runtime_IGateProvider_Module xdc_runtime_System_Module_GateProxy_Module_upCast( void )
{
    return (xdc_runtime_IGateProvider_Module)xdc_runtime_System_Module_GateProxy_Proxy__delegate__S();
}

 


 
static inline xdc_runtime_IGateProvider_Handle xdc_runtime_System_Module_GateProxy_Handle_upCast( xdc_runtime_System_Module_GateProxy_Handle i )
{
    return (xdc_runtime_IGateProvider_Handle)i;
}

 


 
static inline xdc_runtime_System_Module_GateProxy_Handle xdc_runtime_System_Module_GateProxy_Handle_downCast( xdc_runtime_IGateProvider_Handle i )
{
    xdc_runtime_IGateProvider_Handle i2 = (xdc_runtime_IGateProvider_Handle)i;
if (xdc_runtime_System_Module_GateProxy_Proxy__abstract__S()) return (xdc_runtime_System_Module_GateProxy_Handle)i;
    return (void*)i2->__fxns == (void*)xdc_runtime_System_Module_GateProxy_Proxy__delegate__S() ? (xdc_runtime_System_Module_GateProxy_Handle)i : 0;
}

 





 

 


 


 


 
static inline CT__xdc_runtime_System_Module_GateProxy_Module__id xdc_runtime_System_Module_GateProxy_Module_id( void ) 
{
    return xdc_runtime_System_Module_GateProxy_Module__id__C;
}

 


 


 
static inline void xdc_runtime_System_Module_GateProxy_Params_init( xdc_runtime_System_Module_GateProxy_Params *prms ) 
{
    if (prms) {
        xdc_runtime_System_Module_GateProxy_Params__init__S(prms, 0, sizeof(xdc_runtime_System_Module_GateProxy_Params), sizeof(xdc_runtime_IInstance_Params));
    }
}

 
static inline void xdc_runtime_System_Module_GateProxy_Params_copy(xdc_runtime_System_Module_GateProxy_Params *dst, const xdc_runtime_System_Module_GateProxy_Params *src) 
{
    if (dst) {
        xdc_runtime_System_Module_GateProxy_Params__init__S(dst, (const void *)src, sizeof(xdc_runtime_System_Module_GateProxy_Params), sizeof(xdc_runtime_IInstance_Params));
    }
}




 










 

# 62 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.h"




 

 
typedef void (*xdc_runtime_System_AtexitHandler)(xdc_Int);

 


 
typedef void (*xdc_runtime_System_AbortFxn)(void);

 
typedef void (*xdc_runtime_System_ExitFxn)(xdc_Int);




 

 
struct xdc_runtime_System_ParseData {
    xdc_Int width;
    xdc_Bool lFlag;
    xdc_Bool lJust;
    xdc_Int precis;
    xdc_Int len;
    xdc_Int zpad;
    xdc_Char *end;
    xdc_Bool aFlag;
    xdc_Char *ptr;
};

 
typedef xdc_Int (*xdc_runtime_System_ExtendFxn)(xdc_Char**, xdc_CString*, xdc_VaList*, xdc_runtime_System_ParseData*);

 
typedef xdc_runtime_System_AtexitHandler __T1_xdc_runtime_System_Module_State__atexitHandlers;
typedef xdc_runtime_System_AtexitHandler *__ARRAY1_xdc_runtime_System_Module_State__atexitHandlers;
typedef __ARRAY1_xdc_runtime_System_Module_State__atexitHandlers __TA_xdc_runtime_System_Module_State__atexitHandlers;




 

 
typedef xdc_Bits32 CT__xdc_runtime_System_Module__diagsEnabled;
extern  const CT__xdc_runtime_System_Module__diagsEnabled xdc_runtime_System_Module__diagsEnabled__C;

 
typedef xdc_Bits32 CT__xdc_runtime_System_Module__diagsIncluded;
extern  const CT__xdc_runtime_System_Module__diagsIncluded xdc_runtime_System_Module__diagsIncluded__C;

 
typedef xdc_Bits16 *CT__xdc_runtime_System_Module__diagsMask;
extern  const CT__xdc_runtime_System_Module__diagsMask xdc_runtime_System_Module__diagsMask__C;

 
typedef xdc_Ptr CT__xdc_runtime_System_Module__gateObj;
extern  const CT__xdc_runtime_System_Module__gateObj xdc_runtime_System_Module__gateObj__C;

 
typedef xdc_Ptr CT__xdc_runtime_System_Module__gatePrms;
extern  const CT__xdc_runtime_System_Module__gatePrms xdc_runtime_System_Module__gatePrms__C;

 
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_System_Module__id;
extern  const CT__xdc_runtime_System_Module__id xdc_runtime_System_Module__id__C;

 
typedef xdc_Bool CT__xdc_runtime_System_Module__loggerDefined;
extern  const CT__xdc_runtime_System_Module__loggerDefined xdc_runtime_System_Module__loggerDefined__C;

 
typedef xdc_Ptr CT__xdc_runtime_System_Module__loggerObj;
extern  const CT__xdc_runtime_System_Module__loggerObj xdc_runtime_System_Module__loggerObj__C;

 
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_System_Module__loggerFxn0;
extern  const CT__xdc_runtime_System_Module__loggerFxn0 xdc_runtime_System_Module__loggerFxn0__C;

 
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_System_Module__loggerFxn1;
extern  const CT__xdc_runtime_System_Module__loggerFxn1 xdc_runtime_System_Module__loggerFxn1__C;

 
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_System_Module__loggerFxn2;
extern  const CT__xdc_runtime_System_Module__loggerFxn2 xdc_runtime_System_Module__loggerFxn2__C;

 
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_System_Module__loggerFxn4;
extern  const CT__xdc_runtime_System_Module__loggerFxn4 xdc_runtime_System_Module__loggerFxn4__C;

 
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_System_Module__loggerFxn8;
extern  const CT__xdc_runtime_System_Module__loggerFxn8 xdc_runtime_System_Module__loggerFxn8__C;

 
typedef xdc_Bool (*CT__xdc_runtime_System_Module__startupDoneFxn)(void);
extern  const CT__xdc_runtime_System_Module__startupDoneFxn xdc_runtime_System_Module__startupDoneFxn__C;

 
typedef xdc_Int CT__xdc_runtime_System_Object__count;
extern  const CT__xdc_runtime_System_Object__count xdc_runtime_System_Object__count__C;

 
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_System_Object__heap;
extern  const CT__xdc_runtime_System_Object__heap xdc_runtime_System_Object__heap__C;

 
typedef xdc_SizeT CT__xdc_runtime_System_Object__sizeof;
extern  const CT__xdc_runtime_System_Object__sizeof xdc_runtime_System_Object__sizeof__C;

 
typedef xdc_Ptr CT__xdc_runtime_System_Object__table;
extern  const CT__xdc_runtime_System_Object__table xdc_runtime_System_Object__table__C;

 

typedef xdc_runtime_Assert_Id CT__xdc_runtime_System_A_cannotFitIntoArg;
extern  const CT__xdc_runtime_System_A_cannotFitIntoArg xdc_runtime_System_A_cannotFitIntoArg__C;

 




typedef xdc_Int CT__xdc_runtime_System_maxAtexitHandlers;
extern  const CT__xdc_runtime_System_maxAtexitHandlers xdc_runtime_System_maxAtexitHandlers__C;


 

typedef xdc_runtime_System_AbortFxn CT__xdc_runtime_System_abortFxn;
extern  const CT__xdc_runtime_System_abortFxn xdc_runtime_System_abortFxn__C;

 

typedef xdc_runtime_System_ExitFxn CT__xdc_runtime_System_exitFxn;
extern  const CT__xdc_runtime_System_exitFxn xdc_runtime_System_exitFxn__C;

 

typedef xdc_runtime_System_ExtendFxn CT__xdc_runtime_System_extendFxn;
extern  const CT__xdc_runtime_System_extendFxn xdc_runtime_System_extendFxn__C;




 

 


extern xdc_Int xdc_runtime_System_Module_startup__E( xdc_Int state );

extern xdc_Int xdc_runtime_System_Module_startup__F( xdc_Int state );

 

extern xdc_Bool xdc_runtime_System_Module__startupDone__S( void );

 


extern void xdc_runtime_System_abort__E( xdc_CString str );

 


extern void xdc_runtime_System_abortStd__E( void );

 


extern void xdc_runtime_System_abortSpin__E( void );

 


extern xdc_Bool xdc_runtime_System_atexit__E( xdc_runtime_System_AtexitHandler handler );

 


extern void xdc_runtime_System_exit__E( xdc_Int stat );

 


extern void xdc_runtime_System_exitStd__E( xdc_Int stat );

 


extern void xdc_runtime_System_exitSpin__E( xdc_Int stat );

 


extern void xdc_runtime_System_processAtExit__E( xdc_Int stat );

 


extern void xdc_runtime_System_putch__E( xdc_Char ch );

 


extern void xdc_runtime_System_flush__E( void );

 


extern xdc_Int xdc_runtime_System_printf__E( xdc_CString fmt, ... );

extern xdc_Int xdc_runtime_System_printf_va__E( xdc_CString fmt, va_list _va );

extern xdc_Int xdc_runtime_System_printf_va__F( xdc_CString fmt, va_list _va );

 


extern xdc_Int xdc_runtime_System_aprintf__E( xdc_CString fmt, ... );

extern xdc_Int xdc_runtime_System_aprintf_va__E( xdc_CString fmt, va_list _va );

extern xdc_Int xdc_runtime_System_aprintf_va__F( xdc_CString fmt, va_list _va );

 


extern xdc_Int xdc_runtime_System_sprintf__E( xdc_Char buf[], xdc_CString fmt, ... );

extern xdc_Int xdc_runtime_System_sprintf_va__E( xdc_Char buf[], xdc_CString fmt, va_list _va );

extern xdc_Int xdc_runtime_System_sprintf_va__F( xdc_Char buf[], xdc_CString fmt, va_list _va );

 


extern xdc_Int xdc_runtime_System_asprintf__E( xdc_Char buf[], xdc_CString fmt, ... );

extern xdc_Int xdc_runtime_System_asprintf_va__E( xdc_Char buf[], xdc_CString fmt, va_list _va );

extern xdc_Int xdc_runtime_System_asprintf_va__F( xdc_Char buf[], xdc_CString fmt, va_list _va );

 


extern xdc_Int xdc_runtime_System_vprintf__E( xdc_CString fmt, xdc_VaList va );

 


extern xdc_Int xdc_runtime_System_avprintf__E( xdc_CString fmt, xdc_VaList va );

 


extern xdc_Int xdc_runtime_System_vsprintf__E( xdc_Char buf[], xdc_CString fmt, xdc_VaList va );

 


extern xdc_Int xdc_runtime_System_avsprintf__E( xdc_Char buf[], xdc_CString fmt, xdc_VaList va );

 


extern xdc_Int xdc_runtime_System_snprintf__E( xdc_Char buf[], xdc_SizeT n, xdc_CString fmt, ... );

extern xdc_Int xdc_runtime_System_snprintf_va__E( xdc_Char buf[], xdc_SizeT n, xdc_CString fmt, va_list _va );

extern xdc_Int xdc_runtime_System_snprintf_va__F( xdc_Char buf[], xdc_SizeT n, xdc_CString fmt, va_list _va );

 


extern xdc_Int xdc_runtime_System_vsnprintf__E( xdc_Char buf[], xdc_SizeT n, xdc_CString fmt, xdc_VaList va );

 


extern xdc_Int xdc_runtime_System_printfExtend__I( xdc_Char **bufp, xdc_CString *fmt, xdc_VaList *va, xdc_runtime_System_ParseData *parse );

 


extern xdc_Int xdc_runtime_System_doPrint__I( xdc_Char buf[], xdc_SizeT n, xdc_CString fmt, xdc_VaList *pva, xdc_Bool aFlag );

 


extern void xdc_runtime_System_lastFxn__I( void );

 


extern void xdc_runtime_System_putchar__I( xdc_Char **bufp, xdc_Char ch, xdc_SizeT *n );

 


extern void xdc_runtime_System_rtsExit__I( void );

 


extern xdc_Bool xdc_runtime_System_atexitDone__I( void );




 

 


 


 


 
static inline CT__xdc_runtime_System_Module__id xdc_runtime_System_Module_id( void ) 
{
    return xdc_runtime_System_Module__id__C;
}

 
static inline xdc_Bool xdc_runtime_System_Module_hasMask( void ) 
{
    return xdc_runtime_System_Module__diagsMask__C != 0;
}

 
static inline xdc_Bits16 xdc_runtime_System_Module_getMask( void ) 
{
    return xdc_runtime_System_Module__diagsMask__C != 0 ? *xdc_runtime_System_Module__diagsMask__C : 0;
}

 
static inline void xdc_runtime_System_Module_setMask( xdc_Bits16 mask ) 
{
    if (xdc_runtime_System_Module__diagsMask__C != 0) *xdc_runtime_System_Module__diagsMask__C = mask;
}




 










 






 
struct xdc_runtime_System_Module_State {
    __TA_xdc_runtime_System_Module_State__atexitHandlers atexitHandlers;
    xdc_Int numAtexitHandlers;
};

 
extern struct xdc_runtime_System_Module_State__ xdc_runtime_System_Module__state__V;








 






 
# 507 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.h"

 
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_SupportProxy.h"





 















 




 

# 287 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_SupportProxy.h"




 






 
# 317 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_SupportProxy.h"

# 510 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.h"

 
# 1 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_Module_GateProxy.h"





 
















 




 

# 347 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_Module_GateProxy.h"




 






 
# 404 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/package/System_Module_GateProxy.h"

# 513 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.h"





 

# 16 "C:\\ti\\xdctools_3_31_01_33_core\\packages\\xdc\\runtime\\package/internal/System.xdc.h"

# 23 "C:\\ti\\xdctools_3_31_01_33_core\\packages\\xdc\\runtime\\package/internal/System.xdc.h"

 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 


 


 


 


 


 


 



 



 



 




 
# 176 "C:\\ti\\xdctools_3_31_01_33_core\\packages\\xdc\\runtime\\package/internal/System.xdc.h"


# 22 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.c"
# 1 "C:\\ti\\xdctools_3_31_01_33_core\\packages\\xdc\\runtime\\System__internal.h"











 


















 










 




typedef xdc_UInt32      xdc_runtime_System_UNum;
typedef xdc_Int32       xdc_runtime_System_INum;






 
extern xdc_Char *xdc_runtime_System_formatNum__I(xdc_Char *,
                     xdc_runtime_System_UNum, xdc_Int, xdc_Int);









 

# 23 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.c"

# 1 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdlib.h"
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 





#pragma diag_push
#pragma CHECK_MISRA("-6.3")  
#pragma CHECK_MISRA("-8.5")  
#pragma CHECK_MISRA("-19.1")  

 
 
 
# 57 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdlib.h"

 
 
 
 




 
 
 
# 77 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdlib.h"

# 85 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdlib.h"

#pragma diag_push
#pragma CHECK_MISRA("-5.7")  

typedef struct { int quot, rem; } div_t;

typedef struct { int quot, rem; } ldiv_t;


typedef struct { long long quot, rem; } lldiv_t;

#pragma diag_pop

# 104 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdlib.h"










# 120 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdlib.h"






# 1 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/linkage.h"
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 




#pragma diag_push
#pragma CHECK_MISRA("-19.4")  

 





 
 
 
# 62 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/linkage.h"

#pragma diag_pop

# 127 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdlib.h"

 
 
 
 
 
 
 
#pragma diag_push
#pragma CHECK_MISRA("-16.4")  
      int       abs(int _val); 
      long      labs(long _val);

      long long llabs(long long _val);

#pragma diag_pop

     int       atoi(const char *_st);
     long      atol(const char *_st);

     long long atoll(const char *_st);

     int       ltoa(long val, char *buffer);
          extern  double    atof(const char *_st);

     long      strtol(const char *_st, char **_endptr, int _base);
     unsigned long strtoul(const char *_st, char **_endptr,
    					  int _base);

     long long strtoll(const char *_st, char **_endptr, int _base);
     unsigned long long strtoull(const char *_st, char **_endptr,
					     int _base);

     float     strtof(const char *_st, char **_endptr);
     double    strtod(const char *_st, char **_endptr);
     long double strtold(const char *_st, char **_endptr);
    
     int    rand(void);
     void   srand(unsigned _seed);
    
     void  *calloc(size_t _num, size_t _size)
               __attribute__((malloc));
     void  *malloc(size_t _size)
               __attribute__((malloc));
     void  *realloc(void *_ptr, size_t _size)
               __attribute__((malloc));
     void   free(void *_ptr);
     void  *memalign(size_t _aln, size_t _size)
               __attribute__((malloc));
    
     void   abort(void); 

    typedef void (*__TI_atexit_fn)(void);
     int    atexit(__TI_atexit_fn _func);

    typedef int (*__TI_compar_fn)(const void *_a,const void *_b);
     void  *bsearch(const void *_key, const void *_base,
                                size_t _nmemb, size_t _size, 
                                __TI_compar_fn compar);
     void   qsort(void *_base, size_t _nmemb, size_t _size, 
                              __TI_compar_fn compar);

     void   exit(int _status);
    
     div_t  div(int _numer, int _denom);
     ldiv_t ldiv(long _numer, long _denom);

     lldiv_t lldiv(long long _numer, long long _denom);


     char  *getenv(const char *_string);
     int    system(const char *_name);

     int    mblen(const char *_s, size_t _n);
     size_t mbstowcs(wchar_t *_dest, const char *_src, size_t _n);
     int    mbtowc(wchar_t *_dest, const char *_src, size_t _n);

     size_t wcstombs(char *_dest, const wchar_t *_src, size_t _n);
     int    wctomb(char *_s, wchar_t _wc);






# 228 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdlib.h"

# 252 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdlib.h"

#pragma diag_pop



#pragma diag_push


 
 
#pragma CHECK_MISRA("-19.15")

# 317 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdlib.h"

#pragma diag_pop

#pragma diag_push

 
#pragma CHECK_MISRA("-19.1")
#pragma CHECK_MISRA("-19.15")


#pragma diag_pop
# 25 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.c"
# 1 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdarg.h"
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

# 115 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/stdarg.h"

#pragma diag_push


 
 
#pragma CHECK_MISRA("-19.15")





#pragma diag_pop
# 26 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.c"
# 1 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/string.h"
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 





#pragma diag_push
#pragma CHECK_MISRA("-6.3")  
#pragma CHECK_MISRA("-19.1")  

# 54 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/string.h"
 











#pragma diag_push
#pragma CHECK_MISRA("-19.4")  

# 76 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/string.h"

#pragma diag_pop

 size_t  strlen(const char *string);

 char *strcpy(char *dest, const char *src);
 char *strncpy(char *dest, const char *src, size_t n);
 char *strcat(char *string1, const char *string2);
 char *strncat(char *dest, const char *src, size_t n);
 char *strchr(const char *string, int c);
 char *strrchr(const char *string, int c);

 int  strcmp(const char *string1, const char *string2);
 int  strncmp(const char *string1, const char *string2, size_t n);

 int     strcoll(const char *string1, const char *_string2);
 size_t  strxfrm(char *to, const char *from, size_t n);
 char   *strpbrk(const char *string, const char *chs);
 size_t  strspn(const char *string, const char *chs);
 size_t  strcspn(const char *string, const char *chs);
 char   *strstr(const char *string1, const char *string2);
 char   *strtok(char *str1, const char *str2);
 char   *strerror(int _errno);
 char   *strdup(const char *string);


 void   *memmove(void *s1, const void *s2, size_t n);
#pragma diag_push
#pragma CHECK_MISRA("-16.4")  
 void   *memcpy(void *s1, const void *s2, size_t n);
#pragma diag_pop

 int     memcmp(const void *cs, const void *ct, size_t n);
 void   *memchr(const void *cs, int c, size_t n);

 void   *memset(void *mem, int ch, size_t length);






# 348 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/string.h"

#pragma diag_pop



#pragma diag_push


 
 
#pragma CHECK_MISRA("-19.15")

# 388 "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_5.2.5/include/string.h"

#pragma diag_pop
# 27 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.c"






 
# 41 "C:/ti/xdctools_3_31_01_33_core/packages/xdc/runtime/System.c"

 

typedef xdc_runtime_System_UNum UIntMax;
typedef xdc_runtime_System_INum IntMax;




























 






static const Char digtohex[] = "0123456789abcdef";



 
Int xdc_runtime_System_Module_startup__E__mangled__(Int stat)
{
    return ((-1));
}



 
void xdc_runtime_System_abort__E__mangled__(CString str)
{
    xdc_runtime_Gate_enterSystem__E();

    xdc_runtime_System_SupportProxy_abort__E(str);

    (xdc_runtime_System_abortFxn__C)();
}



 
Bool xdc_runtime_System_atexit__E__mangled__(xdc_runtime_System_AtexitHandler handler)
{
    IArg key;
    Bool status = 1;
    
    key = xdc_runtime_Gate_enterSystem__E();

    if (((xdc_runtime_System_Module_State *)((&(xdc_runtime_System_Module__state__V))))->numAtexitHandlers < (xdc_runtime_System_maxAtexitHandlers__C)) {
        ((xdc_runtime_System_Module_State *)((&(xdc_runtime_System_Module__state__V))))->atexitHandlers[((xdc_runtime_System_Module_State *)((&(xdc_runtime_System_Module__state__V))))->numAtexitHandlers] = handler;
        ((xdc_runtime_System_Module_State *)((&(xdc_runtime_System_Module__state__V))))->numAtexitHandlers++;
    }
    else {
        status = 0;
    }

    xdc_runtime_Gate_leaveSystem__E(key);
    
    return (status);
}



 
void xdc_runtime_System_exit__E__mangled__(Int stat)
{
    xdc_runtime_System_processAtExit__E(stat);

    (xdc_runtime_System_exitFxn__C)(stat);
}



 
void xdc_runtime_System_abortStd__E() 
{
    abort();
}



 
void xdc_runtime_System_abortSpin__E__mangled__()
{
    for (;;) {
    }
}



 
void xdc_runtime_System_exitStd__E(Int stat)
{
    exit(stat);
}



 
void xdc_runtime_System_exitSpin__E__mangled__(Int stat)
{
    for (;;) {
    }
}



 
void xdc_runtime_System_processAtExit__E__mangled__(Int stat)
{
    Int i;

    xdc_runtime_Gate_enterSystem__E();

    for (i = ((xdc_runtime_System_Module_State *)((&(xdc_runtime_System_Module__state__V))))->numAtexitHandlers; i > 0; i--) {
        (((xdc_runtime_System_Module_State *)((&(xdc_runtime_System_Module__state__V))))->atexitHandlers[i - 1])(stat);
    }

    xdc_runtime_System_SupportProxy_exit__E(stat);
}



 
void xdc_runtime_System_flush__E()
{
    xdc_runtime_System_SupportProxy_flush__E();
}




 
void xdc_runtime_System_putch__E(Char ch)
{
    if (xdc_runtime_System_SupportProxy_ready__E()) {
        xdc_runtime_System_SupportProxy_putch__E(ch);
    }
}



 
Int xdc_runtime_System_aprintf_va__F(CString fmt, VaList va)
{
    return (xdc_runtime_System_avprintf__E(fmt, va));
}




 
Int xdc_runtime_System_avprintf__E(CString fmt, VaList va)
{
    return (xdc_runtime_System_SupportProxy_ready__E()
            ? xdc_runtime_System_doPrint__I(0, (SizeT)-1, fmt, (&(va)), 1) : -1);
}



 
Int xdc_runtime_System_asprintf_va__F(Char buf[], CString fmt, VaList va)
{
    return (xdc_runtime_System_avsprintf__E(buf, fmt, va));
}




 
Int xdc_runtime_System_avsprintf__E(Char buf[], CString fmt, VaList va)
{
    return (xdc_runtime_System_doPrint__I(buf, (SizeT)-1, fmt, (&(va)), 1));
}



 
Int xdc_runtime_System_printf_va__F(CString fmt, VaList va)
{
    return (xdc_runtime_System_vprintf__E(fmt, va));
}




 
Int xdc_runtime_System_vprintf__E(CString fmt, VaList va)
{
    return (xdc_runtime_System_SupportProxy_ready__E()
            ? xdc_runtime_System_doPrint__I(0, (SizeT)-1, fmt, (&(va)), 0) : -1);
}



 
Int xdc_runtime_System_sprintf_va__F(Char buf[], CString fmt, VaList va)
{
    return (xdc_runtime_System_vsprintf__E(buf, fmt, va));
}




 
Int xdc_runtime_System_vsprintf__E(Char buf[], CString fmt, VaList va)
{
    return (xdc_runtime_System_doPrint__I(buf, (SizeT)-1, fmt, (&(va)), 0));
}



 
Int xdc_runtime_System_snprintf_va__F(Char buf[], SizeT n, CString fmt, VaList va)
{
    return (xdc_runtime_System_vsnprintf__E(buf, n, fmt, va));
}



 
Int xdc_runtime_System_vsnprintf__E(Char buf[], SizeT n, CString fmt, VaList va)
{
    return (xdc_runtime_System_doPrint__I(buf, n, fmt, (&(va)), 0));
}












 
Int xdc_runtime_System_doPrint__I(Char *buf, SizeT n, CString fmt, VaList *pva, Bool aFlag)
{
     
    Int     base;
    Char    c;
    Int     res;
    Char    outbuf[((32 + 2) / 3) + 5];
   
     
    struct xdc_runtime_System_ParseData parse;

    parse.aFlag = aFlag;

    res = 0;

    if (fmt == (Char *)0) {
        return (res);
    }

    while ((c = *fmt++) != '\0') {
        if (c != '%') {
            xdc_runtime_System_putchar__I(&buf, c, &n);
            res++;
        }
        else {
            c = *fmt++;
             
            if (c == '-') {
                parse.lJust = 1;
                c = *fmt++;
            }
            else {
                parse.lJust = 0;
            }
             
            if (c == '0') {
                parse.zpad = 1;
                c = *fmt++;
            }
            else {
                parse.zpad = 0;
            }

             
            parse.width = 0;
            parse.precis = -1;

             
            if (c == '*') {
                parse.width = parse.aFlag
                    ? (int)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(IArg) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(IArg) == 8) ? 7 : 3))) + (((sizeof(IArg)) + 3) & ~3))), (*(IArg *) ((int)(*pva). __ap - (((sizeof(IArg)) + 3) & ~3)))) : (int)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(int) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(int) == 8) ? 7 : 3))) + (((sizeof(int)) + 3) & ~3))), (*(int *) ((int)(*pva). __ap - (((sizeof(int)) + 3) & ~3))));
                c = *fmt++;
                if (parse.width < 0) {
                    parse.lJust = 1;
                    parse.width = -parse.width;
                }
            }
            else {
                while (c >= '0' && c <= '9') {
                    parse.width = parse.width * 10 + c - '0';
                    c = *fmt++;
                }
            }

             
            if (c == '.') {
                parse.precis = 0;
                c = *fmt++;
                if (c == '*') {
                    parse.precis = parse.aFlag ? (int)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(IArg) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(IArg) == 8) ? 7 : 3))) + (((sizeof(IArg)) + 3) & ~3))), (*(IArg *) ((int)(*pva). __ap - (((sizeof(IArg)) + 3) & ~3)))) :
                                     (int)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(int) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(int) == 8) ? 7 : 3))) + (((sizeof(int)) + 3) & ~3))), (*(int *) ((int)(*pva). __ap - (((sizeof(int)) + 3) & ~3))));
                    if (parse.precis < 0) {
                        parse.precis = 0;
                    }
                    
                    c = *fmt++;
                }
                else {
                    while (c >= '0' && c <= '9') {
                        parse.precis = parse.precis * 10 + c - '0';
                        c = *fmt++;
                    }
                }
            }

             
            if (parse.zpad) {
                parse.zpad = parse.width;
            }
            
             
            if (c == 'l' || c == 'L') {
                parse.lFlag = 1;
                c = *fmt++;
            }
            else {
                parse.lFlag = 0;
            }

            parse.ptr = outbuf;
            parse.end = outbuf + ((32 + 2) / 3) + 5;
            parse.len = 0;

            if (c == 'd' || c == 'i') {
                 
                IntMax val =
                    parse.aFlag ? (IntMax)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(IArg) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(IArg) == 8) ? 7 : 3))) + (((sizeof(IArg)) + 3) & ~3))), (*(IArg *) ((int)(*pva). __ap - (((sizeof(IArg)) + 3) & ~3)))) :
                    parse.lFlag ? (IntMax)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(long int) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(long int) == 8) ? 7 : 3))) + (((sizeof(long int)) + 3) & ~3))), (*(long int *) ((int)(*pva). __ap - (((sizeof(long int)) + 3) & ~3)))) :
                    (IntMax)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(int) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(int) == 8) ? 7 : 3))) + (((sizeof(int)) + 3) & ~3))), (*(int *) ((int)(*pva). __ap - (((sizeof(int)) + 3) & ~3))));
				
                if (parse.precis > parse.zpad) {
                    parse.zpad = parse.precis;
                }
                parse.ptr = xdc_runtime_System_formatNum__I(parse.end, val, parse.zpad, -10);
                parse.len = parse.end - parse.ptr;
            }
             
            else if (((base = 10), (c == 'u')) ||        
                     ((base = 16), (c == 'x')) ||        
                     ((base = 8),  (c == 'o'))) {        

                UIntMax val =
                    parse.aFlag ? (UIntMax)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(IArg) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(IArg) == 8) ? 7 : 3))) + (((sizeof(IArg)) + 3) & ~3))), (*(IArg *) ((int)(*pva). __ap - (((sizeof(IArg)) + 3) & ~3)))) :
                    parse.lFlag ? (UIntMax)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(unsigned long) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(unsigned long) == 8) ? 7 : 3))) + (((sizeof(unsigned long)) + 3) & ~3))), (*(unsigned long *) ((int)(*pva). __ap - (((sizeof(unsigned long)) + 3) & ~3)))) :
                    (UIntMax)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(unsigned) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(unsigned) == 8) ? 7 : 3))) + (((sizeof(unsigned)) + 3) & ~3))), (*(unsigned *) ((int)(*pva). __ap - (((sizeof(unsigned)) + 3) & ~3))));

                if (parse.precis > parse.zpad) {
                    parse.zpad = parse.precis;
                }
                parse.ptr = xdc_runtime_System_formatNum__I(parse.end, val, parse.zpad, base);
                parse.len = parse.end - parse.ptr;
            }
            else if ((base = 16), (c == 'p')) {
                parse.zpad = 8;                    
                parse.ptr = xdc_runtime_System_formatNum__I(
                    parse.end,
                    parse.aFlag
                        ? (UIntMax)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(IArg) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(IArg) == 8) ? 7 : 3))) + (((sizeof(IArg)) + 3) & ~3))), (*(IArg *) ((int)(*pva). __ap - (((sizeof(IArg)) + 3) & ~3)))) : (UIntMax)(UArg)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(Ptr) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(Ptr) == 8) ? 7 : 3))) + (((sizeof(Ptr)) + 3) & ~3))), (*(Ptr *) ((int)(*pva). __ap - (((sizeof(Ptr)) + 3) & ~3)))),
                    parse.zpad, base);
                *(--parse.ptr) = '@';
                parse.len = parse.end - parse.ptr;
            }
            else if (c == 'c') {
                 
                *parse.ptr = parse.aFlag
                    ? (Char)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(IArg) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(IArg) == 8) ? 7 : 3))) + (((sizeof(IArg)) + 3) & ~3))), (*(IArg *) ((int)(*pva). __ap - (((sizeof(IArg)) + 3) & ~3)))) : (Char)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(int) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(int) == 8) ? 7 : 3))) + (((sizeof(int)) + 3) & ~3))), (*(int *) ((int)(*pva). __ap - (((sizeof(int)) + 3) & ~3))));
                parse.len = 1;
            }
            else if (c == 's') {
                 
                parse.ptr = parse.aFlag ? (String)xdc_iargToPtr((((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(IArg) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(IArg) == 8) ? 7 : 3))) + (((sizeof(IArg)) + 3) & ~3))), (*(IArg *) ((int)(*pva). __ap - (((sizeof(IArg)) + 3) & ~3))))) :
                              (String)(((*pva). __ap = (void *)((((int)((*pva). __ap) + ((__ALIGNOF__(void *) == 8) ? 7 : 3)) & ~(((__ALIGNOF__(void *) == 8) ? 7 : 3))) + (((sizeof(void *)) + 3) & ~3))), (*(void * *) ((int)(*pva). __ap - (((sizeof(void *)) + 3) & ~3))));

                 
                if (parse.ptr == (char *)0) {
                    parse.ptr = "(null)";
                }
                parse.len = strlen(parse.ptr);
                if (parse.precis != -1 && parse.precis < parse.len) {
                    parse.len = parse.precis;
                }
            }
            else {
                fmt--;

                  
                if (n > 1) {
                     
                    if ((parse.precis == -1) || ((SizeT)parse.precis >= n)) {
                         parse.precis = n; 
                    }
                    else {
                          
                         parse.precis++; 
                    }
                    res += (xdc_runtime_System_extendFxn__C)(&buf, &fmt, pva, &parse);
                }
            }

             
            parse.width -= parse.len;

            if (!parse.lJust) {
                 
                while (--parse.width >= 0) {
                    xdc_runtime_System_putchar__I(&buf, ' ', &n);
                    res++;
                }
            }

             
            while (parse.len--) {
                xdc_runtime_System_putchar__I(&buf, *parse.ptr++, &n);
                res++;
            }
             
            if (parse.lJust) {
                while (--parse.width >= 0) {
                    xdc_runtime_System_putchar__I(&buf, ' ', &n);
                    res++;
                }
            }
        }  
    }  

    if (buf) {
        *buf = '\0';
    }

    return (res);
}

















 
Char *xdc_runtime_System_formatNum__I(Char *ptr, UIntMax un, Int zpad, Int base)
{
    Int i = 0;
    Char sign = 0;

    UIntMax n;
    n = un;

    if (base < 0) {
         
        base = -base;
        if ((IntMax)n < 0) {
            n = -(IntMax)n;

             
            --zpad;
            sign = '-';
        }
    }

     
    do {
        *(--ptr) = digtohex[(Int) (n % base)];
        n = n / base;
        ++i;
    } while (n);

     
    while (i < zpad) {
        *(--ptr) = '0';
        ++i;
    }

     
    if (sign) {
        *(--ptr) = sign;
    }
    return (ptr);
}










 
void xdc_runtime_System_putchar__I(Char **bufp, Char c, SizeT *n)
{
     
    if ((*n) <= 1) {
        return;
    }
         
     
    (*n)--;

    


 
    if (*bufp) {
        *((*bufp)++) = c;
        return;
    }

    if (xdc_runtime_System_SupportProxy_ready__E()) {
        xdc_runtime_System_SupportProxy_putch__E(c);
    }
}


 

