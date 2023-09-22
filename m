Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A68E6FE32
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 13:46:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qjgTv-0000NE-6J; Fri, 22 Sep 2023 09:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qjgTp-0000M5-5U
 for qemu-riscv@nongnu.org; Fri, 22 Sep 2023 09:46:05 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qjgTl-0002gA-VF
 for qemu-riscv@nongnu.org; Fri, 22 Sep 2023 09:46:00 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3a7f4f7a8easo874642b6e.2
 for <qemu-riscv@nongnu.org>; Fri, 22 Sep 2023 06:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695390353; x=1695995153; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t4HTSU6Q5HrLKFQMqCA8piV7mEUFQ/7TzeL9PPjMor0=;
 b=JG+Pbo3QanGEG1pDn+NJAw6oEDbj0CoPgLsjPceT9TCJxpSyZfGLC1WLdGSUy6fq6P
 4L+CHIS6lCGRfSLzO7LAFng0Sjf4+9Ulp93d2vn+D/ROrZWQQmAbZzpH4IHH10B0kL1S
 SCOGwCKezqnaeueHccmFtF1NNP4y8F1OYTxpYM4IAv6h36N9BPWMGTxhFfaVaRcAPqR7
 BWelgD8Fl9BINrbaQZfxC1vzyotEm+e8bUq0eNgtKwQ/QM3oGywR77ayVUl7bSogP1nE
 d7VOuWOeVC0YER1q/u7rBGwNbPRJKeJ6VkRaaD/L+YKa2iLkNRBGicObqd2MkdotUSTV
 xTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695390353; x=1695995153;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t4HTSU6Q5HrLKFQMqCA8piV7mEUFQ/7TzeL9PPjMor0=;
 b=IqQaKiAk8z2GHZ8fNmD9dwiGJejOiADDYPKzoFN4pRQ/5/0FsCCTGRRN87i+/3ntpv
 2sWRPbuAIqr1M2y4B15w97fgGbWEsVHdTdO60eHtfFP6eKDzVPgPhjn2oUjeCe2oY20G
 9ppMivAjfcXn2lJkXLTpMsuG3xeaRgjWOkzQln5HHswkwLA29g+g/m7PxVbbkbk9eBOx
 eu51KdimuM9+kqxLFbhacUmJhIV5wqaUmc8eXBy9i28KZfVMsuLpdhyxvQx0msITFdF6
 rNH61vfKVQ/WvHMpiTTWGbHOydFwZhlpTZbDr202yDSZnJQT4HTIww6r2WgAAsmWSQ0K
 dK3A==
X-Gm-Message-State: AOJu0Yy0QbMVRiqD7Xpb2w4kXgDnAl+sjSB/Pfzb4DfLUuvyKfT7AU6p
 p2zk2RLHU0euJba+cm3qcC1AUQ==
X-Google-Smtp-Source: AGHT+IGcj0dOdVHwYeeiTRZLwSA9EmirYSPFPeKY+MSXBCMgbRi/71J7G44uPITKUSYdL6PAPaQxuQ==
X-Received: by 2002:a05:6808:1803:b0:3ab:6910:f5eb with SMTP id
 bh3-20020a056808180300b003ab6910f5ebmr9766935oib.10.1695390353346; 
 Fri, 22 Sep 2023 06:45:53 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.42]) by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b006900cb919b8sm3195111pfo.53.2023.09.22.06.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 06:45:52 -0700 (PDT)
Date: Fri, 22 Sep 2023 19:15:42 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v2 09/12] hw/pci-host/gpex: Define properties for MMIO
 ranges
Message-ID: <ZQ2ahpNNYoi6o0eC@sunil-laptop>
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
 <20230824142942.3983650-10-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824142942.3983650-10-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oi1-x236.google.com
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

Hi Igor,

On Thu, Aug 24, 2023 at 07:59:39PM +0530, Sunil V L wrote:
> ACPI DSDT generator needs information like ECAM range, PIO range, 32-bit
> and 64-bit PCI MMIO range etc related to the PCI host bridge. Instead of
> making these values machine specific, create properties for the GPEX host
> bridge with default value 0. During initialization, the firmware can
> initialize these properties with correct values for the platform. This
> basically allows DSDT generator code independent of the machine specific
> memory map accesses.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Could you please help reviewing these changes? From MAINTAINERS, it is
not clear to me who maintains gpex code.

Thanks!
Sunil
>  hw/pci-host/gpex-acpi.c    | 13 +++++++++++++
>  hw/pci-host/gpex.c         | 12 ++++++++++++
>  include/hw/pci-host/gpex.h | 28 ++++++++++++++++++++--------
>  3 files changed, 45 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 7c7316bc96..0983af3d9e 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -281,3 +281,16 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>  
>      crs_range_set_free(&crs_range_set);
>  }
> +
> +void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq)
> +{
> +    bool ambig;
> +    Object *obj = object_resolve_path_type("", TYPE_GPEX_HOST, &ambig);
> +
> +    if (!obj || ambig) {
> +        return;
> +    }
> +
> +    GPEX_HOST(obj)->gpex_cfg.irq = irq;
> +    acpi_dsdt_add_gpex(scope, &GPEX_HOST(obj)->gpex_cfg);
> +}
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index a6752fac5e..41f4e73f6e 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -154,6 +154,18 @@ static Property gpex_host_properties[] = {
>       */
>      DEFINE_PROP_BOOL("allow-unmapped-accesses", GPEXHost,
>                       allow_unmapped_accesses, true),
> +    DEFINE_PROP_UINT64(PCI_HOST_ECAM_BASE, GPEXHost, gpex_cfg.ecam.base, 0),
> +    DEFINE_PROP_SIZE(PCI_HOST_ECAM_SIZE, GPEXHost, gpex_cfg.ecam.size, 0),
> +    DEFINE_PROP_UINT64(PCI_HOST_PIO_BASE, GPEXHost, gpex_cfg.pio.base, 0),
> +    DEFINE_PROP_SIZE(PCI_HOST_PIO_SIZE, GPEXHost, gpex_cfg.pio.size, 0),
> +    DEFINE_PROP_UINT64(PCI_HOST_BELOW_4G_MMIO_BASE, GPEXHost,
> +                       gpex_cfg.mmio32.base, 0),
> +    DEFINE_PROP_SIZE(PCI_HOST_BELOW_4G_MMIO_SIZE, GPEXHost,
> +                     gpex_cfg.mmio32.size, 0),
> +    DEFINE_PROP_UINT64(PCI_HOST_ABOVE_4G_MMIO_BASE, GPEXHost,
> +                       gpex_cfg.mmio64.base, 0),
> +    DEFINE_PROP_SIZE(PCI_HOST_ABOVE_4G_MMIO_SIZE, GPEXHost,
> +                     gpex_cfg.mmio64.size, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index b0240bd768..441c6b8b20 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -40,6 +40,15 @@ struct GPEXRootState {
>      /*< public >*/
>  };
>  
> +struct GPEXConfig {
> +    MemMapEntry ecam;
> +    MemMapEntry mmio32;
> +    MemMapEntry mmio64;
> +    MemMapEntry pio;
> +    int         irq;
> +    PCIBus      *bus;
> +};
> +
>  struct GPEXHost {
>      /*< private >*/
>      PCIExpressHost parent_obj;
> @@ -55,19 +64,22 @@ struct GPEXHost {
>      int irq_num[GPEX_NUM_IRQS];
>  
>      bool allow_unmapped_accesses;
> -};
>  
> -struct GPEXConfig {
> -    MemMapEntry ecam;
> -    MemMapEntry mmio32;
> -    MemMapEntry mmio64;
> -    MemMapEntry pio;
> -    int         irq;
> -    PCIBus      *bus;
> +    struct GPEXConfig gpex_cfg;
>  };
>  
>  int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
>  
>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg);
> +void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq);
> +
> +#define PCI_HOST_PIO_BASE               "pio-base"
> +#define PCI_HOST_PIO_SIZE               "pio-size"
> +#define PCI_HOST_ECAM_BASE              "ecam-base"
> +#define PCI_HOST_ECAM_SIZE              "ecam-size"
> +#define PCI_HOST_BELOW_4G_MMIO_BASE     "below-4g-mmio-base"
> +#define PCI_HOST_BELOW_4G_MMIO_SIZE     "below-4g-mmio-size"
> +#define PCI_HOST_ABOVE_4G_MMIO_BASE     "above-4g-mmio-base"
> +#define PCI_HOST_ABOVE_4G_MMIO_SIZE     "above-4g-mmio-size"
>  
>  #endif /* HW_GPEX_H */
> -- 
> 2.39.2
> 

