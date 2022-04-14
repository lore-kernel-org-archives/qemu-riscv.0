Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nep3d-0007qU-Fa
	for mharc-qemu-riscv@gnu.org; Wed, 13 Apr 2022 22:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nep3b-0007q7-Hz; Wed, 13 Apr 2022 22:18:03 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:36176 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nep3X-0007oL-Hs; Wed, 13 Apr 2022 22:18:03 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowADHzd1HhFdiW8OoAQ--.16311S2;
 Thu, 14 Apr 2022 10:17:45 +0800 (CST)
Subject: Re: [PATCH v9 12/14] target/riscv: rvk: add CSR support for Zkr
To: Alistair Francis <alistair23@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>, luruibo2000@163.com, lustrew@foxmail.com
References: <20220318041944.19859-1-liweiwei@iscas.ac.cn>
 <20220318041944.19859-13-liweiwei@iscas.ac.cn>
 <e00bf2b4-3c33-ffef-93a2-338917ff50b3@iscas.ac.cn>
 <CAKmqyKO+LzAO9U1TzhtrVnmPETbjbSGxdbQ-T=3pEqLzTAYi=A@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <bf8c14e7-0bdb-71cc-753c-dd7e8cbd8a6a@iscas.ac.cn>
Date: Thu, 14 Apr 2022 10:17:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKO+LzAO9U1TzhtrVnmPETbjbSGxdbQ-T=3pEqLzTAYi=A@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------1FB461D85E0B53D6BE7EA579"
Content-Language: en-US
X-CM-TRANSID: qwCowADHzd1HhFdiW8OoAQ--.16311S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr4ktw1rGrWruF4rJrWkWFg_yoWxKr1Upr
 4UC3y5CrW8ZFZ7Cw4ftr15XF15Gr1rGa15Jws7W3yUAr43J3yrAFnYqwsIqFn8Xa1kGr42
 9F4jkFnYkr47Za7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv
 7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7
 Aq67IIx4CEVc8vx2IErcIFxwACY4xI67k04243AVAKzVAKj4xxM4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4
 C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
 6c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
 0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
 c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aV
 AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr1l6VACY4xI67k04243AbIY
 CTnIWIevJa73UjIFyTuYvjfUnR6zUUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 14 Apr 2022 02:18:03 -0000

This is a multi-part message in MIME format.
--------------1FB461D85E0B53D6BE7EA579
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for your comments.

在 2022/4/14 上午7:57, Alistair Francis 写道:
> On Mon, Apr 11, 2022 at 2:46 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> Hi, any comments on this patch or patchset?
>>
>> Currently, read-only instruction to access Seed CSR is checked as a
>> special case in helper_csrr as suggested in
>>
>> https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00146.html.
> Ah sorry, I didn't realise you had updated this.
>
>> (The new version for that patch is in
>> https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00156.html)
>>
>> Regards,
>>
>> Weiwei Li
>>
>> 在 2022/3/18 下午12:19, Weiwei Li 写道:
>>>    - add SEED CSR which must be accessed with a read-write instruction:
>>>      A read-only instruction such as CSRRS/CSRRC with rs1=x0 or CSRRSI/CSRRCI
>>> with uimm=0 will raise an illegal instruction exception.
>>>    - add USEED, SSEED fields for MSECCFG CSR
>>>
>>> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
>>> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>> ---
>>>    target/riscv/cpu_bits.h  |  9 ++++++
>>>    target/riscv/csr.c       | 68 ++++++++++++++++++++++++++++++++++++++++
>>>    target/riscv/op_helper.c |  9 ++++++
>>>    target/riscv/pmp.h       |  8 +++--
>>>    4 files changed, 91 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>> index bb47cf7e77..d401100f47 100644
>>> --- a/target/riscv/cpu_bits.h
>>> +++ b/target/riscv/cpu_bits.h
>>> @@ -458,6 +458,9 @@
>>>    #define CSR_VSPMMASK        0x2c1
>>>    #define CSR_VSPMBASE        0x2c2
>>>
>>> +/* Crypto Extension */
>>> +#define CSR_SEED            0x015
>>> +
>>>    /* mstatus CSR bits */
>>>    #define MSTATUS_UIE         0x00000001
>>>    #define MSTATUS_SIE         0x00000002
>>> @@ -800,4 +803,10 @@ typedef enum RISCVException {
>>>    #define HVICTL_VALID_MASK                  \
>>>        (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
>>>
>>> +/* seed CSR bits */
>>> +#define SEED_OPST                        (0b11 << 30)
>>> +#define SEED_OPST_BIST                   (0b00 << 30)
>>> +#define SEED_OPST_WAIT                   (0b01 << 30)
>>> +#define SEED_OPST_ES16                   (0b10 << 30)
>>> +#define SEED_OPST_DEAD                   (0b11 << 30)
>>>    #endif
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index 3c61dd69af..5717a51f56 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.c
>>> @@ -24,6 +24,8 @@
>>>    #include "qemu/main-loop.h"
>>>    #include "exec/exec-all.h"
>>>    #include "sysemu/cpu-timers.h"
>>> +#include "qemu/guest-random.h"
>>> +#include "qapi/error.h"
>>>
>>>    /* CSR function table public API */
>>>    void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
>>> @@ -292,6 +294,40 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
>>>    }
>>>    #endif
>>>
>>> +static RISCVException seed(CPURISCVState *env, int csrno)
>>> +{
>>> +    RISCVCPU *cpu = env_archcpu(env);
>>> +
>>> +    if (!cpu->cfg.ext_zkr) {
>>> +        return RISCV_EXCP_ILLEGAL_INST;
>>> +    }
>>> +
>>> +#if !defined(CONFIG_USER_ONLY)
>>> +    if (riscv_has_ext(env, RVS) && riscv_has_ext(env, RVH)) {
>>> +        /* Hypervisor extension is supported */
>>> +        if (riscv_cpu_virt_enabled(env) && (env->priv != PRV_M)) {
> You can simplify this to just riscv_cpu_virt_enabled(). You don't need
> to check if we have the extension as well.

Yeah, Maybe It can merge into following logic, like:

if (env->priv == PRV_M) { //M
return RISCV_EXCP_NONE;
} else if (riscv_cpu_virt_enabled(env)) { //VS/VU
if (env->mseccfg & MSECCFG_SSEED) {
return RISCV_EXCP_NONE;
} else {
return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
}
} else { //S/U
if (env->priv == PRV_S && (env->mseccfg & MSECCFG_SSEED)) {
return RISCV_EXCP_NONE;
} else if (env->priv == PRV_U && (env->mseccfg & MSECCFG_USEED)) {
return RISCV_EXCP_NONE;
} else {
return RISCV_EXCP_ILLEGAL_INST;
}
}


>
>>> +            if (env->mseccfg & MSECCFG_SSEED) {
>>> +                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> +            } else {
>>> +                return RISCV_EXCP_ILLEGAL_INST;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    if (env->priv == PRV_M) {
>>> +        return RISCV_EXCP_NONE;
>>> +    } else if (env->priv == PRV_S && (env->mseccfg & MSECCFG_SSEED)) {
>>> +        return RISCV_EXCP_NONE;
>>> +    } else if (env->priv == PRV_U && (env->mseccfg & MSECCFG_USEED)) {
>>> +        return RISCV_EXCP_NONE;
>>> +    } else {
>>> +        return RISCV_EXCP_ILLEGAL_INST;
>>> +    }
>>> +#else
>>> +    return RISCV_EXCP_NONE;
>>> +#endif
>>> +}
>>> +
>>>    /* User Floating-Point CSRs */
>>>    static RISCVException read_fflags(CPURISCVState *env, int csrno,
>>>                                      target_ulong *val)
>>> @@ -2961,6 +2997,35 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
>>>
>>>    #endif
>>>
>>> +/* Crypto Extension */
>>> +static RISCVException rmw_seed(CPURISCVState *env, int csrno,
>>> +                              target_ulong *ret_value,
>>> +                              target_ulong new_value, target_ulong write_mask)
>>> +{
>>> +    uint16_t random_v;
>>> +    Error *random_e = NULL;
>>> +    int random_r;
>>> +
>>> +    random_r = qemu_guest_getrandom(&random_v, 2, &random_e);
>>> +    if (unlikely(random_r < 0)) {
>>> +        /*
>>> +         * Failed, for unknown reasons in the crypto subsystem.
>>> +         * The best we can do is log the reason and return a
>>> +         * failure indication to the guest.  There is no reason
>>> +         * we know to expect the failure to be transitory, so
>>> +         * indicate DEAD to avoid having the guest spin on WAIT.
>>> +         */
>>> +        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
>>> +                      __func__, error_get_pretty(random_e));
>>> +        error_free(random_e);
>>> +        *ret_value = SEED_OPST_DEAD;
>>> +    } else {
>>> +        *ret_value = random_v | SEED_OPST_ES16;
>>> +    }
> Won't this seg fault if a guest does a CSR write?

Yeah. Only CSR write seems have no function. However, it's not limited 
in the spec, so it's possible.

I'll add NULL judgement here.

>
>>> +
>>> +    return RISCV_EXCP_NONE;
>>> +}
>>> +
>>>    /*
>>>     * riscv_csrrw - read and/or update control and status register
>>>     *
>>> @@ -3205,6 +3270,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>>        [CSR_TIME]  = { "time",  ctr,   read_time  },
>>>        [CSR_TIMEH] = { "timeh", ctr32, read_timeh },
>>>
>>> +    /* Crypto Extension */
>>> +    [CSR_SEED] = { "seed", seed, NULL, NULL, rmw_seed },
>>> +
>>>    #if !defined(CONFIG_USER_ONLY)
>>>        /* Machine Timers and Counters */
>>>        [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
>>> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
>>> index e0d708091e..3d8443416d 100644
>>> --- a/target/riscv/op_helper.c
>>> +++ b/target/riscv/op_helper.c
>>> @@ -39,6 +39,15 @@ void helper_raise_exception(CPURISCVState *env, uint32_t exception)
>>>
>>>    target_ulong helper_csrr(CPURISCVState *env, int csr)
>>>    {
>>> +    /*
>>> +     * The seed CSR must be accessed with a read-write instruction. A
>>> +     * read-only instruction such as CSRRS/CSRRC with rs1=x0 or CSRRSI/
>>> +     * CSRRCI with uimm=0 will raise an illegal instruction exception.
>>> +     */
>>> +    if (csr == CSR_SEED) {
>>> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>>> +    }
>>> +
>>>        target_ulong val = 0;
>>>        RISCVException ret = riscv_csrrw(env, csr, &val, 0, 0, false);
>>>
>>> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
>>> index fcb6b7c467..a8dd797476 100644
>>> --- a/target/riscv/pmp.h
>>> +++ b/target/riscv/pmp.h
>>> @@ -39,9 +39,11 @@ typedef enum {
>>>    } pmp_am_t;
>>>
>>>    typedef enum {
>>> -    MSECCFG_MML  = 1 << 0,
>>> -    MSECCFG_MMWP = 1 << 1,
>>> -    MSECCFG_RLB  = 1 << 2
>>> +    MSECCFG_MML   = 1 << 0,
>>> +    MSECCFG_MMWP  = 1 << 1,
>>> +    MSECCFG_RLB   = 1 << 2,
> Why are these ones being changed?

They are changed to align with MSECCFG_USEED. Is it OK or just let them 
unchanged?

Regards,

Weiwei Li

>
> Alistair
>
>>> +    MSECCFG_USEED = 1 << 8,
>>> +    MSECCFG_SSEED = 1 << 9
>>>    } mseccfg_field_t;
>>>
>>>    typedef struct {
>>

--------------1FB461D85E0B53D6BE7EA579
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNv
bnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5Pgog
ICAgPHA+VGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLjxicj4KICAgIDwvcD4KICAgIDxkaXYg
Y2xhc3M9Im1vei1jaXRlLXByZWZpeCI+5ZyoIDIwMjIvNC8xNCDkuIrljYg3OjU3LCBBbGlz
dGFpciBGcmFuY2lzCiAgICAgIOWGmemBkzo8YnI+CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1
b3RlIHR5cGU9ImNpdGUiCmNpdGU9Im1pZDpDQUttcXlLTytMekFPOVUxVHpodHJWbm1QRVRi
amJTR3hkYlEtVD0zcEVxTHpUQVlpPUFAbWFpbC5nbWFpbC5jb20iPgogICAgICA8cHJlIGNs
YXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPk9uIE1vbiwgQXByIDExLCAyMDIyIGF0IDI6
NDYgUE0gV2Vpd2VpIExpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Im1haWx0bzpsaXdlaXdlaUBpc2Nhcy5hYy5jbiI+Jmx0O2xpd2Vpd2VpQGlzY2FzLmFjLmNu
Jmd0OzwvYT4gd3JvdGU6CjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4K
ICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpIaSwgYW55IGNv
bW1lbnRzIG9uIHRoaXMgcGF0Y2ggb3IgcGF0Y2hzZXQ/CgpDdXJyZW50bHksIHJlYWQtb25s
eSBpbnN0cnVjdGlvbiB0byBhY2Nlc3MgU2VlZCBDU1IgaXMgY2hlY2tlZCBhcyBhCnNwZWNp
YWwgY2FzZSBpbiBoZWxwZXJfY3NyciBhcyBzdWdnZXN0ZWQgaW4KCjxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vbGlzdHMubm9uZ251Lm9yZy9hcmNo
aXZlL2h0bWwvcWVtdS1yaXNjdi8yMDIyLTAzL21zZzAwMTQ2Lmh0bWwiPmh0dHBzOi8vbGlz
dHMubm9uZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1yaXNjdi8yMDIyLTAzL21zZzAwMTQ2
Lmh0bWw8L2E+Lgo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8cHJlIGNsYXNz
PSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpBaCBzb3JyeSwgSSBkaWRuJ3QgcmVhbGlzZSB5
b3UgaGFkIHVwZGF0ZWQgdGhpcy4KCjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJj
aXRlIj4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgooVGhl
IG5ldyB2ZXJzaW9uIGZvciB0aGF0IHBhdGNoIGlzIGluCjxhIGNsYXNzPSJtb3otdHh0LWxp
bmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vbGlzdHMubm9uZ251Lm9yZy9hcmNoaXZlL2h0
bWwvcWVtdS1yaXNjdi8yMDIyLTAzL21zZzAwMTU2Lmh0bWwiPmh0dHBzOi8vbGlzdHMubm9u
Z251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1yaXNjdi8yMDIyLTAzL21zZzAwMTU2Lmh0bWw8
L2E+KQoKUmVnYXJkcywKCldlaXdlaSBMaQoK5ZyoIDIwMjIvMy8xOCDkuIvljYgxMjoxOSwg
V2Vpd2VpIExpIOWGmemBkzoKPC9wcmU+CiAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+CiAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPiAgLSBh
ZGQgU0VFRCBDU1Igd2hpY2ggbXVzdCBiZSBhY2Nlc3NlZCB3aXRoIGEgcmVhZC13cml0ZSBp
bnN0cnVjdGlvbjoKICAgIEEgcmVhZC1vbmx5IGluc3RydWN0aW9uIHN1Y2ggYXMgQ1NSUlMv
Q1NSUkMgd2l0aCByczE9eDAgb3IgQ1NSUlNJL0NTUlJDSQp3aXRoIHVpbW09MCB3aWxsIHJh
aXNlIGFuIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZXhjZXB0aW9uLgogIC0gYWRkIFVTRUVELCBT
U0VFRCBmaWVsZHMgZm9yIE1TRUNDRkcgQ1NSCgpDby1hdXRob3JlZC1ieTogUnVpYm8gTHUg
PGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmx1cnVpYm8y
MDAwQDE2My5jb20iPiZsdDtsdXJ1aWJvMjAwMEAxNjMuY29tJmd0OzwvYT4KQ28tYXV0aG9y
ZWQtYnk6IFpld2VuIFllIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Im1haWx0bzpsdXN0cmV3QGZveG1haWwuY29tIj4mbHQ7bHVzdHJld0Bmb3htYWlsLmNvbSZn
dDs8L2E+ClNpZ25lZC1vZmYtYnk6IFdlaXdlaSBMaSA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LXJmYzIzOTZFIiBocmVmPSJtYWlsdG86bGl3ZWl3ZWlAaXNjYXMuYWMuY24iPiZsdDtsaXdl
aXdlaUBpc2Nhcy5hYy5jbiZndDs8L2E+ClNpZ25lZC1vZmYtYnk6IEp1bnFpYW5nIFdhbmcg
PGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOndhbmdqdW5x
aWFuZ0Bpc2Nhcy5hYy5jbiI+Jmx0O3dhbmdqdW5xaWFuZ0Bpc2Nhcy5hYy5jbiZndDs8L2E+
Ci0tLQogIHRhcmdldC9yaXNjdi9jcHVfYml0cy5oICB8ICA5ICsrKysrKwogIHRhcmdldC9y
aXNjdi9jc3IuYyAgICAgICB8IDY4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKICB0YXJnZXQvcmlzY3Yvb3BfaGVscGVyLmMgfCAgOSArKysrKysKICB0YXJn
ZXQvcmlzY3YvcG1wLmggICAgICAgfCAgOCArKystLQogIDQgZmlsZXMgY2hhbmdlZCwgOTEg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvcmlz
Y3YvY3B1X2JpdHMuaCBiL3RhcmdldC9yaXNjdi9jcHVfYml0cy5oCmluZGV4IGJiNDdjZjdl
NzcuLmQ0MDExMDBmNDcgMTAwNjQ0Ci0tLSBhL3RhcmdldC9yaXNjdi9jcHVfYml0cy5oCisr
KyBiL3RhcmdldC9yaXNjdi9jcHVfYml0cy5oCkBAIC00NTgsNiArNDU4LDkgQEAKICAjZGVm
aW5lIENTUl9WU1BNTUFTSyAgICAgICAgMHgyYzEKICAjZGVmaW5lIENTUl9WU1BNQkFTRSAg
ICAgICAgMHgyYzIKCisvKiBDcnlwdG8gRXh0ZW5zaW9uICovCisjZGVmaW5lIENTUl9TRUVE
ICAgICAgICAgICAgMHgwMTUKKwogIC8qIG1zdGF0dXMgQ1NSIGJpdHMgKi8KICAjZGVmaW5l
IE1TVEFUVVNfVUlFICAgICAgICAgMHgwMDAwMDAwMQogICNkZWZpbmUgTVNUQVRVU19TSUUg
ICAgICAgICAweDAwMDAwMDAyCkBAIC04MDAsNCArODAzLDEwIEBAIHR5cGVkZWYgZW51bSBS
SVNDVkV4Y2VwdGlvbiB7CiAgI2RlZmluZSBIVklDVExfVkFMSURfTUFTSyAgICAgICAgICAg
ICAgICAgIFwKICAgICAgKEhWSUNUTF9WVEkgfCBIVklDVExfSUlEIHwgSFZJQ1RMX0lQUklP
TSB8IEhWSUNUTF9JUFJJTykKCisvKiBzZWVkIENTUiBiaXRzICovCisjZGVmaW5lIFNFRURf
T1BTVCAgICAgICAgICAgICAgICAgICAgICAgICgwYjExICZsdDsmbHQ7IDMwKQorI2RlZmlu
ZSBTRUVEX09QU1RfQklTVCAgICAgICAgICAgICAgICAgICAoMGIwMCAmbHQ7Jmx0OyAzMCkK
KyNkZWZpbmUgU0VFRF9PUFNUX1dBSVQgICAgICAgICAgICAgICAgICAgKDBiMDEgJmx0OyZs
dDsgMzApCisjZGVmaW5lIFNFRURfT1BTVF9FUzE2ICAgICAgICAgICAgICAgICAgICgwYjEw
ICZsdDsmbHQ7IDMwKQorI2RlZmluZSBTRUVEX09QU1RfREVBRCAgICAgICAgICAgICAgICAg
ICAoMGIxMSAmbHQ7Jmx0OyAzMCkKICAjZW5kaWYKZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNj
di9jc3IuYyBiL3RhcmdldC9yaXNjdi9jc3IuYwppbmRleCAzYzYxZGQ2OWFmLi41NzE3YTUx
ZjU2IDEwMDY0NAotLS0gYS90YXJnZXQvcmlzY3YvY3NyLmMKKysrIGIvdGFyZ2V0L3Jpc2N2
L2Nzci5jCkBAIC0yNCw2ICsyNCw4IEBACiAgI2luY2x1ZGUgInFlbXUvbWFpbi1sb29wLmgi
CiAgI2luY2x1ZGUgImV4ZWMvZXhlYy1hbGwuaCIKICAjaW5jbHVkZSAic3lzZW11L2NwdS10
aW1lcnMuaCIKKyNpbmNsdWRlICJxZW11L2d1ZXN0LXJhbmRvbS5oIgorI2luY2x1ZGUgInFh
cGkvZXJyb3IuaCIKCiAgLyogQ1NSIGZ1bmN0aW9uIHRhYmxlIHB1YmxpYyBBUEkgKi8KICB2
b2lkIHJpc2N2X2dldF9jc3Jfb3BzKGludCBjc3JubywgcmlzY3ZfY3NyX29wZXJhdGlvbnMg
Km9wcykKQEAgLTI5Miw2ICsyOTQsNDAgQEAgc3RhdGljIFJJU0NWRXhjZXB0aW9uIGVwbXAo
Q1BVUklTQ1ZTdGF0ZSAqZW52LCBpbnQgY3Nybm8pCiAgfQogICNlbmRpZgoKK3N0YXRpYyBS
SVNDVkV4Y2VwdGlvbiBzZWVkKENQVVJJU0NWU3RhdGUgKmVudiwgaW50IGNzcm5vKQorewor
ICAgIFJJU0NWQ1BVICpjcHUgPSBlbnZfYXJjaGNwdShlbnYpOworCisgICAgaWYgKCFjcHUt
Jmd0O2NmZy5leHRfemtyKSB7CisgICAgICAgIHJldHVybiBSSVNDVl9FWENQX0lMTEVHQUxf
SU5TVDsKKyAgICB9CisKKyNpZiAhZGVmaW5lZChDT05GSUdfVVNFUl9PTkxZKQorICAgIGlm
IChyaXNjdl9oYXNfZXh0KGVudiwgUlZTKSAmYW1wOyZhbXA7IHJpc2N2X2hhc19leHQoZW52
LCBSVkgpKSB7CisgICAgICAgIC8qIEh5cGVydmlzb3IgZXh0ZW5zaW9uIGlzIHN1cHBvcnRl
ZCAqLworICAgICAgICBpZiAocmlzY3ZfY3B1X3ZpcnRfZW5hYmxlZChlbnYpICZhbXA7JmFt
cDsgKGVudi0mZ3Q7cHJpdiAhPSBQUlZfTSkpIHsKPC9wcmU+CiAgICAgICAgPC9ibG9ja3F1
b3RlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1w
cmUiIHdyYXA9IiI+CllvdSBjYW4gc2ltcGxpZnkgdGhpcyB0byBqdXN0IHJpc2N2X2NwdV92
aXJ0X2VuYWJsZWQoKS4gWW91IGRvbid0IG5lZWQKdG8gY2hlY2sgaWYgd2UgaGF2ZSB0aGUg
ZXh0ZW5zaW9uIGFzIHdlbGwuPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8cD5ZZWFo
LCBNYXliZSBJdCBjYW4gbWVyZ2UgaW50byBmb2xsb3dpbmcgbG9naWMsIGxpa2U6PC9wPgog
ICAgPGRpdiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyBm
b250LWZhbWlseTogJnF1b3Q7RHJvaWQgU2FucyBNb25vJnF1b3Q7LCAmcXVvdDttb25vc3Bh
Y2UmcXVvdDssIG1vbm9zcGFjZSwgJnF1b3Q7RHJvaWQgU2FucyBGYWxsYmFjayZxdW90Ozsg
Zm9udC13ZWlnaHQ6IG5vcm1hbDsgZm9udC1zaXplOiAxOHB4OyBsaW5lLWhlaWdodDogMjRw
eDsgd2hpdGUtc3BhY2U6IHByZTsiPjxkaXYgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IHJn
YigyNTUsIDI1NSwgMjU1KTsgZm9udC1mYW1pbHk6ICZxdW90O0Ryb2lkIFNhbnMgTW9ubyZx
dW90OywgJnF1b3Q7bW9ub3NwYWNlJnF1b3Q7LCBtb25vc3BhY2UsICZxdW90O0Ryb2lkIFNh
bnMgRmFsbGJhY2smcXVvdDs7IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGZvbnQtc2l6ZTogMThw
eDsgbGluZS1oZWlnaHQ6IDI0cHg7IHdoaXRlLXNwYWNlOiBwcmU7Ij48ZGl2Pjxmb250IGNv
bG9yPSIjMGUxNzBhIj4gICAgaWYgKGVudi0mZ3Q7cHJpdiA9PSBQUlZfTSkgeyAgLy9NPC9m
b250PjwvZGl2PjxkaXY+PGZvbnQgY29sb3I9IiMwZTE3MGEiPiAgICAgICAgcmV0dXJuIFJJ
U0NWX0VYQ1BfTk9ORTs8L2ZvbnQ+PC9kaXY+PGRpdj48Zm9udCBjb2xvcj0iIzBlMTcwYSI+
ICAgIH0gZWxzZSBpZiAocmlzY3ZfY3B1X3ZpcnRfZW5hYmxlZChlbnYpKSB7ICAvL1ZTL1ZV
PC9mb250PjwvZGl2PjxkaXY+PGZvbnQgY29sb3I9IiMwZTE3MGEiPiAgICAgICAgaWYgKGVu
di0mZ3Q7bXNlY2NmZyAmYW1wOyBNU0VDQ0ZHX1NTRUVEKSB7PC9mb250PjwvZGl2PjxkaXY+
PGZvbnQgY29sb3I9IiMwZTE3MGEiPiAgICAgICAgICAgIHJldHVybiBSSVNDVl9FWENQX05P
TkU7PC9mb250PjwvZGl2PjxkaXY+PGZvbnQgY29sb3I9IiMwZTE3MGEiPiAgICAgICAgfSBl
bHNlIHs8L2ZvbnQ+PC9kaXY+PGRpdj48Zm9udCBjb2xvcj0iIzBlMTcwYSI+ICAgICAgICAg
ICAgcmV0dXJuIFJJU0NWX0VYQ1BfVklSVF9JTlNUUlVDVElPTl9GQVVMVDs8L2ZvbnQ+PC9k
aXY+PGRpdj48Zm9udCBjb2xvcj0iIzBlMTcwYSI+ICAgICAgICB9PC9mb250PjwvZGl2Pjxk
aXY+PGZvbnQgY29sb3I9IiMwZTE3MGEiPiAgICB9IGVsc2UgeyAgLy9TL1U8L2ZvbnQ+PC9k
aXY+PGRpdj48Zm9udCBjb2xvcj0iIzBlMTcwYSI+ICAgICAgICBpZiAoZW52LSZndDtwcml2
ID09IFBSVl9TICZhbXA7JmFtcDsgKGVudi0mZ3Q7bXNlY2NmZyAmYW1wOyBNU0VDQ0ZHX1NT
RUVEKSkgezwvZm9udD48L2Rpdj48ZGl2Pjxmb250IGNvbG9yPSIjMGUxNzBhIj4gICAgICAg
ICAgICByZXR1cm4gUklTQ1ZfRVhDUF9OT05FOzwvZm9udD48L2Rpdj48ZGl2Pjxmb250IGNv
bG9yPSIjMGUxNzBhIj4gICAgICAgIH0gZWxzZSBpZiAoZW52LSZndDtwcml2ID09IFBSVl9V
ICZhbXA7JmFtcDsgKGVudi0mZ3Q7bXNlY2NmZyAmYW1wOyBNU0VDQ0ZHX1VTRUVEKSkgezwv
Zm9udD48L2Rpdj48ZGl2Pjxmb250IGNvbG9yPSIjMGUxNzBhIj4gICAgICAgICAgICByZXR1
cm4gUklTQ1ZfRVhDUF9OT05FOzwvZm9udD48L2Rpdj48ZGl2Pjxmb250IGNvbG9yPSIjMGUx
NzBhIj4gICAgICAgIH0gZWxzZSB7PC9mb250PjwvZGl2PjxkaXY+PGZvbnQgY29sb3I9IiMw
ZTE3MGEiPiAgICAgICAgICAgIHJldHVybiBSSVNDVl9FWENQX0lMTEVHQUxfSU5TVDs8L2Zv
bnQ+PC9kaXY+PGRpdj48Zm9udCBjb2xvcj0iIzBlMTcwYSI+ICAgICAgICB9PC9mb250Pjwv
ZGl2PjxkaXY+PGZvbnQgY29sb3I9IiMwZTE3MGEiPiAgICB9PC9mb250PjwvZGl2PjwvZGl2
PjwvZGl2PgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSIKY2l0ZT0ibWlkOkNBS21xeUtPK0x6QU85VTFUemh0clZubVBFVGJqYlNHeGRiUS1UPTNw
RXFMelRBWWk9QUBtYWlsLmdtYWlsLmNvbSI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90
ZS1wcmUiIHdyYXA9IiI+Cgo8L3ByZT4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+
CiAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICA8cHJlIGNsYXNz
PSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPisgICAgICAgICAgICBpZiAoZW52LSZndDttc2Vj
Y2ZnICZhbXA7IE1TRUNDRkdfU1NFRUQpIHsKKyAgICAgICAgICAgICAgICByZXR1cm4gUklT
Q1ZfRVhDUF9WSVJUX0lOU1RSVUNUSU9OX0ZBVUxUOworICAgICAgICAgICAgfSBlbHNlIHsK
KyAgICAgICAgICAgICAgICByZXR1cm4gUklTQ1ZfRVhDUF9JTExFR0FMX0lOU1Q7CisgICAg
ICAgICAgICB9CisgICAgICAgIH0KKyAgICB9CisKKyAgICBpZiAoZW52LSZndDtwcml2ID09
IFBSVl9NKSB7CisgICAgICAgIHJldHVybiBSSVNDVl9FWENQX05PTkU7CisgICAgfSBlbHNl
IGlmIChlbnYtJmd0O3ByaXYgPT0gUFJWX1MgJmFtcDsmYW1wOyAoZW52LSZndDttc2VjY2Zn
ICZhbXA7IE1TRUNDRkdfU1NFRUQpKSB7CisgICAgICAgIHJldHVybiBSSVNDVl9FWENQX05P
TkU7CisgICAgfSBlbHNlIGlmIChlbnYtJmd0O3ByaXYgPT0gUFJWX1UgJmFtcDsmYW1wOyAo
ZW52LSZndDttc2VjY2ZnICZhbXA7IE1TRUNDRkdfVVNFRUQpKSB7CisgICAgICAgIHJldHVy
biBSSVNDVl9FWENQX05PTkU7CisgICAgfSBlbHNlIHsKKyAgICAgICAgcmV0dXJuIFJJU0NW
X0VYQ1BfSUxMRUdBTF9JTlNUOworICAgIH0KKyNlbHNlCisgICAgcmV0dXJuIFJJU0NWX0VY
Q1BfTk9ORTsKKyNlbmRpZgorfQorCiAgLyogVXNlciBGbG9hdGluZy1Qb2ludCBDU1JzICov
CiAgc3RhdGljIFJJU0NWRXhjZXB0aW9uIHJlYWRfZmZsYWdzKENQVVJJU0NWU3RhdGUgKmVu
diwgaW50IGNzcm5vLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0YXJn
ZXRfdWxvbmcgKnZhbCkKQEAgLTI5NjEsNiArMjk5NywzNSBAQCBzdGF0aWMgUklTQ1ZFeGNl
cHRpb24gd3JpdGVfdXBtYmFzZShDUFVSSVNDVlN0YXRlICplbnYsIGludCBjc3JubywKCiAg
I2VuZGlmCgorLyogQ3J5cHRvIEV4dGVuc2lvbiAqLworc3RhdGljIFJJU0NWRXhjZXB0aW9u
IHJtd19zZWVkKENQVVJJU0NWU3RhdGUgKmVudiwgaW50IGNzcm5vLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdGFyZ2V0X3Vsb25nICpyZXRfdmFsdWUsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB0YXJnZXRfdWxvbmcgbmV3X3ZhbHVlLCB0YXJnZXRfdWxv
bmcgd3JpdGVfbWFzaykKK3sKKyAgICB1aW50MTZfdCByYW5kb21fdjsKKyAgICBFcnJvciAq
cmFuZG9tX2UgPSBOVUxMOworICAgIGludCByYW5kb21fcjsKKworICAgIHJhbmRvbV9yID0g
cWVtdV9ndWVzdF9nZXRyYW5kb20oJmFtcDtyYW5kb21fdiwgMiwgJmFtcDtyYW5kb21fZSk7
CisgICAgaWYgKHVubGlrZWx5KHJhbmRvbV9yICZsdDsgMCkpIHsKKyAgICAgICAgLyoKKyAg
ICAgICAgICogRmFpbGVkLCBmb3IgdW5rbm93biByZWFzb25zIGluIHRoZSBjcnlwdG8gc3Vi
c3lzdGVtLgorICAgICAgICAgKiBUaGUgYmVzdCB3ZSBjYW4gZG8gaXMgbG9nIHRoZSByZWFz
b24gYW5kIHJldHVybiBhCisgICAgICAgICAqIGZhaWx1cmUgaW5kaWNhdGlvbiB0byB0aGUg
Z3Vlc3QuICBUaGVyZSBpcyBubyByZWFzb24KKyAgICAgICAgICogd2Uga25vdyB0byBleHBl
Y3QgdGhlIGZhaWx1cmUgdG8gYmUgdHJhbnNpdG9yeSwgc28KKyAgICAgICAgICogaW5kaWNh
dGUgREVBRCB0byBhdm9pZCBoYXZpbmcgdGhlIGd1ZXN0IHNwaW4gb24gV0FJVC4KKyAgICAg
ICAgICovCisgICAgICAgIHFlbXVfbG9nX21hc2soTE9HX1VOSU1QLCAiJXM6IENyeXB0byBm
YWlsdXJlOiAlcyIsCisgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGVycm9yX2dl
dF9wcmV0dHkocmFuZG9tX2UpKTsKKyAgICAgICAgZXJyb3JfZnJlZShyYW5kb21fZSk7Cisg
ICAgICAgICpyZXRfdmFsdWUgPSBTRUVEX09QU1RfREVBRDsKKyAgICB9IGVsc2UgeworICAg
ICAgICAqcmV0X3ZhbHVlID0gcmFuZG9tX3YgfCBTRUVEX09QU1RfRVMxNjsKKyAgICB9Cjwv
cHJlPgogICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8
cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpXb24ndCB0aGlzIHNlZyBmYXVs
dCBpZiBhIGd1ZXN0IGRvZXMgYSBDU1Igd3JpdGU/PC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+
CiAgICA8cD5ZZWFoLiBPbmx5IENTUiB3cml0ZSBzZWVtcyBoYXZlIG5vIGZ1bmN0aW9uLiBI
b3dldmVyLCBpdCdzIG5vdAogICAgICBsaW1pdGVkIGluIHRoZSBzcGVjLCBzbyBpdCdzIHBv
c3NpYmxlLjwvcD4KICAgIDxwPkknbGwgYWRkIE5VTEwganVkZ2VtZW50IGhlcmUuPC9wPgog
ICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKY2l0ZT0ibWlkOkNBS21xeUtPK0x6QU85VTFU
emh0clZubVBFVGJqYlNHeGRiUS1UPTNwRXFMelRBWWk9QUBtYWlsLmdtYWlsLmNvbSI+CiAg
ICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+Cgo8L3ByZT4KICAgICAg
PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+CiAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPisKKyAg
ICByZXR1cm4gUklTQ1ZfRVhDUF9OT05FOworfQorCiAgLyoKICAgKiByaXNjdl9jc3JydyAt
IHJlYWQgYW5kL29yIHVwZGF0ZSBjb250cm9sIGFuZCBzdGF0dXMgcmVnaXN0ZXIKICAgKgpA
QCAtMzIwNSw2ICszMjcwLDkgQEAgcmlzY3ZfY3NyX29wZXJhdGlvbnMgY3NyX29wc1tDU1Jf
VEFCTEVfU0laRV0gPSB7CiAgICAgIFtDU1JfVElNRV0gID0geyAidGltZSIsICBjdHIsICAg
cmVhZF90aW1lICB9LAogICAgICBbQ1NSX1RJTUVIXSA9IHsgInRpbWVoIiwgY3RyMzIsIHJl
YWRfdGltZWggfSwKCisgICAgLyogQ3J5cHRvIEV4dGVuc2lvbiAqLworICAgIFtDU1JfU0VF
RF0gPSB7ICJzZWVkIiwgc2VlZCwgTlVMTCwgTlVMTCwgcm13X3NlZWQgfSwKKwogICNpZiAh
ZGVmaW5lZChDT05GSUdfVVNFUl9PTkxZKQogICAgICAvKiBNYWNoaW5lIFRpbWVycyBhbmQg
Q291bnRlcnMgKi8KICAgICAgW0NTUl9NQ1lDTEVdICAgID0geyAibWN5Y2xlIiwgICAgYW55
LCAgIHJlYWRfaW5zdHJldCAgfSwKZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9vcF9oZWxw
ZXIuYyBiL3RhcmdldC9yaXNjdi9vcF9oZWxwZXIuYwppbmRleCBlMGQ3MDgwOTFlLi4zZDg0
NDM0MTZkIDEwMDY0NAotLS0gYS90YXJnZXQvcmlzY3Yvb3BfaGVscGVyLmMKKysrIGIvdGFy
Z2V0L3Jpc2N2L29wX2hlbHBlci5jCkBAIC0zOSw2ICszOSwxNSBAQCB2b2lkIGhlbHBlcl9y
YWlzZV9leGNlcHRpb24oQ1BVUklTQ1ZTdGF0ZSAqZW52LCB1aW50MzJfdCBleGNlcHRpb24p
CgogIHRhcmdldF91bG9uZyBoZWxwZXJfY3NycihDUFVSSVNDVlN0YXRlICplbnYsIGludCBj
c3IpCiAgeworICAgIC8qCisgICAgICogVGhlIHNlZWQgQ1NSIG11c3QgYmUgYWNjZXNzZWQg
d2l0aCBhIHJlYWQtd3JpdGUgaW5zdHJ1Y3Rpb24uIEEKKyAgICAgKiByZWFkLW9ubHkgaW5z
dHJ1Y3Rpb24gc3VjaCBhcyBDU1JSUy9DU1JSQyB3aXRoIHJzMT14MCBvciBDU1JSU0kvCisg
ICAgICogQ1NSUkNJIHdpdGggdWltbT0wIHdpbGwgcmFpc2UgYW4gaWxsZWdhbCBpbnN0cnVj
dGlvbiBleGNlcHRpb24uCisgICAgICovCisgICAgaWYgKGNzciA9PSBDU1JfU0VFRCkgewor
ICAgICAgICByaXNjdl9yYWlzZV9leGNlcHRpb24oZW52LCBSSVNDVl9FWENQX0lMTEVHQUxf
SU5TVCwgR0VUUEMoKSk7CisgICAgfQorCiAgICAgIHRhcmdldF91bG9uZyB2YWwgPSAwOwog
ICAgICBSSVNDVkV4Y2VwdGlvbiByZXQgPSByaXNjdl9jc3JydyhlbnYsIGNzciwgJmFtcDt2
YWwsIDAsIDAsIGZhbHNlKTsKCmRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvcG1wLmggYi90
YXJnZXQvcmlzY3YvcG1wLmgKaW5kZXggZmNiNmI3YzQ2Ny4uYThkZDc5NzQ3NiAxMDA2NDQK
LS0tIGEvdGFyZ2V0L3Jpc2N2L3BtcC5oCisrKyBiL3RhcmdldC9yaXNjdi9wbXAuaApAQCAt
MzksOSArMzksMTEgQEAgdHlwZWRlZiBlbnVtIHsKICB9IHBtcF9hbV90OwoKICB0eXBlZGVm
IGVudW0gewotICAgIE1TRUNDRkdfTU1MICA9IDEgJmx0OyZsdDsgMCwKLSAgICBNU0VDQ0ZH
X01NV1AgPSAxICZsdDsmbHQ7IDEsCi0gICAgTVNFQ0NGR19STEIgID0gMSAmbHQ7Jmx0OyAy
CisgICAgTVNFQ0NGR19NTUwgICA9IDEgJmx0OyZsdDsgMCwKKyAgICBNU0VDQ0ZHX01NV1Ag
ID0gMSAmbHQ7Jmx0OyAxLAorICAgIE1TRUNDRkdfUkxCICAgPSAxICZsdDsmbHQ7IDIsCjwv
cHJlPgogICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8
cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpXaHkgYXJlIHRoZXNlIG9uZXMg
YmVpbmcgY2hhbmdlZD88L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxwPlRoZXkgYXJl
IGNoYW5nZWQgdG8gYWxpZ24gd2l0aCBNU0VDQ0ZHX1VTRUVELiBJcyBpdCBPSyBvciBqdXN0
CiAgICAgIGxldCB0aGVtIHVuY2hhbmdlZD88L3A+CiAgICA8cD5SZWdhcmRzLDwvcD4KICAg
IDxwPldlaXdlaSBMaTxicj4KICAgIDwvcD4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUi
CmNpdGU9Im1pZDpDQUttcXlLTytMekFPOVUxVHpodHJWbm1QRVRiamJTR3hkYlEtVD0zcEVx
THpUQVlpPUFAbWFpbC5nbWFpbC5jb20iPgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUt
cHJlIiB3cmFwPSIiPgoKQWxpc3RhaXIKCjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0eXBl
PSJjaXRlIj4KICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICAgIDxw
cmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+KyAgICBNU0VDQ0ZHX1VTRUVEID0g
MSAmbHQ7Jmx0OyA4LAorICAgIE1TRUNDRkdfU1NFRUQgPSAxICZsdDsmbHQ7IDkKICB9IG1z
ZWNjZmdfZmllbGRfdDsKCiAgdHlwZWRlZiBzdHJ1Y3Qgewo8L3ByZT4KICAgICAgICA8L2Js
b2NrcXVvdGU+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4K
CjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgPC9ib2R5
Pgo8L2h0bWw+Cg==
--------------1FB461D85E0B53D6BE7EA579--


