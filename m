Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F02DC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 02:22:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxHuR-0005mA-Kl; Sun, 29 Oct 2023 22:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxHuP-0005l1-Q9; Sun, 29 Oct 2023 22:21:41 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxHuN-0006AS-T1; Sun, 29 Oct 2023 22:21:41 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-4a18f724d47so1197457e0c.3; 
 Sun, 29 Oct 2023 19:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698632498; x=1699237298; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gD1IG6K2gYViodHmA/fblSzMZ4TKfGN5jKU21udvMGE=;
 b=TDAf7mePhCAEO5zTM5j9WdcvFztbCNH18VwndVJTVNaucWRViyvuGqqj0g9CcZNY1n
 rT3q+w9J6Y6yFNU8I/0pmFkyCsI3JRB747oaqnlwacPaQGi+2HKCjlPZyLalFWFCZnK8
 0K74ZMit7G2pLBkKcQvOpSsd88vG4voxmKPZOHar/XnP2SLNkMtLYmILRs/sLtMBhphi
 X/3on1M3zZWvRXelF6YZvKNCpVP4MNMkJRzSwlM8asAAtKGAJV7jxBTZv4XcQgaogp5H
 biVZIc2uUzuXMIyYign0h2iJok2izEArdNXkJ7oLdjTmQLuNtLSiYO71AF34eSoaXOfq
 /VGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698632498; x=1699237298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gD1IG6K2gYViodHmA/fblSzMZ4TKfGN5jKU21udvMGE=;
 b=VCTSzFZIA2F94rRJTy540wZ15kain71S2ORW/q2k7U+/LzwP2K2kA0X3wFY4lqcaxE
 WPXM1Q7UZ3DiM5vqJkEN9c31D5XwGFirp0aOmNHq/R7DEx5LtRFtyo5at/+79lvLWyu8
 sBwnkTkmbDwIEr6AC139vtdbT5evJDD61djSHc7kOKkU535Lcp9IkOVbC/UM1Q93ViLE
 DhnHWtD7BIjLiMXM9zVfx5Kny05BFQwAqnd8vksjZ7ROcHUNamVOeY4zQmKmL1+KWkvJ
 7L+7Qm9OEcJ+qtb7dzSKuaBLMCIWRQXNEGaInWBOWIvkoOgwVewuMnI29QbQgWrkB9E1
 CJ7w==
X-Gm-Message-State: AOJu0Yxhsz55KshV1r737LRYx4emVtORfMHQvqquPoVDCId6Vi5FHHh1
 Oa4rcbxATtz9U1KSc1qiuB5S0LqTfkLnwQs9t1w=
X-Google-Smtp-Source: AGHT+IH4CCeu8IpjjGgErflIxp0tBlIwt1m5urJvisAYkBrVpsHW1dOw+Y6Yy8TISJuIyzpo5HtJGymFHxNPnz4HQaU=
X-Received: by 2002:a1f:aa84:0:b0:4a8:fcf8:9c77 with SMTP id
 t126-20020a1faa84000000b004a8fcf89c77mr4423217vke.6.1698632498019; Sun, 29
 Oct 2023 19:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
 <20231025200713.580814-4-sunilvl@ventanamicro.com>
In-Reply-To: <20231025200713.580814-4-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 12:21:11 +1000
Message-ID: <CAKmqyKNPKZXhSiemr9BO5hHE6uM4RTyPR9nf+zCpDE2kWw8ViA@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] hw/i386/acpi-microvm.c: Use common function to
 add virtio in DSDT
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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

On Thu, Oct 26, 2023 at 7:23=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> With common function to add virtio in DSDT created now, update microvm
> code also to use it instead of duplicate code.
>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/i386/acpi-microvm.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index 2909a73933..279da6b4aa 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -37,6 +37,7 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/usb/xhci.h"
> +#include "hw/virtio/virtio-acpi.h"
>  #include "hw/virtio/virtio-mmio.h"
>  #include "hw/input/i8042.h"
>
> @@ -77,19 +78,7 @@ static void acpi_dsdt_add_virtio(Aml *scope,
>              uint32_t irq =3D mms->virtio_irq_base + index;
>              hwaddr base =3D VIRTIO_MMIO_BASE + index * 512;
>              hwaddr size =3D 512;
> -
> -            Aml *dev =3D aml_device("VR%02u", (unsigned)index);
> -            aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")=
));
> -            aml_append(dev, aml_name_decl("_UID", aml_int(index)));
> -            aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> -
> -            Aml *crs =3D aml_resource_template();
> -            aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRIT=
E));
> -            aml_append(crs,
> -                       aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE=
_HIGH,
> -                                     AML_EXCLUSIVE, &irq, 1));
> -            aml_append(dev, aml_name_decl("_CRS", crs));
> -            aml_append(scope, dev);
> +            virtio_acpi_dsdt_add(scope, base, size, irq, index, 1);
>          }
>      }
>  }
> --
> 2.39.2
>
>

