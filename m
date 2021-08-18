Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGHkr-00019d-L1
	for mharc-qemu-riscv@gnu.org; Wed, 18 Aug 2021 05:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGHke-00018U-6i; Wed, 18 Aug 2021 05:20:50 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:37385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGHkZ-0004ge-Uq; Wed, 18 Aug 2021 05:20:46 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id r4so3990216ybp.4;
 Wed, 18 Aug 2021 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L1a2mUr+2+vXGNVMSDyiVOqdkopDA4VKv2Hc9wCdceM=;
 b=OTQzRlNsi6cda+Eq2fbPgp3gXmcZ7ZGrAuPakvRKhm6TU5ALPH29D7xBp2+nkq6sTX
 /4eCNGfObMUzxZCB7od9YZNUubT57OrR/BDIab7KtLSmChaAGh0FOhcR7FTIcr7HTNS1
 RpW4y+0YXRGVahN35s3dbUE9E4hw57Alr0Sf7lRgt1zersiceX7KQlvqIuT2ozrrglXc
 UMkt78qm2KCeexnKexWmw4U2tDQu6M1RPKFmdYpJwFL5xOMp+4LcVcCbNW8RSrnJP7pR
 jsX7CTwhs4I2EX055PtREU2CrthPhi/ph5WUJ9CfkDlmfijrrSRuruP2DmZaSMZKxYl1
 PrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L1a2mUr+2+vXGNVMSDyiVOqdkopDA4VKv2Hc9wCdceM=;
 b=OdkdVz/ghKBpDQ99SlkiDUakwgm2wMvjfkFdONsvMM4w1AaAeyX48+SnAIefXWbDqj
 PLlIEENmoX+qZgSnwTXAXQqC5ANR4Uy2bsGUa8lF5NAkXu2lZUU1PtXlBfvxvIKLggZK
 dy/rPomzJcOPglkmSgNbazjXGT+eQfbWul4cwvMpU5eIW0Egh+6KfXNGDqYF+cVLBy+H
 dYHtYAmC7spBQT/vesSuPtvwiHYIvJzfEed93eoV6umtzLSZHOEbZh0nGeMdRIXOoAOl
 xsRaxhz+dyRXPIhSBJgSD0o5R2/cD0Zq0TPqnrzbaL2oZgJpSMDhkFd145ZDOq1Pex2m
 Ulng==
X-Gm-Message-State: AOAM531FvFXA3NcNMEra2NXxhkCEeSsSQuf/j6Sww/UHP/5VsTEvNMus
 KerFANgtURLsDXnkotfeTLvj8x8CqUsT/tLu4bI=
X-Google-Smtp-Source: ABdhPJyyCYuaF2nfhn1HYl3z41njq/g7AO9ezjCdUjs2Svy6lBEplycq7jUOe8tMAa5ulOCG7l7eKsLLc0gw0Wn3uCA=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr10568042ybg.306.1629278442696; 
 Wed, 18 Aug 2021 02:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-3-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-3-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 18 Aug 2021 17:20:31 +0800
Message-ID: <CAEUhbmWJL5Vs73bZRLuR3SxTYSQJzaQj0fLaimmh+8dHa8rbTw@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] target/riscv: Clean up division helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
X-List-Received-Date: Wed, 18 Aug 2021 09:20:54 -0000

On Wed, Aug 18, 2021 at 5:18 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Utilize the condition in the movcond more; this allows some of
> the setcond that were feeding into movcond to be removed.
> Do not write into source1 and source2.  Re-name "condN" to "tempN"
> and use the temporaries for more than holding conditions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c | 137 +++++++++++++++++++--------------------
>  1 file changed, 65 insertions(+), 72 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 20a55c92fb..6ae7e140d0 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -213,106 +213,99 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
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
> +
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);

nits: I would put temp1 before temp2

> +    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
> +    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
>
> -    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)(~0L));
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
> -                        ((target_ulong)1) << (TARGET_LONG_BITS - 1));
> -    tcg_gen_and_tl(cond1, cond1, cond2); /* cond1 = overflow */
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, 0); /* cond2 = div 0 */
>      /* if div by zero, set source1 to -1, otherwise don't change */

%s/source1/temp1

> -    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond2, zeroreg, source1,
> -            resultopt1);
> -    /* if overflow or div by zero, set source2 to 1, else don't change */
> -    tcg_gen_or_tl(cond1, cond1, cond2);
> -    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
> -            resultopt1);
> -    tcg_gen_div_tl(ret, source1, source2);
> +    tcg_gen_movcond_tl(TCG_COND_NE, temp1, source2, zero, source1, mone);
>
> -    tcg_temp_free(cond1);
> -    tcg_temp_free(cond2);
> -    tcg_temp_free(resultopt1);
> +    /* if overflow or div by zero, set source2 to 1, else don't change */

%s/source2/temp2

> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, temp2, zero, source2, one);
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
> +    TCGv temp1, temp2, zero, one, mone;
>
> -    zeroreg = tcg_constant_tl(0);
> -    resultopt1 = tcg_temp_new();
> +    temp1 = tcg_temp_new();
> +    temp2 = tcg_temp_new();
> +    zero = tcg_constant_tl(0);
> +    one = tcg_constant_tl(1);
> +    mone = tcg_constant_tl(-1);

-1 is not a possible return value of divu. This should be ULONG_MAX.

>
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
> -    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, source1,
> -            resultopt1);
> -    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
> -            resultopt1);
> -    tcg_gen_divu_tl(ret, source1, source2);
> +    tcg_gen_movcond_tl(TCG_COND_NE, temp1, source2, zero, source1, mone);

not "mone" here

> +    tcg_gen_movcond_tl(TCG_COND_NE, temp2, source2, zero, source2, one);
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
> +
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
> +    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
> +    tcg_gen_setcondi_tl(TCG_COND_EQ, temp2, source2, 0); /* temp2 = div0 */

Is there any difference here if using zero/setcond instead of
0/setcondi? If not, I would prefer using zero/setcond for consistency.

> +    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
>
> -    tcg_gen_movi_tl(resultopt1, 1L);
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)-1);
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
> -                        (target_ulong)1 << (TARGET_LONG_BITS - 1));
> -    tcg_gen_and_tl(cond2, cond1, cond2); /* cond1 = overflow */
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0); /* cond2 = div 0 */
>      /* if overflow or div by zero, set source2 to 1, else don't change */
> -    tcg_gen_or_tl(cond2, cond1, cond2);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond2, zeroreg, source2,
> -            resultopt1);
> -    tcg_gen_rem_tl(resultopt1, source1, source2);
> -    /* if div by zero, just return the original dividend */
> -    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
> -            source1);
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, temp2, zero, source2, one);
> +    tcg_gen_rem_tl(temp1, temp1, temp2);

This is wrong as temp1 is not the dividend.

>
> -    tcg_temp_free(cond1);
> -    tcg_temp_free(cond2);
> -    tcg_temp_free(resultopt1);
> +    /* if div by zero, just return the original dividend */
> +    tcg_gen_movcond_tl(TCG_COND_NE, ret, source2, zero, temp1, source1);
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
> +
> +    temp2 = tcg_temp_new();
> +    zero = tcg_constant_tl(0);
> +    one = tcg_constant_tl(1);
> +
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, source2, one);

This should be TCG_COND_NE.

> +    tcg_gen_remu_tl(temp2, source1, temp2);
>
> -    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
> -            resultopt1);
> -    tcg_gen_remu_tl(resultopt1, source1, source2);
>      /* if div by zero, just return the original dividend */
> -    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
> -            source1);
> +    tcg_gen_movcond_tl(TCG_COND_NE, ret, source2, zero, temp2, source1);
>
> -    tcg_temp_free(cond1);
> -    tcg_temp_free(resultopt1);
> +    tcg_temp_free(temp2);
>  }
>
>  static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)

Regards,
Bin

