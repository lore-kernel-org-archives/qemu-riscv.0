Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3tSg-0005gi-K4
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 00:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tSe-0005dt-RR; Thu, 15 Jul 2021 00:59:00 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:34529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tSc-0002ye-RF; Thu, 15 Jul 2021 00:59:00 -0400
Received: by mail-io1-xd36.google.com with SMTP id g22so4979675iom.1;
 Wed, 14 Jul 2021 21:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1X7MNLbXEzOjr/MHnu7lJ4aggoGhsASsqcLFJiIROqc=;
 b=JlmcURu+CBDiXR64WXIgXIRMQaRj5+sGXKyjIHijAcnq8mWbETqlLj0tkfGshehhDn
 u6Ciwh2w+mESXMBeHn5x4jJtNoBb1Y+LpKR9Pv0Kz0hs1kzeDxr1iPDhDC9HISqVbW12
 rSBmuyttfo4FiMBcQBOmyBOQLrrwK/xigOy8urnvv8YZEzDZbBKLQJYdAD0t4bVJlVcj
 miOWtIYV4zojPoeVJL6kRvyB2yg7pZBc2FbSCC7qcGpEp43HkfWGSBgXJvoDjz4cxuZ7
 DLNaZSxOxQDsQYmz/IxEXs28948asFE/BFbp0uw1J+Kg7g2JUMMoDbyk2FlZXxb+0ZFJ
 dzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1X7MNLbXEzOjr/MHnu7lJ4aggoGhsASsqcLFJiIROqc=;
 b=lz3RKQsadXcHA3V1MkttiTCt3/9rWfcHwSFZO5ldoUUBr5+CJ+iBcQPrCkpNA37adQ
 Xrw5CUL9ZzkviVZSbSTrJtthwfwYwGJRQ93NqFD6nbu8TZtY4GUwshRuh7sNV4ychxLg
 Zey5h88cXoZ1Ad9Lhayp5OFx//D/iXxdbHl9GshDhA1uiQuWC8IDncQ72ndRBUm6bM05
 dl03Q+YpHw8p4vN7cgzRb/LgzFTt1WxWcuI2mbf6akFndyb2xYOVITwn6LlbMKT/fMyV
 LuFJTDWLWlaf8qdTamAF/mJ6rtCOuy7z+/CulgvXapwnvg6XYqsKap8jOT14bMp8ht5Z
 /KSg==
X-Gm-Message-State: AOAM532MvyfS/rYsx94z6vKDKR86B0XZ32oSTp5iB84Gz5A7gKt7WqLD
 dzumtVMalTXT0UNak2kSKiBIjKZzl2hyL5DieGU=
X-Google-Smtp-Source: ABdhPJyrfhutUpsYI3Fuh5ZioJv+8sioaeh4LCqxSeedmT0j0JuIKokbPAydgqu9qzJHy1+jlGrOXJv+JUKWCUQsEEE=
X-Received: by 2002:a5d:8453:: with SMTP id w19mr1613501ior.105.1626325137284; 
 Wed, 14 Jul 2021 21:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-13-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-13-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Jul 2021 14:58:30 +1000
Message-ID: <CAKmqyKPXKE07tK_eT46pf+Gct13k_Z61nE6pgJH+wehBJ1Uyag@mail.gmail.com>
Subject: Re: [PATCH 12/17] target/riscv: Use gpr_{src,dst} for RVF
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 04:59:01 -0000

On Fri, Jul 9, 2021 at 2:49 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvf.c.inc | 131 +++++++++---------------
>  1 file changed, 49 insertions(+), 82 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index 89f78701e7..ff8e942199 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -27,14 +27,23 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
>  {
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -    tcg_gen_addi_tl(t0, t0, a->imm);
>
> -    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
> -    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
> +    TCGv addr = gpr_src(ctx, a->rs1);
> +    TCGv temp = NULL;
>
> -    tcg_temp_free(t0);
> +    if (a->imm) {
> +        temp = tcg_temp_new();
> +        tcg_gen_addi_tl(temp, addr, a->imm);
> +        addr = temp;
> +    }
> +
> +    TCGv_i64 dest = cpu_fpr[a->rd];
> +    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
> +    gen_nanbox_s(dest, dest);
> +
> +    if (temp) {
> +        tcg_temp_free(temp);
> +    }
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -43,14 +52,21 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>  {
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
>
> -    tcg_gen_addi_tl(t0, t0, a->imm);
> +    TCGv addr = gpr_src(ctx, a->rs1);
> +    TCGv temp = NULL;
>
> -    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
> +    if (a->imm) {
> +        temp = tcg_temp_new();
> +        tcg_gen_addi_tl(temp, addr, a->imm);
> +        addr = temp;
> +    }
>
> -    tcg_temp_free(t0);
> +    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
> +
> +    if (temp) {
> +        tcg_temp_free(temp);
> +    }
>      return true;
>  }
>
> @@ -271,12 +287,8 @@ static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_w_s(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> -
> +    gen_helper_fcvt_w_s(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
>      return true;
>  }
>
> @@ -285,12 +297,8 @@ static bool trans_fcvt_wu_s(DisasContext *ctx, arg_fcvt_wu_s *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_wu_s(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> -
> +    gen_helper_fcvt_wu_s(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
>      return true;
>  }
>
> @@ -300,17 +308,14 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd);
>
>  #if defined(TARGET_RISCV64)
> -    tcg_gen_ext32s_tl(t0, cpu_fpr[a->rs1]);
> +    tcg_gen_ext32s_tl(dest, cpu_fpr[a->rs1]);
>  #else
> -    tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
> +    tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
>  #endif
>
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> -
>      return true;
>  }
>
> @@ -318,10 +323,9 @@ static bool trans_feq_s(DisasContext *ctx, arg_feq_s *a)
>  {
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_feq_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> +
> +    gen_helper_feq_s(gpr_dst(ctx, a->rd), cpu_env,
> +                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
>      return true;
>  }
>
> @@ -329,10 +333,9 @@ static bool trans_flt_s(DisasContext *ctx, arg_flt_s *a)
>  {
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_flt_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> +
> +    gen_helper_flt_s(gpr_dst(ctx, a->rd), cpu_env,
> +                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
>      return true;
>  }
>
> @@ -340,10 +343,9 @@ static bool trans_fle_s(DisasContext *ctx, arg_fle_s *a)
>  {
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_fle_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> +
> +    gen_helper_fle_s(gpr_dst(ctx, a->rd), cpu_env,
> +                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
>      return true;
>  }
>
> @@ -352,13 +354,7 @@ static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -
> -    gen_helper_fclass_s(t0, cpu_fpr[a->rs1]);
> -
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> -
> +    gen_helper_fclass_s(gpr_dst(ctx, a->rd), cpu_fpr[a->rs1]);
>      return true;
>  }
>
> @@ -367,15 +363,10 @@ static bool trans_fcvt_s_w(DisasContext *ctx, arg_fcvt_s_w *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, t0);
> +    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
>
>      mark_fs_dirty(ctx);
> -    tcg_temp_free(t0);
> -
>      return true;
>  }
>
> @@ -384,15 +375,10 @@ static bool trans_fcvt_s_wu(DisasContext *ctx, arg_fcvt_s_wu *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, t0);
> +    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
>
>      mark_fs_dirty(ctx);
> -    tcg_temp_free(t0);
> -
>      return true;
>  }
>
> @@ -402,15 +388,10 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -
> -    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], t0);
> +    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], gpr_src(ctx, a->rs1));
>      gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
>
>      mark_fs_dirty(ctx);
> -    tcg_temp_free(t0);
> -
>      return true;
>  }
>
> @@ -420,11 +401,8 @@ static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_l_s(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_l_s(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
>      return true;
>  }
>
> @@ -434,11 +412,8 @@ static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_lu_s(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_lu_s(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
>      return true;
>  }
>
> @@ -448,14 +423,10 @@ static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, t0);
> +    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
>
>      mark_fs_dirty(ctx);
> -    tcg_temp_free(t0);
>      return true;
>  }
>
> @@ -465,13 +436,9 @@ static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, t0);
> +    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
>
>      mark_fs_dirty(ctx);
> -    tcg_temp_free(t0);
>      return true;
>  }
> --
> 2.25.1
>
>

