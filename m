Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGbYE-0006AQ-4O
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 02:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbYC-00067j-J8; Thu, 19 Aug 2021 02:29:16 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:42588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbYA-0006TY-V0; Thu, 19 Aug 2021 02:29:16 -0400
Received: by mail-io1-xd2d.google.com with SMTP id d11so6241627ioo.9;
 Wed, 18 Aug 2021 23:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rL+8rYosAFIyZdfUghGjqixRG5qcr6dTt0ijpHlbqDU=;
 b=LrzTBYcAubwUouNME5/c9e3M0OI0hi+FR3/mPx4tWS1vcyZfSsZZ30pwv70GadUgOG
 s2/cs9xunkDUogt9r9zTsrVhs7iDmcWjzqpoWpdQTwL3PgfQCOYfkwBxR9h4ZyNbiozB
 H3jBpfnGy9bxSreEZ37xDPlwyyKwqcIiYINiQENqF9yOB0oyK/Xe38RPbh2smrbqz1NQ
 oMB4RMkscQSbFXB8cV76cUbsRHF/bpOuDnmyxl9DMB+UDibZj4l/PGXp76p5jZWvblLp
 udEIXtFSoQ6CLbUR8U9zKhGs8jmIpbayUtflPNdFZsWjVFVPGVEvzQt3OihBTXL+cr34
 AAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rL+8rYosAFIyZdfUghGjqixRG5qcr6dTt0ijpHlbqDU=;
 b=OXRbg80TICOMVw2fEq4o81WzbF7APBr7S3fcQQPi706ENmIZHkJ+QxNqUs3u8oTrRF
 sINYJTCKZ8FMxOhw1GR0bh0QnGtMGZ8x2LVsSskRmOlyJsbswfACwForpR1JLsZrWqDH
 5+I9LHz/MU1Lj17YWygv9xGSp1EBjrOCPrF4n+UPlq8ejg+xt2KvD/lOIG7HrqajCnjQ
 gh1uiaTUito7CdvsC+iXHq6AOEM0qZp1XsiuxzCR8fCctjEAjHgxLbWPyBXJSsgjPEQ8
 RuOFQSYwnFVR/0La4fhXmd+dgSxIt9i3dWHYzqkZ0mw+FX/XxxpyGOF/v6I9wJBb/M99
 5kFA==
X-Gm-Message-State: AOAM531EGEHmkg1lfr+x5IcyIAaBCu0EkdU6pXdbt8obUKsymzuxqQjq
 ZTlvWqRLy5pCso5si9xJNeXQnoPoc4sXzeby+pY=
X-Google-Smtp-Source: ABdhPJy2P2yTBmFCQJZ1NmVC4PZ2FLDMndZ08SfJhvvSkIAnSHPSYGJrylyVcVVNyWiJ8Sc7pptC3b+kDDzaBzdl2T4=
X-Received: by 2002:a02:c6c1:: with SMTP id r1mr6832568jan.26.1629354553716;
 Wed, 18 Aug 2021 23:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-7-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-7-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Aug 2021 16:28:47 +1000
Message-ID: <CAKmqyKPMcXJ5KxPG4xu+sJD8hHW3_oKtgh8N40+1eoWSOFeygQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/21] target/riscv: Remove gen_arith_div*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Thu, 19 Aug 2021 06:29:17 -0000

On Wed, Aug 18, 2021 at 7:21 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use ctx->w and the enhanced gen_arith function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                | 42 -------------------------
>  target/riscv/insn_trans/trans_rvm.c.inc | 16 +++++-----
>  2 files changed, 8 insertions(+), 50 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 4819682bf1..e337dca01b 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -491,48 +491,6 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ext,
>      return true;
>  }
>
> -static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
> -                            void(*func)(TCGv, TCGv, TCGv))
> -{
> -    TCGv source1, source2;
> -    source1 = tcg_temp_new();
> -    source2 = tcg_temp_new();
> -
> -    gen_get_gpr(ctx, source1, a->rs1);
> -    gen_get_gpr(ctx, source2, a->rs2);
> -    tcg_gen_ext32s_tl(source1, source1);
> -    tcg_gen_ext32s_tl(source2, source2);
> -
> -    (*func)(source1, source1, source2);
> -
> -    tcg_gen_ext32s_tl(source1, source1);
> -    gen_set_gpr(ctx, a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> -    return true;
> -}
> -
> -static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
> -                            void(*func)(TCGv, TCGv, TCGv))
> -{
> -    TCGv source1, source2;
> -    source1 = tcg_temp_new();
> -    source2 = tcg_temp_new();
> -
> -    gen_get_gpr(ctx, source1, a->rs1);
> -    gen_get_gpr(ctx, source2, a->rs2);
> -    tcg_gen_ext32u_tl(source1, source1);
> -    tcg_gen_ext32u_tl(source2, source2);
> -
> -    (*func)(source1, source1, source2);
> -
> -    tcg_gen_ext32s_tl(source1, source1);
> -    gen_set_gpr(ctx, a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> -    return true;
> -}
> -
>  static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
>  {
>      tcg_gen_deposit_tl(ret, arg1, arg2,
> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
> index 013b3f7009..3d93b24c25 100644
> --- a/target/riscv/insn_trans/trans_rvm.c.inc
> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
> @@ -99,30 +99,30 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVM);
> -
> -    return gen_arith_div_w(ctx, a, &gen_div);
> +    ctx->w = true;
> +    return gen_arith(ctx, a, EXT_SIGN, gen_div);
>  }
>
>  static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVM);
> -
> -    return gen_arith_div_uw(ctx, a, &gen_divu);
> +    ctx->w = true;
> +    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
>  }
>
>  static bool trans_remw(DisasContext *ctx, arg_remw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVM);
> -
> -    return gen_arith_div_w(ctx, a, &gen_rem);
> +    ctx->w = true;
> +    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
>  }
>
>  static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVM);
> -
> -    return gen_arith_div_uw(ctx, a, &gen_remu);
> +    ctx->w = true;
> +    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
>  }
> --
> 2.25.1
>
>

