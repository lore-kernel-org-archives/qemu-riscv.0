Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB94CD98C5
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 04:38:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wYz5b-0006Yu-4w; Mon, 15 Jun 2026 00:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wYz5Y-0006YA-JX
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 00:38:20 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wYz5W-0001pr-QA
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 00:38:20 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6914a658115so3497428a12.0
 for <qemu-riscv@nongnu.org>; Sun, 14 Jun 2026 21:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781498297; cv=none;
 d=google.com; s=arc-20240605;
 b=JES2f2lDAwJoKodvlwod0NLIGcKkXNA/grwPtCD7XghNRXzzMU81lsaZHZBGD+mN1W
 H+eP3hgdQPeGkk5/bwIs7aPwMqazILCttQlZk/dlUzZpu2vVg8PzfrS9AmaBEPNqkMoP
 g6v8sNtzr+QIcf2+q7JXTSt/KKhxc/ENWehB04t0Uw13+ZE5WytjfyCjxa8Ci99B6RUG
 3txng1BNjbSBm4hPghKQ4TAK2fPML+oxrUcH4WEULoPRbMb0nHGVBxNtEFPyV3HQodCZ
 RhyGKOgiLgpgoX6VTLr2pwPcg0q0uhcZGJoZNqjAfTJNROA/qTSKTxKb0/XXKHa2xPLP
 yaew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UHHocfIwghjQPf3BDUbsHBTDdrhPB3353zMnFaxCtTM=;
 fh=26SNzzNSLJkK8wx9i7H02I/7z7wfgGvRRZUYVuVTCs4=;
 b=ee88r7zIpv6R0EXdifMTsCwwNAs6tens8mnIN4+g1IR22VyTi4nam3uSv31CE35cPd
 c9wo7vE9/3KY1XiksZBl59biW4J4fIphl4MlbGMTM3tZMci851WBoqXlCL0xIhYyWXlK
 2LAZqlTG8Wn978MI/cRsIEO1N5YEUjaQ/ypNnozPn9gfLsDlCMoRwscEPsIbo/51gc0S
 ZEMELHMm154TvxKqEq/eS1j625f2tiWSSsDEN9zQnCrmn5yYbtLR27nzXMjRTNlRRII7
 WHfA0OTedBHK3FK7wNOlQoLcpUlzC1pqiUnRyARtNqzrAIDD1i3UomLdTcDFKVQKBDd0
 AwdA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781498297; x=1782103097; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UHHocfIwghjQPf3BDUbsHBTDdrhPB3353zMnFaxCtTM=;
 b=BIlrrxNRdsXa7PRwrPJlCugqwQbCJ9tyWulHl1ZuMadgZ/dZjJ1bSdyKm42uHSK+mr
 OhRhjuT7hU9A4SNXWJzc1SO/QU6VH2/G1aCCLD/UeyiUPNSKyiPutIborMoLemHj4nJQ
 i0BWSFQ05cZScH9801nHumul8IdreGdHM8PxT7iCuVLeTY5MZMlTkvPS3ByGN6i3YuN/
 Flp05jq/mPwpzsSC7PH156cL7OZ2AmvYZ14k3QgjGbnVhMWn24aBmlENdGBMW1wc1UV4
 BDojHJ+K/yH96Fdh4lw+G482BmVgWFQpzONXHK1NzHFqNJ89Oq+xc6c7uVe8FGL10W0H
 2FgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781498297; x=1782103097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UHHocfIwghjQPf3BDUbsHBTDdrhPB3353zMnFaxCtTM=;
 b=BR8pyxaiEhWL2KDe/NjZqq++v6LsGcCRSTT5DS+NblXfuCzKJlDj7vyQ3yJGL1eKEj
 4IYe7TZyp9uyg2pVN7HuiKBrxUZUYzFYe2z6DnVswtr9tlMaaNHzttZYq3kk2b/GXM5i
 tuLYebB6GBknpWZJ87MS5dCo/T5INaGj0r26p9A+K9/bcnvXv0nZ8xafwn4nvYK393WM
 PSZ7Y+M6xxAU2mi/5nW4rD+Z9M78nVvUvWAlh1T3kWg9GTtGN/H62mwdCvdZwCj6lR3v
 2ot9Cudw5Dr6Sr4uhaWnkdQ4cw6WyKNeSMy5TPzc9fJTPtKA9U55OXxbhHUMRKdVhmX5
 wo+Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9jfqiBdwa0SVoFJx1YKuHJTkolbxWHPVJNlhNfSPI69agqeA0uCTD0Dgop+T10HB2mofH/7Xu//3L/@nongnu.org
X-Gm-Message-State: AOJu0YwLNsHjhVpSJHMoxz0ZFWG0fCfUQ5dfpvkfrvv0cfLQUBBzFzLd
 Bu0utbYVqa72s571elkS+En4QObi9qmax1XtQgw6TQ+3Qtqn+HCF7azr36M1wOuiFvKiMSA7vO6
 /MPri47JRshIZW8KdgW4uWWbT6DJFNYU=
X-Gm-Gg: Acq92OGnY6tHFUcSNYf8n/h728LADetvKDBSdWVtLGwzzpXJPJb/hbvVj7x8m0J6D1m
 qJLjYse/pk66obye9+m1hIt2vue+PocWsqeSdmEc+AOelKAi93S81huvXBFgDudKeMPaC/DozCD
 TEDc1Pf5+ed5xnEeADR2+Q1WT7hvf6MXyfDdu5QEAFHX47pwPN212mvqnnDuMS210upbZuZCTB8
 5AeWEpPfYpEsxgQ+xLKXF8om0OxGg9eeWUQtH1B+OE/t9CAkW5VWNZ9RhFIipiPDQRmt6dDVLHI
 HkOCeDFwF0RdyL6+hdozIEZ2UTqVWmvLPY/DEg==
X-Received: by 2002:a05:6402:26d1:b0:67c:a6d1:c48b with SMTP id
 4fb4d7f45d1cf-693784f79a5mr5504493a12.11.1781498296759; Sun, 14 Jun 2026
 21:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260603065859.592063-1-joel@jms.id.au>
 <20260603065859.592063-5-joel@jms.id.au>
In-Reply-To: <20260603065859.592063-5-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Jun 2026 14:37:48 +1000
X-Gm-Features: AVVi8CcoSD_Fo9RonYKuiwvdDGbhdoRyhx-VL4FKY2GJWUo8F6g5p8-QrhCxDXU
Message-ID: <CAKmqyKP0z6kFPk1keN9qazXFokHXLWSs=J3c3GoGfrb5pN+_cA@mail.gmail.com>
Subject: Re: [PATCH v8 04/12] hw/riscv/aia: Provide number of irq sources
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Nicholas Piggin <npiggin@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nutty Liu <nutty.liu@hotmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Jun 3, 2026 at 5:02=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrote:
>
> Instead of hard coding the number of IRQ sources used by the APLIC pass
> it in as a parameter. This allows other machines to configure this as
> required.
>
> The maximum number of sources is 1023.
>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/aia.h             |  3 +--
>  include/hw/riscv/virt.h    |  1 +
>  hw/riscv/aia.c             |  8 ++++++--
>  hw/riscv/virt-acpi-build.c | 25 ++++++++++++++++---------
>  hw/riscv/virt.c            |  2 ++
>  5 files changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/hw/riscv/aia.h b/hw/riscv/aia.h
> index dbb833340276..5ad0a902be0d 100644
> --- a/hw/riscv/aia.h
> +++ b/hw/riscv/aia.h
> @@ -11,11 +11,10 @@
>
>  #include "exec/hwaddr.h"
>
> -#define VIRT_IRQCHIP_NUM_SOURCES 96
> -
>  uint32_t imsic_num_bits(uint32_t count);
>
>  DeviceState *riscv_create_aia(bool msimode, int aia_guests,
> +                             uint16_t num_sources,
>                               const MemMapEntry *aplic_m,
>                               const MemMapEntry *aplic_s,
>                               const MemMapEntry *imsic_m,
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index ad858deb76ad..36a2def41096 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -64,6 +64,7 @@ struct RISCVVirtState {
>      struct GPEXHost *gpex_host;
>      OnOffAuto iommu_sys;
>      uint16_t pci_iommu_bdf;
> +    uint16_t num_sources;
>  };
>
>  enum {
> diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
> index c724612a50a5..82ea9d48ea75 100644
> --- a/hw/riscv/aia.c
> +++ b/hw/riscv/aia.c
> @@ -25,6 +25,7 @@ uint32_t imsic_num_bits(uint32_t count)
>  }
>
>  DeviceState *riscv_create_aia(bool msimode, int aia_guests,
> +                             uint16_t num_sources,
>                               const MemMapEntry *aplic_m,
>                               const MemMapEntry *aplic_s,
>                               const MemMapEntry *imsic_m,
> @@ -38,6 +39,9 @@ DeviceState *riscv_create_aia(bool msimode, int aia_gue=
sts,
>      DeviceState *aplic_s_dev =3D NULL;
>      DeviceState *aplic_m_dev =3D NULL;
>
> +    /* The RISC-V Advanced Interrupt Architecture, Chapter 1.2. Limits *=
/
> +    g_assert(num_sources <=3D 1023);
> +
>      if (msimode) {
>          if (!kvm_enabled()) {
>              /* Per-socket M-level IMSICs */
> @@ -66,7 +70,7 @@ DeviceState *riscv_create_aia(bool msimode, int aia_gue=
sts,
>                                       aplic_m->size,
>                                       (msimode) ? 0 : base_hartid,
>                                       (msimode) ? 0 : hart_count,
> -                                     VIRT_IRQCHIP_NUM_SOURCES,
> +                                     num_sources,
>                                       num_prio_bits,
>                                       msimode, true, NULL);
>      }
> @@ -77,7 +81,7 @@ DeviceState *riscv_create_aia(bool msimode, int aia_gue=
sts,
>                                   aplic_s->size,
>                                   (msimode) ? 0 : base_hartid,
>                                   (msimode) ? 0 : hart_count,
> -                                 VIRT_IRQCHIP_NUM_SOURCES,
> +                                 num_sources,
>                                   num_prio_bits,
>                                   msimode, false, aplic_m_dev);
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index e3da87492408..db3ea4f03ac3 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -146,6 +146,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtS=
tate *s)
>  }
>
>  static void acpi_dsdt_add_plic_aplic(Aml *scope, uint8_t socket_count,
> +                                     uint16_t num_sources,
>                                       uint64_t mmio_base, uint64_t mmio_s=
ize,
>                                       const char *hid)
>  {
> @@ -153,9 +154,12 @@ static void acpi_dsdt_add_plic_aplic(Aml *scope, uin=
t8_t socket_count,
>      uint32_t gsi_base;
>      uint8_t  socket;
>
> +    /* The RISC-V Advanced Interrupt Architecture, Chapter 1.2. Limits *=
/
> +    g_assert(num_sources <=3D 1023);
> +
>      for (socket =3D 0; socket < socket_count; socket++) {
>          plic_aplic_addr =3D mmio_base + mmio_size * socket;
> -        gsi_base =3D VIRT_IRQCHIP_NUM_SOURCES * socket;
> +        gsi_base =3D num_sources * socket;
>          Aml *dev =3D aml_device("IC%.02X", socket);
>          aml_append(dev, aml_name_decl("_HID", aml_string("%s", hid)));
>          aml_append(dev, aml_name_decl("_UID", aml_int(socket)));
> @@ -474,10 +478,13 @@ static void build_dsdt(GArray *table_data,
>      socket_count =3D riscv_socket_count(ms);
>
>      if (s->aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
> -        acpi_dsdt_add_plic_aplic(scope, socket_count, memmap[VIRT_PLIC].=
base,
> -                                 memmap[VIRT_PLIC].size, "RSCV0001");
> +        acpi_dsdt_add_plic_aplic(scope, socket_count, s->num_sources,
> +                                 memmap[VIRT_PLIC].base,
> +                                 memmap[VIRT_PLIC].size,
> +                                 "RSCV0001");
>      } else {
> -        acpi_dsdt_add_plic_aplic(scope, socket_count, memmap[VIRT_APLIC_=
S].base,
> +        acpi_dsdt_add_plic_aplic(scope, socket_count, s->num_sources,
> +                                 memmap[VIRT_APLIC_S].base,
>                                   memmap[VIRT_APLIC_S].size, "RSCV0002");
>      }
>
> @@ -494,15 +501,15 @@ static void build_dsdt(GArray *table_data,
>      } else if (socket_count =3D=3D 2) {
>          virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
>                               memmap[VIRT_VIRTIO].size,
> -                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES, 0,
> +                             VIRTIO_IRQ + s->num_sources, 0,
>                               VIRTIO_COUNT);
> -        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURC=
ES);
> +        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + s->num_sources);
>      } else {
>          virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
>                               memmap[VIRT_VIRTIO].size,
> -                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES, 0,
> +                             VIRTIO_IRQ + s->num_sources, 0,
>                               VIRTIO_COUNT);
> -        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURC=
ES * 2);
> +        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + s->num_sources * 2);
>      }
>
>      aml_append(dsdt, scope);
> @@ -581,7 +588,7 @@ static void build_madt(GArray *table_data,
>          for (socket =3D 0; socket < riscv_socket_count(ms); socket++) {
>              aplic_addr =3D s->memmap[VIRT_APLIC_S].base +
>                               s->memmap[VIRT_APLIC_S].size * socket;
> -            gsi_base =3D VIRT_IRQCHIP_NUM_SOURCES * socket;
> +            gsi_base =3D s->num_sources * socket;
>              build_append_int_noprefix(table_data, 0x1A, 1);    /* Type *=
/
>              build_append_int_noprefix(table_data, 36, 1);      /* Length=
 */
>              build_append_int_noprefix(table_data, 1, 1);       /* Versio=
n */
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 614220a0ce66..4cd941a6aac6 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1549,6 +1549,7 @@ static void virt_machine_init(MachineState *machine=
)
>          } else {
>              s->irqchip[i] =3D riscv_create_aia(s->aia_type =3D=3D VIRT_A=
IA_TYPE_APLIC_IMSIC,
>                                               s->aia_guests,
> +                                             s->num_sources,
>                                               &s->memmap[VIRT_APLIC_M],
>                                               &s->memmap[VIRT_APLIC_S],
>                                               &s->memmap[VIRT_IMSIC_M],
> @@ -1705,6 +1706,7 @@ static void virt_machine_instance_init(Object *obj)
>      s->oem_table_id =3D g_strndup(ACPI_BUILD_APPNAME8, 8);
>      s->acpi =3D ON_OFF_AUTO_AUTO;
>      s->iommu_sys =3D ON_OFF_AUTO_AUTO;
> +    s->num_sources =3D VIRT_IRQCHIP_NUM_SOURCES;
>  }
>
>  static char *virt_get_aia_guests(Object *obj, Error **errp)
> --
> 2.47.3
>
>

