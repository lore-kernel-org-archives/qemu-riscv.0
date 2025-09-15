Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACCCCAC587
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 01:55:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uxyQj-0007E9-7x; Sun, 14 Sep 2025 21:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uxyQd-0007AZ-TB
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 21:54:51 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uxyQV-0003c1-00
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 21:54:50 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so483426566b.1
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 18:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757901279; x=1758506079; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wh35gwmePaTudZC9v7TbD45o+/CFAax/uaC0LPtvB+w=;
 b=NMfhGdTFz5O0A7pgCbFBBKixjSzq8JvlGx0/6Dayfr01p14fcBfOwZAFKKoNUOUh8V
 IiUwfVVwDoHarHf4FWkKoIn7q2OdIrfPgqtXdTjVoaORVjuTdIjocTkiWYoWxHzDYYcV
 Rd8c7bbsAveLb8VKXp3BEffW41O43BkVEJotJkpX2k8Rjua6VhxHcBV1MMAb6SFOipXP
 cvAAGFD4Cm6d/oAdWP3FXm5/0jEwILhJ/2GRjOX/aDWh0UFTqVWOg8ic5waPQaluoHVk
 zaVIWlzBpIq1iHsHjyDMYjyh03nfjUSBck2oqn0JRO+YA+0jmDYvJVHtRyzCvt5h4X7D
 NgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757901279; x=1758506079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wh35gwmePaTudZC9v7TbD45o+/CFAax/uaC0LPtvB+w=;
 b=RwJ8w7eqjAYJzpJsdmBRvFCy1ceWkKL7+ECut6I/uSfh1qH7A55fwtCLZTrb7TVzLH
 HQ1M1tx8Fl5RReZ4kEcmHmaS1jRCjXyFwz5LMIV0jljtD2iJ3+68sI44oePJLE/hqMF1
 TORiWOiydBlifqCTTEGNQhz+QVj0ti039T4+gzL1l9qdeff4jPa8RGKIsaLdswb9VYYF
 ATLXBkeCKmtinS97VwFp+KEs/g1IOS7YH0sGYc2iBknlw9Ok18JnIxwCpZn0MaPR5vK+
 WMXjNPkxfm2kmj1ctevoYPxrXuEykgaEPtfVc2OSzB+eP6OOvcCblQBVfVc3o+NclU6i
 w7ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpNca1pQal7gzqwDFhk6CkaKBJ+OcFpvutuOJxKyFXRJ2CfC3zLTFwnZCl7nrZDD5VDH0SJeB477OP@nongnu.org
X-Gm-Message-State: AOJu0YySl+CnaRPIP//oiSbFefUUJ9q/InLG0tFucVs3oCejWwUAEEiw
 RUD21pyMVtoValhngc8shRurU7mRdMsqg9ulkjMb4Jyl/tuq4vsawsAdEz0QUsweXlFf1rWnE7C
 OWBPQiC891nFb4SeGGuVKsnYVDdoQ7hI=
X-Gm-Gg: ASbGncuqPQYV+MasnxESSaiafNuUflRhU5fzsDD+1misInzuS+GUtxxgco62Vby3UWI
 P7pqPqEZdbBIYbtLmwIlUUezvihTf11a5J82IIEtSLzYxhm9kmY4F+YTEni9GC1PnEWevqzj/2g
 pYjMZ6vfhm8ypqTGrgos3HCZp4IXIrKXVeG6XwzuKXLKofN7iLJw8L/tLeSInw+xVDZXfEMe442
 JkJHY2HRdOEOucBwKV9MDbnEUGvliWq1hy+nLzsqazU3NLX
X-Google-Smtp-Source: AGHT+IHHhFE8mit4GABCpz+WIhIP3mTGk5t711eCNN4WnVkrcgy3BwYyiLDWhT5hlNTLQU2TzSTO3S9IhwpiT2bHkFE=
X-Received: by 2002:a17:907:3e1a:b0:b01:6e50:208c with SMTP id
 a640c23a62f3a-b07c3582d6amr1052572466b.22.1757901278587; Sun, 14 Sep 2025
 18:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250904132723.614507-2-ajones@ventanamicro.com>
In-Reply-To: <20250904132723.614507-2-ajones@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 11:54:12 +1000
X-Gm-Features: AS18NWCtTED248ft_V2kU4jhEn2xmvZcu2m95t_6Kx-DYH1dFOblDP5Zu8AS-DE
Message-ID: <CAKmqyKMoPeCQV9Ag-UK613GqUU1M+FcP+H08jTozNE4hH1hmzA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu: Fix MSI table size limit
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 tjeznach@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Sep 4, 2025 at 11:29=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> The MSI table is not limited to 4k. The only constraint the table has
> is that its base address must be aligned to its size, ensuring no
> offsets of the table size will overrun when added to the base address
> (see "8.5. MSI page tables" of the AIA spec).
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/riscv-iommu.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 96a7fbdefcf3..155190d032dd 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -558,6 +558,7 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUSt=
ate *s,
>      MemTxResult res;
>      dma_addr_t addr;
>      uint64_t intn;
> +    size_t offset;
>      uint32_t n190;
>      uint64_t pte[2];
>      int fault_type =3D RISCV_IOMMU_FQ_TTYPE_UADDR_WR;
> @@ -565,16 +566,18 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMU=
State *s,
>
>      /* Interrupt File Number */
>      intn =3D riscv_iommu_pext_u64(PPN_DOWN(gpa), ctx->msi_addr_mask);
> -    if (intn >=3D 256) {
> -        /* Interrupt file number out of range */
> -        res =3D MEMTX_ACCESS_ERROR;
> -        cause =3D RISCV_IOMMU_FQ_CAUSE_MSI_LOAD_FAULT;
> -        goto err;
> -    }
> +    offset =3D intn * sizeof(pte);
>
>      /* fetch MSI PTE */
>      addr =3D PPN_PHYS(get_field(ctx->msiptp, RISCV_IOMMU_DC_MSIPTP_PPN))=
;
> -    addr =3D addr | (intn * sizeof(pte));
> +    if (addr & offset) {
> +        /* Interrupt file number out of range */
> +        res =3D MEMTX_ACCESS_ERROR;
> +        cause =3D RISCV_IOMMU_FQ_CAUSE_MSI_LOAD_FAULT;
> +        goto err;
> +    }
> +
> +    addr |=3D offset;
>      res =3D dma_memory_read(s->target_as, addr, &pte, sizeof(pte),
>              MEMTXATTRS_UNSPECIFIED);
>      if (res !=3D MEMTX_OK) {
> --
> 2.49.0
>
>

