Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m39kv-0006BG-4I
	for mharc-qemu-riscv@gnu.org; Tue, 13 Jul 2021 00:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m39kt-00069s-Ih; Tue, 13 Jul 2021 00:10:47 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:44871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m39ko-0003mB-37; Tue, 13 Jul 2021 00:10:47 -0400
Received: by mail-il1-x12e.google.com with SMTP id r16so14866113ilt.11;
 Mon, 12 Jul 2021 21:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ADMnpfMlSis2I/L0LO3Jub9IdziaaoxeH5za35/zw10=;
 b=Zo+8PKD6gG5x2zZ1nOxffUChRwsFf7e0M4RsaDyjx/x+ghTS3/p/XlFSO42qJqCCHJ
 a8euRWXU7ke93harknguaOxSbokPjF36vyjaW7jOTS9PwbFBbYEo1kakfp03CmRtIAcC
 tBepJSn9lWRLpg/+TsmM4pC6Np9wjzYf17lhrdE9t+I8yDy3tArIKWwpWy+nxh5H6tIZ
 Q/bn2o+8xlMEKX5RPQ0Y6j0dX+lkIeWe0+a9jZ3kZPBoULRr5vHmc32/arbYVLrJoyvs
 dbwoK/Ru7AOyD2pN0JWFlTT+PN1q+gzFIDWkH1DT6fjgqnLJRSoBCn2nlnE/TDLzt80g
 8sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ADMnpfMlSis2I/L0LO3Jub9IdziaaoxeH5za35/zw10=;
 b=ss//A020jclzphKj6PLNBcU1KHdWaCuKLOalzc17plQXTxmQOaw/30q2hrm9oR+wrq
 Nn/3mnt06SEEN07KdBpMjjp0WdXeO3OhHgwgqS3CWohHlZVNMyERxvY75yVgEF49iThx
 QK93L13j/Y+0apVKqgzT8/k5EHpNFRQ9xcOP8KWtEyqHfnVXfHWIkQTTIKz1ZmY4sexG
 vdvjd11FUTy3Jn06oq10JhVb/t6yrtrFEhoHsUtXE7VDgVjFLA7rya6cF6zpN+wd2ZQP
 /oXRJ5/+7NNcnX+9UpJSBqbKN3fzGr+c5OdtBeqis3HNMsSclvP7vhnOkhzhS8KeWvly
 1jFg==
X-Gm-Message-State: AOAM531Mrx4j5ZL+PS2RhE7gHQULV25xAbTFLpf/3V+ezT1eSROKZnh3
 81J35WitpLP4eH7sKrPEkMsnEQNFwdvVRb4E5rA=
X-Google-Smtp-Source: ABdhPJw2SiWF5sAt68Tguga9NV93iT8fijqCZy74f4CAh5hWIOrUpywIKUVOzE1VaU2/1+Ge0NYIyB0xR2VguBzzZtw=
X-Received: by 2002:a92:c907:: with SMTP id t7mr1494253ilp.267.1626149440639; 
 Mon, 12 Jul 2021 21:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-4-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-4-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Jul 2021 14:10:14 +1000
Message-ID: <CAKmqyKMuBs-ykLVPVFvgO2XSyj3doFgEHFijhAxO35-Up6ugZQ@mail.gmail.com>
Subject: Re: [PATCH 03/17] target/riscv: Use gpr_{src, dst} in shift operations
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Tue, 13 Jul 2021 04:10:47 -0000

On Fri, Jul 9, 2021 at 2:43 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These operations are slightly more complicated since
> we need to crop the shift operand.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 68 +++++++++++++++-------------------------
>  1 file changed, 26 insertions(+), 42 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 2cfcb849b8..a60b198623 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -778,18 +778,14 @@ static bool gen_arith(DisasContext *ctx, arg_r *a,
>  static bool gen_shift(DisasContext *ctx, arg_r *a,
>                          void(*func)(TCGv, TCGv, TCGv))
>  {
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2 = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +    TCGv src2 = gpr_src(ctx, a->rs2);
> +    TCGv ext2 = tcg_temp_new();
>
> -    gen_get_gpr(source1, a->rs1);
> -    gen_get_gpr(source2, a->rs2);
> -
> -    tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
> -    (*func)(source1, source1, source2);
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> +    tcg_gen_andi_tl(ext2, src2, TARGET_LONG_BITS - 1);
> +    (*func)(dest, src1, ext2);
> +    tcg_temp_free(ext2);
>      return true;
>  }
>
> @@ -805,58 +801,46 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  static bool gen_shifti(DisasContext *ctx, arg_shift *a,
>                         void(*func)(TCGv, TCGv, TCGv))
>  {
> +    TCGv dest, src1, src2;
> +
>      if (a->shamt >= TARGET_LONG_BITS) {
>          return false;
>      }
>
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2 = tcg_temp_new();
> +    dest = gpr_dst(ctx, a->rd);
> +    src1 = gpr_src(ctx, a->rs1);
> +    src2 = tcg_constant_tl(a->shamt);
>
> -    gen_get_gpr(source1, a->rs1);
> -
> -    tcg_gen_movi_tl(source2, a->shamt);
> -    (*func)(source1, source1, source2);
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> +    (*func)(dest, src1, src2);
>      return true;
>  }
>
>  static bool gen_shiftw(DisasContext *ctx, arg_r *a,
>                         void(*func)(TCGv, TCGv, TCGv))
>  {
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2 = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +    TCGv src2 = gpr_src(ctx, a->rs2);
> +    TCGv ext2 = tcg_temp_new();
>
> -    gen_get_gpr(source1, a->rs1);
> -    gen_get_gpr(source2, a->rs2);
> +    tcg_gen_andi_tl(ext2, src2, 31);
> +    (*func)(dest, src1, ext2);
> +    tcg_gen_ext32s_tl(dest, dest);
>
> -    tcg_gen_andi_tl(source2, source2, 31);
> -    (*func)(source1, source1, source2);
> -    tcg_gen_ext32s_tl(source1, source1);
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> +    tcg_temp_free(ext2);
>      return true;
>  }
>
>  static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
>                          void(*func)(TCGv, TCGv, TCGv))
>  {
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2 = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +    TCGv src2 = tcg_constant_tl(a->shamt);
>
> -    gen_get_gpr(source1, a->rs1);
> -    tcg_gen_movi_tl(source2, a->shamt);
> +    (*func)(dest, src1, src2);
> +    tcg_gen_ext32s_tl(dest, dest);
>
> -    (*func)(source1, source1, source2);
> -    tcg_gen_ext32s_tl(source1, source1);
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
>      return true;
>  }
>
> --
> 2.25.1
>
>

