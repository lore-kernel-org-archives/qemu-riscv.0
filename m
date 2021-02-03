Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l7Nho-0005Zu-VQ
	for mharc-qemu-riscv@gnu.org; Wed, 03 Feb 2021 14:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l7Nhk-0005Xf-AZ; Wed, 03 Feb 2021 14:20:45 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:44172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l7Nhi-0000zF-KF; Wed, 03 Feb 2021 14:20:44 -0500
Received: by mail-io1-xd32.google.com with SMTP id j5so482471iog.11;
 Wed, 03 Feb 2021 11:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uVMhWaFw9eg8T6nGBr41EXNQxxO3D5UoZvPcdeSDIgw=;
 b=SbHKTaFz/Xtd+CE2RJc/3Bj62fWNT/9ZZ35FW3PdXBynrfWFEk7U5S9mBBk+YnJDCD
 YJc4j9zo5ZYBhCBXBqAvlKdXPQBZF3WKy9Rm5IpMq/LFVaPFT5szxMUdsxMqa/sm0/4V
 jcOhe8Wuc1Btugj8UP3v/LVr18Bd4rVSPKdtRBgpYhFU74k4FfNZ836DRqoDURumqQdE
 NjGufhBsOh6qoPytlUfePIGYTNNXhUYrRZMHBHP5kWDTq5PHL/KxLrnLkTTg2uyv1/ML
 IOFG3gLR0oKxEK5PyxxiLtlLSrZTEU+IUNUawVMEuCCmcLEHTY5nu0weogitqcEl7p7R
 8b8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uVMhWaFw9eg8T6nGBr41EXNQxxO3D5UoZvPcdeSDIgw=;
 b=E9btnW3zFtkKXxfto4O/jTyYIxMb+fZhVXKpHka3Cp1q2WK4nHz4VDkngsQzwTCnUc
 q9Eoh3MI7SHHMcsiVQCtEJ2+QTTPsX3KCoa4m+7lSdNIRKxzLMYuXEDB0hW2R48Yp0dH
 6MlPqhq6UwkzlV09tV6Bt9d4jMg6lILAtFaT99G7Z+9mgC1cSO0cae3UIaHfv1dX8LDH
 PVWTqGhJmBI+z1ylznjLzekSSJ0jnTRS5wyD2bPvVdM4rhC9+PBs7qzgvbZC8BmUqzOV
 /D1z65ycs2RtjwHdssjYTsQ0IXivUONevb+Dyl5n9gAnwLoQw+uoMkZVv40CtinRIMQ3
 wBsg==
X-Gm-Message-State: AOAM5337ZY9isgNdQKYTBri/X5ym9txOKUAwW26bYELkPw1cWSVmSyKR
 hjLNgjOXhwngLsF/OJlRHHb9HSaAeKINdweFCfc=
X-Google-Smtp-Source: ABdhPJzBL5coJ+CUOVKg59cI0CBwd8RhLEQvhD+/gUkE1Xqs123Y0pCA07jyUpJWPlqi5hzP9TAL2GrL9T+Qy3lfMOY=
X-Received: by 2002:a02:634b:: with SMTP id j72mr4349264jac.106.1612380041095; 
 Wed, 03 Feb 2021 11:20:41 -0800 (PST)
MIME-Version: 1.0
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
 <20210110185109.29841-5-space.monkey.delivers@gmail.com>
In-Reply-To: <20210110185109.29841-5-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Feb 2021 11:20:15 -0800
Message-ID: <CAKmqyKMrJ0bY5xn8quBM5juD8qWTOBG+MW1OS=-6esJ0t7XzYg@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, kupokupokupopo@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, GAPPY_SUBJECT=0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 03 Feb 2021 19:20:46 -0000

On Sun, Jan 10, 2021 at 10:51 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rva.c.inc |  3 +++
>  target/riscv/insn_trans/trans_rvd.c.inc |  2 ++
>  target/riscv/insn_trans/trans_rvf.c.inc |  2 ++
>  target/riscv/insn_trans/trans_rvi.c.inc |  2 ++
>  target/riscv/translate.c                | 14 ++++++++++++++
>  5 files changed, 23 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
> index be8a9f06dd..5559e347ba 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -26,6 +26,7 @@ static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>      if (a->rl) {
>          tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
>      }
> +    gen_pm_adjust_address(ctx, src1, src1);
>      tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
>      if (a->aq) {
>          tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
> @@ -46,6 +47,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>      TCGLabel *l2 = gen_new_label();
>
>      gen_get_gpr(src1, a->rs1);
> +    gen_pm_adjust_address(ctx, src1, src1);
>      tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
>
>      gen_get_gpr(src2, a->rs2);
> @@ -91,6 +93,7 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
>      gen_get_gpr(src1, a->rs1);
>      gen_get_gpr(src2, a->rs2);
>
> +    gen_pm_adjust_address(ctx, src1, src1);
>      (*func)(src2, src1, src2, ctx->mem_idx, mop);
>
>      gen_set_gpr(a->rd, src2);
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
> index 4f832637fa..935342f66d 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -25,6 +25,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
>      TCGv t0 = tcg_temp_new();
>      gen_get_gpr(t0, a->rs1);
>      tcg_gen_addi_tl(t0, t0, a->imm);
> +    gen_pm_adjust_address(ctx, t0, t0);
>
>      tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
>
> @@ -40,6 +41,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>      TCGv t0 = tcg_temp_new();
>      gen_get_gpr(t0, a->rs1);
>      tcg_gen_addi_tl(t0, t0, a->imm);
> +    gen_pm_adjust_address(ctx, t0, t0);
>
>      tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
>
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index 3dfec8211d..04b3c3eb3d 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -30,6 +30,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
>      TCGv t0 = tcg_temp_new();
>      gen_get_gpr(t0, a->rs1);
>      tcg_gen_addi_tl(t0, t0, a->imm);
> +    gen_pm_adjust_address(ctx, t0, t0);
>
>      tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
>      gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
> @@ -47,6 +48,7 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>      gen_get_gpr(t0, a->rs1);
>
>      tcg_gen_addi_tl(t0, t0, a->imm);
> +    gen_pm_adjust_address(ctx, t0, t0);
>
>      tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index d04ca0394c..bee7f6be46 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -141,6 +141,7 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
>      TCGv t1 = tcg_temp_new();
>      gen_get_gpr(t0, a->rs1);
>      tcg_gen_addi_tl(t0, t0, a->imm);
> +    gen_pm_adjust_address(ctx, t0, t0);
>
>      tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
>      gen_set_gpr(a->rd, t1);
> @@ -180,6 +181,7 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
>      TCGv dat = tcg_temp_new();
>      gen_get_gpr(t0, a->rs1);
>      tcg_gen_addi_tl(t0, t0, a->imm);
> +    gen_pm_adjust_address(ctx, t0, t0);
>      gen_get_gpr(dat, a->rs2);
>
>      tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 554d52a4be..5da7330f33 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -102,6 +102,16 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>      tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
>  }
>
> +/*
> + * Temp stub: generates address adjustment for PointerMasking
> + */
> +static void gen_pm_adjust_address(DisasContext *s,
> +                                  TCGv_i64      dst,
> +                                  TCGv_i64      src)
> +{
> +    tcg_gen_mov_i64(dst, src);
> +}
> +
>  /*
>   * A narrow n-bit operation, where n < FLEN, checks that input operands
>   * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
> @@ -381,6 +391,7 @@ static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
>      TCGv t1 = tcg_temp_new();
>      gen_get_gpr(t0, rs1);
>      tcg_gen_addi_tl(t0, t0, imm);
> +    gen_pm_adjust_address(ctx, t0, t0);
>      int memop = tcg_memop_lookup[(opc >> 12) & 0x7];
>
>      if (memop < 0) {
> @@ -401,6 +412,7 @@ static void gen_store_c(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
>      TCGv dat = tcg_temp_new();
>      gen_get_gpr(t0, rs1);
>      tcg_gen_addi_tl(t0, t0, imm);
> +    gen_pm_adjust_address(ctx, t0, t0);
>      gen_get_gpr(dat, rs2);
>      int memop = tcg_memop_lookup[(opc >> 12) & 0x7];
>
> @@ -460,6 +472,7 @@ static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
>      t0 = tcg_temp_new();
>      gen_get_gpr(t0, rs1);
>      tcg_gen_addi_tl(t0, t0, imm);
> +    gen_pm_adjust_address(ctx, t0, t0);
>
>      switch (opc) {
>      case OPC_RISC_FLW:
> @@ -499,6 +512,7 @@ static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
>      t0 = tcg_temp_new();
>      gen_get_gpr(t0, rs1);
>      tcg_gen_addi_tl(t0, t0, imm);
> +    gen_pm_adjust_address(ctx, t0, t0);
>
>      switch (opc) {
>      case OPC_RISC_FSW:
> --
> 2.20.1
>
>

