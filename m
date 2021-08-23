Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mI39l-0006eO-6w
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 02:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI39j-0006e7-8u; Mon, 23 Aug 2021 02:09:59 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:47049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI39h-00080g-A8; Mon, 23 Aug 2021 02:09:58 -0400
Received: by mail-il1-x12a.google.com with SMTP id r6so15982907ilt.13;
 Sun, 22 Aug 2021 23:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Ck1TLehiZ2ner1oTgbLzFKr6ASqq0vY6Vw7OQ+7BBg=;
 b=NrexcKzSQsmDaCuNaEOBAPDuwnMNyvGS1FXxOM2mpaOiR3D7XFFuXwGL/csGPRlB/v
 mCJsORKeK2PGBy4SGl41qWQ/39Tulotk9Y9OfDyTd32R0HlFt/H4Wk5ujk02gXGtI23A
 YWIeDVdp6KxZKug/b2Abe+II2XXVJ3zHRJMSpUnAxMOzDTQUlNxEBF3Fhv6oKfR2klkU
 l9NzvoU172K6nIPNf8QkSVxbJ9qKMhmCvRxbCcpq6HGfXn7AXwtsejcMcVWSqLK+8Vej
 Zim10KxdAW43klm28Zo3z7Nxrdtwd275NNLz4YWJZT7KE121q52M+vCMb9CfYBBbcrqm
 WJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Ck1TLehiZ2ner1oTgbLzFKr6ASqq0vY6Vw7OQ+7BBg=;
 b=oAQVRFqJdV/AcGZ431tDZUznAtRK2otuKGLzzc6tM0GuQHrGExQrWuWdpgAZUy2evO
 kc//zsmxxysZdf+bXWu+g1T0Ij6RpyZs2yc5NeVrndIIc5hroIRJall7zzxNLsOr1Jgd
 NpTMkqE3bv8uZ72PjN9ZuNXuju8l16Al+z5qA1RGsrSRwDXv0CKQ9rdrMI/cTP7/nQD9
 9jSdNTGq2Kba/ltybERGS8m3M4r6Ej8lrKJqLhrYJdkKXabZfgwyvHbaq2i9WaZT80kU
 HUQwjusNWULfrx+P0i5LRxgs89UMv24gUb7KuOUbybSPwoiMMSj0oPPjO8NJraTx4ttU
 5zag==
X-Gm-Message-State: AOAM530eGiVjES1G6f6gB0S8i4FW8N58Exp7vc9NFjhmlrxPoQQo9BDA
 rHM272kjIKqthd0NLmXYvbevx21hg1u5f3JACbA=
X-Google-Smtp-Source: ABdhPJxZmfH4qthkipi/5Yb2OTg3OehCJiCXOGmTMsGIeBIRUpecckClV4WOnzrtZzsAOSkshB8sYf4JvrVpd1JWNUE=
X-Received: by 2002:a92:8707:: with SMTP id m7mr21907047ild.177.1629698995661; 
 Sun, 22 Aug 2021 23:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210820174257.548286-1-richard.henderson@linaro.org>
 <20210820174257.548286-4-richard.henderson@linaro.org>
In-Reply-To: <20210820174257.548286-4-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Aug 2021 16:09:29 +1000
Message-ID: <CAKmqyKOVtPZDuvQFy=PCJeJCitWuHE5yhbSUciz4gJS-_jAS1Q@mail.gmail.com>
Subject: Re: [PATCH v4 03/21] target/riscv: Clean up division helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 06:09:59 -0000

On Sat, Aug 21, 2021 at 3:48 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Utilize the condition in the movcond more; this allows some of
> the setcond that were feeding into movcond to be removed.
> Do not write into source1 and source2.  Re-name "condN" to "tempN"
> and use the temporaries for more than holding conditions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 160 ++++++++++++++++++++-------------------
>  1 file changed, 84 insertions(+), 76 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 20a55c92fb..147b9c2f68 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -213,106 +213,114 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
>
>  static void gen_div(TCGv ret, TCGv source1, TCGv source2)
>  {
> -    TCGv cond1, cond2, zeroreg, resultopt1;
> +    TCGv temp1, temp2, zero, one, mone, min;
> +
> +    temp1 = tcg_temp_new();
> +    temp2 = tcg_temp_new();
> +    zero = tcg_constant_tl(0);
> +    one = tcg_constant_tl(1);
> +    mone = tcg_constant_tl(-1);
> +    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
> +
>      /*
> -     * Handle by altering args to tcg_gen_div to produce req'd results:
> -     * For overflow: want source1 in source1 and 1 in source2
> -     * For div by zero: want -1 in source1 and 1 in source2 -> -1 result
> +     * If overflow, set temp2 to 1, else source2.
> +     * This produces the required result of min.
>       */
> -    cond1 = tcg_temp_new();
> -    cond2 = tcg_temp_new();
> -    zeroreg = tcg_constant_tl(0);
> -    resultopt1 = tcg_temp_new();
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
> +    tcg_gen_and_tl(temp1, temp1, temp2);
> +    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp1, zero, one, source2);
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
> +    /*
> +     * If div by zero, set temp1 to -1 and temp2 to 1 to
> +     * produce the required result of -1.
> +     */
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1);
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, temp2);
>
> -    tcg_temp_free(cond1);
> -    tcg_temp_free(cond2);
> -    tcg_temp_free(resultopt1);
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
> +    /*
> +     * If div by zero, set temp1 to max and temp2 to 1 to
> +     * produce the required result of max.
> +     */
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
> +    /*
> +     * If overflow, set temp1 to 0, else source1.
> +     * This avoids a possible host trap, and produces the required result of 0.
> +     */
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
> +    tcg_gen_and_tl(temp1, temp1, temp2);
> +    tcg_gen_movcond_tl(TCG_COND_NE, temp1, temp1, zero, zero, source1);
>
> -    tcg_temp_free(cond1);
> -    tcg_temp_free(cond2);
> -    tcg_temp_free(resultopt1);
> +    /*
> +     * If div by zero, set temp2 to 1, else source2.
> +     * This avoids a possible host trap, but produces an incorrect result.
> +     */
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
> +
> +    tcg_gen_rem_tl(temp1, temp1, temp2);
> +
> +    /* If div by zero, the required result is the original dividend. */
> +    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp1);
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
> +    TCGv temp, zero, one;
>
> -    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
> -            resultopt1);
> -    tcg_gen_remu_tl(resultopt1, source1, source2);
> -    /* if div by zero, just return the original dividend */
> -    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
> -            source1);
> +    temp = tcg_temp_new();
> +    zero = tcg_constant_tl(0);
> +    one = tcg_constant_tl(1);
>
> -    tcg_temp_free(cond1);
> -    tcg_temp_free(resultopt1);
> +    /*
> +     * If div by zero, set temp to 1, else source2.
> +     * This avoids a possible host trap, but produces an incorrect result.
> +     */
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp, source2, zero, one, source2);
> +
> +    tcg_gen_remu_tl(temp, source1, temp);
> +
> +    /* If div by zero, the required result is the original dividend. */
> +    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp);
> +
> +    tcg_temp_free(temp);
>  }
>
>  static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
> --
> 2.25.1
>
>

