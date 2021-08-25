Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIm3h-0005He-6q
	for mharc-qemu-riscv@gnu.org; Wed, 25 Aug 2021 02:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIm3g-0005HN-5Z; Wed, 25 Aug 2021 02:06:44 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:41531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIm3d-0003VG-8t; Wed, 25 Aug 2021 02:06:43 -0400
Received: by mail-io1-xd34.google.com with SMTP id j18so29326393ioj.8;
 Tue, 24 Aug 2021 23:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PCZxr+8cCh6S5wv312qmGPwvfEZfeKgbGMKc1JhKGvk=;
 b=jxkOXSdeB2A/UHV8O9/433FYpJYX752tuwbZG//qnVS3wb53b4AgnwiTHIWv7CWnYf
 vZL4eBfSe+z4UiSJfqnHldD41nnxMDPCMgweAOrqJ2Qq3pj14QdmEOKWp9/8U9qc2d/u
 y2t1aPnp3Mh6uOkPWZXoOiTHNEEOILXxAQpfgiqPZcG3rpHJJbJ/LdD2JwXstIZ16B20
 4JxhqOjowQBmr8iBv4jYE/+B0s7CSMt3sq33njVjgiqCaW5ZEGxq9SVkfv0xrx+TcdNb
 j1u1uXGZbXzc509EWQZWs+owbq/cIGmTOiAmLtA5yFu3APEUieBoFQa+/qSxtGc2/9y2
 vzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PCZxr+8cCh6S5wv312qmGPwvfEZfeKgbGMKc1JhKGvk=;
 b=YCotPiSPkiprrOlUZE7YtZmSkkpian1WCCosPLcfBX2NK1oja6OjapSz8jzAy+BXEA
 /z4VPRdKt3L0n/yhP0aRxO+cHcDc7ihPZd5RfhA0FciC2kDPDnpqvMCpxMi0wJH6UZ6P
 MAENyodgMNa+DIZnhO80f2AthTvElFtbqlqD0k7UlwibO8qrdn3o5vrVC9RNk4JIKqEn
 wMr0Q4V1KwoMuku8MsGs/4EzHSqljYgAOc70HiG/jaGvZlOthQYwAnWFFi3i51GuGx26
 Y2LHd4WiuSX4l4QVJnfUreNm9aa5Z40FnXRV9Ln8YBJWm+vZemUro3aCoCqxCTp6OKy0
 NoQw==
X-Gm-Message-State: AOAM531Nu3kG3q4jK+vY0iDx7U8kvRcMrx/JydCNdoV+QMFoG8Z6PKLd
 EUwRfop5odu8iSD6eQ2gudwEQjGXtM2ddRW/be0=
X-Google-Smtp-Source: ABdhPJycVJ700squu/UUi398Naa6zbkggNTzODdlqTdJ4RMAx+x6u6xN+H9/XQXMc1kBhgw4CCq5WB85NJY8TBUDlcs=
X-Received: by 2002:a02:90d0:: with SMTP id c16mr37924721jag.106.1629871598963; 
 Tue, 24 Aug 2021 23:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210823195529.560295-1-richard.henderson@linaro.org>
 <20210823195529.560295-20-richard.henderson@linaro.org>
In-Reply-To: <20210823195529.560295-20-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Aug 2021 16:06:12 +1000
Message-ID: <CAKmqyKPjTdut0Ry8mMbcQWwbJNE16S_KWGzvPP2YU9-8Bydjfg@mail.gmail.com>
Subject: Re: [PATCH v5 19/24] target/riscv: Use {get,dest}_gpr for RVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Wed, 25 Aug 2021 06:06:44 -0000

On Tue, Aug 24, 2021 at 6:07 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rva.c.inc | 47 ++++++++++---------------
>  1 file changed, 19 insertions(+), 28 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
> index 3cc3c3b073..6ea07d89b0 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -18,11 +18,10 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> -static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
> +static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>  {
> -    TCGv src1 = tcg_temp_new();
> -    /* Put addr in load_res, data in load_val.  */
> -    gen_get_gpr(ctx, src1, a->rs1);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
> +
>      if (a->rl) {
>          tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
>      }
> @@ -30,33 +29,33 @@ static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>      if (a->aq) {
>          tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
>      }
> +
> +    /* Put addr in load_res, data in load_val.  */
>      tcg_gen_mov_tl(load_res, src1);
>      gen_set_gpr(ctx, a->rd, load_val);
>
> -    tcg_temp_free(src1);
>      return true;
>  }
>
> -static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
> +static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>  {
> -    TCGv src1 = tcg_temp_new();
> -    TCGv src2 = tcg_temp_new();
> -    TCGv dat = tcg_temp_new();
> +    TCGv dest, src1, src2;
>      TCGLabel *l1 = gen_new_label();
>      TCGLabel *l2 = gen_new_label();
>
> -    gen_get_gpr(ctx, src1, a->rs1);
> +    src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
>      tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
>
> -    gen_get_gpr(ctx, src2, a->rs2);
>      /*
>       * Note that the TCG atomic primitives are SC,
>       * so we can ignore AQ/RL along this path.
>       */
> -    tcg_gen_atomic_cmpxchg_tl(src1, load_res, load_val, src2,
> +    dest = dest_gpr(ctx, a->rd);
> +    src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +    tcg_gen_atomic_cmpxchg_tl(dest, load_res, load_val, src2,
>                                ctx->mem_idx, mop);
> -    tcg_gen_setcond_tl(TCG_COND_NE, dat, src1, load_val);
> -    gen_set_gpr(ctx, a->rd, dat);
> +    tcg_gen_setcond_tl(TCG_COND_NE, dest, dest, load_val);
> +    gen_set_gpr(ctx, a->rd, dest);
>      tcg_gen_br(l2);
>
>      gen_set_label(l1);
> @@ -65,8 +64,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>       * provide the memory barrier implied by AQ/RL.
>       */
>      tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + a->rl * TCG_BAR_STRL);
> -    tcg_gen_movi_tl(dat, 1);
> -    gen_set_gpr(ctx, a->rd, dat);
> +    gen_set_gpr(ctx, a->rd, tcg_constant_tl(1));
>
>      gen_set_label(l2);
>      /*
> @@ -75,9 +73,6 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>       */
>      tcg_gen_movi_tl(load_res, -1);
>
> -    tcg_temp_free(dat);
> -    tcg_temp_free(src1);
> -    tcg_temp_free(src2);
>      return true;
>  }
>
> @@ -85,17 +80,13 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
>                      void(*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
>                      MemOp mop)
>  {
> -    TCGv src1 = tcg_temp_new();
> -    TCGv src2 = tcg_temp_new();
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>
> -    gen_get_gpr(ctx, src1, a->rs1);
> -    gen_get_gpr(ctx, src2, a->rs2);
> +    func(dest, src1, src2, ctx->mem_idx, mop);
>
> -    (*func)(src2, src1, src2, ctx->mem_idx, mop);
> -
> -    gen_set_gpr(ctx, a->rd, src2);
> -    tcg_temp_free(src1);
> -    tcg_temp_free(src2);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> --
> 2.25.1
>
>

