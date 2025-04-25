Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249CAC369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 22:43:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8Rc4-0004LS-CY; Fri, 25 Apr 2025 18:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8Rbh-0003YO-IR
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:33:17 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8Rbf-0005mi-FM
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:33:17 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so26463445e9.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 15:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745620393; x=1746225193; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E6jbgMHLb6COjNZKgW2CTaM5vCfPi1I2uLpKWl7q5R0=;
 b=bjVGXqJ0cvzDY3az1GuFjx+abk1H54M7PZNyNa6ulix7o2DicSDFr46V0r+YuM0O1W
 ziuAe5vFhHGjGG9GSOjjb+5kNlCQ07AgmOJF5fLHr2F8aAaYxjfQsYZNM8emqkEZxr8K
 G1zD/cR0CE1mqctAdv5Pnqhg3+orZvFhYz8oqyxz+qDvvgDKbB2A1q+GQsmHeusabWGp
 Fs/UGsXoxKgJcUroJsaGYGPQ4RvMJGy8miBflG18G9TDvtPObEKtMRzihuM7QzminRGi
 F+BaYbSMoC5G61dXFV4PcAy9gvwYLQACZ05jx1+YmGYjdr3fasnfFlih0c0djug+wUtX
 /Ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745620393; x=1746225193;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E6jbgMHLb6COjNZKgW2CTaM5vCfPi1I2uLpKWl7q5R0=;
 b=nODTKKh6nw4yY3FwtU3H0UiU7a96gvPC0CBlxs6jrPi/smtAqkdJtJbhn37GwCwg99
 h9MFMAvHDXljfWGK90LztcRfcWNbaJX6fD21ka/njt0jBSLq0ACzZvFtQDP7A/vxif2v
 zKT18xwN0cxQBTmfa9LnCw7uP+hnr5+UyT9faDN9QeOBfhr/sw4lorm7duLJSTS/yGsm
 sd2t+AbQM60MXsfUqt9M8hVsu+J96bdDNGP1fPLxQEoleZ/N0BhhlJ3gQyXImexWR6HE
 fZa88GMpwdrwI5fCkQHOX5rgD3NyT6QtaXYkzxfe3kHNqSwTd//zUalS/M6AZPrsN+uF
 SfNQ==
X-Gm-Message-State: AOJu0Yw8R3fruc7ihi2BSULCDPI6j6l2w3Suf+WOa6jJ3luWbsK/WTT+
 ICZ+CYPMndP8nNcM4/hK0qV79Fsx5C+yMw5T26M+w5YnYEQwcrDUgoDHbwv9v2lF2IslPT/pZSL
 F
X-Gm-Gg: ASbGncu9UTot7ZYjYJIFPrDr9aQ0LV1fubqCSShJuSKabPWkKil/AdHg3CF6aMuWiN5
 I3jEda9cMGW60kk7Puf+BfrPhfoBqqUAyYS2YNeKYIbTVC0fWRwFbHGhE9/e6mFcS+i8S4s+Eo4
 TxuWxLsXqiPukjz6ikyp/jrzraDqQVW05THpu7nnIpPvc3cGT8Z21whVGNhc5Nvvpnb5MWRzuzD
 ECCWDEsAOILtUQaPkDdb3yczOAbLFyaJfhypCxcQWKg2PMKqwyLhea2HlVIp+WSSTvT2kdU8TVE
 gpM6htjLvMdu+N0gx1GxzNHUszcYXLbfGCazjzU8NOGX7evRuncD94Nyc+mvJPUWG3V6NY8GFKv
 UbFGF5GlY
X-Google-Smtp-Source: AGHT+IEZoCEGrlQ0QF+DYExOdmhmDaD4CPaf5FJHOdmXye/+vCBxE5ZKuQ4aB5yBXDochLYF8sjjBA==
X-Received: by 2002:a05:600c:1c95:b0:43d:4e9:27fe with SMTP id
 5b1f17b1804b1-440a65e311dmr31468505e9.8.1745620393382; 
 Fri, 25 Apr 2025 15:33:13 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a5287a94sm39017185e9.0.2025.04.25.15.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 15:33:12 -0700 (PDT)
Message-ID: <98054e15-d91a-4f7c-8059-29fc6f0684a0@linaro.org>
Date: Sat, 26 Apr 2025 00:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] target/riscv: Move insn_len to internals.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, dbarboza@ventanamicro.com
References: <20250425152311.804338-1-richard.henderson@linaro.org>
 <20250425152311.804338-7-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250425152311.804338-7-richard.henderson@linaro.org>
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

On 25/4/25 17:23, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/internals.h | 5 +++++
>   target/riscv/translate.c | 5 -----
>   2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

