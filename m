Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD690C61D92
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 12:55:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5QHb-0006ia-43; Tue, 21 Nov 2023 07:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r5QHY-0006eX-4i
 for qemu-riscv@nongnu.org; Tue, 21 Nov 2023 07:55:12 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r5QHL-0004Bt-J4
 for qemu-riscv@nongnu.org; Tue, 21 Nov 2023 07:55:11 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1cc9b626a96so40457085ad.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Nov 2023 04:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700571298; x=1701176098; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=meUBYdOP22fl+Zx1rl9mhG9Zehql+ZMDsSHp/CND19Q=;
 b=blQkAu2zCZcVEde7+yxrrO6+zh5ST5f6ONfN42RL42WNMjBEeIi2yyUGpk503vm6wF
 gnsBYVUvQumQqDRZDAkl5mRpoJ+Xq2x/Y6xda3TSha/Wl/OCEOuMiITCoGbHT2/chD7o
 69p8hlQRRlAOo3soHv5LBZCtENH0MiKVVR60J3KyW278c+t6nZjaWimZ7nUje+fyH3gQ
 K5WxMpl9csQ0gvaAUn/G6RTBj/gz13FX+Ms1M5Kj9YafMdcx+aw+8z4DLZoWblpDtJYc
 bnUxRzx6VwGWEVl7/7N9LLBv9LhG0HpvB2tCwE9LAUVZl2jfT2vF7qSJJd6nXZQ0ZH+6
 veLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700571298; x=1701176098;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=meUBYdOP22fl+Zx1rl9mhG9Zehql+ZMDsSHp/CND19Q=;
 b=ZX3e6MoCnqmP8cjBVXRNYrjF9BCfkMXsA+ZhxltTjCk0x+Bq2NqKlmAx35YcaI+E6f
 eoRC/IbyoA1h5oGjhY9Luhm+vfqA83GFgAN5UvUtCd8cMRHBTi9UTY1R9M2iXxvEW85N
 jvBCni03DKJkhj5AQcllCnBARgLl8A4UkWdbgI60LwG6sNcO9pOxP15ptFxSuIjwLDt0
 6Z/ulbIIOWZOoIe2MnCR0K78enKJ5QqLcQgDv0Qxk/eD06FdNGNpNKZGrXaJflcqsQr8
 RMilDL+s9H6nsLeTs0F7eZLA7co64r24UTePqaIplrIXJi2A5fE4baKYLXAm933oJmqT
 Il5Q==
X-Gm-Message-State: AOJu0YyCYiN4qERqE45Fshf9BxVieZvbOvSOQ4gLLvz0xjiClpv1YAvz
 VnBNC7G7Zr0I1ySyqu5YfWNorw==
X-Google-Smtp-Source: AGHT+IHTDRgiE3b3A3y1/0qsrRtpJw/TGMURgElGl7YDAkdgzX8IBp7Yu9jN1rk8dits6ldpl/GpWA==
X-Received: by 2002:a17:90b:164c:b0:285:24bb:4524 with SMTP id
 il12-20020a17090b164c00b0028524bb4524mr5120334pjb.24.1700571297967; 
 Tue, 21 Nov 2023 04:54:57 -0800 (PST)
Received: from [192.168.68.109] ([152.250.131.119])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a17090aa38a00b0028328057c67sm7027577pjp.45.2023.11.21.04.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 04:54:57 -0800 (PST)
Message-ID: <8ec16fea-c8af-47d9-afe4-20a6f3f74a8e@ventanamicro.com>
Date: Tue, 21 Nov 2023 09:54:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] target/riscv/cpu_helper.c: Invalid exception on
 MMU translation stage
Content-Language: en-US
To: Ivan Klokov <ivan.klokov@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
References: <20231121071757.7178-1-ivan.klokov@syntacore.com>
 <20231121071757.7178-2-ivan.klokov@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231121071757.7178-2-ivan.klokov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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



On 11/21/23 04:17, Ivan Klokov wrote:
> According to RISCV privileged spec sect. 5.3.2 Virtual Address Translation Process
> access-fault exceptions may raise only after PMA/PMP check. Current implementation
> generates an access-fault for mbare mode even if there were no PMA/PMP errors.
> This patch removes the erroneous MMU mode check and generates an access-fault
> exception based on the pmp_violation flag only.
> 
> Fixes: 1448689c7b ("target/riscv: Allow specifying MMU stage")
> 
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu_helper.c | 30 +++++++-----------------------
>   1 file changed, 7 insertions(+), 23 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b7af69de53..9ff0952e46 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1143,47 +1143,31 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>                                   bool two_stage_indirect)
>   {
>       CPUState *cs = env_cpu(env);
> -    int page_fault_exceptions, vm;
> -    uint64_t stap_mode;
> -
> -    if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        stap_mode = SATP32_MODE;
> -    } else {
> -        stap_mode = SATP64_MODE;
> -    }
> -
> -    if (first_stage) {
> -        vm = get_field(env->satp, stap_mode);
> -    } else {
> -        vm = get_field(env->hgatp, stap_mode);
> -    }
> -
> -    page_fault_exceptions = vm != VM_1_10_MBARE && !pmp_violation;
>   
>       switch (access_type) {
>       case MMU_INST_FETCH:
>           if (env->virt_enabled && !first_stage) {
>               cs->exception_index = RISCV_EXCP_INST_GUEST_PAGE_FAULT;
>           } else {
> -            cs->exception_index = page_fault_exceptions ?
> -                RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
> +            cs->exception_index = pmp_violation ?
> +                RISCV_EXCP_INST_ACCESS_FAULT : RISCV_EXCP_INST_PAGE_FAULT;
>           }
>           break;
>       case MMU_DATA_LOAD:
>           if (two_stage && !first_stage) {
>               cs->exception_index = RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT;
>           } else {
> -            cs->exception_index = page_fault_exceptions ?
> -                RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
> +            cs->exception_index = pmp_violation ?
> +                RISCV_EXCP_LOAD_ACCESS_FAULT : RISCV_EXCP_LOAD_PAGE_FAULT;
>           }
>           break;
>       case MMU_DATA_STORE:
>           if (two_stage && !first_stage) {
>               cs->exception_index = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
>           } else {
> -            cs->exception_index = page_fault_exceptions ?
> -                RISCV_EXCP_STORE_PAGE_FAULT :
> -                RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> +            cs->exception_index = pmp_violation ?
> +                RISCV_EXCP_STORE_AMO_ACCESS_FAULT :
> +                RISCV_EXCP_STORE_PAGE_FAULT;
>           }
>           break;
>       default:

