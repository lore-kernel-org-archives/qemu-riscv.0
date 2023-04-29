Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psgkr-0006TR-2u
	for mharc-qemu-riscv@gnu.org; Sat, 29 Apr 2023 05:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psgkp-0006Sx-50; Sat, 29 Apr 2023 05:20:31 -0400
Received: from [159.226.251.80] (helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psgkm-0002VE-Do; Sat, 29 Apr 2023 05:20:30 -0400
Received: from [192.168.0.120] (unknown [61.165.33.195])
 by APP-01 (Coremail) with SMTP id qwCowACnrnpN4UxkWLrQDA--.62553S2;
 Sat, 29 Apr 2023 17:20:13 +0800 (CST)
Message-ID: <dd440013-4eb5-7582-5830-1b161a867535@iscas.ac.cn>
Date: Sat, 29 Apr 2023 17:20:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH v3 2/4] target/riscv: Reuse tb->flags.FS
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230428165212.2800669-1-mchitale@ventanamicro.com>
 <20230428165212.2800669-3-mchitale@ventanamicro.com>
 <adad1915-aad9-1f17-0cec-7e5057c15624@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <adad1915-aad9-1f17-0cec-7e5057c15624@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACnrnpN4UxkWLrQDA--.62553S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4fJw45ur4rZF48XryxZrb_yoW5tr1rpr
 1kJr4UAryUJrn7J3WxJr15JryUJr1UJw1UJr18JF1UJr45Jr1jqr1UWr12gF1DJr48Xr1U
 AF1UZr1UZr4UJrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
 4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
 67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
 x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
 z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
 DU0xZFpf9x0JU4BT5UUUUU=
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
X-Host-Lookup-Failed: Reverse DNS lookup failed for 159.226.251.80 (deferred)
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_MSPIKE_H2=-0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 29 Apr 2023 09:20:31 -0000


On 2023/4/29 16:54, Richard Henderson wrote:
> On 4/28/23 17:52, Mayuresh Chitale wrote:
>> When misa.F is 0 tb->flags.FS field is unused and can be used to save
>> the current state of smstateen0.FCSR check which is needed by the
>> floating point translation routines.
>>
>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>> ---
>>   target/riscv/cpu_helper.c |  9 +++++++++
>>   target/riscv/translate.c  | 12 +++++++++++-
>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index b68dcfe7b6..126ac221a0 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -119,6 +119,15 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, 
>> target_ulong *pc,
>>           vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
>>       }
>>   +    /*
>> +     * If misa.F is 0 then the FS field of the tb->flags can be used 
>> to pass
>> +     * the current state of the smstateen.FCSR bit which must be 
>> checked for
>> +     * in the floating point translation routines.
>> +     */
>> +    if (!riscv_has_ext(env, RVF)) {
>> +        fs = (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == 
>> RISCV_EXCP_NONE);
>> +    }
>
> You have misunderstood my suggestion:
>
>     /* With Zfinx, floating point is enabled/disabled by Smstateen. */
>     if (!riscv_has_ext(env, RVF)) {
>         fs = (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR)
>               ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED);
>     }
>
>> +    bool smstateen_fcsr_ok;
>
> Not needed.
>
>> -    ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
>> +    if (has_ext(ctx, RVF)) {
>> +        ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
>> +    } else {
>> +        ctx->mstatus_fs = 0;
>> +    }
>
> Not needed.
>
> In patch 3, which should be merged with this, there are no changes to 
> REQUIRE_ZFINX_OR_F, no additional smstateen_fcsr_check, and 
> REQUIRE_FPU reduces to
>
> #define REQUIRE_FPU do {                          \
>     if (ctx->mstatus_fs == EXT_STATUS_DISABLED) { \
>         return false;                             \
>     }                                             \
> } while (0)
>
> This makes the DisasContext version of fs be the single gate for 
> floating point.
> No extra checks required.

Yeah. It's better to merge with REQUIRE_FPU.

However,  virtual instruction exception will be triggered in VS/VU mode 
if smstateen check fails, which is different from normal REQUIRE_FPU.

So, we may need to modify REQUIRE_FPU to distinguish them:

#define REQUIRE_FPU do {                          \
     if (ctx->mstatus_fs == EXT_STATUS_DISABLED) { \
           ctx->virt_inst_excp = ctx->virt_enabled && 
ctx->cfg_ptr->ext_zfinx;  \
           return false;                             \
     }                                             \
} while (0)

Regards,

Weiwei Li

>
>
> r~


