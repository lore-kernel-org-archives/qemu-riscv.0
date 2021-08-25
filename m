Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mImEf-0005NB-8a
	for mharc-qemu-riscv@gnu.org; Wed, 25 Aug 2021 02:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mImEc-0005Ls-Ca; Wed, 25 Aug 2021 02:18:02 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:44892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mImEa-00048F-J7; Wed, 25 Aug 2021 02:18:02 -0400
Received: by mail-il1-x12f.google.com with SMTP id b4so13325235ilr.11;
 Tue, 24 Aug 2021 23:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=96N5tnRCvbcN1KRqaQDxjyX8yPM2aYWAc/X/RMT0qAQ=;
 b=vRMY6TkSlYF2yezYRH9pvEybajUAOnRd32SufWg+7Nj5G/xHegq/9+pNzVMYe4ygYd
 kalc/Ff6mt27bxNe4jPaELphe9qH96ApiBnHmS+ltd8uz81cucojZX/1amWyxhpNgVbi
 mv8Y47EE+72lZvIvidr8mLhLQIQW6i2K2a7pJGLmvSJMfotn+pD52VQjHGnAsrkDbNcE
 g5MnHpvEaFPNZXgDiO29utabJ/axt2NROzxQ+y+x2VmkQv50kAk2PBFPdqY6G72kOvgK
 4RC2RMDw/3H8KOmp4rt0uY0I1KzD0U5ZMm/LPFL5qdzMQAV2hjzrT922ApAxrrMTIF0W
 0ALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=96N5tnRCvbcN1KRqaQDxjyX8yPM2aYWAc/X/RMT0qAQ=;
 b=bYv2tnddpIabgSyUyFBqnGmGU7rYp8a1Y4uRu0lHPjVYwCWNOuzjBeBFiKtvvz8ASC
 Jv80h6VenjsC6h2cauPD3Kv9MXzDXO5t4lnZm8TUHjrhrmfRfVzQvfYkx7Sl60+IFVQk
 r/9sEv9rSlqxwZcmwTUKDutEGn6p5XHl1yFSfWHV/JRmfujkcH7Q/IHwtPuhLP0XnaN7
 WGXheYT5SN5x+fn+8C1CqlZiVdWfe7fW7GpQiDBPbJvVlIzMylP5q4bkYJe7YnT2JBv7
 JVevWOn5WcfV6xviNpNtIVFKXN9KGafCEhodCP5kuK5xPNrjnXSRxHEDF4zTKhIA57kS
 2yDQ==
X-Gm-Message-State: AOAM532oZANw5CKt5WgF84TMU5Xz5MfrEExEr7LtrX4X2bxA5kQuF4dU
 4RmNcTPID6TR3d4wcL3gZO3tl+F5y7+8v+EpMzg=
X-Google-Smtp-Source: ABdhPJyYR0xhPFZTHeBcaSbsdfz9ZTNjf0tWfONVf++egViCr/BNxtOiDLq7xgZm/EviAGuuIwlO8FkEYggHDA5XvbY=
X-Received: by 2002:a92:6802:: with SMTP id d2mr28918511ilc.40.1629872279306; 
 Tue, 24 Aug 2021 23:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210823195529.560295-1-richard.henderson@linaro.org>
 <20210823195529.560295-22-richard.henderson@linaro.org>
In-Reply-To: <20210823195529.560295-22-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Aug 2021 16:17:33 +1000
Message-ID: <CAKmqyKPQVspVM3iBAqw8y7fAt_qi-aoTeBtMG6EXoWrTmZ-jBA@mail.gmail.com>
Subject: Re: [PATCH v5 21/24] target/riscv: Use {get,dest}_gpr for RVF
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Wed, 25 Aug 2021 06:18:02 -0000

On Tue, Aug 24, 2021 at 6:04 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvf.c.inc | 146 ++++++++++++------------
>  1 file changed, 70 insertions(+), 76 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index fb9f7f9c00..bddbd418d9 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -25,32 +25,43 @@
>
>  static bool trans_flw(DisasContext *ctx, arg_flw *a)
>  {
> +    TCGv_i64 dest;
> +    TCGv addr;
> +
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> -    tcg_gen_addi_tl(t0, t0, a->imm);
>
> -    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
> -    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
> +    addr = get_gpr(ctx, a->rs1, EXT_NONE);
> +    if (a->imm) {
> +        TCGv temp = temp_new(ctx);
> +        tcg_gen_addi_tl(temp, addr, a->imm);
> +        addr = temp;
> +    }
> +
> +    dest = cpu_fpr[a->rd];
> +    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
> +    gen_nanbox_s(dest, dest);
>
> -    tcg_temp_free(t0);
>      mark_fs_dirty(ctx);
>      return true;
>  }
>
>  static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>  {
> +    TCGv addr;
> +
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
>
> -    tcg_gen_addi_tl(t0, t0, a->imm);
> +    addr = get_gpr(ctx, a->rs1, EXT_NONE);
> +    if (a->imm) {
> +        TCGv temp = tcg_temp_new();
> +        tcg_gen_addi_tl(temp, addr, a->imm);
> +        addr = temp;
> +    }
>
> -    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
> +    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
>
> -    tcg_temp_free(t0);
>      return true;
>  }
>
> @@ -271,12 +282,11 @@ static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_w_s(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    TCGv dest = dest_gpr(ctx, a->rd);
>
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_w_s(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -285,12 +295,11 @@ static bool trans_fcvt_wu_s(DisasContext *ctx, arg_fcvt_wu_s *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_wu_s(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    TCGv dest = dest_gpr(ctx, a->rd);
>
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_wu_s(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -300,17 +309,15 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> +    TCGv dest = dest_gpr(ctx, a->rd);
>
>  #if defined(TARGET_RISCV64)
> -    tcg_gen_ext32s_tl(t0, cpu_fpr[a->rs1]);
> +    tcg_gen_ext32s_tl(dest, cpu_fpr[a->rs1]);
>  #else
> -    tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
> +    tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
>  #endif
>
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> -
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -318,10 +325,11 @@ static bool trans_feq_s(DisasContext *ctx, arg_feq_s *a)
>  {
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_feq_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
> +    gen_helper_feq_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -329,10 +337,11 @@ static bool trans_flt_s(DisasContext *ctx, arg_flt_s *a)
>  {
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_flt_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
> +    gen_helper_flt_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -340,10 +349,11 @@ static bool trans_fle_s(DisasContext *ctx, arg_fle_s *a)
>  {
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_fle_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
> +    gen_helper_fle_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -352,13 +362,10 @@ static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -
> -    gen_helper_fclass_s(t0, cpu_fpr[a->rs1]);
> -
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    TCGv dest = dest_gpr(ctx, a->rd);
>
> +    gen_helper_fclass_s(dest, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -367,15 +374,12 @@ static bool trans_fcvt_s_w(DisasContext *ctx, arg_fcvt_s_w *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> +    TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, t0);
> +    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, src);
>
>      mark_fs_dirty(ctx);
> -    tcg_temp_free(t0);
> -
>      return true;
>  }
>
> @@ -384,15 +388,12 @@ static bool trans_fcvt_s_wu(DisasContext *ctx, arg_fcvt_s_wu *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> +    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, t0);
> +    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, src);
>
>      mark_fs_dirty(ctx);
> -    tcg_temp_free(t0);
> -
>      return true;
>  }
>
> @@ -402,15 +403,12 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> +    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
>
> -    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], t0);
> +    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], src);
>      gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
>
>      mark_fs_dirty(ctx);
> -    tcg_temp_free(t0);
> -
>      return true;
>  }
>
> @@ -420,11 +418,11 @@ static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_l_s(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_l_s(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -434,11 +432,11 @@ static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_lu_s(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_lu_s(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -448,14 +446,12 @@ static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> +    TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, t0);
> +    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, src);
>
>      mark_fs_dirty(ctx);
> -    tcg_temp_free(t0);
>      return true;
>  }
>
> @@ -465,13 +461,11 @@ static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> +    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, t0);
> +    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, src);
>
>      mark_fs_dirty(ctx);
> -    tcg_temp_free(t0);
>      return true;
>  }
> --
> 2.25.1
>
>

