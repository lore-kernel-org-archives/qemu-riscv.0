Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B0DCD98E9
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 03:04:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqPWe-0003t6-7b; Tue, 10 Oct 2023 23:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPWc-0003sK-9U; Tue, 10 Oct 2023 23:04:42 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPWZ-0001Tk-RP; Tue, 10 Oct 2023 23:04:42 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-49abb53648aso2256255e0c.0; 
 Tue, 10 Oct 2023 20:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696993478; x=1697598278; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gSsgdr9Lmjs0p+7xsn8NBZs9y20syKczkbvXslRBmRE=;
 b=lcKobhiU4grBpOzweTjB4+JYIrP2CE1YTNqMtBl26CQpndhQpMfz4Kfo9KByONZSaF
 JZX/b1pClL8k87DbgJXJDxYbi3/g+Cus+I6ZgQZEUBAaz5D2IbL9Ogzd7zeoMdSZkyj3
 ITrTL4bW7Tale+kBYaaBy8nL8ssYSJNtGaH1c+CTC0D7qAM7owwIEYK7qN93iV72Ah0c
 dZqTR2n1jF2fuTxhNzZq8JVqH5QMH+fnM7NB7t4M4Jp0RVF5iJwyPVRWl9Opvk74SL94
 9bsJu+Y4jqN7HBVRiMXGb4XOG1JGpFSW61bAQzl713ffMPUbtZ++8pKMScnZ168yKg2P
 +ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696993478; x=1697598278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSsgdr9Lmjs0p+7xsn8NBZs9y20syKczkbvXslRBmRE=;
 b=gqajLFVjzNgRdAxLA2AJLt5mkfEVoMASOd229XwqpqPrHGicYNkmt7hF2vaW8Rd/k7
 nGgSHreK6MNI1WqwRvx38Rzwozugy1Sgd567mzJ3Oq3uzfXww4QHJsFRa0ns98s9eZ31
 iJ5JnCFLAnm7uk6cq/mKZYU0uKfHJn4e1EP9UisrURTyY785bR9qtjGqPLVyr4hup2S5
 InNp7j3gj8SjEjcboiIxDsMxa8kAdmG/dZIw5BZbm8b2AW8dp8V8SuLLnoACOqhH7PYo
 nlAynuppfwCikuXkpYFBvntf6wYglDrsXOduLdeQzdZW/l6giFl9ZJuPm5kgBk4iFlB6
 x7iQ==
X-Gm-Message-State: AOJu0Yx//wyRAf1QAamZtoL0B8G0/rw4Bmkj8QysGiBuKxnmUlGrggNY
 JGli38EnMjZFccRFbKLjQWNui3HuPHRf2X10aF4=
X-Google-Smtp-Source: AGHT+IEQr1maleGYH48cVpft5csLf5hzmIq+3tDsauD+mR+1ZVJ5iWCXAIzRY8s61xC8qnub/TKvgt397tzEn1TjcmY=
X-Received: by 2002:a1f:e143:0:b0:4a0:6fa5:b08a with SMTP id
 y64-20020a1fe143000000b004a06fa5b08amr5302796vkg.8.1696993478293; Tue, 10 Oct
 2023 20:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
 <20231006132134.1135297-9-dbarboza@ventanamicro.com>
In-Reply-To: <20231006132134.1135297-9-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 13:04:11 +1000
Message-ID: <CAKmqyKMEsEUcYvJUowE7ycjW+ZF4geD2JpndEVGnj6P9LAL7mA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] target/riscv/tcg: add riscv_cpu_write_misa_bit()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Oct 7, 2023 at 12:29=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We have two instances of the setting/clearing a MISA bit from
> env->misa_ext and env->misa_ext_mask pattern. And the next patch will
> end up adding one more.
>
> Create a helper to avoid code repetition.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 44 ++++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 58de4428a9..b1e778913c 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -42,6 +42,20 @@ static bool cpu_cfg_ext_is_user_set(uint32_t ext_offse=
t)
>                                   GUINT_TO_POINTER(ext_offset));
>  }
>
> +static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
> +                                     bool enabled)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    if (enabled) {
> +        env->misa_ext |=3D bit;
> +        env->misa_ext_mask |=3D bit;
> +    } else {
> +        env->misa_ext &=3D ~bit;
> +        env->misa_ext_mask &=3D ~bit;
> +    }
> +}
> +
>  static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>                                            const TranslationBlock *tb)
>  {
> @@ -700,20 +714,14 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visit=
or *v, const char *name,
>          return;
>      }
>
> -    if (value) {
> -        if (!generic_cpu) {
> -            g_autofree char *cpuname =3D riscv_cpu_get_name(cpu);
> -            error_setg(errp, "'%s' CPU does not allow enabling extension=
s",
> -                       cpuname);
> -            return;
> -        }
> -
> -        env->misa_ext |=3D misa_bit;
> -        env->misa_ext_mask |=3D misa_bit;
> -    } else {
> -        env->misa_ext &=3D ~misa_bit;
> -        env->misa_ext_mask &=3D ~misa_bit;
> +    if (value && !generic_cpu) {
> +        g_autofree char *cpuname =3D riscv_cpu_get_name(cpu);
> +        error_setg(errp, "'%s' CPU does not allow enabling extensions",
> +                   cpuname);
> +        return;
>      }
> +
> +    riscv_cpu_write_misa_bit(cpu, misa_bit, value);
>  }
>
>  static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *na=
me,
> @@ -757,7 +765,6 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>   */
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>  {
> -    CPURISCVState *env =3D &RISCV_CPU(cpu_obj)->env;
>      bool use_def_vals =3D riscv_cpu_is_generic(cpu_obj);
>      int i;
>
> @@ -778,13 +785,8 @@ static void riscv_cpu_add_misa_properties(Object *cp=
u_obj)
>                              NULL, (void *)misa_cfg);
>          object_property_set_description(cpu_obj, name, desc);
>          if (use_def_vals) {
> -            if (misa_cfg->enabled) {
> -                env->misa_ext |=3D bit;
> -                env->misa_ext_mask |=3D bit;
> -            } else {
> -                env->misa_ext &=3D ~bit;
> -                env->misa_ext_mask &=3D ~bit;
> -            }
> +            riscv_cpu_write_misa_bit(RISCV_CPU(cpu_obj), bit,
> +                                     misa_cfg->enabled);
>          }
>      }
>  }
> --
> 2.41.0
>
>

