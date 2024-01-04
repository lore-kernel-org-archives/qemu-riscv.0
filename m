Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24039C4706F
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 06:26:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLHB9-0003N2-NT; Thu, 04 Jan 2024 01:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLHB5-0003MZ-Hh; Thu, 04 Jan 2024 01:26:05 -0500
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLHB3-000642-OT; Thu, 04 Jan 2024 01:26:03 -0500
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-4b72f2bdbdaso73292e0c.3; 
 Wed, 03 Jan 2024 22:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704349560; x=1704954360; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4EoRsWmep9ZUhBK7C6hkmSK1KU3Y8H79CHj3ty1y04=;
 b=ezsRK6zyCdNdspR2HIopflZyEVmLUWCqY7SJZFgMwMzhehwz1jp7l2Yu0HzriwXwED
 bCGW2S8+TGdUqmjWStg3rmaKbAce7dWe4T6DZddjpkRY1j0OtJ76cFwWFVa1i70siDj2
 QJFdwyx251RLXTQLIaY3erbkY0NZE7wYqQ4y7+gA6pQWRtNN8tH6DliY5Q9joHLeZCf7
 S/0TzBT/4zv6lxrxngTydJqezhXF8UvSnC5tbljQvz82Jcqo6jo7B6UojcHILVBFICnZ
 Afh22f0PtZvMS5kAqFQYev1bJWpXWhWCBJqo2nPdNHxfgfYC2BSRO/qGkcMpQZf5wtsw
 6DlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704349560; x=1704954360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C4EoRsWmep9ZUhBK7C6hkmSK1KU3Y8H79CHj3ty1y04=;
 b=VxDWS3WaCdQEIe1EygSNwX1B019igla+6kWL89DFHCAUoz5lQ6syLPGhHIJujp7JUs
 8U4RQSIOObuWrH+DPHfkERxmvtajbbuvWf5JgMewbOt0AfUIP6tw2SG/JqFDO8RPmW8n
 1y6hMteM6wqqBMQ6vi4KBNp5Dvq+ygkKcRPcs3C/TTe5BQS+/GKFgas3FPPkPtc850wR
 Pruzwt8+BGjFk80osua71HcSHAZ13JUll99UE6IcqUF9jB50XcQvpgM0pVk4gWdqqU6K
 kg0qnC/BbHPUuwT99HIG1PLUpHyJJ7cjZmPb2dvGbBaopMd12bYO1Oy7du4/A0bUEoJ5
 3QsA==
X-Gm-Message-State: AOJu0YxC++Wcf+2nanqwxiPQ4h1uG48bk7dfALgOEVXvtih1Dag6TnUW
 m6AJH+8/q9Ic27hISYi6kDLP1D+ay+6EAhxqJNA=
X-Google-Smtp-Source: AGHT+IHYsdqv/B2oQ+kwD3Uq0kijipx121GgzuIW4fOHLpuMb36Prg9eCzfQNXbQ3P/tDqBXeONcYLRpzV0AeBQcqjA=
X-Received: by 2002:ac5:c913:0:b0:4b7:a95b:7b3 with SMTP id
 t19-20020ac5c913000000b004b7a95b07b3mr94190vkl.26.1704349558334; Wed, 03 Jan
 2024 22:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-15-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-15-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 16:25:32 +1000
Message-ID: <CAKmqyKOg1+LaebpjVy6-LmATat=o_aPV=6ensvdzKoxE5Po0qA@mail.gmail.com>
Subject: Re: [PATCH v13 14/26] target/riscv/tcg: add hash table insert helpers
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Dec 18, 2023 at 10:57=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Previous patches added several g_hash_table_insert() patterns. Add two
> helpers, one for each user hash, to make the code cleaner.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index f2e0ce0f3d..01d2cc9f94 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -42,6 +42,18 @@ static bool cpu_cfg_ext_is_user_set(uint32_t ext_offse=
t)
>                                   GUINT_TO_POINTER(ext_offset));
>  }
>
> +static void cpu_cfg_ext_add_user_opt(uint32_t ext_offset, bool value)
> +{
> +    g_hash_table_insert(multi_ext_user_opts, GUINT_TO_POINTER(ext_offset=
),
> +                        (gpointer)value);
> +}
> +
> +static void cpu_misa_ext_add_user_opt(uint32_t bit, bool value)
> +{
> +    g_hash_table_insert(misa_ext_user_opts, GUINT_TO_POINTER(bit),
> +                        (gpointer)value);
> +}
> +
>  static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
>                                       bool enabled)
>  {
> @@ -817,9 +829,7 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor=
 *v, const char *name,
>          return;
>      }
>
> -    g_hash_table_insert(misa_ext_user_opts,
> -                        GUINT_TO_POINTER(misa_bit),
> -                        (gpointer)value);
> +    cpu_misa_ext_add_user_opt(misa_bit, value);
>
>      prev_val =3D env->misa_ext & misa_bit;
>
> @@ -956,9 +966,7 @@ static void cpu_set_profile(Object *obj, Visitor *v, =
const char *name,
>              continue;
>          }
>
> -        g_hash_table_insert(misa_ext_user_opts,
> -                            GUINT_TO_POINTER(bit),
> -                            (gpointer)value);
> +        cpu_misa_ext_add_user_opt(bit, profile->enabled);
>          riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
>      }
>
> @@ -973,9 +981,7 @@ static void cpu_set_profile(Object *obj, Visitor *v, =
const char *name,
>              cpu_bump_multi_ext_priv_ver(&cpu->env, ext_offset);
>          }
>
> -        g_hash_table_insert(multi_ext_user_opts,
> -                            GUINT_TO_POINTER(ext_offset),
> -                            (gpointer)profile->enabled);
> +        cpu_cfg_ext_add_user_opt(ext_offset, profile->enabled);
>          isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
>      }
>  }
> @@ -1038,9 +1044,7 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visi=
tor *v, const char *name,
>                      multi_ext_cfg->name, lower);
>      }
>
> -    g_hash_table_insert(multi_ext_user_opts,
> -                        GUINT_TO_POINTER(multi_ext_cfg->offset),
> -                        (gpointer)value);
> +    cpu_cfg_ext_add_user_opt(multi_ext_cfg->offset, value);
>
>      prev_val =3D isa_ext_is_enabled(cpu, multi_ext_cfg->offset);
>
> --
> 2.43.0
>
>

