Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljcqd-000691-JY
	for mharc-qemu-riscv@gnu.org; Thu, 20 May 2021 03:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ljcqb-00068m-S5; Thu, 20 May 2021 03:11:57 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:42790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ljcqa-0000Yn-0c; Thu, 20 May 2021 03:11:57 -0400
Received: by mail-il1-x12e.google.com with SMTP id h11so14353385ili.9;
 Thu, 20 May 2021 00:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=afqw3gTPjM0eicywt5r4+lTfaxQJ1947EB0nL+lVzCo=;
 b=nagdgAhSylQ5qfwwUcSIJVRUkJLE3565KmhkwUnnihCqubRkEV+0dQZRHbq8AIuqDw
 ZexjZ9Rr5XDoRId+Ii9kNFLNWILn4wMs6YumYpLJkV3mUhsGycyr/T2F+eXK/MN6Kblt
 l8ju89AVHHUJ0nBa0xDqxwRWO57WXJ0ffcBsSgOXL9pRCpBnlnxWKclKBT7aU/ZSBxfQ
 7y6aBzCcf/ehS3AR7ECsL/OgX5Ljp4hKcJqvOmUDZVtAyUooUjhWmQVmuSt1Yse8bzlO
 XZCpTv0N0Yeh3HyPGj79jOAdswB0n/u7EDLGf3bfFe6tmazqsthpFQ5kXAZP3mJ4jNmb
 a9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=afqw3gTPjM0eicywt5r4+lTfaxQJ1947EB0nL+lVzCo=;
 b=KyHlD91iqz3ekN13BfeBKWLO3nnPVvtMu+ZUUdqVmBOyKw+PqbCdu4oZQdh2rBQybG
 cMLq/MOOuHgHn1HM0udw67IdT2SEUm1+/EeuV9RpkAMgc0/6YuTI3rAzvX1jNK1HJMJ8
 1YlvBRCh9ZGjuqMXtmenTvsTIznH3Lj26zrIZI+TXTWAXWyYbnMNVnd96PFzAFRsLodB
 aPAJxcl/9PdnfcluPmOgajuhCEngeDsgxgolV8IwdaJqShR6+s1A//TU9WP3H9cHARSA
 Rs451SwG0ISh1FV2Yxpqt/DIYLhdGpjJZp5l1ccJQdzKNrzmRklKxLxRP6I0DQ6+iVyP
 sqWA==
X-Gm-Message-State: AOAM5337LnwGJaVFlHTASbjFVw7SkwZGAOIIYAa2SePocxZgvJ8i1juR
 SPxj7mwayPPhmXEKBJ5C5YaAWXHhb3Kb98YgCfg=
X-Google-Smtp-Source: ABdhPJyKArrX7Tj+JyAY45G5eWwZ/PHUudW/zHzczd2nBwpbWsy/VLdlvUMOmdQijoJYpUtMIpsDfg+lhJGr3NhVAcQ=
X-Received: by 2002:a05:6e02:4af:: with SMTP id
 e15mr3331972ils.131.1621494714116; 
 Thu, 20 May 2021 00:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210505160620.15723-1-frank.chang@sifive.com>
 <20210505160620.15723-12-frank.chang@sifive.com>
In-Reply-To: <20210505160620.15723-12-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 May 2021 17:11:27 +1000
Message-ID: <CAKmqyKPh-woV8FCudo9W6AvX6nOqjPVSfR1ts0Z9w0a-ZqQV5A@mail.gmail.com>
Subject: Re: [PATCH v6 11/17] target/riscv: rvb: rotate (left/right)
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
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
X-List-Received-Date: Thu, 20 May 2021 07:11:58 -0000

On Thu, May 6, 2021 at 2:17 AM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |  6 ++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 39 +++++++++++++++++++++++++
>  target/riscv/translate.c                | 36 +++++++++++++++++++++++
>  3 files changed, 81 insertions(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 6bc9bbae9e0..71a9a182c01 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -682,6 +682,8 @@ binv       0110100 .......... 001 ..... 0110011 @r
>  bext       0100100 .......... 101 ..... 0110011 @r
>  slo        0010000 .......... 001 ..... 0110011 @r
>  sro        0010000 .......... 101 ..... 0110011 @r
> +ror        0110000 .......... 101 ..... 0110011 @r
> +rol        0110000 .......... 001 ..... 0110011 @r
>
>  bseti      00101. ........... 001 ..... 0010011 @sh
>  bclri      01001. ........... 001 ..... 0010011 @sh
> @@ -689,6 +691,7 @@ binvi      01101. ........... 001 ..... 0010011 @sh
>  bexti      01001. ........... 101 ..... 0010011 @sh
>  sloi       00100. ........... 001 ..... 0010011 @sh
>  sroi       00100. ........... 101 ..... 0010011 @sh
> +rori       01100. ........... 101 ..... 0010011 @sh
>
>  # *** RV64B Standard Extension (in addition to RV32B) ***
>  clzw       0110000 00000 ..... 001 ..... 0011011 @r2
> @@ -703,9 +706,12 @@ binvw      0110100 .......... 001 ..... 0111011 @r
>  bextw      0100100 .......... 101 ..... 0111011 @r
>  slow       0010000 .......... 001 ..... 0111011 @r
>  srow       0010000 .......... 101 ..... 0111011 @r
> +rorw       0110000 .......... 101 ..... 0111011 @r
> +rolw       0110000 .......... 001 ..... 0111011 @r
>
>  bsetiw     0010100 .......... 001 ..... 0011011 @sh5
>  bclriw     0100100 .......... 001 ..... 0011011 @sh5
>  binviw     0110100 .......... 001 ..... 0011011 @sh5
>  sloiw      0010000 .......... 001 ..... 0011011 @sh5
>  sroiw      0010000 .......... 101 ..... 0011011 @sh5
> +roriw      0110000 .......... 101 ..... 0011011 @sh5
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 28640322c43..429738db155 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -179,6 +179,24 @@ static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
>      return gen_shifti(ctx, a, gen_sro);
>  }
>
> +static bool trans_ror(DisasContext *ctx, arg_ror *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shift(ctx, a, tcg_gen_rotr_tl);
> +}
> +
> +static bool trans_rori(DisasContext *ctx, arg_rori *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shifti(ctx, a, tcg_gen_rotr_tl);
> +}
> +
> +static bool trans_rol(DisasContext *ctx, arg_rol *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shift(ctx, a, tcg_gen_rotl_tl);
> +}
> +
>  static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -290,3 +308,24 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
>      REQUIRE_EXT(ctx, RVB);
>      return gen_shiftiw(ctx, a, gen_sro);
>  }
> +
> +static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftw(ctx, a, gen_rorw);
> +}
> +
> +static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftiw(ctx, a, gen_rorw);
> +}
> +
> +static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftw(ctx, a, gen_rolw);
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 088cf9f7678..c09b93f1b8a 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -663,6 +663,42 @@ static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
>      tcg_temp_free(t);
>  }
>
> +static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv_i32 t1 = tcg_temp_new_i32();
> +    TCGv_i32 t2 = tcg_temp_new_i32();
> +
> +    /* truncate to 32-bits */
> +    tcg_gen_trunc_tl_i32(t1, arg1);
> +    tcg_gen_trunc_tl_i32(t2, arg2);
> +
> +    tcg_gen_rotr_i32(t1, t1, t2);
> +
> +    /* sign-extend 64-bits */
> +    tcg_gen_ext_i32_tl(ret, t1);
> +
> +    tcg_temp_free_i32(t1);
> +    tcg_temp_free_i32(t2);
> +}
> +
> +static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv_i32 t1 = tcg_temp_new_i32();
> +    TCGv_i32 t2 = tcg_temp_new_i32();
> +
> +    /* truncate to 32-bits */
> +    tcg_gen_trunc_tl_i32(t1, arg1);
> +    tcg_gen_trunc_tl_i32(t2, arg2);
> +
> +    tcg_gen_rotl_i32(t1, t1, t2);
> +
> +    /* sign-extend 64-bits */
> +    tcg_gen_ext_i32_tl(ret, t1);
> +
> +    tcg_temp_free_i32(t1);
> +    tcg_temp_free_i32(t2);
> +}
> +
>  static bool gen_arith(DisasContext *ctx, arg_r *a,
>                        void(*func)(TCGv, TCGv, TCGv))
>  {
> --
> 2.17.1
>
>

