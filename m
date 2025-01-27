Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80AFC0218A
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 16:25:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcRv2-00039g-Dh; Mon, 27 Jan 2025 11:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcRuc-00034S-IS
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 11:24:34 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcRuZ-0002cR-9I
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 11:24:34 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso81018495ad.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 08:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737995069; x=1738599869; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bB0BpdOh/1R/AItutEPGXbd3C8TH4SbugusHRdMwPtc=;
 b=eSVKGnWPI+KVUzESRwyXgBDzCT8q3G09KPnXyZby6drjJqpnaKlFOMZRuqXh0x4RKj
 xgQDOzt0ZvfnTgTQ46vYRkppYvsMPUFzaulk9IvI0W8Bf7KC0+ImIxyieOvuwvAfXRbd
 D/rfJZ/Jd2CLPRC3nDtIUd4d1p67BfcuDmMoWs0R2mw7MDu/NXtVusHei7gUfWn88+T6
 J4LSxBp3kyNbuiiA4YcZ+uKwIPEgHSL6MzrCZWptJBzycfsjSMi2o0A9QmbfHNUoGWu8
 B1XHDSGUhYuGPdeRjqQMP2PodBkXPmNDKCaKh4IS++6eXefmhkF/jAO4BPT/51r33HwH
 NgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737995069; x=1738599869;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bB0BpdOh/1R/AItutEPGXbd3C8TH4SbugusHRdMwPtc=;
 b=mlsAkRrxOM1WJBBU909NsvcCpqTvR4FKDcLb81K0JrbhHTxpspJlOUs+zzfoyuA5UE
 GSVkLXvhyByETau6xw+JGHI2UJS6NnLkWpYTs2tW/AeIXWf2DGxh/TPkP8emHObnNbfp
 6uBMoiw4+Tahdf8b3sD0KQPbPORreM+/ilZfAgmwdkTOpUM6TnIgdOW0bw0+IYlk0cUe
 vDQlDiMkyXma/xbBb19CEq0DNeKU/GwuKHMQblOYtHuyimq5Sns2GcErWQWa97B8fO8J
 e9DgPpe72s7rN55JCiAmr6g/3UhNJgPikR2D2HYcvlrBRCR4z3ulh41bCN06a5GrEoyq
 P4YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW47CmVTbJKXatKve8sHyxTvrcVgaT9UVfvGNZQSJGekiaY1Qq09N640CBrN+BtJwQmQABcNN3RJwsx@nongnu.org
X-Gm-Message-State: AOJu0YzhHBvK4BeVb/meP1AUKNEOba/8b5E/BBoisFfc/N9CdhBckdL1
 b7EPeSYybxqok5X0hyvIWn9OZF6vlBv/saN7PFm4MpipjJzUfZt0lNpRiXzeBbw=
X-Gm-Gg: ASbGnctr71rubpH8HkKNZ9n5ZroknCB6eyhFIa9DMCz/IP2DKSBWz5zjmn6ZsaWvZ/J
 3/bUZq6kJlin19qsvclkWwW9f8VosaOnP1AHAK7ghl3E9q9cA50U7qEIJT0VSgdX7gzERluMsdi
 3tkpNM/PuRrqwUiVRmCmUxFyAMx99/KLykXBSMBVMHVFTOp92bfuJJU9vp2bx5rgUcrdbKVAanx
 q4bUfY/fqoYWfedItLCabmu+0ljjsw81yZZGUn7MbRw7lkZQiPgn23QDZEUZi5EnNlEFX0bIzBS
 CbPuJaGVk+SHwmuj9dsnwVg6zy3JdFYaTEm7UdULUWjP4n0=
X-Google-Smtp-Source: AGHT+IGwC5BLlB52bq+8MSIQYbi0pQ9GOWA5RyvqDvPwW0g6J+uIy1G55+OoSEpiC5eOs2eQXLY+xA==
X-Received: by 2002:a05:6a20:490a:b0:1e1:b8bf:8e80 with SMTP id
 adf61e73a8af0-1eb215f0449mr50200176637.41.1737995069116; 
 Mon, 27 Jan 2025 08:24:29 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac49717de96sm6611128a12.77.2025.01.27.08.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 08:24:28 -0800 (PST)
Message-ID: <bea7dd41-c923-477a-a17a-af4120f1b5e1@linaro.org>
Date: Mon, 27 Jan 2025 08:24:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] target/microblaze: Set disassemble_info::endian
 value in disas_set_info
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org
References: <20250127115426.51355-1-philmd@linaro.org>
 <20250127115426.51355-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250127115426.51355-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 1/27/25 03:54, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/microblaze/cpu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 13d194cef88..7603d2e8f73 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -224,6 +224,11 @@ static void mb_disas_set_info(CPUState *cpu, disassemble_info *info)
>   {
>       info->mach = bfd_arch_microblaze;
>       info->print_insn = print_insn_microblaze;
> +#if TARGET_BIG_ENDIAN
> +    info->endian = BFD_ENDIAN_BIG;
> +#else
> +    info->endian = BFD_ENDIAN_LITTLE;
> +#endif

Avoid preprocessor wherever possible:

   if (TARGET_BIG_ENDIAN) {

or ?:.


r~

