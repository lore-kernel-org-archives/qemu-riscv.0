Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnvZf-0005qG-8I
	for mharc-qemu-riscv@gnu.org; Thu, 18 Nov 2021 23:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnvZd-0005q1-Q3; Thu, 18 Nov 2021 23:32:29 -0500
Received: from [2607:f8b0:4864:20::130] (port=38805
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnvZb-00046v-Og; Thu, 18 Nov 2021 23:32:29 -0500
Received: by mail-il1-x130.google.com with SMTP id j21so3463947ila.5;
 Thu, 18 Nov 2021 20:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hEbZqFQqVGx96rIVVAYF969dWUzYqcSoNlGoq/uNabI=;
 b=nh5YJ6fG/nEu+3uCVUOdrZqxBCp9p0jiB7NXfcyfR5ZmSigCYZl6mEdpud0YL3nXjP
 6FZ/r/WQfF/e1lbdJywu12XP/URiswkB389/un70R7T27McqLa8j/vygAP7vutL2MoKU
 vQWEuKvMy4CGE+w4nt5/6EvmdEahD0xd9cAI5uwM40wd4OqJyIi1adyDY4/WYRL6RYLJ
 nIxqtwD56Se9iJr+3i2vqV13a2bdM1MMDrl9ASmi9UCX1ellacptBoB5QQD1SyV3azBY
 CUFADoTyyTTfXNSouFUfdpO6gJS+NW2HHFBRVug6BRor4GnHBdal5xJAPp6tv4vG6PNl
 bF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hEbZqFQqVGx96rIVVAYF969dWUzYqcSoNlGoq/uNabI=;
 b=vIMBTnqXqBAbdqyy5NUZ/iYHlE0jZrJT7rbKYtztG2/Gg6L5SrMp0aQ6Y3DtopigPL
 C76CNbxeu6uSzo3hze0YEJz+tN8cKaOD6yoJN1Wp/WRxB94XhOglH1bQgb9czB+hxc+m
 EWw1ouzRbEcm8K94DkScwISQlrxoCgkR/XycTdKrA9tv5Hrvrdevv8kmcvIKpt0uQe7N
 Jaey/ZGRv3BLxAfjrCqLDN0A1cgXZeqWkdqa2fDq7JmZw2a/U2SORDjO5b9mO02HjN0X
 BBFuW/qIhWJO1m1ZMO0KN6mC2OCuPeWRW6Vu9qezRuUK7PUJ7xix6rNimF8hBEpaj0yO
 hXVw==
X-Gm-Message-State: AOAM530ZMpkTmnBtmWn1pexMidW/QKavMzZBmuWJLvyQs+U8aKY1dcNx
 yr1Pal2mfVTPzrKKX3cLvf4R4HfxtBNkBvewYJ4=
X-Google-Smtp-Source: ABdhPJxqZLaEWzP5ijNggrvf9zClZhy6TJoEvAfpc+sWKRvvX2MznyqS8zjskuCfw3hldZsS2DYdzk1Q2aSm+L7jrvY=
X-Received: by 2002:a05:6e02:1e02:: with SMTP id
 g2mr2942282ila.290.1637296346484; 
 Thu, 18 Nov 2021 20:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-11-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-11-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 14:32:00 +1000
Message-ID: <CAKmqyKNsqLCwSLT9o4CRk5nT77WdFNmNHuCDV6Rj1JRW0KdJBw@mail.gmail.com>
Subject: Re: [PATCH v4 10/20] target/riscv: Calculate address according to XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 19 Nov 2021 04:32:30 -0000

On Fri, Nov 12, 2021 at 1:59 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Define one common function to compute a canonical address from a register
> plus offset. Merge gen_pm_adjust_address into this function.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rva.c.inc |  9 +++------
>  target/riscv/insn_trans/trans_rvd.c.inc | 19 ++---------------
>  target/riscv/insn_trans/trans_rvf.c.inc | 19 ++---------------
>  target/riscv/insn_trans/trans_rvi.c.inc | 18 ++---------------
>  target/riscv/translate.c                | 27 ++++++++++++-------------
>  5 files changed, 22 insertions(+), 70 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
> index 40fe132b04..1f64b8d332 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -20,12 +20,11 @@
>
>  static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>  {
> -    TCGv src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
> +    TCGv src1 = get_address(ctx, a->rs1, 0);
>
>      if (a->rl) {
>          tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
>      }
> -    src1 = gen_pm_adjust_address(ctx, src1);
>      tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
>      if (a->aq) {
>          tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
> @@ -44,8 +43,7 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>      TCGLabel *l1 = gen_new_label();
>      TCGLabel *l2 = gen_new_label();
>
> -    src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
> -    src1 = gen_pm_adjust_address(ctx, src1);
> +    src1 = get_address(ctx, a->rs1, 0);
>      tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
>
>      /*
> @@ -83,10 +81,9 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
>                      MemOp mop)
>  {
>      TCGv dest = dest_gpr(ctx, a->rd);
> -    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src1 = get_address(ctx, a->rs1, 0);
>      TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>
> -    src1 = gen_pm_adjust_address(ctx, src1);
>      func(dest, src1, src2, ctx->mem_idx, mop);
>
>      gen_set_gpr(ctx, a->rd, dest);
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
> index 64fb0046f7..88a491375c 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -25,14 +25,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    addr = get_gpr(ctx, a->rs1, EXT_NONE);
> -    if (a->imm) {
> -        TCGv temp = temp_new(ctx);
> -        tcg_gen_addi_tl(temp, addr, a->imm);
> -        addr = temp;
> -    }
> -    addr = gen_pm_adjust_address(ctx, addr);
> -
> +    addr = get_address(ctx, a->rs1, a->imm);
>      tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
>
>      mark_fs_dirty(ctx);
> @@ -46,16 +39,8 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -    addr = get_gpr(ctx, a->rs1, EXT_NONE);
> -    if (a->imm) {
> -        TCGv temp = temp_new(ctx);
> -        tcg_gen_addi_tl(temp, addr, a->imm);
> -        addr = temp;
> -    }
> -    addr = gen_pm_adjust_address(ctx, addr);
> -
> +    addr = get_address(ctx, a->rs1, a->imm);
>      tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
> -
>      return true;
>  }
>
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index b5459249c4..0aac87f7db 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -31,14 +31,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    addr = get_gpr(ctx, a->rs1, EXT_NONE);
> -    if (a->imm) {
> -        TCGv temp = temp_new(ctx);
> -        tcg_gen_addi_tl(temp, addr, a->imm);
> -        addr = temp;
> -    }
> -    addr = gen_pm_adjust_address(ctx, addr);
> -
> +    addr = get_address(ctx, a->rs1, a->imm);
>      dest = cpu_fpr[a->rd];
>      tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
>      gen_nanbox_s(dest, dest);
> @@ -54,16 +47,8 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> -    addr = get_gpr(ctx, a->rs1, EXT_NONE);
> -    if (a->imm) {
> -        TCGv temp = tcg_temp_new();
> -        tcg_gen_addi_tl(temp, addr, a->imm);
> -        addr = temp;
> -    }
> -    addr = gen_pm_adjust_address(ctx, addr);
> -
> +    addr = get_address(ctx, a->rs1, a->imm);
>      tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
> -
>      return true;
>  }
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 40c81421f2..cb73a2f1ee 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -137,14 +137,7 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
>  static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
>  {
>      TCGv dest = dest_gpr(ctx, a->rd);
> -    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
> -
> -    if (a->imm) {
> -        TCGv temp = temp_new(ctx);
> -        tcg_gen_addi_tl(temp, addr, a->imm);
> -        addr = temp;
> -    }
> -    addr = gen_pm_adjust_address(ctx, addr);
> +    TCGv addr = get_address(ctx, a->rs1, a->imm);
>
>      tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
>      gen_set_gpr(ctx, a->rd, dest);
> @@ -178,16 +171,9 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
>
>  static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
>  {
> -    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv addr = get_address(ctx, a->rs1, a->imm);
>      TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
>
> -    if (a->imm) {
> -        TCGv temp = temp_new(ctx);
> -        tcg_gen_addi_tl(temp, addr, a->imm);
> -        addr = temp;
> -    }
> -    addr = gen_pm_adjust_address(ctx, addr);
> -
>      tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
>      return true;
>  }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 6cb74c6355..fd75f7c4bc 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -284,21 +284,20 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>      ctx->base.is_jmp = DISAS_NORETURN;
>  }
>
> -/*
> - * Generates address adjustment for PointerMasking
> - */
> -static TCGv gen_pm_adjust_address(DisasContext *s, TCGv src)
> -{
> -    TCGv temp;
> -    if (!s->pm_enabled) {
> -        /* Load unmodified address */
> -        return src;
> -    } else {
> -        temp = temp_new(s);
> -        tcg_gen_andc_tl(temp, src, pm_mask);
> -        tcg_gen_or_tl(temp, temp, pm_base);
> -        return temp;
> +/* Compute a canonical address from a register plus offset. */
> +static TCGv get_address(DisasContext *ctx, int rs1, int imm)
> +{
> +    TCGv addr = temp_new(ctx);
> +    TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
> +
> +    tcg_gen_addi_tl(addr, src1, imm);
> +    if (ctx->pm_enabled) {
> +        tcg_gen_and_tl(addr, addr, pm_mask);
> +        tcg_gen_or_tl(addr, addr, pm_base);
> +    } else if (get_xl(ctx) == MXL_RV32) {
> +        tcg_gen_ext32u_tl(addr, addr);
>      }
> +    return addr;
>  }
>
>  #ifndef CONFIG_USER_ONLY
> --
> 2.25.1
>
>

