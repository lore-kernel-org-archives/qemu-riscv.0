Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9avG-0006vn-GC
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:56:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9av7-0006qe-87; Mon, 17 Jan 2022 17:56:14 -0500
Received: from [2607:f8b0:4864:20::d36] (port=43931
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9av5-0001Sz-Iq; Mon, 17 Jan 2022 17:56:12 -0500
Received: by mail-io1-xd36.google.com with SMTP id v1so23263589ioj.10;
 Mon, 17 Jan 2022 14:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gfhdsLDH4/B3r+aDzhZGQYBdIIiBqGQW6uC1cEhw3Qw=;
 b=TV3R7Qm0J1YuQXbWv+uJdwegLA4D5kOdYQXmU8Ewj59K0mHU6OF2Ze79S2YAJkMghl
 V89fRf3zRc8H2yEodTSwfMOzuBolJej8y1rEP0mnGsGtrM/XJMzAU5q3UfQKHqn8RTIX
 3CYaPFvnwTgln+cm/WSNkD2YlRUjeajC43aBAqYXM3/7pu3MeRgvdA0uZxtw8Bo2DV+S
 oU3xWLmi8m2NHy0ZVRHsa14kY8giiSUt2i776BJ7PUfSoJQ2K/FNyXZjuJU6OxLuwaud
 BdNPM/rDooqRQxkBFyLJ+jT0zqyYn8FiDOllwBnO3oPumYsdAQw8EiRk9Ng9P7syWQrZ
 fQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gfhdsLDH4/B3r+aDzhZGQYBdIIiBqGQW6uC1cEhw3Qw=;
 b=IFnRKNXAyjPhgTJ8yFTrOFtpWxPOh26fyt2QUX+Wt4V1ktBCkSoa7+OFE0/98fbq2r
 WtfN0SYKaD88FDQPw40NQgAEHLE/QwLddShj47KzHi5RB6/kDYoT8ETfApiDNd7H98Ji
 2TTEFwHRcEmgOIAgh+HrlPzNzpT8LF5hZ47zi3CcPYe4FPVDvohi8MflFP2IkkH414OT
 f+T7TdCf/QBShM92DDSHFNURj3GECuVZNiDKpYs92ji8oZjwoEEgNlaAJOreX5i777ZN
 yb3xzT2n7shlixiuAL5mLklox8Z4Nj9gP1wxcORgiPQUW2utC5LTgBXGlDjkEsIqctm4
 ftUg==
X-Gm-Message-State: AOAM531+1pmNMt1cNHUCPsmCRR5MpvYBZLU7iCYpP1pf1Za5p/Je5VQ/
 1OHCAV7avZk+CkaXGJu6YPtFoTmSHR2DxHWjmv4=
X-Google-Smtp-Source: ABdhPJxmU4HUz9dz0WiamF3pwvS7PMIuLbz9kmbe0g4SRORYqScZkW4ZbcnYtgqK3jElkaxzYP95c33/phQToHarVc0=
X-Received: by 2002:a02:7702:: with SMTP id g2mr11136978jac.206.1642460169690; 
 Mon, 17 Jan 2022 14:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-14-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-14-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:55:43 +1000
Message-ID: <CAKmqyKMCDArArm4jTmcOMtCEL8+z_u4UL6rGJqVO4dwT1RRUCg@mail.gmail.com>
Subject: Re: [PATCH 13/17] target/riscv: rvv-1.0: Add Zve32f support for
 scalar fp insns
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
X-List-Received-Date: Mon, 17 Jan 2022 22:56:15 -0000

On Wed, Dec 29, 2021 at 12:48 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Zve32f extension requires the scalar processor to implement the F
> extension and implement all vector floating-point instructions for
> floating-point operands with EEW=32 (i.e., no widening floating-point
> operations).
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index c6280c7b0b..1f5a75eca7 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -66,6 +66,17 @@ static bool require_scale_rvf(DisasContext *s)
>      }
>  }
>
> +static bool require_zve32f(DisasContext *s)
> +{
> +    /* RVV + Zve32f = RVV. */
> +    if (has_ext(s, RVV)) {
> +        return true;
> +    }
> +
> +    /* Zve32f doesn't support FP64. (Section 18.2) */
> +    return s->ext_zve32f ? s->sew <= MO_32 : true;
> +}
> +
>  static bool require_zve64f(DisasContext *s)
>  {
>      /* RVV + Zve64f = RVV. */
> @@ -2227,6 +2238,7 @@ static bool opfvv_check(DisasContext *s, arg_rmrr *a)
>             require_rvf(s) &&
>             vext_check_isa_ill(s) &&
>             vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm) &&
> +           require_zve32f(s) &&
>             require_zve64f(s);
>  }
>
> @@ -2308,6 +2320,7 @@ static bool opfvf_check(DisasContext *s, arg_rmrr *a)
>             require_rvf(s) &&
>             vext_check_isa_ill(s) &&
>             vext_check_ss(s, a->rd, a->rs2, a->vm) &&
> +           require_zve32f(s) &&
>             require_zve64f(s);
>  }
>
> @@ -2530,6 +2543,7 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
>             vext_check_isa_ill(s) &&
>             /* OPFV instructions ignore vs1 check */
>             vext_check_ss(s, a->rd, a->rs2, a->vm) &&
> +           require_zve32f(s) &&
>             require_zve64f(s);
>  }
>
> @@ -2596,6 +2610,7 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
>             require_rvf(s) &&
>             vext_check_isa_ill(s) &&
>             vext_check_mss(s, a->rd, a->rs1, a->rs2) &&
> +           require_zve32f(s) &&
>             require_zve64f(s);
>  }
>
> @@ -2610,6 +2625,7 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
>             require_rvf(s) &&
>             vext_check_isa_ill(s) &&
>             vext_check_ms(s, a->rd, a->rs2) &&
> +           require_zve32f(s) &&
>             require_zve64f(s);
>  }
>
> @@ -2632,6 +2648,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>          require_rvf(s) &&
>          vext_check_isa_ill(s) &&
>          require_align(a->rd, s->lmul) &&
> +        require_zve32f(s) &&
>          require_zve64f(s)) {
>          gen_set_rm(s, RISCV_FRM_DYN);
>
> @@ -3366,6 +3383,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
>      if (require_rvv(s) &&
>          require_rvf(s) &&
>          vext_check_isa_ill(s) &&
> +        require_zve32f(s) &&
>          require_zve64f(s)) {
>          gen_set_rm(s, RISCV_FRM_DYN);
>
> @@ -3393,6 +3411,7 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
>      if (require_rvv(s) &&
>          require_rvf(s) &&
>          vext_check_isa_ill(s) &&
> +        require_zve32f(s) &&
>          require_zve64f(s)) {
>          gen_set_rm(s, RISCV_FRM_DYN);
>
> @@ -3445,6 +3464,7 @@ static bool fslideup_check(DisasContext *s, arg_rmrr *a)
>  {
>      return slideup_check(s, a) &&
>             require_rvf(s) &&
> +           require_zve32f(s) &&
>             require_zve64f(s);
>  }
>
> @@ -3452,6 +3472,7 @@ static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
>  {
>      return slidedown_check(s, a) &&
>             require_rvf(s) &&
> +           require_zve32f(s) &&
>             require_zve64f(s);
>  }
>
> --
> 2.31.1
>
>

