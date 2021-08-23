Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mI40j-0006Nh-KS
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 03:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI40i-0006LQ-Ch; Mon, 23 Aug 2021 03:04:44 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:44613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI40f-0003uA-PN; Mon, 23 Aug 2021 03:04:43 -0400
Received: by mail-il1-x12d.google.com with SMTP id b4so6577871ilr.11;
 Mon, 23 Aug 2021 00:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0qXMKfnyKANrEsHYydpIxtd5wqBpQNSGdSJ8+Tl+Rbg=;
 b=JGMx3aDTEa7P3cSUGQHOElXufMEnOG5HU5nnESIBjemp+LseB4gSodaaJ5+XZIZ+qf
 Hk0O5lIFAeKX+ksA1V+6S9LYKKGWbkQ3f5dXYFPT5yhYq1GOPgsh8dfCLPjBuRSsDcBM
 r4RHVtO64Y4iN8tl2x+b6B9/ifqbnOr8qgqROx6Br8KWcrZ9BDgvo/QinXFTszMky/Cb
 k4l3Jpec55wVxS663pf1Y/q/ZFa1xY0JqQOOlNQY27KF8heZI2z2JulmNMoxWPK6vPPR
 sPkNwmSiTeesMPxoeo7XNIBZGpwYkCnEg/iFjRRfwi2BHhvtdoENBa26oMq9VGSANZ2h
 RYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0qXMKfnyKANrEsHYydpIxtd5wqBpQNSGdSJ8+Tl+Rbg=;
 b=Ge9JF5vzbnqdXh9QdnZV2B/fSFIlfrkD6AdwBU+sQKNf5tC1LDm7lWF+8hE99JFUN7
 3ib0/YRjiU57CTCSbfFZI/xB0TUk9j8pkOOzto8xDFLf55KKXH1uij6UvO8RKsfXLN2/
 XM5yrUQsZcCyj3SfG/4zbHi/ZORPZnBiGYnLkfcBxrWwfuqMalLDzzVPtLX1z5vOhE+N
 IWRDYV8hUV0zWpzlN1kHS3Qjj1lHf+bxo+aHWoH42Glijks8Sm2wqmnNf4oljZ6uyii6
 6BMw1lLXnYzcgVsWCwIfr1C5DsQm4CSrzoH/ALvsckUdzFFvGPCuSmoQ3/VNj8F/J4Tc
 SAWw==
X-Gm-Message-State: AOAM532Y0dGeuJz70VPKJ07GB3t463naRNObIJgTQo/QuwqPwRULOQGD
 EnOTdeBEP8FPOyEiPMZFmYCYLWz2NVa9a/S0tGM=
X-Google-Smtp-Source: ABdhPJxiIgZ6uQMb/eDSfvKuJms7iBOdsIfHY1pBZT2j7K7oBPNuyemQAc8MR7AePiazMUzxiEZmn245yJy6NK7bOOA=
X-Received: by 2002:a92:ce03:: with SMTP id b3mr21969126ilo.267.1629702279924; 
 Mon, 23 Aug 2021 00:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210820174257.548286-1-richard.henderson@linaro.org>
 <20210820174257.548286-15-richard.henderson@linaro.org>
In-Reply-To: <20210820174257.548286-15-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Aug 2021 17:04:13 +1000
Message-ID: <CAKmqyKNygOErDYnidaArHGmTjPF_ynyPtE9q6SFSTq2n923Oew@mail.gmail.com>
Subject: Re: [PATCH v4 14/21] target/riscv: Use {get,
 dest}_gpr for integer load/store
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 07:04:44 -0000

On Sat, Aug 21, 2021 at 3:59 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 36 +++++++++++++------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index af3e0bc0e6..f616a26c82 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -138,15 +138,17 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
>
>  static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
>  {
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> -    tcg_gen_addi_tl(t0, t0, a->imm);
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
>
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
> -    gen_set_gpr(ctx, a->rd, t1);
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> +    if (a->imm) {
> +        TCGv temp = temp_new(ctx);
> +        tcg_gen_addi_tl(temp, addr, a->imm);
> +        addr = temp;
> +    }
> +
> +    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> @@ -177,19 +179,19 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
>
>  static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
>  {
> -    TCGv t0 = tcg_temp_new();
> -    TCGv dat = tcg_temp_new();
> -    gen_get_gpr(ctx, t0, a->rs1);
> -    tcg_gen_addi_tl(t0, t0, a->imm);
> -    gen_get_gpr(ctx, dat, a->rs2);
> +    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
>
> -    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
> -    tcg_temp_free(t0);
> -    tcg_temp_free(dat);
> +    if (a->imm) {
> +        TCGv temp = temp_new(ctx);
> +        tcg_gen_addi_tl(temp, addr, a->imm);
> +        addr = temp;
> +    }
> +
> +    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
>      return true;
>  }
>
> -
>  static bool trans_sb(DisasContext *ctx, arg_sb *a)
>  {
>      return gen_store(ctx, a, MO_SB);
> --
> 2.25.1
>
>

