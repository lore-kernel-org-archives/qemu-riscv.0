Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnvWl-00043I-64
	for mharc-qemu-riscv@gnu.org; Thu, 18 Nov 2021 23:29:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnvWj-00042P-ON; Thu, 18 Nov 2021 23:29:29 -0500
Received: from [2607:f8b0:4864:20::d33] (port=43940
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnvWh-0003J6-GC; Thu, 18 Nov 2021 23:29:29 -0500
Received: by mail-io1-xd33.google.com with SMTP id z26so11186426iod.10;
 Thu, 18 Nov 2021 20:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ou4xO1KtWyX93r+7UvlRszZIGY1ju8JwtCYedMf1UC8=;
 b=G++Y/bPk3YqIiiPqn2eXgOyezda0KdSbiSFdKg3rJqjVbPHYuUS7q6F9Q7Sa+qdsWW
 2AqmD1S5d2nmzcbifVtp32JQrb/fUtwcwGLxOSIkEcCRpfUp+J/3LtnuZnQgjbjz533p
 xKhMQnI6wOLSFKn3jOPz9qE3Uiz9Z+jCmT6WFkIUp71TOzVOVFvyjmqFRng5MCdoRbke
 z0jaag5jioQ+LqTuRwLncvORaJem29CCHeY/IF0Fj+nGVuHH3c+l5cvZa1e0/eImZdgi
 Nm+U5KswfUtF3evGuHLFlZaCMpTd18RHUZHXQmdCBo5FXmkmJRiy9nZsq7L4qddW+mge
 JX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ou4xO1KtWyX93r+7UvlRszZIGY1ju8JwtCYedMf1UC8=;
 b=w9LEepfIBm7ZRFlPp5NNZ3eTWAKjqrufWE7e1VvK07TJaG8u60W23jG9OFKGhQaEHg
 StDLzrJcwVcZ7JDSrGUlOoPCO1l25W3ry/0Qb2PXx7Zjxe5n+RgouNWRXNMN/1TxaOUz
 /Xwc/eMWjvkoSoq4cVXqCCUdg6GdJV6HFN4b7kJ/QRpy+UaPIPBQ1wOBr2S0usPG/QC5
 v0lw5N7ovj9P7TFODLlec+0oxq/puHietyF38Vw1hNBhuSsrleduMtJP1MxVZntq5HPM
 VIwiLpSEIMLGj1xPNZumaUbP93eag1FM925H4YLzHxB2ddl79n8j0XxyLSFVWIGmAfsk
 5i+A==
X-Gm-Message-State: AOAM533eiQ8+xVv0BmBenu/5tE8YOJciFMmdskR2x7yPwqyXDm/kSdjF
 1u7Pmli83onQ07HwINs66JY65cmEhEexh1ZhA80=
X-Google-Smtp-Source: ABdhPJwgDx5LMy2m3J18TPbxt2kcmgAxw4ciyXhAjrnVD06IhqdW5LzaLZUQD7qoQZzP2FvPNBiFNTAm3AXSE+DpYvM=
X-Received: by 2002:a6b:6802:: with SMTP id d2mr3083380ioc.187.1637296166140; 
 Thu, 18 Nov 2021 20:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-10-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-10-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 14:29:00 +1000
Message-ID: <CAKmqyKPStV+BSYvAksq5VepecQveKinrwkNgoJpaJnLOykdg5A@mail.gmail.com>
Subject: Re: [PATCH v4 09/20] target/riscv: Alloc tcg global for
 cur_pm[mask|base]
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Fri, 19 Nov 2021 04:29:30 -0000

On Fri, Nov 12, 2021 at 2:03 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Replace the array of pm_mask/pm_base with scalar variables.
> Remove the cached array value in DisasContext.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 32 ++++++++------------------------
>  1 file changed, 8 insertions(+), 24 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index a6a73ced9e..6cb74c6355 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -37,8 +37,8 @@ static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
>  static TCGv load_res;
>  static TCGv load_val;
>  /* globals for PM CSRs */
> -static TCGv pm_mask[4];
> -static TCGv pm_base[4];
> +static TCGv pm_mask;
> +static TCGv pm_base;
>
>  #include "exec/gen-icount.h"
>
> @@ -88,8 +88,6 @@ typedef struct DisasContext {
>      TCGv temp[4];
>      /* PointerMasking extension */
>      bool pm_enabled;
> -    TCGv pm_mask;
> -    TCGv pm_base;
>  } DisasContext;
>
>  static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> @@ -297,8 +295,8 @@ static TCGv gen_pm_adjust_address(DisasContext *s, TCGv src)
>          return src;
>      } else {
>          temp = temp_new(s);
> -        tcg_gen_andc_tl(temp, src, s->pm_mask);
> -        tcg_gen_or_tl(temp, temp, s->pm_base);
> +        tcg_gen_andc_tl(temp, src, pm_mask);
> +        tcg_gen_or_tl(temp, temp, pm_base);
>          return temp;
>      }
>  }
> @@ -647,10 +645,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->ntemp = 0;
>      memset(ctx->temp, 0, sizeof(ctx->temp));
>      ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
> -    int priv = tb_flags & TB_FLAGS_PRIV_MMU_MASK;
> -    ctx->pm_mask = pm_mask[priv];
> -    ctx->pm_base = pm_base[priv];
> -
>      ctx->zero = tcg_constant_tl(0);
>  }
>
> @@ -763,19 +757,9 @@ void riscv_translate_init(void)
>                               "load_res");
>      load_val = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, load_val),
>                               "load_val");
> -#ifndef CONFIG_USER_ONLY
>      /* Assign PM CSRs to tcg globals */
> -    pm_mask[PRV_U] =
> -      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmmask), "upmmask");
> -    pm_base[PRV_U] =
> -      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmbase), "upmbase");
> -    pm_mask[PRV_S] =
> -      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmmask), "spmmask");
> -    pm_base[PRV_S] =
> -      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmbase), "spmbase");
> -    pm_mask[PRV_M] =
> -      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmmask), "mpmmask");
> -    pm_base[PRV_M] =
> -      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmbase), "mpmbase");
> -#endif
> +    pm_mask = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, cur_pmmask),
> +                                 "pmmask");
> +    pm_base = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, cur_pmbase),
> +                                 "pmbase");
>  }
> --
> 2.25.1
>
>

