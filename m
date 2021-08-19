Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGfmk-0000jF-DV
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 07:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGfmj-0000j2-9c; Thu, 19 Aug 2021 07:00:33 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:35534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGfmh-0000F9-7V; Thu, 19 Aug 2021 07:00:33 -0400
Received: by mail-yb1-xb36.google.com with SMTP id z5so11610171ybj.2;
 Thu, 19 Aug 2021 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=shFDHgEAdyuweNRhkAluPzL6Q8hVknP5wyNYB4uc3dY=;
 b=OLfSqFaUHlnULj8atOElBlq2KhFbk+bEZMdy5vqrPJbL1+1IfyT0xcsgyy3EC5yHLt
 ergjWGEFv+Fud1NndKLsMgrkWKrOkIfUiELMuMw0hwCsE11kUpyGVXHI2msEeSLcJ0dO
 1Lq8bXnO8FW9n6mbqvsOYZci8qvqzeMmK31XYToqzQX0TMp84PRyvrU86cmd+OLonjLq
 viEEnQALrKPRl47EmKFgG3p/DA4v47QIdw/xGjsDijAMoa5ygginMikft3BktWyhwjFr
 0b/va1gVQjqfSWmZwPv8RSa9CLRdN0sPI9DKBectTgKPiePPkDJuLfBioMxiL7VSFwTC
 +PhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=shFDHgEAdyuweNRhkAluPzL6Q8hVknP5wyNYB4uc3dY=;
 b=DdrXlbVATkKhhJWn4EAVLIwNLqIzS2Gm8utv0cBp+NnDFKotwld+dwgXO6xbIrxeV7
 1oUjzwR5IksSMjKlcNlrDTTsZ6Dyt10yX2Xmr/9cZCA1RrAhAUc40+2IhwVYxn9A8S6d
 O+78o9I2FbuIYkcPKorc57CpGPmox+PSy/lX0Rw3OKG+ElBFzhRV54Wjj9KIodB4xR7/
 sGJYZmKj/ES1IpQTol6y6L0nRuGOPOdrquulXkCIwpCG23mKnjJ/r8qOnuab9pBziH2C
 jNwoleO935+q7oAJyjxQ1xFmNxRQFefKNCkkOWwln07oTG2i5WWeTioQbifeNmuD6rm3
 RDBw==
X-Gm-Message-State: AOAM532+o2m8ELFjMVdejlx7RjooFpRIeJhEPRbmCHveaLJBEHmLzhVY
 fMtrcSNIq8Sv+e9Mk1fVVn7Bvv1n2prO5moccTQ=
X-Google-Smtp-Source: ABdhPJwJYydXofkFRbtOvNkuofhmmroNZsOM88UgQ9c35TOocYRD2WwMthhF/GbWMYaB/6/+a9zJ/IghAd5Pygc75AY=
X-Received: by 2002:a25:d20b:: with SMTP id j11mr18123715ybg.332.1629370827988; 
 Thu, 19 Aug 2021 04:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210819090502.428068-1-richard.henderson@linaro.org>
 <20210819090502.428068-3-richard.henderson@linaro.org>
In-Reply-To: <20210819090502.428068-3-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 19:00:16 +0800
Message-ID: <CAEUhbmV7mHc_MWPvhNG0Lh_vtjU-zOAABXGPkOm0YJUT5epSKQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/21] target/riscv: Clean up division helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 19 Aug 2021 11:00:33 -0000

On Thu, Aug 19, 2021 at 5:07 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Utilize the condition in the movcond more; this allows some of
> the setcond that were feeding into movcond to be removed.
> Do not write into source1 and source2.  Re-name "condN" to "tempN"
> and use the temporaries for more than holding conditions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c | 146 +++++++++++++++++++--------------------
>  1 file changed, 71 insertions(+), 75 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 20a55c92fb..b52181538f 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -213,106 +213,102 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
>
>  static void gen_div(TCGv ret, TCGv source1, TCGv source2)
>  {
> -    TCGv cond1, cond2, zeroreg, resultopt1;
> +    TCGv temp1, temp2, zero, one, mone, min;
> +
>      /*
>       * Handle by altering args to tcg_gen_div to produce req'd results:
> -     * For overflow: want source1 in source1 and 1 in source2
> -     * For div by zero: want -1 in source1 and 1 in source2 -> -1 result
> +     * For overflow: want source1 in temp1 and 1 in temp2
> +     * For div by zero: want -1 in temp1 and 1 in temp2 -> -1 result
>       */
> -    cond1 = tcg_temp_new();
> -    cond2 = tcg_temp_new();
> -    zeroreg = tcg_constant_tl(0);
> -    resultopt1 = tcg_temp_new();
> +    temp1 = tcg_temp_new();
> +    temp2 = tcg_temp_new();
> +    zero = tcg_constant_tl(0);
> +    one = tcg_constant_tl(1);
> +    mone = tcg_constant_tl(-1);
> +    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
>
> -    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)(~0L));
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
> -                        ((target_ulong)1) << (TARGET_LONG_BITS - 1));
> -    tcg_gen_and_tl(cond1, cond1, cond2); /* cond1 = overflow */
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, 0); /* cond2 = div 0 */
> -    /* if div by zero, set source1 to -1, otherwise don't change */
> -    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond2, zeroreg, source1,
> -            resultopt1);
> -    /* if overflow or div by zero, set source2 to 1, else don't change */
> -    tcg_gen_or_tl(cond1, cond1, cond2);
> -    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
> -            resultopt1);
> -    tcg_gen_div_tl(ret, source1, source2);
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
> +    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
> +    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
>
> -    tcg_temp_free(cond1);
> -    tcg_temp_free(cond2);
> -    tcg_temp_free(resultopt1);
> +    /* if div by zero, set temp1 to -1, else source1. */
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1);
> +
> +    /* if overflow or div by zero, set temp2 to 1, else source2 */
> +    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);
> +
> +    tcg_gen_div_tl(ret, temp1, temp2);
> +
> +    tcg_temp_free(temp1);
> +    tcg_temp_free(temp2);
>  }
>
>  static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
>  {
> -    TCGv cond1, zeroreg, resultopt1;
> -    cond1 = tcg_temp_new();
> +    TCGv temp1, temp2, zero, one, max;
>
> -    zeroreg = tcg_constant_tl(0);
> -    resultopt1 = tcg_temp_new();
> +    temp1 = tcg_temp_new();
> +    temp2 = tcg_temp_new();
> +    zero = tcg_constant_tl(0);
> +    one = tcg_constant_tl(1);
> +    max = tcg_constant_tl(~0);
>
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
> -    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, source1,
> -            resultopt1);
> -    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
> -            resultopt1);
> -    tcg_gen_divu_tl(ret, source1, source2);
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
> +    tcg_gen_divu_tl(ret, temp1, temp2);
>
> -    tcg_temp_free(cond1);
> -    tcg_temp_free(resultopt1);
> +    tcg_temp_free(temp1);
> +    tcg_temp_free(temp2);
>  }
>
>  static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
>  {
> -    TCGv cond1, cond2, zeroreg, resultopt1;
> +    TCGv temp1, temp2, zero, one, mone, min;
>
> -    cond1 = tcg_temp_new();
> -    cond2 = tcg_temp_new();
> -    zeroreg = tcg_constant_tl(0);
> -    resultopt1 = tcg_temp_new();
> +    temp1 = tcg_temp_new();
> +    temp2 = tcg_temp_new();
> +    zero = tcg_constant_tl(0);
> +    one = tcg_constant_tl(1);
> +    mone = tcg_constant_tl(-1);
> +    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
>
> -    tcg_gen_movi_tl(resultopt1, 1L);
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)-1);
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
> -                        (target_ulong)1 << (TARGET_LONG_BITS - 1));
> -    tcg_gen_and_tl(cond2, cond1, cond2); /* cond1 = overflow */
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0); /* cond2 = div 0 */
> -    /* if overflow or div by zero, set source2 to 1, else don't change */
> -    tcg_gen_or_tl(cond2, cond1, cond2);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond2, zeroreg, source2,
> -            resultopt1);
> -    tcg_gen_rem_tl(resultopt1, source1, source2);
> -    /* if div by zero, just return the original dividend */
> -    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
> -            source1);
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
> +    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
> +    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
>
> -    tcg_temp_free(cond1);
> -    tcg_temp_free(cond2);
> -    tcg_temp_free(resultopt1);
> +    /*
> +     * if overflow or div by zero, set temp2 to 1, else source2
> +     * this automatically takes care of returning the original
> +     * dividend for div by zero.
> +     */
> +    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);

What about the overflow case? The return value should be 0.

> +
> +    tcg_gen_rem_tl(ret, source1, temp2);
> +
> +    tcg_temp_free(temp1);
> +    tcg_temp_free(temp2);
>  }
>
>  static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
>  {
> -    TCGv cond1, zeroreg, resultopt1;
> -    cond1 = tcg_temp_new();
> -    zeroreg = tcg_constant_tl(0);
> -    resultopt1 = tcg_temp_new();
> +    TCGv temp2, zero, one;
>
> -    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
> -            resultopt1);
> -    tcg_gen_remu_tl(resultopt1, source1, source2);
> -    /* if div by zero, just return the original dividend */
> -    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
> -            source1);
> +    temp2 = tcg_temp_new();
> +    zero = tcg_constant_tl(0);
> +    one = tcg_constant_tl(1);
>
> -    tcg_temp_free(cond1);
> -    tcg_temp_free(resultopt1);
> +    /*
> +     * if div by zero, set temp2 to 1, else source2
> +     * this automatically takes care of returning the original dividend.
> +     */
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
> +    tcg_gen_remu_tl(ret, source1, temp2);
> +
> +    tcg_temp_free(temp2);
>  }
>
>  static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)

Regards,
Bin

