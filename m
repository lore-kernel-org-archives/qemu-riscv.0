Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70F9C30658
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 23:08:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sOmbu-0002OT-G9; Tue, 02 Jul 2024 19:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOmbt-0002OB-29
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2024 19:08:29 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOmbq-0008KM-57
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2024 19:08:27 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1fa07e4f44eso31760175ad.2
 for <qemu-riscv@nongnu.org>; Tue, 02 Jul 2024 16:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719961704; x=1720566504; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iMJnsQvYtn2ovyexs2uGpSE8+Bh9X/JzOCx3NzsQ5Ow=;
 b=pCJg1b/cHK0ntNVVggWamc0lmw6hzrP1qEMg0ybLDbzuYxiWU6VuYJlUPFUOrG8+8V
 wXc4HgUc7pKH49eieXy5w/BtsxD6xKHrrndD6QEo+Lx0DSNyOwOaUxaJpeHsLiy220dI
 KAjSDpp75IXEZovTaHup1s6p0TTvyaFR0FJr7S9rRefbCLbxcSIwXnCSznEECIxQAEZT
 u0ErgtULwbpmC6bynmX7raOEMsgBdb+FMdNzocUIhcIH0sFWomvUc31IIpYWcIiyu8eW
 9zoybukI2jA5w1TqytKSU0dfbhRwfTccsJWSSIGiezeJ9vmKGnVMw/JrbRUgA1bwE6Ih
 3iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719961704; x=1720566504;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iMJnsQvYtn2ovyexs2uGpSE8+Bh9X/JzOCx3NzsQ5Ow=;
 b=L89NM6ANoxrBrhYH6kqlcNXQaB5aVh1X0Dbkkpay3flYZaS4qvTpU5LdhHAb3E3nkB
 a8Pt4+0SMdmR5wktQFpMHswZ9/V/v/Fa0IcftFuB7pC4j2xHALSup7A268jx9zmoo1or
 6RFI4wFNuVM8jvY0kzE6CYjw+arZLpJmNevzCLNRn2Sl+i744Fnxxe5Vjk1RLqiUj8vm
 DLWWEFn+AZSuRQexLwN5WJgDwQttJLKCsB5F+9AqhxewLAW5ek/ZOwuhwR0TTNRaOYNb
 1DkLyqy/zCKqnSf+ohL8PtzPjZ/3nEI0rEPDcrnHWE+upl3IS0MDstwFF7n0qa3y46T6
 HTrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgyzKSenTyDMT9chIcaDr5+1S0aBsFOmG9m1M3rqpVG83CvQPwDzuSKnNg1WHLgiumtneddQej0yiAhSIsD2IkpTAHp7Y=
X-Gm-Message-State: AOJu0YxApkBMdYVoXkyYQESR4MtS9VV5wykb5YOBszH3N/uuWdzeSsYz
 dOvvxPboxred9+b7035xPCMT1m8TrV4S6gxjNW6gDVp02RPnZ0I1L5MsZGfZPmU=
X-Google-Smtp-Source: AGHT+IF23JFdH5WGbhdvoCCe7OgK5NlvhswWrv2UEdsiBi5YJVuUzWvEkzZktBQedcZkDlZiSZcwgw==
X-Received: by 2002:a17:902:b192:b0:1f6:fbde:9b96 with SMTP id
 d9443c01a7336-1fadbcfce9fmr70880745ad.59.1719961704329; 
 Tue, 02 Jul 2024 16:08:24 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac0ba60a2sm92262615ad.0.2024.07.02.16.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 16:08:23 -0700 (PDT)
Message-ID: <41d6aa5b-5356-4048-8ef6-291a058f4197@linaro.org>
Date: Tue, 2 Jul 2024 16:08:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] util/cpuinfo-riscv: Use linux __riscv_hwprobe syscall
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: brad@comstyle.com, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org
References: <20240627180350.128575-1-richard.henderson@linaro.org>
 <20240627180350.128575-4-richard.henderson@linaro.org>
 <793a6bbe-5ac6-400c-b02b-9893a8887ee0@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <793a6bbe-5ac6-400c-b02b-9893a8887ee0@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 7/2/24 15:15, Daniel Henrique Barboza wrote:
> 
> 
> On 6/27/24 3:03 PM, Richard Henderson wrote:
>> With recent linux kernels, there is a syscall to probe for various
>> ISA extensions.  These bits were phased in over several kernel
>> releases, so we still require checks for symbol availability.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   meson.build          |  6 ++++++
>>   util/cpuinfo-riscv.c | 26 ++++++++++++++++++++++++++
>>   2 files changed, 32 insertions(+)
>>
>> diff --git a/meson.build b/meson.build
>> index 97e00d6f59..58afd0125d 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2837,6 +2837,12 @@ have_cpuid_h = cc.links('''
>>     }''')
>>   config_host_data.set('CONFIG_CPUID_H', have_cpuid_h)
>> +# Don't bother to advertise asm/hwprobe.h for old versions that do
>> +# not contain RISCV_HWPROBE_EXT_ZBA.
>> +config_host_data.set('CONFIG_ASM_HWPROBE_H',
>> +                     cc.has_header_symbol('asm/hwprobe.h',
>> +                                          'RISCV_HWPROBE_EXT_ZBA'))
>> +
> 
> FWIW I looked around Linux and I think we can snapshot hwprobe support by
> checking for RISCV_HWPROBE_KEY_IMA_EXT_0 (Linux commit 162e4df137c) if we
> ever need hwprobe for exts earlier than ZBA (C and V).

Sure.  It'll take some effort to use RVV for TCG vector operations.  :-)

> 
> Checking for ZBA is fine for this patch though.
> 
> 
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks.


r~

