Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7585AC369D1
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 22:40:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8Rah-0001fu-R0; Fri, 25 Apr 2025 18:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8RaE-0001HC-BL
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:31:49 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8RaC-0005iB-5F
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:31:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso26476065e9.3
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 15:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745620301; x=1746225101; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GbVWYqdOhsJLdKAjXd9ZwdSHKBlxNhT6Rk799iOQMHA=;
 b=tQRXLqEFO+OfWkXhPZHpSeDgJoZ43Kk/8bHM1GUCcPkkpLkXkMD7yRS23RMJz1ouYM
 hoAEdsE3G5GSPkI6sfUWhUJtMAJ9Zp6fmP5a9/NRl7YwO9ljPvSoCNcHV85jHixbZd+C
 6DfuaIp4xGJmBIUyTBXq3xyXKjOdFHg3/lDs16Fxj6gVT+Ct6jb6T5V94IdKc7IpAmiM
 pnT3g783gUdwsP5cXiRCgkUfusp6DUtHBN3A7p1vu8Sx4WCBDpLuZVG8tUIqVefDdbE0
 S3aOHI8Vq8ooTy4/eG0gMFNeXsNy/UNAuI7mKj7icPln0ZMKVtY4BD5QuGYyZM5Dkli+
 M0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745620301; x=1746225101;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GbVWYqdOhsJLdKAjXd9ZwdSHKBlxNhT6Rk799iOQMHA=;
 b=kay21LfwLvlVlJDfXzEKkpgKtiK1QGkJUX6Yh049uRcep7AI0FZugZ3G6MF+HgUXnQ
 UY11gaSNkDbzpLChV05m57fyks6lLYOBidO2GXLsnEP05Z+tZCBpECkxx7wplAsqTFw5
 xpgOzctqtDpGjkRyA0kd15jejuN7c08LmWrJwFTpZFnckZrNgSgBFoRIZGft5HHZEPtf
 KsiMRkbvUcEPtYMz4/xK5VPbFhk9yjvc72Sa9+9+7nksO5/CLI8uboFBvDh/uIMzedP2
 ThSKtIEoDQpy3w126bUtnf/2U8a6jTrRPUoHCJDgxEfJKoqGcasTXamDpkM9JmWteaRW
 TPmw==
X-Gm-Message-State: AOJu0YwTQXSW3Yj0NuidNQBBbdb9/y4JMlyfwSix3t8dwnX2kl8ucRL7
 cRHKcmXKbNOmJJtVKbheXxS/DjCIvFlfvwCbUbYQvcJiiywWiAvx97Gzch4IUHk=
X-Gm-Gg: ASbGnctJ3ERsBzRvXPsZ2JM1fgGEXuFovJqBgje+9bS5tL2WduJApPwOYgi4yU0F2Kw
 y7IlqL7H1FDaA3/8dwyD3bwUflOdCQwLYkxs32lINOAHCGVb9s4NJu0ptbdfnyoJ484JEYds2rl
 h0Gy8pY/V3VVAmIQeGm4vpnJARP7TmVVKHB/uSDDx5U5zSHBvB5QPCft1WIUgtX33MA3QKJnrTO
 ysdMMUKaecufm6i4OZrjI5N/dtEXv8nvzUu+tsz4ajAWO2HSAkn9c80rGjuD63rwPaQKqwjD1Zf
 ZaX0ltshOatgndyi75sY4klU2GJp1KUPKGtWq7qEzZd/GfDdGLlhtPaHWIjOSQFuEtkehsYowtU
 podHt7SVx
X-Google-Smtp-Source: AGHT+IHHb+GnRcXoRanCuJ43ZASoW1XboK9LCsPuLA8Fc7R2WhIQZ4l3NKA0BqITCdgZj0YGIpZhzw==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fb8e:aec0 with SMTP id
 5b1f17b1804b1-440a64c16c3mr35887685e9.1.1745620300921; 
 Fri, 25 Apr 2025 15:31:40 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a5311403sm38015725e9.23.2025.04.25.15.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 15:31:39 -0700 (PDT)
Message-ID: <2b0975a2-ac4c-43ad-953c-40debad1b71d@linaro.org>
Date: Sat, 26 Apr 2025 00:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] target/riscv: Pass ra to riscv_csrrw
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, dbarboza@ventanamicro.com
References: <20250425152311.804338-1-richard.henderson@linaro.org>
 <20250425152311.804338-5-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250425152311.804338-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
>   target/riscv/cpu.h       | 8 ++++----
>   hw/riscv/riscv_hart.c    | 2 +-
>   target/riscv/csr.c       | 8 ++++----
>   target/riscv/op_helper.c | 4 ++--
>   4 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

