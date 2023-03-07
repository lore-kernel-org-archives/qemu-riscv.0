Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZMQF-0003dq-9a
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 20:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pZMQD-0003dc-Sn; Mon, 06 Mar 2023 20:47:21 -0500
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pZMQA-0001uM-VI; Mon, 06 Mar 2023 20:47:21 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R981e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VdJ4Q6C_1678153628; 
Received: from 192.168.3.95(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdJ4Q6C_1678153628) by smtp.aliyun-inc.com;
 Tue, 07 Mar 2023 09:47:09 +0800
Message-ID: <36217124-138c-d7ca-2322-5b5d40c31fb2@linux.alibaba.com>
Date: Tue, 7 Mar 2023 09:47:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/1] hw/riscv: Add signature dump function for spike to
 run ACT tests
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230306090314.74626-1-liweiwei@iscas.ac.cn>
 <20230306090314.74626-2-liweiwei@iscas.ac.cn>
 <6dd0199c-c3e0-a466-67b3-dab92df587d2@linux.alibaba.com>
 <5032e9ed-b8ef-cc0e-e122-1ec09fc00cf3@iscas.ac.cn>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <5032e9ed-b8ef-cc0e-e122-1ec09fc00cf3@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.119;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-119.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Mar 2023 01:47:22 -0000


On 2023/3/6 20:10, liweiwei wrote:
>
> On 2023/3/6 19:00, LIU Zhiwei wrote:
>>
>> On 2023/3/6 17:03, Weiwei Li wrote:
>>> Add signature and signature-granularity properties in spike to 
>>> specify the target
>>> signatrue file and the line size for signature data.
>>>
>>> Recgonize the signature section between begin_signature and 
>>> end_signature symbols
>>> when loading elf of ACT tests. Then dump signature data in signature 
>>> section just
>>> before the ACT tests exit.
>>>
>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>> ---
>>>   hw/char/riscv_htif.c | 39 ++++++++++++++++++++++++++++++++++++++-
>>>   hw/riscv/spike.c     | 16 ++++++++++++++++
>>>   2 files changed, 54 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
>>> index 098de50e35..2a82ed8500 100644
>>> --- a/hw/char/riscv_htif.c
>>> +++ b/hw/char/riscv_htif.c
>>> @@ -29,6 +29,8 @@
>>>   #include "chardev/char-fe.h"
>>>   #include "qemu/timer.h"
>>>   #include "qemu/error-report.h"
>>> +#include "exec/address-spaces.h"
>>> +#include "sysemu/dma.h"
>>>     #define RISCV_DEBUG_HTIF 0
>>>   #define HTIF_DEBUG(fmt, 
>>> ...)                                                   \
>>> @@ -51,7 +53,10 @@
>>>   /* PK system call number */
>>>   #define PK_SYS_WRITE            64
>>>   -static uint64_t fromhost_addr, tohost_addr;
>>> +extern const char *sig_file;
>>> +extern uint8_t line_size;
>>> +
>> Why not declare them in riscv_htif.h and include them in 
>> hw/riscv/spike.c?
>
> Do you mean the above "extern ..." declaration? It's OK to move them 
> to riscv_hitf.h.

No， I mean define them in riscv_htif.c and declare them in riscv_htif.h.

Zhiwei

>
> However, we can not move the definition in spike.c to riscv_htif.h. 
> Otherwise, it'll trigger
>
> multiple definition error.
>
>>> +static uint64_t fromhost_addr, tohost_addr, sig_addr, sig_len;
>>>     void htif_symbol_callback(const char *st_name, int st_info, 
>>> uint64_t st_value,
>>>                             uint64_t st_size)
>>> @@ -68,6 +73,10 @@ void htif_symbol_callback(const char *st_name, 
>>> int st_info, uint64_t st_value,
>>>               error_report("HTIF tohost must be 8 bytes");
>>>               exit(1);
>>>           }
>>> +    } else if (strcmp("begin_signature", st_name) == 0) {
>>> +        sig_addr = st_value;
>>> +    } else if (strcmp("end_signature", st_name) == 0) {
>>> +        sig_len = st_value - sig_addr;
>>>       }
>>>   }
>>>   @@ -161,6 +170,34 @@ static void 
>>> htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>>>           /* frontend syscall handler, shutdown and exit code 
>>> support */
>>>           if (cmd == HTIF_SYSTEM_CMD_SYSCALL) {
>>>               if (payload & 0x1) {
>>> +                /* Dump signature data to sig_file if specified */
>>> +                if (sig_file) {
>>> +                    char *sig_data = g_malloc(sig_len);
>>> + dma_memory_read(&address_space_memory, sig_addr, sig_data,
>>> +                                    sig_len, MEMTXATTRS_UNSPECIFIED);
>>> +                    FILE *signature = fopen(sig_file, "w");
>>> +                    if (signature == NULL) {
>>> +                        error_report("open %s: %s", sig_file,
>>> +                                     strerror(errno));
>>> +                        exit(1);
>>> +                    }
>>> +
>>> +                    for (int i = 0; i < sig_len; i += line_size) {
>>> +                        for (int j = line_size; j > 0; j--) {
>>> +                            if (i + j <= sig_len) {
>>> +                                fprintf(signature, "%02x",
>>> +                                        sig_data[i + j - 1] & 0xff);
>>
>> Not sure about the order. Otherwise, 
>
> It will put the higher data(at higher address) before the lower data 
> in the same line,
>
> just as the htif logic in riscv-isa-sim(spike).
>
> Regards,
>
> Weiwei Li
>
>>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>>
>> Zhiwei
>>
>>> +                            } else {
>>> +                                fprintf(signature, "%02x", 0);
>>> +                            }
>>> +                        }
>>> +                        fprintf(signature, "\n");
>>> +                    }
>>> +
>>> +                    fclose(signature);
>>> +                    g_free(sig_data);
>>> +                }
>>> +
>>>                   /* exit code */
>>>                   int exit_code = payload >> 1;
>>>                   exit(exit_code);
>>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>>> index a584d5b3a2..eaa7f54fd6 100644
>>> --- a/hw/riscv/spike.c
>>> +++ b/hw/riscv/spike.c
>>> @@ -41,6 +41,9 @@
>>>     #include <libfdt.h>
>>>   +const char *sig_file;
>>> +uint8_t line_size = 16;
>>> +
>>>   static const MemMapEntry spike_memmap[] = {
>>>       [SPIKE_MROM] =     {     0x1000,     0xf000 },
>>>       [SPIKE_HTIF] =     {  0x1000000,     0x1000 },
>>> @@ -332,6 +335,11 @@ static void spike_board_init(MachineState 
>>> *machine)
>>>                    htif_custom_base);
>>>   }
>>>   +static void spike_set_signature(Object *obj, const char *val, 
>>> Error **errp)
>>> +{
>>> +    sig_file = g_strdup(val);
>>> +}
>>> +
>>>   static void spike_machine_instance_init(Object *obj)
>>>   {
>>>   }
>>> @@ -350,6 +358,14 @@ static void 
>>> spike_machine_class_init(ObjectClass *oc, void *data)
>>>       mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>>>       mc->numa_mem_supported = true;
>>>       mc->default_ram_id = "riscv.spike.ram";
>>> +    object_class_property_add_str(oc, "signature", NULL, 
>>> spike_set_signature);
>>> +    object_class_property_set_description(oc, "signature",
>>> +                                          "File to write ACT test 
>>> signature");
>>> +    object_class_property_add_uint8_ptr(oc, "signature-granularity",
>>> +                                        &line_size, 
>>> OBJ_PROP_FLAG_WRITE);
>>> +    object_class_property_set_description(oc, "signature-granularity",
>>> +                                          "Size of each line in ACT 
>>> signature "
>>> +                                          "file");
>>>   }
>>>     static const TypeInfo spike_machine_typeinfo = {

