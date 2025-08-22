Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491BDCA0EFF
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:09:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1upTLI-0006jc-PW; Fri, 22 Aug 2025 11:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTKb-0006OG-7k
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:05:36 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTKW-0005ei-DJ
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:05:27 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b47174beb13so1550752a12.2
 for <qemu-riscv@nongnu.org>; Fri, 22 Aug 2025 08:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755875118; x=1756479918; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dS+zgdCpAYFGUoKW0yLhg60e3pstpN/f2LpdahNz4mc=;
 b=Tk2kn8+TIsXFE2GYxnpK0Mr3iEPYvrfZHt9pYtmuO0s5SYzKgXOajDXwSvKQDfQ2QR
 g2riPIltmtPi73q0GTPqn6Boasl6o9uQyKkXjLNCRkRo92YpnGcTluusEEdBNUIlOKMs
 nrWznVt+2M+FxrRZJBtvE1iEIHmW/2iW+snQZ+MACAycyBNHqiE9GR5l4GLWsQ6uo01/
 bkpvka/PtT4mMNhAkyLOf+ZauuVGTPnS+2MTizi+IiaH3pNgK5YOEZSM4/LnasOPZb10
 GZuZPpBR4yxohBRh5udAFUFth90gK0jgZHD3nX6JW25ZFPFeHNmLOg7OfLdZ5/05qujc
 TAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755875118; x=1756479918;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dS+zgdCpAYFGUoKW0yLhg60e3pstpN/f2LpdahNz4mc=;
 b=qu5G595WfM2yyiBpCK4XSqAE0uARg6O8sWjx+sGighCrEUOShs/lok0MeKhhxPOv26
 hxttR3ytLXaHl+a4nxkkFPwLlTHwiKuRUN1dBAJkroh6Ah+/fq2m7Oxu/98O/2BbCvr7
 415BYh/Xmcf/1+nCn3iUf0qGGNWzF3NGQ8RpUozYZ+UgYWSyf3QXeMwjQypbZAFpPHUF
 w3JtEuO+a7YeVspcjgK9QHs2Y5Dz20MrTh/xZJuhzSXyN/OBNWWtLHY9bkgJN7pD3CAe
 t9FXhacD+48+tBp+lYcbmi21VewSsoDt7SwBvZrN+5REd/K60FexkwCbQ9/bfLu2c2vy
 j1yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcQAPGcbIVsSgkPWCkrvTe++7TShZbkWzUED/Xw7rEsI0ay4bxN+ulBf172yncksat9nWagb+vDEfh@nongnu.org
X-Gm-Message-State: AOJu0YwLSyGlBhInM13H0SWfVNB6PMBwaMGSffSijj5UQlTLwh3hLyQ1
 Dj6gDMlQMQzvZOTnbUP7iqVeJy5+vIrFI43HSatsMbzEguA6qBBTO+Wxaq37n6VTk+s=
X-Gm-Gg: ASbGncugnWYxpPizadNWNleQfwP1WAv2572mmvpEBcZoI5J2VVn7EF6nTDh3AiyRbRV
 i8WVbdeiv3ITTAC+xfqkqQW+aJ9+ByEQE0thWYd2fiJ/ulL2r4+Rtibj0NZ4NkQzYyJuY73ovjO
 BGhXlCixqxnbEB+bKHNu2Hd+OIyJARAOqhXlctbwBjFNqTMTYflK4l766Goq+DTvgtiDtAsNNPO
 pRQON2PVssVmzu2icnfbGmurDB2CLQLXJh30/xpdPZzaxLEkvtNk7FXyruQePPX8/WiQdpNYYSk
 uXm8Y0wr69AmrqC39AKGP1ffwKZqzu719qfmj2VpHaNssdeML8GvUxGp8Z3P9z7sNWVy3lVBfcq
 drwxm19gURS0WkLRjNFfcIfrZqMfzzZkDar12
X-Google-Smtp-Source: AGHT+IGwmVzt4v7vtICSxFyeNLhu8d2iYdGZCJun6cCI7hb9syFdiuvxMEYfvu+Q196s15zxdgdXXA==
X-Received: by 2002:a17:902:d48f:b0:237:e696:3d56 with SMTP id
 d9443c01a7336-2462ef037d8mr40854575ad.32.1755875117868; 
 Fri, 22 Aug 2025 08:05:17 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245f0d86c05sm79796045ad.93.2025.08.22.08.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 08:05:16 -0700 (PDT)
Message-ID: <40cf55e8-b7d5-49ee-8c0e-10c32a1df00f@linaro.org>
Date: Fri, 22 Aug 2025 08:05:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] single-binary: compile once semihosting
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52f.google.com
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

On 2025-08-22 08:00, Pierrick Bouvier wrote:
> This series compiles once semihosting files in system mode.
> The most complicated file was semihosting/arm-compat-semi.c, which was carefully
> cleaned in easy to understand steps.
> 
> v2
> --
> 
> - use vaddr for syscalls.c/.h
> - static qualifier for console_{in,out}_gf
> - use vaddr for arm-compat-semi.c
> - semihosting/arm-compat-semi: fix cast for common_semi_set_ret
> 
> v3
> --
> 
> - keep common_semi_sys_exit_extended (Peter)
> 
> v4
> --
> 
> - fix patch 9 commit message to s/uint64_t/vaddr (Phil)
> 
> Pierrick Bouvier (12):
>    semihosting/syscalls: compile once in system and per target for user
>      mode
>    semihosting/syscalls: replace uint64_t with vaddr where appropriate
>    semihosting/guestfd: compile once for system/user
>    semihosting/arm-compat-semi: change common_semi_sys_exit_extended
>    target/riscv/common-semi-target: remove sizeof(target_ulong)
>    target/{arm,riscv}/common-semi-target: eradicate target_ulong
>    include/semihosting/common-semi: extract common_semi API
>    semihosting/arm-compat-semi: eradicate sizeof(target_ulong)
>    semihosting/arm-compat-semi: replace target_ulong with vaddr
>    semihosting/arm-compat-semi: eradicate target_long
>    semihosting/arm-compat-semi: remove dependency on cpu.h
>    semihosting/arm-compat-semi: compile once in system and per target for
>      user mode
> 
>   include/semihosting/common-semi.h             |   6 +
>   include/semihosting/guestfd.h                 |   7 --
>   include/semihosting/semihost.h                |   2 +
>   include/semihosting/syscalls.h                |  30 ++---
>   semihosting/arm-compat-semi-stub.c            |  19 +++
>   semihosting/arm-compat-semi.c                 |  65 ++++++++---
>   semihosting/guestfd.c                         |  26 +----
>   semihosting/syscalls.c                        | 109 +++++++++---------
>   ...mon-semi-target.h => common-semi-target.c} |  22 ++--
>   ...mon-semi-target.h => common-semi-target.c} |  27 +++--
>   semihosting/meson.build                       |  18 +--
>   target/arm/meson.build                        |   4 +
>   target/riscv/meson.build                      |   4 +
>   13 files changed, 190 insertions(+), 149 deletions(-)
>   create mode 100644 semihosting/arm-compat-semi-stub.c
>   rename target/arm/{common-semi-target.h => common-semi-target.c} (59%)
>   rename target/riscv/{common-semi-target.h => common-semi-target.c} (53%)
> 

Ping on this series.
I'll be out next week, but it should be ready to be pulled once the
trunk reopens.

Regards,
Pierrick

