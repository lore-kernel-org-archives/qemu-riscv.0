Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVWRo-00057Q-VK
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 06:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVWRl-000574-0S
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 06:41:05 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVWRh-00035V-RA
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 06:41:04 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 l13-20020a0568301d6d00b0068f24f576c5so3630436oti.11
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 03:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8njSvKOfeUEvfJVgZZIy7Mz0tF/1dumcjdo8qLSMNdk=;
 b=eKKBoZWcXOjGyyx6lQ8FmnIrGPLQHLmbsgVSLQcZQF0n3EcuVLw7NY4nkujWZ5tX9H
 SIFQW8aG7cGt07cnBUFiHP6a9F/vbFcmUOLyMXwdsdquPWplLDP44s6L4j3V+F/ZScAg
 F5Yq6weNs0kY/ooLAV3KqNEWvZTPR5FcBZV+wc9a7XyQFWcnEzSy5BvnfLLvwczJatsu
 Dn3VPUPguZCGIedYtxqpFcJDMCmbOjIVwBVArawZ6LhVEJUnoERqHi3DOfp7Edcyu+IK
 bgjClIC7hPtu1hxKC9oejuQ6IAZ0cUFEn6TcMrmetW1nmI0P4iMCjTNi8A56cga6WYy+
 reBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8njSvKOfeUEvfJVgZZIy7Mz0tF/1dumcjdo8qLSMNdk=;
 b=CfIE/GMa3Uq/FwwH5800qdvAbgbeXllacmO5aKLNwK6icMx1cLA3AeNoEDvMAzA+cd
 HH0WZ+kncJZgoYNePxXB/lRlM6YPrfUVSjuuJGtQEvjZcJVxJV2LPhdSJmPr8tKz33+W
 gn+JDW67U9o6umLmxvkDoapEOrEMSyCgjupqsypFa9e91enBMd/F2H8VNA70+P7rlHL0
 lIaVFsfjKLRi6XCD06lb2xoH01Dim4Rlb55DUDo2G+wv82S0+YBfOxcAZ72Cv4Fm1zzk
 QqEmWvxHSkdPS5DY8Pe8KSh3YSZfNQ6JQ9GnZgUozPkuFJ0pTq77dH1dlB666vVuWjkE
 K30Q==
X-Gm-Message-State: AO0yUKU9r0U4LAL7/QLCwOctre8nZ0l3CeOq8cYb1zmXOtRu/O2AgLlv
 vjV3K1feofXlMKtS/+ngYJhbpw==
X-Google-Smtp-Source: AK7set8FjIjYvO1KS2ctycsW/BRKwc5NAYFctQcRROEx9uM1OnorzIiP6PRbYsyV++3x1ybSRLUAyw==
X-Received: by 2002:a9d:491c:0:b0:690:e7d8:48a4 with SMTP id
 e28-20020a9d491c000000b00690e7d848a4mr4812398otf.23.1677238858696; 
 Fri, 24 Feb 2023 03:40:58 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:a2b4:12ba:56fa:c61d:cd8f?
 ([2804:7f0:bcc0:a2b4:12ba:56fa:c61d:cd8f])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a9d6007000000b00690dd5e7345sm3518405otj.26.2023.02.24.03.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 03:40:58 -0800 (PST)
Message-ID: <7e78e985-8518-6ba3-7cd7-2e428a00c146@ventanamicro.com>
Date: Fri, 24 Feb 2023 08:40:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/6] target/riscv: Fix the relationship between
 menvcfg.PBMTE/STCE and Svpbmt/Sstc extensions
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230224040852.37109-1-liweiwei@iscas.ac.cn>
 <20230224040852.37109-2-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230224040852.37109-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Fri, 24 Feb 2023 11:41:05 -0000



On 2/24/23 01:08, Weiwei Li wrote:
> menvcfg.PBMTE/STCE are read-only zero if Svpbmt/Sstc are not implemented.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/csr.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fa17d7770c..feae23cab0 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1885,10 +1885,12 @@ static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
>   static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
> +    RISCVCPUConfig *cfg = &env_archcpu(env)->cfg;
>       uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
> -        mask |= MENVCFG_PBMTE | MENVCFG_STCE;
> +        mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
> +                (cfg->ext_sstc ? MENVCFG_STCE : 0);
>       }
>       env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
>   
> @@ -1905,7 +1907,9 @@ static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
>   static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
> -    uint64_t mask = MENVCFG_PBMTE | MENVCFG_STCE;
> +    RISCVCPUConfig *cfg = &env_archcpu(env)->cfg;
> +    uint64_t mask = (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
> +                    (cfg->ext_sstc ? MENVCFG_STCE : 0);
>       uint64_t valh = (uint64_t)val << 32;
>   
>       env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);

