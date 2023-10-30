Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25FAC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 13:39:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxSUS-0007Wh-NX; Mon, 30 Oct 2023 09:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxSUR-0007OJ-Ee
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 09:39:35 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxSUO-0006BZ-Bq
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 09:39:35 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5a7e5dc8573so40605057b3.0
 for <qemu-riscv@nongnu.org>; Mon, 30 Oct 2023 06:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698673170; x=1699277970; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sh575YTqSBhHY0AMttM9gvgH/IMyWeXli3dQG9PmFx0=;
 b=EhK7bb1it/57ZdKMvOx2LcFHL5V1wmin+5wjUaQlWY2vOJmQTim2jE8CzUlWm8Pppq
 fSoE7j4b2xKW6WmYsKAqmgC0huxRXNBKu+OgzhbjPkD9TkOtJNotgOdxBSXCJsa3gcjU
 029ZSFHXQT88lR27CzWKxT9H/VA/nFC0MrOhKgMpmvXUnIKZgo5F6SBFah/MQg0CaoL6
 0Kl5/e//QDEK8p4qancKOWHPofOypXt8gJPa+jv2ZFJZIFppiYjHtp2dH1Ih5ckV0E1W
 1PXfAzGQWz38e+KZ+3e6Qx2DICaARcPhhfVVV+XpGx7vj9aSP+T5i61URf2wuZ3plqkE
 UvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698673170; x=1699277970;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sh575YTqSBhHY0AMttM9gvgH/IMyWeXli3dQG9PmFx0=;
 b=j7B3Fgx+ccdcp58g2GkMd5WLCqjTvbfTjoWkHmLhimnS/WAq8l6Q5GpI9WCNkoCGph
 YeQ4CjXVYBCRHIhkS1xce34wJ4O5OGGB4UkIlJL56jGYscSL7WBms3YncKgTrZIvQfJm
 cLyovKJCr2Yf1bXpjUzToTeW5UgjcHg+4bReZQv8GzxLKLec+EV5coGEJd/0YrROS+AA
 APobv4L7NQsxmhdmdyR5lQJURn96YzOrOfFIETSFMv6mbytDN3siZI0XDBYIoOg/6M0Q
 msiz1z9eGt+eOUpFp31k36kHf0dO2ByUw+LcB/qvND6t3REB0/rtBKfoNcuJ9DSIn9t8
 whdw==
X-Gm-Message-State: AOJu0YxG0a5abdUJr9LxGOt7rAUChZetXt3SWpzbCxbIQ8LiKJGN4SbR
 zJZpsDl2vPxhO3H7bIoLrWa/RA==
X-Google-Smtp-Source: AGHT+IE6fYLZvfNxxgngEaUp7hcZo5dYF+Mgxswy5n4mE8lRDlWbb2NbyTDGhcXAdJTsExgj3eAvYg==
X-Received: by 2002:a81:e249:0:b0:59b:cfe1:bcf1 with SMTP id
 z9-20020a81e249000000b0059bcfe1bcf1mr9305349ywl.44.1698673170389; 
 Mon, 30 Oct 2023 06:39:30 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 w185-20020a8162c2000000b0059b20231f1dsm4319262ywb.121.2023.10.30.06.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 06:39:30 -0700 (PDT)
Message-ID: <5968ce1b-8342-4251-8bc0-e8200388336c@ventanamicro.com>
Date: Mon, 30 Oct 2023 10:39:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/13] hw/pci-host/gpex: Define properties for MMIO
 ranges
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra
 <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
 <20231030132058.763556-11-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231030132058.763556-11-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112d.google.com
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



On 10/30/23 10:20, Sunil V L wrote:
> ACPI DSDT generator needs information like ECAM range, PIO range, 32-bit
> and 64-bit PCI MMIO range etc related to the PCI host bridge. Instead of
> making these values machine specific, create properties for the GPEX
> host bridge with default value 0. During initialization, the firmware
> can initialize these properties with correct values for the platform.
> This basically allows DSDT generator code independent of the machine
> specific memory map accesses.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---

There's nothing too fancy happening here, just a good old QOM sauce, so I
feel comfortable throwing a:


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>



Thanks,

Daniel


>   hw/pci-host/gpex-acpi.c    | 13 +++++++++++++
>   hw/pci-host/gpex.c         | 12 ++++++++++++
>   include/hw/pci-host/gpex.h | 28 ++++++++++++++++++++--------
>   3 files changed, 45 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 1092dc3b70..f69413ea2c 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -281,3 +281,16 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>   
>       crs_range_set_free(&crs_range_set);
>   }
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
>        */
>       DEFINE_PROP_BOOL("allow-unmapped-accesses", GPEXHost,
>                        allow_unmapped_accesses, true),
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
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index b0240bd768..441c6b8b20 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -40,6 +40,15 @@ struct GPEXRootState {
>       /*< public >*/
>   };
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
>   struct GPEXHost {
>       /*< private >*/
>       PCIExpressHost parent_obj;
> @@ -55,19 +64,22 @@ struct GPEXHost {
>       int irq_num[GPEX_NUM_IRQS];
>   
>       bool allow_unmapped_accesses;
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
>   };
>   
>   int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
>   
>   void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg);
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
>   #endif /* HW_GPEX_H */

