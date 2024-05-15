Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E590C25B75
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 May 2024 14:29:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s7Fd2-0004Q4-1X; Wed, 15 May 2024 10:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s7Fcz-0004Pi-Lz
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 10:29:10 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s7Fct-0002WP-RP
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 10:29:07 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6f453d2c5a1so5634859b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 15 May 2024 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1715783342; x=1716388142; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j2FphmbtgviWL+zG3JkC2VAaBk1Ef1R0FdqlMN2GJKQ=;
 b=blixabO4FZ7hBN+l2nl/eJyohbC+k2BnV13yxKH2gFrLqOA8XaGO2L9ox+6kPhUofR
 6alnibNo0Ie6DLfoYUP/iAr1uioQSRCcElw5g1JUOeW3YXIzkjo5aDizphnP8zeg9hFX
 uHFEzz6oSwAcuzpLDXqS2epBE8cwWPSj7sWRJsUZACMYijzT0ie1GbSjGndkqDgY7gsJ
 +gpXYSIa2pwu+ZB2ng9uooxyd/cRvaj3pKwCY20YtTyMn9dop9P6ngPrRksBqQdXVaAy
 inYiLlrPxUxrC020U0eR31y5NKhcApnltFssffrBxa90WUQMJMjVtR5khPW7EFYPa9gD
 kh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715783342; x=1716388142;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j2FphmbtgviWL+zG3JkC2VAaBk1Ef1R0FdqlMN2GJKQ=;
 b=JGC9ufa53roRnNYRpLSjceCH9FxLpR02oUe3mK+v2Wd8U4gDq6VDMEDE06fDgTHcDY
 CZoFj8ePGnB5vZSTYa7s2e+V8U4xCbWR24UyN319oKcgjDTKZf9w9qiWioCetwhRpo1z
 NdqswnAV5kjKc+M3HatEZn/VvBjXAo4jdKZNT7cP8GbCA94JT0B8eNVp9P9t4eruqF3m
 0Evm4Tdgj60GN27ELfWa00xxsrV76TYBKm5ZnsO3jIX0/olhj/9OkBTQMpQsrqDcSq5Z
 qogVMEUwPfBO41NQHZ65pImn57VezrlCFbEIyDiOyVgwIyIo6/YXuOT4PGEzDMP5jBnu
 eJtw==
X-Gm-Message-State: AOJu0YzcP/qm2446EuvfGpug8rnLc4Nwe8v3UpV4OjrtCg3lSn1CNrcq
 5Tbyms9TyKZ8zC/b35exS2RetJ9q0WN//zxEH/nzHQrtzLasZmi+dPx2B9gsWNA=
X-Google-Smtp-Source: AGHT+IGsKUPdr1wVs9itcXXYv/aKQXkBep50Mv2QAS6KGuOpUlREidDS5WffWYOfTLU8kGn5U+MyAQ==
X-Received: by 2002:a05:6a21:9181:b0:1af:dba9:2ff8 with SMTP id
 adf61e73a8af0-1afde130cd6mr21490661637.37.1715783341632; 
 Wed, 15 May 2024 07:29:01 -0700 (PDT)
Received: from [192.168.68.110] ([177.94.42.57])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4deb49d4csm9796610b3a.54.2024.05.15.07.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 07:29:01 -0700 (PDT)
Message-ID: <0d9ebd11-3eae-4612-ae02-790c2f382942@ventanamicro.com>
Date: Wed, 15 May 2024 11:28:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] hw/riscv: add riscv-iommu-bits.h
To: Eric Cheng <eric.cheng.linux@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, tjeznach@rivosinc.com
References: <20240307160319.675044-1-dbarboza@ventanamicro.com>
 <20240307160319.675044-3-dbarboza@ventanamicro.com>
 <637ee935-6753-468e-b003-e0f544d468fc@gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <637ee935-6753-468e-b003-e0f544d468fc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x434.google.com
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



On 5/15/24 07:02, Eric Cheng wrote:
> On 3/8/2024 12:03 AM, Daniel Henrique Barboza wrote:
>> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>>
>> This header will be used by the RISC-V IOMMU emulation to be added
>> in the next patch. Due to its size it's being sent in separate for
>> an easier review.
>>
>> One thing to notice is that this header can be replaced by the future
>> Linux RISC-V IOMMU driver header, which would become a linux-header we
>> would import instead of keeping our own. The Linux implementation isn't
>> upstream yet so for now we'll have to manage riscv-iommu-bits.h.
>>
>> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/riscv-iommu-bits.h | 335 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 335 insertions(+)
>>   create mode 100644 hw/riscv/riscv-iommu-bits.h
>>
>> diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
>> new file mode 100644
>> index 0000000000..8e80b1e52a
>> --- /dev/null
>> +++ b/hw/riscv/riscv-iommu-bits.h
>> @@ -0,0 +1,335 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright © 2022-2023 Rivos Inc.
>> + * Copyright © 2023 FORTH-ICS/CARV
>> + * Copyright © 2023 RISC-V IOMMU Task Group
>> + *
>> + * RISC-V Ziommu - Register Layout and Data Structures.
> 
> Is there still the term Ziommu today? cannot be googled. May be just a transient term during spec development? it puzzles new comers.

Fair point. I'll remove any 'ziommu' references in all patches.


Thanks,

Daniel


>> + *
>> + * Based on the IOMMU spec version 1.0, 3/2023
>> + * https://github.com/riscv-non-isa/riscv-iommu
>> + */
>> +
> 
> 

