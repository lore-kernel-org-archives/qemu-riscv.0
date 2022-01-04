Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4rhS-0003Fx-No
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 16:50:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4rhE-0003Dk-QQ; Tue, 04 Jan 2022 16:50:21 -0500
Received: from [2607:f8b0:4864:20::d30] (port=39486
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4rhA-0004NA-2s; Tue, 04 Jan 2022 16:50:17 -0500
Received: by mail-io1-xd30.google.com with SMTP id y11so40635722iod.6;
 Tue, 04 Jan 2022 13:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YH9Leo9srv0mjnG3XtGtDkXI8iCi7ViITDy07e20ir4=;
 b=oCewEJSOzWWWn2HRrd9stapjDqmltBdBzqElGsdIxLNxIPe4H1381El3NLfuwmgsNr
 oj+BsHOsMNC5iSLX3GspF7gYoxzcJTDabQF9sfrNEwV7+FUO9CQSpcHloL6mojqHY6RO
 y2pPdWJmyaWpreHc9+2P9DAIlRHU5rYz1Y/4JAFXc3bhsLoGpQ4zxZ9BB/QdYC6+jky6
 WrIYrgfaiXjIbLlz/SCU0i76YBoD18nB3nJx43Tf5G6BclOCins7FpLTY9N4tuBb8vKe
 fHu79ZWe5hHnzkd6ijFAvA5RpJKgWJ6hmeBqYrCi5Ts+soWO8/ZDur83aawI45T2QpBf
 5CXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YH9Leo9srv0mjnG3XtGtDkXI8iCi7ViITDy07e20ir4=;
 b=BeTLbqduKIZP5/BUQV3fZceQkr3k9X5Phu879VMtcezOfx8CH38YC3QKFTBpHuXLvV
 4gpFXRrF/U09KzH0AIMmzG4uNKPHDNzYhhdSbSfKzg4b96jIYaCgiRnhmwOI00MccwZ/
 yURpxOQXCTNEZCrjFeDgU9qqI9tpttbXK0AVIehlhFl4486lA4RuRowkDgeD5g09NpSl
 FAVVkPz+AjO00GYBRZvXAFvphc4MFYpFX2R0rO0YhRtEpJSX7MTcr7rpxvA/pX7nmQAM
 q5FquN8P0jYJ4EvFdESlO0hue1sgAEQtxiqNIiQ/neJEeXdc/8URG/lMCuQdX0DSfm9+
 C8FA==
X-Gm-Message-State: AOAM533jZvP3M8qK3WB4dd+9WTbxcvqvnjDttHcwVdirLa8djZY4HdpW
 HxNoqZXhDAH/LLNjUF13BGs4sC3Gdq7EZM8c8kk=
X-Google-Smtp-Source: ABdhPJyGAmPDm3rs1v8CFgwYLTIXyZsmv1JWOUbDvYrAgTn2hV0xC5Qz+LxKt3hDtB6IY95J4u+BoFe+vfKkrza61Hs=
X-Received: by 2002:a02:aa8f:: with SMTP id u15mr23735183jai.63.1641333014723; 
 Tue, 04 Jan 2022 13:50:14 -0800 (PST)
MIME-Version: 1.0
References: <20211229021250.29804-1-frank.chang@sifive.com>
 <20211229021250.29804-2-frank.chang@sifive.com>
In-Reply-To: <20211229021250.29804-2-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Jan 2022 07:49:48 +1000
Message-ID: <CAKmqyKPdkj9VLLHN-gL=yEeeK7K3L2mqjrDTgCBRgDpvRbKw4Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: rvv-1.0: Call the correct RVF/RVD check
 funtion for widening fp insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 04 Jan 2022 21:50:22 -0000

On Wed, Dec 29, 2021 at 12:15 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Vector widening floating-point instructions should use
> require_scale_rvf() instead of require_rvf() to check whether RVF/RVD is
> enabled.

Missing Signed off by line

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 5e3f7fdb77..8d92243f2b 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2254,7 +2254,8 @@ GEN_OPFVF_TRANS(vfrsub_vf,  opfvf_check)
>  static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
>  {
>      return require_rvv(s) &&
> -           require_rvf(s) &&
> +           require_scale_rvf(s) &&
> +           (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
>  }
> @@ -2292,7 +2293,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwsub_vv, opfvv_widen_check)
>  static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
>  {
>      return require_rvv(s) &&
> -           require_rvf(s) &&
> +           require_scale_rvf(s) &&
> +           (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_ds(s, a->rd, a->rs2, a->vm);
>  }
> @@ -2321,7 +2323,8 @@ GEN_OPFVF_WIDEN_TRANS(vfwsub_vf)
>  static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
>  {
>      return require_rvv(s) &&
> -           require_rvf(s) &&
> +           require_scale_rvf(s) &&
> +           (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
>  }
> @@ -2359,7 +2362,8 @@ GEN_OPFWV_WIDEN_TRANS(vfwsub_wv)
>  static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
>  {
>      return require_rvv(s) &&
> -           require_rvf(s) &&
> +           require_scale_rvf(s) &&
> +           (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_dd(s, a->rd, a->rs2, a->vm);
>  }
> --
> 2.31.1
>
>

