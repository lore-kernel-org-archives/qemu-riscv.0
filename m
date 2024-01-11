Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47516C4707B
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 23:14:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO4Fz-0002LD-0U; Thu, 11 Jan 2024 18:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO4Fx-0002KK-LY; Thu, 11 Jan 2024 18:14:37 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO4Fv-00085P-Rr; Thu, 11 Jan 2024 18:14:37 -0500
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-467ed334c40so853225137.0; 
 Thu, 11 Jan 2024 15:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705014874; x=1705619674; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQcoTyVLWsapadMoinlWwOIjl3zW0urWVkrUEa6w+to=;
 b=WaCdjzJ2L+ITiTEIfgzDm7L8VxY/oHK+KGSSxRqkforeXF/Ykkau1V/rO5IVI8XD9m
 7ujLHW2r6K514ucqBCR2NfGCv7Sn+rC0HxamMeAps+WW1KOvRvd7sDeDuFQPboGVuosB
 UyxQwmvH0aAifdvYdS7zI6lgytFXQEMd//zwrt9TJYeP3nGl2TTmZYdiKkQSOAMowJlz
 llQoKfs6EkhCejz/tUb+HXczdWm7hCPcVWsFQsc1WCMeuMjbY9aAeDzQA95n2JaLlZc5
 d4+4JpMaAIfKojYNWdd0jehKd8ft0w+Lt/BK9Ndd6as4R10yIcGsGow3F4Gkwv2LNh3g
 ppGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705014874; x=1705619674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQcoTyVLWsapadMoinlWwOIjl3zW0urWVkrUEa6w+to=;
 b=wOWNJfxuiiL1O5W8XVS0zo9GHq8Wlk5quUy+ZxEBbgZBx2fvlxUOF5yQNatQw6ZWMA
 MnG6l3VQelUQE/XEVQeVf+y8ikO5sNJmuex/WTZJMDKafJOaknFiMES8NKsyoPOcqQTU
 NPtB2NMRyjCePwbHJd2FD60dtsUvuHrvSeW3FE+vL1pjLgcV0KTxlXaRr91yQ1wH1YoB
 ySGa/yPO4SyVm1ABgwsDhemgUS4fXfK2ZT1MUgA6B5uPLRqO1Zpd+7R34unn8lT4oEaA
 XdOMRdBpsWUHXiniRr/Y+3WIganQBHAACBib3OQrxbPeEEdtWCmzkjSPzk8DbAzFPzTj
 ZIwg==
X-Gm-Message-State: AOJu0YxssO1Rczg8t2t3BljYZaO8kSrH9dKzCY7jYGD/6s5FPXAd76AT
 EdFyw4BPr7MB9MWZ5cGmMSCBpAJtwYHjz+VRu5s=
X-Google-Smtp-Source: AGHT+IH3VJfPex9yfPv2YvGU0oZbQ/9CrcxHDt/6OJky8VqJU3hsyX7njSyvFNp6KPnlW/quGb4Kz6R6FaeKVW2v0Ag=
X-Received: by 2002:a67:fa43:0:b0:468:1368:7af4 with SMTP id
 j3-20020a67fa43000000b0046813687af4mr536245vsq.0.1705014873914; Thu, 11 Jan
 2024 15:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20240111120221.35072-1-philmd@linaro.org>
 <20240111120221.35072-6-philmd@linaro.org>
In-Reply-To: <20240111120221.35072-6-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 09:14:07 +1000
Message-ID: <CAKmqyKOvj8F83G0w7eXzr6U=WVy6BPiEOQmSS+bw5kUdd0E-pQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] target/riscv: Rename tcg_cpu_FOO() to include 'riscv'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org, 
 Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, 
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Laurent Vivier <laurent@vivier.eu>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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

On Thu, Jan 11, 2024 at 11:05=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> The tcg_cpu_FOO() names are riscv specific, so rename
> them as riscv_tcg_cpu_FOO() (as other names in this file)
> to ease navigating the code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 14133ff665..994ca1cdf9 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -929,7 +929,7 @@ static bool riscv_cpu_is_vendor(Object *cpu_obj)
>   *   -> cpu_exec_realizefn()
>   *      -> tcg_cpu_realize() (via accel_cpu_common_realize())
>   */
> -static bool tcg_cpu_realize(CPUState *cs, Error **errp)
> +static bool riscv_tcg_cpu_realize(CPUState *cs, Error **errp)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      Error *local_err =3D NULL;
> @@ -1372,7 +1372,7 @@ static bool riscv_cpu_has_max_extensions(Object *cp=
u_obj)
>      return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) !=3D NULL;
>  }
>
> -static void tcg_cpu_instance_init(CPUState *cs)
> +static void riscv_tcg_cpu_instance_init(CPUState *cs)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      Object *obj =3D OBJECT(cpu);
> @@ -1386,7 +1386,7 @@ static void tcg_cpu_instance_init(CPUState *cs)
>      }
>  }
>
> -static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
> +static void riscv_tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *c=
c)
>  {
>      /*
>       * All cpus use the same set of operations.
> @@ -1394,30 +1394,30 @@ static void tcg_cpu_init_ops(AccelCPUClass *accel=
_cpu, CPUClass *cc)
>      cc->tcg_ops =3D &riscv_tcg_ops;
>  }
>
> -static void tcg_cpu_class_init(CPUClass *cc)
> +static void riscv_tcg_cpu_class_init(CPUClass *cc)
>  {
> -    cc->init_accel_cpu =3D tcg_cpu_init_ops;
> +    cc->init_accel_cpu =3D riscv_tcg_cpu_init_ops;
>  }
>
> -static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
> +static void riscv_tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
>  {
>      AccelCPUClass *acc =3D ACCEL_CPU_CLASS(oc);
>
> -    acc->cpu_class_init =3D tcg_cpu_class_init;
> -    acc->cpu_instance_init =3D tcg_cpu_instance_init;
> -    acc->cpu_target_realize =3D tcg_cpu_realize;
> +    acc->cpu_class_init =3D riscv_tcg_cpu_class_init;
> +    acc->cpu_instance_init =3D riscv_tcg_cpu_instance_init;
> +    acc->cpu_target_realize =3D riscv_tcg_cpu_realize;
>  }
>
> -static const TypeInfo tcg_cpu_accel_type_info =3D {
> +static const TypeInfo riscv_tcg_cpu_accel_type_info =3D {
>      .name =3D ACCEL_CPU_NAME("tcg"),
>
>      .parent =3D TYPE_ACCEL_CPU,
> -    .class_init =3D tcg_cpu_accel_class_init,
> +    .class_init =3D riscv_tcg_cpu_accel_class_init,
>      .abstract =3D true,
>  };
>
> -static void tcg_cpu_accel_register_types(void)
> +static void riscv_tcg_cpu_accel_register_types(void)
>  {
> -    type_register_static(&tcg_cpu_accel_type_info);
> +    type_register_static(&riscv_tcg_cpu_accel_type_info);
>  }
> -type_init(tcg_cpu_accel_register_types);
> +type_init(riscv_tcg_cpu_accel_register_types);
> --
> 2.41.0
>
>

