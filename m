Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34906C3DA7F
	for <qemu-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 16:27:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sZCAZ-0001xT-46; Wed, 31 Jul 2024 12:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sZCAX-0001rh-MM
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2024 12:27:17 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sZCAV-0004IZ-Vd
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2024 12:27:17 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ff1cd07f56so39666805ad.2
 for <qemu-riscv@nongnu.org>; Wed, 31 Jul 2024 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1722443234; x=1723048034; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UmkrTGWsxOjchoXWivZL4EtWCcbP41QXDwHw+3QSMeE=;
 b=JHFJjofYW1Sp6r9ykQr7Nou8HR4Jv67RfymqTCqmaErLqpzmBCD0rk4p9GFP90+7+M
 YKwGtv4DNU3ScXqisCEaiz0+gXxifbs9YHrjp1Wv9CmZOPuu2+XlxGPSa8Z60NjChR1m
 5TiYyMIr2apa5wpERCsaOGixlFDjrVIHF76pBxonBCddS9n1w1ugoJ2704udcAoIitOR
 S7YDKz+Yqx/vPlq2nFtsqI4mFIBJkzqbNOvhXj1Y7rBh2o/wwsQCDDCwKbQO0qcQLOXx
 3E+6WvaKtsVgi0DWNL0HUoJwaFRAMAs8ppN7kuAD/cAKJmrsYG4S8n7LQ2PPBLrPXPFO
 Of6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722443234; x=1723048034;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UmkrTGWsxOjchoXWivZL4EtWCcbP41QXDwHw+3QSMeE=;
 b=iWgEdfFoSS23Hu1Lfwy0WHcIkCcJRTf4UbAWzOyRRGjR8w/I2UiL1mxPHCyBEklCen
 AQOdl3ZAu4qWs7MLRtne0ujY9Gr+8vTuwcJpkhF4JfP2yLtP3luXw2UIk50rZkvKqgpQ
 tgEm0qd67pALAN0xe4kaH9Lyl3v/CszDxUTbJ/KC20ruCrNFcrH8UPROZWfnPKsZl9kK
 gja2sSWZ/nFTUjuVIwwiBVFEbyvOOIVMlk+cm95O5MtvRgDtJM8ebICC2GahuRF0wSKN
 QlIEkPmukJK1lXlhAWqk789IfExCAQHbz8jbRW18yDqULp2BrZwEJw3j0pj0TOzRDY1n
 6EXA==
X-Gm-Message-State: AOJu0Yy8UzXETNjlF3exvkuM7HSAslTWKY7q7hpq2OJPsG1hzzyKBQhu
 VA5d1w3NUGYgxdAWA6f+WhcBmCfTFKdsOu/BtocKnNCdMzNtyUcYdglkijd0eOw=
X-Google-Smtp-Source: AGHT+IGEoktVMNf6TKeTcivVehc0roYYmOq5PghRVrFF9+E/4ovtHKQR4Rtu99j6/gpWAAFEDL8rHQ==
X-Received: by 2002:a17:902:d2cc:b0:1fa:ab25:f625 with SMTP id
 d9443c01a7336-1ff048624c5mr193515315ad.38.1722443233784; 
 Wed, 31 Jul 2024 09:27:13 -0700 (PDT)
Received: from [192.168.68.110] ([177.197.107.101])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7f94bedsm122995905ad.253.2024.07.31.09.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 09:27:13 -0700 (PDT)
Message-ID: <49fe48d5-42d0-46fc-899e-50960941c3a2@ventanamicro.com>
Date: Wed, 31 Jul 2024 13:27:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] hw/riscv/riscv-iommu: Add another irq for mrif
 notifications
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 frank.chang@sifive.com, tjeznach@rivosinc.com,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240708173501.426225-1-dbarboza@ventanamicro.com>
 <20240708173501.426225-12-dbarboza@ventanamicro.com>
 <8e54f48e-379b-42b8-8017-886ead154415@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <8e54f48e-379b-42b8-8017-886ead154415@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
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

Hi Jason,


On 7/23/24 12:25 PM, Jason Chien wrote:
> Hi Daniel,
> 
> On 2024/7/9 上午 01:34, Daniel Henrique Barboza wrote:
>> From: Andrew Jones <ajones@ventanamicro.com>
>>
>> And add mrif notification trace.
>>
>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>> ---
>>   hw/riscv/riscv-iommu-pci.c | 2 +-
>>   hw/riscv/riscv-iommu.c     | 1 +
>>   hw/riscv/trace-events      | 1 +
>>   3 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/riscv/riscv-iommu-pci.c b/hw/riscv/riscv-iommu-pci.c
>> index 7b82ce0645..d7e5f20885 100644
>> --- a/hw/riscv/riscv-iommu-pci.c
>> +++ b/hw/riscv/riscv-iommu-pci.c
>> @@ -81,7 +81,7 @@ static void riscv_iommu_pci_realize(PCIDevice *dev, Error **errp)
>>       pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
>>                        PCI_BASE_ADDRESS_MEM_TYPE_64, &s->bar0);
>> -    int ret = msix_init(dev, RISCV_IOMMU_INTR_COUNT,
>> +    int ret = msix_init(dev, RISCV_IOMMU_INTR_COUNT + 1,
> The new interrupt is not marked as used with msix_vector_use().

I took at look at what this patch is actually doing and, at least in the MRIF setup
I have, it's not doing much because we're not hitting the MRIF path inside the
emulation. So we're not hitting the trace and this extra MSI isn't being used.

Drew is taking a look into it in the kernel side. Until we get a better idea on what's
happening I'll remove this patch from the series. We can re-introduce it again later
in this series or in the follow-up.


Thanks,

Daniel

>>                           &s->bar0, 0, RISCV_IOMMU_REG_MSI_CONFIG,
>>                           &s->bar0, 0, RISCV_IOMMU_REG_MSI_CONFIG + 256, 0, &err);
>> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
>> index 2985a49e53..c9ac3d348b 100644
>> --- a/hw/riscv/riscv-iommu.c
>> +++ b/hw/riscv/riscv-iommu.c
>> @@ -621,6 +621,7 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
>>           cause = RISCV_IOMMU_FQ_CAUSE_MSI_WR_FAULT;
>>           goto err;
>>       }
>> +    trace_riscv_iommu_mrif_notification(s->parent_obj.id, n190, addr);
>>       return MEMTX_OK;
>> diff --git a/hw/riscv/trace-events b/hw/riscv/trace-events
>> index 4b486b6420..d69719a27a 100644
>> --- a/hw/riscv/trace-events
>> +++ b/hw/riscv/trace-events
>> @@ -6,6 +6,7 @@ riscv_iommu_flt(const char *id, unsigned b, unsigned d, unsigned f, uint64_t rea
>>   riscv_iommu_pri(const char *id, unsigned b, unsigned d, unsigned f, uint64_t iova) "%s: page request %04x:%02x.%u iova: 0x%"PRIx64
>>   riscv_iommu_dma(const char *id, unsigned b, unsigned d, unsigned f, unsigned pasid, const char *dir, uint64_t iova, uint64_t phys) "%s: translate %04x:%02x.%u #%u %s 0x%"PRIx64" -> 0x%"PRIx64
>>   riscv_iommu_msi(const char *id, unsigned b, unsigned d, unsigned f, uint64_t iova, uint64_t phys) "%s: translate %04x:%02x.%u MSI 0x%"PRIx64" -> 0x%"PRIx64
>> +riscv_iommu_mrif_notification(const char *id, uint32_t nid, uint64_t phys) "%s: sent MRIF notification 0x%x to 0x%"PRIx64
>>   riscv_iommu_cmd(const char *id, uint64_t l, uint64_t u) "%s: command 0x%"PRIx64" 0x%"PRIx64
>>   riscv_iommu_notifier_add(const char *id) "%s: dev-iotlb notifier added"
>>   riscv_iommu_notifier_del(const char *id) "%s: dev-iotlb notifier removed"

