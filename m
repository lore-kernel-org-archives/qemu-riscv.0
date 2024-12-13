Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BD3E7717F
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 20:39:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tMCQn-0006Qe-EV; Fri, 13 Dec 2024 15:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tMCQc-0006OA-MY
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 15:38:26 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tMCQa-0004Ne-O6
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 15:38:26 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-728ea1573c0so1921931b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Dec 2024 12:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1734122301; x=1734727101; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1JjGb0mggJgm1DIVY3xrORZVD2wuCdXVN3H6PRG6xzU=;
 b=NpJmoOGkQdX+sI2bCyr1KR6Om9RxRMEfIikWZTR5QppVKLPCrV83fEs6QZ4IMTYKVK
 qKV8Z9MTvyTxRkrGLA0DCsOCr/9/ZCmHn1QaG0yiNDPOtXQNxgYgkTgjSZHOzYxYkSIu
 HYF6agToi/E0VE86jiiHf1fayry4ZCg9Mvp9XswRWIOK1wc9iBqH79enSYjifYTqf/+G
 4szaZMJAvYX9H4n+7cOfWVddcBmxAiwCwv16P0fYuqh0s/ZBGw+j7KOkjdTDPYv3ok9v
 vHyIYkGgfTMyHqPFoYmOL1WAuAQ0Y/LYcqU6k1Q1KRiYP6Mg3RdVas+mj+owhhd5uby/
 3D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734122301; x=1734727101;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1JjGb0mggJgm1DIVY3xrORZVD2wuCdXVN3H6PRG6xzU=;
 b=oqCJ5mXUQsKouZORBqZy86fScQWAA2+Gq/r/EWZH/H3AVgvKIfHUpHxI6ifHltUwQ3
 Tbmxu3pwIGmw7m2UEIhxdTykw+EPcFl/10fw5FjWhMSoWZZnn03GR6p2+tr9B5L+B3Kh
 MTBH+ZEcqoGlGc+nFGbbpnPOD8s7RKjXdu76yZwpCwe+e1rxKNlv+YZXoDjgaMn1rSIV
 uW/kv/DmbDcWsShxBTiFWJ4PtObiRrce5dMnOWWSeU/RgWwpPGEUFQLj6bqa4VYNV8bc
 NsYN+Kt2NIxxhtm5tOEASw3NzA/WMo0Fm1HQi5cuekfibUEDg/ylApUHULipcP1ydi3h
 s0yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwo74M4yUHpoCV6w8UYHIHIgqB8wXClwdGfrDGgujgtT4VVmFtq2zk1s2Sf4HzYb93oIs+mYlF8iaM@nongnu.org
X-Gm-Message-State: AOJu0Yycmf2ckWtZLXy09vVtLEgbrsfCTreB5KEfO5QYJfEm1+Ampe4F
 avJUgV9emJo9GuSrqb0DGXlRwygWMTyncvjUBaCFX+HC/eIckJS5g6uTIhLXUCs=
X-Gm-Gg: ASbGncsEJBh2RugHinthycyv2qLwrDoU0+cgUyZ5hajr2iy/9X++RAJ20PyxOvu19ZY
 t5APDIvglkM+w7v2yvYtrO5hRQ28WsDbS4v5RywHuOA3VnWh/0TEZ4jk6BfjcQB0sZCu8TXgnh0
 B5ENjlIrPLTvqmqukPJbOeSp+WcT+Uet8slAjLBkN72eIcZxWqXM3ojUosIUOvgJrPF/SqdD0Fx
 CTVJbe2e8MqFd0yVwfz6tEVXZYWSiP6UPhcZpbaxXIqJWrZNreNCphHWbJjXSOMDqnzQDygryW/
 hJ9lWTzA/5oxlEsbyZxmAvWiVOZ1e1uy
X-Google-Smtp-Source: AGHT+IEZenXNbe8Yp7WLN0CAgoD3k8MKoye5E3zPSOnTirvw9K1meYaPJSbzpPk5H77VXno7kPIAXg==
X-Received: by 2002:a05:6a21:1796:b0:1e0:ca95:3cb3 with SMTP id
 adf61e73a8af0-1e1dfe96d96mr6748744637.37.1734122301541; 
 Fri, 13 Dec 2024 12:38:21 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:51cf:9cf:d2f2:d49e:7bd9?
 ([2804:7f0:bcc0:51cf:9cf:d2f2:d49e:7bd9])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72918ac53cdsm210960b3a.23.2024.12.13.12.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 12:38:21 -0800 (PST)
Message-ID: <b6ed5e56-b50c-4287-9d8d-466f6f6b13ff@ventanamicro.com>
Date: Fri, 13 Dec 2024 17:38:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 51/71] hw/riscv: Constify all Property
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:OpenTitan" <qemu-riscv@nongnu.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213190750.2513964-56-richard.henderson@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241213190750.2513964-56-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x429.google.com
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



On 12/13/24 4:07 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   hw/riscv/opentitan.c       | 2 +-
>   hw/riscv/riscv-iommu-pci.c | 2 +-
>   hw/riscv/riscv-iommu.c     | 2 +-
>   hw/riscv/riscv_hart.c      | 2 +-
>   hw/riscv/sifive_u.c        | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index e2830e9dc2..8ce85ea9f7 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -306,7 +306,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>           memmap[IBEX_DEV_IBEX_CFG].base, memmap[IBEX_DEV_IBEX_CFG].size);
>   }
>   
> -static Property lowrisc_ibex_soc_props[] = {
> +static const Property lowrisc_ibex_soc_props[] = {
>       DEFINE_PROP_UINT32("resetvec", LowRISCIbexSoCState, resetvec, 0x20000400),
>       DEFINE_PROP_END_OF_LIST()
>   };
> diff --git a/hw/riscv/riscv-iommu-pci.c b/hw/riscv/riscv-iommu-pci.c
> index a42242532d..a695314bbe 100644
> --- a/hw/riscv/riscv-iommu-pci.c
> +++ b/hw/riscv/riscv-iommu-pci.c
> @@ -157,7 +157,7 @@ static void riscv_iommu_pci_init(Object *obj)
>       iommu->icvec_avail_vectors = RISCV_IOMMU_PCI_ICVEC_VECTORS;
>   }
>   
> -static Property riscv_iommu_pci_properties[] = {
> +static const Property riscv_iommu_pci_properties[] = {
>       DEFINE_PROP_UINT16("vendor-id", RISCVIOMMUStatePci, vendor_id,
>                          PCI_VENDOR_ID_REDHAT),
>       DEFINE_PROP_UINT16("device-id", RISCVIOMMUStatePci, device_id,
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index bbc95425b3..07fed36986 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -2235,7 +2235,7 @@ static void riscv_iommu_unrealize(DeviceState *dev)
>       g_hash_table_unref(s->ctx_cache);
>   }
>   
> -static Property riscv_iommu_properties[] = {
> +static const Property riscv_iommu_properties[] = {
>       DEFINE_PROP_UINT32("version", RISCVIOMMUState, version,
>           RISCV_IOMMU_SPEC_DOT_VER),
>       DEFINE_PROP_UINT32("bus", RISCVIOMMUState, bus, 0x0),
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index 613ea2aaa0..0df454772f 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -27,7 +27,7 @@
>   #include "hw/qdev-properties.h"
>   #include "hw/riscv/riscv_hart.h"
>   
> -static Property riscv_harts_props[] = {
> +static const Property riscv_harts_props[] = {
>       DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
>       DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
>       DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index c5e74126b1..124ffd4842 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -936,7 +936,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>                          qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_QSPI2_IRQ));
>   }
>   
> -static Property sifive_u_soc_props[] = {
> +static const Property sifive_u_soc_props[] = {
>       DEFINE_PROP_UINT32("serial", SiFiveUSoCState, serial, OTP_SERIAL),
>       DEFINE_PROP_STRING("cpu-type", SiFiveUSoCState, cpu_type),
>       DEFINE_PROP_END_OF_LIST()


