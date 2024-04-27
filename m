Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33855C4345F
	for <qemu-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 14:48:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s0jL1-0000Xg-SM; Sat, 27 Apr 2024 10:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s0jKt-0000RZ-1H
 for qemu-riscv@nongnu.org; Sat, 27 Apr 2024 10:47:34 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s0jKp-0008GD-7J
 for qemu-riscv@nongnu.org; Sat, 27 Apr 2024 10:47:30 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2a2da57ab3aso2687480a91.3
 for <qemu-riscv@nongnu.org>; Sat, 27 Apr 2024 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714229244; x=1714834044; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6wcbJVsApLjFvrfZlLIEnscXA61H/LQylnHzp959vKo=;
 b=Y5HZgU4sA/zjqpsAB3DxRLIjmp/xxad6nzY0c8nHBhWkwBIzk0yewFpM326TZ9m5fy
 VxNPeqH3kC6kAmirVagPg/19NR/aoxtLY38MXM6M6hXrhVSnmrwApVGiFrlqoS5gRzLc
 4UfvCG2hucuL6uOM07fIPGGKVKSWJJr6weMPNvwNajXm3/ahtsakhAAdLogjyfFIVdMR
 dDZj+UZYlt9ByMYHiWBHQynNZqBMyFO/19GPtqKyGVFACvkHS6BGOCgq3dT4ybDsWFxe
 bsM020t0QFzF7C4sxSRVMqM0lKHX8t+CUC6oObm5ZGuNXbTsiPi3R7ZhyvNxrYQzKU4k
 HDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714229244; x=1714834044;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6wcbJVsApLjFvrfZlLIEnscXA61H/LQylnHzp959vKo=;
 b=LS1OWkQKPatQYE1Mdk0u0K2f+K+teSvesco90tiCeL0p2XVMZIHaA07owSN3GQJMug
 tRGrYX0pt+BNCe/M+0Lf5QqxjSY7GTjparroNzsWPccIxFv4naIagn2pYV91DAnWu/qi
 dMYpsVHuc3Ii2uzHLhL7UjmA9hmpQG75W4Qb/12MgP5BzTJiQkw/IXnX/D948skv9pH5
 wobxTMzuOpS4bVdE/kjTo2/wQQetSlVzZ2vvyUZ8Tlg1WjxHV4pW7dUDBwqwLlm1xMmY
 OYg1XXE7wMG2WfFr8KjBgTNOMsms74CLYLM+wkZv94H58+6wolbetvRDsGSUBJWQu3lo
 0leQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcPZKcax4lfd1kC3BEZ06TCtO2tRChuoARnWwTQitQAR1HzPHElrCg2w3bMMtyvsm+0MqyN0i6k79Erg6CH0N/GSaRvYk=
X-Gm-Message-State: AOJu0YxaJ4YsTP/EXl7fmxA7i06kxelN33I6RPHKTeUcAbMk1EJ3mEoV
 /9DXsXy6MjN1lCAh3DTawW/h+y9iclJR7kvAijMJsPsvRgjK7BaFk1pO0dM5wOk=
X-Google-Smtp-Source: AGHT+IGwse8lYW9T2xG3kSIABHNFoEICjAUgoHEU4XFiqoEAlGWLOn3BoCGIWP5dUiE9RNhhzf9EQA==
X-Received: by 2002:a17:90a:d78b:b0:2ad:e004:76e6 with SMTP id
 z11-20020a17090ad78b00b002ade00476e6mr5231493pju.7.1714229244449; 
 Sat, 27 Apr 2024 07:47:24 -0700 (PDT)
Received: from [192.168.91.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a938100b002a706910b05sm16194208pjo.9.2024.04.27.07.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Apr 2024 07:47:23 -0700 (PDT)
Message-ID: <040db071-6406-4270-969a-c98d6fb33caf@linaro.org>
Date: Sat, 27 Apr 2024 07:47:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/38] Exec / accelerators patches
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20240426194200.43723-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 4/26/24 12:41, Philippe Mathieu-Daudé wrote:
> The following changes since commit a118c4aff4087eafb68f7132b233ad548cf16376:
> 
>    Merge tag 'hw-misc-20240425' ofhttps://github.com/philmd/qemu  into staging (2024-04-25 09:43:29 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git  tags/accel-20240426
> 
> for you to fetch changes up to 671558d290ffb93752d3245e7c5604b04b6dcdf2:
> 
>    plugins: Include missing 'qemu/bitmap.h' header (2024-04-26 21:36:19 +0200)
> 
> Selfish PR, painfully tested commit by commit.
> ----------------------------------------------------------------
> Accelerators patches
> 
> A lot of trivial cleanups and simplifications (moving methods around,
> adding/removing #include statements). Most notable changes:
> 
> - Rename NEED_CPU_H -> COMPILING_PER_TARGET
> - Rename few template headers using the '.h.inc' suffix
> - Extract some definitions / declarations into their own header:
>    - accel/tcg/user-retaddr.h (helper_retaddr)
>    - include/exec/abi_ptr.h (abi_ptr)
>    - include/exec/breakpoint.h (CPUBreakpoint, CPUWatchpoint)
>    - include/exec/mmu-access-type.h (MMUAccessType)
>    - include/user/tswap-target.h (tswapl, bswaptls)

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/9.1 as appropriate.


r~


