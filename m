Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A41FC4345F
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 18:02:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s1roA-0006sM-KB; Tue, 30 Apr 2024 14:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s1rnx-0006oK-I7
 for qemu-riscv@nongnu.org; Tue, 30 Apr 2024 14:02:14 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s1rnw-0006K3-3t
 for qemu-riscv@nongnu.org; Tue, 30 Apr 2024 14:02:13 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1e86d56b3bcso55160235ad.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Apr 2024 11:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1714500129; x=1715104929; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xG52DUb8MKCii4RhM5Z2NhFbXjj4O7G8wtYfzgACnmM=;
 b=YhQY4OxZ8znRsJl+OIv5DpNXtDho7KkkaFHv9HkeyqdT4x7pEGHcRgYxjgKPF9Ljq+
 mZ9NEPr+D+GcHu8/QjMdKRwoxokY67UauJrLmviALlyZfGPZbchW8d44pkA7dUEsDTvl
 YSXKDsIY5ku8+BFPE8deNA+lYGVfCfm7n0/EjiIif+rh15cZ/nQkT0E/VSnhltshPP+u
 GmXlb8/yyvCDHBIyzDtnG/gjH7WVXMmHU/qi3jLaFAmkfkphF9vJZ6v4oPKhbqFooAGa
 AEqy1q7/wraxPoy1fB46T8K//NOS9RvWXaAtaVaRKDWj1jGX9XkI2k+xFs3A5rsubaHX
 5QKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714500129; x=1715104929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xG52DUb8MKCii4RhM5Z2NhFbXjj4O7G8wtYfzgACnmM=;
 b=Ia3g+PcZUHJ7BiKgp8SCE7a7QQ1BVuZX/opN26VoYDf9GyyNs65upnLjhKluIhsrj1
 265Mp39N09rPzCP/u/tX7PJUJmdZ4j4wjzpzFMIp+MREFeZpSzYX99a4YRr2wil+n8BE
 udUKfiHCPTPsAvygQuo2RnZhFrKkylBNB4i9Axz4UuzeHFhb3rB1ZRH31KlbkhCat0Rt
 xlYwqrGy+ShIpSgepe0leaddRQ9RSsIF/CdDoCpAF62cwMhpHykN2nYTi/e2If23boW7
 PC+6R8R4AnzRVvmmcn1peLFrjW7H7DH5EECBbt448k1St9VhoTkJ6c5gwZmghk6IEZxb
 KR5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd6NmKFgSxxzVee2trY0iRADHEmYcVazZQApH8A125PQcq9G9GKx6EOPGN9ZxUTX6a+Wm9c2ncT/5fob3YUWGHTj1qVzU=
X-Gm-Message-State: AOJu0YxgCWgudHsdMS91tAuPc/5/olvuqCiXGeTYY22Aa5OaXunXi6k2
 /UQPimqDCAY++EW9AyqpJUP1M+Aw2yo//JqmcZTfIsRgdcZQ78uPjf9eKYwM/rk=
X-Google-Smtp-Source: AGHT+IGHUc8zlVI42nkKjwLza807Z1PV8orIZatqV/K/cvW5LNB1EpIboB0rtEcsGcGafk7rkwfLQA==
X-Received: by 2002:a17:902:d2c8:b0:1e4:10d9:5dfb with SMTP id
 n8-20020a170902d2c800b001e410d95dfbmr170060plc.38.1714500129551; 
 Tue, 30 Apr 2024 11:02:09 -0700 (PDT)
Received: from [192.168.68.110] ([187.11.154.208])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a170902e84600b001e604438791sm22695768plg.156.2024.04.30.11.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 11:02:09 -0700 (PDT)
Message-ID: <7944796f-fe31-4012-87ab-6c6407d5118f@ventanamicro.com>
Date: Tue, 30 Apr 2024 15:02:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/riscv: Enforce WARL behavior for
 scounteren/hcounteren
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 bin.meng@windriver.com, alistair.francis@wdc.com
References: <20240429-countinhibit_fix-v1-0-802ec1e99133@rivosinc.com>
 <20240429-countinhibit_fix-v1-2-802ec1e99133@rivosinc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240429-countinhibit_fix-v1-2-802ec1e99133@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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



On 4/29/24 16:28, Atish Patra wrote:
> scounteren/hcountern are also WARL registers similar to mcountern.
> Only set the bits for the available counters during the write to
> preserve the WARL behavior.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/csr.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 68ca31aff47d..a01911541d67 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2843,7 +2843,11 @@ static RISCVException read_scounteren(CPURISCVState *env, int csrno,
>   static RISCVException write_scounteren(CPURISCVState *env, int csrno,
>                                          target_ulong val)
>   {
> -    env->scounteren = val;
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    /* WARL register - disable unavailable counters */
> +    env->scounteren = val & (cpu->pmu_avail_ctrs | COUNTEREN_CY | COUNTEREN_TM |
> +                             COUNTEREN_IR);
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -3475,7 +3479,11 @@ static RISCVException read_hcounteren(CPURISCVState *env, int csrno,
>   static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
>                                          target_ulong val)
>   {
> -    env->hcounteren = val;
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    /* WARL register - disable unavailable counters */
> +    env->hcounteren = val & (cpu->pmu_avail_ctrs | COUNTEREN_CY | COUNTEREN_TM |
> +                             COUNTEREN_IR);
>       return RISCV_EXCP_NONE;
>   }
>   
> 

