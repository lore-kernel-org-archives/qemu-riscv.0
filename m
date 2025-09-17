Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E069CAC59A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 13:48:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uysVX-0006Dr-4l; Wed, 17 Sep 2025 09:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uysVV-0006Cg-0Q
 for qemu-riscv@nongnu.org; Wed, 17 Sep 2025 09:47:37 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uysVT-0004gN-8I
 for qemu-riscv@nongnu.org; Wed, 17 Sep 2025 09:47:36 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-72c3b247827so53991327b3.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Sep 2025 06:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1758116854; x=1758721654; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=afCx/S2P9wlux9GcmAOzVrv0lndeyLcncX80adPZPP4=;
 b=Ag3rwL83FlDiF0I5oaRrh75P3K/VoPbCOAVcJ0XmeZIxQXCboPs+r2fMuMykMxFhFp
 kZkhSXtUk9G/DzDtswp2N+n1criF0JlgSGsVKtHmGTzDzJ++g1Z4DUFGyEEwydQHSstx
 tQuVeG64E92BQi39TLlKhli7Qfy6BJ/CFS/oaxKafTYc4vR9w4mCm9hwnQb2uI+aZYyT
 MicWjuSoxslU9NeIO+nYxWlXHNWaj6okAIU1ULNACzUrf3TAlJaaj1mDODV15XP6GG1m
 ouP4yCSyYoqc3CVDYkaZ+BqBz9P6jDoUxlrvAezrokRezTJDtRKCB/d5Srmev23fd/p4
 9Lag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758116854; x=1758721654;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=afCx/S2P9wlux9GcmAOzVrv0lndeyLcncX80adPZPP4=;
 b=HPZ6Y0RVd5mHdDLNdj4OI50m0z/QnVfxpe14JogmlTuOoTmmG5jBqFz2l/xZs+QVi1
 1Bq/gdwOH7OyY9HlsVZPddV13MFDo+gJ+dn7kE2SxD64m2yzcU6QLt9gQk+crYs1FG5l
 RUCzTiRBvp0Plgb3GXmuKpEo1brOVM9cwsOrrPpmdyKI4GSGexs2Td0hVN6tUQD/oB+d
 M8gihdYIwptvCf5Y0ny3W3r1y2AvPwbtNkUdc9oTTL1I2VoQ88+W+bZe0rpO+iemMrFx
 vFuSh8jnd5422AzJciSmgiTRP1SzB0Sz9B0/zLOCbGq9PYxLtVqJakMgdyCv2Hw6sYHc
 TTew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZNvJD1n23W2a0DnUbfjcbuAdNR+Bk7IcyRXoaiR1z/mrB5VyrHQbS2UvtTq13wK4zcg6y4MoH9gRS@nongnu.org
X-Gm-Message-State: AOJu0YxG+wCpGH/YkhPIxIH5yP60Ly2q1pEDHMrKzByB3C23g1H+WBRZ
 Pb1Ln6O+GC7i0ZVBzQiQ+qjU+FGVIZWR/+cCMQwAIY7wQz9YUTOZhcmxe0IzxkXPCu0=
X-Gm-Gg: ASbGncvdznkhSB+Zhq8iY5Il0awKMBq2FB1dLpwonHISvBYOnzb7ghrTiNRy1opOTJW
 X8c/SBup9D60UguA52Jn5BLpBdh8+cbAZXpnKUoLCNzkhinI6NMSOjBxn6I4WCDQK0BKajNMasH
 BG7FLzttD9pVSwq65olK0iMrfa1PdW5kW3FytorpwaKWjGGe6Fl26+sF/zfpNiB2podQ47j4x6q
 NRA2+653mOT/O3uUgsyvZEzVK5qEFJvotVW5Xv7vwQfEqx8MBzfNgwgwsnLvHO9GsRHRNoMtGDS
 4CHCliOiqtVRZSSU74EJxqg3ntizd2rVNu9lMb/izmlyzKxUkz4n90mR2v33ONJPNmQnW3AGDE2
 dLFwwO+ylnkOxJl5JbrPfBcVQyGA1LUwJVYa1iA==
X-Google-Smtp-Source: AGHT+IFmvjBoz4UYH2sQEAMF0BhzF53RQuAgaSFFyxHJnq0Fn6g+j76K3ZL7KZLCUXlGEfWP+1kCEg==
X-Received: by 2002:a05:690c:6e11:b0:721:6b2e:a08a with SMTP id
 00721157ae682-73892c58df9mr18143037b3.37.1758116853573; 
 Wed, 17 Sep 2025 06:47:33 -0700 (PDT)
Received: from [192.168.68.110] ([179.225.245.173])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-73887885289sm4533147b3.63.2025.09.17.06.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 06:47:32 -0700 (PDT)
Message-ID: <1e38dd76-f94a-4b2b-bdb5-329448c7dd1b@ventanamicro.com>
Date: Wed, 17 Sep 2025 10:47:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/8] target/riscv: Add the Zvfbfa extension implied
 rule
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250915084037.1816893-1-max.chou@sifive.com>
 <20250915084037.1816893-3-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250915084037.1816893-3-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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



On 9/15/25 5:40 AM, Max Chou wrote:
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fc0614dadba..b5c9f9ac586 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2576,6 +2576,15 @@ static RISCVCPUImpliedExtsRule SSCTR_IMPLIED = {
>       },
>   };
>   
> +static RISCVCPUImpliedExtsRule ZVFBFA_IMPLIED = {
> +    .ext = CPU_CFG_OFFSET(ext_zvfbfa),
> +    .implied_multi_exts = {
> +        CPU_CFG_OFFSET(ext_zve32f), CPU_CFG_OFFSET(ext_zfbfmin),
> +
> +        RISCV_IMPLIED_EXTS_RULE_END
> +    },
> +};
> +
>   RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
>       &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
>       &RVM_IMPLIED, &RVV_IMPLIED, NULL
> @@ -2589,8 +2598,8 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
>       &ZHINX_IMPLIED, &ZHINXMIN_IMPLIED, &ZICNTR_IMPLIED,
>       &ZIHPM_IMPLIED, &ZK_IMPLIED, &ZKN_IMPLIED,
>       &ZKS_IMPLIED, &ZVBB_IMPLIED, &ZVE32F_IMPLIED,
> -    &ZVE32X_IMPLIED, &ZVE64D_IMPLIED, &ZVE64F_IMPLIED,
> -    &ZVE64X_IMPLIED, &ZVFBFMIN_IMPLIED, &ZVFBFWMA_IMPLIED,
> +    &ZVE32X_IMPLIED, &ZVE64D_IMPLIED, &ZVE64F_IMPLIED, &ZVE64X_IMPLIED,
> +    &ZVFBFA_IMPLIED, &ZVFBFMIN_IMPLIED, &ZVFBFWMA_IMPLIED,
>       &ZVFH_IMPLIED, &ZVFHMIN_IMPLIED, &ZVKN_IMPLIED,
>       &ZVKNC_IMPLIED, &ZVKNG_IMPLIED, &ZVKNHB_IMPLIED,
>       &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED, &SSCFG_IMPLIED,


