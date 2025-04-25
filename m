Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1789C369D1
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 22:34:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8RYS-0007xb-2D; Fri, 25 Apr 2025 18:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8RYI-0007gV-Ai
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:29:46 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8RYF-0005Ng-AL
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:29:44 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so27244125e9.2
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 15:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745620181; x=1746224981; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cf4+/CdYwzijGRSgVX4J5vw4Y/4lSgoERhZ/aiXDoVc=;
 b=iLuVByuPZgQRWo9KfnGjGAI0Yk8irTGBS+wThDeiYAtrlz/PlrdIFVSpLnUhVn5axt
 Nzi4YfOaNkp5e1lPbTQ6X+IERbJy9ujVC+cKJerAOM4cPG40+3R3FvLdg4mONuqCPvBv
 gSfp9D7fAWSyBZELFye6qf3AUdtSgbQ9/bD/XifZl9AU7pLeZMKkyayEsSScA/Wuf8Xg
 +xbo8eQwh0tNlLOsqWcyv4iUO89os40E1RtjEI7U+5+U68SzxJbEDACp6riqcKhz/RP6
 weYMQ1AqOrJWL1/AvqguTAXa2y1sVoZbGFJxrW37Z8Xqb77WgEqgJvWhdy1D099B0Pjh
 Jm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745620181; x=1746224981;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cf4+/CdYwzijGRSgVX4J5vw4Y/4lSgoERhZ/aiXDoVc=;
 b=NdaSP05McIUFJgBBe58hqb9d+LmDdXjgT1OksSfaMdO4qvCEYMH5maqaC6SDYP5kCI
 ejAmaEJG3BRSxZx4+mjAcs3+0KWkPftpo/2H2jkqJR9I/53f8V4qLfAEYuQcJVFppBAI
 C9/7SUdDHn78X0iiWGLiOda+aI4aMmDSiTWoepef5iSOX/NJVOxYt9iRjH55d7nY+/z/
 ysXmFh94J/c0bGeTHlkHIoPOnlFxyXfy954JgfZ+bTRzm8Kn4kVmNgP7Ge2CRWse3o6J
 08GhfkwwFXaAjNuikT1ViNwzuwrQpz0w9keyhsKqhyNiO4mu1sUNG5FNcM6/6Q4zbiZn
 Yn1A==
X-Gm-Message-State: AOJu0YwQI+DeBsNl6+PCz2qVouFt8HNTzaPdlSoOzc8xvBx932CnWcQB
 LsVTUAKye7kRS5BdqesabCuDi78eDukDhjJnHIe1oIyqmuUN1V7NRvNYF741Ris=
X-Gm-Gg: ASbGncuXOajY5sJ72hVk6ZT/MM+tPHDl1N5Rx3SIhDNEotQOlX/YjBPcK83jLVf80+8
 iUUqqfVbA8I20UPqxe/et8ZOQoXo7nWq1tNGLAiBtkbjGLj1j3dzZMGHVku9Gxb0DNu/fKj0G/y
 1mSwU6E3RjMUVRNOsaIywqyv/IwI0r9CCwjqGLVPYVkCoEGFnLF8KlZNwNpEINngQWNOgL2z3M9
 fE0cLYjBgjWT4oYmeBe2Wkw1L/FqIiEbcYmkcWtqgBISGIHfCSFxo7sdjSrWwxXeOZXJSexe9gU
 H5SsRxfQGXLb/DT/oVPU0/dCnibTZD/Ew6E2dTrKXSQHKM5WEveyZVAMuZkg/9zqMs31BXKcfct
 Pea8RQiei
X-Google-Smtp-Source: AGHT+IGl8GUtc9+3VQ5ZmZKcYC2znXkgv2+3ZwCUhP9TAPp6umWEzQIyQPH2gK2115+WuEH3xBI3NQ==
X-Received: by 2002:a05:600c:3111:b0:43c:ee3f:2c3 with SMTP id
 5b1f17b1804b1-440a64c179emr33010265e9.7.1745620181609; 
 Fri, 25 Apr 2025 15:29:41 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2ad112sm69845665e9.24.2025.04.25.15.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 15:29:40 -0700 (PDT)
Message-ID: <d7aa9804-0c74-4394-b147-2e32c72b4d32@linaro.org>
Date: Sat, 26 Apr 2025 00:29:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] target/riscv: Pass ra to riscv_csrrw_do128
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, dbarboza@ventanamicro.com
References: <20250425152311.804338-1-richard.henderson@linaro.org>
 <20250425152311.804338-4-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250425152311.804338-4-richard.henderson@linaro.org>
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
>   target/riscv/csr.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

