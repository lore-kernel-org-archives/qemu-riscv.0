Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3tUl-0000qG-PD
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 01:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tUj-0000m8-UK; Thu, 15 Jul 2021 01:01:09 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:37782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tUi-00052R-37; Thu, 15 Jul 2021 01:01:09 -0400
Received: by mail-il1-x134.google.com with SMTP id o8so3861434ilf.4;
 Wed, 14 Jul 2021 22:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=soAYoXaqsJ3K24KCxqz/s6I/hrjhHNEJ6v/mvZsS/eI=;
 b=vM8Q92VLuk0cSH5iWSoRv4pTKtfoWOJniVcdqW1JGF2oIJ94gt82cDLKJd5p67VNfE
 I+cy20gSjoasuaiBOR/YBf4o6sEG0uTCJglK41utcMtDCIdIUs3mk26u4lChSDsGZ0Rl
 Z5pLNUSlr76yWCPzc5IbxzuAENhk0h+al4R1DrHkWsxvRdXZ6GxaUwxg44e+hz92NwXQ
 JKeJ7CTojS4iRxdNFMatpxI4wTDllwIhwRytnzGQvcx1jQem3W3V6AUL5iJh8UwD5gCs
 LNiplwQ+iw88VYV4yAwa1gXGSh6oz4U3dkKNCnt+xQAeJo9OEZ3FQr4deVuWNHaQKA2u
 682w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=soAYoXaqsJ3K24KCxqz/s6I/hrjhHNEJ6v/mvZsS/eI=;
 b=B+l8RKNjXttwzh/ACY00O9Lo9ucI7NWmwbT7+xnntNrlvNfoibPjh4FDo4bQLotypf
 z66kU+jeM/59ZDYamHoRKFzNIZtuL1AR7dGAusM4uz23pVISj+n2bD2IriJW2AMac0ce
 OTpyDlNq/ED+cyNGBkhzItG6hIJ2qodzJZsajNjr5jfhOPypRTiFdc1dRawDPRwrm6X4
 gnfFSYQsTefQQJd5/cjseet59qJNtdVyz3kzgLP11dLzELJxnzv902LG7U6Sam4/vICs
 mELreLXqNNttyCfxtnCOaAPqNxVnkm1iYn4YTcRi7jL1VMOhzxVvwl3PWBnJTgiX4vx7
 eZOQ==
X-Gm-Message-State: AOAM530CTL2tNisxu7CEhvHDC8jnZPex0xtz/lLBEI/aRAUQTPFVpiWZ
 FsUvdwMyTDBROpqfPYZMhwBFcEmu9/6ianUvi/Y=
X-Google-Smtp-Source: ABdhPJzgQR+kQAQQDLAoG7Q+m40UzdV1y8pFa+XxcQWYbnLok/+giYC4vaueCxQn+/3u2xN5qXlGgFC7ah33fjdwgPw=
X-Received: by 2002:a92:d8cf:: with SMTP id l15mr1246955ilo.227.1626325266328; 
 Wed, 14 Jul 2021 22:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-14-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-14-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Jul 2021 15:00:39 +1000
Message-ID: <CAKmqyKMsjvHrkzxM9tFiKV4wKzijck+F-vQk52zKO-RoDELfGQ@mail.gmail.com>
Subject: Re: [PATCH 13/17] target/riscv: Use gpr_{src,dst} for RVD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 05:01:10 -0000

On Fri, Jul 9, 2021 at 2:42 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvd.c.inc | 116 +++++++++---------------
>  1 file changed, 44 insertions(+), 72 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
> index 7e45538ae0..9bb15fdc12 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -22,14 +22,22 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
>  {
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -    tcg_gen_addi_tl(t0, t0, a->imm);
>
> -    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
> +    TCGv addr = gpr_src(ctx, a->rs1);
> +    TCGv temp = NULL;
>
> +    if (a->imm) {
> +        temp = tcg_temp_new();
> +        tcg_gen_addi_tl(temp, addr, a->imm);
> +        addr = temp;
> +    }
> +
> +    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
> +
> +    if (temp) {
> +        tcg_temp_free(temp);
> +    }
>      mark_fs_dirty(ctx);
> -    tcg_temp_free(t0);
>      return true;
>  }
>
> @@ -37,13 +45,21 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>  {
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -    tcg_gen_addi_tl(t0, t0, a->imm);
>
> -    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
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
> +    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
> +
> +    if (temp) {
> +        tcg_temp_free(temp);
> +    }
>      return true;
>  }
>
> @@ -252,11 +268,8 @@ static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_feq_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> -
> +    gen_helper_feq_d(gpr_dst(ctx, a->rd), cpu_env,
> +                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
>      return true;
>  }
>
> @@ -265,11 +278,8 @@ static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_flt_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> -
> +    gen_helper_flt_d(gpr_dst(ctx, a->rd), cpu_env,
> +                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
>      return true;
>  }
>
> @@ -278,11 +288,8 @@ static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_fle_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> -
> +    gen_helper_fle_d(gpr_dst(ctx, a->rd), cpu_env,
> +                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
>      return true;
>  }
>
> @@ -291,10 +298,7 @@ static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_helper_fclass_d(t0, cpu_fpr[a->rs1]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fclass_d(gpr_dst(ctx, a->rd), cpu_fpr[a->rs1]);
>      return true;
>  }
>
> @@ -303,12 +307,8 @@ static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_w_d(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> -
> +    gen_helper_fcvt_w_d(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
>      return true;
>  }
>
> @@ -317,12 +317,8 @@ static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_wu_d(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> -
> +    gen_helper_fcvt_wu_d(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
>      return true;
>  }
>
> @@ -331,12 +327,8 @@ static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
>
>      mark_fs_dirty(ctx);
>      return true;
> @@ -347,12 +339,8 @@ static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
>
>      mark_fs_dirty(ctx);
>      return true;
> @@ -364,11 +352,8 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_l_d(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
>      return true;
>  }
>
> @@ -378,11 +363,8 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_lu_d(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_lu_d(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
>      return true;
>  }
>
> @@ -406,12 +388,9 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
> +
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -422,12 +401,9 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -
>      gen_set_rm(ctx, a->rm);
> -    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, t0);
> -    tcg_temp_free(t0);
> +    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
> +
>      mark_fs_dirty(ctx);
>      return true;
>  }
> @@ -439,11 +415,7 @@ static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
>      REQUIRE_EXT(ctx, RVD);
>
>  #ifdef TARGET_RISCV64
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -
> -    tcg_gen_mov_tl(cpu_fpr[a->rd], t0);
> -    tcg_temp_free(t0);
> +    tcg_gen_mov_tl(cpu_fpr[a->rd], gpr_src(ctx, a->rs1));
>      mark_fs_dirty(ctx);
>      return true;
>  #else
> --
> 2.25.1
>
>

