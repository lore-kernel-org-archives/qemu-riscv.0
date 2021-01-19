Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1wDj-0001VV-KH
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 13:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wDf-0001Sm-HI; Tue, 19 Jan 2021 13:59:11 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:34648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wDQ-0004jX-RX; Tue, 19 Jan 2021 13:59:11 -0500
Received: by mail-io1-xd35.google.com with SMTP id u17so41847109iow.1;
 Tue, 19 Jan 2021 10:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pBqmzdYRnH9F3TGyT5y6OCbI4AWbM8QdeIa/OccI9DE=;
 b=sdBuy7Xe03Cfun4f8nWlmR6jfawLgl4QtNwRaCbjdAX7tbNWkPL5Oi0xajRnU+rdrs
 Om0pWJIABy2Rc7rw+asKm0DaGF9q85jautUlFb+1GPi1hrEhqmtnoAt/l7EdqfMcK0YM
 jQEeSl04SCRI4q7nmYj7JHcQB6T3rb3+bnSB5hrLMRxVdZBzgFKLoVJ+KbTQmfqUd9QH
 WiB97ZChPCvRj1Mx2VykO7viCeUUD+CvHRUi4et80chbfnfMJ6vXzMV02fBmNo5rw6vK
 xC8nr6+Dn68DMnyJi7vK5slKB+xTBIr3ZqzkSSqtuLmEVS/iDWiXx6YS/3dNki2Qcl7A
 dm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pBqmzdYRnH9F3TGyT5y6OCbI4AWbM8QdeIa/OccI9DE=;
 b=sE84j6fGspq2qklQNkCbS4gjroSNVpv42EU+Hh62k67aq7LcIVGD3EOIXLhk54pF78
 UMDMYnneVKTvpTGWuHEjRWq3a1FjcV8p/BjEJZbXA4nb5p+RQtHcrtoDg/nxXBJLpsCa
 aOvT+9LTVcv0xPbBmOPCgPFP0y+RNGwshVGr06bO4lA3woSLx67kUj37VwwOBmsKeHlO
 ZdYWLwf97F9bxPYG39jw3w0bxGRt+z1E0pSeNH1R6EV4Bd8KvweQnvx4oZaBtgf/PAw4
 P3c6TZkPGcTItjJpYecpyNmVo+QlhaUt3itzyEbM0b0YZ/HqYHThsg4CWVAib8dar5eo
 1iag==
X-Gm-Message-State: AOAM532qC9zbZmTDzWHhr3ihUQKDUHiv+/imi6v1bUU95A84OodbFSQh
 qlKE78kUJLLvneEOn4bxkzRid73cWKkDrk8aydc=
X-Google-Smtp-Source: ABdhPJzCBm74sNRinyZM9aVJ9FbHxlySt5TOTans9IhFGTb627L9AoL1ITyzftTYX1+f9wGLUiCEnNkcxQT1e5zWV/4=
X-Received: by 2002:a6b:4003:: with SMTP id k3mr3987898ioa.105.1611082732900; 
 Tue, 19 Jan 2021 10:58:52 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-17-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-17-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 10:58:26 -0800
Message-ID: <CAKmqyKP1-VgCsd=mEMdcrASXbe+qkqO7Yc3z=j8Hs=v+rBhvBg@mail.gmail.com>
Subject: Re: [PATCH v6 16/72] target/riscv: rvv:1.0: add translation-time
 nan-box helper function
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 18:59:13 -0000

On Tue, Jan 12, 2021 at 1:55 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> * Add fp16 nan-box check generator function, if a 16-bit input is not
>   properly nanboxed, then the input is replaced with the default qnan.
> * Add do_nanbox() helper function to utilize gen_check_nanbox_X() to
>   generate the NaN-boxed floating-point values based on SEW setting.
> * Apply nanbox helper in opfvf_trans().
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 35 ++++++++++++++++++++++++-
>  target/riscv/translate.c                | 10 +++++++
>  2 files changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 18a1c409fcf..ccfa93cf2f8 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2100,6 +2100,33 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
>  /*
>   *** Vector Float Point Arithmetic Instructions
>   */
> +
> +/*
> + * As RVF-only cpus always have values NaN-boxed to 64-bits,
> + * RVF and RVD can be treated equally.
> + * We don't have to deal with the cases of: SEW > FLEN.
> + *
> + * If SEW < FLEN, check whether input fp register is a valid
> + * NaN-boxed value, in which case the least-significant SEW bits
> + * of the f regsiter are used, else the canonical NaN value is used.
> + */
> +static void do_nanbox(DisasContext *s, TCGv_i64 out, TCGv_i64 in)
> +{
> +    switch (s->sew) {
> +    case 1:
> +        gen_check_nanbox_h(out, in);
> +        break;
> +    case 2:
> +        gen_check_nanbox_s(out, in);
> +        break;
> +    case 3:
> +        tcg_gen_mov_i64(out, in);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  /* Vector Single-Width Floating-Point Add/Subtract Instructions */
>
>  /*
> @@ -2152,6 +2179,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>  {
>      TCGv_ptr dest, src2, mask;
>      TCGv_i32 desc;
> +    TCGv_i64 t1;
>
>      TCGLabel *over = gen_new_label();
>      tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> @@ -2165,12 +2193,17 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
>      tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
>
> -    fn(dest, mask, cpu_fpr[rs1], src2, cpu_env, desc);
> +    /* NaN-box f[rs1] */
> +    t1 = tcg_temp_new_i64();
> +    do_nanbox(s, t1, cpu_fpr[rs1]);
> +
> +    fn(dest, mask, t1, src2, cpu_env, desc);
>
>      tcg_temp_free_ptr(dest);
>      tcg_temp_free_ptr(mask);
>      tcg_temp_free_ptr(src2);
>      tcg_temp_free_i32(desc);
> +    tcg_temp_free_i64(t1);
>      mark_vs_dirty(s);
>      gen_set_label(over);
>      return true;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index d9b3b37f698..511b7b868f5 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -122,6 +122,16 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>   *
>   * Here, the result is always nan-boxed, even the canonical nan.
>   */
> +static void gen_check_nanbox_h(TCGv_i64 out, TCGv_i64 in)
> +{
> +    TCGv_i64 t_max = tcg_const_i64(0xffffffffffff0000ull);
> +    TCGv_i64 t_nan = tcg_const_i64(0xffffffffffff7e00ull);
> +
> +    tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
> +    tcg_temp_free_i64(t_max);
> +    tcg_temp_free_i64(t_nan);
> +}
> +
>  static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>  {
>      TCGv_i64 t_max = tcg_const_i64(0xffffffff00000000ull);
> --
> 2.17.1
>
>

