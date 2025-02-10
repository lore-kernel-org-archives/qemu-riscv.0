Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CD7C02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:13:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thc1a-0002LY-OL; Mon, 10 Feb 2025 17:13:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc1K-0002Hm-PU
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:12:51 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc1G-0001LQ-Cu
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:12:49 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21f92258aa6so41566805ad.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 14:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225563; x=1739830363; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OG4nl4JMn5Wb7p2n5jtmBBqr8zpE1l6Y3NgKMPJ8ndI=;
 b=tbdakS4J/X6Q8HXG95QqkB3G8+6qwu3ebGh8nJ4Y7W273t0Bflzun/TJi/q+boY3ka
 q1APFlHdSBLw26aq05+xOIW45feIkdvZXBjMZqbfo5YJUIQBGMij7Cl9A2ViDIfyGPM8
 cLmI+sDS68X70d0Pf4arFmI2xNkS2AjBNQSBmBHMKHnRwBib1aJRzz6FY52lSh1WYLaE
 Z9rrzHBlkE2SzRnXa8tbiH3j7Jxsa80wf12jamXLGAklPkKz/bXrWlniykz03CdRPRHM
 TuaTpmHJkUS0UTtL7Zflcwua25iagHdUPhVQ1NeALQSbjmUKedcKr19Y7V1pz94blYtX
 36Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225563; x=1739830363;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OG4nl4JMn5Wb7p2n5jtmBBqr8zpE1l6Y3NgKMPJ8ndI=;
 b=NPmVWVcRbCHfxFWZZy1NQQnf/96ZCZf3aeLcLYxgCkyGAgwnkaZmq6TnvMve8hnpzM
 Iznq5A3OY4+5JMV6vsuHDj0jMYYTd0Di+MhuxOEgWSWX6z89HaJTTxooBVFaNweeec3j
 5m1efzqTxx35QTg3p8+r02j431qbmCJHk5eiTY3V7cm/mRigei2UeISgAFNe65yulxRR
 sAFHd/qpUhyIJZQF5NWbB/hshq6iEfArNonRj/nis/9x/Mc+hBaKcUftd8siCeJfvDQj
 5okCcFGfPgjtI95W0bMqDzI/4GblaYOnRz4U1gPssq7uInxft4WcMeTGY5GfJH+wj/Fs
 JnDQ==
X-Gm-Message-State: AOJu0YwG/vMOFP3IC6k4UnClGZWYxKo6OVlpOppB8w2LDS4kV6uZnfP0
 36Gy5XMEjle7a0zOeaHsB6boDck7ZiGBXd+FoltOSgzD6zmiC0oTJQBBsJ0TyoHW9p6pbDo8593
 m
X-Gm-Gg: ASbGnctNgBlUz6haSJF690JZEK76ninPmmlJ+octuJcYKHe2/eLGf0iDtT+q0IDN71I
 2c3HgP+Qfw6eJYNZdEVnffcbyaoIUBNPlwq4CC37O3kk0yUBKmta8RdPn/78Mo6jklFa3EDO7zu
 vtN0DOl8FrKaJ6FfN9mSinTmwmFpBFDdL/mvUxO3EEUyjFTshFDR1xjNDaydyKVb/bc8seEMupM
 jec1eHsyo4aNLMtEjsh1QDELbDLzAUox9gpPBtniCVqwdsTdSmMVM3vniEQfc8BKOTeHweIKWkb
 TGjKLwHk+xUtJUJjjwNmnSmkRniUn7rpcgcZu5AxBuV6tTgBEbCMJOY=
X-Google-Smtp-Source: AGHT+IGhv9BKFiC7VvxYLTViWUQhtRyq1uyIt1CXDTYyr3OpENDDeKgMbdrve91Ui9Cl+gOrpSsiqQ==
X-Received: by 2002:a17:903:2f84:b0:216:31aa:12fc with SMTP id
 d9443c01a7336-21f4e6e6123mr233359525ad.24.1739225563341; 
 Mon, 10 Feb 2025 14:12:43 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3650f91asm83768185ad.18.2025.02.10.14.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:12:42 -0800 (PST)
Message-ID: <d50cab06-ccd5-4ec1-af65-fbda9591243e@linaro.org>
Date: Mon, 10 Feb 2025 14:12:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] target/riscv: Set disassemble_info::endian value
 in disas_set_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/riscv/cpu.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3d4bd157d2c..b39a701d751 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1156,6 +1156,15 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>       CPURISCVState *env = &cpu->env;
>       info->target_info = &cpu->cfg;
>   
> +    /*
> +     * A couple of bits in MSTATUS set the endianness:
> +     *  - MSTATUS_UBE (User-mode),
> +     *  - MSTATUS_SBE (Supervisor-mode),
> +     *  - MSTATUS_MBE (Machine-mode)
> +     * but we don't implement that yet.
> +     */
> +    info->endian = BFD_ENDIAN_LITTLE;
> +
>       switch (env->xl) {
>       case MXL_RV32:
>           info->print_insn = print_insn_riscv32;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

