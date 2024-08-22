Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAD4C52D7C
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 00:28:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sgvgG-0006wd-8O; Wed, 21 Aug 2024 20:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgvgB-0006sM-Iv
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2024 20:27:55 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgvg9-0002cb-P4
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2024 20:27:55 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-20223b5c1c0so2017725ad.2
 for <qemu-riscv@nongnu.org>; Wed, 21 Aug 2024 17:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724286472; x=1724891272; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p5zPl3Sc6tg5qSbtJfAKfqHzO0d6LB3RfQCwrW0ZnUM=;
 b=UHPaMgCUDBLNiNPNup4kuNTygNmp09i8vIeserG7oVkr2I/A4Y1hEbAZA7YLlsU42B
 Y/PLmdOMFr8fIVvtpI9zgcVJUJ5zKswO6PmdeqL/qUaIqEypfqO9OoMkvBoqd5U7D+zN
 0WK37k7wi4gyKh0foQ5JQ+v8B8ApfuNEwTlETHpUAbY92sszP9yQpvmoW/9F8xrt2rnA
 PsPuBxWxbD68WniIjJCGksn+1BZankl1tj0udwIeaszgr6KpAePZF6NQrhZayzBWlqeE
 bWu7bzrjbXW6wGmFcrHqsuzBRRgwfQ4EXQFZqkgRXKDCbqzYBHGIBZECDxRln9Ch4Oqu
 nU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724286472; x=1724891272;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p5zPl3Sc6tg5qSbtJfAKfqHzO0d6LB3RfQCwrW0ZnUM=;
 b=hMirEcm7iM2NXbSFgAf7N3u0Y+IPbFuAgvWhHna9SJKTT8IQ3Z6Y/Cq4dAM9oJMYk3
 u4Bd1wgc/KNV1/PaBHRkZDw1ybpQkl+yX3WK0CXliTFTqrl4eyllCzkRIclviztSvsuH
 4a6Dp0skDGTlhAPaKvNicoXSv/5RCPCCHV6VwpgjnFEeTKGDXPnuMH9js9llU6G0879F
 lrpMX2uknZUDw3zd7QG1YCkxkw+BZhX/x2lykKBnU3VXWvUEbivrPudcYDMzMyya+Cpc
 yXVAavJkd3ndh6FlcnA/pZoiDbGJ9QOAT7oE5XxfudxOSMWeuYkdiGzSTIokohox6Y6Q
 gsNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEZFvlxRJEUanbs0SlBq8Izc22zc6FnE9uWv5Sx4ndQ/ACpIREhBtB7n81Dpj5Cos0y/IG0QHrdwZd@nongnu.org
X-Gm-Message-State: AOJu0YzUrSZbUya4lJHOYi66TbqcW38/mGFyGG5443XM0mi89dOZdjBk
 N1d+WpxjCXQ2FpH38pzrW/3O6no4rzV3o8PysWdVbEdIrbLaWCZ3zUd3KUL8GHk=
X-Google-Smtp-Source: AGHT+IFY5dC6s6Ij78DyP2HoDqOQEgpytCqF7SPZaQT6Qn9KR898Nmp0YgpsKpWgi8SQlnH9KgkvtA==
X-Received: by 2002:a17:902:f54f:b0:202:18e9:f302 with SMTP id
 d9443c01a7336-20367af4d61mr35279685ad.6.1724286471788; 
 Wed, 21 Aug 2024 17:27:51 -0700 (PDT)
Received: from [192.168.98.227] (60-242-98-186.static.tpgi.com.au.
 [60.242.98.186]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2038557f04asm1730385ad.85.2024.08.21.17.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 17:27:51 -0700 (PDT)
Message-ID: <e0c0a34e-372b-48cd-93ba-4a2c8630f6f2@linaro.org>
Date: Thu, 22 Aug 2024 10:27:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/16] target/riscv: introduce ssp and enabling
 controls for zicfiss
To: Deepak Gupta <debug@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com
References: <20240821215014.3859190-1-debug@rivosinc.com>
 <20240821215014.3859190-10-debug@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240821215014.3859190-10-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/22/24 07:50, Deepak Gupta wrote:
> zicfiss introduces a new state ssp ("shadow stack register") in cpu.
> ssp is expressed as a new unprivileged csr (CSR_SSP=0x11) and holds
> virtual address for shadow stack as programmed by software.
> 
> Shadow stack (for each mode) is enabled via bit3 in *envcfg CSRs.
> Shadow stack can be enabled for a mode only if it's higher privileged
> mode had it enabled for itself. M mode doesn't need enabling control,
> it's always available if extension is available on cpu.
> 
> This patch also implements helper bcfi function which determines if bcfi
> is enabled at current privilege or not. qemu-user also gets field
> `ubcfien` indicating whether qemu user has shadow stack enabled or not.
> 
> Adds ssp to migration state as well.
> 
> Signed-off-by: Deepak Gupta<debug@rivosinc.com>
> Co-developed-by: Jim Shu<jim.shu@sifive.com>
> Co-developed-by: Andy Chiu<andy.chiu@sifive.com>
> ---
>   target/riscv/cpu.c        |  5 ++++
>   target/riscv/cpu.h        |  4 +++
>   target/riscv/cpu_bits.h   |  6 +++++
>   target/riscv/cpu_helper.c | 25 +++++++++++++++++++
>   target/riscv/csr.c        | 52 +++++++++++++++++++++++++++++++++++++++
>   target/riscv/machine.c    | 19 ++++++++++++++
>   6 files changed, 111 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

