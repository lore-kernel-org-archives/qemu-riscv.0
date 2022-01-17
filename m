Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9aqr-000222-9z
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:51:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aqi-00020G-7l; Mon, 17 Jan 2022 17:51:41 -0500
Received: from [2607:f8b0:4864:20::12f] (port=42958
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aqf-0000tu-Ba; Mon, 17 Jan 2022 17:51:38 -0500
Received: by mail-il1-x12f.google.com with SMTP id u5so11761684ilq.9;
 Mon, 17 Jan 2022 14:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1VT0IPbzSqp3MLdWYVjQRHzwBbyXzOT6/Xw71N/+lpQ=;
 b=b5Y6DJzt+ikJLRc5aafNFJ59Qd9/nXJSXYLtqZVNm+z3Q5KFh6Q6kUpSWqN2/9DMMU
 R9ABPI8r3KJb5E+Jp7p0LWyVKgcESnaIO+hfIVULMCzreYLnmNZpHEFL1Frs2xqO40/F
 phBbyFqZg5QRtIIvfE4aWEs6W4eon7lAP0hRK7Q+y9uWLVwspqZ07DU5dI6iZFv9fxAi
 LeA7MZHdXFmtGh94sA2G7bABczq2A0zuCE4/uPMR4VfbSiw9IBS0wfJWKBuKUWUWkDjF
 gcRpOgl7ZXSowVo/7rUWAJ+duBraJSYlEeUhHO5BN+StKeZHFD+lfqlVH1KfNy7+yVMO
 pGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1VT0IPbzSqp3MLdWYVjQRHzwBbyXzOT6/Xw71N/+lpQ=;
 b=hlte4pBpOSUjS+osw+H3NmG5+pqfpUAD4hCePgqh2TB1Kfaxg4lf4AQeMuJbccKVsi
 DFlQTpuTvQcfqCNxqkWrs2VqKpB7F14Z+QJGCZznbeWCXgsqfI2cHnw6+ur5yrn0G92F
 mxKUUvCdJP0svsEAx7xy+xFu49jkj+jidAsvT+TRkw7+7q49fagJ2QwGJJSfcNUT9eKi
 IVuOV8J7HOjxBwaavCGisULBcGUcO/Fv3Soph9IkFWErDWcakG/CVvWAx0TYZ2aaP6Ld
 0AD4O57KG2NxGg4rcQDW1/rr6GxYHSgA8v29TDVDZ09EKmskJuDk/E3gvqlxosN6hfNk
 GG1A==
X-Gm-Message-State: AOAM5320CLvUkmvhE1b4ku38mda4lapBKfr13BfZwp3WVRglOmepE9Du
 rzHrGexWzVsO5KygH+96jPglKcik7z048e9J6cI=
X-Google-Smtp-Source: ABdhPJxNpSZkn/u9JEp6AzMFYr0YnVAvkNfDpUJS3ddy2ZlQ3C4Rf5rEma6dDRhqQimNCP5kcWjQWPvtPvVIeifB7aY=
X-Received: by 2002:a05:6e02:6d1:: with SMTP id
 p17mr9131599ils.74.1642459892730; 
 Mon, 17 Jan 2022 14:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-9-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-9-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:51:06 +1000
Message-ID: <CAKmqyKO87Q3C8d6u1hLU9JZ9YBtYUePKEEb9_46JcJpiB1Mgqg@mail.gmail.com>
Subject: Re: [PATCH 08/17] target/riscv: rvv-1.0: Add Zve64f support for
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Mon, 17 Jan 2022 22:51:45 -0000

On Wed, Dec 29, 2021 at 12:42 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Vector widening conversion instructions are provided to and from all
> supported integer EEWs for Zve64f extension.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++++++++++++++------
>  1 file changed, 25 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index d7e288b87f..9ca8d502b2 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -77,6 +77,17 @@ static bool require_zve64f(DisasContext *s)
>      return s->ext_zve64f ? s->sew <= MO_32 : true;
>  }
>
> +static bool require_scale_zve64f(DisasContext *s)
> +{
> +    /* RVV + Zve64f = RVV. */
> +    if (has_ext(s, RVV)) {
> +        return true;
> +    }
> +
> +    /* Zve64f doesn't support FP64. (Section 18.2) */
> +    return s->ext_zve64f ? s->sew <= MO_16 : true;
> +}
> +
>  /* Destination vector register group cannot overlap source mask register. */
>  static bool require_vm(int vm, int vd)
>  {
> @@ -2331,7 +2342,8 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
>             require_scale_rvf(s) &&
>             (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
> -           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
> +           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
> +           require_scale_zve64f(s);
>  }
>
>  /* OPFVV with WIDEN */
> @@ -2370,7 +2382,8 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
>             require_scale_rvf(s) &&
>             (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
> -           vext_check_ds(s, a->rd, a->rs2, a->vm);
> +           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
> +           require_scale_zve64f(s);
>  }
>
>  /* OPFVF with WIDEN */
> @@ -2400,7 +2413,8 @@ static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
>             require_scale_rvf(s) &&
>             (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
> -           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
> +           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm) &&
> +           require_scale_zve64f(s);
>  }
>
>  /* WIDEN OPFVV with WIDEN */
> @@ -2439,7 +2453,8 @@ static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
>             require_scale_rvf(s) &&
>             (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
> -           vext_check_dd(s, a->rd, a->rs2, a->vm);
> +           vext_check_dd(s, a->rd, a->rs2, a->vm) &&
> +           require_scale_zve64f(s);
>  }
>
>  /* WIDEN OPFVF with WIDEN */
> @@ -2698,14 +2713,16 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
>  static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
>  {
>      return opfv_widen_check(s, a) &&
> -           require_rvf(s);
> +           require_rvf(s) &&
> +           require_zve64f(s);
>  }
>
>  static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
>  {
>      return opfv_widen_check(s, a) &&
>             require_scale_rvf(s) &&
> -           (s->sew != MO_8);
> +           (s->sew != MO_8) &&
> +           require_scale_zve64f(s);
>  }
>
>  #define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
> @@ -2756,7 +2773,8 @@ static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
>             require_scale_rvf(s) &&
>             vext_check_isa_ill(s) &&
>             /* OPFV widening instructions ignore vs1 check */
> -           vext_check_ds(s, a->rd, a->rs2, a->vm);
> +           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
> +           require_scale_zve64f(s);
>  }
>
>  #define GEN_OPFXV_WIDEN_TRANS(NAME)                                \
> --
> 2.31.1
>
>

