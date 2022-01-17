Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9aw6-00086e-6C
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:57:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aw1-00083S-Dl; Mon, 17 Jan 2022 17:57:10 -0500
Received: from [2607:f8b0:4864:20::d36] (port=33455
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9avz-0001bO-Ta; Mon, 17 Jan 2022 17:57:09 -0500
Received: by mail-io1-xd36.google.com with SMTP id f24so17468587ioc.0;
 Mon, 17 Jan 2022 14:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IA9Zrbi2ikI294mw6l+zoFib/I2aTGvGOV0imdp81hI=;
 b=i7Zp3c6PHr39PAxM6h2nGXyKcsLpQmBhmUzYFJvrdQc339QmxKeuUL53f6qF4eykcr
 aBUNDXt9lWm0JZWx8KXG4gzQUynJkW07MtzeaLX/Nyki3dOtLO0xq2qs+C7EjhBsv1ni
 /7AyxHRHrQ/fI0ZeybqDxBBBpUap0j2wCLvwF5MMFWmoGQqiNfo8O6wA4KzWCwfB4r5i
 7qNnFn5oS9mVF8/By3vJRHbbjSLCnxw6uzbL/bCE0SN23Ff+FKED5memakRaiRYGBAit
 Ax9LAwJspWpAxnVf8nI+Ay7h7g2WhNF6LOCZhsyf7GDh2ny6Cc8nto9b3McxEvlBN44u
 0PXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IA9Zrbi2ikI294mw6l+zoFib/I2aTGvGOV0imdp81hI=;
 b=CZfbCi6JW1aono/sE+H7fnPldWdhqOr1//voFVU9Hr/OSNwTTR7WdgZtLxATcGDfML
 xOTHE2+5Wtnj4/GGN2nELC1y2g5z5nEXvlnxLw7SMP7LUNGVBn9vl56RXJhT5DDnY5Bo
 oKHtoHNr1DKo8RwMCTG8FaVVdHIL8riDItNm+6fAIwp3+gctNnuviUowkDLzokOyAQwB
 CiGZWw+NS5NcEoVrnJHhvnsHgqZrRLD1vE51GxZw2/uIMO4SuIsxq4gZnzcVKj6J1VOT
 Dv5m/hSxYRRTKYdRp3KvuC8p9vDO8rcrOmhB01aEgnMTy9svouF8XVfpI7D3kjBrcXGh
 VlVw==
X-Gm-Message-State: AOAM533V5SupRPsfwzW1JoUldoaOqrGyDRVTYTCGOSWAS1sM9sU+Mh7s
 2YFt4CXclyK5zd9qDUsLuJhl6Ku0jpmx1Fu/u7A=
X-Google-Smtp-Source: ABdhPJzQ4OqO3Gg17c/cBkmQUIjAEGULOyF6iyGyj/GlZa20jo6H1DVw6FNEpuuPn/kT3JjAJp7s6z4yV05K950UPsk=
X-Received: by 2002:a02:5d84:: with SMTP id w126mr9735176jaa.169.1642460226763; 
 Mon, 17 Jan 2022 14:57:06 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-16-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-16-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:56:40 +1000
Message-ID: <CAKmqyKOUfmtN2Y9v-N0xNTjCZbFfu8bD70S9G1qMTYrg2TdnZg@mail.gmail.com>
Subject: Re: [PATCH 15/17] target/riscv: rvv-1.0: Add Zve32f support for
 widening type-convert insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Mon, 17 Jan 2022 22:57:11 -0000

On Wed, Dec 29, 2021 at 12:50 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Vector widening conversion instructions are provided to and from all
> supported integer EEWs for Zve32f extension.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index c3f4dabf36..da0e501f85 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -77,6 +77,17 @@ static bool require_zve32f(DisasContext *s)
>      return s->ext_zve32f ? s->sew <= MO_32 : true;
>  }
>
> +static bool require_scale_zve32f(DisasContext *s)
> +{
> +    /* RVV + Zve32f = RVV. */
> +    if (has_ext(s, RVV)) {
> +        return true;
> +    }
> +
> +    /* Zve32f doesn't support FP64. (Section 18.2) */
> +    return s->ext_zve64f ? s->sew <= MO_16 : true;
> +}
> +
>  static bool require_zve64f(DisasContext *s)
>  {
>      /* RVV + Zve64f = RVV. */
> @@ -2356,6 +2367,7 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
>             (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
> +           require_scale_zve32f(s) &&
>             require_scale_zve64f(s);
>  }
>
> @@ -2396,6 +2408,7 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
>             (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_ds(s, a->rd, a->rs2, a->vm) &&
> +           require_scale_zve32f(s) &&
>             require_scale_zve64f(s);
>  }
>
> @@ -2427,6 +2440,7 @@ static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
>             (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm) &&
> +           require_scale_zve32f(s) &&
>             require_scale_zve64f(s);
>  }
>
> @@ -2467,6 +2481,7 @@ static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
>             (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_dd(s, a->rd, a->rs2, a->vm) &&
> +           require_scale_zve32f(s) &&
>             require_scale_zve64f(s);
>  }
>
> @@ -2731,6 +2746,7 @@ static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
>  {
>      return opfv_widen_check(s, a) &&
>             require_rvf(s) &&
> +           require_zve32f(s) &&
>             require_zve64f(s);
>  }
>
> @@ -2739,6 +2755,7 @@ static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
>      return opfv_widen_check(s, a) &&
>             require_scale_rvf(s) &&
>             (s->sew != MO_8) &&
> +           require_scale_zve32f(s) &&
>             require_scale_zve64f(s);
>  }
>
> @@ -2791,6 +2808,7 @@ static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
>             vext_check_isa_ill(s) &&
>             /* OPFV widening instructions ignore vs1 check */
>             vext_check_ds(s, a->rd, a->rs2, a->vm) &&
> +           require_scale_zve32f(s) &&
>             require_scale_zve64f(s);
>  }
>
> --
> 2.31.1
>
>

