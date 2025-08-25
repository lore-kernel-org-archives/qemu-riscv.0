Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBFCCA0FE1
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 09:57:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uqTwK-00067k-Mk; Mon, 25 Aug 2025 05:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uqTw3-00063Z-9R
 for qemu-riscv@nongnu.org; Mon, 25 Aug 2025 05:56:21 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uqTvx-00026I-Uh
 for qemu-riscv@nongnu.org; Mon, 25 Aug 2025 05:56:18 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b49f7aaf5so24537935e9.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Aug 2025 02:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756115763; x=1756720563; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DtPysv0q8plRMP+uuaG7xvmK7HEMKFlASd4qR6lUwg4=;
 b=Vh5CXMbcfLy1kmYwFrrbe0iRmuIFD7qb6tKOjR5D51ppZCKInMsNYLgSObhNwVjaQu
 jAGDlDuy6HgrWsHhihzz3sjqa1Sv/3Idx6QKz7EUSmpXOpaIl1MuQYLTUkUbza00obXe
 rxlH6uzC5f+H5s0XayXMi9J5B2BNBFnAbVcwQ4O3AUJrEGkqoJcQ84TsTCTHCZimH1S0
 Qw9keCyqy3goV6KqmHAdQPXq4rKjiuYaWkiFzD0UczIiH467ymG9ST227Vn0fS35baKL
 ejIdT8Lwp9JSVXplkZD7KGcPxNd34Zv2LK26OFznmWJN6eggfkN1KDr7UVD5GRKCizLd
 Z72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756115763; x=1756720563;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DtPysv0q8plRMP+uuaG7xvmK7HEMKFlASd4qR6lUwg4=;
 b=Ic66RzkPFpVWk5qG9+8E/vuD4qTNuhNsqGxHWloA6XQZ3nNSclVYbClh+t7C/hwzZg
 gADw8m0hLW6HJ66nJvH/089Cbmkb91iEI8iX5aZRNdpzXcwY8Lu2bWEdDqqLLFkzXNCH
 ZKqX1sHYRVrgRCSYIPLHKGW+RP/LowzmU6EzH/bHWpo/y/ad2LD+GUFzp2pAaxm/a84d
 Hl7Wf/ZQPec0cQ1RX1bxN3LZc/2GLiUMLtckLK9n2U8CE1TyIKIFHNPzHDryathJ/8jl
 yX6y4sauY92CZ6dw+L1Pdl1XqFhtHUFvtiheRkB3D6OWeItnsWNNAXWQELAycF7rTOs3
 aYGA==
X-Gm-Message-State: AOJu0YwSNLuoLM7zNK8skiRf0I+BIF+oCqlNcbj0ouaBIKlm1Zo4YjB1
 P8Zdlc/lsdJx7rc9/4ovSUuoefTmjHeSGiVYMB82CfSInlqaaNp6/B6qYV9EUmXl9jk=
X-Gm-Gg: ASbGnct/RF6gbyKUm4kgZhhEGaTKKzF/FAtlMdeWYlK+8TLTalgt7lMlsDNlLfZjI7o
 QQI6uMpK1TUwD8B0ao/fcn5SGA1+ZAYl8Pv/5Xyn1FXDezbYsC4IInHthWZlTYgsOYluLXxmifo
 NpPG2eZCpDcAr9uCVM3vCmgTWdaFkux7Bsz5N4d9vvXKq0YX9zjGliZ7JPt0BDCRXlRJ2qp+iR1
 h+LPK26mEDnjZ+Jv/ClFfXziaKc+lRwitumacL2Esnh4XzkHjmiLzPEiHVGeHt7PCFvI4Ekao2/
 Q0F3cBpNXjhW25kC8S+zpO2zNsUj8ubLNgdhNxqkQfoI+1g7eRviPUOYiq5oInPkEm/+YUjda25
 0z4SpT49freurJcUIKSqyMTSY7fJtC1ft6s7JzFHpSDLQT2+W5QW7De+N4J7JC2NTHA==
X-Google-Smtp-Source: AGHT+IFII4uz9bHKRVMU/jqk/Ik1xyv1FNOwKxKjbIfzqXS6ferhx9aYm6vJ1OcwtxUTA8WX5oiUAQ==
X-Received: by 2002:a05:600c:1d87:b0:45b:5ff4:2f8f with SMTP id
 5b1f17b1804b1-45b5ff43124mr24307765e9.4.1756115762660; 
 Mon, 25 Aug 2025 02:56:02 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b5757453fsm101240695e9.14.2025.08.25.02.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 02:56:02 -0700 (PDT)
Message-ID: <eb4da435-2b16-4421-a192-612a33524897@linaro.org>
Date: Mon, 25 Aug 2025 11:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] single-binary: compile once semihosting
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
 <7c026d43-04b4-4615-8478-639393b640c2@linaro.org>
 <e7ea76f9-b66c-4656-b8b6-4d0ff0dfee35@linaro.org>
 <33849bb7-07a8-4a04-b142-ebfe5d286332@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <33849bb7-07a8-4a04-b142-ebfe5d286332@linaro.org>
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

On 22/8/25 16:57, Pierrick Bouvier wrote:
> On 2025-08-22 07:56, Philippe Mathieu-Daudé wrote:
>> On 22/8/25 16:31, Pierrick Bouvier wrote:
>>> On 2025-08-04 11:39, Pierrick Bouvier wrote:
>>>> This series compiles once semihosting files in system mode.
>>>> The most complicated file was semihosting/arm-compat-semi.c, which was
>>>> carefully
>>>> cleaned in easy to understand steps.


>>> Ping on this series.
>>> I'll be out next week, but it should be ready to be pulled once the
>>> trunk reopens.
>>
>> Modulo the comment on patch #9, the series is fully reviewed.

Sorry, this was a comment for the maintainer, hoping he'd update the
comment while queuing the series, not asking you to respin another one.

Next time I'll be more verbose with such comments.

> I'll send a v4 with this, thanks.

We should be super good now ;)

