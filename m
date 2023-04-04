Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjXUN-0002AJ-Ej
	for mharc-qemu-riscv@gnu.org; Mon, 03 Apr 2023 23:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjXUL-0002A2-W4; Mon, 03 Apr 2023 23:37:42 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjXUI-0005vh-CZ; Mon, 03 Apr 2023 23:37:41 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAC3vc11mytkXMWfGg--.28663S2;
 Tue, 04 Apr 2023 11:37:26 +0800 (CST)
Message-ID: <3556d0e3-0361-6521-eee6-86879a2deec0@iscas.ac.cn>
Date: Tue, 4 Apr 2023 11:37:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v6 3/6] target/riscv: Fix target address to update badaddr
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
 <20230404020653.18911-4-liweiwei@iscas.ac.cn>
 <ac3488ec-43a9-ad6d-c132-52e2edd7c83d@linux.alibaba.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <ac3488ec-43a9-ad6d-c132-52e2edd7c83d@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAC3vc11mytkXMWfGg--.28663S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw1UWr17Cr1ftF4rKw4UArb_yoWxZr4rpF
 1kGryUWrW5Gr95J3WUJF4UJFy5Jr48Ga1DJw1xA3W8KF47Jr1jgr1UXrsIgryUCr48Xr1Y
 yF1UArnFvF43XFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.349,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 04 Apr 2023 03:37:42 -0000


On 2023/4/4 11:06, LIU Zhiwei wrote:
>
> On 2023/4/4 10:06, Weiwei Li wrote:
>> Compute the target address before storing it into badaddr
>> when mis-aligned exception is triggered.
>> Use a target_pc temp to store the target address to avoid
>> the confusing operation that udpate target address into
>> cpu_pc before misalign check, then update it into badaddr
>> and restore cpu_pc to current pc if exception is triggered.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/insn_trans/trans_rvi.c.inc | 23 ++++++++++++++++-------
>>   target/riscv/translate.c                | 21 ++++++++++-----------
>>   2 files changed, 26 insertions(+), 18 deletions(-)
>>
>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc 
>> b/target/riscv/insn_trans/trans_rvi.c.inc
>> index 4ad54e8a49..cc72864d32 100644
>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>> @@ -51,25 +51,30 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
>>   static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>>   {
>>       TCGLabel *misaligned = NULL;
>> +    TCGv target_pc = tcg_temp_new();
>>   -    tcg_gen_addi_tl(cpu_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
>> -    tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>> +    tcg_gen_addi_tl(target_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
>> +    tcg_gen_andi_tl(target_pc, target_pc, (target_ulong)-2);
>> +
>> +    if (get_xl(ctx) == MXL_RV32) {
>> +        tcg_gen_ext32s_tl(target_pc, target_pc);
>> +    }
> Delete this.

The (signed-extended)target_pc should be used in both updating cpu_pc 
and  following gen_exception_inst_addr_mis().

So we cannot delete it and just resue  the logic in gen_set_pc().

This is also why  I use  tcg_gen_mov_tl(cpu_pc, target_pc) directly in 
following code.

Regards,

Weiwei Li

>> -    gen_set_pc(ctx, cpu_pc);
>>       if (!has_ext(ctx, RVC)) {
>>           TCGv t0 = tcg_temp_new();
>>             misaligned = gen_new_label();
>> -        tcg_gen_andi_tl(t0, cpu_pc, 0x2);
>> +        tcg_gen_andi_tl(t0, target_pc, 0x2);
>>           tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
>>       }
>>         gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
>> +    tcg_gen_mov_tl(cpu_pc, target_pc);
>
> And we can use the gen_set_pc instead.
>
> I think the reason you want to delete gen_set_pc is to make the 
> gen_set_pc_imm the only API to change the cpu_pc.
>
> This implicitly enhance the correctness, which may constrain the 
> scalable.
>
> Zhiwei
>
>>       lookup_and_goto_ptr(ctx);
>>         if (misaligned) {
>>           gen_set_label(misaligned);
>> -        gen_exception_inst_addr_mis(ctx);
>> +        gen_exception_inst_addr_mis(ctx, target_pc);
>>       }
>>       ctx->base.is_jmp = DISAS_NORETURN;
>>   @@ -153,6 +158,7 @@ static bool gen_branch(DisasContext *ctx, arg_b 
>> *a, TCGCond cond)
>>       TCGLabel *l = gen_new_label();
>>       TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
>>       TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
>> +    target_ulong next_pc;
>>         if (get_xl(ctx) == MXL_RV128) {
>>           TCGv src1h = get_gprh(ctx, a->rs1);
>> @@ -169,9 +175,12 @@ static bool gen_branch(DisasContext *ctx, arg_b 
>> *a, TCGCond cond)
>>         gen_set_label(l); /* branch taken */
>>   -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
>> +    next_pc = ctx->base.pc_next + a->imm;
>> +    if (!has_ext(ctx, RVC) && (next_pc & 0x3)) {
>>           /* misaligned */
>> -        gen_exception_inst_addr_mis(ctx);
>> +        TCGv target_pc = tcg_temp_new();
>> +        gen_pc_plus_diff(target_pc, ctx, next_pc);
>> +        gen_exception_inst_addr_mis(ctx, target_pc);
>>       } else {
>>           gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
>>       }
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index 0ee8ee147d..d434fedb37 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -222,21 +222,18 @@ static void decode_save_opc(DisasContext *ctx)
>>       ctx->insn_start = NULL;
>>   }
>>   -static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
>> +static void gen_pc_plus_diff(TCGv target, DisasContext *ctx,
>> +                              target_ulong dest)
>>   {
>>       if (get_xl(ctx) == MXL_RV32) {
>>           dest = (int32_t)dest;
>>       }
>> -    tcg_gen_movi_tl(cpu_pc, dest);
>> +    tcg_gen_movi_tl(target, dest);
>>   }
>>   -static void gen_set_pc(DisasContext *ctx, TCGv dest)
>> +static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
>>   {
>> -    if (get_xl(ctx) == MXL_RV32) {
>> -        tcg_gen_ext32s_tl(cpu_pc, dest);
>> -    } else {
>> -        tcg_gen_mov_tl(cpu_pc, dest);
>> -    }
>> +    gen_pc_plus_diff(cpu_pc, ctx, dest);
>>   }
>>     static void generate_exception(DisasContext *ctx, int excp)
>> @@ -257,9 +254,9 @@ static void gen_exception_illegal(DisasContext *ctx)
>>       }
>>   }
>>   -static void gen_exception_inst_addr_mis(DisasContext *ctx)
>> +static void gen_exception_inst_addr_mis(DisasContext *ctx, TCGv target)
>>   {
>> -    tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
>> +    tcg_gen_st_tl(target, cpu_env, offsetof(CPURISCVState, badaddr));
>>       generate_exception(ctx, RISCV_EXCP_INST_ADDR_MIS);
>>   }
>>   @@ -551,7 +548,9 @@ static void gen_jal(DisasContext *ctx, int rd, 
>> target_ulong imm)
>>       next_pc = ctx->base.pc_next + imm;
>>       if (!has_ext(ctx, RVC)) {
>>           if ((next_pc & 0x3) != 0) {
>> -            gen_exception_inst_addr_mis(ctx);
>> +            TCGv target_pc = tcg_temp_new();
>> +            gen_pc_plus_diff(target_pc, ctx, next_pc);
>> +            gen_exception_inst_addr_mis(ctx, target_pc);
>>               return;
>>           }
>>       }


