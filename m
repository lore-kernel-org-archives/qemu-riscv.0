Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C07C001B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 01:54:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNklm-0000AK-Lh; Sun, 23 Jul 2023 21:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNklk-00009m-Us; Sun, 23 Jul 2023 21:53:52 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNklj-00040z-AP; Sun, 23 Jul 2023 21:53:52 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-4814299c981so1411348e0c.0; 
 Sun, 23 Jul 2023 18:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690163629; x=1690768429;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOgKbsHcKBp18Ik30E4NzavS5ZCDmTBbUZ8nKA2gHoA=;
 b=L7oTW04PPdyM1s3kqhfRxH6EeGQHBiyKyFOb0lgXekX22JWIz+NyR50uiLPQ8j5Rip
 M/uaR8AUmjqfIzzSJ/qcwSvVjjvW99tam4kT0a04FlPY2dVfxldG/mtNn5cK2jfb3Ujy
 vlzCdRrtaxPTQQMiH+XspvqqOql0iiz3UQeQTxQgnxmS4JZ7BbMCsIsULiFQNjMNEUy/
 Scs6vmYvr7IE48+LYxsJ3kYKAFIw7iYdSyoNIRWXa0xLFAuqPKRt6MjRgbz4FMY9djKP
 NnWXmf/Y5xMSnQpkOEt1spLRJlHgGL2i2D38+wIyaWifnrZsqlTyB9YKXFLumCE9oX7w
 cgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690163629; x=1690768429;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOgKbsHcKBp18Ik30E4NzavS5ZCDmTBbUZ8nKA2gHoA=;
 b=HE8Aemt0hJf2PATL/cu1aLcfloICdIZJfQPkSliL5JxElPYuO+r05MLfeEr3NKU4by
 ddKi0jCNf+610ptmjXY/Y/r6sKHWcprWtMEQwp3NcV9cTvdPhpZCCBmT8XhZuyfoSr7T
 Qs8HBBTmbV9z3IzPcDliXzw7LRT0WoOVktRjn/yHWa+MekTpxPGpPT2S+//vpYsaamE/
 8612Mc3FF6ccAR8+FYq7WYJAFNKaSSfSbkLh0ftYuSSHLUe95+Rp4EOEMPfH60DpGTze
 Lms9rhhufhyil4V8Cu0Vbi2/iJ3xGLdXuaHWKPEDP0Dmch+k/k4K78WBClVfS57xQNN8
 Eeig==
X-Gm-Message-State: ABy/qLaP9CIdhgLzPWB8+jBbnu6TPHdKUoKS4447NA0q5uGxo/62BfY/
 Rh4C7oSLmm8qZIiBRIYunTqzDHFPlWDB//u99HM=
X-Google-Smtp-Source: APBJJlEWM3xnUdEQKNBnEhN14HZN/oxrSapkVBiODdi5wUCi6zqfU3Vr1iZTT5jRydkzZMTV4TGcD2zARgdF+wNnTlw=
X-Received: by 2002:a1f:cec6:0:b0:481:35ea:10cf with SMTP id
 e189-20020a1fcec6000000b0048135ea10cfmr3373403vkg.4.1690163629444; Sun, 23
 Jul 2023 18:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-4-sunilvl@ventanamicro.com>
In-Reply-To: <20230712163943.98994-4-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 11:53:23 +1000
Message-ID: <CAKmqyKOV7R3DLTfn2ZB4dRz_9BNYdd-SND1Qg4rW+Y-FuBKtdQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] hw/riscv: virt: Make few IMSIC macros and functions
 public
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>, 
 Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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

On Thu, Jul 13, 2023 at 2:42=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> Some macros and static function related to IMSIC are defined
> in virt.c. They are required in virt-acpi-build.c. So, make them
> public.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c         | 25 +------------------------
>  include/hw/riscv/virt.h | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 24 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 46d3341113..f6067db8ec 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -37,7 +37,6 @@
>  #include "hw/riscv/numa.h"
>  #include "hw/intc/riscv_aclint.h"
>  #include "hw/intc/riscv_aplic.h"
> -#include "hw/intc/riscv_imsic.h"
>  #include "hw/intc/sifive_plic.h"
>  #include "hw/misc/sifive_test.h"
>  #include "hw/platform-bus.h"
> @@ -53,28 +52,6 @@
>  #include "hw/acpi/aml-build.h"
>  #include "qapi/qapi-visit-common.h"
>
> -/*
> - * The virt machine physical address space used by some of the devices
> - * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
> - * number of CPUs, and number of IMSIC guest files.
> - *
> - * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
> - * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
> - * of virt machine physical address space.
> - */
> -
> -#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT=
)
> -#if VIRT_IMSIC_GROUP_MAX_SIZE < \
> -    IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
> -#error "Can't accomodate single IMSIC group in address space"
> -#endif
> -
> -#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
> -                                        VIRT_IMSIC_GROUP_MAX_SIZE)
> -#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
> -#error "Can't accomodate all IMSIC groups in address space"
> -#endif
> -
>  static const MemMapEntry virt_memmap[] =3D {
>      [VIRT_DEBUG] =3D        {        0x0,         0x100 },
>      [VIRT_MROM] =3D         {     0x1000,        0xf000 },
> @@ -505,7 +482,7 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>      g_free(plic_cells);
>  }
>
> -static uint32_t imsic_num_bits(uint32_t count)
> +uint32_t imsic_num_bits(uint32_t count)
>  {
>      uint32_t ret =3D 0;
>
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 4ef1f660ab..00c22492a7 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -23,6 +23,7 @@
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/sysbus.h"
>  #include "hw/block/flash.h"
> +#include "hw/intc/riscv_imsic.h"
>
>  #define VIRT_CPUS_MAX_BITS             9
>  #define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
> @@ -128,4 +129,28 @@ enum {
>
>  bool virt_is_acpi_enabled(RISCVVirtState *s);
>  void virt_acpi_setup(RISCVVirtState *vms);
> +uint32_t imsic_num_bits(uint32_t count);
> +
> +/*
> + * The virt machine physical address space used by some of the devices
> + * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
> + * number of CPUs, and number of IMSIC guest files.
> + *
> + * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
> + * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
> + * of virt machine physical address space.
> + */
> +
> +#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT=
)
> +#if VIRT_IMSIC_GROUP_MAX_SIZE < \
> +    IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
> +#error "Can't accomodate single IMSIC group in address space"
> +#endif
> +
> +#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
> +                                        VIRT_IMSIC_GROUP_MAX_SIZE)
> +#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
> +#error "Can't accomodate all IMSIC groups in address space"
> +#endif
> +
>  #endif
> --
> 2.39.2
>
>

