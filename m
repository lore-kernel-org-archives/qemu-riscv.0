Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889DBEB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 20:06:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLqwn-00025Q-2x; Tue, 18 Jul 2023 16:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLqwl-000240-EI
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 16:05:23 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLqwi-0004MS-R9
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 16:05:23 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6b9cf17f69cso63091a34.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 13:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689710718; x=1692302718;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ww+j5eRuOi7Ao9bi3oPbHC3r3QKY75RGn3d66ZUGyJ8=;
 b=A4Z0VwZ1/qczsg1uSThxhlf83BuC1P4sC/b/OIobsiypSRsE4QrjKH9SiUYJHE2xfw
 aQpq0tdoD0HlonWn3FI6Sz2tAVgTpDn6F5g8lvyg/s19Hu5AOY4UoRSj3OEq7tdjZ8TO
 pk3Y5lwM43jPugJ9SGDF1WNvtffeDrmqnA2erWdvBIiOwhgb7yfnsY2hH4FaubOhB4d/
 TVmCUrPwc72FNxtdPRBO1ZVjQUBLvzaU3yQOpCBcINkhichz+HdwddDyhY3ZOTk5XtWt
 4GRhgwQYwIx5LiZ9RV+QEKeN4hcLYSmi13nvlPq9CNYKCYlvsSO56oIZZvMUknmQokkv
 +3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689710718; x=1692302718;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ww+j5eRuOi7Ao9bi3oPbHC3r3QKY75RGn3d66ZUGyJ8=;
 b=hJnSAIFvN/k169anMGOhuueMiN0COt++lmQB4eile+seTFjBpekKn5e9KhxXEwYhdR
 ROLavJhJmD+TLPJprdtLpci6RWajo5wvZFIqUw52eIwYsW1E6gQYCTeAg2IB+UCedH4/
 LGukp04RChpcJt1IzsDKBpt0jNqfVWWDpzoeVHjnE7/7jpezCimgT2GApb25RyQ14Kuw
 I0EgfmfIYIALPLZxGamP1GjMBOPxzhlXd0VKyYZyrh/ene6RDNzyoQNKb/J+PGjM2qRz
 xH9w/WPHb/TLArJw85oWg7hBB+iJz7BUknR4quZO/PJiMDrmgLiinB3dpHl4thVPk9tS
 5zCg==
X-Gm-Message-State: ABy/qLYkP0qu3ESF2n1lywytMxk8KJYe+Wst1YTSQQPPBENhmWV7ToIT
 HCDDrlZQ+7qocXxHRvsC3KlueQ==
X-Google-Smtp-Source: APBJJlHyjeewclTlMngfLLh8Ueko/lpUyDD1OrszVgNFzk7u8glR+fbQZQpOSb5AJa0hY+lpg7TsdA==
X-Received: by 2002:a9d:7b4c:0:b0:6b7:564d:f368 with SMTP id
 f12-20020a9d7b4c000000b006b7564df368mr94557oto.5.1689710717958; 
 Tue, 18 Jul 2023 13:05:17 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-211.dial-up.telesp.net.br.
 [201.69.66.211]) by smtp.gmail.com with ESMTPSA id
 i15-20020a9d68cf000000b006b9734b9fafsm1158308oto.13.2023.07.18.13.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 13:05:17 -0700 (PDT)
Message-ID: <6105a331-7c24-2c8e-a3ce-65c6080fd17f@ventanamicro.com>
Date: Tue, 18 Jul 2023 17:05:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 04/10] hw/riscv: virt: Add PCIe HIGHMEM in memmap
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-5-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230712163943.98994-5-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 7/12/23 13:39, Sunil V L wrote:
> PCIe High MMIO base is actually dynamic and fixed at
> run time based on the RAM configured. Currently, this is
> not part of the memmap and kept in separate static variable
> in virt.c. However, ACPI code also needs this information
> to populate DSDT. So, once the base is discovered, merge
> this into the final memmap which can be used to create
> ACPI tables later.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>   hw/riscv/virt.c         | 31 ++++++++++++++++++++++++++++++-
>   include/hw/riscv/virt.h |  9 +++++++--
>   2 files changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index f6067db8ec..7aee06f021 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -84,6 +84,22 @@ static const MemMapEntry virt_memmap[] = {
>   
>   static MemMapEntry virt_high_pcie_memmap;
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
>   #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
>   
>   static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
> @@ -1444,7 +1460,20 @@ static void virt_machine_init(MachineState *machine)
>               ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
>       }
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

This change here kind of convinces me of the point I made earlier in patch 2:
we can simplify gpex_pcie_init() to use just the RISCVVirtState as a parameter
and get everything else from it.

It's also something for a follow-up. As for this patch:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   
>       /* register system main memory (actual RAM) */
>       memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 00c22492a7..1d7ddf5df0 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -60,7 +60,7 @@ struct RISCVVirtState {
>       char *oem_id;
>       char *oem_table_id;
>       OnOffAuto acpi;
> -    const MemMapEntry *memmap;
> +    MemMapEntry *memmap;
>       PCIBus *bus;
>   };
>   
> @@ -84,7 +84,12 @@ enum {
>       VIRT_PCIE_MMIO,
>       VIRT_PCIE_PIO,
>       VIRT_PLATFORM_BUS,
> -    VIRT_PCIE_ECAM
> +    VIRT_PCIE_ECAM,
> +    VIRT_LAST_MEMMAP /* Keep this entry always last */
> +};
> +
> +enum {
> +    VIRT_HIGH_PCIE_MMIO = VIRT_LAST_MEMMAP,
>   };
>   
>   enum {

