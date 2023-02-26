Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWGeN-0007kh-Op
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 08:01:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pWGe0-0007ab-9H; Sun, 26 Feb 2023 08:00:49 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pWGdx-0002Dp-0N; Sun, 26 Feb 2023 08:00:48 -0500
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowAAnLfHxV_tjXw68CA--.17174S2;
 Sun, 26 Feb 2023 21:00:34 +0800 (CST)
Message-ID: <fc51998a-f9e5-8e74-f01d-e8567709a01a@iscas.ac.cn>
Date: Sun, 26 Feb 2023 21:00:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 52/76] target/riscv: Drop temp_new
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-53-richard.henderson@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230225091427.1817156-53-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAAnLfHxV_tjXw68CA--.17174S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1UWF1fZFyktw48Kw1DAwb_yoW7JFyxpr
 4Ikw429Fy8trWfAa97ZF4DZF1UZF4IkayUK3s5Kwn5GF13XrZ5Ar4kK34YkF40kFyrZrWY
 kFs8Cr1UZa1jqFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
 wI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x07jbrc-UUUUU=
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sun, 26 Feb 2023 13:01:09 -0000


On 2023/2/25 17:14, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Oh. It's here.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

> ---
>   target/riscv/translate.c                  | 30 +++++------------------
>   target/riscv/insn_trans/trans_rvzfh.c.inc |  2 +-
>   2 files changed, 7 insertions(+), 25 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 273e566d66..b5d8080a6f 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -101,11 +101,8 @@ typedef struct DisasContext {
>       bool cfg_vta_all_1s;
>       target_ulong vstart;
>       bool vl_eq_vlmax;
> -    uint8_t ntemp;
>       CPUState *cs;
>       TCGv zero;
> -    /* Space for 3 operands plus 1 extra for address computation. */
> -    TCGv temp[4];
>       /* PointerMasking extension */
>       bool pm_mask_enabled;
>       bool pm_base_enabled;
> @@ -312,12 +309,6 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>    *
>    * Further, we may provide an extension for word operations.
>    */
> -static TCGv temp_new(DisasContext *ctx)
> -{
> -    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
> -    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
> -}
> -
>   static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
>   {
>       TCGv t;
> @@ -332,11 +323,11 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
>           case EXT_NONE:
>               break;
>           case EXT_SIGN:
> -            t = temp_new(ctx);
> +            t = tcg_temp_new();
>               tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
>               return t;
>           case EXT_ZERO:
> -            t = temp_new(ctx);
> +            t = tcg_temp_new();
>               tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
>               return t;
>           default:
> @@ -364,7 +355,7 @@ static TCGv get_gprh(DisasContext *ctx, int reg_num)
>   static TCGv dest_gpr(DisasContext *ctx, int reg_num)
>   {
>       if (reg_num == 0 || get_olen(ctx) < TARGET_LONG_BITS) {
> -        return temp_new(ctx);
> +        return tcg_temp_new();
>       }
>       return cpu_gpr[reg_num];
>   }
> @@ -372,7 +363,7 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num)
>   static TCGv dest_gprh(DisasContext *ctx, int reg_num)
>   {
>       if (reg_num == 0) {
> -        return temp_new(ctx);
> +        return tcg_temp_new();
>       }
>       return cpu_gprh[reg_num];
>   }
> @@ -575,7 +566,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>   /* Compute a canonical address from a register plus offset. */
>   static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>   {
> -    TCGv addr = temp_new(ctx);
> +    TCGv addr = tcg_temp_new();
>       TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
>   
>       tcg_gen_addi_tl(addr, src1, imm);
> @@ -593,7 +584,7 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>   /* Compute a canonical address from a register plus reg offset. */
>   static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
>   {
> -    TCGv addr = temp_new(ctx);
> +    TCGv addr = tcg_temp_new();
>       TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
>   
>       tcg_gen_add_tl(addr, src1, offs);
> @@ -1196,8 +1187,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->misa_mxl_max = env->misa_mxl_max;
>       ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
>       ctx->cs = cs;
> -    ctx->ntemp = 0;
> -    memset(ctx->temp, 0, sizeof(ctx->temp));
>       ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>       ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> @@ -1222,18 +1211,11 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>       CPURISCVState *env = cpu->env_ptr;
>       uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
> -    int i;
>   
>       ctx->ol = ctx->xl;
>       decode_opc(env, ctx, opcode16);
>       ctx->base.pc_next = ctx->pc_succ_insn;
>   
> -    for (i = ctx->ntemp - 1; i >= 0; --i) {
> -        tcg_temp_free(ctx->temp[i]);
> -        ctx->temp[i] = NULL;
> -    }
> -    ctx->ntemp = 0;
> -
>       /* Only the first insn within a TB is allowed to cross a page boundary. */
>       if (ctx->base.is_jmp == DISAS_NEXT) {
>           if (ctx->itrigger || !is_same_page(&ctx->base, ctx->base.pc_next)) {
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 2ad5716312..5024e6ecab 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -52,7 +52,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
>       decode_save_opc(ctx);
>       t0 = get_gpr(ctx, a->rs1, EXT_NONE);
>       if (a->imm) {
> -        TCGv temp = temp_new(ctx);
> +        TCGv temp = tcg_temp_new();
>           tcg_gen_addi_tl(temp, t0, a->imm);
>           t0 = temp;
>       }


