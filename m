Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE8AC87FCF
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 22:24:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uj3bF-0002Ku-Ft; Mon, 04 Aug 2025 18:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uj3b4-0002GF-EO
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 18:24:00 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uj3b2-0007N1-0k
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 18:23:58 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-769a21bd4d5so3894580b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 15:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754346232; x=1754951032; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C11V6iyXWKp5KCR02XvUBcQUNxjQspOybdquxZQLdYA=;
 b=HfLapiNjYRn8eFc7s7ozidJgaQcFkVml1g8+HISrSmhbch1uyq15tYL0cxWrUndyGb
 J7Ry4rjUKRGhJg+Wzks2iqkRnwVtefdjRFTlFdzqylvg3tXjW5E+WUnv3jGHQk74lBPe
 W9tBmL8YfkspXaJBI43J3LTYNaXIIoEscPuyOxeZ0albrkNGRqWD2RkMPWLVgiN8eAXL
 DgJlBueSZdrtkHS4+Ti0D+RsjFd8lmRJM0t6FVWrOpmA9ijCV1nMJP6GNOOkNVZCh5sU
 6wlP7TNpuiCVzqykKCvlXJtLGA4lSnjm4bShNj20U6UbGfDKYEhmRp+DqiyH148r08lB
 Zo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754346232; x=1754951032;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C11V6iyXWKp5KCR02XvUBcQUNxjQspOybdquxZQLdYA=;
 b=BALQispwkddICLfr1jjOA1EdHWVJK3jM/KEHu7eQ892c1Co3mcUiUgWqgCIQOl2Zzl
 Y5M7wKbR6jzkZ521PBmbg+RnKH9USGt3hLwvPkrFvUbcoUlct8M45T8kprXTgvJ3ODuZ
 ybHGuMs9eLX7xd8FUIyePQ6A4mxQ7DzVsvZfhBvYhZxnvHuJzYU+zvG43eJfyY371Pya
 D9IyRkcrK8lZtvyWkh+P301Jt+71m1xACaHUXMufbzHDjJSzuCRDVo0Jf0md0qvhhnDh
 GRyvgk5c0UiU8g6jVZQC6eKc90q5pohDSLCSh5mgXPJIUb/DU06490pxlKD3HzRQV6zT
 DXJw==
X-Gm-Message-State: AOJu0YzUMzP5sMvsF6caJAs8rSLwvejPjBbRcsPKB0LGsLJwFo8vh0c+
 DpoTB5i0ojX9iDAcpyTXBhQY6YdQPsxu8h0Hv0jAb0x7zOJB57wu+xlNGDLL8RH3B/M=
X-Gm-Gg: ASbGncuOVBHQCy04OLYWVhma3CR9tKMpRT+2rzarzSFaOwgmyF/liFUHUuiAVuvYwUL
 fQVWb/rvGI3Rxk6Dgqcs7t9bbTSJFu8dzH07qkCkFjAaSrbWSb9n3gt7zQYzNNEHcENtNivbbPr
 UQYyWKuy+gK6Pd/DnY0nTvpQOFy9S/7ez33Ip4XC1NyWyP6kJEhRnGO0Z5J/r+6cC+JXV54NYQc
 /kykBx6kIleP4XZomvYBNbOIpR/X1fjfiYko6o1Bb+zGgXrMKyG4v7kkFfs2j0fKHF4Pc5oDkio
 fcm4BNw+QtpRAd0e3n1sYE2J+ZEOY1S9J+ENDzz0YNCYJj0b+Y5H52lFMYebIQWphZaem9nqPXr
 xCOI6zLd7l91MoeEx9ek1rCwpQ1VB7rfDnYi0HVeE
X-Google-Smtp-Source: AGHT+IHgod2A648kSf6cGGQtq0c1tGp7Y9bCZNi6vSLTRMEpjS8YDsia+J70EJtHTNNv6O1BPed7CA==
X-Received: by 2002:a05:6a00:a85:b0:736:3ea8:4805 with SMTP id
 d2e1a72fcca58-76bec314c7dmr13291605b3a.7.1754346232129; 
 Mon, 04 Aug 2025 15:23:52 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76c14f98fefsm1539951b3a.122.2025.08.04.15.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:23:51 -0700 (PDT)
Message-ID: <88a8333f-0507-4342-8858-445e348c6807@linaro.org>
Date: Tue, 5 Aug 2025 08:23:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] semihosting/arm-compat-semi: change
 common_semi_sys_exit_extended
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, Weiwei Li
 <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
 <20250804183950.3147154-5-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250804183950.3147154-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 8/5/25 04:39, Pierrick Bouvier wrote:
> We now check only is sys_exit is extended.
> This allows to break dependency to TARGET_SYS_EXIT_EXTENDED which will
> not be available anymore from this code.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/common-semi-target.h   | 4 ++--
>   target/riscv/common-semi-target.h | 4 ++--
>   semihosting/arm-compat-semi.c     | 3 ++-
>   3 files changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

