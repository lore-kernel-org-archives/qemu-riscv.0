Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C37C02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:06:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thbuh-0006l0-Qa; Mon, 10 Feb 2025 17:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbud-0006k3-AG
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:05:55 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbuZ-0000Hk-9z
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:05:54 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38dcae0d6dcso2027785f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 14:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225137; x=1739829937; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1iLQ3Fcjem5IgImYsaao2KKU5aHeiU/l6CC9WMjgOAM=;
 b=QoYK5IndW7diMnFGkUluCKChc3KEC2nh2KK6xfeiuBu17hAuJ+X28XEMYPfcMNoawv
 vR/7m16xER3jSnQWnrNYOmtMq8RLo7DsOUl/FG2UO5HH2tcMvVUTdcnFl3VFi5i94s9I
 K98u8Dx2oMUr419Ny7+I2ovlGHJ7fP3Bl2jWrXlmlyFGWZRJG3S6zFz/oWiTa5aTQfPU
 hkGEdAmTa3kO+HJRzn8WBl8IpGnAtV7qY2yD1T8tSTxLKLB2TSHC4IOZjP0K1Cu0Hm9L
 r94Vvwroo6JRbpzQW32C9k/FLl1OplyDV5ysjppptAiMctsjJcmaweo1M19egEaggqli
 Pptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225137; x=1739829937;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1iLQ3Fcjem5IgImYsaao2KKU5aHeiU/l6CC9WMjgOAM=;
 b=UbkT7Mrm/9ERAr9omdOQTg920VD0MQtWHLjqwYuRSHP+nyoSBowaC5r0SXg1QZXikk
 LitkI0y5+cFQb9eJT74Nyvti6O7n1OrEokrC+h/ijdbI0ALOXOhmx9Vnal+y5WqG0bs8
 BuUaGAf+YiQYQ3NRfYWbrI3dB82jQf1X57AC9v0RMK9GJhZifUclcoiXjrEAkeoQ0hMr
 Wqs3OOIhkVFIrjrVkz/zjXPly2+/+PHw+H0l3/QFr58nzPGaIVIs2lymhUz6a3LPmNs4
 6AZ4UwkaHtVGj3ynOmGi0XCu6L6cOQEH7vJo100BIX1sL1i0bnh/+3Iq3zFpa0U20/xS
 pyoQ==
X-Gm-Message-State: AOJu0Yxp5NbUdkJubxXosriR6etNC20MwESQfz5AW3+b4sRW8/lXX89u
 i88CCERYxqKZeU/DT+TVrX5lntG4/L4WF10Spac06yKm6OF9gHys2GhargWCXIc=
X-Gm-Gg: ASbGnctahPB0E2C2YzZWOGibpV3hNbLjxJ+KRFJFiFX2JRaeC48zz1dNfDnvP5UZIXs
 t2k13SNlLC8w6vScYMld6Doak0aXm5zBuXLyTEQSZ2vt2mq0d8pCHVcaqVNPNd3JGZVGwSaoORK
 PnsQ7FBZBeCXqviXjhi8KvPcqVXPodbaEAS7JKALyMKN1ySueS14csCpRLZGb/OmdZh/geXPSer
 jUwJ7dkBF3aikqR/w9ygrQU3NMzbG2/WyO1ThW2K5stra2o2nKMFWtNcmWbZPLgl/sIxaDnZE6v
 gXeSQclqhccodNFecxKbzr8LmyTEU1wjDmZmBqplhBhGbZwBEGLqXpo7WrE=
X-Google-Smtp-Source: AGHT+IHhXUoqwl/Nu31ezgYu2++rZsruPsFC24VtrXyM/lh4z6NgW48t/r+hCnTFdB2inuUGohXiOA==
X-Received: by 2002:a05:6000:1f83:b0:38d:de92:adab with SMTP id
 ffacd0b85a97d-38dde92ae55mr5374456f8f.29.1739225137114; 
 Mon, 10 Feb 2025 14:05:37 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc9ce31e8sm10632809f8f.5.2025.02.10.14.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:05:36 -0800 (PST)
Message-ID: <5cfe8347-12e0-4f61-8e5e-f4e5caa80fed@linaro.org>
Date: Mon, 10 Feb 2025 23:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] target: Set disassemble_info::endian value for
 little-endian targets
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-2-philmd@linaro.org>
 <45b18fab-59a3-49c4-b600-b9a26b815961@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <45b18fab-59a3-49c4-b600-b9a26b815961@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 10/2/25 22:54, Richard Henderson wrote:
> On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
>> @@ -35,6 +35,11 @@ static const gchar *tricore_gdb_arch_name(CPUState 
>> *cs)
>>       return "tricore";
>>   }
>> +static void tricore_cpu_disas_set_info(CPUState *cpu, 
>> disassemble_info *info)
>> +{
>> +    info->endian = BFD_ENDIAN_LITTLE;
>> +}
> 
> While this is not wrong, since there's no disassembler it's slightly 
> disingenuous.
> 
> This is the only target without a callback function, correct?  Let's 
> split this function out separately, along with the hunk in patch 10 
> which makes the disas_set_info call unconditional.

OK, I'll also move this line to the previous conditional call:

+    g_assert(s->info.endian != BFD_ENDIAN_UNKNOWN);

> 
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

