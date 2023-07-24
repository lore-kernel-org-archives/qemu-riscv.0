Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0944C0015E
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 15:33:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNxYa-0003Px-9K; Mon, 24 Jul 2023 11:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qNxYV-0003Np-Ja
 for qemu-riscv@nongnu.org; Mon, 24 Jul 2023 11:33:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qNxYU-0003c6-3h
 for qemu-riscv@nongnu.org; Mon, 24 Jul 2023 11:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690212780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N60DTTLhSfpZsaROa4bRnGXu/LsNPSdPZYlf/YK0byk=;
 b=OEzXSb2IASuPSUfqI4y5aK/RWgOb0EaX/pv65M9WXG4M9n+c22MERCe5h1eHvSYgMySkcD
 5VvTe98cZNSLq0dkuV9KukGVxoGoRtMgNINSguqdpUdd2/TqwWCnbg4fMY6SCLk5RjqjRS
 /0GV2pyBe/hWzQOudlDWCWVaVyFJ6I0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-9_RZshE_NPWs4G4lJJyvLQ-1; Mon, 24 Jul 2023 11:32:57 -0400
X-MC-Unique: 9_RZshE_NPWs4G4lJJyvLQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3175b757bbfso824395f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Jul 2023 08:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690212776; x=1690817576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N60DTTLhSfpZsaROa4bRnGXu/LsNPSdPZYlf/YK0byk=;
 b=SgMFrsnkM8ououbQsQ80jnwu91D9IKP3M546L7O1094om/2e6cVKxPrKhBI0SNkfV7
 rx0qHlmi4ADDGX02VGsp2BJWNbaW6eS+ENfdElXCVdunjliqX1PNFT4d7cF9YwMEaEWG
 t5Hgmxnf9LO67qzB+00DY3+n1p9JcCHuxouUXeqMgRMXH9QBTsPcuYLbiqE/V1aG3Pgg
 ooirYenTTIoysM59jSioxbtPg5aZMsVvOLO4Igd2/DeImIigqa/jikoMp7U4jdnKXF1U
 yKZ2JMmOach1uajtOkIHNWo7tqr8MO/3FtOZ/VxynKT3xcZfKShRIgNFOCfQK+8nVgXv
 PWBg==
X-Gm-Message-State: ABy/qLZ/UjC3wG/fUjSeo5RjhLCoWpiF4vCMb6e6CbPtyLSd+jrXze54
 lQGicvsU4nV/ujI62AxhXbZCRLAtfefgrtGkZneNc2gcMR5nKHWwvzLuqF1g5kY6njUreJlIHBy
 1L8AsoPyfQYiHsgk=
X-Received: by 2002:adf:dbc7:0:b0:314:1313:c3d6 with SMTP id
 e7-20020adfdbc7000000b003141313c3d6mr7723898wrj.33.1690212776051; 
 Mon, 24 Jul 2023 08:32:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEaoN9YM92QFRuLzaEd5JuL34rtkI3o+Q+QyjPAXtfbPfhiPU4c8CNg+gFvNINsGM9Sxd163w==
X-Received: by 2002:adf:dbc7:0:b0:314:1313:c3d6 with SMTP id
 e7-20020adfdbc7000000b003141313c3d6mr7723874wrj.33.1690212775709; 
 Mon, 24 Jul 2023 08:32:55 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 q1-20020adfcd81000000b003140fff4f75sm8108722wrj.17.2023.07.24.08.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 08:32:55 -0700 (PDT)
Date: Mon, 24 Jul 2023 17:32:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 04/10] hw/riscv: virt: Add PCIe HIGHMEM in memmap
Message-ID: <20230724173254.3423a204@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230712163943.98994-5-sunilvl@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-5-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 12 Jul 2023 22:09:37 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> PCIe High MMIO base is actually dynamic and fixed at
> run time based on the RAM configured. Currently, this is
> not part of the memmap and kept in separate static variable
> in virt.c. However, ACPI code also needs this information
> to populate DSDT. So, once the base is discovered, merge
> this into the final memmap which can be used to create
> ACPI tables later.

can ACPI code fetch virt_high_pcie_memmap at runtime from
host bridge (like we do in pc/q35)?


> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt.c         | 31 ++++++++++++++++++++++++++++++-
>  include/hw/riscv/virt.h |  9 +++++++--
>  2 files changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index f6067db8ec..7aee06f021 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -84,6 +84,22 @@ static const MemMapEntry virt_memmap[] = {
>  
>  static MemMapEntry virt_high_pcie_memmap;
>  
> +/*
> + * virt_memmap doesn't include floating High Mem IO address entry. To enable
> + * code organization in multiple files (ex: ACPI), it is better to have single
> + * memmap which has complete information.
> + *
> + * VIRT_HIGH_PCIE_MMIO is always greater than the last memmap entry and hence
> + * full_virt_memmap is capable of holding both virt_memmap and
> + * VIRT_HIGH_PCIE_MMIO entry.
> + *
> + * The values for these floating entries will be updated when top of RAM is
> + * discovered.
> + */
> +static MemMapEntry full_virt_memmap[] = {
> +    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 0 },
> +};
> +
>  #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
>  
>  static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
> @@ -1444,7 +1460,20 @@ static void virt_machine_init(MachineState *machine)
>              ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
>      }
>  
> -    s->memmap = virt_memmap;
> +    /*
> +     * Initialize the floating values in full memory map
> +     */
> +    full_virt_memmap[VIRT_HIGH_PCIE_MMIO].base = virt_high_pcie_memmap.base;
> +    full_virt_memmap[VIRT_HIGH_PCIE_MMIO].size = virt_high_pcie_memmap.size;
> +
> +    s->memmap = full_virt_memmap;
> +    /*
> +     * Copy the base virt_memmap entries to full memmap
> +     */
> +    for (i = 0; i < ARRAY_SIZE(virt_memmap); i++) {
> +        s->memmap[i] = virt_memmap[i];
> +    }
> +
>  
>      /* register system main memory (actual RAM) */
>      memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 00c22492a7..1d7ddf5df0 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -60,7 +60,7 @@ struct RISCVVirtState {
>      char *oem_id;
>      char *oem_table_id;
>      OnOffAuto acpi;
> -    const MemMapEntry *memmap;
> +    MemMapEntry *memmap;
>      PCIBus *bus;
>  };
>  
> @@ -84,7 +84,12 @@ enum {
>      VIRT_PCIE_MMIO,
>      VIRT_PCIE_PIO,
>      VIRT_PLATFORM_BUS,
> -    VIRT_PCIE_ECAM
> +    VIRT_PCIE_ECAM,
> +    VIRT_LAST_MEMMAP /* Keep this entry always last */
> +};
> +
> +enum {
> +    VIRT_HIGH_PCIE_MMIO = VIRT_LAST_MEMMAP,
>  };
>  
>  enum {


