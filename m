Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mImGf-0007UP-IR
	for mharc-qemu-riscv@gnu.org; Wed, 25 Aug 2021 02:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mImGe-0007UB-52; Wed, 25 Aug 2021 02:20:08 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:34513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mImGZ-0005fa-JJ; Wed, 25 Aug 2021 02:20:07 -0400
Received: by mail-io1-xd30.google.com with SMTP id y18so13831851ioc.1;
 Tue, 24 Aug 2021 23:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0RlRkaOCUwAZ1YesW4Pk2ZB66Z+q4dMlBfpp5QTBdVg=;
 b=Hp0Ev3kjQK0wCsp721dlTNNugMu7gzeIouXvfKGewLrsYv9fk/v0UuaIV0usfpnMVt
 91k/yRp7LbYygnQK7ulcsogdGhwOJiu5MhaWoP9K8zy+MAHqPAET0nL19jGUdE95/I/c
 aU9RIzgBUJ2eMYwkNHsaR0LvyEktb6qEih3iw+fYQuZa6/7SMh6VsUA3VQWPmDR9K6N/
 8SmuOWN0+VDHWmxwsReNYjjwwb7poeN6DloWEx9UaW9NjSDRXKa5BY7gdMyDurnYLmdF
 lN54dAguI0jXftjfJANoHwco6rEYHl/uycMUzX/dyrwGMfM2LASlH4b+YdP7XS9vfaf0
 s9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0RlRkaOCUwAZ1YesW4Pk2ZB66Z+q4dMlBfpp5QTBdVg=;
 b=heng0+yBqjTI1mz+UFxdaG2Clvt/F/jspHJ4ViaNbF4XgmS0huq5Rby/cOrawViK/J
 1WydkCyckLjE9MpsI2sGGxPkjdNmONcMqe3GsUI6g54+cfPGbsvzF1ZYqq7/r2eZtZC5
 UBbQ+9WnBRPW5BqzxqpqMI/h45XgxwxtsdupMCb+DVuK7ISlwiWPdK8WElej0W7mmBwk
 05VNWGpG8m9AH3TOoUim53OrmCPfyHP9zQ1sAxhk4U4LPVSGrSKb0014nQ5FblY4aXbv
 6vlCi1LN4c+Cwx8tX5gfnX2yC5xdGeNgmDYUUybwXZIsRDdcL7EoBZCbXOHrSbvyELy8
 Wqxg==
X-Gm-Message-State: AOAM531lhxoGKV8VajPLAR6fLWxENlmuKHY8qF3N8CPkEYvsEvzxGDoG
 tSBxMkVykR4jV4639X7K4lY1rpDuIRI7F7Laj00=
X-Google-Smtp-Source: ABdhPJxgkq6jGD0HmAa2X9HL2SCyZJrUs/Nl6T+Ph3maa80yICdWJmYdYTmuRE9txxSdR7toJrM2+7qh3AFB67+iXKM=
X-Received: by 2002:a5d:850f:: with SMTP id q15mr34803421ion.118.1629872402046; 
 Tue, 24 Aug 2021 23:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210823195529.560295-1-richard.henderson@linaro.org>
 <20210823195529.560295-23-richard.henderson@linaro.org>
In-Reply-To: <20210823195529.560295-23-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Aug 2021 16:19:36 +1000
Message-ID: <CAKmqyKNq6nVWbW3HDJ_tBABcP4m4Uim9Zt6xUPF-sGh9BkC=_w@mail.gmail.com>
Subject: Re: [PATCH v5 22/24] target/riscv: Use {get,dest}_gpr for RVD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Wed, 25 Aug 2021 06:20:08 -0000

On Tue, Aug 24, 2021 at 6:12 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvd.c.inc | 125 ++++++++++++------------
>  1 file changed, 60 insertions(+), 65 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
> index 11b9b3f90b..db9ae15755 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -20,30 +20,40 @@
>
>  static bool trans_fld(DisasContext *ctx, arg_fld *a)
>  {
> +    TCGv addr;
> +
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> -    tcg_gen_addi_tl(t0, t0, a->imm);
>
> -    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
> +    addr = get_gpr(ctx, a->rs1, EXT_NONE);
> +    if (a->imm) {
> +        TCGv temp = temp_new(ctx);
> +        tcg_gen_addi_tl(temp, addr, a->imm);
> +        addr = temp;
> +    }
> +
> +    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
>
>      mark_fs_dirty(ctx);
> -    tcg_temp_free(t0);
>      return true;
>  }
>
>  static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>  {
> +    TCGv addr;
> +
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> -    tcg_gen_addi_tl(t0, t0, a->imm);
>
> -    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
> +    addr = get_gpr(ctx, a->rs1, EXT_NONE);
> +    if (a->imm) {
> +        TCGv temp = temp_new(ctx);
> +        tcg_gen_addi_tl(temp, addr, a->imm);
> +        addr = temp;
> +    }
> +
> +    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
>
> -    tcg_temp_free(t0);
>      return true;
>  }
>
> @@ -252,11 +262,10 @@ static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_feq_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    TCGv dest = dest_gpr(ctx, a->rd);
>
> +    gen_helper_feq_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -265,11 +274,10 @@ static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_flt_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    TCGv dest = dest_gpr(ctx, a->rd);
>
> +    gen_helper_flt_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -278,11 +286,10 @@ static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_fle_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    TCGv dest = dest_gpr(ctx, a->rd);
>
> +    gen_helper_fle_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -291,10 +298,10 @@ static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_fclass_d(t0, cpu_fpr[a->rs1]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
> +    gen_helper_fclass_d(dest, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -303,12 +310,11 @@ static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_w_d(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    TCGv dest = dest_gpr(ctx, a->rd);
>
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_w_d(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -317,12 +323,11 @@ static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_wu_d(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    TCGv dest = dest_gpr(ctx, a->rd);
>
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_wu_d(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -331,12 +336,10 @@ static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> +    TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, src);
>
>      mark_fs_dirty(ctx);
>      return true;
> @@ -347,12 +350,10 @@ static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> +    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, src);
>
>      mark_fs_dirty(ctx);
>      return true;
> @@ -364,11 +365,11 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_l_d(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -378,11 +379,11 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_lu_d(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(ctx, a->rd, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_lu_d(dest, cpu_env, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -406,12 +407,11 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> +    TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, src);
> +
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -422,12 +422,11 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> +    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
>
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, src);
> +
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -439,11 +438,7 @@ static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
>      REQUIRE_EXT(ctx, RVD);
>
>  #ifdef TARGET_RISCV64
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> -
> -    tcg_gen_mov_tl(cpu_fpr[a->rd], t0);
> -    tcg_temp_free(t0);
> +    tcg_gen_mov_tl(cpu_fpr[a->rd], get_gpr(ctx, a->rs1, EXT_NONE));
>      mark_fs_dirty(ctx);
>      return true;
>  #else
> --
> 2.25.1
>
>

