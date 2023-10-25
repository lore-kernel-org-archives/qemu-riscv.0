Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8A5C25B6B
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 23:50:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvndR-00014r-9g; Wed, 25 Oct 2023 19:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvndQ-00014L-BA
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:50:00 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvndO-00031q-5c
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:50:00 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-57f0f81b2aeso193171eaf.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 16:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698277796; x=1698882596; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RRcMOXdLTFiJNFDEMtEdbKOe+vDpUp7f1AGqPLlKd2s=;
 b=JYwsS0yNbWwHw7YMUuN3Ds0M0oIeMkIa9lMH1SutvCdAce/o2oemqf+I9FhWW3/aU4
 1cdAuEzDI//o0Ze+mgdkMvVecvh0Wds3jLVLWVQIwjjTnZsU7XVN6dUbXLHlJxoqGshJ
 v+x+w6+m9BkPOmw3jLGkAYXJ49y7NJfo2hA+3yFyFIkdozitPDFnP44oB5wdmlooGmlK
 wpCvCBNRn5EKEJIQU5BK6Xl4lnKmvxMBaT/F46k0C6neJH19zKIsKgOXw5grdfOhdtgZ
 F4Jsy3LExNAQ2PXil2CYMSyBvTqHOhMdtI2c7z6S3aLFeZiU9qxVTFhxWvJySRHON6kF
 7yZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698277796; x=1698882596;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RRcMOXdLTFiJNFDEMtEdbKOe+vDpUp7f1AGqPLlKd2s=;
 b=aUmhhiUx1HpJXmDmMV20qf4jKiOTn4/rZWnKNHPGdP8odEGgAfh8UvxOTbOrBxxfwB
 lpeTGRC1h1bvqDTnUwypoIEwaRN718JekJNsN1pyFfxHGRQ59js5cCXLTRjQmJg8hIao
 geQWXx4cOHysEtqw0Le7+3gGMLWtley5M74AuK9GLkDcSiQPLafwy/6vB5+0R3iIXrEl
 zch7aHR46bD92hP95TwjwtdL5LFV9e6d6dcLsszSME8sogfeb/8d34oATWlCN0cSz1ZK
 eCi/5pfwpI7l7vIvSw1RqmRVwMP2yF59/iGjB0o582ry+0Na1vYugk7m3zzAdIBB7gZJ
 UUPQ==
X-Gm-Message-State: AOJu0Yx8BfxScWsJKg+WktxT4BJi/6fS+ziOf5uGRj2u/XuLLz/yDBqe
 HLF+ASxgWESeKqoSYU+fdqxLdw==
X-Google-Smtp-Source: AGHT+IHiw/8XRFKR7AddaxtGE8Ay3Vtkzm87hAHQ4ZVpYqgOs5JBaShTnBoU2EqKn8Vz8EX7sZ4qGg==
X-Received: by 2002:a05:6358:218d:b0:168:e158:465 with SMTP id
 v13-20020a056358218d00b00168e1580465mr10000351rwb.3.1698277795986; 
 Wed, 25 Oct 2023 16:49:55 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a655187000000b0056b6d1ac949sm7897809pgq.13.2023.10.25.16.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 16:49:55 -0700 (PDT)
Message-ID: <a6e79c43-2672-4637-aecd-8b350631e41c@linaro.org>
Date: Wed, 25 Oct 2023 16:49:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] target/riscv: add rva22u64 profile definition
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20231025135001.531224-1-dbarboza@ventanamicro.com>
 <20231025135001.531224-2-dbarboza@ventanamicro.com>
 <585e307c-5c08-4bee-a9d3-2965c4be494f@linaro.org>
In-Reply-To: <585e307c-5c08-4bee-a9d3-2965c4be494f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc32.google.com
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

On 10/25/23 16:48, Richard Henderson wrote:
> On 10/25/23 06:49, Daniel Henrique Barboza wrote:
>> +/* Optional extensions left out: RVV, zfh, zkn, zks */
>> +static RISCVCPUProfile RVA22U64 = {
> 
> const.
> 
>> +    .name = "rva22u64",
>> +    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC,
>> +    .ext_offsets = {
>> +        CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
>> +        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
>> +        CPU_CFG_OFFSET(ext_zbs), CPU_CFG_OFFSET(ext_zfhmin),
>> +        CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_zicntr),
>> +        CPU_CFG_OFFSET(ext_zihpm), CPU_CFG_OFFSET(ext_zicbom),
>> +        CPU_CFG_OFFSET(ext_zicboz),
>> +
>> +        RISCV_PROFILE_EXT_LIST_END
>> +    }
>> +};
>> +
>> +RISCVCPUProfile *riscv_profiles[] = {
>> +    &RVA22U64, NULL,
>> +};
> 
> const RISCVCPUProfile * const riscv_profiles[]

Ho hum, nevermind.  I see they actually have writable elements.


r~

