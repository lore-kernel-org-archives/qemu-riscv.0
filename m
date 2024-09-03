Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1083FCD37B5
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 21:54:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1slbTu-0000LE-5A; Tue, 03 Sep 2024 17:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1slbTp-00005s-OM
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 17:54:30 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1slbTn-0003op-M7
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 17:54:29 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-7cb3db0932cso4408413a12.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Sep 2024 14:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1725400466; x=1726005266; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SdxZlz7ZAQuTVMCU2qJ2a96m6YfRWZ1ltkufI0TwbHs=;
 b=JqLHiKnbmrV7p8LRrPbtBAF2+YNiem+CsmUvyEuofZXMEUkUU4b2p+hVjPlCnmkS3V
 gqMiQYlHx4MYdUa1EKKPHc2+trEQ0dxx0JdXoxqnKZoTZ1/b72JRqvdkwNb3Ldz9sx29
 AYUe2UBf3AquGcvk1cQ8cIp3PcOYT3aj0KpwIfDjJM2S6kEi1sKkG6oKFy2QdajS0OEf
 wqvjZniwmuyDJr+1mVeyGZFsPob1AB6KLPoRrQUJofSkt9tXnjE0ikoaT0pZp91A/X2I
 HBA/d/0/7vprSSip35SY6zssNPvU3L1NofsYwluYLH48eWR4PsWaYm5HDTqHqH4CLqcN
 VTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725400466; x=1726005266;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SdxZlz7ZAQuTVMCU2qJ2a96m6YfRWZ1ltkufI0TwbHs=;
 b=qLv69fhCWXxR9nPdnOnAPxhezgdeUzQjB8gKmWDVBQba8Vw57Ba5RUZdU+0bDMCqSa
 5vmMLzAd7nwaip9qHxe7BHPw6rPEs0ggDcUMGVnodNFYBaDfbcyJJiGniBab5oPqDJF6
 qhHd1wsw9k7Jv4LGDuloEDb11dQZ7f1BvEEn9wp700pZ6Bb0VCcYuD5uxKqg+z60QGj6
 M6Y1la85ttQavWFZ1ubE61p+zaJMUrkPwvqCiqzeYn0m1Kq8ZKIIFsIVPAs2/Sc6qxBP
 27OgBk7TPtDklXCjzzas1Z+YC8Seutp5K2gLtQHbiqGRRmMTbkV5NcKBX00+XIRgCNUz
 DB2g==
X-Gm-Message-State: AOJu0YxWKu1gq55uvwF7ry4jjHQQJqKuKjj9uVdvkZZL98OJ3ePQHlcR
 D9yT4UXOUHj8cuVtfmLTcUgZ/Sq6mEDy1O4LafIJz6JCpyhLr2VyK0JIs3JahdM=
X-Google-Smtp-Source: AGHT+IHmGkmffKbySUO+AIOnN0PnscejLQeyuVowXqcKHi8IsbrIYaFPRLuADMHdOPvZviFA77s4/g==
X-Received: by 2002:a05:6a21:3941:b0:1c0:f5fa:cbe6 with SMTP id
 adf61e73a8af0-1cce1010186mr21370738637.22.1725400465932; 
 Tue, 03 Sep 2024 14:54:25 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.227.130])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d4fbd8c1d2sm363439a12.21.2024.09.03.14.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 14:54:25 -0700 (PDT)
Message-ID: <967f8332-60c8-458b-a07e-d4393add05f0@ventanamicro.com>
Date: Tue, 3 Sep 2024 18:54:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] target/riscv/cpu.c: Add 'fcsr' register to QEMU log
 as a part of F extension
To: Maria Klauchek <m.klauchek@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bmeng.cn@gmail.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
References: <20240902103433.18424-1-m.klauchek@syntacore.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240902103433.18424-1-m.klauchek@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 9/2/24 7:34 AM, Maria Klauchek wrote:
> FCSR is a part of F extension. Print it to log if FPU option is enabled.
> 
> Signed-off-by: Maria Klauchek <m.klauchek@syntacore.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a90808a3ba..6ff6096777 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -839,6 +839,12 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>           }
>       }
>       if (flags & CPU_DUMP_FPU) {
> +        target_ulong val = 0;
> +        RISCVException res = riscv_csrrw_debug(env, CSR_FCSR, &val, 0, 0);
> +        if (res == RISCV_EXCP_NONE) {
> +            qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
> +                    csr_ops[CSR_FCSR].name, val);
> +        }
>           for (i = 0; i < 32; i++) {
>               qemu_fprintf(f, " %-8s %016" PRIx64,
>                            riscv_fpr_regnames[i], env->fpr[i]);

