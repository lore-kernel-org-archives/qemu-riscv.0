Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4BVj-0003Bm-7q
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jan 2021 18:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BVh-0003Bc-KP; Mon, 25 Jan 2021 18:43:05 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:46354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BVe-0002R2-FL; Mon, 25 Jan 2021 18:43:05 -0500
Received: by mail-io1-xd2d.google.com with SMTP id u8so17099340ior.13;
 Mon, 25 Jan 2021 15:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QKd+mMq07PNf4uy7OcDftBNIQwNS8Kr9PlUrdFATcG4=;
 b=ilsc2FjXlsOTwlU5xZn49jf16Yh+Kftde5BxwWKEjCk1E7xYw6WFrmJsEoPIhAbvVB
 vW2043KN6EjMU+hnwgKAKYPiRgoNPFAIpgtH8ZBvs9/gOd6rc7Lww/hNJ44cYLRWp4QJ
 6crqp2y9Zvnj6I+Pd/BiZiKzwvOiCY3tw0rSp+4uENt1nqGeBbwMH/yxICnbdFta8mdG
 8Jh/0wKP94rHzZvjwxyvaVwNv2ls8/Xe7ZUzMygli25A8slmc1KZkBbkE98wGrZ4e7HK
 g33EPPiut69X/+5wm2AcGUdPPvvFsRwIuftQw2dhwlTZUIJtr6xmLVWxcDG5NzrtNVqB
 Wv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QKd+mMq07PNf4uy7OcDftBNIQwNS8Kr9PlUrdFATcG4=;
 b=mLDXAHvQqFxbTWa+WDs9TaaoX0Exw+jwRlx9W2oNux5WUEMuCm3a4ITH9li1l8FXUG
 e/ETQRy6pnGFs8Ef75iKcUSe3kNXLhtu1Bk2Ang7JTJl+CNW0r/M9y/ogbodbESbqp6e
 vZA2S/BOcEV+Hm11SNt0rhkRUkMSjj0zwqvQ6wgHrYzp0/X62fSg/RKQm84EQaew+GeJ
 q57uz4tfQBZQJLZd+rHP5aoqjRcwH1MkJGe20Zn1y6KF0BPy2+IYtQx4KDhTL0qjbawC
 fO+oGV0pZqliTsh19K4wICqKXZ0jHEpNdtK7IhjOwPnEufZreCjDS1pYYJwlBJVTo2K0
 zuAA==
X-Gm-Message-State: AOAM533bENZlUrVML206816HOkKzYSGnOR0vA43BJg1X1oihwrRXzicf
 yOA2F/VS9OXa3YyDf5h2Er7lmKysFz+0z306h50=
X-Google-Smtp-Source: ABdhPJw1GD/5tBLqus+L2ymnu+3bdlefX/9YTkixLH0eHMgNJdQmR8qghrHSXRSpMapUGPS+aD1QxCyJftcNbiMSnTo=
X-Received: by 2002:a92:8455:: with SMTP id l82mr2429949ild.40.1611618179841; 
 Mon, 25 Jan 2021 15:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-26-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-26-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Jan 2021 15:42:33 -0800
Message-ID: <CAKmqyKNadP2Y==bjVzHc1v5Cknq2T+-0feKtUaDUUafJ9Tw9aQ@mail.gmail.com>
Subject: Re: [PATCH v6 25/72] target/riscv: rvv-1.0: take fractional LMUL into
 vector max elements calculation
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Mon, 25 Jan 2021 23:43:06 -0000

On Tue, Jan 12, 2021 at 2:04 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Update vext_get_vlmax() and MAXSZ() to take fractional LMUL into
> calculation for RVV 1.0.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h                      | 43 ++++++++++++++++++-------
>  target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++-
>  2 files changed, 42 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index aae3512c33f..993539aed94 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -392,18 +392,27 @@ FIELD(TB_FLAGS, HLSX, 12, 1)
>  bool riscv_cpu_is_32bit(CPURISCVState *env);
>
>  /*
> - * A simplification for VLMAX
> - * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
> - * = (VLEN << LMUL) / (8 << SEW)
> - * = (VLEN << LMUL) >> (SEW + 3)
> - * = VLEN >> (SEW + 3 - LMUL)
> + * Encode LMUL to lmul as follows:
> + *     LMUL    vlmul    lmul
> + *      1       000       0
> + *      2       001       1
> + *      4       010       2
> + *      8       011       3
> + *      -       100       -
> + *     1/8      101      -3
> + *     1/4      110      -2
> + *     1/2      111      -1
> + *
> + * then, we can calculate VLMAX = vlen >> (vsew + 3 - lmul)
> + * e.g. vlen = 256 bits, SEW = 16, LMUL = 1/8
> + *      => VLMAX = vlen >> (1 + 3 - (-3))
> + *               = 256 >> 7
> + *               = 2
>   */
>  static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
>  {
> -    uint8_t sew, lmul;
> -
> -    sew = FIELD_EX64(vtype, VTYPE, VSEW);
> -    lmul = FIELD_EX64(vtype, VTYPE, VLMUL);
> +    uint8_t sew = FIELD_EX64(vtype, VTYPE, VSEW);
> +    int8_t lmul = sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
>      return cpu->cfg.vlen >> (sew + 3 - lmul);
>  }
>
> @@ -416,12 +425,22 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>      *cs_base = 0;
>
>      if (riscv_has_ext(env, RVV)) {
> +        /*
> +         * If env->vl equals to VLMAX, we can use generic vector operation
> +         * expanders (GVEC) to accerlate the vector operations.
> +         * However, as LMUL could be a fractional number. The maximum
> +         * vector size can be operated might be less than 8 bytes,
> +         * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
> +         * only when maxsz >= 8 bytes.
> +         */
>          uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
> -        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
> +        uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
> +        uint32_t maxsz = vlmax << sew;
> +        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl)
> +                           && (maxsz >= 8);
>          flags = FIELD_DP32(flags, TB_FLAGS, VILL,
>                      FIELD_EX64(env->vtype, VTYPE, VILL));
> -        flags = FIELD_DP32(flags, TB_FLAGS, SEW,
> -                    FIELD_EX64(env->vtype, VTYPE, VSEW));
> +        flags = FIELD_DP32(flags, TB_FLAGS, SEW, sew);
>          flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
>                      FIELD_EX64(env->vtype, VTYPE, VLMUL));
>          flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 367fb28186f..72d0bc109b0 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1268,7 +1268,17 @@ GEN_VEXT_AMO_TRANS(vamomaxuei64_v, MO_64, 35, rwdvm, amo_op, amo_check)
>  /*
>   *** Vector Integer Arithmetic Instructions
>   */
> -#define MAXSZ(s) (s->vlen >> (3 - s->lmul))
> +
> +/*
> + * MAXSZ returns the maximum vector size can be operated in bytes,
> + * which is used in GVEC IR when vl_eq_vlmax flag is set to true
> + * to accerlate vector operation.
> + */
> +static inline uint32_t MAXSZ(DisasContext *s)
> +{
> +    int scale = s->lmul - 3;
> +    return scale < 0 ? s->vlen >> -scale : s->vlen << scale;
> +}
>
>  static bool opivv_check(DisasContext *s, arg_rmrr *a)
>  {
> --
> 2.17.1
>
>

