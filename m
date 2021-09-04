Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMVvW-0002YI-9S
	for mharc-qemu-riscv@gnu.org; Sat, 04 Sep 2021 09:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMVvO-0002Uu-0R; Sat, 04 Sep 2021 09:41:38 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:45014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMVvL-0002d1-GR; Sat, 04 Sep 2021 09:41:37 -0400
Received: by mail-yb1-xb32.google.com with SMTP id q70so3900395ybg.11;
 Sat, 04 Sep 2021 06:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oKR2zV9uY+fJ8PxsOOwy2j1nqXog8QWnPQ3CnhNUSKI=;
 b=Kml1fhSMLF2UWb06i0aaACO2uCWMUHVppaOpZJuv4hB0WWsk9jO8AjZK7Tg92ss27v
 BFugzS5fTur43PmH13WJjekphTP/azTD7M+NqF57VBKbAppR9++tz5QZbA8b23mUSASh
 hSFXbyq61+j9GNbkTkHr72gGaTKc7Tj6Ms5qOR9lfCdUiVt4DWao/T9IGHEaUBGtzcTI
 htJmiUVmsddmpinlzNyo0fM4fkaxUUFgk4U7p87uxTD8rz3etzRMUE8Zz4tXrUAgYBWG
 ZoTIb8i/WTofAtExGsROGtPpZH6qCIU/NdQRo7D8f0EaIqpKLfRgurZ+JjipbX980lMD
 NTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oKR2zV9uY+fJ8PxsOOwy2j1nqXog8QWnPQ3CnhNUSKI=;
 b=G0D7X7GIa+mSmGQlVOjc7VLRRLKUIqK4kg7cNhAjwjViYRrovjKDOI+rK2WKuj3pWF
 NmZ5rC/EkyOk1iYyKcDHYFck+uUfOCkC9z0kYLvnXIyO9kN2AqDMKRlIcXPezvM4UyB6
 vHUt9hnZiSNR4oG7IhtXKzocrpipaUjd1hJayPyNDyo9aFPwCQuB32Gf/ocL11zAJN+R
 tihnImR9B/PVRnoWC933UKmJfv52eyAyKvNOBf7vk4kAIq+A0stUXLRd3q4RDypF2fTz
 Lo9A0O4JimYb9dINYScxadHwxCzvEsuOzIPU4we0GYjxBZiZ1coBgM0tjO/Ke/QkGNR2
 pY8A==
X-Gm-Message-State: AOAM532UE9Rl1iw48VDj8i12U4f3yjh+3mDTWg+lQQEZZnqMGt2gA3FI
 CTs5culHpwY7BSUxlWcXbLfaP+HW0pWPa6gZEUY=
X-Google-Smtp-Source: ABdhPJwrLgkJa1v6gGvWRylDsEhuXFpLxGzAMP5Smbmn/WU2hKaEzPm+XdKtgDJhRI9CKqYwvoRbT0thQWejMjXxAS8=
X-Received: by 2002:a25:2e42:: with SMTP id b2mr5064956ybn.313.1630762892986; 
 Sat, 04 Sep 2021 06:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630624983.git.alistair.francis@wdc.com>
 <289f8d59cf883fec5764cb0cea8da4430b6fd6da.1630624983.git.alistair.francis@wdc.com>
In-Reply-To: <289f8d59cf883fec5764cb0cea8da4430b6fd6da.1630624983.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 4 Sep 2021 21:41:22 +0800
Message-ID: <CAEUhbmXA76pF30x6WR0zXygPVg4HH1GbnK9Lqhbp07UeysPxNA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] target/riscv: Implement the stval/mtval illegal
 instruction
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 04 Sep 2021 13:41:40 -0000

On Fri, Sep 3, 2021 at 7:23 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The stval and mtval registers can optionally contain the faulting
> instruction on an illegal instruction exception. This patch adds support
> for setting the stval and mtval registers based on the CPU feature.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  5 ++++-
>  target/riscv/cpu_helper.c |  9 +++++++++
>  target/riscv/translate.c  | 33 +++++++++++++++++++--------------
>  3 files changed, 32 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf1c899c00..6d41a16ae3 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -77,7 +77,8 @@ enum {
>      RISCV_FEATURE_MMU,
>      RISCV_FEATURE_PMP,
>      RISCV_FEATURE_EPMP,
> -    RISCV_FEATURE_MISA
> +    RISCV_FEATURE_MISA,
> +    RISCV_FEATURE_MTVAL_INST,
>  };
>
>  #define PRIV_VERSION_1_10_0 0x00011000
> @@ -130,6 +131,8 @@ struct CPURISCVState {
>      target_ulong frm;
>
>      target_ulong badaddr;
> +    target_ulong bins;
> +
>      target_ulong guest_phys_fault_addr;
>
>      target_ulong priv_ver;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 968cb8046f..42edd71c1e 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -967,6 +967,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>              write_tval  = true;
>              tval = env->badaddr;
>              break;
> +        case RISCV_EXCP_ILLEGAL_INST:
> +            if (riscv_feature(env, RISCV_FEATURE_MTVAL_INST)) {
> +                /* The stval/mtval register can optionally also be used to

nits: incorrect multi-line comment format

> +                 * return the faulting instruction bits on an illegal
> +                 * instruction exception.
> +                 */
> +                tval = env->bins;
> +            }
> +            break;
>          default:
>              break;
>          }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index e356fc6c46..4221d8e2d5 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -173,8 +173,27 @@ static void lookup_and_goto_ptr(DisasContext *ctx)
>      }
>  }
>
> +/*
> + * Wrappers for getting reg values.
> + *
> + * The $zero register does not have cpu_gpr[0] allocated -- we supply the
> + * constant zero as a source, and an uninitialized sink as destination.
> + *
> + * Further, we may provide an extension for word operations.
> + */
> +static TCGv temp_new(DisasContext *ctx)
> +{
> +    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
> +    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
> +}
> +
>  static void gen_exception_illegal(DisasContext *ctx)
>  {
> +    TCGv tmp = temp_new(ctx);
> +
> +    tcg_gen_movi_tl(tmp, ctx->opcode);

ctx->opcode is not initialized anywhere.

> +    tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, bins));
> +
>      generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
>  }
>
> @@ -195,20 +214,6 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>      }
>  }
>
> -/*
> - * Wrappers for getting reg values.
> - *
> - * The $zero register does not have cpu_gpr[0] allocated -- we supply the
> - * constant zero as a source, and an uninitialized sink as destination.
> - *
> - * Further, we may provide an extension for word operations.
> - */
> -static TCGv temp_new(DisasContext *ctx)
> -{
> -    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
> -    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
> -}
> -
>  static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
>  {
>      TCGv t;
> --

Regards,
Bin

