Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CC3CD1284
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 17:08:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rsn2w-0006Nx-GA; Fri, 05 Apr 2024 13:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rsn2u-0006MI-LY
 for qemu-riscv@nongnu.org; Fri, 05 Apr 2024 13:08:08 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rsn2s-0006T7-GW
 for qemu-riscv@nongnu.org; Fri, 05 Apr 2024 13:08:08 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6ecf3943040so1353619b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Apr 2024 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712336885; x=1712941685; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hKIr47iz1buAmMPGzvABuUjvKOA4+I6PgN03YYyEOL4=;
 b=ewo5oPNSIcN+D15IMHTmyNxhBlmFLVdeOdu/GjGZ152u+4aApu5RS2nhpdYYmCQklc
 MEnNIOg8vP+5egeh1LMzJUQMi1A6tFWd1UYag37J9dWCPv0dvciQm3LW9MQq0KZfjzHf
 cPvWfPwMVJkseHBkTRMbpoP2GN1W4/8uIeLu5gSiwhvYHeSe2dtoJZhZ6ibS8azXaG6B
 0nULfVrySW7w0qIQUDSVT3CI0zmtw2kftPDohT/i5AbrxEFQPRIUhLrr19oyC6t4aYhe
 4NbLI8/K1ePsaGJCDc1oVI+Yyl94ljYiQcSmNEV0hbIVeASptU/d/N6BW0/5zm2hF/8T
 Y+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712336885; x=1712941685;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hKIr47iz1buAmMPGzvABuUjvKOA4+I6PgN03YYyEOL4=;
 b=nV/RTVWvf1zzPBzNuu7l24PzgxKn6un0MVpVykk9qgGXcVdtt1V5685tvJCmjUEpI/
 KsoeGhV4xhNvzETtib5zs9C344BIS/c8rL+A0F4uL9sK3tmVcD5QTZ/XV16UoWqElvyg
 BZGzhYrAsd9TbEQV0DLoAzzJbTeeP+K4xxsclDhFKQJqQQBVEfx/nCajsoSksIPWeDkv
 A/hKfbmKdsur2dva4axGdR1dClMZOj/+jjcIGZZAw3SsegZy1cW1NkwQz8L7JKRZUyez
 3UfO4TKmhucXJH7NqmJZpwjyriSA7/NB8CWCjgV+mfpx4T63iGSLBXfGHCn0fTtg/d+U
 VSPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW84RtNdPw7nIqJKBH2rz8WcXk7wgeGxN7+y/rHyefyt7ePd1qwwCeEi2X3TjsQk/lBzXHy9YjzkcHWwyf0UZ4sjLVD5cg=
X-Gm-Message-State: AOJu0Yy5SburxV/n4ANKBtFyba10llraOST2WgiaFYQgiRsOwl564dkv
 AuyZgcL2ZsuLlUmKA58h8Gz4xTH294dZfwYLJWmGglE8dP/msZpoJNyiBMbB+08=
X-Google-Smtp-Source: AGHT+IFKaUhHPFOMtQlXcVm1xpldzq7iqAjzW4j0SX6w+X8wM8wsluYZhTNFhrVD30zf/5M+ZJmLLQ==
X-Received: by 2002:a05:6a00:991:b0:6ea:d7b6:f4b4 with SMTP id
 u17-20020a056a00099100b006ead7b6f4b4mr2368374pfg.21.1712336885060; 
 Fri, 05 Apr 2024 10:08:05 -0700 (PDT)
Received: from [172.20.1.19] (098-147-007-212.res.spectrum.com. [98.147.7.212])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a62e808000000b006ecfd0bf326sm1790938pfi.99.2024.04.05.10.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 10:08:04 -0700 (PDT)
Message-ID: <e648b60f-6b1b-464a-aceb-441f1a79b54d@linaro.org>
Date: Fri, 5 Apr 2024 07:08:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] tcg/cputlb: Remove non-synced variants of global
 TLB flushes
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20240405125340.380828-1-npiggin@gmail.com>
 <20240405125340.380828-3-npiggin@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240405125340.380828-3-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 4/5/24 02:53, Nicholas Piggin wrote:
> These are no longer used.
> 
>    tlb_flush_all_cpus: removed by previous commit.
>    tlb_flush_page_all_cpus: removed by previous commit.
> 
>    tlb_flush_page_bits_by_mmuidx_all_cpus: never used.
>    tlb_flush_page_by_mmuidx_all_cpus: never used.
>    tlb_flush_page_bits_by_mmuidx_all_cpus: never used, thus:
>      tlb_flush_range_by_mmuidx_all_cpus: never used.
>      tlb_flush_by_mmuidx_all_cpus: never used.
> 
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Signed-off-by: Nicholas Piggin<npiggin@gmail.com>
> ---
>   docs/devel/multi-thread-tcg.rst |  13 ++--
>   include/exec/exec-all.h         |  97 +++++-------------------------
>   accel/tcg/cputlb.c              | 103 --------------------------------
>   3 files changed, 19 insertions(+), 194 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

