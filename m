Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA31C369D1
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 22:39:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8RY2-0006s1-T6; Fri, 25 Apr 2025 18:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8RXz-0006mD-Qm
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:29:28 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8RXy-0005LB-33
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:29:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso3091288f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 15:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745620164; x=1746224964; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qLZEYa1Rnly19rkUOPIrGZDQHsDvg1SvQk0Z66367gU=;
 b=Yh14Ok+CGiQLHf7d7VD5Uh9snYCwPoZFIsUQLp0LblHSF8gDRaQQeiAinaN4i+BEFs
 unD/J/3eIruUiOkg0PsZ5yhh3/VlpuUCcCgc9Ii7/reAoX7OYFUhoFf/qm9hrEFW2HzX
 RQA1OtgvVd+wNiPfTx/gizOKgoCg0JdmS50o24ExztXYhIcwRyVR4HAvd4eeSZuUU/Qx
 3Be5Y1/g7jnfFEcK7JvW9Yv6kf+kxrdoaV0S1jP82f/pw0wCOTqu7oUIXC4Mr02XW/4I
 VXKIRO3rdig0DtbNZ3S+1YbTUFXbSSMPkei9TO0GqmqWpZFo3VrFCDdIZTH2WN4FsII9
 3zFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745620164; x=1746224964;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qLZEYa1Rnly19rkUOPIrGZDQHsDvg1SvQk0Z66367gU=;
 b=TEjhUspatS6YS794PxRh8n4AYpqtSeLyTCGMp5JJ9RmHnDc8En+JlgDEOfMLhgsqve
 qDn9vW+S7maUWKDh63Jv/JqLna8z72ulrOKFWefKqsDwEKPP3Fi1aXlNrIU6QhijlNZm
 xaBIPdNSbH7NAq7tIZFGjSkZNX6mo5tluqNDDMwyLY8yrpMkHEzmGsmDdSohTetaSZ8l
 0O7FDXctk7f2kaSXmQWYfpiLpmFhol6WKOSIFIsb1VyfJvQRy4BftdJwb3E9Cao4Tbay
 qlbg9CyuGN4bzWjUFxJkFshwY4QayKNur71OS3YYy6w6+bQdLdS1+/5GWBhHB5v+Qn9L
 ph/w==
X-Gm-Message-State: AOJu0YwVMMvCtWMaK7ZNQTlc9newYnbQxj294YklDMYpTCWF3cPkA85y
 HGjOwKE7Pwt7ouG+8UniBjCi5XMGJsjzD4nREfaxu2bJkBkX8hzs8QEEn62ceXo=
X-Gm-Gg: ASbGncsC+TSuf2bmprNi/8MXGQ9L7LgC1sl8a3J9mokktSbrbQHHRsXPVU6qe4qkGkv
 XrUe4V7lA6N5isyGbXV8siTouIXrp77nZOaAGzkuaAhS4ttupczYUJ0TcGeflVEK5dsl5OcfwaU
 LUB0t2ie5Pxa+BjX7imLMLP0UXdV/S51qQjfH/ttB5870Cdyec5vYM+oEK2ppeFB7F5Tz0TI+5b
 Pes17RPa+JHyPWymn6B985PQx2rvSEsZWZxJYKuMZjGkD4W9rl2u+eoTLwVGtGhz2ylqvHZ9j1h
 cbNFf3DAgjiLzEp1zCvNJD9AL9UygLVajDLrONWMd+eZkvAvEWcY/k1P3rj8uvU5wbkQSROox46
 7RW7LGgHm
X-Google-Smtp-Source: AGHT+IGxvERkh8air50ozbgTeoJdfIUxOQT9nz7Y7+qw4LTvneWUPp7v19fh3dCJoEGKjkDsAEmddg==
X-Received: by 2002:a05:6000:402a:b0:3a0:7139:d16d with SMTP id
 ffacd0b85a97d-3a074e1e8edmr2964281f8f.23.1745620163776; 
 Fri, 25 Apr 2025 15:29:23 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a538f4aasm37499145e9.38.2025.04.25.15.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 15:29:22 -0700 (PDT)
Message-ID: <0f59af92-958e-4599-9cf3-89327450117c@linaro.org>
Date: Sat, 26 Apr 2025 00:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] target/riscv: Pass ra to riscv_csrrw_do64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, dbarboza@ventanamicro.com
References: <20250425152311.804338-1-richard.henderson@linaro.org>
 <20250425152311.804338-3-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250425152311.804338-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 25/4/25 17:23, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/csr.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)


> @@ -5647,9 +5648,7 @@ RISCVException riscv_csrr_i128(CPURISCVState *env, int csrno,
>        * accesses
>        */
>       target_ulong old_value;
> -    ret = riscv_csrrw_do64(env, csrno, &old_value,
> -                           (target_ulong)0,
> -                           (target_ulong)0);
> +    ret = riscv_csrrw_do64(env, csrno, &old_value, 0, 0, 0);

:)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

