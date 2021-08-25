Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIm5T-0006tK-8M
	for mharc-qemu-riscv@gnu.org; Wed, 25 Aug 2021 02:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIm5N-0006rC-1g; Wed, 25 Aug 2021 02:08:29 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:39930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIm5K-0004sI-JL; Wed, 25 Aug 2021 02:08:28 -0400
Received: by mail-io1-xd2d.google.com with SMTP id a21so29412192ioq.6;
 Tue, 24 Aug 2021 23:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ULsfIXMbB6cyq1ZPYDmEy4P2lNn2Vn6BNcjwR6EdJws=;
 b=tackXS4IKfi5sZ1sKYHXz3HSp8HtyGLjARatMExMuCVxn7b1ZylQ6ZDmBnu91+k6Z1
 kXLYCvgqS3XWaITJ7ZUk1Lw7Kn/qblvOTOUumLzFETd8wfWCC0ej2+KTRGsjTW1vksNA
 vGAtJXp4G5M0LFRdyXGwjVto2fcU9ecjfwJrp7DLlW70UeGVOlt0JIv91dG+nCoPyfcW
 GL+w8L2hyKRiUfRqXqxQG5easZK3RKFdQHfr7TKLsBZispvLW3FOQP4BmbPgFRLCi2wL
 LlnCY1NLaIaNAs2KHbe6YzAZ7ahc5dk6ZgV58BBPYOTH1/7coY0ZfacdMfV/qTbOVjMU
 cAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ULsfIXMbB6cyq1ZPYDmEy4P2lNn2Vn6BNcjwR6EdJws=;
 b=l6s7Uzgy8BzSNtKt4OGfjZHldFkozotHfEoK+UJ30SaJqUTpzdEgyISjXQdQlbresM
 v5yCV5wFu6whUbLr/aAhBQnrdBu7uXzSoY/0KQ9At3jkKWnrEBlL80lq+8DntEfW7Z4g
 M056v2qWklycLv0LUtCfD/m0TpA1DAYVkAQgovF+LDssio4OfIWbax+RmJGVivFHa96u
 FGP2BA8HV8FDx67A0ZwfdBHVMuM43WFV9q47EGGsLa3viYY8zrrkMTn8/L0LilvFyPM/
 PyM1AtSrhAPOWkOvCcQM8Xt+PctbUbCDTulBbHxO48R47dGOVI1XGMSHSuiQS01s9vSd
 95ow==
X-Gm-Message-State: AOAM532iP97z+nGcXTucnsbV9zpcjB2acds9f2UZ+tQBo4O/ma8/K+Cq
 1z2nwNvCrZErJ6KDSGaF2qeypKQU0ZEBSj+700I=
X-Google-Smtp-Source: ABdhPJwZie7wDuYtAGRsbp6nxk2yF/7AjNFZHgyEnbLJQWZnfWTRv2iX4W9WEWJ2sUH3GOltEFf1bcJrwa/YF8pNSno=
X-Received: by 2002:a5d:8e19:: with SMTP id e25mr35031855iod.175.1629871705259; 
 Tue, 24 Aug 2021 23:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210823195529.560295-1-richard.henderson@linaro.org>
 <20210823195529.560295-14-richard.henderson@linaro.org>
In-Reply-To: <20210823195529.560295-14-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Aug 2021 16:07:59 +1000
Message-ID: <CAKmqyKOQh7rQ15OQGerzCSeLp2szq42RqvYN+WddCB6Whz89iA@mail.gmail.com>
Subject: Re: [PATCH v5 13/24] target/riscv: Use extracts for sraiw and srliw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Wed, 25 Aug 2021 06:08:29 -0000

On Tue, Aug 24, 2021 at 6:05 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These operations can be done in one instruction on some hosts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index e4726e618c..9e8d99be51 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -347,18 +347,28 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
>      return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
>  }
>
> +static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
> +{
> +    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
> +}
> +
>  static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      ctx->w = true;
> -    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
> +    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
> +}
> +
> +static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
> +{
> +    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
>  }
>
>  static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      ctx->w = true;
> -    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
> +    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_sraiw);
>  }
>
>  static bool trans_addw(DisasContext *ctx, arg_addw *a)
> --
> 2.25.1
>
>

