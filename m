Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F99DC02194
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 10:13:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfysT-0001Uv-KZ; Thu, 06 Feb 2025 05:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfysQ-0001SZ-6A
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 05:12:54 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfysL-0002Hj-Oi
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 05:12:52 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so7771335e9.1
 for <qemu-riscv@nongnu.org>; Thu, 06 Feb 2025 02:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738836768; x=1739441568; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=74qmYuiEHZsoW3qpFUrxotGCmscxu7yjDuGjZCX+Wj4=;
 b=FavQIoe8K4z4kG9CRNFVQgkIPyME1YRyt6NwqjfPxDljRyG4Z5n4ZHfwDhh+oVeKJN
 +BV0GOtoDkkMRHvPsa48XWktLIJ1jnOYahks0fpRpKE9aV4OIchD07ON14+vvEHTLJr6
 cBsbDNtTsLjUkJC19BgVjXvx9ibIExG3qEwonkHazYgE3vD2x7CQEXYpyEIgFX0lQOHi
 zCcDKpD2CPkSdH6jmUMJbp71bnXU0dJhe2hGg26wY1+VKSkpnUtpEoTb354PqpiauyKT
 k/U0NUwDnvG85eljxpLTOlLgkeI3RqgcMPS8eplDNTMspud1ELurwqF0HG1zxpNqTevo
 8egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738836768; x=1739441568;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=74qmYuiEHZsoW3qpFUrxotGCmscxu7yjDuGjZCX+Wj4=;
 b=ct+m5wcvl89l1nTVep3zu5nXj0RyKi31MYMg8f3+b4x6LXgOoaeAHAhsTk+gDAqWX0
 Z8/KdSKeqr6EgIk/469i2q2OuCbuyeLXL26cPscWTa52Klbv+7lqwDpPpeENyRZ0OoIk
 U9ZYsuGk4OPSvk7l4R2FksPkwPF/eaM5rXD5MrEjeKYktoDfR5/pcR+gzOgZWvR6Qb2X
 xGkwzI0nGRjM9oTrXO9Dpxzwef75gaobdjiM79sbpx6pWtRBeUXBN4d608VCw4cb1MHn
 cJQyxOMwLVbZGip7nZZZNTInvKxteQqkwWTHn6tPQK/z1Wlmd0iMNh3Zg35JewUC+ahS
 ImvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqksnPMIFZsnBu826afEMcBiq+z8BKn4z8AIgMWKvLeBh3SaxughmvXPUcHDt9Cq0q6IfcdXPaSl8U@nongnu.org
X-Gm-Message-State: AOJu0YxpJVItvceSMqbHE8ewNjwi/OhCl3NCd8VA1oqYp06KyOj75sRq
 Y+cuaTATOawzxKIMQi3QajIJMnuC5GN2XPr8ZzBJx8Yns0L01/gO16X7TaNtb4w=
X-Gm-Gg: ASbGncunEh17TFpYFmBWfq0h7oFbrs9A7PoMrIfUFH4utXXflOAFjadTN+sJDCR3B+O
 d8gSdrHuYTeDCo4SohQ975UPrngltXAPbQxg0ehMTqoAwxR+mwBazsQTFj2IBhi8ccGjgT6PPkO
 c+R5gt9qUMwpm8wl2VMSUYVZOOK134LyecfFpz3VEPHcc17oOibEEo4++loQtKVNzTli9V1BlpX
 UVJwqiwl+fs69AqSe0PRxgSKBrPoJU0bhLgSr3pLQZMOnZfcySR6Aoh6eDcNfXF4/qQ08JIJASv
 /vE3cVN0NeNVDfU5ovjietVyHBh496yQizE770gDgjAxAKx2UVq/SLPkDWY=
X-Google-Smtp-Source: AGHT+IG8UN2JRUsaTbO/GEIpX0lp3+G9jpKZxO8CSvmHpdU80rjLnqFlC5G5cIUzm1EWYeXdfMw9rg==
X-Received: by 2002:a05:6000:a8a:b0:385:e37a:2a56 with SMTP id
 ffacd0b85a97d-38db48fec0bmr3972471f8f.52.1738836767869; 
 Thu, 06 Feb 2025 02:12:47 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd1b9b3sm1336405f8f.13.2025.02.06.02.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 02:12:47 -0800 (PST)
Message-ID: <34235ce5-9f6c-4968-a8c1-ab868389e9cf@linaro.org>
Date: Thu, 6 Feb 2025 11:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] hw/boards: Remove all invalid uses of
 auto_create_sdcard=true
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-5-philmd@linaro.org> <87a5b07u1d.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87a5b07u1d.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 5/2/25 08:03, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> MachineClass::auto_create_sdcard is only useful to automatically
>> create a SD card, attach a IF_SD block drive to it and plug the
>> card onto a SD bus. Only the ARM and RISCV targets use such
>> feature:
>>
>>   $ git grep -wl IF_SD hw | cut -d/ -f-2 | sort -u
>>   hw/arm
>>   hw/riscv
>>   $
>>
>> Remove all other uses.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Impact?
> 
> As far as I can tell, this stops creation of the if=sd default drive
> these machines don't actually use.  Correct?
> 

Yes, since these machines don't expose a SD-bus, the drive can
not be attached and always triggers the same error:

$ qemu-system-hppa -sd /bin/sh
qemu-system-hppa: -sd /bin/sh: machine type does not support 
if=sd,bus=0,unit=0


