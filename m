Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9jdr-00068Y-LH
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 03:14:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9jdm-00064Q-Es; Tue, 18 Jan 2022 03:14:55 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:56636 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9jdb-0003IC-T9; Tue, 18 Jan 2022 03:14:54 -0500
Received: from [192.168.0.102] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAAHD3_sduZh++x0Bg--.40819S2;
 Tue, 18 Jan 2022 16:14:37 +0800 (CST)
Subject: Re: [PATCH v4 5/7] target/riscv: rvk: add CSR support for Zkr
To: Alistair Francis <alistair23@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com,
 luruibo2000@163.com, lustrew@foxmail.com
References: <20220111035124.9468-1-liweiwei@iscas.ac.cn>
 <20220111035124.9468-6-liweiwei@iscas.ac.cn>
 <CAKmqyKObfKvb4gi1Ap_rBdN+UOGLWfHADQGa_m-mNzi6dG3FYA@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <c5538c3c-e5d5-9e8d-1ea4-6f0a9551eb0c@iscas.ac.cn>
Date: Tue, 18 Jan 2022 16:14:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKObfKvb4gi1Ap_rBdN+UOGLWfHADQGa_m-mNzi6dG3FYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAAHD3_sduZh++x0Bg--.40819S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKw4DJF1rAw4fZFyUKFW3ZFb_yoWxGry3pw
 4UCay5Gry8XrW7tw1ftFn8WF15WrWfGF47C39rWayDA3W5A34rCr1DWwsI9F95X3Z8Cr1j
 vF4j9Fn0kr4I9a7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
 kF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj2jg7UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 08:14:56 -0000


在 2022/1/18 下午12:36, Alistair Francis 写道:
> On Tue, Jan 11, 2022 at 1:53 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>     - add SEED CSR
>>     - add USEED, SSEED fields for MSECCFG CSR
>>
>> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
>> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu_bits.h |  9 +++++
>>   target/riscv/csr.c      | 74 +++++++++++++++++++++++++++++++++++++++++
>>   target/riscv/pmp.h      |  8 +++--
>>   3 files changed, 88 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> index 5a6d49aa64..65c708622b 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -374,6 +374,9 @@
>>   #define CSR_VSPMMASK        0x2c1
>>   #define CSR_VSPMBASE        0x2c2
>>
>> +/* Crypto Extension */
>> +#define CSR_SEED           0x015
>> +
>>   /* mstatus CSR bits */
>>   #define MSTATUS_UIE         0x00000001
>>   #define MSTATUS_SIE         0x00000002
>> @@ -628,4 +631,10 @@ typedef enum RISCVException {
>>   #define UMTE_U_PM_INSN      U_PM_INSN
>>   #define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
>>
>> +/* seed CSR bits */
>> +#define SEED_OPST                        (0b11 << 30)
>> +#define SEED_OPST_BIST                   (0b00 << 30)
>> +#define SEED_OPST_WAIT                   (0b01 << 30)
>> +#define SEED_OPST_ES16                   (0b10 << 30)
>> +#define SEED_OPST_DEAD                   (0b11 << 30)
>>   #endif
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index adb3d4381d..9d93e72f68 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -22,6 +22,8 @@
>>   #include "cpu.h"
>>   #include "qemu/main-loop.h"
>>   #include "exec/exec-all.h"
>> +#include "qemu/guest-random.h"
>> +#include "qapi/error.h"
>>
>>   /* CSR function table public API */
>>   void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
>> @@ -222,6 +224,38 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
>>   }
>>   #endif
>>
>> +/* Predicates */
>> +static RISCVException seed(CPURISCVState *env, int csrno)
>> +{
>> +    RISCVCPU *cpu = env_archcpu(env);
> New line between declarations and code please
OK.
>> +    if (!cpu->cfg.ext_zkr) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>> +    }
>> +#if !defined(CONFIG_USER_ONLY)
>> +    if (riscv_has_ext(env, RVS) && riscv_has_ext(env, RVH)) {
>> +        /* Hypervisor extension is supported */
>> +        if (riscv_cpu_virt_enabled(env) && (env->priv != PRV_M)) {
>> +            if (env->mseccfg & MSECCFG_SSEED) {
>> +                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> +            } else {
>> +                return RISCV_EXCP_ILLEGAL_INST;
>> +            }
>> +        }
>> +    }
>> +    if (env->priv == PRV_M) {
>> +        return RISCV_EXCP_NONE;
>> +    } else if (env->priv == PRV_S && (env->mseccfg & MSECCFG_SSEED)) {
>> +        return RISCV_EXCP_NONE;
>> +    } else if (env->priv == PRV_U && (env->mseccfg & MSECCFG_USEED)) {
>> +        return RISCV_EXCP_NONE;
>> +    } else {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>> +    }
>> +#else
>> +    return RISCV_EXCP_NONE;
>> +#endif
>> +}
>> +
>>   /* User Floating-Point CSRs */
>>   static RISCVException read_fflags(CPURISCVState *env, int csrno,
>>                                     target_ulong *val)
>> @@ -1785,6 +1819,39 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
>>
>>   #endif
>>
>> +/* Crypto Extension */
>> +static int read_seed(CPURISCVState *env, int csrno, target_ulong *val)
>> +{
>> +    *val = 0;
>> +    uint32_t return_status =  SEED_OPST_ES16;
> Keep variable declarations first please
>
OK.
>> +    *val = (*val) | return_status;
>> +    if (return_status == SEED_OPST_ES16) {
>> +        uint16_t random_number;
>> +        Error *err = NULL;
>> +        if (qemu_guest_getrandom(&random_number, sizeof(random_number),
>> +                                 &err) < 0) {
> You can use qemu_guest_getrandom_nofail() instead and then not worry
> about this error handling.
>
>
OK. I'll update this.
>> +            qemu_log_mask(LOG_UNIMP, "Seed: Crypto failure: %s",
>> +                          error_get_pretty(err));
>> +            error_free(err);
>> +            return -1;
>> +        }
>> +        *val = (*val) | random_number;
>> +    } else if (return_status == SEED_OPST_BIST) {
>> +        /* Do nothing */
>> +    } else if (return_status == SEED_OPST_WAIT) {
>> +        /* Do nothing */
>> +    } else if (return_status == SEED_OPST_DEAD) {
>> +        /* Do nothing */
>> +    }
>> +    return 0;
> RISCV_EXCP_NONE instead of 0
OK.
>> +}
>> +
>> +static RISCVException write_seed(CPURISCVState *env, int csrno,
>> +                                    target_ulong val)
>> +{
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>>   /*
>>    * riscv_csrrw - read and/or update control and status register
>>    *
>> @@ -1823,6 +1890,10 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>>           return RISCV_EXCP_ILLEGAL_INST;
>>       }
>>
>> +    if (!write_mask && (csrno == CSR_SEED)) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>> +    }
> I think it would be better to remove this and use a rmw_*() function
> instead. Then the read/write check can happen in the CSR access
> function
>
> Look at rmw_mip() for an example of implementing a rmw_*() function.
OK. I'll update this.
>> +
>>       /* ensure the CSR extension is enabled. */
>>       if (!cpu->cfg.ext_icsr) {
>>           return RISCV_EXCP_ILLEGAL_INST;
>> @@ -2011,6 +2082,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>       [CSR_TIME]  = { "time",  ctr,   read_time  },
>>       [CSR_TIMEH] = { "timeh", ctr32, read_timeh },
>>
>> +    /* Crypto Extension */
>> +    [CSR_SEED] = { "seed", seed, read_seed, write_seed},
>> +
>>   #if !defined(CONFIG_USER_ONLY)
>>       /* Machine Timers and Counters */
>>       [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
>> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
>> index a9a0b363a7..83135849bb 100644
>> --- a/target/riscv/pmp.h
>> +++ b/target/riscv/pmp.h
>> @@ -37,9 +37,11 @@ typedef enum {
>>   } pmp_am_t;
>>
>>   typedef enum {
>> -    MSECCFG_MML  = 1 << 0,
>> -    MSECCFG_MMWP = 1 << 1,
>> -    MSECCFG_RLB  = 1 << 2
>> +    MSECCFG_MML   = 1 << 0,
>> +    MSECCFG_MMWP  = 1 << 1,
>> +    MSECCFG_RLB   = 1 << 2,
>> +    MSECCFG_USEED = 1 << 8,
>> +    MSECCFG_SSEED = 1 << 9
> Why are these all being changed?
>
> Alistair
>
USEED and SEED fields are added for the check of seed csr. the other 
changes are to align with the new code for  MSECCFG_SSEED and  
MSECCFG_SSEED.

Regards,

Weiwei Li

>>   } mseccfg_field_t;
>>
>>   typedef struct {
>> --
>> 2.17.1
>>
>>


