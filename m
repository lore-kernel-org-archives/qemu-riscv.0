Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgIr2-0005a9-47
	for mharc-qemu-riscv@gnu.org; Mon, 10 May 2021 23:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1lgIr0-0005Zo-74; Mon, 10 May 2021 23:14:38 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:39594 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1lgIqw-0000Z8-41; Mon, 10 May 2021 23:14:37 -0400
Received: from [172.16.211.231] (unknown [58.221.119.46])
 by APP-01 (Coremail) with SMTP id qwCowACnrnZ49plg0UZ6AQ--.26068S3;
 Tue, 11 May 2021 11:14:01 +0800 (CST)
Subject: Re: [RFC PATCH 1/5] target/riscv: Add Nuclei CSR and Update interrupt
 handling
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 liweiwei@iscas.ac.cn, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, alapha23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
 <20210507081654.11056-2-wangjunqiang@iscas.ac.cn>
 <CAKmqyKPE8O6LbZQc2H+kkWvVqf9qW705S85XGGWpUtQTWjzE8Q@mail.gmail.com>
From: Wang Junqiang <wangjunqiang@iscas.ac.cn>
Message-ID: <e97fecab-78d2-1a55-c7ad-c542ab5d1fbf@iscas.ac.cn>
Date: Tue, 11 May 2021 11:14:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPE8O6LbZQc2H+kkWvVqf9qW705S85XGGWpUtQTWjzE8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACnrnZ49plg0UZ6AQ--.26068S3
X-Coremail-Antispam: 1UD129KBjvJXoW3KFyDWF17XrykCrWUCry3urg_yoWDtw4fpF
 4UKFsxua9rJrZru3yftF1DXF1rJw1xKrW5Kwn5XayrAa15WrWxKr1DtayYkF1DZF4ruw12
 va1DuF13ZF4FvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
 c2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv
 67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
 9x07brxRDUUUUU=
X-Originating-IP: [58.221.119.46]
X-CM-SenderInfo: pzdqwy5xqtxt1qj6x2xfdvhtffof0/1tbiCQoSAF02aKrHdwAAsI
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=wangjunqiang@iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 11 May 2021 03:14:38 -0000



On 2021/5/10 上午10:17, Alistair Francis wrote:
>   C isOn Fri, May 7, 2021 at 11:25 PM wangjunqiang
> <wangjunqiang@iscas.ac.cn> wrote:
>>
>> This patch adds Nuclei CSR support for ECLIC and update the
>> related interrupt handling.
>>
>> https://doc.nucleisys.com/nuclei_spec/isa/core_csr.html
> 
> Hello,
> 
> Thanks for the patches!
> 
> This patch is very long and you will need to split it up before it can
> be merged. I understand this is just an RFC, but it's still best to
> start with small patches. Generally each patch should add a feature
> and it seems like you have added lots of features in this patch. This
> patch could probably be broken into at least 4 different patches.
> 
> As well as that you will want to ensure that your commit message and
> description explains what you are doing in that patch and in some
> cases justify the change. For example adding a new CPU doesn't need a
> justification (as that's easy for me to understand), but changing some
> existing code might need an explanation of why we need/want that
> change.
> 
> This is still a great start though! I look forward to your future patches.
> 
> I have left a few comments below as well.

Thank you for your reply and comments.I will split it into small patches 
by feature in next version.And add more detailed description. To make a 
brief explanation, add cpu here to simplify the command line when using 
-cpu.

> 
>> ---
>>   target/riscv/cpu.c                      |  25 +-
>>   target/riscv/cpu.h                      |  42 ++-
>>   target/riscv/cpu_bits.h                 |  37 +++
>>   target/riscv/cpu_helper.c               |  80 +++++-
>>   target/riscv/csr.c                      | 347 +++++++++++++++++++++++-
>>   target/riscv/insn_trans/trans_rvi.c.inc |  16 +-
>>   target/riscv/op_helper.c                |  14 +
>>   7 files changed, 552 insertions(+), 9 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 7d6ed80f6b..b2a96effbc 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -173,6 +173,16 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>>       set_priv_version(env, PRIV_VERSION_1_10_0);
>>       qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>>   }
>> +
>> +static void rv64imafdcu_nuclei_cpu_init(Object *obj)
>> +{
>> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
>> +    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>> +    set_priv_version(env, PRIV_VERSION_1_10_0);
>> +    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>> +    set_resetvec(env, DEFAULT_RSTVEC);
>> +    set_feature(env, RISCV_FEATURE_PMP);
>> +}
>>   #else
>>   static void rv32_base_cpu_init(Object *obj)
>>   {
>> @@ -212,6 +222,16 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>>       set_resetvec(env, DEFAULT_RSTVEC);
>>       qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>>   }
>> +
>> +static void rv32imafdcu_nuclei_cpu_init(Object *obj)
>> +{
>> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
>> +    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>> +    set_priv_version(env, PRIV_VERSION_1_10_0);
>> +    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>> +    set_resetvec(env, DEFAULT_RSTVEC);
>> +    set_feature(env, RISCV_FEATURE_PMP);
>> +}
>>   #endif
>>
>>   static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>> @@ -331,7 +351,7 @@ static bool riscv_cpu_has_work(CPUState *cs)
>>        * Definition of the WFI instruction requires it to ignore the privilege
>>        * mode and delegation registers, but respect individual enables
>>        */
>> -    return (env->mip & env->mie) != 0;
>> +    return ((env->mip & env->mie) != 0  || (env->exccode != -1));
> 
> This change for example needs to be explained, I'm not sure what exccode is
> 
>>   #else
>>       return true;
>>   #endif
>> @@ -356,6 +376,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>>       env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>>       env->mcause = 0;
>>       env->pc = env->resetvec;
>> +    env->exccode = -1;
>>       env->two_stage_lookup = false;
>>   #endif
>>       cs->exception_index = EXCP_NONE;
>> @@ -704,10 +725,12 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>>       DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
>>       DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
>>       DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
>> +    DEFINE_CPU(TYPE_RISCV_CPU_NUCLEI_N307FD,    rv32imafdcu_nuclei_cpu_init),
>>   #elif defined(TARGET_RISCV64)
>>       DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
>>       DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>>       DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
>> +    DEFINE_CPU(TYPE_RISCV_CPU_NUCLEI_NX600FD,    rv64imafdcu_nuclei_cpu_init),
>>   #endif
>>   };
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 0a33d387ba..1d3a1986a6 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -33,6 +33,7 @@
>>   #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
>>   #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
>>   #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
>> +#define CPU_INTERRUPT_ECLIC CPU_INTERRUPT_TGT_EXT_0
>>
>>   #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>>   #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>> @@ -43,6 +44,8 @@
>>   #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
>>   #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
>>   #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
>> +#define TYPE_RISCV_CPU_NUCLEI_N307FD    RISCV_CPU_TYPE_NAME("nuclei-n307fd")
>> +#define TYPE_RISCV_CPU_NUCLEI_NX600FD    RISCV_CPU_TYPE_NAME("nuclei-nx600fd")
>>
>>   #if defined(TARGET_RISCV32)
>>   # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
>> @@ -80,7 +83,8 @@
>>   enum {
>>       RISCV_FEATURE_MMU,
>>       RISCV_FEATURE_PMP,
>> -    RISCV_FEATURE_MISA
>> +    RISCV_FEATURE_MISA,
>> +    RISCV_FEATURE_ECLIC
> 
> The same here, what is ECLIC? The ECLIC should be added in a seperate patch.
> 

ECLIC is Enhanced Core Local Interrupt Controller.And added some 
customized csr on the basis of clic to speed up Tail-Chaining processing.

https://doc.nucleisys.com/nuclei_spec/isa/eclic.html

>>   };
>>
>>   #define PRIV_VERSION_1_10_0 0x00011000
>> @@ -174,10 +178,34 @@ struct CPURISCVState {
>>       target_ulong scause;
>>
>>       target_ulong mtvec;
>> +    target_ulong mtvt;   /* eclic */
>>       target_ulong mepc;
>>       target_ulong mcause;
>>       target_ulong mtval;  /* since: priv-1.10.0 */
>>
>> +    target_ulong mnxti; /* eclic */
>> +    target_ulong mintstatus; /* eclic */
>> +    target_ulong mscratchcsw;
>> +    target_ulong mscratchcswl;
>> +
>> +    /* NMI  CSR*/
>> +    target_ulong mnvec;
>> +    target_ulong msubm;
>> +    target_ulong mdcause;
>> +    target_ulong mmisc_ctl;
>> +    target_ulong msavestatus;
>> +    target_ulong msaveepc1;
>> +    target_ulong msavecause1;
>> +    target_ulong msaveepc2;
>> +    target_ulong msavecause2;
>> +    target_ulong msavedcause1;
>> +    target_ulong msavedcause2;
>> +    target_ulong pushmsubm;
>> +    target_ulong mtvt2;
>> +    target_ulong jalmnxti;
>> +    target_ulong pushmcause;
>> +    target_ulong pushmepc;
> 
> What are NMI CSRs?
> 

Nuclei's Customized registers are used for NMI related processing

https://doc.nucleisys.com/nuclei_spec/isa/core_csr.html


>> +
>>       /* Hypervisor CSRs */
>>       target_ulong hstatus;
>>       target_ulong hedeleg;
>> @@ -228,6 +256,9 @@ struct CPURISCVState {
>>       uint64_t mtohost;
>>       uint64_t timecmp;
>>
>> +    /*nuclei timer comparators */
>> +    uint64_t mtimecmp;
> 
> RISC-V has a mtimecmp, does nuclei add another one?
> 

I will delete it, it was originally used for Shadow copy, I can move it 
to the device

https://doc.nucleisys.com/nuclei_spec/isa/timer.html

>> +
>>       /* physical memory protection */
>>       pmp_table_t pmp_state;
>>
>> @@ -243,6 +274,13 @@ struct CPURISCVState {
>>
>>       /* Fields from here on are preserved across CPU reset. */
>>       QEMUTimer *timer; /* Internal timer */
>> +
>> +    QEMUTimer *mtimer; /* Nuclei Internal timer */
> 
> Why do you need a timer here just for the Nuclei CPU?
> 

same as above

>> +    void *eclic;
>> +    uint32_t exccode;    /* irq id: 0~11  shv: 12 */
>> +    uint32_t eclic_flag;
>> +
>> +    bool irq_pending;
>>   };
>>
>>   OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
>> @@ -364,6 +402,8 @@ void riscv_cpu_list(void);
>>   void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
>>   int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
>>   uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
>> +void riscv_cpu_eclic_clean_pending(void *eclic, int irq);
>> +void riscv_cpu_eclic_get_next_interrupt(void *eclic);
>>   #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
>>   void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
>>                                uint32_t arg);
>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> index caf4599207..24ed7a99e1 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -149,6 +149,7 @@
>>   #define CSR_MIE             0x304
>>   #define CSR_MTVEC           0x305
>>   #define CSR_MCOUNTEREN      0x306
>> +#define CSR_MTVT      0x307 /* customized */
> 
> So I'm not sure what to do here. This seems to be a custom CSR just
> for the Nuclei that isn't part of the RISC-V spec or a draft spec.
> 
> The problem is that accepting custom specs into QEMU makes it hard for
> us to maintain the RISC-V port. After it has been merged the
> maintainers now have to understand the Nuclei CPU and support it as
> part of the core RISC-V code.
> 
> On the other hand I have seen a few CPUs that use CSRs and I don't
> want to not allow implementations that use custom CSRs. I think there
> is a compromise here. We probably don't want to support really custom
> features, but we probably can afford to support some extra CSRs.
> 
> I think the best course of action here is to split this patch up and
> we can then think about each custom feature/CSR and accept some
> depending on how intrusive they are into the QEMU code. It will also
> have to be added in a way that allows other implementations to have
> different custom CSRs. We (the QEMU RISC-V community) can help you
> with this.
> 
> Alistair
> 

Thanks for your comment. About customized csr, I have a rough idea, 
whether it is possible to open the interface for manufacturers to allow 
them to implement their own csr.To implement the registration callback 
interface, add a branch to the riscv_csrrw function, and define a switch 
for the cpu. When a custom csr is supported, the vendor registration is 
preferred.The manufacturer maintains its own csr and does not invade the 
qemu code much. Of course, there may be some unknown security and 
stability issues.

Regards
Wang Junqiang


