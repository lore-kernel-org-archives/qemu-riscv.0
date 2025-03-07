Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC25C19F32
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 12:37:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqWwc-0001kz-JS; Fri, 07 Mar 2025 07:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tqWw3-0001VF-10
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 07:36:18 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tqWw1-0006l6-7a
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 07:36:14 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2ff694d2d4dso2577903a91.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Mar 2025 04:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1741350970; x=1741955770; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Svi8si5AgIWAzn8KakdjibLEMeLRU22Y0nQmKDEIb8s=;
 b=m9jrpaBoaVLfBWgXuc25MtLVJA2LmEoPc2MWfIg3sMJucQSVSqQLjMzbWKnmMNo/ce
 UuZBP/4bPrwztHuToFcJWmEEHv4varGPv1uxbeRK6v4RvXSqxJ6iBFbVlbOXMjo+HJpI
 JNQoA0l2ad/7xCP5g4r4Q/kONYNbRzZsePRvLtSv0s6gwIIS0OnaaSAQ7v/wfrSpQW2f
 pMe9F7Fkwzr8CbLuJMD+dteheuCt+Gs5DTZLczIcqTLf8P9sOSeZp0LMzxA29tIXkkCN
 c5s6OokV1d1iOnHQVta086Fcn3+cUousZX+A8R5kCqWQjyzvroOxjg1t4mWwxDEYBees
 7QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741350970; x=1741955770;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Svi8si5AgIWAzn8KakdjibLEMeLRU22Y0nQmKDEIb8s=;
 b=VFk5auOn/aRmHI9z4wSer3Kup7ygIKI8KPeidc8Xcy+IInjYzWC/xYJpY+VLO4JAxw
 wfk4C9Q/In1Q9IUQgmWcMdxuwqdB4nyBVhvfxbtWt0zk7MxcqOvHnb5fjh44AlJYKyhE
 xt4Y+3WAvvt3dgZssI6iFuwzCmyY3kFFq5EKpmsdCe+EHnh5irwAEKApiiHVZ2MZo55Z
 dVhjUmBNCwLIhApU44JoqnxoX7MOeyzPEbT7bH9EL0pB9++U1x0oNvUQlWYs71xxgYyb
 OW9zmbPNZ+spiJg46DtPQwW1Mzisvb0t/7OZ5SGWc9Q14YypyjdH/jIt+R2kQ5QgUIUe
 sukg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/+nAFwY9egTViSnNyoHhSgEhGmq0UKR7OE06v+nN7BUQctuaKL7LKagu3lcwikVsic4Mz+sGYdtfy@nongnu.org
X-Gm-Message-State: AOJu0YxpCX/rGqQcNKcD7WoR2N0HMQkNE0mQkfuojYQlx8rR7vvuS2Qp
 ZjXfdm+WoS41Jre438MKXbFBrUiWS6/93deU4hw0HOj4ajVzh6joC7riFLNlUYg=
X-Gm-Gg: ASbGncuy8fwoj/LePtHdHutf8wGhhR+35t3luDDDnvGVpncMnD+QKMODrLwd9Tb2hGC
 PQkZDpXlYalFnIH0PJp4mp9B7cFtc1Cg/ftYlSQPtSj7eey1qisOmtWdcMBhKmSglnejXh4Tegn
 A1pMk22xl4BI9TNA4HZ4OH0huWLJPBOaGtSZgk5SvPd2s0E7FpDD5NuWA/HqvTAKMNd3w2bxSdx
 ce5SVB8iBh18b+obwIOy6y4QOxJdTQUrhIpfvsVymj3epETctiTgYXilQtM+kf5+NXTt5JoSZct
 pPziWYStvEtbkkh6BzA8urs92vH/ffI8c87WlvUlFldtU4YpXURqUjcUi7A=
X-Google-Smtp-Source: AGHT+IEKXaHmTMrBjbpVdUm8g7ch+PMR4TdGjjkAbeZQhgn8pl6/jPFVXj/lpiR8IDl/NunmMB7bhQ==
X-Received: by 2002:a17:90b:3d8a:b0:2ee:f076:20f1 with SMTP id
 98e67ed59e1d1-2ff7cd44ab7mr6228811a91.0.1741350970567; 
 Fri, 07 Mar 2025 04:36:10 -0800 (PST)
Received: from [192.168.68.110] ([177.170.118.40])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693f6bd8sm2929537a91.41.2025.03.07.04.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 04:36:10 -0800 (PST)
Message-ID: <043c02d4-d973-49da-8521-77f17f25c860@ventanamicro.com>
Date: Fri, 7 Mar 2025 09:36:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hw/riscv/riscv_iommu: Remove the "bus" property
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20250302091209.20063-1-jason.chien@sifive.com>
 <20250302091209.20063-4-jason.chien@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250302091209.20063-4-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1036.google.com
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



On 3/2/25 6:12 AM, Jason Chien wrote:
> This property was originally intended to set the bus number for non-root
> endpoints. However, since the PCIe bus number is assigned and modified
> at runtime, setting this property before software execution is incorrect.
> Additionally, the property incorrectly assumes that all endpoints share
> the same bus, whereas no such restriction exists.
> 
> With the IOMMU now retrieving the latest device IDs from memory attributes,
> there is no longer a need to set or update device IDs.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/riscv-iommu.c | 7 -------
>   hw/riscv/riscv-iommu.h | 1 -
>   2 files changed, 8 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index b72ce8e6d0..1ca85b95ac 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -1197,9 +1197,6 @@ static AddressSpace *riscv_iommu_space(RISCVIOMMUState *s, uint32_t devid)
>   {
>       RISCVIOMMUSpace *as;
>   
> -    /* FIXME: PCIe bus remapping for attached endpoints. */
> -    devid |= s->bus << 8;
> -
>       QLIST_FOREACH(as, &s->spaces, list) {
>           if (as->devid == devid) {
>               break;
> @@ -2261,9 +2258,6 @@ static MemTxResult riscv_iommu_trap_write(void *opaque, hwaddr addr,
>           return MEMTX_ACCESS_ERROR;
>       }
>   
> -    /* FIXME: PCIe bus remapping for attached endpoints. */
> -    devid |= s->bus << 8;
> -
>       ctx = riscv_iommu_ctx(s, devid, 0, &ref);
>       if (ctx == NULL) {
>           res = MEMTX_ACCESS_ERROR;
> @@ -2498,7 +2492,6 @@ void riscv_iommu_reset(RISCVIOMMUState *s)
>   static const Property riscv_iommu_properties[] = {
>       DEFINE_PROP_UINT32("version", RISCVIOMMUState, version,
>           RISCV_IOMMU_SPEC_DOT_VER),
> -    DEFINE_PROP_UINT32("bus", RISCVIOMMUState, bus, 0x0),
>       DEFINE_PROP_UINT32("ioatc-limit", RISCVIOMMUState, iot_limit,
>           LIMIT_CACHE_IOT),
>       DEFINE_PROP_BOOL("intremap", RISCVIOMMUState, enable_msi, TRUE),
> diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
> index a31aa62144..655c0e71a8 100644
> --- a/hw/riscv/riscv-iommu.h
> +++ b/hw/riscv/riscv-iommu.h
> @@ -34,7 +34,6 @@ struct RISCVIOMMUState {
>       /*< public >*/
>       uint32_t version;     /* Reported interface version number */
>       uint32_t pid_bits;    /* process identifier width */
> -    uint32_t bus;         /* PCI bus mapping for non-root endpoints */
>   
>       uint64_t cap;         /* IOMMU supported capabilities */
>       uint64_t fctl;        /* IOMMU enabled features */


