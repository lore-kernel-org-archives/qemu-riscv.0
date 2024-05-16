Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16F7C25B74
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 May 2024 14:00:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s7beV-0004NH-Ho; Thu, 16 May 2024 10:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s7beS-0004LD-5f
 for qemu-riscv@nongnu.org; Thu, 16 May 2024 10:00:08 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s7beP-00054J-KR
 for qemu-riscv@nongnu.org; Thu, 16 May 2024 10:00:07 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1edf506b216so56462645ad.2
 for <qemu-riscv@nongnu.org>; Thu, 16 May 2024 07:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1715868000; x=1716472800; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1+cLxh7WiJ2rnnRCEJ4O6GUBbbMkGy+/ZDUfnRBVYVc=;
 b=E3s+uW/PF40I/hx++hYWrzdEq7AwjbyrebNWWiXKQmJvV5QeXf1v7eZLV/IHqtayhQ
 Dt+CvVO6JcrK1F7VOYdBJkTcgF26yFoRIev5hpLVJxN2kp7gNkDrwOvw3UW/zlR2nAri
 gd1UZubDN6uijxVbn001QEamuNBHa0I4XMzhiJ3WsDXM9+3AvzVQE22MiaOMJd3U8H6k
 6mZg78sp7syhD3t2AzifkiiE/fapKJ29Kdd//AAyRyS9gKtYsq8x3nfoG2TyxC1euV2B
 NX979/8eyealZNkAdUaRdB7RLSzGMPfc+3Au4Pr7qMtN9tEx7HvAC6DLYvPaMck1xM1s
 0dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715868000; x=1716472800;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1+cLxh7WiJ2rnnRCEJ4O6GUBbbMkGy+/ZDUfnRBVYVc=;
 b=Y2KhwrrdIBOG3CMy0Hhazzz62MaBVMJr5xrSkoLgIcn8wAW3wLeAySnxT4dUZebSE3
 bJTJ4S0jhg88NONgKJ4fjW+hQTcEpZvQEjBTku3JT0aiElCrfqZWC77414EhZ1M0PzYY
 tlhD2MIRoGRpKK3424gklaNGeP5oQ6NUxjW50BDyefboJK0Yw+6v78OgjNalzXQ5TiUg
 b+a+aNLwz55PJ1QTn+nVtwy5zyoCzQJN890nrE9y68sRzSRl31kGloaGNXUJj05ftt0K
 zw7XqdA17g+XtOB6OxhW2j3bheR3lN0TyOrXu7Om+RVYrAxTxvRB5onjSQDAQPA71gLt
 krrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4a6ZZOW/Dz30pcNIja6vEWCI1gaN/kL1rHrdZOTX7q3qydO5bDMbhU/E06eCKlNhAOkXMPUEx8NG9ie5FR1hX0mKXcoU=
X-Gm-Message-State: AOJu0Yx00swTMgyPLdX1hJxncgWXDALKcZwOfzOhhsn/0qd8YI2KRavD
 UsSKyNb9XeLRxKKrpAMpIC+cCXusYxPRHPKQQ4cjvUOG4MX/JAWR825fWb/o+uA=
X-Google-Smtp-Source: AGHT+IGEIrwFD904mWvly+yZXXWRoO1/Wz7bT61a7cHFmA+LUZ2JVSa6yBhKorr99h/4V5FK0HwJig==
X-Received: by 2002:a17:902:e5cb:b0:1eb:63d9:8d85 with SMTP id
 d9443c01a7336-1ef43d2e27bmr245926885ad.14.1715867999522; 
 Thu, 16 May 2024 06:59:59 -0700 (PDT)
Received: from [192.168.68.110] ([177.94.42.57])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d44e0sm142377685ad.4.2024.05.16.06.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 06:59:59 -0700 (PDT)
Message-ID: <93b5d431-13db-4c44-8546-5b94e293b9e1@ventanamicro.com>
Date: Thu, 16 May 2024 10:59:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] hw/misc: EDU: add ATS/PRI capability
To: Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, ajones@ventanamicro.com, tjeznach@rivosinc.com
References: <20240307160319.675044-1-dbarboza@ventanamicro.com>
 <20240307160319.675044-16-dbarboza@ventanamicro.com>
 <CANzO1D3sxSqXS6x1WkQDpyZ=T9nLQwHJCJRm=2FJn5OtrVN_mw@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CANzO1D3sxSqXS6x1WkQDpyZ=T9nLQwHJCJRm=2FJn5OtrVN_mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
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

Hi Frank!

On 5/7/24 12:32, Frank Chang wrote:
> Hi Daniel,
> 
> Daniel Henrique Barboza <dbarboza@ventanamicro.com> 於 2024年3月8日 週五 上午12:05寫道：
>>
>> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>>
>> Mimic ATS interface with IOMMU translate request with IOMMU_NONE.  If
>> mapping exists, translation service will return current permission
>> flags, otherwise will report no permissions.
>>
>> Implement and register the IOMMU memory region listener to be notified
>> whenever an ATS invalidation request is sent from the IOMMU.
>>
>> Implement and register the IOMMU memory region listener to be notified
>> whenever an ATS page request group response is triggered from the IOMMU.
>>
>> Introduces a retry mechanism to the timer design so that any page that's
>> not available should be only accessed after the PRGR notification has
>> been received.
>>
>> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
>> Signed-off-by: Sebastien Boeuf <seb@rivosinc.com>
>> ---
>>   hw/misc/edu.c | 258 ++++++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 251 insertions(+), 7 deletions(-)

(...)


>> +
>>   static void pci_edu_realize(PCIDevice *pdev, Error **errp)
>>   {
>>       EduState *edu = EDU(pdev);
>> +    AddressSpace *dma_as = NULL;
>>       uint8_t *pci_conf = pdev->config;
>>       int pos;
>>
>> @@ -390,9 +603,28 @@ static void pci_edu_realize(PCIDevice *pdev, Error **errp)
>>       pos = PCI_CONFIG_SPACE_SIZE;
>>       if (edu->enable_pasid) {
>>           /* PCIe Spec 7.8.9 PASID Extended Capability Structure */
>> -        pcie_add_capability(pdev, 0x1b, 1, pos, 8);
>> +        pcie_add_capability(pdev, PCI_EXT_CAP_ID_PASID, 1, pos, 8);
> 
> This should be included in the 14th commit.
> 
>>           pci_set_long(pdev->config + pos + 4, 0x00001400);
>>           pci_set_long(pdev->wmask + pos + 4,  0xfff0ffff);
>> +        pos += 8;
>> +
>> +        /* ATS Capability */
>> +        pcie_ats_init(pdev, pos, true);
>> +        pos += PCI_EXT_CAP_ATS_SIZEOF;
>> +
>> +        /* PRI Capability */
>> +        pcie_add_capability(pdev, PCI_EXT_CAP_ID_PRI, 1, pos, 16);
>> +        /* PRI STOPPED */
>> +        pci_set_long(pdev->config + pos +  4, 0x01000000);
>> +        /* PRI ENABLE bit writable */
>> +        pci_set_long(pdev->wmask  + pos +  4, 0x00000001);
>> +        /* PRI Capacity Supported */
>> +        pci_set_long(pdev->config + pos +  8, 0x00000080);
>> +        /* PRI Allocations Allowed, 32 */
>> +        pci_set_long(pdev->config + pos + 12, 0x00000040);
>> +        pci_set_long(pdev->wmask  + pos + 12, 0x0000007f);
> 
> We should use the defines declared in
> include/standard-headers/linux/pci_regs.h for readability,
> though some of the bitfields are not defined in the header file.
> 
> Regards,
> Frank Chang
> 
>> +
>> +        pos += 8;
>>       }

I'll reply here for both patches 14 and 15.

I changed it to use the defines we have in pci_regs.h if we have the definition
in the header. When we don't have the definition I ended up adding a manual
comment in the line like it's being done up above.

I'll also add doc changes for each new feature added.

All this said, I'm inclined to remove these 2 patches from the series. It's a
way of experiment with the riscv-iommu impl but it's not a crucial part of it.
The changes I made so far, based on your review, were uploaded here:


https://gitlab.com/danielhb/qemu/-/commits/edu_pasid_v3


Thanks,

Daniel


>>
>>       if (msi_init(pdev, 0, 1, true, false, errp)) {
>> @@ -409,12 +641,24 @@ static void pci_edu_realize(PCIDevice *pdev, Error **errp)
>>       memory_region_init_io(&edu->mmio, OBJECT(edu), &edu_mmio_ops, edu,
>>                       "edu-mmio", 1 * MiB);
>>       pci_register_bar(pdev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &edu->mmio);
>> +
>> +    /* Register IOMMU listener */
>> +    edu->iommu_listener = (MemoryListener) {
>> +        .name = "edu-iommu",
>> +        .region_add = edu_iommu_region_add,
>> +        .region_del = edu_iommu_region_del,
>> +    };
>> +
>> +    dma_as = pci_device_iommu_address_space(pdev);
>> +    memory_listener_register(&edu->iommu_listener, dma_as);
>>   }
>>
>>   static void pci_edu_uninit(PCIDevice *pdev)
>>   {
>>       EduState *edu = EDU(pdev);
>>
>> +    memory_listener_unregister(&edu->iommu_listener);
>> +
>>       qemu_mutex_lock(&edu->thr_mutex);
>>       edu->stopping = true;
>>       qemu_mutex_unlock(&edu->thr_mutex);
>> --
>> 2.43.2
>>
>>

