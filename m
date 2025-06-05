Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01F1C5B543
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 13:25:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uNAaR-0006eU-Gj; Thu, 05 Jun 2025 09:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uNAaM-0006by-4s
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 09:24:46 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uNAaK-0004qA-Ag
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 09:24:45 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2350fc2591dso7975055ad.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Jun 2025 06:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749129882; x=1749734682; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dy4790QiAapTU/9dINaY6YYy/qZEB1KGF6g9bVd7Ixo=;
 b=F+7FNtkQI/zWdagp2P3fV7Qd52AHminnHScSjHUcrTrFxYy0LFuh5rQgtn8VzHRARq
 6u30uiPcJm2LXrIP0wyfgLG9CLgGFJPJoMXtRTT1BW7uAXog/S485Nen7TL7PFfY3A63
 +6QqWRkOMxSvMC4DnbLDyxanzkOpmZLM3ITrKOWLkDihM+Xx/ZpCmUShNioSaVTTNkfx
 2xb4OxlJpzy8Odl+zfTrfJ9sIYWEMjUoqhRIGdgEepCzmZRJ9J/kJ6gUnLRAf/ZAkff8
 PADtrqDkZdi0tJKAgsIAWTdJMKW4LRQLDYtQ0DjIqNXQ635KjtyWTWn51K8Fh3rCGD37
 40Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749129882; x=1749734682;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dy4790QiAapTU/9dINaY6YYy/qZEB1KGF6g9bVd7Ixo=;
 b=Xwf5rQ84NCj76hEPiRtEQanpkT2Ht2bVFnc06XO2M958EGkaKuh5hh4oXcZasdbZa2
 2z1vRAZ1C7X7h537a82YBWChRZT/IcFEmDFmH31TrsTyTAaaIIMAoExKmAijekRDKWmI
 DHPq43XSfmqKbwOpJObfCbLIoXQJYtqXrZnAVS1zLg9w0RjIZVRtxapAiC+tUHkj1shk
 GNlS11OBe4oGcAMeYybmUZVAmSlk0eMuWLQRlimZXwcpvBFv42y+grrNbVBBgx1BCT6z
 /3ZSKeznQoY8XWPCrOY47j4tM9eNf0flVy6Q55YoArxZOLXzgkr2EgTLaOPihjkbBxKn
 Dleg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkjtFHHPf/YSl/M73ekgDjia5SIB6V+p+HOntYKsrqOgPMZdkuzL8k6/kOuJE5VAAOd0qLKTgxeEzq@nongnu.org
X-Gm-Message-State: AOJu0YzhjkmYt0x1A0r1fzMAgtVs99J0f/oI3ibsJ3XkagM17iUuklyN
 5QJhIxrKJoX79r90kJwUnYnOzyiClkM4L3zMakad4vt4AOLVxz40IhKx7Wof7nlJ+Go=
X-Gm-Gg: ASbGncu6EgVBnKWxAnRV4upzgNTt1PxqjBA6jiLwOHlkVtOVM+xJI5JpUz5hMGtlzPM
 wifLCnR2mOkHIS0VyNCKjQddsfZT3fIAWK7/0NDEQ9Uny9uC8uneBEnw5BBTQC12ZISK7KdhiM+
 rZDyHNAQXzhRUpN6fwhoKfFt1iRQgJ+RvM4JfrWIq7aqwF4aGJ17rrjneLHy4mQ6Cc2q7S+qW1j
 ZgcBjYtjp7m9oEC0QJB+5Wl6iWwaFPnWoygcw9mUx3363NG2dRQRf1ckLTLuc7hFSz+SvfOVwCI
 2WYWcdKrp0Nwru0B8n/GskH+1B/kd2iDKG5VCoWHs2NaeD13yuGijZfYfpu4j/fMEcE=
X-Google-Smtp-Source: AGHT+IFS246kGsrx8xYDplw7j4Xv5CtqdZknErJI9Y0VejgLzXLRT+jBgX/i0av9TE0ZZ8Ak8q9s0g==
X-Received: by 2002:a17:902:c94f:b0:231:9817:6ec1 with SMTP id
 d9443c01a7336-235f166aa57mr49969275ad.17.1749129882366; 
 Thu, 05 Jun 2025 06:24:42 -0700 (PDT)
Received: from [192.168.68.110] ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-235e5aafa94sm24213645ad.186.2025.06.05.06.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 06:24:41 -0700 (PDT)
Message-ID: <3d1b8880-bf87-453c-9e16-06312337ffcb@ventanamicro.com>
Date: Thu, 5 Jun 2025 10:24:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] hw/riscv/riscv-iommu: Remove definition of
 RISCVIOMMU[Pci|Sys]Class
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: chao.p.peng@intel.com, david@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20250605102311.148171-1-zhenzhong.duan@intel.com>
 <20250605102311.148171-6-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250605102311.148171-6-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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



On 6/5/25 7:23 AM, Zhenzhong Duan wrote:
> RISCVIOMMUPciClass and RISCVIOMMUSysClass are defined with missed
> parent class, class_init on them may corrupt their parent class
> fields.
> 
> It's lucky that parent_realize and parent_phases are not initialized
> or used until now, so just remove the definitions. They can be added
> back when really necessary.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   include/hw/riscv/iommu.h   | 6 ++----
>   hw/riscv/riscv-iommu-pci.c | 6 ------
>   hw/riscv/riscv-iommu-sys.c | 6 ------
>   3 files changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/include/hw/riscv/iommu.h b/include/hw/riscv/iommu.h
> index b03339d75c..8a8acfc3f0 100644
> --- a/include/hw/riscv/iommu.h
> +++ b/include/hw/riscv/iommu.h
> @@ -30,14 +30,12 @@ typedef struct RISCVIOMMUState RISCVIOMMUState;
>   typedef struct RISCVIOMMUSpace RISCVIOMMUSpace;
>   
>   #define TYPE_RISCV_IOMMU_PCI "riscv-iommu-pci"
> -OBJECT_DECLARE_TYPE(RISCVIOMMUStatePci, RISCVIOMMUPciClass, RISCV_IOMMU_PCI)
> +OBJECT_DECLARE_SIMPLE_TYPE(RISCVIOMMUStatePci, RISCV_IOMMU_PCI)
>   typedef struct RISCVIOMMUStatePci RISCVIOMMUStatePci;
> -typedef struct RISCVIOMMUPciClass RISCVIOMMUPciClass;
>   
>   #define TYPE_RISCV_IOMMU_SYS "riscv-iommu-device"
> -OBJECT_DECLARE_TYPE(RISCVIOMMUStateSys, RISCVIOMMUSysClass, RISCV_IOMMU_SYS)
> +OBJECT_DECLARE_SIMPLE_TYPE(RISCVIOMMUStateSys, RISCV_IOMMU_SYS)
>   typedef struct RISCVIOMMUStateSys RISCVIOMMUStateSys;
> -typedef struct RISCVIOMMUSysClass RISCVIOMMUSysClass;
>   
>   #define FDT_IRQ_TYPE_EDGE_LOW 1
>   
> diff --git a/hw/riscv/riscv-iommu-pci.c b/hw/riscv/riscv-iommu-pci.c
> index 1f44eef74e..cdb4a7a8f0 100644
> --- a/hw/riscv/riscv-iommu-pci.c
> +++ b/hw/riscv/riscv-iommu-pci.c
> @@ -68,12 +68,6 @@ typedef struct RISCVIOMMUStatePci {
>       RISCVIOMMUState  iommu;   /* common IOMMU state */
>   } RISCVIOMMUStatePci;
>   
> -struct RISCVIOMMUPciClass {
> -    /*< public >*/
> -    DeviceRealize parent_realize;
> -    ResettablePhases parent_phases;
> -};
> -
>   /* interrupt delivery callback */
>   static void riscv_iommu_pci_notify(RISCVIOMMUState *iommu, unsigned vector)
>   {
> diff --git a/hw/riscv/riscv-iommu-sys.c b/hw/riscv/riscv-iommu-sys.c
> index 74e76b94a5..e34d00aef6 100644
> --- a/hw/riscv/riscv-iommu-sys.c
> +++ b/hw/riscv/riscv-iommu-sys.c
> @@ -53,12 +53,6 @@ struct RISCVIOMMUStateSys {
>       uint8_t *msix_pba;
>   };
>   
> -struct RISCVIOMMUSysClass {
> -    /*< public >*/
> -    DeviceRealize parent_realize;
> -    ResettablePhases parent_phases;
> -};
> -
>   static uint64_t msix_table_mmio_read(void *opaque, hwaddr addr,
>                                        unsigned size)
>   {


