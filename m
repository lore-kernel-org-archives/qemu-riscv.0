Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3385BC282DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 12:43:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tsht7-0000j1-6R; Thu, 13 Mar 2025 08:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tshsy-0000Xh-K1
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 08:42:07 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tshsu-0003Xe-8E
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 08:42:03 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-22359001f1aso21333715ad.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 05:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1741869716; x=1742474516; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bsj7AX8gQvYxU3KPVhraEp0zwvIkHHL34mRQ+1KZuRY=;
 b=WmZ9M4gse2jJudS4SmNXzXqzczL5AhIVnCTxV5TjybKonK8ni8bqCO8sk5Tc8HWOAx
 ltTJpqmeU8n83CPxQAZi7uJg6bKe4mDG3/oXDRtEoM+KDDANicNbzgRGcHzdaMvCtakc
 95tguOavsDeuKX694ZL8n88qPXM978McgzQCPNObaoAOOTP9KIUQGZfNEXXnZtuqoYH/
 XX2Ug/0C3wHLa3+/30NXWaGIN9oxjHdG/UG4NsLdkdsNAPCTHbYwey33LgdYeEmlhYd3
 noszKyms4FIjbPSkcqRidYrgrcW5k8Q6n7W5no5hSAdGAcWGu2OU/Gf5DVHsr0a4fBmO
 MFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741869716; x=1742474516;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bsj7AX8gQvYxU3KPVhraEp0zwvIkHHL34mRQ+1KZuRY=;
 b=njQxBjZ0t6tIqxh9048kHAFW8dJE37xwcV2QG3qmD/86f0mm9tuwV/tgNB6GwxiOI3
 b2MszgSfrqlsyxlA7iMqs7XwnT+lDokXFFtNiJVrbWtApK+ZmEALqMgrbNq5xGyDZ0nm
 RGQ5EhgVzp9LuwIlHSm+owY8SSngym4cgmHgoOnSqoMV/5Hz+i9kEJG+M0DN1bRXVd5n
 Ca/PRaF7lnLWT8yG4wu2wG3IWa8NB2WtZFjyXwIZJR1Sc1sw7zAnXwJybKLYfFSmC5UO
 AG27Qoxr3Qw/6wfZQsjUrHRVKzDgVBPIBwwIxQ7t6BR8k/RV8gtseDxci42t/Wfp7hs9
 3J/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdX07TTSrPehjC4lFCtTk4UUUBVSioswyZgSLUa5TfFv2OLFCU7Bdd+hNhPevcRPjGvIX85fDaKCr8@nongnu.org
X-Gm-Message-State: AOJu0Yy//VojPF/0HEzqTarRqUX8ZYZe5bo1b0L1zZAkV7l8nounkX1y
 uZL1dbKCTQJHlCbDpV3cUZGd95IwJIluMvuBqWtPDc7NB6XtHAEV/LXuVx5H3lEHG99Qs1wtPC9
 P
X-Gm-Gg: ASbGncvHj4p/aub5lyilyYYXi++aK+TwNxRVJHLiEWYUFIUdgs9leS9IaWEPnwMP07i
 zm8dOoEzcGu/Mft4HjTLgWn3xPxdQJZGRB/4MXv10KVonc+MAcQYtNUFSkkKExjR7swBQEEyMb0
 oKZ/dkwOVZeoG2N4fHey+zQsdSk3AzxE9BYjGBneqf1t9CGhmd9djcV8YFQBThJj1KepzKEQQ6P
 OrMXBn2LwjJDZz8JtkwWD+2gmEtk6FwTYHeaOHMNNMxluTy/xYAaED+uwpEz7J+YcGVG4exCehw
 doFPlv+HIjn0rTA3GLL1yuOs7d9wJ4cJYtgaT+rZcM7TFrC9AEehGySZU9I=
X-Google-Smtp-Source: AGHT+IERoJ+ZwvsVDlGQHEAl1jJo/A2fCmH3J6LMkdMrCUY9jFQlVu3jmaBNWCoLnV4OjuRdhsNWlw==
X-Received: by 2002:a05:6a20:2d14:b0:1f5:80eb:8481 with SMTP id
 adf61e73a8af0-1f580eb8e70mr21068474637.13.1741869716038; 
 Thu, 13 Mar 2025 05:41:56 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.117.79])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9c95c5sm996405a12.4.2025.03.13.05.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 05:41:55 -0700 (PDT)
Message-ID: <54970784-4389-4f61-8c54-4413cba7ff36@ventanamicro.com>
Date: Thu, 13 Mar 2025 09:41:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] target/riscv: pmp: remove redundant check in
 pmp_is_locked
To: =?UTF-8?Q?Lo=C3=AFc_Lefort?= <loic@rivosinc.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250225160052.39564-1-loic@rivosinc.com>
 <20250225160052.39564-6-loic@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250225160052.39564-6-loic@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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



On 2/25/25 1:00 PM, Loïc Lefort wrote:
> Remove useless check in pmp_is_locked, the function will return 0 in either
> case.
> 
> Signed-off-by: Loïc Lefort <loic@rivosinc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/pmp.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index e4fee10d93..81c8bd71ce 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -58,11 +58,6 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
>           return 1;
>       }
>   
> -    /* Top PMP has no 'next' to check */
> -    if ((pmp_index + 1u) >= MAX_RISCV_PMPS) {
> -        return 0;
> -    }
> -
>       return 0;
>   }
>   


