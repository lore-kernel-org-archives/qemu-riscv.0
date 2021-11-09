Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkKz1-0007SL-EX
	for mharc-qemu-riscv@gnu.org; Tue, 09 Nov 2021 01:51:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkKyz-0007Pf-Ss; Tue, 09 Nov 2021 01:51:49 -0500
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkKyv-00009Q-NW; Tue, 09 Nov 2021 01:51:49 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436373|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.201897-0.00202343-0.796079;
 FP=13473780182429951569|1|1|5|0|-1|-1|-1; HT=ay29a033018047193;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=6; RT=6; SR=0;
 TI=SMTPD_---.LptPzow_1636440699; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LptPzow_1636440699) by smtp.aliyun-inc.com(10.147.40.2);
 Tue, 09 Nov 2021 14:51:39 +0800
Subject: Re: [PATCH 11/13] target/riscv: Switch context in exception return
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-12-zhiwei_liu@c-sky.com>
 <0105910e-fd68-21ea-8ff0-36752dd0b2e7@linaro.org>
 <272298c9-280d-5b0d-4d57-a8e9a4ab0849@c-sky.com>
Message-ID: <797199df-cc8c-9f73-6d01-b2325601f00f@c-sky.com>
Date: Tue, 9 Nov 2021 14:51:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <272298c9-280d-5b0d-4d57-a8e9a4ab0849@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.172; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-172.mail.aliyun.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.364,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 09 Nov 2021 06:51:50 -0000

We only have to process the special CSRs(like vtype/misa) when xlen 
changes,  according to the explicitly  specified behavior about the CSR 
width change behavior.
For normal CSRs, the default behavior in section 2.4 , CSR Width 
Modulation, is enough.

And if we split the vill out, we will never need this patch. So I will 
remove it next patch set.

Thanks,
Zhiwei

On 2021/11/8 下午7:23, LIU Zhiwei wrote:
>
> On 2021/11/2 上午12:43, Richard Henderson wrote:
>> On 11/1/21 6:01 AM, LIU Zhiwei wrote:
>>> After excpetion return, we should give a xlen view of context in new
>>> priveledge, including the general registers, pc, and CSRs.
>>>
>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>> ---
>>>   target/riscv/helper.h                         |  1 +
>>>   .../riscv/insn_trans/trans_privileged.c.inc   |  2 ++
>>>   target/riscv/op_helper.c                      | 26 
>>> +++++++++++++++++++
>>>   3 files changed, 29 insertions(+)
>>>
>>> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
>>> index e198d43981..9b379d7232 100644
>>> --- a/target/riscv/helper.h
>>> +++ b/target/riscv/helper.h
>>> @@ -71,6 +71,7 @@ DEF_HELPER_2(sret, tl, env, tl)
>>>   DEF_HELPER_2(mret, tl, env, tl)
>>>   DEF_HELPER_1(wfi, void, env)
>>>   DEF_HELPER_1(tlb_flush, void, env)
>>> +DEF_HELPER_1(switch_context_xl, void, env)
>>>   #endif
>>>     /* Hypervisor functions */
>>> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc 
>>> b/target/riscv/insn_trans/trans_privileged.c.inc
>>> index 75c6ef80a6..6e39632f83 100644
>>> --- a/target/riscv/insn_trans/trans_privileged.c.inc
>>> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
>>> @@ -78,6 +78,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret 
>>> *a)
>>>         if (has_ext(ctx, RVS)) {
>>>           gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
>>> +        gen_helper_switch_context_xl(cpu_env);
>>>           tcg_gen_exit_tb(NULL, 0); /* no chaining */
>>>           ctx->base.is_jmp = DISAS_NORETURN;
>>>       } else {
>>> @@ -94,6 +95,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret 
>>> *a)
>>>   #ifndef CONFIG_USER_ONLY
>>>       tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
>>>       gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
>>> +    gen_helper_switch_context_xl(cpu_env);
>>>       tcg_gen_exit_tb(NULL, 0); /* no chaining */
>>>       ctx->base.is_jmp = DISAS_NORETURN;
>>>       return true;
>>> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
>>> index ee7c24efe7..20cf8ad883 100644
>>> --- a/target/riscv/op_helper.c
>>> +++ b/target/riscv/op_helper.c
>>> @@ -70,6 +70,32 @@ target_ulong helper_csrrw(CPURISCVState *env, int 
>>> csr,
>>>   }
>>>     #ifndef CONFIG_USER_ONLY
>>> +void helper_switch_context_xl(CPURISCVState *env)
>>> +{
>>> +    RISCVMXL xl = cpu_get_xl(env);
>>> +    if (xl == env->misa_mxl_max) {
>>> +        return;
>>> +    }
>>> +    assert(xl < env->misa_mxl_max);
>>> +    switch (xl) {
>>> +    case MXL_RV32:
>>> +        for (int i = 1; i < 32; i++) {
>>> +            env->gpr[i] = (int32_t)env->gpr[i];
>>> +        }
>>
>> I think this is wrong.  As I read the spec, the new context ignores 
>> high bits and writes sign-extended values, but registers that are not 
>> written should not be changed.
> I think so.
>>
>> I think that a unit test with SXLEN == 64 and UXLEN == 32, where the 
>> U-mode program executes only the ECALL instruction, should leave the 
>> high 32 bits of all gprs unchanged on re-entry to S-mode.
> Re-entry to U-mode?  I think you are right.  But currently I don't 
> have a hardware has implemented the UXL32.
>>
>>> +        env->pc = (int32_t)env->pc;
>>
>> I think this will happen naturally via patch 3.
> Maybe we have to sign extend here as clarified in other reply.
>>
>>> +        /*
>>> +         * For the read-only bits of the previous-width CSR, the 
>>> bits at the
>>> +         * same positions in the temporary register are set to zeros.
>>> +         */
>>> +        if ((env->priv == PRV_U) && (env->misa_ext & RVV)) {
>>> +            env->vl = 0;
>>> +            env->vtype = 0;
>>> +        }
>>
>> I don't understand this.  The return from the S-mode interrupt 
>> handler to the U-mode program should preserve the U-mode VTYPE.
>>
>>
> According to the privileged architecture specification,  section 2.5,  
> if the width of a CSR is changed, the read-only bits of the 
> previous-width CSR are zeroed.
> More general,  there is an algorithm how to calculate the new CSR 
> value from the previous CSR.
>
> I am not sure which is the right time  to do this context switch. The 
> write time of  UXL field , or return to the U-mode?
>
>
> Thanks,
> Zhiwei
>
>> r~
>

