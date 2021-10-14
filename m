Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mawYe-0004yf-Ji
	for mharc-qemu-riscv@gnu.org; Thu, 14 Oct 2021 04:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mawYc-0004xU-3w; Thu, 14 Oct 2021 04:57:46 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:39794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mawYW-0002AR-Na; Thu, 14 Oct 2021 04:57:45 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id BE84040E1E;
 Thu, 14 Oct 2021 10:57:34 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id B0F2060066;
 Thu, 14 Oct 2021 10:57:34 +0200 (CEST)
Received: from [192.168.1.76] (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id D6C4440063;
 Thu, 14 Oct 2021 10:57:33 +0200 (CEST)
To: LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 fabien.portas@grenoble-inp.org
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-10-richard.henderson@linaro.org>
 <bb08b1eb-ab48-165a-ed49-72a9bf22fd75@c-sky.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v2 09/13] target/riscv: Replace DisasContext.w with
 DisasContext.ol
Message-ID: <420e773b-ca49-9130-8497-971269f6929c@univ-grenoble-alpes.fr>
Date: Thu, 14 Oct 2021 10:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <bb08b1eb-ab48-165a-ed49-72a9bf22fd75@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (40)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 14 Oct 2021 08:57:46 -0000

Hi,
Le 14/10/2021 à 10:40, LIU Zhiwei a écrit :
> 
> On 2021/10/14 上午4:51, Richard Henderson wrote:
>> In preparation for RV128, consider more than just "w" for
>> operand size modification.  This will be used for the "d"
>> insns from RV128 as well.
>>
>> Rename oper_len to get_olen to better match get_xlen.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/translate.c                | 71 ++++++++++++++++---------
>>   target/riscv/insn_trans/trans_rvb.c.inc |  8 +--
>>   target/riscv/insn_trans/trans_rvi.c.inc | 18 +++----
>>   target/riscv/insn_trans/trans_rvm.c.inc | 10 ++--
>>   4 files changed, 63 insertions(+), 44 deletions(-)
>>
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index 5724a62bb0..6ab5c6aa58 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -67,7 +67,7 @@ typedef struct DisasContext {
>>          to any system register, which includes CSR_FRM, so we do not have
>>          to reset this known value.  */
>>       int frm;
>> -    bool w;
>> +    RISCVMXL ol;
> 
> Why not directly use the xl?

  Hi Zhiwei,

  I am not speaking for Richard, but my understanding is that 'ol' is linked to
  the instruction being translated, suffixed by 'w' in rv64 and 'w' and 'd' in
  rv128, while 'xl' is the value in mstatus (or misa) depending on the register
  size of the current execution (mxl, sxl, uxl).
  Note that the spec says that the insns results should be sign-extended to the
  maximum mxl size supported by the processor (held in misa_mxl_max, that is
  implicitely in tl right now, but that will need to be put into the disas
  context in 128-bit).
  To summarize, we have the maximum (processor instanciation time) register size
  in misa_mxl_max, the current register size in xl, and the current insn size in
  ol.

  Frédéric
> 
> Thanks,
> Zhiwei
> 
>>       bool virt_enabled;
>>       bool ext_ifencei;
>>       bool hlsx;
>> @@ -103,12 +103,17 @@ static inline int get_xlen(DisasContext *ctx)
>>       return 16 << get_xl(ctx);
>>   }
>>   -/* The word size for this operation. */
>> -static inline int oper_len(DisasContext *ctx)
>> -{
>> -    return ctx->w ? 32 : TARGET_LONG_BITS;
>> -}
>> +/* The operation length, as opposed to the xlen. */
>> +#ifdef TARGET_RISCV32
>> +#define get_ol(ctx)    MXL_RV32
>> +#else
>> +#define get_ol(ctx)    ((ctx)->ol)
>> +#endif
>>   +static inline int get_olen(DisasContext *ctx)
>> +{
>> +    return 16 << get_ol(ctx);
>> +}
>>     /*
>>    * RISC-V requires NaN-boxing of narrower width floating point values.
>> @@ -221,24 +226,34 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num,
>> DisasExtend ext)
>>           return ctx->zero;
>>       }
>>   -    switch (ctx->w ? ext : EXT_NONE) {
>> -    case EXT_NONE:
>> -        return cpu_gpr[reg_num];
>> -    case EXT_SIGN:
>> -        t = temp_new(ctx);
>> -        tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
>> -        return t;
>> -    case EXT_ZERO:
>> -        t = temp_new(ctx);
>> -        tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
>> -        return t;
>> +    switch (get_ol(ctx)) {
>> +    case MXL_RV32:
>> +        switch (ext) {
>> +        case EXT_NONE:
>> +            break;
>> +        case EXT_SIGN:
>> +            t = temp_new(ctx);
>> +            tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
>> +            return t;
>> +        case EXT_ZERO:
>> +            t = temp_new(ctx);
>> +            tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
>> +            return t;
>> +        default:
>> +            g_assert_not_reached();
>> +        }
>> +        break;
>> +    case MXL_RV64:
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>>       }
>> -    g_assert_not_reached();
>> +    return cpu_gpr[reg_num];
>>   }
>>     static TCGv dest_gpr(DisasContext *ctx, int reg_num)
>>   {
>> -    if (reg_num == 0 || ctx->w) {
>> +    if (reg_num == 0 || get_olen(ctx) < TARGET_LONG_BITS) {
>>           return temp_new(ctx);
>>       }
>>       return cpu_gpr[reg_num];
>> @@ -247,10 +262,15 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num)
>>   static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
>>   {
>>       if (reg_num != 0) {
>> -        if (ctx->w) {
>> +        switch (get_ol(ctx)) {
>> +        case MXL_RV32:
>>               tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
>> -        } else {
>> +            break;
>> +        case MXL_RV64:
>>               tcg_gen_mov_tl(cpu_gpr[reg_num], t);
>> +            break;
>> +        default:
>> +            g_assert_not_reached();
>>           }
>>       }
>>   }
>> @@ -411,7 +431,7 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift
>> *a, DisasExtend ext,
>>                                void (*func)(TCGv, TCGv, target_long))
>>   {
>>       TCGv dest, src1;
>> -    int max_len = oper_len(ctx);
>> +    int max_len = get_olen(ctx);
>>         if (a->shamt >= max_len) {
>>           return false;
>> @@ -430,7 +450,7 @@ static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift
>> *a, DisasExtend ext,
>>                                void (*func)(TCGv, TCGv, TCGv))
>>   {
>>       TCGv dest, src1, src2;
>> -    int max_len = oper_len(ctx);
>> +    int max_len = get_olen(ctx);
>>         if (a->shamt >= max_len) {
>>           return false;
>> @@ -454,7 +474,7 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
>> DisasExtend ext,
>>       TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>>       TCGv ext2 = tcg_temp_new();
>>   -    tcg_gen_andi_tl(ext2, src2, oper_len(ctx) - 1);
>> +    tcg_gen_andi_tl(ext2, src2, get_olen(ctx) - 1);
>>       func(dest, src1, ext2);
>>         gen_set_gpr(ctx, a->rd, dest);
>> @@ -554,7 +574,6 @@ static void riscv_tr_init_disas_context(DisasContextBase
>> *dcbase, CPUState *cs)
>>       ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>>       ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
>>       ctx->cs = cs;
>> -    ctx->w = false;
>>       ctx->ntemp = 0;
>>       memset(ctx->temp, 0, sizeof(ctx->temp));
>>   @@ -578,9 +597,9 @@ static void riscv_tr_translate_insn(DisasContextBase
>> *dcbase, CPUState *cpu)
>>       CPURISCVState *env = cpu->env_ptr;
>>       uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
>>   +    ctx->ol = ctx->xl;
>>       decode_opc(env, ctx, opcode16);
>>       ctx->base.pc_next = ctx->pc_succ_insn;
>> -    ctx->w = false;
>>         for (int i = ctx->ntemp - 1; i >= 0; --i) {
>>           tcg_temp_free(ctx->temp[i]);
>> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc
>> b/target/riscv/insn_trans/trans_rvb.c.inc
>> index 185c3e9a60..66dd51de49 100644
>> --- a/target/riscv/insn_trans/trans_rvb.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
>> @@ -341,7 +341,7 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>>       REQUIRE_ZBB(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
>>   }
>>   @@ -367,7 +367,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>>       REQUIRE_ZBB(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_shift(ctx, a, EXT_NONE, gen_rorw);
>>   }
>>   @@ -375,7 +375,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>>       REQUIRE_ZBB(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_rorw);
>>   }
>>   @@ -401,7 +401,7 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>>       REQUIRE_ZBB(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_shift(ctx, a, EXT_NONE, gen_rolw);
>>   }
>>   diff --git a/target/riscv/insn_trans/trans_rvi.c.inc
>> b/target/riscv/insn_trans/trans_rvi.c.inc
>> index 920ae0edb3..c0a46d823f 100644
>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>> @@ -333,14 +333,14 @@ static bool trans_and(DisasContext *ctx, arg_and *a)
>>   static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
>>   }
>>     static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
>>   }
>>   @@ -352,7 +352,7 @@ static void gen_srliw(TCGv dst, TCGv src, target_long
>> shamt)
>>   static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
>>   }
>>   @@ -364,42 +364,42 @@ static void gen_sraiw(TCGv dst, TCGv src, target_long
>> shamt)
>>   static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_sraiw);
>>   }
>>     static bool trans_addw(DisasContext *ctx, arg_addw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl);
>>   }
>>     static bool trans_subw(DisasContext *ctx, arg_subw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
>>   }
>>     static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
>>   }
>>     static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
>>   }
>>     static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
>>   }
>>   diff --git a/target/riscv/insn_trans/trans_rvm.c.inc
>> b/target/riscv/insn_trans/trans_rvm.c.inc
>> index b89a85ad3a..9a1fe3c799 100644
>> --- a/target/riscv/insn_trans/trans_rvm.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
>> @@ -214,7 +214,7 @@ static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>>       REQUIRE_EXT(ctx, RVM);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
>>   }
>>   @@ -222,7 +222,7 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>>       REQUIRE_EXT(ctx, RVM);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_arith(ctx, a, EXT_SIGN, gen_div);
>>   }
>>   @@ -230,7 +230,7 @@ static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>>       REQUIRE_EXT(ctx, RVM);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_arith(ctx, a, EXT_ZERO, gen_divu);
>>   }
>>   @@ -238,7 +238,7 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>>       REQUIRE_EXT(ctx, RVM);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_arith(ctx, a, EXT_SIGN, gen_rem);
>>   }
>>   @@ -246,6 +246,6 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
>>   {
>>       REQUIRE_64BIT(ctx);
>>       REQUIRE_EXT(ctx, RVM);
>> -    ctx->w = true;
>> +    ctx->ol = MXL_RV32;
>>       return gen_arith(ctx, a, EXT_ZERO, gen_remu);
>>   }

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

