Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E76C35FFB
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 12:41:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tusjT-0004UT-TV; Wed, 19 Mar 2025 08:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tusiz-0004Gt-E1
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 08:40:56 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tusix-0001bS-1O
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 08:40:44 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22403cbb47fso126877345ad.0
 for <qemu-riscv@nongnu.org>; Wed, 19 Mar 2025 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1742388041; x=1742992841; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iLu5npcomyTVUxuHUDmtxGlhg6+mMvNwQc7847pGGr8=;
 b=CmTukIPcCiPzzvAnBzb7jnLaOA9ZtAvWWOpxuXN8C4y8ejF6+D1kephnunczQrZt7a
 hK5CcNrjRg8bTEKk8sYlO7ltu+thCSr79bYFmIzNYdeEPfikQWOfr0q+9LmRM/q56CqF
 as9QZQXn9V68UBQU32zLeJg59fD+iTMaphoONSsvHeUgY+1xeoAwbVOcSgahPcLgBnXh
 aFq0R0AvYG5Tc6YtuVu6oFgpKtunzMPO3klBerOoyaCzPUvTbq2pUqUfxEGk5U8cZdgS
 NpjFpJ2dQXfK6Q6yFgrzmeP4WJr8EkdkbILXjvfgrm7kmGyKVufsC9hdjb1cic/Dgb9F
 iApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742388041; x=1742992841;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iLu5npcomyTVUxuHUDmtxGlhg6+mMvNwQc7847pGGr8=;
 b=By9TakQNGgt097FKnD7xPDwBYsQ8icboE0sqpS9ZVryzGK2A5MRWFxl2rn9gI+48c9
 y6U/2KzS0A2ZoTB/acZ50ATpBBqKyeFbhQeK4c/FvQHzzL3OKVxISqn09i36wtD+8Dku
 mhWGzvGLzSOrmoPj5S3c/kjN0WZboozjVrD33dUi3lsCvr87hFscg2wXitOWFWC8pVO/
 TyXbe5Ufx0a0mM7MG1zXrI7CP5SUkzJFTwcbzPtxAJ6KWLuHIdUOhzNkaOSUb/I/KMB4
 TaA0XQ/m+X6RqOxKiURVh72DQIleRCXbZTIF1hUoo6XzVCu07crVs0U5bzk3yX8aopC3
 Z7RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhVYV6gi1EfodrwrgTi5VyQwlLDFG59nOGk9XUTM88A9yjos23/9RKaohVFDCNZ7EdSL7GZ3jme/mc@nongnu.org
X-Gm-Message-State: AOJu0YzrpVB0ALoGcR7AZ1xFmM3kvSueTUSr0QKiRN3Fh0QpINHCDGCd
 l2w1PWuAXN9L2a/m9OpyXQF1Wtp/wXFwxTU20PddLLFH4cEIeaKXDdCkznxwGas8fBeYPbVGhYj
 9
X-Gm-Gg: ASbGncu7JiIHRWpp6tZnLTbJ/ez5hW/NCXp9KX68v2+/dDTQw6QlLJAb+BGC4XMEiuf
 0K0m4aZDNto17TnhyKziTcjtPhIaIC36k5QGaR1d81jqABMHo6jGHEXRcQiJ02YIYzMKnHgAXXH
 HVKixd0SLov+NEkWzvX7QXUa9tZywZWT4ptTuzewACVkfI5EYVH5mNjn07lpY0mIm3nARpOeRoP
 06KfCC7CV1tqWsBBgjTd6iMU4n8L7Xs+f84SbkaOipThtcUHUm7b7jfn6uK+Ag8M23goE3LuE2l
 m3HBm8154b4Zu/n76VoBTnf6OwCGH4J7JMLUgUqbXuZijLeuM5FcHDMuyzdlqoAidkHTkg==
X-Google-Smtp-Source: AGHT+IFhb99icUGrIOEzBnyK7HyCey0uRhvZ1s4NoEqRbs8Amzu15pX5km7x57NKxRsOBjr+SKUHvw==
X-Received: by 2002:a05:6a00:3cc3:b0:736:4b6d:82dd with SMTP id
 d2e1a72fcca58-7376d5f26c5mr3439047b3a.2.1742388041583; 
 Wed, 19 Mar 2025 05:40:41 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.117.79])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711578ceasm11501501b3a.84.2025.03.19.05.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:40:40 -0700 (PDT)
Message-ID: <f6407b0d-15c5-4cc0-a0c4-04a307d998a5@ventanamicro.com>
Date: Wed, 19 Mar 2025 09:40:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/riscv/virt: Add the BDF of IOMMU to RISCVVirtState
 structure
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250314051527.1892488-1-sunilvl@ventanamicro.com>
 <20250314051527.1892488-2-sunilvl@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250314051527.1892488-2-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 3/14/25 2:15 AM, Sunil V L wrote:
> When the IOMMU is implemented as a PCI device, its BDF is created
> locally in virt.c. However, the same BDF is also required in
> virt-acpi-build.c to support ACPI. Therefore, make this information part
> of the global RISCVVirtState structure so that it can be accessed
> outside of virt.c as well.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/virt.c         | 1 +
>   include/hw/riscv/virt.h | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index dae46f4733..ce256fb3b3 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1116,6 +1116,7 @@ static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
>       qemu_fdt_setprop_cells(fdt, pci_node, "iommu-map",
>                              0, iommu_phandle, 0, bdf,
>                              bdf + 1, iommu_phandle, bdf + 1, 0xffff - bdf);
> +    s->pci_iommu_bdf = bdf;
>   }
>   
>   static void finalize_fdt(RISCVVirtState *s)
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 48a14bea2e..7b4c2c8b7d 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -63,6 +63,7 @@ struct RISCVVirtState {
>       const MemMapEntry *memmap;
>       struct GPEXHost *gpex_host;
>       OnOffAuto iommu_sys;
> +    uint16_t pci_iommu_bdf;
>   };
>   
>   enum {


