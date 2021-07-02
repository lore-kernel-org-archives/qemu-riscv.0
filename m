Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lzCOn-0000Pr-3l
	for mharc-qemu-riscv@gnu.org; Fri, 02 Jul 2021 02:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lzCOl-0000OU-IT; Fri, 02 Jul 2021 02:11:35 -0400
Received: from out28-49.mail.aliyun.com ([115.124.28.49]:59299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lzCOV-0000Ry-RB; Fri, 02 Jul 2021 02:11:35 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.549934-0.000145545-0.449921;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.Kb3B7HL_1625206268; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Kb3B7HL_1625206268)
 by smtp.aliyun-inc.com(10.147.42.253);
 Fri, 02 Jul 2021 14:11:08 +0800
Subject: Re: [RFC PATCH 01/11] target/riscv: Add CLIC CSR mintstatus
To: Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-2-zhiwei_liu@c-sky.com>
 <CAKmqyKMc4TiKgJKM8nUpGR+hWAyUAdjh8bG7chBAdsXq57-V5A@mail.gmail.com>
 <20304ba9-6f87-f7b9-a24d-15d4b3d3f75a@c-sky.com>
 <CANzO1D0zjHowQp46fWmnoPB=ChUuh5-=Q+ajWxpv2yFzONP9gg@mail.gmail.com>
 <CAKmqyKNwES2zU9QfusTy-bnL1ByBP0zi-8=tqLBtS_8p+24Ghg@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <3e7f6ec6-21a0-9a21-8126-68ea8c2fbf15@c-sky.com>
Date: Fri, 2 Jul 2021 14:09:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNwES2zU9QfusTy-bnL1ByBP0zi-8=tqLBtS_8p+24Ghg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.49; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-49.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 02 Jul 2021 06:11:35 -0000


On 2021/7/2 下午1:38, Alistair Francis wrote:
> On Thu, Jul 1, 2021 at 6:45 PM Frank Chang <frank.chang@sifive.com> wrote:
>> LIU Zhiwei <zhiwei_liu@c-sky.com> 於 2021年4月20日 週二 上午8:49寫道：
>>>
>>> On 2021/4/20 上午7:23, Alistair Francis wrote:
>>>> On Fri, Apr 9, 2021 at 5:52 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>>>> CSR mintstatus holds the active interrupt level for each supported
>>>>> privilege mode. sintstatus, and user, uintstatus, provide restricted
>>>>> views of mintstatus.
>>>>>
>>>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>>>> ---
>>>>>    target/riscv/cpu.h      |  2 ++
>>>>>    target/riscv/cpu_bits.h | 11 +++++++++++
>>>>>    target/riscv/csr.c      | 26 ++++++++++++++++++++++++++
>>>>>    3 files changed, 39 insertions(+)
>>>>>
>>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>>> index 0a33d387ba..1a44ca62c7 100644
>>>>> --- a/target/riscv/cpu.h
>>>>> +++ b/target/riscv/cpu.h
>>>>> @@ -159,6 +159,7 @@ struct CPURISCVState {
>>>>>        target_ulong mip;
>>>>>
>>>>>        uint32_t miclaim;
>>>>> +    uint32_t mintstatus; /* clic-spec */
>>>>>
>>>>>        target_ulong mie;
>>>>>        target_ulong mideleg;
>>>>> @@ -243,6 +244,7 @@ struct CPURISCVState {
>>>>>
>>>>>        /* Fields from here on are preserved across CPU reset. */
>>>>>        QEMUTimer *timer; /* Internal timer */
>>>>> +    void *clic;       /* clic interrupt controller */
>>>> This should be the CLIC type.
>>> OK.
>>>
>>> Actually there are many versions of CLIC in my branch as different
>>> devices. But it is better to use CLIC type for the upstream version.
>>
>> Hi Alistair and Zhiwei,
>>
>> Replacing void *clic with RISCVCLICState *clic may create a circular loop
>> because CPURISCVState is also referenced in riscv_clic.h.
>>
>> However, I would like to ask what is the best approach to add
>> the reference of CLIC device in CPURISCVState struct?
>>
>> There may be different kinds of CLIC devices.
>> AFAK, there was another RFC patchset trying to add void *eclic
>> for Nuclei processor into CPURISCVState struct:
>> https://patchwork.kernel.org/project/qemu-devel/patch/20210507081654.11056-2-wangjunqiang@iscas.ac.cn/
>>
>> Is it okay to add the device reference directly into CPURISCVState struct like that,
>> or we should create some abstraction for these CLIC devices?
>> (However, I'm not sure how big the differences are for these CLIC devices...)
> I would prefer to not have the CLIC in the struct at all.
>
> Why is the CLIC required from the CPU?

In my opinion,   the tight coupled interrupt controller, like NVIC in 
ARM,  is much different from other devices.
CPU harts need to communicate with it through many ways.

We can store the CLIC instance in the struct CPURISCVState or a global 
variable.  Is that any other way?

> I'm guessing we at least need it for CLIC CSR accesses. Could we
> handle that in the CPU and avoid needing a reference to the CLIC?
CSR access is one case. Other cases are:

1. When process an interrupt and decide ISP address,  we need to know 
current interrupt is vectored or not.

2.  When interrupt returned, we need to choose another interrupt to 
serve, so that it will not miss any interrupt.

Thanks,
Zhiwei
>
> Alistair
>
>> Thanks,
>> Frank Chang
>>
>>>
>>>>>    };
>>>>>
>>>>>    OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
>>>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>>>> index caf4599207..c4ce6ec3d9 100644
>>>>> --- a/target/riscv/cpu_bits.h
>>>>> +++ b/target/riscv/cpu_bits.h
>>>>> @@ -165,6 +165,7 @@
>>>>>    #define CSR_MCAUSE          0x342
>>>>>    #define CSR_MTVAL           0x343
>>>>>    #define CSR_MIP             0x344
>>>>> +#define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
>>>>>
>>>>>    /* Legacy Machine Trap Handling (priv v1.9.1) */
>>>>>    #define CSR_MBADADDR        0x343
>>>>> @@ -183,6 +184,7 @@
>>>>>    #define CSR_SCAUSE          0x142
>>>>>    #define CSR_STVAL           0x143
>>>>>    #define CSR_SIP             0x144
>>>>> +#define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
>>>>>
>>>>>    /* Legacy Supervisor Trap Handling (priv v1.9.1) */
>>>>>    #define CSR_SBADADDR        0x143
>>>>> @@ -585,6 +587,15 @@
>>>>>    #define SIP_STIP                           MIP_STIP
>>>>>    #define SIP_SEIP                           MIP_SEIP
>>>>>
>>>>> +/* mintstatus */
>>>>> +#define MINTSTATUS_MIL                     0xff000000 /* mil[7:0] */
>>>>> +#define MINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
>>>>> +#define MINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
>>>>> +
>>>>> +/* sintstatus */
>>>>> +#define SINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
>>>>> +#define SINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
>>>> The bit fields in the comments are out of date.
>>> I didn't notice it.   Fix it in next version.
>>>
>>> Thanks.
>>>
>>> Zhiwei
>>>
>>>> Alistair
>>>>
>>>>> +
>>>>>    /* MIE masks */
>>>>>    #define MIE_SEIE                           (1 << IRQ_S_EXT)
>>>>>    #define MIE_UEIE                           (1 << IRQ_U_EXT)
>>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>>> index d2585395bf..320b18ab60 100644
>>>>> --- a/target/riscv/csr.c
>>>>> +++ b/target/riscv/csr.c
>>>>> @@ -188,6 +188,12 @@ static int pmp(CPURISCVState *env, int csrno)
>>>>>    {
>>>>>        return -!riscv_feature(env, RISCV_FEATURE_PMP);
>>>>>    }
>>>>> +
>>>>> +static int clic(CPURISCVState *env, int csrno)
>>>>> +{
>>>>> +    return !!env->clic;
>>>>> +}
>>>>> +
>>>>>    #endif
>>>>>
>>>>>    /* User Floating-Point CSRs */
>>>>> @@ -734,6 +740,12 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
>>>>>        return 0;
>>>>>    }
>>>>>
>>>>> +static int read_mintstatus(CPURISCVState *env, int csrno, target_ulong *val)
>>>>> +{
>>>>> +    *val = env->mintstatus;
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>    /* Supervisor Trap Setup */
>>>>>    static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *val)
>>>>>    {
>>>>> @@ -893,6 +905,13 @@ static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
>>>>>        return ret;
>>>>>    }
>>>>>
>>>>> +static int read_sintstatus(CPURISCVState *env, int csrno, target_ulong *val)
>>>>> +{
>>>>> +    target_ulong mask = SINTSTATUS_SIL | SINTSTATUS_UIL;
>>>>> +    *val = env->mintstatus & mask;
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>    /* Supervisor Protection and Translation */
>>>>>    static int read_satp(CPURISCVState *env, int csrno, target_ulong *val)
>>>>>    {
>>>>> @@ -1644,5 +1663,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>>>>        [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", any32,  read_zero },
>>>>>        [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", any32,  read_zero },
>>>>>        [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", any32,  read_zero },
>>>>> +
>>>>> +    /* Machine Mode Core Level Interrupt Controller */
>>>>> +    [CSR_MINTSTATUS] = { "mintstatus", clic,  read_mintstatus },
>>>>> +
>>>>> +    /* Supervisor Mode Core Level Interrupt Controller */
>>>>> +    [CSR_SINTSTATUS] = { "sintstatus", clic,  read_sintstatus },
>>>>> +
>>>>>    #endif /* !CONFIG_USER_ONLY */
>>>>>    };
>>>>> --
>>>>> 2.25.1
>>>>>
>>>>>

