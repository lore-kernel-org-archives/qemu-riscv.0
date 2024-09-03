Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093E0CD37AE
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 21:00:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1slacp-0006dw-CS; Tue, 03 Sep 2024 16:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1slacn-0006aQ-MW
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 16:59:41 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1slacm-0001rB-1v
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 16:59:41 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-70f79f75da6so1500564a34.0
 for <qemu-riscv@nongnu.org>; Tue, 03 Sep 2024 13:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1725397178; x=1726001978; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n5RS5xk514+fpa+L9VXO7OpFpPeI7jVE2v6ARmBFuo0=;
 b=XWvtv4k+MYgth0xDNZuk0deynFZ3+b5YTy1t2Vne0ceOaBxNbjuZD+AF40PFCqTxMT
 pqLKuA7X1VfSIAIW8HyOZPc6c0aLYgCFgNZK7xCLZw6Wux/bs4PifMDFH4xERkgVxdB3
 PKR0NTA/9tOGC2R2l8QtPKA3Gv4IgJv792pIE1xf/2vpJH9cs3CHL+uviAaXxOpPBvwf
 HMp6WLHLXwiFTARqnf1l5+nBR/+91H0jO/GlsxKNnALdLAH0DReWv/4/VrhdpdlXXclH
 dl3XNE3jK18+YlaF0BxneKR/OPTZpe7AUyYkw0yWLRMsvXiAIlvFJK5S8p3KrFN7TX/t
 BRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725397178; x=1726001978;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n5RS5xk514+fpa+L9VXO7OpFpPeI7jVE2v6ARmBFuo0=;
 b=OOwJzDkyTNDroatxsf9MIj/4Vt/OX+tVw266qMa9Kdf0wNCl6S20izeFfUOomP8IQY
 4jbDmVpvt2Br7ocy54DUWjddbmdkQBXXAGP3IzhimaceL34dBpmgV5WXkkKf2XJugSp7
 SYYCe3zDFJbwlVR2R9TpXKB5ol1GKGyiuDtWlhkivs5mRyiA9bitRqnJLglfHa13j727
 JfiXYNhW78CY9DGquHaIi5b5+hbOnQV6dP/FjZdJiZkClqSNYbZLpJdSG+vwF0uCxr/l
 GesugrNwJjhCknuEgFXGK4BE8vvRlfDBeMyF+0jBH4TMixsK9/vZrn07a/bHFI6S2DKb
 Xi7w==
X-Gm-Message-State: AOJu0YybPIwoYODZ+LVpGrwzbwo5D3CPJdP2RbUWUN3hOqjd88LRaS8i
 i7PJkEhxvlV/kVa+/MJlNSK/bQ63kuGx3eY4mQkwgqtor0FyAOVe/4Z5aFX1YXM=
X-Google-Smtp-Source: AGHT+IHnVgqf9SWCCQb3/Ytw/XXeX7jvpqHfdhiRg+sqE3aPRSnlrOiCJFMiN+tKLhsx+naj15S+9w==
X-Received: by 2002:a05:6358:560c:b0:1aa:c8b7:4224 with SMTP id
 e5c5f4694b2df-1b8124122bbmr455777855d.17.1725397177798; 
 Tue, 03 Sep 2024 13:59:37 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.227.130])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d4fbd92ea6sm314697a12.51.2024.09.03.13.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 13:59:37 -0700 (PDT)
Message-ID: <15847782-3e37-43cd-9248-8cb35e1164bd@ventanamicro.com>
Date: Tue, 3 Sep 2024 17:59:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/12] exec/memtxattr: add process identifier to the
 transaction attributes
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, tjeznach@rivosinc.com,
 Frank Chang <frank.chang@sifive.com>, Jason Chien <jason.chien@sifive.com>
References: <20240903201633.93182-1-dbarboza@ventanamicro.com>
 <20240903201633.93182-2-dbarboza@ventanamicro.com>
 <f091410b-5ffb-482f-bafd-4f608755baa6@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <f091410b-5ffb-482f-bafd-4f608755baa6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 9/3/24 5:31 PM, Richard Henderson wrote:
> On 9/3/24 13:16, Daniel Henrique Barboza wrote:
>> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>>
>> Extend memory transaction attributes with process identifier to allow
>> per-request address translation logic to use requester_id / process_id
>> to identify memory mapping (e.g. enabling IOMMU w/ PASID translations).
>>
>> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
>> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>> Reviewed-by: Jason Chien <jason.chien@sifive.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   include/exec/memattrs.h | 5 +++++
>>   1 file changed, 5 insertions(+)
> 
> What is this for?  What is different about it than requester_id?

The IOMMU memory region uses both the requester_id (internally called device_id) and
the process id (the PASID for PCI devices) to identify a context because the IOMMU
allows the same PID to be used by multiple requester_ids. Using only the requester_id
is not enough to identify the IOMMU context.


Thanks,

Daniel

> 
> 
> r~
> 
>>
>> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
>> index 14cdd8d582..e27c18f3dc 100644
>> --- a/include/exec/memattrs.h
>> +++ b/include/exec/memattrs.h
>> @@ -52,6 +52,11 @@ typedef struct MemTxAttrs {
>>       unsigned int memory:1;
>>       /* Requester ID (for MSI for example) */
>>       unsigned int requester_id:16;
>> +
>> +    /*
>> +     * PID (PCI PASID) support: Limited to 8 bits process identifier.
>> +     */
>> +    unsigned int pid:8;
>>   } MemTxAttrs;
>>   /* Bus masters which don't specify any attributes will get this,
> 

