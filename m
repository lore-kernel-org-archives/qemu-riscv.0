Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjXdG-0004lc-6Z
	for mharc-qemu-riscv@gnu.org; Mon, 03 Apr 2023 23:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjXdF-0004lQ-Bs; Mon, 03 Apr 2023 23:46:53 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjXdA-0001OI-GU; Mon, 03 Apr 2023 23:46:53 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAC3sz+dnStkh0CgGg--.65352S2;
 Tue, 04 Apr 2023 11:46:37 +0800 (CST)
Message-ID: <943a4563-2f63-1885-47d6-ec2a23552672@iscas.ac.cn>
Date: Tue, 4 Apr 2023 11:46:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v6 4/6] target/riscv: Add support for PC-relative
 translation
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
 <20230404020653.18911-5-liweiwei@iscas.ac.cn>
 <3bd89c54-3a20-1031-1502-a8744c2caa36@linux.alibaba.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <3bd89c54-3a20-1031-1502-a8744c2caa36@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAC3sz+dnStkh0CgGg--.65352S2
X-Coremail-Antispam: 1UD129KBjvAXoW3tw4fAr1rtr1fXrWUGr1rJFb_yoW8JryxWo
 WUKr4rJr13XrWYgr17Gr18Jr13Xr1UGrsrtr1UGr9rJw1xAr1UJ3y8JrW0v3y7JF18GryU
 XF18JF1jyFyUAr13n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYg7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
 sGvfC2KfnxnUUI43ZEXa7VU1a9aPUUUUU==
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
X-List-Received-Date: Tue, 04 Apr 2023 03:46:53 -0000


On 2023/4/4 11:12, LIU Zhiwei wrote:
>
> On 2023/4/4 10:06, Weiwei Li wrote:
>> Add a base pc_save for PC-relative translation(CF_PCREL).
>> Diable the directly sync pc from tb by riscv_cpu_synchronize_from_tb.
>> We can get pc-relative address from following formula:
>>    real_pc = (old)env->pc + diff, where diff = target_pc - ctx->pc_save.
>> Use gen_get_target_pc to compute target address of auipc and successor
>> address of jalr and jal.
>>
>> The existence of CF_PCREL can improve performance with the guest
>> kernel's address space randomization.  Each guest process maps libc.so
>> (et al) at a different virtual address, and this allows those
>> translations to be shared.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/cpu.c                      | 29 +++++++++------
>>   target/riscv/insn_trans/trans_rvi.c.inc | 14 ++++++--
>
> Miss the process for trans_ebreak.
>
> I want to construct the PCREL feature on the processing of ctx pc 
> related fields, which is the reason why we need do specially process. 
> For example,
>
>  static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>  {
> -    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
> +    if (tb_cflags(ctx->cflags) & CF_PCREL) {
> +        target_ulong pc_rel = ctx->base.pc_next - ctx->base.pc_first 
> + a->imm;
> +        gen_set_gpr_pcrel(ctx, a->rd, cpu_pc, pc_rel);
> +    } else {
> +        gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
> +    }
>      return true;
>  }
>
> +static void gen_set_gpr_pcrel(DisasContext *ctx, int reg_num, TCGv t, 
> target_ulong rel)
> +{
> +    TCGv dest = dest_gpr(ctx, reg_num);
> +    tcg_gen_addi_tl(dest, t, rel);
> +    gen_set_gpr(ctx, reg_num, dest);
> +}
> +
>
> But if it is too difficult to reuse the current implementation, your 
> implementation is also acceptable to me.

Sorry, I don't get your idea. gen_pc_plus_diff() can do all the above job.

Regards,

Weiwei Li

>
> Zhiwei
>
>>   target/riscv/translate.c | 48 ++++++++++++++++++++-----
>>   3 files changed, 70 insertions(+), 21 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 1e97473af2..646fa31a59 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -658,16 +658,18 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
>>   static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>>                                             const TranslationBlock *tb)
>>   {
>> -    RISCVCPU *cpu = RISCV_CPU(cs);
>> -    CPURISCVState *env = &cpu->env;
>> -    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
>> +    if (!(tb_cflags(tb) & CF_PCREL)) {
>> +        RISCVCPU *cpu = RISCV_CPU(cs);
>> +        CPURISCVState *env = &cpu->env;
>> +        RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
>>   -    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
>> +        tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
>>   -    if (xl == MXL_RV32) {
>> -        env->pc = (int32_t) tb->pc;
>> -    } else {
>> -        env->pc = tb->pc;
>> +        if (xl == MXL_RV32) {
>> +            env->pc = (int32_t) tb->pc;
>> +        } else {
>> +            env->pc = tb->pc;
>> +        }
>>       }
>>   }
>>   @@ -693,11 +695,18 @@ static void 
>> riscv_restore_state_to_opc(CPUState *cs,
>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>       CPURISCVState *env = &cpu->env;
>>       RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
>> +    target_ulong pc;
>> +
>> +    if (tb_cflags(tb) & CF_PCREL) {
>> +        pc = (env->pc & TARGET_PAGE_MASK) | data[0];
>> +    } else {
>> +        pc = data[0];
>> +    }
>>         if (xl == MXL_RV32) {
>> -        env->pc = (int32_t)data[0];
>> +        env->pc = (int32_t)pc;
>>       } else {
>> -        env->pc = data[0];
>> +        env->pc = pc;
>>       }
>>       env->bins = data[1];
>>   }
>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc 
>> b/target/riscv/insn_trans/trans_rvi.c.inc
>> index cc72864d32..7cbbdac5aa 100644
>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>> @@ -38,7 +38,9 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
>>     static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>>   {
>> -    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
>> +    TCGv target_pc = dest_gpr(ctx, a->rd);
>> +    gen_pc_plus_diff(target_pc, ctx, a->imm + ctx->base.pc_next);
>> +    gen_set_gpr(ctx, a->rd, target_pc);
>>       return true;
>>   }
>>   @@ -52,6 +54,7 @@ static bool trans_jalr(DisasContext *ctx, 
>> arg_jalr *a)
>>   {
>>       TCGLabel *misaligned = NULL;
>>       TCGv target_pc = tcg_temp_new();
>> +    TCGv succ_pc = dest_gpr(ctx, a->rd);
>>         tcg_gen_addi_tl(target_pc, get_gpr(ctx, a->rs1, EXT_NONE), 
>> a->imm);
>>       tcg_gen_andi_tl(target_pc, target_pc, (target_ulong)-2);
>> @@ -68,7 +71,9 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>>           tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
>>       }
>>   -    gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
>> +    gen_pc_plus_diff(succ_pc, ctx, ctx->pc_succ_insn);
>> +    gen_set_gpr(ctx, a->rd, succ_pc);
>> +
>>       tcg_gen_mov_tl(cpu_pc, target_pc);
>>       lookup_and_goto_ptr(ctx);
>>   @@ -159,6 +164,7 @@ static bool gen_branch(DisasContext *ctx, arg_b 
>> *a, TCGCond cond)
>>       TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
>>       TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
>>       target_ulong next_pc;
>> +    target_ulong orig_pc_save = ctx->pc_save;
>>         if (get_xl(ctx) == MXL_RV128) {
>>           TCGv src1h = get_gprh(ctx, a->rs1);
>> @@ -175,6 +181,7 @@ static bool gen_branch(DisasContext *ctx, arg_b 
>> *a, TCGCond cond)
>>         gen_set_label(l); /* branch taken */
>>   +    ctx->pc_save = orig_pc_save;
>>       next_pc = ctx->base.pc_next + a->imm;
>>       if (!has_ext(ctx, RVC) && (next_pc & 0x3)) {
>>           /* misaligned */
>> @@ -182,8 +189,9 @@ static bool gen_branch(DisasContext *ctx, arg_b 
>> *a, TCGCond cond)
>>           gen_pc_plus_diff(target_pc, ctx, next_pc);
>>           gen_exception_inst_addr_mis(ctx, target_pc);
>>       } else {
>> -        gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
>> +        gen_goto_tb(ctx, 0, next_pc);
>>       }
>> +    ctx->pc_save = -1;
>>       ctx->base.is_jmp = DISAS_NORETURN;
>>         return true;
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index d434fedb37..4623749602 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -59,6 +59,7 @@ typedef struct DisasContext {
>>       DisasContextBase base;
>>       /* pc_succ_insn points to the instruction following 
>> base.pc_next */
>>       target_ulong pc_succ_insn;
>> +    target_ulong pc_save;
>>       target_ulong priv_ver;
>>       RISCVMXL misa_mxl_max;
>>       RISCVMXL xl;
>> @@ -225,15 +226,24 @@ static void decode_save_opc(DisasContext *ctx)
>>   static void gen_pc_plus_diff(TCGv target, DisasContext *ctx,
>>                                 target_ulong dest)
>>   {
>> -    if (get_xl(ctx) == MXL_RV32) {
>> -        dest = (int32_t)dest;
>> +    assert(ctx->pc_save != -1);
>> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
>> +        tcg_gen_addi_tl(target, cpu_pc, dest - ctx->pc_save);
>> +        if (get_xl(ctx) == MXL_RV32) {
>> +            tcg_gen_ext32s_tl(target, target);
>> +        }
>> +    } else {
>> +        if (get_xl(ctx) == MXL_RV32) {
>> +            dest = (int32_t)dest;
>> +        }
>> +        tcg_gen_movi_tl(target, dest);
>>       }
>> -    tcg_gen_movi_tl(target, dest);
>>   }
>>     static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
>>   {
>>       gen_pc_plus_diff(cpu_pc, ctx, dest);
>> +    ctx->pc_save = dest;
>>   }
>>     static void generate_exception(DisasContext *ctx, int excp)
>> @@ -287,8 +297,21 @@ static void gen_goto_tb(DisasContext *ctx, int 
>> n, target_ulong dest)
>>         * direct block chain benefits will be small.
>>         */
>>       if (translator_use_goto_tb(&ctx->base, dest) && !ctx->itrigger) {
>> -        tcg_gen_goto_tb(n);
>> -        gen_set_pc_imm(ctx, dest);
>> +        /*
>> +         * For pcrel, the pc must always be up-to-date on entry to
>> +         * the linked TB, so that it can use simple additions for all
>> +         * further adjustments.  For !pcrel, the linked TB is compiled
>> +         * to know its full virtual address, so we can delay the
>> +         * update to pc to the unlinked path.  A long chain of links
>> +         * can thus avoid many updates to the PC.
>> +         */
>> +        if (tb_cflags(ctx->base.tb) & CF_PCREL) {
>> +            gen_set_pc_imm(ctx, dest);
>> +            tcg_gen_goto_tb(n);
>> +        } else {
>> +            tcg_gen_goto_tb(n);
>> +            gen_set_pc_imm(ctx, dest);
>> +        }
>>           tcg_gen_exit_tb(ctx->base.tb, n);
>>       } else {
>>           gen_set_pc_imm(ctx, dest);
>> @@ -543,6 +566,7 @@ static void gen_set_fpr_d(DisasContext *ctx, int 
>> reg_num, TCGv_i64 t)
>>   static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>>   {
>>       target_ulong next_pc;
>> +    TCGv succ_pc = dest_gpr(ctx, rd);
>>         /* check misaligned: */
>>       next_pc = ctx->base.pc_next + imm;
>> @@ -555,8 +579,10 @@ static void gen_jal(DisasContext *ctx, int rd, 
>> target_ulong imm)
>>           }
>>       }
>>   -    gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
>> -    gen_goto_tb(ctx, 0, ctx->base.pc_next + imm); /* must use this 
>> for safety */
>> +    gen_pc_plus_diff(succ_pc, ctx, ctx->pc_succ_insn);
>> +    gen_set_gpr(ctx, rd, succ_pc);
>> +
>> +    gen_goto_tb(ctx, 0, next_pc); /* must use this for safety */
>>       ctx->base.is_jmp = DISAS_NORETURN;
>>   }
>>   @@ -1150,6 +1176,7 @@ static void 
>> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>       uint32_t tb_flags = ctx->base.tb->flags;
>>   +    ctx->pc_save = ctx->base.pc_first;
>>       ctx->pc_succ_insn = ctx->base.pc_first;
>>       ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
>>       ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
>> @@ -1195,8 +1222,13 @@ static void riscv_tr_tb_start(DisasContextBase 
>> *db, CPUState *cpu)
>>   static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState 
>> *cpu)
>>   {
>>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>> +    target_ulong pc_next = ctx->base.pc_next;
>> +
>> +    if (tb_cflags(dcbase->tb) & CF_PCREL) {
>> +        pc_next &= ~TARGET_PAGE_MASK;
>> +    }
>>   -    tcg_gen_insn_start(ctx->base.pc_next, 0);
>> +    tcg_gen_insn_start(pc_next, 0);
>>       ctx->insn_start = tcg_last_op();
>>   }


