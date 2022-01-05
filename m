Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5E8Y-0000DR-7Y
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 16:48:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5E8Q-0008Su-Qk; Wed, 05 Jan 2022 16:47:55 -0500
Received: from [2607:f8b0:4864:20::d34] (port=35524
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5E8P-0007Xy-CU; Wed, 05 Jan 2022 16:47:54 -0500
Received: by mail-io1-xd34.google.com with SMTP id y70so797736iof.2;
 Wed, 05 Jan 2022 13:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7/GzFftVx1E45hDuy01Z7N4xKMCwq45/2deZ9rvtfNs=;
 b=ZULu8RVHeXdVVyow7p/YnSarVLCJZKPoEGq/Ad8ZmUle/IgMpu3PH1lAIl2qd28sfA
 ysME9+DHXsywKrFR6Huc9WeoslftfRymSOqDPEnjyTd9j+T9xND3Mx9YHW1F+hmHWkRz
 00t5d4Zp4wvsonz9C8AAcbU64VcpFVsH88qfB3VWjvEfltiK8GC9Bfd/sT9QF2Rkl6tP
 VtLLE4T+NyZtsvb6cN9VCWOLngFMUh7GA250jJ/haFRZR1dk+tia+fcpY/Rzb3GO5pNM
 hb4r06JsTfMMKC7BhCEsC7OM3Zp8HyZ+/JklL0VsOF8cA/Z6Dbn6GDb2gejOISICOQqk
 2o7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7/GzFftVx1E45hDuy01Z7N4xKMCwq45/2deZ9rvtfNs=;
 b=Tr9G3xLcYxaB8GeNVk89QboEgiurR07DZg8d/SyxPaYQ9mGORpWloJN0DgaRLyWLaT
 fvwM+Cjd2rC/VKzDge82m86YklCjc52rW+Lv5UKFyF4+clwhHGL4sme/j8+iDP4uoYIm
 dxEU06iMGW5mE36+Igfi4QP4oJzXZB8TPzFmZyHJFg660hs1HCM6Q1DeRxgc9jIPJUES
 Xvy0yL/ssy/dfr71O6/ZozizOpet+Rz/DzxKpUU+3RARy2uo7ceHrfX++9lQphJe/QpW
 Xz8A/wOArasC7HX0x4Hh5T6EJvXtmvLgoCVK/jMXFGpMZbaBACXWcKNVzc2iRkm1HFyA
 nQzw==
X-Gm-Message-State: AOAM5339CrnV9XyprW4qQ1xSppb+Gw4vaDFZkpPz9hxeGr6A8BOfHOb/
 p8iPk9sJCi58+4ryJlHQ+J591d19t6zSMoevMBZzwaY31h905ZpD
X-Google-Smtp-Source: ABdhPJyFFAbJbmG9XqYh6fyc1hmkJjSuof2vh10eSHlw9yNDJuMDhP5x2zW0XgUMR95lIfFBkaYB4ujM/+yx9G4KGQU=
X-Received: by 2002:a05:6638:38d:: with SMTP id
 y13mr24172899jap.318.1641419271943; 
 Wed, 05 Jan 2022 13:47:51 -0800 (PST)
MIME-Version: 1.0
References: <20220105022247.21131-1-frank.chang@sifive.com>
 <20220105022247.21131-4-frank.chang@sifive.com>
In-Reply-To: <20220105022247.21131-4-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 07:47:25 +1000
Message-ID: <CAKmqyKO_rQn9j5zn0K_HSRuC5xb99mxGvzc-P1tnVhWo9iGQ3Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/riscv: rvv-1.0: Call the correct RVF/RVD
 check function for narrowing fp/int type-convert insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 05 Jan 2022 21:48:01 -0000

On Wed, Jan 5, 2022 at 12:24 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> vfncvt.f.xu.w, vfncvt.f.x.w convert double-width integer to single-width
> floating-point. Therefore, should use require_rvf() to check whether
> RVF/RVD is enabled.
>
> vfncvt.f.f.w, vfncvt.rod.f.f.w convert double-width floating-point to
> single-width integer. Therefore, should use require_scale_rvf() to check
> whether RVF/RVD is enabled.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 32 ++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index f1b44ccad2..6c285c958b 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2719,17 +2719,29 @@ GEN_OPFXV_WIDEN_TRANS(vfwcvt_f_x_v)
>  static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
>  {
>      return require_rvv(s) &&
> -           require_rvf(s) &&
> -           (s->sew != MO_64) &&
>             vext_check_isa_ill(s) &&
>             /* OPFV narrowing instructions ignore vs1 check */
>             vext_check_sd(s, a->rd, a->rs2, a->vm);
>  }
>
> -#define GEN_OPFV_NARROW_TRANS(NAME, HELPER, FRM)                   \
> +static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
> +{
> +    return opfv_narrow_check(s, a) &&
> +           require_rvf(s) &&
> +           (s->sew != MO_64);
> +}
> +
> +static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
> +{
> +    return opfv_narrow_check(s, a) &&
> +           require_scale_rvf(s) &&
> +           (s->sew != MO_8);
> +}
> +
> +#define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
>  static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>  {                                                                  \
> -    if (opfv_narrow_check(s, a)) {                                 \
> +    if (CHECK(s, a)) {                                             \
>          if (FRM != RISCV_FRM_DYN) {                                \
>              gen_set_rm(s, RISCV_FRM_DYN);                          \
>          }                                                          \
> @@ -2756,11 +2768,15 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>      return false;                                                  \
>  }
>
> -GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w, vfncvt_f_xu_w, RISCV_FRM_DYN)
> -GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w, vfncvt_f_x_w, RISCV_FRM_DYN)
> -GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w, vfncvt_f_f_w, RISCV_FRM_DYN)
> +GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w, opfxv_narrow_check, vfncvt_f_xu_w,
> +                      RISCV_FRM_DYN)
> +GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w, opfxv_narrow_check, vfncvt_f_x_w,
> +                      RISCV_FRM_DYN)
> +GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w, opffv_narrow_check, vfncvt_f_f_w,
> +                      RISCV_FRM_DYN)
>  /* Reuse the helper function from vfncvt.f.f.w */
> -GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, vfncvt_f_f_w, RISCV_FRM_ROD)
> +GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, opffv_narrow_check, vfncvt_f_f_w,
> +                      RISCV_FRM_ROD)
>
>  static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
>  {
> --
> 2.31.1
>
>

