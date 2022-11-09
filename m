Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osuQk-00039H-6o
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 18:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1osuQi-000390-Tr; Wed, 09 Nov 2022 18:24:24 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1osuQg-0003Dc-TC; Wed, 09 Nov 2022 18:24:24 -0500
Received: by mail-pl1-x62e.google.com with SMTP id io19so104977plb.8;
 Wed, 09 Nov 2022 15:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WeNoqBxfPr+NKyZ6LVxOGbm4CdTiTbH7v/Ss9SlOjok=;
 b=awFAoqOBsuF3gJczlm7I9TOHQZ/3wcnZ23v1zWbrScBLDdlmHbuvOsJcy2meDd4kyn
 mK4oAU1++TEMYnAAZG2mie/eEb7Sb9QNJ/N4QRUWphFTaNh3SsZRCnA2Eiw4uLgSpUNS
 x/lm06Vrn059diLY4kb/46XkNJIPa8eKXWI1f4FXaBPnqQKDfhiT5h34lrDnkEZNlR+S
 AcksgXDmbm07AQCaQ8f/3yEKDCcLzsCeQA4hpRMp96AENGrJ56CDUExaDcPoioQ35Ncz
 qLjVk3XOI5wMT1k+JNwBVKMeK7TFjslohn/BAk51/1kChV8ZxZfXm3QsV2qx+LddaZ+N
 junQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WeNoqBxfPr+NKyZ6LVxOGbm4CdTiTbH7v/Ss9SlOjok=;
 b=ZyD8+nXMOclMUEwrbFrtVFrdHBKazvnPM1pm+eEV+KpgAERFRHLRSzdqqzGwT1P12E
 KLGSqJvGBq21dBJZ0CTPgHD5O40q1YQwOvEnae6gp+6EfaT8aBJJIlIhIpVrbYqJi4R4
 pHlLJXWp+iquGK9ng54mNODSQOlrEggMaPB5m208gaeq6VzDJaX9T9EYjdIvhoTQYYKn
 /QrBivxUerckQvm8B2K/ebf+K4iznOhGQxt6A0zPs3xpK5DEDhWRiaFwU5t3B3NYyWDO
 QQfRynGs0Vh2bBH92GCk/7UzHfEqvXQKzToIr8LLjQFKuwuzr7jfxifRP48fwH2c0kEn
 xK0g==
X-Gm-Message-State: ACrzQf1E9ONwTd/O92445SQMFXZ8XEUSNEEHt/xDDKfDdGfdPeAfUG3h
 jlO6QdNQZPV3pFBq3tLEqvxuWQAjIBHVDFH69yM=
X-Google-Smtp-Source: AMsMyM4dOJe/5YWyjERCIX5D5FwE1yCZdhQZrGZsx4L0/pFy5d/2uAo7xRxmnOSxj+PId4ksCiRdUy1TOgB/X4vV1bM=
X-Received: by 2002:a17:902:7294:b0:187:146c:316f with SMTP id
 d20-20020a170902729400b00187146c316fmr57189994pll.149.1668036260857; Wed, 09
 Nov 2022 15:24:20 -0800 (PST)
MIME-Version: 1.0
References: <20221016124726.102129-1-mchitale@ventanamicro.com>
 <20221016124726.102129-5-mchitale@ventanamicro.com>
In-Reply-To: <20221016124726.102129-5-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Nov 2022 09:23:54 +1000
Message-ID: <CAKmqyKMFeWWA+pLvKbxLiHV1C65fyhBWpB2B4E-DeiaOkBus0A@mail.gmail.com>
Subject: Re: [PATCH v11 4/5] target/riscv: smstateen check for fcsr
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Wed, 09 Nov 2022 23:24:25 -0000

On Sun, Oct 16, 2022 at 11:09 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> If smstateen is implemented and sstateen0.fcsr is clear then the floating point
> operations must return illegal instruction exception or virtual instruction
> trap, if relevant.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c                        | 23 ++++++++++++
>  target/riscv/insn_trans/trans_rvf.c.inc   | 43 +++++++++++++++++++++--
>  target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
>  3 files changed, 75 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 71236f2b5d..8b25f885ec 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -84,6 +84,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
>          !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> +
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> +    }
>  #endif
>      return RISCV_EXCP_NONE;
>  }
> @@ -2023,6 +2027,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
>                                        target_ulong new_val)
>  {
>      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
>
>      return write_mstateen(env, csrno, wr_mask, new_val);
>  }
> @@ -2059,6 +2066,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
>  {
>      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>      return write_mstateenh(env, csrno, wr_mask, new_val);
>  }
>
> @@ -2096,6 +2107,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
>  {
>      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>      return write_hstateen(env, csrno, wr_mask, new_val);
>  }
>
> @@ -2135,6 +2150,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
>  {
>      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>      return write_hstateenh(env, csrno, wr_mask, new_val);
>  }
>
> @@ -2182,6 +2201,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
>  {
>      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>      return write_sstateen(env, csrno, wr_mask, new_val);
>  }
>
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index a1d3eb52ad..93657680c6 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -24,9 +24,46 @@
>              return false; \
>  } while (0)
>
> -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> -    if (!ctx->cfg_ptr->ext_zfinx) { \
> -        REQUIRE_EXT(ctx, RVF); \
> +#ifndef CONFIG_USER_ONLY
> +static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
> +{
> +    CPUState *cpu = ctx->cs;
> +    CPURISCVState *env = cpu->env_ptr;
> +    uint64_t stateen = env->mstateen[index];
> +
> +    if (!ctx->cfg_ptr->ext_smstateen || env->priv == PRV_M) {
> +        return true;
> +    }
> +
> +    if (ctx->virt_enabled) {
> +        stateen &= env->hstateen[index];
> +    }
> +
> +    if (env->priv == PRV_U && has_ext(ctx, RVS)) {
> +        stateen &= env->sstateen[index];
> +    }
> +
> +    if (!(stateen & SMSTATEEN0_FCSR)) {
> +        if (ctx->virt_enabled) {
> +            ctx->virt_inst_excp = true;
> +        }
> +        return false;
> +    }
> +
> +    return true;
> +}
> +#else
> +#define smstateen_fcsr_check(ctx, index) (true)
> +#endif
> +
> +#define REQUIRE_ZFINX_OR_F(ctx) do { \
> +    if (!has_ext(ctx, RVF)) { \
> +        if (!ctx->cfg_ptr->ext_zfinx) { \
> +            return false; \
> +        } \
> +        if (!smstateen_fcsr_check(ctx, 0)) { \
> +            return false; \
> +        } \
>      } \
>  } while (0)
>
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 5d07150cd0..6c2e338c0a 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -20,18 +20,27 @@
>      if (!ctx->cfg_ptr->ext_zfh) {      \
>          return false;         \
>      }                         \
> +    if (!smstateen_fcsr_check(ctx, 0)) { \
> +        return false; \
> +    } \
>  } while (0)
>
>  #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
>      if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
>          return false;                  \
>      }                                  \
> +    if (!smstateen_fcsr_check(ctx, 0)) { \
> +        return false; \
> +    } \
>  } while (0)
>
>  #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
>      if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
>          return false;                         \
>      }                                         \
> +    if (!smstateen_fcsr_check(ctx, 0)) { \
> +        return false; \
> +    } \
>  } while (0)
>
>  #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
> @@ -39,6 +48,9 @@
>            ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) {     \
>          return false;                                        \
>      }                                                        \
> +    if (!smstateen_fcsr_check(ctx, 0)) { \
> +        return false; \
> +    } \
>  } while (0)
>
>  static bool trans_flh(DisasContext *ctx, arg_flh *a)
> --
> 2.25.1
>
>

