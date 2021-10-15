Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbMTG-0007hF-J7
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 08:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbMTF-0007gt-90; Fri, 15 Oct 2021 08:37:57 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbMT2-00061A-Ee; Fri, 15 Oct 2021 08:37:57 -0400
Received: by mail-pg1-x532.google.com with SMTP id e7so8500927pgk.2;
 Fri, 15 Oct 2021 05:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=227zV1gxtkNhPbXEYIP8/xADQqjWERCvoSTBxHpIQqA=;
 b=VzmJRgDskQdz6OaiURf3wyCgUcoQt5q9JQ1Z+c5E29hby3P9cdANzjDZS5VajzlajX
 lJil2J2OZbnX6YI9dGM/Couz6dBcfAQsrdwc5HuQEUzkRZ482aOYwyxNQuOmWXURnn42
 TcpwtnuJRwiKI3HtYRuCA8YTDgNk25go5fuqiaKTatIj10XLjl0U4srCHgSBrVxSipgG
 ug7HU3YgVfOGcQkddybz0BaOEQkht5CJ2S7NVVx01ByBfdQv+SUsL369clLCt2gMdVix
 QVeIHmH/JbVZQ3FVSpDH+PlZjicHQDe5QLGbyfpI2W/y3A67SMQxNNNiWZlH5OxtdTCa
 JKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=227zV1gxtkNhPbXEYIP8/xADQqjWERCvoSTBxHpIQqA=;
 b=b+Iy+NtggiFZZBvdFbbCBTDacUJ06zIzeyUvP+TzULQt32PgRlHo4g5vrsp8w95BoR
 mgqFso8uUwn/ezmypo7X0VjB3/d8apr8uSoNnyLKOwNd2iMF+G9IzsCdXg7ZyeXCvWyo
 K0yObWmk9p/ss8MNLf6plxnRIHAS+V9mw0/oE7td85pkTIukgQ2BEJRAH72936VWoiG2
 t8yTFL8YW9FhR+A46/RsNQlYFGoaaDFxBr0c4nLx0xQ5kfHs2EvrNdypgjEEwXgMMaU6
 2wL7JnS46lUO4RYMWPOx4ER9ipHtdKgmsfKrRHPefpUiGrdbcSLTgw9bPZrSL3dlouuI
 arNg==
X-Gm-Message-State: AOAM5333NvZtnyfkLxLSxaLhXrOIsZTsjg/JaIbPGQT5Clnfd1SBWx+3
 tcMiD7196iy2KVyqwgDrzwSCVB+seunOnWHv+WU=
X-Google-Smtp-Source: ABdhPJzI4SE7cbNxPBhql4/1/1PNGxRtwf6WZA1fipdj4aplcjhrRDSk1muPPKiuPdu28DonucFMH3GZglSkXCvqq9g=
X-Received: by 2002:a63:6b42:: with SMTP id g63mr1467169pgc.461.1634301462623; 
 Fri, 15 Oct 2021 05:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-6-richard.henderson@linaro.org>
In-Reply-To: <20211013205104.1031679-6-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Oct 2021 22:37:16 +1000
Message-ID: <CAKmqyKOiAppxPij-Ts=m6y3t2moUguFrtATNgHJSn-QCrGdwkw@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] target/riscv: Add MXL/SXL/UXL to TB_FLAGS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 15 Oct 2021 12:37:57 -0000

On Thu, Oct 14, 2021 at 6:56 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Begin adding support for switching XLEN at runtime.  Extract the
> effective XLEN from MISA and MSTATUS and store for use during translation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: Force SXL and UXL to valid values.
> ---
>  target/riscv/cpu.h        |  2 ++
>  target/riscv/cpu.c        |  8 ++++++++
>  target/riscv/cpu_helper.c | 33 +++++++++++++++++++++++++++++++++
>  target/riscv/csr.c        |  3 +++
>  target/riscv/translate.c  |  2 +-
>  5 files changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 87248b562a..445ba5b395 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -395,6 +395,8 @@ FIELD(TB_FLAGS, VILL, 8, 1)
>  /* Is a Hypervisor instruction load/store allowed? */
>  FIELD(TB_FLAGS, HLSX, 9, 1)
>  FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
> +/* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
> +FIELD(TB_FLAGS, XL, 12, 2)
>
>  #ifdef CONFIG_RISCV32
>  #define riscv_cpu_mxl(env)      MXL_RV32
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1857670a69..840edd66f8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -355,6 +355,14 @@ static void riscv_cpu_reset(DeviceState *dev)
>      env->misa_mxl = env->misa_mxl_max;
>      env->priv = PRV_M;
>      env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
> +    if (env->misa_mxl > MXL_RV32) {
> +        /*
> +         * The reset status of SXL/UXL is officially undefined,
> +         * but invalid settings would result in a tcg assert.
> +         */
> +        env->mstatus = set_field(env->mstatus, MSTATUS64_SXL, env->misa_mxl);
> +        env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
> +    }
>      env->mcause = 0;
>      env->pc = env->resetvec;
>      env->two_stage_lookup = false;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 403f54171d..429afd1f48 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -35,6 +35,37 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  #endif
>  }
>
> +static RISCVMXL cpu_get_xl(CPURISCVState *env)
> +{
> +#if defined(TARGET_RISCV32)
> +    return MXL_RV32;
> +#elif defined(CONFIG_USER_ONLY)
> +    return MXL_RV64;
> +#else
> +    RISCVMXL xl = riscv_cpu_mxl(env);
> +
> +    /*
> +     * When emulating a 32-bit-only cpu, use RV32.
> +     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
> +     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widened
> +     * back to RV64 for lower privs.
> +     */
> +    if (xl != MXL_RV32) {
> +        switch (env->priv) {
> +        case PRV_M:
> +            break;
> +        case PRV_U:
> +            xl = get_field(env->mstatus, MSTATUS64_UXL);
> +            break;
> +        default: /* PRV_S | PRV_H */
> +            xl = get_field(env->mstatus, MSTATUS64_SXL);
> +            break;
> +        }
> +    }
> +    return xl;
> +#endif
> +}
> +
>  void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>                            target_ulong *cs_base, uint32_t *pflags)
>  {
> @@ -78,6 +109,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>      }
>  #endif
>
> +    flags = FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
> +
>      *pflags = flags;
>  }
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9c0753bc8b..c4a479ddd2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -526,6 +526,9 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>          mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
>      } else {
>          mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
> +        /* SXL and UXL fields are for now read only */
> +        mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
> +        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
>      }
>      env->mstatus = mstatus;
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 422f8ab8d0..7e7bb67d15 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -539,7 +539,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>  #else
>      ctx->virt_enabled = false;
>  #endif
> -    ctx->xl = env->misa_mxl;
>      ctx->misa_ext = env->misa_ext;
>      ctx->frm = -1;  /* unknown rounding mode */
>      ctx->ext_ifencei = cpu->cfg.ext_ifencei;
> @@ -551,6 +550,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
>      ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> +    ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
>      ctx->cs = cs;
>      ctx->w = false;
>      ctx->ntemp = 0;
> --
> 2.25.1
>
>

