Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pixaY-0007Rs-Cg
	for mharc-qemu-riscv@gnu.org; Sun, 02 Apr 2023 09:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pixaX-0007Rf-1S; Sun, 02 Apr 2023 09:17:41 -0400
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pixaS-0003ds-3E; Sun, 02 Apr 2023 09:17:40 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Vf89-qS_1680441440; 
Received: from 192.168.3.95(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vf89-qS_1680441440) by smtp.aliyun-inc.com;
 Sun, 02 Apr 2023 21:17:21 +0800
Message-ID: <e0dc20a2-1a93-6c3d-b3e1-f62c7d1d61c9@linux.alibaba.com>
Date: Sun, 2 Apr 2023 21:17:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RESEND PATCH v5 4/6] target/riscv: Add support for PC-relative
 translation
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230401124935.20997-1-liweiwei@iscas.ac.cn>
 <20230401124935.20997-5-liweiwei@iscas.ac.cn>
 <15b60df7-40ca-330c-faa9-daaa78b2000d@linux.alibaba.com>
 <7e87df52-cc1d-4a85-a83b-f12b80b7f040@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <7e87df52-cc1d-4a85-a83b-f12b80b7f040@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.100;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-100.freemail.mail.aliyun.com
X-Spam_score_int: -122
X-Spam_score: -12.3
X-Spam_bar: ------------
X-Spam_report: (-12.3 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-2.37, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Sun, 02 Apr 2023 13:17:41 -0000


On 2023/4/2 16:17, liweiwei wrote:
>
> On 2023/4/2 08:34, LIU Zhiwei wrote:
>>
>> On 2023/4/1 20:49, Weiwei Li wrote:
>>> Add a base save_pc For
>> pc_save for
>>> PC-relative translation(CF_PCREL).
>>> Diable the directly sync pc from tb by riscv_cpu_synchronize_from_tb.
>>> Sync pc before it's used or updated from tb related pc:
>>>     real_pc = (old)env->pc + target_pc(from tb) - ctx->save_pc
>> pc_save in the code.
> OK. I'll fix this.
>>> Use gen_get_target_pc to compute target address of auipc and successor
>>> address of jalr.
>>>
>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/riscv/cpu.c                      | 29 +++++++++-----
>>>   target/riscv/insn_trans/trans_rvi.c.inc | 14 +++++--
>>>   target/riscv/translate.c                | 53 
>>> +++++++++++++++++++++----
>>>   3 files changed, 75 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 1e97473af2..646fa31a59 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -658,16 +658,18 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
>>>   static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>>>                                             const TranslationBlock *tb)
>>>   {
>>> -    RISCVCPU *cpu = RISCV_CPU(cs);
>>> -    CPURISCVState *env = &cpu->env;
>>> -    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
>>> +    if (!(tb_cflags(tb) & CF_PCREL)) {
>>> +        RISCVCPU *cpu = RISCV_CPU(cs);
>>> +        CPURISCVState *env = &cpu->env;
>>> +        RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
>>>   -    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
>>> +        tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
>>>   -    if (xl == MXL_RV32) {
>>> -        env->pc = (int32_t) tb->pc;
>>> -    } else {
>>> -        env->pc = tb->pc;
>>> +        if (xl == MXL_RV32) {
>>> +            env->pc = (int32_t) tb->pc;
>>> +        } else {
>>> +            env->pc = tb->pc;
>>> +        }
>>>       }
>>>   }
>>>   @@ -693,11 +695,18 @@ static void 
>>> riscv_restore_state_to_opc(CPUState *cs,
>>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>>       CPURISCVState *env = &cpu->env;
>>>       RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
>>> +    target_ulong pc;
>>> +
>>> +    if (tb_cflags(tb) & CF_PCREL) {
>>> +        pc = (env->pc & TARGET_PAGE_MASK) | data[0];
>>> +    } else {
>>> +        pc = data[0];
>>> +    }
>>>         if (xl == MXL_RV32) {
>>> -        env->pc = (int32_t)data[0];
>>> +        env->pc = (int32_t)pc;
>>>       } else {
>>> -        env->pc = data[0];
>>> +        env->pc = pc;
>>>       }
>>>       env->bins = data[1];
>>>   }
>>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc 
>>> b/target/riscv/insn_trans/trans_rvi.c.inc
>>> index 48c73cfcfe..52ef260eff 100644
>>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>>> @@ -38,7 +38,9 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
>>>     static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>>>   {
>>> -    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
>>> +    TCGv target_pc = dest_gpr(ctx, a->rd);
>>> +    gen_get_target_pc(target_pc, ctx, a->imm + ctx->base.pc_next);
>>> +    gen_set_gpr(ctx, a->rd, target_pc);
>>>       return true;
>>>   }
>>>   @@ -52,6 +54,7 @@ static bool trans_jalr(DisasContext *ctx, 
>>> arg_jalr *a)
>>>   {
>>>       TCGLabel *misaligned = NULL;
>>>       TCGv target_pc = tcg_temp_new();
>>> +    TCGv succ_pc = dest_gpr(ctx, a->rd);
>>>         tcg_gen_addi_tl(target_pc, get_gpr(ctx, a->rs1, EXT_NONE), 
>>> a->imm);
>>>       tcg_gen_andi_tl(target_pc, target_pc, (target_ulong)-2);
>>> @@ -68,7 +71,9 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr 
>>> *a)
>>>           tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
>>>       }
>>>   -    gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
>>> +    gen_get_target_pc(succ_pc, ctx, ctx->pc_succ_insn);
>>> +    gen_set_gpr(ctx, a->rd, succ_pc);
>>> +
>>>       tcg_gen_mov_tl(cpu_pc, target_pc);
>>>       lookup_and_goto_ptr(ctx);
>>>   @@ -159,6 +164,7 @@ static bool gen_branch(DisasContext *ctx, 
>>> arg_b *a, TCGCond cond)
>>>       TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
>>>       TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
>>>       target_ulong next_pc;
>>> +    target_ulong orig_pc_save = ctx->pc_save;
>>>         if (get_xl(ctx) == MXL_RV128) {
>>>           TCGv src1h = get_gprh(ctx, a->rs1);
>>> @@ -175,6 +181,7 @@ static bool gen_branch(DisasContext *ctx, arg_b 
>>> *a, TCGCond cond)
>>>         gen_set_label(l); /* branch taken */
>>>   +    ctx->pc_save = orig_pc_save;
>>>       next_pc = ctx->base.pc_next + a->imm;
>>>       if (!has_ext(ctx, RVC) && (next_pc & 0x3)) {
>>>           /* misaligned */
>>> @@ -182,8 +189,9 @@ static bool gen_branch(DisasContext *ctx, arg_b 
>>> *a, TCGCond cond)
>>>           gen_get_target_pc(target_pc, ctx, next_pc);
>>>           gen_exception_inst_addr_mis(ctx, target_pc);
>>>       } else {
>>> -        gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
>>> +        gen_goto_tb(ctx, 0, next_pc);
>>>       }
>>> +    ctx->pc_save = -1;
>>>       ctx->base.is_jmp = DISAS_NORETURN;
>>>         return true;
>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>> index 7b5223efc2..2dd594ddae 100644
>>> --- a/target/riscv/translate.c
>>> +++ b/target/riscv/translate.c
>>> @@ -59,6 +59,7 @@ typedef struct DisasContext {
>>>       DisasContextBase base;
>>>       /* pc_succ_insn points to the instruction following 
>>> base.pc_next */
>>>       target_ulong pc_succ_insn;
>>> +    target_ulong pc_save;
>>>       target_ulong priv_ver;
>>>       RISCVMXL misa_mxl_max;
>>>       RISCVMXL xl;
>>> @@ -225,15 +226,24 @@ static void decode_save_opc(DisasContext *ctx)
>>>   static void gen_get_target_pc(TCGv target, DisasContext *ctx,
>>>                                 target_ulong dest)
>>>   {
>>> -    if (get_xl(ctx) == MXL_RV32) {
>>> -        dest = (int32_t)dest;
>>> +    assert(ctx->pc_save != -1);
>>> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
>>> +        tcg_gen_addi_tl(target, cpu_pc, dest - ctx->pc_save);
>>> +        if (get_xl(ctx) == MXL_RV32) {
>>> +            tcg_gen_ext32s_tl(target, target);
>>> +        }
>>> +    } else {
>>> +        if (get_xl(ctx) == MXL_RV32) {
>>> +            dest = (int32_t)dest;
>>> +        }
>>> +        tcg_gen_movi_tl(target, dest);
>>>       }
>>> -    tcg_gen_movi_tl(target, dest);
>>>   }
>>>     static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
>>>   {
>>>       gen_get_target_pc(cpu_pc, ctx, dest);
>>> +    ctx->pc_save = dest;
>>
>> Why set pc_save here?  IMHO, pc_save is a constant.
>
> pc_save is a value which is strictly related to the value of env->pc.
> real_pc = (old)env->pc + target_pc(from tb) - ctx->pc_save

In this formula, the meaning of target_pc(from tb) doesn't match with 
gen_get_target_pc in the code. Its meaning in the code matches the 
real_pc in the formula. I think we should rename the gen_get_target_pc 
to gen_get_real_pc.

We should also move the comment in patch 5 to this patch. That will help 
us understand what we are doing here.

Absolute field in DisasContext used in translation should be replaced 
with a relative representation. For example, ctx->base.pc_next should 
replace with (cpu_pc + ctx->base.pc_next - ctx->base.pc_first).

So the formula can be described as,

real_pc =  env->pc + abs_dest_pc - abs_first_pc

>
> So it also needs update when cpu_pc is updated.

When cpu_pc updates (usually a jmp or branch instruction), we end the 
block at the same time.  Does a field in DisasContext, i.e., the 
ctx->pc_save still have some meaning after a block has been translated?

Zhiwei

> Regards,
>
> Weiwei Li
>
>>
>> Zhiwei
>>
>>>   }
>>>     static void generate_exception(DisasContext *ctx, int excp)
>>> @@ -287,8 +297,21 @@ static void gen_goto_tb(DisasContext *ctx, int 
>>> n, target_ulong dest)
>>>         * direct block chain benefits will be small.
>>>         */
>>>       if (translator_use_goto_tb(&ctx->base, dest) && !ctx->itrigger) {
>>> -        tcg_gen_goto_tb(n);
>>> -        gen_set_pc_imm(ctx, dest);
>>> +        /*
>>> +         * For pcrel, the pc must always be up-to-date on entry to
>>> +         * the linked TB, so that it can use simple additions for all
>>> +         * further adjustments.  For !pcrel, the linked TB is compiled
>>> +         * to know its full virtual address, so we can delay the
>>> +         * update to pc to the unlinked path.  A long chain of links
>>> +         * can thus avoid many updates to the PC.
>>> +         */
>>> +        if (tb_cflags(ctx->base.tb) & CF_PCREL) {
>>> +            gen_set_pc_imm(ctx, dest);
>>> +            tcg_gen_goto_tb(n);
>>> +        } else {
>>> +            tcg_gen_goto_tb(n);
>>> +            gen_set_pc_imm(ctx, dest);
>>> +        }
>>>           tcg_gen_exit_tb(ctx->base.tb, n);
>>>       } else {
>>>           gen_set_pc_imm(ctx, dest);
>>> @@ -555,8 +578,16 @@ static void gen_jal(DisasContext *ctx, int rd, 
>>> target_ulong imm)
>>>           }
>>>       }
>>>   -    gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
>>> -    gen_goto_tb(ctx, 0, ctx->base.pc_next + imm); /* must use this 
>>> for safety */
>>> +    assert(ctx->pc_save != -1);
>>> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
>>> +        TCGv succ_pc = dest_gpr(ctx, rd);
>>> +        tcg_gen_addi_tl(succ_pc, cpu_pc, ctx->pc_succ_insn - 
>>> ctx->pc_save);
>>> +        gen_set_gpr(ctx, rd, succ_pc);
>>> +    } else {
>>> +        gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
>>> +    }
>>> +
>>> +    gen_goto_tb(ctx, 0, next_pc); /* must use this for safety */
>>>       ctx->base.is_jmp = DISAS_NORETURN;
>>>   }
>>>   @@ -1150,6 +1181,7 @@ static void 
>>> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>>       uint32_t tb_flags = ctx->base.tb->flags;
>>>   +    ctx->pc_save = ctx->base.pc_first;
>>>       ctx->pc_succ_insn = ctx->base.pc_first;
>>>       ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
>>>       ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
>>> @@ -1195,8 +1227,13 @@ static void 
>>> riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
>>>   static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState 
>>> *cpu)
>>>   {
>>>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>>> +    target_ulong pc_next = ctx->base.pc_next;
>>> +
>>> +    if (tb_cflags(dcbase->tb) & CF_PCREL) {
>>> +        pc_next &= ~TARGET_PAGE_MASK;
>>> +    }
>>>   -    tcg_gen_insn_start(ctx->base.pc_next, 0);
>>> +    tcg_gen_insn_start(pc_next, 0);
>>>       ctx->insn_start = tcg_last_op();
>>>   }

