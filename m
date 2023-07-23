Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA59C001DE
	for <qemu-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 23:46:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNimD-0004M2-5G; Sun, 23 Jul 2023 19:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNim0-0004Iv-Tr; Sun, 23 Jul 2023 19:46:00 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNilz-0001dS-9U; Sun, 23 Jul 2023 19:46:00 -0400
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-7996e265b4dso1464605241.2; 
 Sun, 23 Jul 2023 16:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690155956; x=1690760756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjhIaXTvM+YazFlF0I0qdrNY4Jr2xUalkd8K3LBKGis=;
 b=cJFLRL/kINhVbgsMGyi3NN3jvOluS03E03/N+iws4dv0GuxH6zgZezge1OLeMx2+yA
 fV5CnsPh5Hm1zaEYA41knxZR+vBe8pyz+msQM0udZ4po3jSu5OXqQZmL/DQpJh5LDwGl
 KhNR9EadLTTYgcwt5YU1et6l/l2Qs4SJntgqgUbgGubVL02110TeZ7adFcXBQYPi61gN
 9NVm9PtTkHATpxzPmm0DWKT/+XHQ+r0CREE/2M2qxRgPvSPFGhhAtxmTHmaLyDtQrDDM
 vWpEww+PROC+tzrO8rqtdnBaPuJtjlSByaeBRaIfYX1diAOj5kZOfuQyiF0sUpkTTRw4
 Q2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690155956; x=1690760756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FjhIaXTvM+YazFlF0I0qdrNY4Jr2xUalkd8K3LBKGis=;
 b=Zar/jRo+pldlPF6uAy4Rn3H5oDrxRDFkPPOj1KNvePlTZqZgb3GGmmNxxiPKIkSwQY
 QyJ/WjaPUyJdZ6G0LsbifVHMkVHeZDX26fsCJdO5QTJmSgoPckVNyNjaDUn2bR8mB8xg
 0IfR4LQ20L47O2PhB7geFqC+Vz2dH6OU7g8Rzocojb3+jskpOO4+T5nk/OZrbyMT1N8P
 +4Od2yPoAtIF71qNJuUkOAViYNqZCZAuG6AXagb2u8nEJeSe6bMMJWZ9w3mAYyf5vDhK
 viHw89LJ5xJuPceU0rwZ1vuCDK8yh/owVzGXQmAIG8vJsk2ahtxMweWK3FDvZVQP581X
 uP7A==
X-Gm-Message-State: ABy/qLZAx3T9tEHS6sAz1VDlNMilQ5BSEGxpQgpg3Pn8n+iz6o3HCuTs
 dOaDEPP7ndvuMSw9disoTv2OMUQbVX64W3+HKEE=
X-Google-Smtp-Source: APBJJlG1kVdO0XaKF084mmBL7nARt4k1Ka/ac8oH2f2bXESx/y+L/gAVYNn4XEfzzShlfv4P4AOPas/n6K9vsS8agBk=
X-Received: by 2002:a1f:3d4f:0:b0:47e:1425:12a7 with SMTP id
 k76-20020a1f3d4f000000b0047e142512a7mr3843034vka.5.1690155956547; Sun, 23 Jul
 2023 16:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-3-sunilvl@ventanamicro.com>
In-Reply-To: <20230712163943.98994-3-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 09:45:30 +1000
Message-ID: <CAKmqyKOGnyBvwFu3yX03ksdOtwG2z0_VY+AKhbYQ3ODiJF_mfQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv: virt: Add PCI bus reference in
 RISCVVirtState
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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
> The PCI bus information is needed in RISCVVirtState so that other
> files like virt-acpi-build.c can make use of it. Add new field in
> RISCVVirtState so that ACPI code can use it.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c         | 6 ++++--
>  include/hw/riscv/virt.h | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d90286dc46..46d3341113 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1073,7 +1073,8 @@ static inline DeviceState *gpex_pcie_init(MemoryReg=
ion *sys_mem,
>                                            hwaddr high_mmio_base,
>                                            hwaddr high_mmio_size,
>                                            hwaddr pio_base,
> -                                          DeviceState *irqchip)
> +                                          DeviceState *irqchip,
> +                                          RISCVVirtState *s)
>  {
>      DeviceState *dev;
>      MemoryRegion *ecam_alias, *ecam_reg;
> @@ -1113,6 +1114,7 @@ static inline DeviceState *gpex_pcie_init(MemoryReg=
ion *sys_mem,
>          gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
>      }
>
> +    s->bus =3D PCI_HOST_BRIDGE(dev)->bus;
>      return dev;
>  }
>
> @@ -1502,7 +1504,7 @@ static void virt_machine_init(MachineState *machine=
)
>                     virt_high_pcie_memmap.base,
>                     virt_high_pcie_memmap.size,
>                     memmap[VIRT_PCIE_PIO].base,
> -                   pcie_irqchip);
> +                   pcie_irqchip, s);
>
>      create_platform_bus(s, mmio_irqchip);
>
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index e5c474b26e..4ef1f660ab 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -60,6 +60,7 @@ struct RISCVVirtState {
>      char *oem_table_id;
>      OnOffAuto acpi;
>      const MemMapEntry *memmap;
> +    PCIBus *bus;
>  };
>
>  enum {
> --
> 2.39.2
>
>

