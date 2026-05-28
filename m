Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2CFCD4F54
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:56:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSgqX-0001MK-Nj; Thu, 28 May 2026 15:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSgqW-0001LO-E1
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:56:48 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSgqU-0002YV-SB
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:56:48 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49048e043e5so54706595e9.1
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779998205; x=1780603005; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nju+bWqiSLv4j414+OVM3LqArzmjjxHIuUcGqQjDJ1M=;
 b=fc0VJWgOew6BcUyjnsR1oJpJwsyhboD3YO3BqYEOw/Nc7QGKlDENoD879KhuUPZETF
 8eqOslGwNdodTaszFXIl31hSoZ9YzbFUruSKZXVF+EYIPKIjui+wIVeT6OKnutHBiQ58
 XbfezvGiHKlvjG4xsl/w4hDkwBUhq3XTWIQGWA3/iFr2kUX/ksAvGiIvc0GYUZonD43O
 wFbyhMREFm9EboLtpfUBuOOW9rbsDxGt1nKrtCTW3rKADF6p7TYRqR5uHLSm4BuDk7rQ
 FXHmINNN2uzNDmkwhVpOE2jclETLMc2+8q4BkY+iUPUczgtz04B+YUnLTZKvUlbiixxb
 ckiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779998205; x=1780603005;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nju+bWqiSLv4j414+OVM3LqArzmjjxHIuUcGqQjDJ1M=;
 b=JxG0ylQrClUuhLvYe7uPECBTKTMUDQhTnTmJxXJoOPcysJywjWEOL6amPjGOVVbGtx
 wvzwfX9q4mJcFi7h4xQjBu8aUxXFOcVLgG7YsmXR7YBUegHWol58OFW1N9Wn4wK/3chw
 5tsZ+Nd0McuOvri8x4Jp/2t6CvKHlZK8smTEKUJQmM+NWbZP8GkCg+6+UZYz7KC2kEKb
 wF+qn8fT5plMuAjulN9Z+NTUZBmvnTLWIHD3JtMdeEThhL2/yfkYSMXqZJFymfB7CQox
 MqPYGK6v2h/V1bbPIpOVa4eVnLTTMl5DfIR/sSVfsG4bD0yRRs3l3sVhb1SH+AbqRE+K
 erkg==
X-Gm-Message-State: AOJu0YyO7yrohCfOeXzDLKMvV2AcQWsHKcRZaPMmvAHsfYvIZqKUmcui
 YopyjbNssMfD6zgVNUAe+5kNKbG0cqbBlrgayOl0wb9xv1EKe2jISH1hCFg12h16bkY=
X-Gm-Gg: Acq92OER1GKlLgTEv5Q7FXtf00fOMnV4CXL6f29AyxQabXvi1IEtJ2XSVnYz1pbcsfD
 1y+a/TullyosfqqYXvW/PeR0rBMQCiFOufNus3JkdTQsLZG3u41ejgm8gNKlppXxZnGQzDQ+vKy
 ZSyKu0BJuL1Wta/Xdr/iNDxkXM+W4MLazyN6TG/kvjIsmXrjGNLnaYscsFHFnAYiajXf/d8uv4Z
 ajXpGkDiM3TBnbRpyP0mGYHNT8WxhvEWScywQqGX2q6lpK8HN+Gt69+sQdZrOIEnE56zusOmINY
 QekziwwS12owgaEi5+lsHixp9CCSxkvcvFkHLEMCdvqoB/dXEqLqHVMDFGTptojiw46UlLz0r10
 n2zf8qCZtwfi1UCEAeyB/iFU5r7MJP4bjH0xqex9+YTbZhhkrRb2yYuAPVtsxUZdDlcD/vOgIVy
 ZtYXBxPRRpfvjaXJsA6gf0fTX/U/k4VXLVxj1GjlOtNY5KFxc5PDf+6Wd4vh2Ku01jgoKKUcCeG
 GQc
X-Received: by 2002:a05:600d:60ab:b0:490:59cc:999f with SMTP id
 5b1f17b1804b1-4909bf8b18emr927605e9.4.1779998205068; 
 Thu, 28 May 2026 12:56:45 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909284a895sm56605965e9.8.2026.05.28.12.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:56:43 -0700 (PDT)
Message-ID: <e636c43a-a613-4819-a272-61fef832627c@linaro.org>
Date: Thu, 28 May 2026 21:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/12] hw/riscv/boot: Replace cpu_to_le32() ->
 const_le32()
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Djordje Todorovic
 <Djordje.Todorovic@htecgroup.com>, Anton Johansson <anjo@rev.ng>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-9-philmd@linaro.org>
 <9d0853dd-5c22-4c46-9c42-a76d18230271@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9d0853dd-5c22-4c46-9c42-a76d18230271@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 28/5/26 21:40, Pierrick Bouvier wrote:
> On 5/27/2026 1:13 PM, Philippe Mathieu-Daudé wrote:
>> Rather than adapting the array endianness when it it
>> filled, directly initialize the CODE words with the
>> correct endianness.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/riscv/boot.c | 30 +++++++++++++-----------------
>>   1 file changed, 13 insertions(+), 17 deletions(-)
>>
> 
> One could argue original version is more readable.
> Any specific reason for rewriting things this way (performance, personal
> preference, other)?
> Not a blocker, just want to understand the original motivation.

Looking at the following changes, I think it makes more sense to
have the CODE section const little-endian, while the DATA section
is swapped. Otherwise we'd need 2 distinct loops.

> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> 
> Regards,
> Pierrick


