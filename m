Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B859C369C2
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 07:13:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u77oQ-0003U8-8Z; Tue, 22 Apr 2025 03:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u77oM-0003T2-Cv
 for qemu-riscv@nongnu.org; Tue, 22 Apr 2025 03:12:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u77oK-0002hL-8R
 for qemu-riscv@nongnu.org; Tue, 22 Apr 2025 03:12:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso34672145e9.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Apr 2025 00:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745305970; x=1745910770; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Docl5Hj1KGZuFaVssYnNvSeAQHUBkOQcmY8C4dhJquM=;
 b=phe074qiSMLkSw+cHxAkL8NpCL2/YqdfpZr+kB8x2pAR+qHd3Fe2x2Nttc5DGPNPcu
 hv7nutTWrsO/JQ3fdJ6KcGqG2RObN4a/LmUXBEVp1xo5nwhhESsua9p7UQH3/XkQhyUH
 aEBCs4zRjbpPG/BxJUeaIyKaGJVAE12pwfZKruIovGTYDVPzPU6X7DfDOLQsJOxJKuSX
 Yx0qxypUCEbPwJW2fZypeAY7swSHkC4xHCr1giBKssMlYGh91OqTsc9OPuUWKgQdaJQK
 ohPJ3nVu5MlGEs8f56jwZtksUuVv2DJlHmxOSm/9cEyK63mBSweNZt6D6+iZZ755WHmq
 R7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745305970; x=1745910770;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Docl5Hj1KGZuFaVssYnNvSeAQHUBkOQcmY8C4dhJquM=;
 b=wPgpw3fdQheXQF30Kf9chQsvwPwBOrxRMyXYg8MKcD9R3W5nlsdH/m9isotAeMC6Y7
 H+Uqhkp3P0THZL1BHWBdcH6YXvl0VbPuukl3q1SvFwR7KgZPlE2yGwkkrl4tj5QIYXv2
 GTs6Wg0K1yIcLhX44ahrDIoXNG2TMpsNbXqn7hjEoSPRXP0gT8ZE4gvLxYGPLtC2vN/6
 dUw+OTEC3nv2A20ZnFQAAseIUFljQVo1/q5dmsS4DQdqUKD7449JRxPmDrE0S/yrMYdJ
 36z6eB6J6s2+w3n7FsX8tDZ6fiQlWTr6yBH6q0f+WU1XqmgCzSMfPUkNvdo9BdzAHT6V
 kX3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsc+XDbvmBIr6iebAu4x7hQuPQGeSiY/JVbNOnhdIFlBnMdaWZD/lSFtlhXsdh7JqVDom6Nj925Ft6@nongnu.org
X-Gm-Message-State: AOJu0YyToPw+x3HRMYjX5hkb0Upqwqlv3+x3Po29CA0iRDKXtd8bHDJw
 4VLDJw8V5utidrmwAFK986iuj0o5XpwW55tFoo3wKIB2FxMWquv4B6EFr9pdf6c=
X-Gm-Gg: ASbGncuu/KkwkZOYd3cgiudx8wOC5UWx6GzdpsXgY9xbMqBTmzhorz7OIA/k0ZWq0kn
 S7Ek7YCMY93j6ob6xAPJcFeOzUnLft07mI131QYc1NEOr/3Umg6NK71HJnOzDQNdRrEwjLmRo+i
 1MySjRZQqdpKPeAkHmto9/C06Ax20qc5uqJkN3nYBsxBtWo55qDrhLLO5WK3731GfYy2Uaj6XpH
 5Z1OKKnKZ2xzcLksJhai9cm8ZXSAid0LHN+MFytd7F+mwQEIXsXn8OnoN6qzCuTA1vudXycjXBt
 qBccw73I2X/wO6Sjk4hiO/q/2cKuVkdTX+X2LuyxPbctHJ3NgEvRp/Vq0BcEOaLJWtMym5tPWIn
 RA3kQxKRI
X-Google-Smtp-Source: AGHT+IElL/tFb1ynYyULmMOE8McfBaRUjjkA+SXaPmkXPnaeuUoq8ct1nQZM8d0rnWA/qctYNwbJpQ==
X-Received: by 2002:a05:600c:3555:b0:43c:fa3f:8e5d with SMTP id
 5b1f17b1804b1-4406ab7efd0mr134064745e9.2.1745305970025; 
 Tue, 22 Apr 2025 00:12:50 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5cf2easm161743415e9.31.2025.04.22.00.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 00:12:48 -0700 (PDT)
Message-ID: <a2f973a8-e0c4-4eb5-9f4c-bc0f0d1ce123@linaro.org>
Date: Tue, 22 Apr 2025 09:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add common-user/host/riscv to RISC-V section
To: Alistair Francis <alistair23@gmail.com>, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, uwu@icenowy.me
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20250422024752.2060289-1-alistair.francis@wdc.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250422024752.2060289-1-alistair.francis@wdc.com>
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

On 22/4/25 04:47, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


