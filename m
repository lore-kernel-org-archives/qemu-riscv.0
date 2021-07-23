Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m6nJ1-0005t9-IB
	for mharc-qemu-riscv@gnu.org; Fri, 23 Jul 2021 01:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m6nIz-0005s7-HT; Fri, 23 Jul 2021 01:01:01 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:41928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m6nIx-0003CB-Dp; Fri, 23 Jul 2021 01:01:01 -0400
Received: by mail-io1-xd35.google.com with SMTP id r6so1100338ioj.8;
 Thu, 22 Jul 2021 22:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mxaE6AqI9YTeeBF9i5cgZ8gliHZbM+FExyY00Z0VqxE=;
 b=MnsW58kWkwodsK56Rr8p46RTR879B1lIv/YOGdOmcfJIApR9r2bhU4CXn8YKZFeSC0
 Chj0iZr7LO/uV4lCxWWULm94f6TZ0jgXAneb4Qn1OSzXUU+Ad4e6AnlZ5IcWVPKNyU1m
 cZCRp96czrB1kWnS+IY+vlJsUG/8Dt81zNP4LmlojJPGpQyIOnPy79/9lRfDsLo/+Wzq
 YcZRXeW9SEYtoAE1B7kHYhFqWJidQ7MwbfcAjLmPV3DIctOwGBjxPQVQfX3ZHTQEK4/6
 WkxAJ5MCNDCZO+cgBJeaxGF4LMPEcI7DLvx7nPbbMqVjNlvjk3LLPb9+VylsTBNH7W/P
 u0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mxaE6AqI9YTeeBF9i5cgZ8gliHZbM+FExyY00Z0VqxE=;
 b=FpoGXNtAcDcMbQM4k6Rq29d/SVVrYq8T7jj4FVi7e+CFfhc3oasTVlE9ZIhIC4yTW0
 a1XXriJGisPbRVSc6+u33RZ3/tLwvgmm+1ATK2eIg9YLpXWBes3dCFx6feSk3rt+d+DP
 3JvyRQ5VaSejbsKwv4hfQChJBQ2rbHJXe+Lxd+rIoraknQnlS6Qd4LjcaBTqpEBVEQSy
 2HfCdQ/uEXK23UxECsR7FGYTRtdN8pEEXaTaX/LOQaooo0vpz/lWieW6JjWyYR8D+UVD
 u0VFkTVaE1RV+3/GcfzCxBPPwAJ14chIn82r0DUlBLSoRMmhlYG3DuO/JPnHQV5Nrbcx
 AwQQ==
X-Gm-Message-State: AOAM532kEPnTHk/F9DcROxcNMDdDbtysj5vBKFXpd9OeJUjIed8s+CZZ
 18Gjbt1KwLahpA+4eJEg3Gw4HADw9Bk4HNeShEs=
X-Google-Smtp-Source: ABdhPJwFzsD6hYsqSXkRYa56TdEYW5Ttiq71xwGJPte54/EGQKbDof9btFjnt7urG4xlOtOzAWGGQ8vN8RSC02arQGY=
X-Received: by 2002:a5d:8453:: with SMTP id w19mr2519184ior.105.1627016457295; 
 Thu, 22 Jul 2021 22:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-10-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-10-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Jul 2021 15:00:31 +1000
Message-ID: <CAKmqyKPTZ7hQYL9AOKDJ5N61RE-T=q6nM4mfNxYG5peL--YD_w@mail.gmail.com>
Subject: Re: [PATCH 09/17] target/riscv: Reorg csr instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 23 Jul 2021 05:01:01 -0000

On Fri, Jul 9, 2021 at 2:46 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce csrr and csrw helpers, for read-only and write-only insns.
>
> Note that we do not properly implement this in riscv_csrrw, in that
> we cannot distinguish true read-only (rs1 == 0) from any other zero
> write_mask another source register -- this should still raise an
> exception for read-only registers.
>
> Only issue gen_io_start for CF_USE_ICOUNT.
> Use ctx->zero for csrrc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |   6 +-
>  target/riscv/op_helper.c                |  18 +--
>  target/riscv/insn_trans/trans_rvi.c.inc | 170 +++++++++++++++++-------
>  3 files changed, 129 insertions(+), 65 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 415e37bc37..460eee9988 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -65,9 +65,9 @@ DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>
>  /* Special functions */
> -DEF_HELPER_3(csrrw, tl, env, tl, tl)
> -DEF_HELPER_4(csrrs, tl, env, tl, tl, tl)
> -DEF_HELPER_4(csrrc, tl, env, tl, tl, tl)
> +DEF_HELPER_2(csrr, tl, env, int)
> +DEF_HELPER_3(csrw, void, env, int, tl)
> +DEF_HELPER_4(csrrw, tl, env, int, tl, tl)
>  #ifndef CONFIG_USER_ONLY
>  DEF_HELPER_2(sret, tl, env, tl)
>  DEF_HELPER_2(mret, tl, env, tl)
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 3c48e739ac..ee7c24efe7 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -37,11 +37,10 @@ void helper_raise_exception(CPURISCVState *env, uint32_t exception)
>      riscv_raise_exception(env, exception, 0);
>  }
>
> -target_ulong helper_csrrw(CPURISCVState *env, target_ulong src,
> -        target_ulong csr)
> +target_ulong helper_csrr(CPURISCVState *env, int csr)
>  {
>      target_ulong val = 0;
> -    RISCVException ret = riscv_csrrw(env, csr, &val, src, -1);
> +    RISCVException ret = riscv_csrrw(env, csr, &val, 0, 0);
>
>      if (ret != RISCV_EXCP_NONE) {
>          riscv_raise_exception(env, ret, GETPC());
> @@ -49,23 +48,20 @@ target_ulong helper_csrrw(CPURISCVState *env, target_ulong src,
>      return val;
>  }
>
> -target_ulong helper_csrrs(CPURISCVState *env, target_ulong src,
> -        target_ulong csr, target_ulong rs1_pass)
> +void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
>  {
> -    target_ulong val = 0;
> -    RISCVException ret = riscv_csrrw(env, csr, &val, -1, rs1_pass ? src : 0);
> +    RISCVException ret = riscv_csrrw(env, csr, NULL, src, -1);
>
>      if (ret != RISCV_EXCP_NONE) {
>          riscv_raise_exception(env, ret, GETPC());
>      }
> -    return val;
>  }
>
> -target_ulong helper_csrrc(CPURISCVState *env, target_ulong src,
> -        target_ulong csr, target_ulong rs1_pass)
> +target_ulong helper_csrrw(CPURISCVState *env, int csr,
> +                          target_ulong src, target_ulong write_mask)
>  {
>      target_ulong val = 0;
> -    RISCVException ret = riscv_csrrw(env, csr, &val, 0, rs1_pass ? src : 0);
> +    RISCVException ret = riscv_csrrw(env, csr, &val, src, write_mask);
>
>      if (ret != RISCV_EXCP_NONE) {
>          riscv_raise_exception(env, ret, GETPC());
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 840187a4d6..3705aad380 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -452,80 +452,148 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
>      return true;
>  }
>
> -#define RISCV_OP_CSR_PRE do {\
> -    source1 = tcg_temp_new(); \
> -    csr_store = tcg_temp_new(); \
> -    dest = tcg_temp_new(); \
> -    rs1_pass = tcg_temp_new(); \
> -    gen_get_gpr(source1, a->rs1); \
> -    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next); \
> -    tcg_gen_movi_tl(rs1_pass, a->rs1); \
> -    tcg_gen_movi_tl(csr_store, a->csr); \
> -    gen_io_start();\
> -} while (0)
> +static bool do_csr_post(DisasContext *ctx)
> +{
> +    /* We may have changed important cpu state -- exit to main loop. */
> +    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> +    exit_tb(ctx);
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +    return true;
> +}
>
> -#define RISCV_OP_CSR_POST do {\
> -    gen_set_gpr(a->rd, dest); \
> -    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn); \
> -    exit_tb(ctx); \
> -    ctx->base.is_jmp = DISAS_NORETURN; \
> -    tcg_temp_free(source1); \
> -    tcg_temp_free(csr_store); \
> -    tcg_temp_free(dest); \
> -    tcg_temp_free(rs1_pass); \
> -} while (0)
> +static bool do_csrr(DisasContext *ctx, int rd, int rc)
> +{
> +    TCGv dest = gpr_dst(ctx, rd);
> +    TCGv_i32 csr = tcg_constant_i32(rc);
>
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_csrr(dest, cpu_env, csr);
> +    return do_csr_post(ctx);
> +}
> +
> +static bool do_csrw(DisasContext *ctx, int rc, TCGv src)
> +{
> +    TCGv_i32 csr = tcg_constant_i32(rc);
> +
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_csrw(cpu_env, csr, src);
> +    return do_csr_post(ctx);
> +}
> +
> +static bool do_csrrw(DisasContext *ctx, int rd, int rc, TCGv src, TCGv mask)
> +{
> +    TCGv dest = gpr_dst(ctx, rd);
> +    TCGv_i32 csr = tcg_constant_i32(rc);
> +
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_csrrw(dest, cpu_env, csr, src, mask);
> +    return do_csr_post(ctx);
> +}
>
>  static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
>  {
> -    TCGv source1, csr_store, dest, rs1_pass;
> -    RISCV_OP_CSR_PRE;
> -    gen_helper_csrrw(dest, cpu_env, source1, csr_store);
> -    RISCV_OP_CSR_POST;
> -    return true;
> +    TCGv src = gpr_src(ctx, a->rs1);
> +
> +    /*
> +     * If rd == 0, the insn shall not read the csr, nor cause any of the
> +     * side effects that might occur on a csr read.
> +     */
> +    if (a->rd == 0) {
> +        return do_csrw(ctx, a->csr, src);
> +    }
> +
> +    TCGv mask = tcg_constant_tl(-1);
> +    return do_csrrw(ctx, a->rd, a->csr, src, mask);
>  }
>
>  static bool trans_csrrs(DisasContext *ctx, arg_csrrs *a)
>  {
> -    TCGv source1, csr_store, dest, rs1_pass;
> -    RISCV_OP_CSR_PRE;
> -    gen_helper_csrrs(dest, cpu_env, source1, csr_store, rs1_pass);
> -    RISCV_OP_CSR_POST;
> -    return true;
> +    /*
> +     * If rs1 == 0, the insn shall not write to the csr at all, nor
> +     * cause any of the side effects that might occur on a csr write.
> +     * Note that if rs1 specifies a register other than x0, holding
> +     * a zero value, the instruction will still attempt to write the
> +     * unmodified value back to the csr and will cause side effects.
> +     */
> +    if (a->rs1 == 0) {
> +        return do_csrr(ctx, a->rd, a->csr);
> +    }
> +
> +    TCGv ones = tcg_constant_tl(-1);
> +    TCGv mask = gpr_src(ctx, a->rs1);
> +    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
>  }
>
>  static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
>  {
> -    TCGv source1, csr_store, dest, rs1_pass;
> -    RISCV_OP_CSR_PRE;
> -    gen_helper_csrrc(dest, cpu_env, source1, csr_store, rs1_pass);
> -    RISCV_OP_CSR_POST;
> -    return true;
> +    /*
> +     * If rs1 == 0, the insn shall not write to the csr at all, nor
> +     * cause any of the side effects that might occur on a csr write.
> +     * Note that if rs1 specifies a register other than x0, holding
> +     * a zero value, the instruction will still attempt to write the
> +     * unmodified value back to the csr and will cause side effects.
> +     */
> +    if (a->rs1 == 0) {
> +        return do_csrr(ctx, a->rd, a->csr);
> +    }
> +
> +    TCGv mask = gpr_src(ctx, a->rs1);
> +    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
>  }
>
>  static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
>  {
> -    TCGv source1, csr_store, dest, rs1_pass;
> -    RISCV_OP_CSR_PRE;
> -    gen_helper_csrrw(dest, cpu_env, rs1_pass, csr_store);
> -    RISCV_OP_CSR_POST;
> -    return true;
> +    TCGv src = tcg_constant_tl(a->rs1);
> +
> +    /*
> +     * If rd == 0, the insn shall not read the csr, nor cause any of the
> +     * side effects that might occur on a csr read.
> +     */
> +    if (a->rd == 0) {
> +        return do_csrw(ctx, a->csr, src);
> +    }
> +
> +    TCGv mask = tcg_constant_tl(-1);
> +    return do_csrrw(ctx, a->rd, a->csr, src, mask);
>  }
>
>  static bool trans_csrrsi(DisasContext *ctx, arg_csrrsi *a)
>  {
> -    TCGv source1, csr_store, dest, rs1_pass;
> -    RISCV_OP_CSR_PRE;
> -    gen_helper_csrrs(dest, cpu_env, rs1_pass, csr_store, rs1_pass);
> -    RISCV_OP_CSR_POST;
> -    return true;
> +    /*
> +     * If rs1 == 0, the insn shall not write to the csr at all, nor
> +     * cause any of the side effects that might occur on a csr write.
> +     * Note that if rs1 specifies a register other than x0, holding
> +     * a zero value, the instruction will still attempt to write the
> +     * unmodified value back to the csr and will cause side effects.
> +     */
> +    if (a->rs1 == 0) {
> +        return do_csrr(ctx, a->rd, a->csr);
> +    }
> +
> +    TCGv ones = tcg_constant_tl(-1);
> +    TCGv mask = tcg_constant_tl(a->rs1);
> +    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
>  }
>
>  static bool trans_csrrci(DisasContext *ctx, arg_csrrci *a)
>  {
> -    TCGv source1, csr_store, dest, rs1_pass;
> -    RISCV_OP_CSR_PRE;
> -    gen_helper_csrrc(dest, cpu_env, rs1_pass, csr_store, rs1_pass);
> -    RISCV_OP_CSR_POST;
> -    return true;
> +    /*
> +     * If rs1 == 0, the insn shall not write to the csr at all, nor
> +     * cause any of the side effects that might occur on a csr write.
> +     * Note that if rs1 specifies a register other than x0, holding
> +     * a zero value, the instruction will still attempt to write the
> +     * unmodified value back to the csr and will cause side effects.
> +     */
> +    if (a->rs1 == 0) {
> +        return do_csrr(ctx, a->rd, a->csr);
> +    }
> +
> +    TCGv mask = tcg_constant_tl(a->rs1);
> +    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
>  }
> --
> 2.25.1
>
>

