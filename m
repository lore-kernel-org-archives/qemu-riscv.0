Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B771EB64DC
	for <qemu-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:27:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDZ8Y-0001S6-LI; Sun, 25 Jun 2023 19:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDZ8W-0001Rk-Rj
 for qemu-riscv@nongnu.org; Sun, 25 Jun 2023 19:27:16 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDZ8V-0002sz-2s
 for qemu-riscv@nongnu.org; Sun, 25 Jun 2023 19:27:16 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3a1ba074dadso1025570b6e.1
 for <qemu-riscv@nongnu.org>; Sun, 25 Jun 2023 16:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687735631; x=1690327631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gEjRHBsrr1dT9wqudUY/3yg84UNpyFKBQlvUGGHZCn8=;
 b=F4FMPiVABSK2NsrKCC0S8ShX/jWfigGPDEtplBFXwZTzzXdlZVKv0nPTI/bmY5Ffr4
 ++zdqvWRW0s8IyoLu7AP64N24xDWD5kzfJL+P8LUj+emKYweR3TEemOmTPdrhECXlsCi
 ND4rG22dRY1n29URv9uXh9P9aTvhqcCFczRkzs29VXcb95KvFhtytzCOHKFjbtbu6Z3j
 zDPV0MYgBS+eVf4aycccTCBk7AoBn42Wmau/eUm2oIg/bFk+7cxpyTyKLzE1JlTn2ptT
 NVkkFT5LggUCa79GUz7hj4j40P0oHUxrLCKIfk66/QbWLzVicmW792LE9neGn3c+MpPT
 zB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687735631; x=1690327631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gEjRHBsrr1dT9wqudUY/3yg84UNpyFKBQlvUGGHZCn8=;
 b=jNsOAsgzyhufN9WU+Bi9d6Jfda9Kh/MKlqRkX8r8Q9c5pbpVr0b8xLB6eRJPqNpNub
 cvYhIqmm+qOiFOekHUYW1veldLLK5blN1TNgNkZXVuiTjfBOu1/xMFnUWWMXqVcfqrV+
 SSrvDCZsBQZEE/65J7Z+/OTTrXfT/6/NfXenpMCAw9/tZgmQYD+pEegUB7NFZOihyDBV
 X62tixnzEb2MVy9o8KQbYgsLxHUmivqGwlyYlvxAeBHy9BlfdR2rPZ3uvHxa2OR+4yLv
 XG8WCcAotNJ5oy4O9Y9gFS3j+6GXskLf2RARGWJdVM/RxL+2pM1O8Uqsf22Fu7bW66so
 Nq2Q==
X-Gm-Message-State: AC+VfDyNsqpQzZbO9enU0WHmBLvuCc8rx0blw1bOWQcW1zb0Y6/Re0QZ
 tBQC5KD0tRHGe9lDh/yDml/wJA==
X-Google-Smtp-Source: ACHHUZ5CvuymUtlWWzPzBakmYVKXjVsMD8OJJ7yNJnHVq42R4wuo3RB/t8kBaJUoon0D9YfnnLBlUw==
X-Received: by 2002:a05:6808:2096:b0:3a0:6540:794c with SMTP id
 s22-20020a056808209600b003a06540794cmr8158234oiw.19.1687735631066; 
 Sun, 25 Jun 2023 16:27:11 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 i17-20020a056808031100b003a04cd0e13dsm1926417oie.9.2023.06.25.16.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 16:27:10 -0700 (PDT)
Message-ID: <0570cc14-04a4-2808-8668-446d2e6ea62d@ventanamicro.com>
Date: Sun, 25 Jun 2023 20:27:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] target/riscv: Restrict KVM-specific fields from ArchCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
References: <20230624192957.14067-1-philmd@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230624192957.14067-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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



On 6/24/23 16:29, Philippe Mathieu-Daudé wrote:
> These fields shouldn't be accessed when KVM is not available.
> 
> Restrict the KVM timer migration state. Rename the KVM timer
> post_load() handler accordingly, because cpu_post_load() is
> too generic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> Since v1 https://lore.kernel.org/qemu-devel/20230405160454.97436-10-philmd@linaro.org/:
> - Restrict whole vmstate_kvmtimer (thus drop Daniel's R-b)
> ---
>   target/riscv/cpu.h     | 2 ++
>   target/riscv/machine.c | 8 ++++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e3e08d315f..b1b56aa29e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -363,12 +363,14 @@ struct CPUArchState {
>       hwaddr kernel_addr;
>       hwaddr fdt_addr;
>   
> +#ifdef CONFIG_KVM
>       /* kvm timer */
>       bool kvm_timer_dirty;
>       uint64_t kvm_timer_time;
>       uint64_t kvm_timer_compare;
>       uint64_t kvm_timer_state;
>       uint64_t kvm_timer_frequency;
> +#endif /* CONFIG_KVM */
>   };
>   
>   /*
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 3ce2970785..d27f8a2a3a 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -199,7 +199,8 @@ static bool kvmtimer_needed(void *opaque)
>       return kvm_enabled();
>   }
>   
> -static int cpu_post_load(void *opaque, int version_id)
> +#ifdef CONFIG_KVM
> +static int cpu_kvmtimer_post_load(void *opaque, int version_id)
>   {
>       RISCVCPU *cpu = opaque;
>       CPURISCVState *env = &cpu->env;
> @@ -213,7 +214,7 @@ static const VMStateDescription vmstate_kvmtimer = {
>       .version_id = 1,
>       .minimum_version_id = 1,
>       .needed = kvmtimer_needed,
> -    .post_load = cpu_post_load,
> +    .post_load = cpu_kvmtimer_post_load,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
>           VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> @@ -221,6 +222,7 @@ static const VMStateDescription vmstate_kvmtimer = {
>           VMSTATE_END_OF_LIST()
>       }
>   };
> +#endif
>   
>   static bool debug_needed(void *opaque)
>   {
> @@ -409,7 +411,9 @@ const VMStateDescription vmstate_riscv_cpu = {
>           &vmstate_vector,
>           &vmstate_pointermasking,
>           &vmstate_rv128,
> +#ifdef CONFIG_KVM
>           &vmstate_kvmtimer,
> +#endif
>           &vmstate_envcfg,
>           &vmstate_debug,
>           &vmstate_smstateen,

