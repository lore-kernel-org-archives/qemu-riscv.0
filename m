Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSTMI-0000vU-Q4
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 20:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSTME-0000uU-SS; Wed, 15 Feb 2023 20:46:47 -0500
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSTMB-0002dt-Qc; Wed, 15 Feb 2023 20:46:46 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R311e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Vbm27MG_1676511993; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vbm27MG_1676511993) by smtp.aliyun-inc.com;
 Thu, 16 Feb 2023 09:46:34 +0800
Message-ID: <21dedcd4-3483-c080-7a00-6bfeacbfb314@linux.alibaba.com>
Date: Thu, 16 Feb 2023 09:46:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 RFC Zisslpcfi 1/9] target/riscv: adding zimops and
 zisslpcfi extension to RISCV cpu config
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-2-debug@rivosinc.com>
 <64a76da4-62d3-61f3-e8a8-347e3aa7eaca@linux.alibaba.com>
 <CAKC1njQEcuEO=TSkK8qzywADYGh6cFLLUKLJ4fTfULHvKPOa=w@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <CAKC1njQEcuEO=TSkK8qzywADYGh6cFLLUKLJ4fTfULHvKPOa=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.257, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Thu, 16 Feb 2023 01:46:48 -0000


On 2023/2/16 4:47, Deepak Gupta wrote:
> On Tue, Feb 14, 2023 at 6:52 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>>
>> On 2023/2/9 14:23, Deepak Gupta wrote:
>>> Introducing riscv `zisslpcfi` extension to riscv target. `zisslpcfi`
>>> extension provides hardware assistance to riscv hart to enable control
>>> flow integrity (CFI) for software.
>>>
>>> `zisslpcfi` extension expects hart to implement `zimops`. `zimops` stands
>>> for "unprivileged integer maybe operations". `zimops` carve out certain
>>> reserved opcodes encodings from integer spec to "may be operations"
>>> encodings. `zimops` opcode encodings simply move 0 to rd.
>>> `zisslpcfi` claims some of the `zimops` encodings and use them for shadow
>>> stack management or indirect branch tracking. Any future extension can
>>> also claim `zimops` encodings.
>> Does  the zimops has a independent specification? If so, you should give
>> a link to this
>> specification.
> Actual formal documentation is still a work in progress.
> I am hoping to provide a reference to it in my next iteration.
>
>>> This patch also adds a dependency check for `zimops` to be enabled if
>>> `zisslpcfi` is enabled on the hart.
>> You should don't add two extensions in one patch. I think you should add
>> them one by one.
>> And add the zimop first.  In my opinion, you should implement the whole
>> zimop extension before
>> adding any patch for zisslpcfi, including the implementation of mop.rr
>> and mop.r.
> Noted will make sure of that and will send two different patch series then.

We can rearrange the patch set as follows:

1. Implement the zimop extension.

2. Implement the forward cfi only for system mode.

3. Implement the backward cfi only for system mode.

4. Carefully make the forward cfi can work on user mode.

5. Carefully make the backward cfi work for user mode.

I don't think we can easily make cfi  work on user mode. So we can also 
ignore the 4 or 5, or both.

Thus, we don't have to implement a patch like the patch 8, which is too 
big to review.


Zhiwei

>
>>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>> Signed-off-by: Kip Walker  <kip@rivosinc.com>
>>> ---
>>>    target/riscv/cpu.c | 13 +++++++++++++
>>>    target/riscv/cpu.h |  2 ++
>>>    2 files changed, 15 insertions(+)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index cc75ca7667..6b4e90eb91 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -110,6 +110,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
>>>        ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>>>        ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
>>>        ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
>>> +    ISA_EXT_DATA_ENTRY(zimops, true, PRIV_VERSION_1_12_0, ext_zimops),
>>> +    ISA_EXT_DATA_ENTRY(zisslpcfi, true, PRIV_VERSION_1_12_0, ext_cfi),
>> Add them one by one.
>>>    };
>>>
>>>    static bool isa_ext_is_enabled(RISCVCPU *cpu,
>>> @@ -792,6 +794,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>>                return;
>>>            }
>>>
>>> +        if (cpu->cfg.ext_cfi && !cpu->cfg.ext_zimops) {
>>> +            error_setg(errp, "Zisslpcfi extension requires Zimops extension");
>>> +            return;
>>> +        }
>>> +
>> Seems reasonable for me.
>>>            /* Set the ISA extensions, checks should have happened above */
>>>            if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
>>>                cpu->cfg.ext_zhinxmin) {
>>> @@ -1102,6 +1109,12 @@ static Property riscv_cpu_properties[] = {
>>>    #ifndef CONFIG_USER_ONLY
>>>        DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
>>>    #endif
>>> +    /*
>>> +     * Zisslpcfi CFI extension, Zisslpcfi implicitly means Zimops is
>>> +     * implemented
>>> +     */
>>> +    DEFINE_PROP_BOOL("zisslpcfi", RISCVCPU, cfg.ext_cfi, true),
>>> +    DEFINE_PROP_BOOL("zimops", RISCVCPU, cfg.ext_zimops, true),
>> Default value should be false.
> Yes, I have to fix this.
>
>> Zhiwei
>>
>>>        DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
>>>
>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> index f5609b62a2..9a923760b2 100644
>>> --- a/target/riscv/cpu.h
>>> +++ b/target/riscv/cpu.h
>>> @@ -471,6 +471,8 @@ struct RISCVCPUConfig {
>>>        uint32_t mvendorid;
>>>        uint64_t marchid;
>>>        uint64_t mimpid;
>>> +    bool ext_zimops;
>>> +    bool ext_cfi;
>>>
>>>        /* Vendor-specific custom extensions */
>>>        bool ext_XVentanaCondOps;

