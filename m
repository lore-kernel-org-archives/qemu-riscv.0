Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A85EB64DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:02:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvaA-0000Rk-LR; Tue, 18 Jul 2023 21:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLva5-0000QR-IC; Tue, 18 Jul 2023 21:02:17 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLva3-0007Rq-4A; Tue, 18 Jul 2023 21:02:16 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-4435fa903f2so1628453137.1; 
 Tue, 18 Jul 2023 18:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689728532; x=1692320532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VVKG9SUW5L0+uHuiYyDwY7RmvI+FSIzZCkGDUS3CpMs=;
 b=H4j6UW17BjN6eqcJXFwhFQ9Dnw3t+77TyNjpsp7qkfITmPokTzO3SjPXiB8X84vzSA
 B859uaK/P9WPl4YHuVA8vIjyFE8qHBlnNT3pudtzE0lCZM/aZCJ9Itx85fiqftnG9r4x
 kAF7ggTJbYTj/7ivPrTlBD02TA9ncEt2sOiHKgfV47nih8RvBsKrcoERcSFhYPGiHaW0
 M1u6fCaKmWrlWw5LOUMpsNthLBbpuZuMUKLxI1YVFuRQN2AcHM1F0Zj9tWw5tkN9d4Fx
 ga3MIrURa1yR6cKSy2J4DDL4RC0MESEDZSrUJWAF/sj+Plo10kxeKzcwKMPSU8Enqprs
 E8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689728532; x=1692320532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VVKG9SUW5L0+uHuiYyDwY7RmvI+FSIzZCkGDUS3CpMs=;
 b=l/IpeuhRL8AWVL8qeDVaTtp899OE6ar4ABpdzIUkDNI72BxSzleaLN5VCJDNsZv9IS
 JVqHoEQ7jrnwLiyMuEZD91hruBlpgScN+Hlf44SuFwlFghobiU8jVBDTdKqx+9Dl7AM7
 dvQd+DWlWCsnj22OirbMS2Qj6fIRz4GGvgBwcdu5+w846KT50dso/HaoxeiKy8wpcjXk
 JmswEIrFkfjVrxDrt4KesllgLVDyvqW8+gXo5pmdjnV4l8813QuUDFuO9XBesOK6r0Ir
 zt4iUM1WFOnA/zaghDIekMz1d7Jg3DmMDfjXGxQpgL3Qj0vxDLcRHvKzbhg1QZo0jDCE
 0bpg==
X-Gm-Message-State: ABy/qLabVoAWO/n++o6+3jrG8DxNTkeeS8dlPDgVLpyCnjoNFDRRxdpo
 TUTMVcwAiLpwfHPYMFQa1UlnWtR8gjRh+2h1PrK0Euc9DLVIzA==
X-Google-Smtp-Source: APBJJlE4mHZgC8cPfr9E2I3PfqnWv5PEZ3OkXP1XZzpAzxMWD34KKRGGHpxuuWNzaWXGlUhOuQUIzi20tB7bTCN66M0=
X-Received: by 2002:a67:f745:0:b0:443:621e:d138 with SMTP id
 w5-20020a67f745000000b00443621ed138mr518764vso.5.1689728531913; Tue, 18 Jul
 2023 18:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230711121453.59138-1-philmd@linaro.org>
 <20230711121453.59138-10-philmd@linaro.org>
In-Reply-To: <20230711121453.59138-10-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:01:46 +1000
Message-ID: <CAKmqyKN_POScS0Yt4nQ05=DwjcisyKcTR-d_BD8Kp4FD5i=Ytg@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] target/riscv: Expose some 'trigger' prototypes
 from debug.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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

On Tue, Jul 11, 2023 at 10:16=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> We want to extract TCG-specific code from debug.c, but some
> functions call get_trigger_type() / do_trigger_action().
> Expose these prototypes in "debug.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/debug.h | 4 ++++
>  target/riscv/debug.c | 5 ++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index c471748d5a..65cd45b8f3 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -147,4 +147,8 @@ void riscv_trigger_init(CPURISCVState *env);
>
>  bool riscv_itrigger_enabled(CPURISCVState *env);
>  void riscv_itrigger_update_priv(CPURISCVState *env);
> +
> +target_ulong get_trigger_type(CPURISCVState *env, target_ulong trigger_i=
ndex);
> +void do_trigger_action(CPURISCVState *env, target_ulong trigger_index);
> +
>  #endif /* RISCV_DEBUG_H */
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 75ee1c4971..5676f2c57e 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -88,8 +88,7 @@ static inline target_ulong extract_trigger_type(CPURISC=
VState *env,
>      }
>  }
>
> -static inline target_ulong get_trigger_type(CPURISCVState *env,
> -                                            target_ulong trigger_index)
> +target_ulong get_trigger_type(CPURISCVState *env, target_ulong trigger_i=
ndex)
>  {
>      return extract_trigger_type(env, env->tdata1[trigger_index]);
>  }
> @@ -217,7 +216,7 @@ static inline void warn_always_zero_bit(target_ulong =
val, target_ulong mask,
>      }
>  }
>
> -static void do_trigger_action(CPURISCVState *env, target_ulong trigger_i=
ndex)
> +void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
>  {
>      trigger_action_t action =3D get_trigger_action(env, trigger_index);
>
> --
> 2.38.1
>
>

