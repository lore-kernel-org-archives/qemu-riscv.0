Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIm0s-0003ZD-Sw
	for mharc-qemu-riscv@gnu.org; Wed, 25 Aug 2021 02:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIm0r-0003Yv-AS; Wed, 25 Aug 2021 02:03:49 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:46962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIm0o-0000wt-UF; Wed, 25 Aug 2021 02:03:49 -0400
Received: by mail-io1-xd2f.google.com with SMTP id b200so29389251iof.13;
 Tue, 24 Aug 2021 23:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BjLxK/KJI08LOJJDTX//aAbHdmhf7rltqx9ATgNWT6I=;
 b=IvUMqOdAQryoCDJoIFcvwfjGong/qr6cAtm+CSgGm3h8tkkkZtHJq/XEFx4fwrUhhQ
 zW4pdOlZGgOKf0zTGQAikb7Sov5hxuO8/lf6tVV+BHebB4+F8tWu2TO2wu7H8dSMb0vF
 kzvTpiDYBfEqdfI2y/C4rLAlHFp1zwcis5JxT+RRhHV9N0zUUPQBuy+UD5EF2XYV/u68
 LPN3dpLJJ8qt1EpioRQmSKMXTceobK/8+A6u7FeOxWItFsA+oTBRb5rfasSOjNsDhoQp
 XIXMOw4cP/mzXiOEMhAx3iz7xY7Eov9iTtBlqz1hCTJcHa0WvCBHxUJJrJag9RShTxZz
 G5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BjLxK/KJI08LOJJDTX//aAbHdmhf7rltqx9ATgNWT6I=;
 b=hKX9jXNZGhJZQf3VPf6qX/kqbobyATpXEwNwr/69Ky/seBO4cHduFSKyQeS9JuZKvq
 /Cwt1IRGrduXcqVuijmFwd4TuMG5erWEgcX+ODNeIQf9898dTKLjmSbbeZvuqN259kdh
 /r6OjfAC12/eh6iRyvJvXQt9df57wEbkhIxA6BmOWu7KOAZJTMXLl3NzF8pmlu8fkUgs
 vGwbSb/9vtPasVkbYTWdNnI2Cj19SX14YUAgWn2cuF7gEYPuzmYBvKGOPetqt6PIWNUv
 /HsKjZvBrgFPXv5oeED7DqqKZCPrittgfRQUcR4vBNoXMYZpPBfT7f88m7kwseYwDJp+
 2NLw==
X-Gm-Message-State: AOAM532S1UONkyyl+QHxUeE6MVFSeu1h5htxLI8IlOKAHG9r5CSDUR8q
 cD7M/iNfwhF6OGdpDzXSTKnSZW1STcOycOVNvng=
X-Google-Smtp-Source: ABdhPJxsUoCqI+Fc3nkFOUvsKH/y5a+9On3/YOSY8frYGvSeAgUcMfw0mQDfGl+7m/YeD5F5A6lJm8jZT+VyWWlkOvk=
X-Received: by 2002:a02:c6c1:: with SMTP id r1mr32843468jan.26.1629871425409; 
 Tue, 24 Aug 2021 23:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210823195529.560295-1-richard.henderson@linaro.org>
 <20210823195529.560295-19-richard.henderson@linaro.org>
In-Reply-To: <20210823195529.560295-19-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Aug 2021 16:03:19 +1000
Message-ID: <CAKmqyKMgde-Fpzw==oxeavXGY_23Kcm_Y3tfjEay91m5u6Aypg@mail.gmail.com>
Subject: Re: [PATCH v5 18/24] target/riscv: Reorg csr instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Wed, 25 Aug 2021 06:03:49 -0000

On Tue, Aug 24, 2021 at 6:10 AM Richard Henderson
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
> Use get_gpr and dest_gpr.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |   6 +-
>  target/riscv/op_helper.c                |  18 +--
>  target/riscv/insn_trans/trans_rvi.c.inc | 172 +++++++++++++++++-------
>  3 files changed, 131 insertions(+), 65 deletions(-)
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
> index 76454fb7e2..920ae0edb3 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -426,80 +426,150 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
>      return true;
>  }
>
> -#define RISCV_OP_CSR_PRE do {\
> -    source1 = tcg_temp_new(); \
> -    csr_store = tcg_temp_new(); \
> -    dest = tcg_temp_new(); \
> -    rs1_pass = tcg_temp_new(); \
> -    gen_get_gpr(ctx, source1, a->rs1); \
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
> -    gen_set_gpr(ctx, a->rd, dest); \
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
> +    TCGv dest = dest_gpr(ctx, rd);
> +    TCGv_i32 csr = tcg_constant_i32(rc);
>
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_csrr(dest, cpu_env, csr);
> +    gen_set_gpr(ctx, rd, dest);
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
> +    TCGv dest = dest_gpr(ctx, rd);
> +    TCGv_i32 csr = tcg_constant_i32(rc);
> +
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_csrrw(dest, cpu_env, csr, src, mask);
> +    gen_set_gpr(ctx, rd, dest);
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
> +    TCGv src = get_gpr(ctx, a->rs1, EXT_NONE);
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
> +    TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
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
> +    TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
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

