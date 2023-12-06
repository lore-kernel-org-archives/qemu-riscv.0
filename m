Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B82C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 00:26:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAfkA-0007rG-JR; Tue, 05 Dec 2023 19:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAfk8-0007ql-U0; Tue, 05 Dec 2023 19:26:24 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAfk7-00016W-80; Tue, 05 Dec 2023 19:26:24 -0500
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50be4f03b06so4127994e87.0; 
 Tue, 05 Dec 2023 16:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701822381; x=1702427181; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+7lwnfTMC8kcRYbQZYnxjxLvv7b0jrwyoRwZAQLfeg=;
 b=lzMtC+xtbGDGqxB83bFUZ9CZoBqueFjCSNNdPO7fgBIdFf5X5jqIb6xBYWxKPg74dg
 03pfeb6Gd8l4ES7fSDbhIooZofLX0icYAuv6gWVCx8PYzV1og+C1+J0IKVkZdoTnaFrz
 zp/W+heAmSdXA1GTB36SpU5v8agHyo0rIUiR6tyfQ8QGFUzZ+0wg8eJV8ZImeelaIfvS
 kvIBttLloO3CN7xlHD1KvJTdzBHljZRWNpxWtN/DItfxcsFvn0QM7S0DiylP5QR1JHIK
 2mRconH2qkUND1nupe7qpe+ioXna57S3P/0ro/o+O/kDgk0Ze9sHPLeLcthKHreD0eOF
 UJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701822381; x=1702427181;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+7lwnfTMC8kcRYbQZYnxjxLvv7b0jrwyoRwZAQLfeg=;
 b=TIvFhHN6GAjG+QcIeHO0b5VGVbvk8K12UDgEmfp/kes58f4vuaBwAd8qcKT8q008kT
 67bivBRhw3CaZPJ4w9kwVHOZMlnVW6cBU/NgCbwwcpRwMlqlPE0UJc1Wdnz/YGBqDYJb
 QQ0nv4fMCUUxQGsRIPE4SckEwyJowjdoVPYCCFy3SzB61k8Ij1v/xjjr40LAmwxyx6yj
 L1l8pc3/S9+uHRJQUROmvSzGDuk5rEjfepw2bKmaKxtSMkri1ygcv6FZJ2ik3it0R6GB
 hB2TJ7Mrf5X37vN5FKwK/P9p5aOOwfJ1e/od+bCTehks0xBDsYJiznprHdhd6gO/P4Cu
 IGzQ==
X-Gm-Message-State: AOJu0Ywa3Gxtl7J0BpN45uQCnAMOZlU2zTmGo4d2djP1dkbPmPzG1lHi
 GiA6+fIpqf8m7AyWOZx8f/9X+dosa0z84d7FEEY=
X-Google-Smtp-Source: AGHT+IHJRpWlI9EyYfcb2+aTpth0sZEpsq5YHWPHxiNzSuVYZ+xHhDG6fRJm3jH+rfbemwzWf01FkgQf01rDwefg5BA=
X-Received: by 2002:a19:6d1b:0:b0:50b:ea76:509f with SMTP id
 i27-20020a196d1b000000b0050bea76509fmr24122lfc.64.1701822380891; Tue, 05 Dec
 2023 16:26:20 -0800 (PST)
MIME-Version: 1.0
References: <20231130182748.1894790-1-dbarboza@ventanamicro.com>
 <20231130182748.1894790-4-dbarboza@ventanamicro.com>
In-Reply-To: <20231130182748.1894790-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Dec 2023 10:25:53 +1000
Message-ID: <CAKmqyKN0xUWNj1XtNHD096pFQ1Uv65XKEeU+xb_6hUX-Qf9_bw@mail.gmail.com>
Subject: Re: [PATCH for-9.0 3/4] target/riscv/kvm: do PR_RISCV_V_SET_CONTROL
 during realize()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-lf1-x12e.google.com
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

On Fri, Dec 1, 2023 at 5:00=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Linux RISC-V vector documentation (Document/arch/riscv/vector.rst)
> mandates a prctl() in order to allow an userspace thread to use the
> Vector extension from the host.
>
> This is something to be done in realize() time, after init(), when we
> already decided whether we're using RVV or not. We don't have a
> realize() callback for KVM yet, so add kvm_cpu_realize() and enable RVV
> for the thread via PR_RISCV_V_SET_CONTROL.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm/kvm-cpu.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 45b6cf1cfa..273c71baea 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -18,6 +18,7 @@
>
>  #include "qemu/osdep.h"
>  #include <sys/ioctl.h>
> +#include <sys/prctl.h>
>
>  #include <linux/kvm.h>
>
> @@ -47,6 +48,9 @@
>  #include "sysemu/runstate.h"
>  #include "hw/riscv/numa.h"
>
> +#define PR_RISCV_V_SET_CONTROL            69
> +#define PR_RISCV_V_VSTATE_CTRL_ON          2
> +
>  void riscv_kvm_aplic_request(void *opaque, int irq, int level)
>  {
>      kvm_set_irq(kvm_state, irq, !!level);
> @@ -1481,11 +1485,36 @@ static void kvm_cpu_instance_init(CPUState *cs)
>      }
>  }
>
> +/*
> + * We'll get here via the following path:
> + *
> + * riscv_cpu_realize()
> + *   -> cpu_exec_realizefn()
> + *      -> kvm_cpu_realize() (via accel_cpu_common_realize())
> + */
> +static bool kvm_cpu_realize(CPUState *cs, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    int ret;
> +
> +    if (riscv_has_ext(&cpu->env, RVV)) {
> +        ret =3D prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON)=
;
> +        if (ret) {
> +            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, cod=
e: %s",
> +                       strerrorname_np(errno));
> +            return false;
> +        }
> +    }
> +
> +   return true;
> +}
> +
>  static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
>  {
>      AccelCPUClass *acc =3D ACCEL_CPU_CLASS(oc);
>
>      acc->cpu_instance_init =3D kvm_cpu_instance_init;
> +    acc->cpu_target_realize =3D kvm_cpu_realize;
>  }
>
>  static const TypeInfo kvm_cpu_accel_type_info =3D {
> --
> 2.41.0
>
>

