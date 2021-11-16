Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmm1V-0006FG-5P
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 19:08:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmm1T-0006F7-3P
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 19:08:27 -0500
Received: from [2607:f8b0:4864:20::42d] (port=33309
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmm1R-0005Fm-EG
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 19:08:26 -0500
Received: by mail-pf1-x42d.google.com with SMTP id x5so5779156pfr.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Nov 2021 16:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OJ0dlIGjFzX8DMEcuC5ZUzeZG10LWtM6cRS0Moto1Sg=;
 b=bKMFS1sGAzvNZ4na39fQXqqEv/V1fooSQrxLi36N8ciPLZR5H5imF5g91Rb5OjY8Xl
 fkHrIR7u3koElgS3eD597POHvq3qssNonDefljTHzqle6f0cL/BzyLZi5gpu9CfWwBSt
 /sH3nqrop6R4psHBeDqI2AXpap6M5wiyZC15bduH9E/rzmsfVDgxob/OdksWPFBBl5/B
 FwayX2ziOL4gROMD8seQbcZ6mhIXBOV72tQx/rDvz3xzlLTmGk0/Gm8X9LU813837bM2
 TRoBi9ThbwtfOLZcd6BY0RFygDVgqA0cuEYNyBgl2M9EF9IZzvWJTQjI+FKdZyTUoX1/
 32zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OJ0dlIGjFzX8DMEcuC5ZUzeZG10LWtM6cRS0Moto1Sg=;
 b=XTNRsE1BxklQER3NXvlZl780tW/0fiZHt64yUuPIiGQw84nF9Z145B6fD3D5ufP2Hg
 +qgWNQjeeMAyxwkmOjXWneb5qowIfKRSI1UR8unYEo5agq2G3Ji7SHq5PWIUkubQRrLc
 tMFLNaMRnJLrSsnkj+QDTSvwj2GxSvunVbKaA7cq9D6ev2ikBGHLKXOEXDJYOZe/44sq
 GRIR0G821X+IkbuskJ6+VcCoUUFkggMQ1P6PWlo7+284u3yJzodFn+Aj9Z+/ha6wthy9
 oZanXlpcHJAP6KUJUJZnYWdXs5DdGrOjv97lHtjZdkmDaFld/gBefFnJrpu4Eizs8qi0
 IyGg==
X-Gm-Message-State: AOAM530TtffBzPsJbHusTD5IYMvEoMnxJmh7Hvm9/VAWyialcu1qs/Wk
 JeZWI6KKt1XOpbtOqhedI0CcH1adsqgIklrkWUhbb29AHkM=
X-Google-Smtp-Source: ABdhPJyxIzTipZcih5da7SHeyu882jXxONRa2LC+9TpjRCqdWAuOpXWI9g/pgPSv7OM3m+1TPwJlIzmc3Tm28lsdISM=
X-Received: by 2002:a6b:f212:: with SMTP id q18mr1912866ioh.16.1637020881442; 
 Mon, 15 Nov 2021 16:01:21 -0800 (PST)
MIME-Version: 1.0
References: <20211029085922.255197-1-frank.chang@sifive.com>
 <20211029085922.255197-75-frank.chang@sifive.com>
In-Reply-To: <20211029085922.255197-75-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Nov 2021 10:00:54 +1000
Message-ID: <CAKmqyKN+5XK5LHbRSNnfXjGQ32zee68qzze0juYwGpWNv6vUSQ@mail.gmail.com>
Subject: Re: [PATCH v9 74/76] target/riscv: rvv-1.0: add vector unit-stride
 mask load/store insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Nov 2021 00:08:27 -0000

On Fri, Oct 29, 2021 at 8:38 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  2 ++
>  target/riscv/insn32.decode              |  4 +++
>  target/riscv/insn_trans/trans_rvv.c.inc | 40 +++++++++++++++++++++++++
>  target/riscv/vector_helper.c            | 21 +++++++++++++
>  4 files changed, 67 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index ab283d12b79..6e58343af35 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -129,6 +129,8 @@ DEF_HELPER_5(vse8_v_mask, void, ptr, ptr, tl, env, i32)
>  DEF_HELPER_5(vse16_v_mask, void, ptr, ptr, tl, env, i32)
>  DEF_HELPER_5(vse32_v_mask, void, ptr, ptr, tl, env, i32)
>  DEF_HELPER_5(vse64_v_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vlm_v, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vsm_v, void, ptr, ptr, tl, env, i32)
>  DEF_HELPER_6(vlse8_v, void, ptr, ptr, tl, tl, env, i32)
>  DEF_HELPER_6(vlse16_v, void, ptr, ptr, tl, tl, env, i32)
>  DEF_HELPER_6(vlse32_v, void, ptr, ptr, tl, tl, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 3b6524bad91..1a4a2871464 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -305,6 +305,10 @@ vse16_v    ... 000 . 00000 ..... 101 ..... 0100111 @r2_nfvm
>  vse32_v    ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
>  vse64_v    ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
>
> +# Vector unit-stride mask load/store insns.
> +vlm_v      000 000 1 01011 ..... 000 ..... 0000111 @r2
> +vsm_v      000 000 1 01011 ..... 000 ..... 0100111 @r2
> +
>  # Vector strided insns.
>  vlse8_v     ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
>  vlse16_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index e540b5d33c2..97b1dc10265 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -697,6 +697,46 @@ GEN_VEXT_TRANS(vse16_v, MO_16, r2nfvm, st_us_op, st_us_check)
>  GEN_VEXT_TRANS(vse32_v, MO_32, r2nfvm, st_us_op, st_us_check)
>  GEN_VEXT_TRANS(vse64_v, MO_64, r2nfvm, st_us_op, st_us_check)
>
> +/*
> + *** unit stride mask load and store
> + */
> +static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
> +{
> +    uint32_t data = 0;
> +    gen_helper_ldst_us *fn = gen_helper_vlm_v;
> +
> +    /* EMUL = 1, NFIELDS = 1 */
> +    data = FIELD_DP32(data, VDATA, LMUL, 0);
> +    data = FIELD_DP32(data, VDATA, NF, 1);
> +    return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
> +}
> +
> +static bool ld_us_mask_check(DisasContext *s, arg_vlm_v *a, uint8_t eew)
> +{
> +    /* EMUL = 1, NFIELDS = 1 */
> +    return require_rvv(s) && vext_check_isa_ill(s);
> +}
> +
> +static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, uint8_t eew)
> +{
> +    uint32_t data = 0;
> +    gen_helper_ldst_us *fn = gen_helper_vsm_v;
> +
> +    /* EMUL = 1, NFIELDS = 1 */
> +    data = FIELD_DP32(data, VDATA, LMUL, 0);
> +    data = FIELD_DP32(data, VDATA, NF, 1);
> +    return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
> +}
> +
> +static bool st_us_mask_check(DisasContext *s, arg_vsm_v *a, uint8_t eew)
> +{
> +    /* EMUL = 1, NFIELDS = 1 */
> +    return require_rvv(s) && vext_check_isa_ill(s);
> +}
> +
> +GEN_VEXT_TRANS(vlm_v, MO_8, vlm_v, ld_us_mask_op, ld_us_mask_check)
> +GEN_VEXT_TRANS(vsm_v, MO_8, vsm_v, st_us_mask_op, st_us_mask_check)
> +
>  /*
>   *** stride load and store
>   */
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 83373ca6fc6..4c1a1310e63 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -345,6 +345,27 @@ GEN_VEXT_ST_US(vse16_v, int16_t, ste_h)
>  GEN_VEXT_ST_US(vse32_v, int32_t, ste_w)
>  GEN_VEXT_ST_US(vse64_v, int64_t, ste_d)
>
> +/*
> + *** unit stride mask load and store, EEW = 1
> + */
> +void HELPER(vlm_v)(void *vd, void *v0, target_ulong base,
> +                    CPURISCVState *env, uint32_t desc)
> +{
> +    /* evl = ceil(vl/8) */
> +    uint8_t evl = (env->vl + 7) >> 3;
> +    vext_ldst_us(vd, base, env, desc, lde_b,
> +                 0, evl, GETPC(), MMU_DATA_LOAD);
> +}
> +
> +void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
> +                    CPURISCVState *env, uint32_t desc)
> +{
> +    /* evl = ceil(vl/8) */
> +    uint8_t evl = (env->vl + 7) >> 3;
> +    vext_ldst_us(vd, base, env, desc, ste_b,
> +                 0, evl, GETPC(), MMU_DATA_STORE);
> +}
> +
>  /*
>   *** index: access vector element from indexed memory
>   */
> --
> 2.25.1
>
>

