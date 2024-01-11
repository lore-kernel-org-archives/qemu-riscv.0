Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C74C47422
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:54:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNwRb-00055D-HM; Thu, 11 Jan 2024 09:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rNwRa-00054u-58
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 09:54:06 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rNwRY-00026x-GV
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 09:54:05 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d3eae5c1d7so29432125ad.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 06:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704984843; x=1705589643; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uH2Jp9YOpfFP7sHNePpZpIbL/BrZQiETtghIf2tm2Xo=;
 b=eYxuRAbYEppcS7fCRhIZ8/SBwLSpaWb8/AZ/3JEOg5ggyWzxkvsbFQmQsyKDj3Yxj8
 /JWNLwSkwojjygOZOPLdUarI2rVfi1dYxgDKmYMIwXTmh+m9HbPhqB67oOc7F0Y0Rjpu
 fefLgDnm5akSymh+cDxZR8/HKDKNWQVgxCbGic617JgkigW0KeAlzL3rYwHdzoY6TZmh
 xzFanRcZ8LQhPcQpTng5KAPhZVXttVj3bGieuretDO3BLTWqTCsollJjb7wRHwBqewiY
 CpfAzuFmqld/1wqI8B0bxRtCf5/g2IO73i/2ycDH8Mw9GOuKldMfGp+03xFWylHKi8Dy
 k9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704984843; x=1705589643;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uH2Jp9YOpfFP7sHNePpZpIbL/BrZQiETtghIf2tm2Xo=;
 b=S2nINRiWayx/A9NeXXlYPd6g2WSLWn3jmSH1l8BPdBbwfQ/dCiDdXf8W8w9rymZxFO
 THXsky8rJoBiKCYMpH9crirTF3D7+gUeKVjrv61+LGGZgO+BKyMGgsWEP1SOYf1L38XV
 nUVJAUCvPNC020PYG2aVmBhgQ/05JSzZu6Qe/iCuFPerRmA4ayLF5zzKRXnkpVy9WkMw
 jb+keqAl8FEmqb6MFCQhSF3weNFXE6B3KjyNoisydZJL9It9mn4p4rTJP/j1a064lKj5
 GFFO1pom7Xa2iRkeA9SlnSuXbayShCXn3tOyqq21RJcMEdtx+AJ5p8tSbKGLhK/Jkpa5
 I+Sw==
X-Gm-Message-State: AOJu0YzQLG6AFijYzhJvu5Q6ksMD6rELiTfsUecYSrtlUeJRYu9Z9uXf
 E9g2quL6mBm0giVuX/DGvdfXFo04BGu3PA==
X-Google-Smtp-Source: AGHT+IFp4QO9L9e99lNSWiPzT2XkQE9jYA6jmu7ywes9OSWFCOMLnr5wnbVRLwRCNqAu14IFaWNWGw==
X-Received: by 2002:a17:902:bb10:b0:1d4:39cb:f916 with SMTP id
 im16-20020a170902bb1000b001d439cbf916mr1153912plb.70.1704984843019; 
 Thu, 11 Jan 2024 06:54:03 -0800 (PST)
Received: from [192.168.68.110] ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a170903409100b001d4898862cesm1251150plc.211.2024.01.11.06.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 06:54:02 -0800 (PST)
Message-ID: <ee62a091-5f44-4a25-a724-06393af41807@ventanamicro.com>
Date: Thu, 11 Jan 2024 11:53:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/riscv: Enable 'B' extension on max CPU type
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
References: <20240109171848.32237-1-rbradford@rivosinc.com>
 <20240109171848.32237-4-rbradford@rivosinc.com>
 <de442ad9-0479-4a7e-bccf-97fcd081a35e@ventanamicro.com>
 <20240111-558c99b8f3be4297e9ae4118@orel>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240111-558c99b8f3be4297e9ae4118@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
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



On 1/11/24 10:02, Andrew Jones wrote:
> On Wed, Jan 10, 2024 at 03:32:21PM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 1/9/24 14:07, Rob Bradford wrote:
>>> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
>>> ---
>>>    target/riscv/tcg/tcg-cpu.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>>> index f10871d352..9705daec93 100644
>>> --- a/target/riscv/tcg/tcg-cpu.c
>>> +++ b/target/riscv/tcg/tcg-cpu.c
>>> @@ -999,7 +999,8 @@ static void riscv_init_max_cpu_extensions(Object *obj)
>>>        const RISCVCPUMultiExtConfig *prop;
>>>        /* Enable RVG, RVJ and RVV that are disabled by default */
>>> -    riscv_cpu_set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
>>> +    riscv_cpu_set_misa(env, env->misa_mxl,
>>> +                       env->misa_ext | RVG | RVJ | RVV | RVB);
>>
>> I'm aware that we decided a while ago the 'max' CPU could only have non-vendor and
>> non-experimental extensions enabled. RVB is experimental, so in theory we shouldn't
>> enable it.
>>
>> But RVB is an alias for zba, zbb and zbs, extensions that the 'max' CPU is already
>> enabling. In this case I think it's sensible to enable RVB here since it would just													
>> reflect stuff that it's already happening.
> 
> It's also setting the B bit in misa, which, until this spec is at least
> frozen, is a reserved bit and reserved bits "must return zero when read".

This is a side effect that I wasn't aware of.

Rob, given that the 'max' CPU already has the zb* extensions enabled, is there any
other gain in enabling RVB in this CPU? If there isn't I'd rather leave this one
out for now.


Thanks,

Daniel


> 
> I don't want to stand in the way of progress and it seems 99.9% likely
> that the spec will be frozen and ratified, but, if we want to stick to
> our policies (which we should document), then even the 'max' cpu type
> should require x-b be added to the command line if it wants the B bit
> set in misa.
> 
> Thanks,
> drew

