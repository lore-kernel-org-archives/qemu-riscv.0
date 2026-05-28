Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62F6CD4F54
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:54:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSgo1-0007xb-VX; Thu, 28 May 2026 15:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSgnu-0007wP-PN
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:54:08 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSgns-0001oL-Vq
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:54:06 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-49050bfe053so37734675e9.3
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779998042; x=1780602842; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FY+KLyju3dfWuMj0OMIYl9AfwtlopQw/tirzh/2OP7I=;
 b=mGFTp5kgDLDO1e0Y7yvtT8A28wXAuBEBZn9xPVmzVgwONEhREi8D5J9p4ER7TKPjYz
 Rsst0/GKuBk/4GYVSNQVM840cY8KiJTvK0oaAMGYy87vP1WIo40H200mYF0XVFqdFktW
 JOTtD+KfTL9WFkO7bQtzNGnA0sMahl7yGXcUf1/LfwmlWJ9b4Pw+rIkzO8H107Og2Smd
 p/lbAgaPtiolANY3oZg1+k3lqJGQRo2r36Wj9cQZ+X52JTDZGD3clwSL/wkojE0vQXJu
 H7kIa9tuh9uEVKH+wLQSev02ca7WW1cIzGCgLyfmhykKevYI87ojFk7w8WZ4rgxGoI1w
 TFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779998042; x=1780602842;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FY+KLyju3dfWuMj0OMIYl9AfwtlopQw/tirzh/2OP7I=;
 b=lwpC4giSJOijD4kQnTQCXAsGVYdh9o8SOKMjHdQFxvLg1p6FI59U5BMLeAhkqRKyqZ
 whdwkY5Va1EF1AW8Dz0DNG5P9doN+fK2ydOrYisygsYEl/3ik2B6JU+xkdA7/9eYLPT+
 9bA+LFEnw0biqxB7F7Ijcv9pwULjwQaGUvS6uGSZM+zSjb9pWxphHpkwzrKuQzZW3N7d
 AkzLI2V2dMV9gl694WWz++ubha/rWD/H3RCeEHCiwkjTNesYKsnunFgROb+bW0jQWocA
 YaZ/tEQRK/Kh9EkUd9K+0BBIVrpKwhhAzvWS5pkU/LXwiZy8CsKVEcwlnkEq/DM+N/6T
 2seA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Jv8lB95LGySagEHx9QxQKJ2a43geBdouu/IgWlNQlTCLqcTJ9U1SpZyQ0SuUt1Wh88X3jhatiUZhL@nongnu.org
X-Gm-Message-State: AOJu0YxVjSaSI2RkdLrZQhWMsCWJky58Z30xFegPsB73rLz88zEdXnU6
 ostgegm/HnJl7bnjhic46CtGHKMBrpToU84WqYc5PwYB+1RuZuCxMamWUPmUYvwG8ZQ=
X-Gm-Gg: Acq92OEqgGc0FPbvT1U9SNxHUFUYA4Pscn3KqvVX30D2Mo1t7oEBYOBxx+7zcLXRoFZ
 XMUiXQ68sDPYvRFqdmcedEgnPq4gXsSRtcjJLumruDvvEa8teAVOKcTU6COeMsE0mUUfuDEOhgA
 y4TzkbhVXl4PwOoymCL1RM24px26lDM6wS2mDaj8C16fLxwBilOz5N4VIdbOMlJ6oo7fkb40sFo
 ORCpuf8kdE2pP34cYS6dWYTrIW4InNknxc9dwPbdyfuJPN5ZboRy6cc6a3mOPOblyDVTd230ZSS
 4Ql11rsxJJMY1ePVmKPDSH4FTup9odm3y4lI0bDXJpT2OOg5BnT0eiCjPgbKb0sUS1dfDBxpNUN
 PNRtLobOglSdhw7f04Zbz1OVI2AM6ruWngcVMprOIgMee6QyjBy0ZzUEgZRkimR6U+pjy5mTLHk
 BkpBFy57WFlINP4iCOBu0KhHk1JTf65ItQtpylzSGtIedsNPP6rpH+yO5CkFQGbAM/h58tQ9y2+
 K/W
X-Received: by 2002:a05:600c:8508:b0:490:50e4:7224 with SMTP id
 5b1f17b1804b1-4909bf8a9a5mr1134875e9.3.1779998041833; 
 Thu, 28 May 2026 12:54:01 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eef3cb25dsm1492279f8f.8.2026.05.28.12.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:54:00 -0700 (PDT)
Message-ID: <bd6fe93c-d17e-483f-a009-7de578270126@linaro.org>
Date: Thu, 28 May 2026 21:53:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] single-binary: Compile hw/riscv once
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com
References: <20260520-hw-riscv-cpu-int-v3-0-d1123ea63d9c@rev.ng>
 <81244594-ec27-4cef-85bf-60a4f7bd08ca@linaro.org>
 <ahhZ32B8XCGfTspm@hive.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <ahhZ32B8XCGfTspm@hive.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 28/5/26 17:06, Anton Johansson wrote:
> On 27/05/26, Philippe Mathieu-Daudé wrote:
>> On 20/5/26 15:12, Anton Johansson wrote:
>>
>>> ---
>>> Anton Johansson (14):
>>>         hw/riscv: Register generic riscv[32|64] QOM interfaces
>>>         hw/riscv: Add macros and globals for simplifying machine definitions
>>>         hw/riscv: Filter machine types for qemu-system-riscv32/64 binaries
>>>         hw/core: Add riscv[32|64] to "none" machine
>>>         configs/target: Implement per-binary TargetInfo structure for riscv
>>>         target-info: Add target_riscv64()
>>
>> Queuing first 6 patches (addressing rth comment), thanks.
> 
> Thank you!:) Must have missed Richards comment huh, by bad.

(The reason I couldn't take the whole series is because the rest
has dependencies on another series of yours which is already in
Alistair riscv queue).


