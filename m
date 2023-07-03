Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA78FEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 01:42:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG8Zl-0001pH-04; Sun, 02 Jul 2023 21:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG8Zj-0001oY-Af; Sun, 02 Jul 2023 21:41:59 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG8Zh-0007sD-4x; Sun, 02 Jul 2023 21:41:59 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-44360717659so2841953137.0; 
 Sun, 02 Jul 2023 18:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688348515; x=1690940515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40f3lmBbMv6Q14NCcehep/Jyx29+4QEf9hxmuSV1T2E=;
 b=cvENE7mDwuuEQFQfh0fX1WOcZS2Nah3wQArIN0QPyLaAyYCPVXptiRkL2RJCiUkbNI
 QlBdwvnIlsnm7Rct8Dh8TDObHjS7NpFOK3Hu7qa6XFaPglgiqla8fmL5yx4w0RoRTjO+
 tDBQknsNfFHo/NnvJI2VGoglMQqQ+jrQmdsXQ5nvWfF5QWaNP76O6Qr99LeLkenqKqnk
 1LHK8WMyM5yMXzwp9U7kCDtNKRp97FfZtiJrLZaBLJmrYh1yTXLMqtfEUl9bv35kGAgE
 7YSzoT/m6pviyIEJyJO3WJgRMJnGQuKi7AOQDm+9Y4IKzNxzk7rerhfR4y5Iu+KD0jUY
 x5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688348515; x=1690940515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=40f3lmBbMv6Q14NCcehep/Jyx29+4QEf9hxmuSV1T2E=;
 b=jWHFjRC4ZIsNLlKz2LGXBI2u3LlIZeJ45OXERh3ay/81HUpiciasZlnf7oqNh64yyQ
 NnkzAhy0IuFOF5kK0M60wEF7VZQLMkdZJcZVaK9AKFmrNp8hktdDQSfI87iL+dnAFM3k
 rcP4kcDzi+JCL6xJL9CPhgco0AXGP4tPNW4+dN4DrDfLbJdtqXxpd2YZb0T2mic0fWGH
 k/n8r4ruaWZokwaDyffFdn/VszPb5Tb2l9HPKirvZx3kPpR4ggZeHnTAH9tdGc1bHVzp
 PXyB9ybTC9dM8zyvyBvcYXy51IVaYJPZSnG70/sa6oVdsnioXqSB+kt7exnwGuwzSlVQ
 koBQ==
X-Gm-Message-State: AC+VfDxlD/IU+xQCMGOxbrn7jRWW6xwSj9vqab3XzwNlDBG23TlV/V/y
 qncYne0ozrjV42OIbJuwO2do4+/LVnWn3M0JgEM=
X-Google-Smtp-Source: ACHHUZ75dlkodCgqSbo54gQaUVWb7qSX5+vIVzNFzTyBG2T+fSEXJn0igdB07i1PXs8kNNscx1a3S4EoD1Cd3fFXFjw=
X-Received: by 2002:a05:6102:75b:b0:43b:4f2e:359 with SMTP id
 v27-20020a056102075b00b0043b4f2e0359mr4491248vsg.3.1688348515554; Sun, 02 Jul
 2023 18:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230624192957.14067-1-philmd@linaro.org>
In-Reply-To: <20230624192957.14067-1-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 11:41:29 +1000
Message-ID: <CAKmqyKOR_f_Kh2fJ3ArgruS+bgfkBe=m8aMm4-r3z_bDKGwTbw@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Restrict KVM-specific fields from ArchCPU
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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

On Sun, Jun 25, 2023 at 5:30=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> These fields shouldn't be accessed when KVM is not available.
>
> Restrict the KVM timer migration state. Rename the KVM timer
> post_load() handler accordingly, because cpu_post_load() is
> too generic.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Since v1 https://lore.kernel.org/qemu-devel/20230405160454.97436-10-philm=
d@linaro.org/:
> - Restrict whole vmstate_kvmtimer (thus drop Daniel's R-b)
> ---
>  target/riscv/cpu.h     | 2 ++
>  target/riscv/machine.c | 8 ++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e3e08d315f..b1b56aa29e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -363,12 +363,14 @@ struct CPUArchState {
>      hwaddr kernel_addr;
>      hwaddr fdt_addr;
>
> +#ifdef CONFIG_KVM
>      /* kvm timer */
>      bool kvm_timer_dirty;
>      uint64_t kvm_timer_time;
>      uint64_t kvm_timer_compare;
>      uint64_t kvm_timer_state;
>      uint64_t kvm_timer_frequency;
> +#endif /* CONFIG_KVM */
>  };
>
>  /*
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 3ce2970785..d27f8a2a3a 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -199,7 +199,8 @@ static bool kvmtimer_needed(void *opaque)
>      return kvm_enabled();
>  }
>
> -static int cpu_post_load(void *opaque, int version_id)
> +#ifdef CONFIG_KVM
> +static int cpu_kvmtimer_post_load(void *opaque, int version_id)
>  {
>      RISCVCPU *cpu =3D opaque;
>      CPURISCVState *env =3D &cpu->env;
> @@ -213,7 +214,7 @@ static const VMStateDescription vmstate_kvmtimer =3D =
{
>      .version_id =3D 1,
>      .minimum_version_id =3D 1,
>      .needed =3D kvmtimer_needed,
> -    .post_load =3D cpu_post_load,
> +    .post_load =3D cpu_kvmtimer_post_load,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
>          VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> @@ -221,6 +222,7 @@ static const VMStateDescription vmstate_kvmtimer =3D =
{
>          VMSTATE_END_OF_LIST()
>      }
>  };
> +#endif
>
>  static bool debug_needed(void *opaque)
>  {
> @@ -409,7 +411,9 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>          &vmstate_vector,
>          &vmstate_pointermasking,
>          &vmstate_rv128,
> +#ifdef CONFIG_KVM
>          &vmstate_kvmtimer,
> +#endif
>          &vmstate_envcfg,
>          &vmstate_debug,
>          &vmstate_smstateen,
> --
> 2.38.1
>
>

