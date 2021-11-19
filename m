Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnvsE-0002wi-QR
	for mharc-qemu-riscv@gnu.org; Thu, 18 Nov 2021 23:51:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnvsD-0002vu-2y; Thu, 18 Nov 2021 23:51:41 -0500
Received: from [2607:f8b0:4864:20::d29] (port=42966
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnvsA-0002HP-Qk; Thu, 18 Nov 2021 23:51:40 -0500
Received: by mail-io1-xd29.google.com with SMTP id x10so11246754ioj.9;
 Thu, 18 Nov 2021 20:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7b8AlAOqtxVq3rNi5M5FG5xeYJynJCxL/jtM1b3n/3w=;
 b=LoZuk3+ELx3FKgegmtUNNm8XdKcAF0oudLr/jE3ac6UfXrA0lwXlsbs4Zhat4vMx5v
 gydJFPgbzh2IYk9HctRvbdoVSanwx6s8+KZWx23pHzP6Y1T+ksZNerS9mI9mPuyI9yqi
 /owRvivWlNZoG9LuiECcmxqjBb93VJFm7XGahOtlVpXRtYUM0gYGIbyOBRxR6njYrOQh
 PeVGVLa1cDWZXmb8Iy82ElAkV/xSJKhM2TimLgqvjn7t83FYt7TQA+p7RimCSFbwu54k
 aFeUhpOcIhECvV8l8zhhYJDeGR38u6cR6JdLGdemdDlydUWDcf1db99YWyt3msUKinV5
 Ha9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7b8AlAOqtxVq3rNi5M5FG5xeYJynJCxL/jtM1b3n/3w=;
 b=eczZDP44SJEUrqAP6EcqBBfp2scIx0THqYqV/0jxv/dKkGHkQw66pcfyQK527ZQk0H
 8n/PaIuwJ7ZM0Y5re/ncohqMNemki3fzl1gNF8xpd4QJEbEw3pzeMuJRMwsTIaa6MZO3
 jx3zMpWbeXjXNRF7dj3QL5fSqVSUopgk1DEZo2/W7xrL2yeQz/7Fvy7LaiOUZIHeXba4
 +pu1FV4e1VE+pRFA4TAN8aPlaLAOK2aNbt5fWzj6wHzv5efjat+rU/MLPkjw4KCKECxd
 evq9cPP3H9IzqVPA1SsLI1mAYMG7GOSOYbNzJelXJxRSKQsrPs2phQc4jdjw09OgNYow
 hs3g==
X-Gm-Message-State: AOAM530L1wwvvyEKkVohdtQWR5rCDV8pQS5RtZRiDWrp2XI2FyU4xsOH
 Q7mIoqBq6ZbJpgmBifQcgqsFzT8PXZ3B3ZUmxa8=
X-Google-Smtp-Source: ABdhPJw8Zv7YN3Pcdm5lVWrUyCBCOCLdZhkbveCj+h/M4gWbtHkCrlYg43yvdJLpNLz+qacEeaXCG5LDEUWL31v3eUI=
X-Received: by 2002:a02:9f0c:: with SMTP id z12mr24888401jal.117.1637297497393; 
 Thu, 18 Nov 2021 20:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-12-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-12-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 14:51:10 +1000
Message-ID: <CAKmqyKN9MoJtfxTay2bo2n=EsQ5ZHX1MuM3NA0UHn1fzGxQ8VQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/20] target/riscv: Split pm_enabled into mask and base
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Fri, 19 Nov 2021 04:51:41 -0000

On Fri, Nov 12, 2021 at 2:05 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Use cached cur_pmmask and cur_pmbase to infer the
> current PM mode.
>
> This may decrease the TCG IR by one when pm_enabled
> is true and pm_base_enabled is false.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        |  3 ++-
>  target/riscv/cpu_helper.c | 25 +++++++------------------
>  target/riscv/translate.c  | 12 ++++++++----
>  3 files changed, 17 insertions(+), 23 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fa5a6ba1c8..9fba876e08 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -411,7 +411,8 @@ FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
>  /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
>  FIELD(TB_FLAGS, XL, 13, 2)
>  /* If PointerMasking should be applied */
> -FIELD(TB_FLAGS, PM_ENABLED, 15, 1)
> +FIELD(TB_FLAGS, PM_MASK_ENABLED, 15, 1)
> +FIELD(TB_FLAGS, PM_BASE_ENABLED, 16, 1)
>
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 8320f56d9f..a40ed6d748 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -108,26 +108,15 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>          flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
>                             get_field(env->mstatus_hs, MSTATUS_FS));
>      }
> -    if (riscv_has_ext(env, RVJ)) {
> -        int priv = flags & TB_FLAGS_PRIV_MMU_MASK;
> -        bool pm_enabled = false;
> -        switch (priv) {
> -        case PRV_U:
> -            pm_enabled = env->mmte & U_PM_ENABLE;
> -            break;
> -        case PRV_S:
> -            pm_enabled = env->mmte & S_PM_ENABLE;
> -            break;
> -        case PRV_M:
> -            pm_enabled = env->mmte & M_PM_ENABLE;
> -            break;
> -        default:
> -            g_assert_not_reached();
> -        }
> -        flags = FIELD_DP32(flags, TB_FLAGS, PM_ENABLED, pm_enabled);
> -    }
>  #endif
>
> +    if (env->cur_pmmask < (xl == MXL_RV32 ? UINT32_MAX : UINT64_MAX)) {
> +        flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
> +    }
> +    if (env->cur_pmbase != 0) {
> +        flags = FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
> +    }
> +
>      flags = FIELD_DP32(flags, TB_FLAGS, XL, xl);
>
>      *pflags = flags;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index fd75f7c4bc..10c16e759d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -87,7 +87,8 @@ typedef struct DisasContext {
>      /* Space for 3 operands plus 1 extra for address computation. */
>      TCGv temp[4];
>      /* PointerMasking extension */
> -    bool pm_enabled;
> +    bool pm_mask_enabled;
> +    bool pm_base_enabled;
>  } DisasContext;
>
>  static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> @@ -291,12 +292,14 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>      TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
>
>      tcg_gen_addi_tl(addr, src1, imm);
> -    if (ctx->pm_enabled) {
> +    if (ctx->pm_mask_enabled) {
>          tcg_gen_and_tl(addr, addr, pm_mask);
> -        tcg_gen_or_tl(addr, addr, pm_base);
>      } else if (get_xl(ctx) == MXL_RV32) {
>          tcg_gen_ext32u_tl(addr, addr);
>      }
> +    if (ctx->pm_base_enabled) {
> +        tcg_gen_or_tl(addr, addr, pm_base);
> +    }
>      return addr;
>  }
>
> @@ -643,7 +646,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->cs = cs;
>      ctx->ntemp = 0;
>      memset(ctx->temp, 0, sizeof(ctx->temp));
> -    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
> +    ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
> +    ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>      ctx->zero = tcg_constant_tl(0);
>  }
>
> --
> 2.25.1
>
>

