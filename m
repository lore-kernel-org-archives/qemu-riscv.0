Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB890C30658
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 22:17:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sOlnX-0003tU-FA; Tue, 02 Jul 2024 18:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sOlnV-0003st-HH
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2024 18:16:25 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sOlnT-0001Dh-0f
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2024 18:16:25 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1f4a5344ec7so189845ad.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Jul 2024 15:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719958582; x=1720563382; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RvCgJAWxZ8Pz9omjnhUJRuFsiJZlA5HqqRBNqXgO3Hs=;
 b=LsAPYjeT2tXDF5H1g2vuJ8D+SqgyKWUiHz8+YOg+a6Efe7tOZGEOCHqJBm1+CKBiTi
 mwBNVs5Fb2o8UHHpEyzzqO8mQa8h4HEWAT4gKNBxc5lWS0S5U+hixaznMhPDrdw9rPdS
 kdJ6UaKEwdJdu+WTUxgFOk0aA2On/EJlEvI8hrGW7YA2pXBiVfN7d8DryzUbejE86wMV
 1RenWBInisrw4Vt1MN06AxnhO8mR/XF5uaUPtnD3I823V4iV1FVQJ9+XDcKYT01/QbIQ
 2WoWV52j+TqOR+Xb3b6lkBT/AoJyyTXqnIiP+2QUtE32UArTbSC+M89+gtOzCtsWTGXO
 CwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719958582; x=1720563382;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RvCgJAWxZ8Pz9omjnhUJRuFsiJZlA5HqqRBNqXgO3Hs=;
 b=gp7LQj6wS+xRTuQflUfvrqSHDWvHphsu5oUxVE1ovTElHoFO8z5kgCDEwYCIQEhJY3
 0qFz21Gi/kzPGl0LHkl9aA9wFr85Sp011iFdZaEUjHAcVHP76PrBzJ+cfcBjc+3+wmfh
 VK5/1N3sRycl34TUsQebfPfjIA1nwdjZVWOE7mGUM+ASWAu/L40Mo+QCKl4niia2+0A0
 xMub07OycbTEJd3KBo3t12U+848AaNfvZmysiHF9pzdNF2BcidOCrlZ+nbAN+agNG6qI
 024bUWZaFwYeIugGxPGjW1Qf234Vpk3oRKczwAvvwoz13F0vVO+6MQm3dijbVmwe8qtj
 LGyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVAS2rlKYcbIshLUyaBpIvLFSn5wVaqz6Usfah2BoWGaQcLO0B8i+khOme9OLfyhWReHPB+j0lrtNjic7g7v5/sLB1thI=
X-Gm-Message-State: AOJu0Yyi3S1u/in4MQzETwYpT2x3SnK4lISB+bdMzKPUR3FW+abep760
 ffNFxI0um0hY8l4AOsEbWBKOJ2RI+kPBL3jxeB7CsdXHZW+1pbeGMth+xZ5AQ2w=
X-Google-Smtp-Source: AGHT+IFsqqe81gf74mYOfuHaKdZrZIQ/gQIiDfe/eHo5rQwCqd0C5bOCuyP3Z4+N42MFYJ0aaxoB/g==
X-Received: by 2002:a17:903:40d0:b0:1fa:38f4:b5d0 with SMTP id
 d9443c01a7336-1fac7e4c28emr199296275ad.13.1719958581681; 
 Tue, 02 Jul 2024 15:16:21 -0700 (PDT)
Received: from [192.168.68.109] ([179.193.8.43])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15694b2sm89237325ad.190.2024.07.02.15.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 15:16:21 -0700 (PDT)
Message-ID: <32a2e874-7113-434e-a295-e76f6c78a2af@ventanamicro.com>
Date: Tue, 2 Jul 2024 19:16:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] util/cpuinfo-riscv: Support OpenBSD signal frame
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: brad@comstyle.com, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org
References: <20240627180350.128575-1-richard.henderson@linaro.org>
 <20240627180350.128575-3-richard.henderson@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240627180350.128575-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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



On 6/27/24 3:03 PM, Richard Henderson wrote:
> Reported-by: Brad Smith <brad@comstyle.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Acked-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   util/cpuinfo-riscv.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/util/cpuinfo-riscv.c b/util/cpuinfo-riscv.c
> index 6b97100620..abf799794f 100644
> --- a/util/cpuinfo-riscv.c
> +++ b/util/cpuinfo-riscv.c
> @@ -13,7 +13,14 @@ static void sigill_handler(int signo, siginfo_t *si, void *data)
>   {
>       /* Skip the faulty instruction */
>       ucontext_t *uc = (ucontext_t *)data;
> +
> +#ifdef __linux__
>       uc->uc_mcontext.__gregs[REG_PC] += 4;
> +#elif defined(__OpenBSD__)
> +    uc->sc_sepc += 4;
> +#else
> +# error Unsupported OS
> +#endif
>   
>       got_sigill = 1;
>   }

