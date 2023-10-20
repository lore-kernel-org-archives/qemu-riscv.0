Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D7EC001DF
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 17:17:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtt5c-0000kp-UU; Fri, 20 Oct 2023 13:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qtt5a-0000ii-Q5
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 13:15:10 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qtt5X-0004PU-4b
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 13:15:10 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53e751aeb3cso1585161a12.2
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 10:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697822105; x=1698426905; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJY3Ry6FtyEI3t3XZXdMiTi8tAQ17I99btx+L90/ieE=;
 b=sr2sjdYbf7bon3ONPN1PJ7+0G7LJ3+Q1rByITalVmkRotcYVN1Xai+xKYus97vcG+l
 T5AEp1yfMl9KZBLuquYuGQpsfY8NyQulQZs8DF5C+/0uyRUg17SZYa/XGZDxb871CFUd
 kh0nR2rL3J11QLxgPObDvU+NKBcz0oIEdXP054epFHzbYeEAgQh7lKGewkmqArSQFQnS
 tt5KJvKhgXwMYKcHrQ3aDDzmbVPVLCOTjU9ipC9SYgyFNYHBX6rXUBg6e6N9QYhOl/XV
 xksoKCDaL8GNCaauFLtBhAJ3/688QoOus9PHIlzb9HLPF/NBWpTZKQb5JWLEzFP5MafQ
 X+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697822105; x=1698426905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XJY3Ry6FtyEI3t3XZXdMiTi8tAQ17I99btx+L90/ieE=;
 b=OXmPDDOFnzDp3o4kb0m90XP5z3B7SC3HWs6XTtD4fqMeWmNj9PFpgJwxPPW45vJB7T
 UzqzhY4ut2p4hts1aadTY9aK8JLJaqJRm60/H+ZODvI85hQuBagmFy2b99rGcG1De02s
 i4BCrMB3kZvW51F6AQUvqhFhZvIhHFyJhWOl+EKg1aNXU/imNecaYkozYHxrKLvCJsZa
 xvpapCfDFvuuLCmBAn5cptzeGIKVCsUhxYeySAGmWwX0S0VNY02YTxQ5dG3pYKnxUxyw
 Cfk44YUyxYe5xJM8t/sq9uvHRGIUZo/MmsCiX2D5crMB3FNgsPS+/E0DYHB/VJfi3PH4
 qmWQ==
X-Gm-Message-State: AOJu0YyX5wrMqH8AdaS0T0yMkPoS498eQKyjBnB0/U0u5HDUP8XtkolH
 nk2gut15XVzrXs0M2tE7B96dEpV3jfZmZnn05QSXe20Ffzjf3hZw
X-Google-Smtp-Source: AGHT+IH5/JR5VVSrQGkiUAnBpgum7umVYRelaDbiWsj0/ab1+EHOinqsQQviwnMGDCLcf+X7qbrpmHsOx5yYi3ZZx2I=
X-Received: by 2002:a50:ccc6:0:b0:53e:197d:a4d with SMTP id
 b6-20020a50ccc6000000b0053e197d0a4dmr1963231edj.4.1697822104818; Fri, 20 Oct
 2023 10:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231020163643.86105-1-philmd@linaro.org>
 <20231020163643.86105-2-philmd@linaro.org>
In-Reply-To: <20231020163643.86105-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Oct 2023 18:14:53 +0100
Message-ID: <CAFEAcA9FT+QMyQSLCeLjd7tEfaoS9JazmkYWQE++s1AmF7Nfvw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/19] cpus: Add argument to qemu_get_cpu() to filter
 CPUs by QOM type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-s390x@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 David Woodhouse <dwmw2@infradead.org>, 
 Paul Durrant <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Song Gao <gaosong@loongson.cn>, 
 Thomas Huth <huth@tuxfamily.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 20 Oct 2023 at 17:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Heterogeneous machines have different type of CPU.
> qemu_get_cpu() returning unfiltered CPUs doesn't make
> sense anymore. Add a 'type' argument to filter CPU by
> QOM type.

I'm not sure "filter by CPU type" is ever really the
correct answer to this problem, though.

Picking out a handful of arm-related parts to this patchset
as examples of different situations where we're currently
using qemu_get_cpu():

> diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
> index 474cfdc87c..1c1585f3e1 100644
> --- a/hw/arm/fsl-imx7.c
> +++ b/hw/arm/fsl-imx7.c
> @@ -212,7 +212,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error =
**errp)
>
>      for (i =3D 0; i < smp_cpus; i++) {
>          SysBusDevice *sbd =3D SYS_BUS_DEVICE(&s->a7mpcore);
> -        DeviceState  *d   =3D DEVICE(qemu_get_cpu(i));
> +        DeviceState  *d   =3D DEVICE(qemu_get_cpu(i, NULL));
>
>          irq =3D qdev_get_gpio_in(d, ARM_CPU_IRQ);
>          sysbus_connect_irq(sbd, i, irq);

This is an Arm SoC object. What it wants is not "the i'th Arm
CPU in the whole system", but "the i'th CPU in this SoC object".
Conveniently, it has easy access to that: s->cpu[i].

> diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
> index e7c3d99224..0a698171ab 100644
> --- a/hw/arm/pxa2xx_gpio.c
> +++ b/hw/arm/pxa2xx_gpio.c
> @@ -303,7 +303,7 @@ static void pxa2xx_gpio_realize(DeviceState *dev, Err=
or **errp)
>  {
>      PXA2xxGPIOInfo *s =3D PXA2XX_GPIO(dev);
>
> -    s->cpu =3D ARM_CPU(qemu_get_cpu(s->ncpu));
> +    s->cpu =3D ARM_CPU(qemu_get_cpu(s->ncpu, NULL));
>
>      qdev_init_gpio_in(dev, pxa2xx_gpio_set, s->lines);
>      qdev_init_gpio_out(dev, s->handler, s->lines);

This is grabbing a private pointer to the CPU object[*], which
we can do more cleanly by setting a link property, and getting
the board code to pass a pointer to the CPU.

[*] it then uses that pointer to mess with the internals of
the CPU to implement wake-up-on-GPIO in a completely horrible
way, but let's assume we don't want to try to clean that up now...

> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 3c7dfcd6dc..3571d5038f 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -275,7 +275,7 @@ static void create_fdt(SBSAMachineState *sms)
>
>      for (cpu =3D sms->smp_cpus - 1; cpu >=3D 0; cpu--) {
>          char *nodename =3D g_strdup_printf("/cpus/cpu@%d", cpu);
> -        ARMCPU *armcpu =3D ARM_CPU(qemu_get_cpu(cpu));
> +        ARMCPU *armcpu =3D ARM_CPU(qemu_get_cpu(cpu, NULL));
>          CPUState *cs =3D CPU(armcpu);
>          uint64_t mpidr =3D sbsa_ref_cpu_mp_affinity(sms, cpu);

This is in a board model. By definition the board model for a
non-heterogenous board knows it isn't in a heterogenous system
model, and it doesn't need to say "specifically the first Arm CPU".
So I think we should be able to leave it alone...

> diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
> index bfd8aa5644..8c9098d5d3 100644
> --- a/hw/cpu/a15mpcore.c
> +++ b/hw/cpu/a15mpcore.c
> @@ -65,7 +65,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error =
**errp)
>          /* Make the GIC's TZ support match the CPUs. We assume that
>           * either all the CPUs have TZ, or none do.
>           */
> -        cpuobj =3D OBJECT(qemu_get_cpu(0));
> +        cpuobj =3D OBJECT(qemu_get_cpu(0, NULL));
>          has_el3 =3D object_property_find(cpuobj, "has_el3") &&
>              object_property_get_bool(cpuobj, "has_el3", &error_abort);
>          qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
> @@ -90,7 +90,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error =
**errp)
>       * appropriate GIC PPI inputs
>       */
>      for (i =3D 0; i < s->num_cpu; i++) {
> -        DeviceState *cpudev =3D DEVICE(qemu_get_cpu(i));
> +        DeviceState *cpudev =3D DEVICE(qemu_get_cpu(i, NULL));
>          int ppibase =3D s->num_irq - 32 + i * 32;
>          int irq;
>          /* Mapping from the output timer irq lines from the CPU to the

This is another case where what we want is "the Nth CPU
associated with this peripheral block", not the Nth CPU of
some particular architecture. (It's not as easy to figure
out where we would get that from as it is in the fsl-imx7
case, though -- perhaps we would need to tweak the API
these objects have somehow to pass in pointers to the CPUs?)

> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 2ebf880ead..cdf21dfc11 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -392,7 +392,7 @@ static void arm_gicv3_common_realize(DeviceState *dev=
, Error **errp)
>      s->cpu =3D g_new0(GICv3CPUState, s->num_cpu);
>
>      for (i =3D 0; i < s->num_cpu; i++) {
> -        CPUState *cpu =3D qemu_get_cpu(i);
> +        CPUState *cpu =3D qemu_get_cpu(i, NULL);
>          uint64_t cpu_affid;
>
>          s->cpu[i].cpu =3D cpu;

These gicv3 uses of qemu_get_cpu() are because instead of doing
the theoretical Right Thing and having the GIC object have to
be told which CPUs it is responsible for, we took a shortcut
and said "there's only one GIC, and it's connected to all the CPUs".
The fix is, again, not filtering by CPU type, but having the
board and SoC models do the work to explicitly represent
"this GIC object is attached to these CPU objects" (via link
properties or otherwise).


So overall there are some places where figuring out the right
replacement for qemu_get_cpu() is tricky, and some places where
it's probably fairly straightforward but just an annoying
amount of extra code to write, and some places where we don't
care because we know the board model is not heterogenous.
But I don't think "filter by CPU architecture type" is usually
going to be what we want.

thanks
-- PMM

