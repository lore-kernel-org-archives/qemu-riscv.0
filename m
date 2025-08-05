Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943E3C87FCB
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 14:31:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ujIfj-0000MD-Fs; Tue, 05 Aug 2025 10:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujIfE-0008OX-TV
 for qemu-riscv@nongnu.org; Tue, 05 Aug 2025 10:29:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujIfD-00064d-CU
 for qemu-riscv@nongnu.org; Tue, 05 Aug 2025 10:29:16 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-458b49c98a7so25573445e9.1
 for <qemu-riscv@nongnu.org>; Tue, 05 Aug 2025 07:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754404153; x=1755008953; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3s/1VSDo9kvlkPhLtRT0ljoYRRfKzeTqbQfYd/v2U7Q=;
 b=mcIIISTYXHuJT1WVGxhFvwHVhyKHHvzIqMbMaz+BdDFhTKetwr9xHSBePHjVUt/0SV
 Wz/1YDYPK2OTKn2dMqJW8Oo/vEeEEhlQYtOl6GeUcBI99pHFBnPfzUaQl8ln8U2nmzj/
 y15WcSKCeIVjj7+/Fmsncd6phc1TdL/zcc7QgGu5QleZLCR4DBW6zozapX3Rd9gU0N3s
 sgkvgDhgPfDmbR42B34qMEGwnRcSAQriiRbVbIj5QKhPwye1QEeLcaX8NTALVefW7Rep
 o3oJgqmpbynBstrUDOJ8AHg0YqhjPqp+gCo4CGJmEcwdUYp/m+dhujRYlrpJPpPgQfJG
 vi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754404153; x=1755008953;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3s/1VSDo9kvlkPhLtRT0ljoYRRfKzeTqbQfYd/v2U7Q=;
 b=GDjJ5rQmA1SKMf1eZecAnybDch16j6pDzear1jMcm8jWfeW1vJn+dXSm5o8oAGYBRw
 gI4WuLUDhZPlHf1nkQaG8pBChtdh+94T5FCo7r90L3mzpRbphL3+cxoqVu1MWwIw8wCU
 z458JzzBgCJkUYiWo0ZgfpnC+kmzD7mRndXGpa2ylsj4E1/AWiJeW7Dcn/3BJMfLc+Jh
 Ghzqw0uZR9RBEhYrPAEkEINwuvDRA+3bd3hozlscqdF7y4azHpNaSXj2Y4HnC2Y+DnMl
 wKdkBIUtBiscHYHGPUTRJ6SmV76vfw+1C49Blk80uoKty8K5+YYPCnnlNr71lJLXeP9Y
 /AjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoJ3elcQjeF49VP1T/BknSDeu4NJaqCFRU6NFSTPrR1TNY/Y9cElZ9guSFgX6SrYKTPstfaIppGXLn@nongnu.org
X-Gm-Message-State: AOJu0Yy2hIGVxk+ezknH1LlQfrTyefPOtPbIRCRMAI7g4lEpGu6hQBmq
 nuzbuXeY709IpUGO6JFUNlqJ5pEObu3XRMh53mLiKyb8V4Jflaicd3ppyDgpiANDJ7o=
X-Gm-Gg: ASbGnctOLMblN7/4SzVB1GGnkK278k0Xv9TCPDFY+PvSrrlJLup87/NqoyMctsz61KR
 8nKG0mpXqqUGyacaWrxcsrHnxLiL1RCeGT/G8GA2UbEWdhiarQjvCwDy4pcpotQNv1YauXDOpEj
 8Pai+2r49ZjMta0muz77pkFH1kp6tiCroh5FZk679w5AzaV/t5tFiFrmZKTBp548ysmT1yeFUyo
 2FiGlkX7+xcMJI/ewMQN99D6iquwNhBp4FnxR6pNXWD6Iye17hxo8SGwMo8NBcimvnSgRPjQ3LO
 UQ51hyFtaGlTN/BClgIW4+lCyjlZi5VL+o9aN3Rr1X99qOP/Iz/UL0eZwkvY5g5ksTJCspvhPYY
 SBttVgZBlPKRqJvOZgIBleKce1VeZLt3V1Kli3F2kXMGnA3vhIRdpiOikgGSxLjmGvA==
X-Google-Smtp-Source: AGHT+IH+WX+5oaPwXmOoSnvVKCY2eU7oAAMtwX67B3L2n4aNivB/IWHNFVJFyiBmpsJm8yJxyTu6sQ==
X-Received: by 2002:a05:6000:4308:b0:3b7:9af4:9c75 with SMTP id
 ffacd0b85a97d-3b8d94b5f5cmr8658008f8f.30.1754404152792; 
 Tue, 05 Aug 2025 07:29:12 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abf33sm19535705f8f.7.2025.08.05.07.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 07:29:12 -0700 (PDT)
Message-ID: <e275eed0-4ca7-456a-b445-c608865282cf@linaro.org>
Date: Tue, 5 Aug 2025 16:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 00/11] hw/sd: Fix SD cards in SPI mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
References: <20250804133406.17456-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250804133406.17456-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 4/8/25 15:33, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (11):
>    hw/sd/sdcard: Do not ignore errors in sd_cmd_to_sendingdata()
>    hw/sd/sdcard: Factor sd_response_size() out
>    hw/sd/sdbus: Provide buffer size to sdbus_do_command()
>    hw/sd/sdcard: Fill SPI response bits in card code
>    hw/sd/sdcard: Implement SPI R2 return value
>    hw/sd/sdcard: Use complete SEND_OP_COND implementation in SPI mode
>    hw/sd/sdcard: Allow using SWITCH_FUNCTION in more SPI states
>    hw/sd/sdcard: Factor spi_cmd_SEND_CxD() out
>    hw/sd/sdcard: Disable checking STBY mode in SPI SEND_CSD/CID
>    hw/sd/sdcard: Remove SDState::mode field
>    tests/functional: Test SD cards in SPI mode (using sifive_u machine)

Series queued.

