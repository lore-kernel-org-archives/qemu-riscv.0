Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcKV0-0002Tl-Gm
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 00:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcKUy-0002Rf-BT; Mon, 18 Oct 2021 00:43:44 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:37849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcKUv-0005Yj-AY; Mon, 18 Oct 2021 00:43:44 -0400
Received: by mail-il1-x130.google.com with SMTP id x1so13547913ilv.4;
 Sun, 17 Oct 2021 21:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFaUCux9ky+MCdYJbfRWm8V+DHebk5QtThXY71J6FAw=;
 b=VhdHFAwmwmPiK838UhvsPMfQXB4cFEV52a3oNW63u6XDMEiZXJCDjUv1poh7ddlaU3
 RzVWShX3oeIsvWWTpF4dwzK6IV3C/edoeadHaHm8oKw+Ev4yceSWENLpzAymukvPbQI0
 LUDH3ouls0TzDtHp+sNjuV0K0Bi96fKTYz4RMudBayIKJibXoejbkyWkVsur5eLuK+TA
 YJj0NGnQoLstBlX+XxzFOE0bAWGo8zYhT5NXKpTPVp2I6VuYzU+EiJ41DdEi7TmM9Meo
 b36Wuu0YZRUD3xzD+gHXAOhQw1ojIPA2TWNqZt1s8Il/Qcn4rxj4wuQrApdWh5toxL9C
 nekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uFaUCux9ky+MCdYJbfRWm8V+DHebk5QtThXY71J6FAw=;
 b=cUqX9hHeKlkC3e7mm4YOnbBRuKr+nlyQaWqoNwjGvEIO0wpTmHgNNvtstOz42fNWmm
 HPJ1/UBIzwdRh3DZ9cLyR0GuApYvFo+AHzcLDCovkiHAawW2HeYljtWMM7NWj28R5KTe
 CmHXQGfyDzvawGJ+frTnXZ/mW2Ng9vUHf3Ozp1MzQwfv4Ke9DmfxbAQ79pSHMO7GDUNo
 aubwSboYqpYILtiGcTXzTvsN/SEVAuCb8qM3JxUJbhORwfK7/WecIyo176xlsaIB/mBj
 ue600GffzmKjNJ6zgXdv9kUdHC3Zf7PickDJ0tRChmWMJKhkBinD0kURYwusWsGKgJEj
 hMMQ==
X-Gm-Message-State: AOAM533j886RGycGkK8WnWxY1O5GFIlCqPYX9k0dXkdyT7lZYo+j0dUQ
 kBUunmFW5ULolL754XZm71tg1d4Aw550oaGM7yw=
X-Google-Smtp-Source: ABdhPJyQ2+YO7oA3fSAl7oFOfiVMpX0gq7Ke3V9xgQETn+DZMlPreqPKvX5xrUrBNzRL7+6tU179AJe6prz8LsulORE=
X-Received: by 2002:a05:6e02:1885:: with SMTP id
 o5mr12635507ilu.221.1634532216672; 
 Sun, 17 Oct 2021 21:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
 <20211016171412.3163784-14-richard.henderson@linaro.org>
In-Reply-To: <20211016171412.3163784-14-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 14:43:10 +1000
Message-ID: <CAKmqyKMOLv0xi43qbtR6dvRFSdg-c_dS4bnDsSnXSe_NA4-BjQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] target/riscv: Use gen_shift*_per_ol for RVB, RVI
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 18 Oct 2021 04:43:44 -0000

On Sun, Oct 17, 2021 at 3:28 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Most shift instructions require a separate implementation
> for RV32 when TARGET_LONG_BITS == 64.
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                | 31 +++++++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 92 ++++++++++++++-----------
>  target/riscv/insn_trans/trans_rvi.c.inc | 26 +++----
>  3 files changed, 97 insertions(+), 52 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 7286791c0f..0b3da060fd 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -463,6 +463,22 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
>      return true;
>  }
>
> +static bool gen_shift_imm_fn_per_ol(DisasContext *ctx, arg_shift *a,
> +                                    DisasExtend ext,
> +                                    void (*f_tl)(TCGv, TCGv, target_long),
> +                                    void (*f_32)(TCGv, TCGv, target_long))
> +{
> +    int olen = get_olen(ctx);
> +    if (olen != TARGET_LONG_BITS) {
> +        if (olen == 32) {
> +            f_tl = f_32;
> +        } else {
> +            g_assert_not_reached();
> +        }
> +    }
> +    return gen_shift_imm_fn(ctx, a, ext, f_tl);
> +}
> +
>  static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift *a, DisasExtend ext,
>                               void (*func)(TCGv, TCGv, TCGv))
>  {
> @@ -499,6 +515,21 @@ static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
>      return true;
>  }
>
> +static bool gen_shift_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
> +                             void (*f_tl)(TCGv, TCGv, TCGv),
> +                             void (*f_32)(TCGv, TCGv, TCGv))
> +{
> +    int olen = get_olen(ctx);
> +    if (olen != TARGET_LONG_BITS) {
> +        if (olen == 32) {
> +            f_tl = f_32;
> +        } else {
> +            g_assert_not_reached();
> +        }
> +    }
> +    return gen_shift(ctx, a, ext, f_tl);
> +}
> +
>  static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
>                        void (*func)(TCGv, TCGv))
>  {
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 0c2120428d..cc39e6033b 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -227,22 +227,70 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
>      return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
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
>  static bool trans_ror(DisasContext *ctx, arg_ror *a)
>  {
>      REQUIRE_ZBB(ctx);
> -    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotr_tl);
> +    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw);
> +}
> +
> +static void gen_roriw(TCGv ret, TCGv arg1, target_long shamt)
> +{
> +    TCGv_i32 t1 = tcg_temp_new_i32();
> +
> +    tcg_gen_trunc_tl_i32(t1, arg1);
> +    tcg_gen_rotri_i32(t1, t1, shamt);
> +    tcg_gen_ext_i32_tl(ret, t1);
> +
> +    tcg_temp_free_i32(t1);
>  }
>
>  static bool trans_rori(DisasContext *ctx, arg_rori *a)
>  {
>      REQUIRE_ZBB(ctx);
> -    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_rotri_tl);
> +    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
> +                                   tcg_gen_rotri_tl, gen_roriw);
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
>  }
>
>  static bool trans_rol(DisasContext *ctx, arg_rol *a)
>  {
>      REQUIRE_ZBB(ctx);
> -    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
> +    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw);
>  }
>
>  static void gen_rev8_32(TCGv ret, TCGv src1)
> @@ -349,24 +397,6 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
>      return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
>  }
>
> -static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv_i32 t1 = tcg_temp_new_i32();
> -    TCGv_i32 t2 = tcg_temp_new_i32();
> -
> -    /* truncate to 32-bits */
> -    tcg_gen_trunc_tl_i32(t1, arg1);
> -    tcg_gen_trunc_tl_i32(t2, arg2);
> -
> -    tcg_gen_rotr_i32(t1, t1, t2);
> -
> -    /* sign-extend 64-bits */
> -    tcg_gen_ext_i32_tl(ret, t1);
> -
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
> -}
> -
>  static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -380,25 +410,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
>      REQUIRE_64BIT(ctx);
>      REQUIRE_ZBB(ctx);
>      ctx->ol = MXL_RV32;
> -    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_rorw);
> -}
> -
> -static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv_i32 t1 = tcg_temp_new_i32();
> -    TCGv_i32 t2 = tcg_temp_new_i32();
> -
> -    /* truncate to 32-bits */
> -    tcg_gen_trunc_tl_i32(t1, arg1);
> -    tcg_gen_trunc_tl_i32(t2, arg2);
> -
> -    tcg_gen_rotl_i32(t1, t1, t2);
> -
> -    /* sign-extend 64-bits */
> -    tcg_gen_ext_i32_tl(ret, t1);
> -
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
> +    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw);
>  }
>
>  static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index c0a46d823f..b0fdec97de 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -270,14 +270,26 @@ static bool trans_slli(DisasContext *ctx, arg_slli *a)
>      return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
>  }
>
> +static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
> +{
> +    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
> +}
> +
>  static bool trans_srli(DisasContext *ctx, arg_srli *a)
>  {
> -    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
> +    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
> +                                   tcg_gen_shri_tl, gen_srliw);
> +}
> +
> +static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
> +{
> +    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
>  }
>
>  static bool trans_srai(DisasContext *ctx, arg_srai *a)
>  {
> -    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
> +    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
> +                                   tcg_gen_sari_tl, gen_sraiw);
>  }
>
>  static bool trans_add(DisasContext *ctx, arg_add *a)
> @@ -344,11 +356,6 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
>      return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
>  }
>
> -static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
> -{
> -    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
> -}
> -
>  static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -356,11 +363,6 @@ static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
>      return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
>  }
>
> -static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
> -{
> -    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
> -}
> -
>  static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
>  {
>      REQUIRE_64BIT(ctx);
> --
> 2.25.1
>
>

