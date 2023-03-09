Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paNI1-00038n-NM
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 15:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paNHw-000385-9B
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 15:55:00 -0500
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paNHu-0000kz-R0
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 15:55:00 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 o19-20020a056820041300b005259de79accso488298oou.9
 for <qemu-riscv@nongnu.org>; Thu, 09 Mar 2023 12:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678395297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3jEMEfbfDKXtPR1DWT3PDin6iMIwbSVFmmR6BIiljuA=;
 b=WuEwGFmQSTypvmOrJcFGg6zVK21x4zdjwfxdhSibpKrCUr1feF4H7Jzp5/os6makkM
 RV6a7fLoHkj/Dl4nZYxYLBjGbmfpuRRAk/bXKWv3ru+cngwVKsscKzjBvMQOeH50l2bm
 0eSsvKeow/wBvp4Gcenbg5OGKUcljGIeoiHTZXaruXnScpI0bMl0q7YLe01jdamLj/XD
 kwWaGZ0ydZAMVCnqERN8AVEObp2wHVKEnknhLaqq28hiuZ/w7O+JCYLzEXBW5Aq6AHA9
 luEwkDLPEcqSpWKy+larW6n5tmY9A+vLGeuc2PNY0Kn8yAj/fhaBRSMnQTZg6hsQlk8U
 unIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678395297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3jEMEfbfDKXtPR1DWT3PDin6iMIwbSVFmmR6BIiljuA=;
 b=CkMg9bz/Kr0Ej6A8fQdJH3CAVDZ6zE8zMKT+o3ZwzPzkWcPtSrSXLYnfhu4rbWLd89
 TFWwHUgRIZb9IqYiB/XRHsMDeqLKFiw+i24FWolm6rwfZHXonHq6/j/9cAvbLp36NtfK
 5n61ToUw4/qjjjtA4NmC2QLmA+F7pGhyjTx00OgK35gjUJga5SGKeYVlgY5Tj+4j5jgW
 emq1SumcNgGH3siln20XBlKP9T24XAYpAxmfgBqQXdOc+96/NFJvkDigyFbNWtpIR95L
 OM0sbHUkdkr1j7wvbbb8+KAQUTMkjiQcN0jL3duQ324vO5g7JPcb6NUMfdAtKg3eiGct
 h5vQ==
X-Gm-Message-State: AO0yUKXsQbp97jEiP+PKa+VPtTAqajfyfEm9YLOt/8cXUuXoX9FL+otg
 J35iGWCPcizscWw7S4eo/h3puBCUuLOa9TQ7FiI=
X-Google-Smtp-Source: AK7set9kdNN8xuZidorh83n2kCP89qXIR+LVHsKJllcQxW5+lxQDsTXjUyTvqj2dIFZYJLX3dbAsPA==
X-Received: by 2002:a4a:1182:0:b0:525:3726:918f with SMTP id
 124-20020a4a1182000000b005253726918fmr1218947ooc.0.1678395296895; 
 Thu, 09 Mar 2023 12:54:56 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a056870a60500b0017197629658sm149244oam.56.2023.03.09.12.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:54:56 -0800 (PST)
Message-ID: <535a8eed-4842-1dad-f56c-1b491bc3d970@ventanamicro.com>
Date: Thu, 9 Mar 2023 17:54:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] target/riscv: Simplify getting RISCVCPU pointer from
 env
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
 <20230309071329.45932-3-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230309071329.45932-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 09 Mar 2023 20:55:00 -0000



On 3/9/23 04:13, Weiwei Li wrote:
> Use env_archcpu() to get RISCVCPU pointer from env directly.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/pmu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index b8e56d2b7b..a200741083 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -223,7 +223,7 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
>           return true;
>       }
>   
> -    cpu = RISCV_CPU(env_cpu(env));
> +    cpu = env_archcpu(env);
>       if (!cpu->pmu_event_ctr_map) {
>           return false;
>       }
> @@ -249,7 +249,7 @@ bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ctr)
>           return true;
>       }
>   
> -    cpu = RISCV_CPU(env_cpu(env));
> +    cpu = env_archcpu(env);
>       if (!cpu->pmu_event_ctr_map) {
>           return false;
>       }
> @@ -289,7 +289,7 @@ int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
>                                  uint32_t ctr_idx)
>   {
>       uint32_t event_idx;
> -    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
> +    RISCVCPU *cpu = env_archcpu(env);
>   
>       if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->pmu_event_ctr_map) {
>           return -1;
> @@ -390,7 +390,7 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t ctr_idx)
>   {
>       uint64_t overflow_delta, overflow_at;
>       int64_t overflow_ns, overflow_left = 0;
> -    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
> +    RISCVCPU *cpu = env_archcpu(env);
>       PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
>   
>       if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->cfg.ext_sscofpmf) {

