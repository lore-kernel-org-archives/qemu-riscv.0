Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159AAC0219D
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 14:47:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiaUd-0001Ff-VK; Thu, 13 Feb 2025 09:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiaUI-0001DH-OF
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 09:46:46 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiaUG-0002Dp-3n
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 09:46:46 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so7214695e9.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Feb 2025 06:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739458002; x=1740062802; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bHTGtPq57PXv4pUPdrR5UDSsO8SFpPQJk2kZVsswnOo=;
 b=BXGKJmdZ/sWYjN4xt/BL7VSAV5APwaQmKMfeiA3gmnv3IfldIzN+xrR8vB9sj6sR30
 hucHcvbns1Yx/Ho2XN2OZpElMZKNjTgmmgqrv+7Y9MTghv7+I+4rIdWOTL/eLEGTCBWE
 7OcDxT0Snud3PxZwgvBbOfzd5CTMv5xwz/sXHo/kHwnx34uCBlVGD0VPTQvAWagJE3Pl
 2GCfWVu90VfUWwS054COOs5SJgtyQ8u/6OmxyNaGnkSA/hGL63bmTTVMPHB5K71dcmmN
 KiA73rQCaHRjlNBPb5wJlEGbr7tHICxoHPlMbGv/ovEIdJCHLL1FLCfFRKdc7QDkstIG
 aoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739458002; x=1740062802;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bHTGtPq57PXv4pUPdrR5UDSsO8SFpPQJk2kZVsswnOo=;
 b=H2CnSbbaBSl3StEfjy5s/uCdySYKGbm9wuktI/8dO/H+3RA7oU8GzGtWXUx6s+D8YZ
 DgAlJkUseFPgDDgCBoGXwbRXe/xUBFzZUE4yiRB+oUIdzXvQDQiAp+U/02mcRWVxM6cz
 kIHf9sv+AoKd3zmD40ZQxQH3uqxgZoJmR/x+pDdsL5NWLdRfE3G+nB726y/1vhgpkYtM
 3wPtOr5+7iutnGPc4Kp0RL91eamyoYF+VkIrQ3aRnbieBi9a+Rhb3PnBeetyh2YFfPMn
 YcUhMhbUe5lfLzshPgkfl+Kiqk5WX4Kvkh+8VgAN9wnY+dV6Q1iPsvaIhPetrPZRy8iq
 wsGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw2uoRK2c/asjaI9P+in2F0lQS8xT/fAp22tR/cmMOV6g5Rrk+Ws6cMmNt2suk1NmVlzrFqWmkH7+A@nongnu.org
X-Gm-Message-State: AOJu0YyGzIeKJ2pZskaxXO/guJutPuhyu8T/HwvqnzDVHJCKU0V+byUQ
 RDpE7jq/+qykBpaLACptV9jnYJGse2Olw8im5kD5/YxAXxTr8kL94ooXXfYDyAY=
X-Gm-Gg: ASbGncvJfpsJx9jnT447KXAPVkCehEVuvqnXly6OS1aSeq3kijncWok7sNpRuqgDWzV
 qsl+3Mry1mTf2iAc74s5KvCjGiV/kRHYTxCIuP4UmxGfYrXAR2J3EAwLsVySrEXkmOOxpy97/+C
 f2U5VjOhJ0/i1eLJ0mGoqARGkDWqRoLLW+LbfONVg5SZpsXS+KMnP9UVmzgWDLzcxQexBOzaTgL
 nkdPPua+DKoPbg8/JKq2JAeyJ4NdSKoio5KV+5ct37cMpdzKk677HkRvSkPYTxbCkD5DZD3FvC9
 HTbAOKNKs7CcvYur4c3EFY3xysZdzx4pc3YC4AYs5DWgKe0DhHulwrxmsHffLVAAmu1LbUZVhA=
 =
X-Google-Smtp-Source: AGHT+IHV7izYXGLj0MG+10bU+iYRH4xvZ3ZJwje7yJ2B884RYSjy6BJes1WxRB8pSS7HGB9GK9f1Jg==
X-Received: by 2002:a05:600c:1c92:b0:434:f739:7ce3 with SMTP id
 5b1f17b1804b1-43958173ef5mr77044265e9.8.1739458001688; 
 Thu, 13 Feb 2025 06:46:41 -0800 (PST)
Received: from [192.168.1.20] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f217sm50363975e9.1.2025.02.13.06.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:46:41 -0800 (PST)
Message-ID: <ba4ea2d8-14d1-4952-b3bd-6dc9aadcb614@linaro.org>
Date: Thu, 13 Feb 2025 15:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: silent warnings about Smdbltrp/Smrnmi being
 disabled
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Tommy Wu <tommy.wu@sifive.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20250213075221.622676-1-cleger@rivosinc.com>
 <6ac67c25-9ad7-42f6-b246-24053ce37ddc@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <6ac67c25-9ad7-42f6-b246-24053ce37ddc@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 13/2/25 12:32, Daniel Henrique Barboza wrote:
> 
> 
> On 2/13/25 4:52 AM, Clément Léger wrote:
>> As raised by Richard Henderson, these warnings are displayed in user
>> only as well. Disable them for CONFIG_USER_ONLY.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
> 
> I'm second guessing having these warnings at all.
> 
> Sure they serve as a warning for us, developers, that something needs to
> be revisited (e.g. after an OpenSBI update). However it will degrade user
> experience with warnings related to something out of the user control.
> 
> Instead of adding CONFIG_USER_ONLY gates for these warnings I believe we're
> better of removing them. We can add TODO/FIXME tags in the code if there's
> something that we need to revisit at a later time.

You can also convert them to trace events, which are less invasive,
or warn_report(). But IIUC this case I agree a comment is good enough.

> Thanks,
> 
> Daniel
> 
> 
>>   target/riscv/tcg/tcg-cpu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>

