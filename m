Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBWRW-0005ZU-D1
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 02:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mBWRS-0005Vl-Qm; Thu, 05 Aug 2021 02:01:18 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:44962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mBWRQ-0003gt-UL; Thu, 05 Aug 2021 02:01:18 -0400
Received: by mail-io1-xd34.google.com with SMTP id d22so5301868ioy.11;
 Wed, 04 Aug 2021 23:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v4TBMBNsV8oOnSLEPWhyeAX1uHXJv3Tx1/t3C/D7bC4=;
 b=Ui4a+LMWaRdqGNgu8Nd+K0CSrQ2Ocv0zJg6fY6bjPeAovYMrNn7+YhSBdv4sZ9L8rh
 3MZkBkd2CpULpAympeVMy+wGBVQCEoijOrdagNp5hSW1CqHIWIVsrXfvJFhcXo3sk9UD
 KoKiRroj4/fUsORmyGg4qsGGYlaJlns8oho1/2mlzeqd3bBiCTxy9aa8D1ZFX9i44l25
 i34yZsIlIywMiUbT4cKXge/fdw4zWwhNaJlwhUAXhNooszk6ecYfQa2onulXSLlH++li
 Y88sDzgY4fxMzOC8kkGNuhvoOrO+HJ1AUWccIhj5fOToah6u4PBYElelAiTBYn+HW7mn
 FgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4TBMBNsV8oOnSLEPWhyeAX1uHXJv3Tx1/t3C/D7bC4=;
 b=g7W1u6xUY7Ft4KLdgQy4A9Cybe7NVAb8hdKAH9T5GwQujqwSW+jS7lv9fGNzR8lLor
 PZTOo9acaj5OU4EPOHEGKgLDKOHb1GO/jSssn/0i955oJIAJciuisCadYCZcFOszuMPe
 bK06ZJHpu9iPC95Jhpl+2+PDM33b9CJ1NvfV4+/1XDuNoWSmd1aBsAS7y9mSkKRYBjkL
 l4vuv6UG9xgTxNWZ4cO9vEhgjH84V897cm+DFTkCLdx63tThg/pClbdfjmsjlv4FhaLx
 yeGcGkLATYrJMoJVc02dfcZ+40VAxJaSmM9kdfeqyu1MFgXUq/7jlQqXpfN//Uz2r8u6
 frZQ==
X-Gm-Message-State: AOAM533Q59Xl3jtnTwxEEoPBaGCt31sYPG6piLEP7X4aXKdxngagIe+C
 as6M9NaaWdy7YDcXKyo0Bu+ltVusoORV1N7KRys=
X-Google-Smtp-Source: ABdhPJx7M6kU9PB73mXeJ47x6KnOmJDyTtg9fg9Kgl03RjM4sN4daeVq6cBNBXesSS55ZDlcaT/CSf0JSS6a+smV5ZQ=
X-Received: by 2002:a5d:8541:: with SMTP id b1mr22263ios.105.1628143274322;
 Wed, 04 Aug 2021 23:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-2-zhiwei_liu@c-sky.com>
In-Reply-To: <20210805025312.15720-2-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 Aug 2021 16:00:48 +1000
Message-ID: <CAKmqyKPz7Ln6f09XCgzuFqkfPJ4CWt6od8XvL+x9bUNGekpsOw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/13] target/riscv: Add UXL to tb flags
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Thu, 05 Aug 2021 06:01:20 -0000

On Thu, Aug 5, 2021 at 12:55 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> For 32-bit applications run on 64-bit cpu, it may share some code
> with other 64-bit applictions. Thus we should distinguish the translated
> cache of the share code with a tb flag.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h       | 15 +++++++++++++++
>  target/riscv/translate.c |  3 +++
>  2 files changed, 18 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf1c899c00..2b3ba21a78 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -394,9 +394,20 @@ FIELD(TB_FLAGS, SEW, 5, 3)
>  FIELD(TB_FLAGS, VILL, 8, 1)
>  /* Is a Hypervisor instruction load/store allowed? */
>  FIELD(TB_FLAGS, HLSX, 9, 1)
> +FIELD(TB_FLAGS, UXL, 10, 2)
>
>  bool riscv_cpu_is_32bit(CPURISCVState *env);
>
> +static inline bool riscv_cpu_is_uxl32(CPURISCVState *env)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    return (get_field(env->mstatus, MSTATUS64_UXL) == 1) &&
> +           !riscv_cpu_is_32bit(env) &&
> +           (env->priv == PRV_U);
> +#endif
> +    return false;
> +}
> +
>  /*
>   * A simplification for VLMAX
>   * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
> @@ -451,6 +462,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>              flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
>          }
>      }
> +    if (riscv_cpu_is_uxl32(env)) {
> +        flags = FIELD_DP32(flags, TB_FLAGS, UXL,
> +                           get_field(env->mstatus, MSTATUS64_UXL));
> +    }
>  #endif
>
>      *pflags = flags;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 076f28b9c1..ac4a545da8 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -67,6 +67,8 @@ typedef struct DisasContext {
>      CPUState *cs;
>      TCGv zero;
>      TCGv sink;
> +    /* UXLEN is 32 bit for 64-bit CPU */
> +    bool uxl32;
>  } DisasContext;
>
>  static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> @@ -912,6 +914,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>      ctx->cs = cs;
> +    ctx->uxl32 = FIELD_EX32(tb_flags, TB_FLAGS, UXL) == 1;
>  }
>
>  static void riscv_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
> --
> 2.17.1
>
>

