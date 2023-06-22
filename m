Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D230EB64DA
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 21:14:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCRcu-0003V9-6m; Thu, 22 Jun 2023 17:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCRct-0003Uf-9O
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 17:13:59 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCRcr-000281-HN
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 17:13:59 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-560b7ac3cbfso1571202eaf.2
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 14:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687468436; x=1690060436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c4TDafqpMHFVbuljEp1uX/vWutMx05bNcCMYKHoMSRQ=;
 b=oq6Y//F3mPgCAkBwOqJf6WE+JNqfw64ZD2uPPxVOHcjyTmMNLdhDs3DKS2ZbFc3dKL
 BeFmnVzvP5ePIB5IeoTRCGeufKFuNwSk1S1BQQn5UXZZ4Aw80+j19T4XWOqP+6sbfkKx
 7kvlbSjiiZw2vStnvyT3PtsepZZvssOQVq2mswweRIaD3Q199nasWgTWr7gg9HzNzcdp
 t/ykCF2SvxKYsJ8sP/pgEjQmy4WSFHYjnVw4OIUJv2UNMHD/kDgg3sQHD3vhAb5Q/+nO
 0TuPq68o45KifPpPfd3YzMyCPXIIj18Whj9GNBXzvU49b2tE8kmVs7InCrlfzy+zYwaz
 +rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687468436; x=1690060436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c4TDafqpMHFVbuljEp1uX/vWutMx05bNcCMYKHoMSRQ=;
 b=FCumtoqm1Z6/9CXk+mmhIW6Q7XoGhJuDWlzwBfsfQYtUhCE3XV9DIABhDo2PK4tSg0
 BeNBXuvEWRlG6/05AwRUrZmHdZXrH8pi/m21hgVPpI6/AObFJ39T7cG0fMcHT+0TV8EF
 iLwN//RsTBN9XpGe/ujxVgPFoq3Nx9VCgnCwirC29xCwLx+ys0jSjoHBj//0CaFh1AAS
 PZWngrogzET5XEnmO/50uQ0cMzCOFo8JQ7yiDBF1v8lB99uxVEieLyKdqt9GqnxLUq+w
 cguC4BbY0IvpW8tjDcebf+Qo9DCG2N28WSR+1IZrJ2/cEj4BBtwP/y1ziZrK0CF8OoI2
 K2hg==
X-Gm-Message-State: AC+VfDzGdkxUbJFr/SKHPsHNv8tdzLCA9qpcruHCAigCn59wiF+u17eH
 rNnW7xZdb9COgDUal7X9JzXIow==
X-Google-Smtp-Source: ACHHUZ5eOsZb0U1t14Bjg7S/h3TuYJDSbnVD5TYj3okLk0g3OFRZTwivYsZwpzWVm4sGiQcDEEcHog==
X-Received: by 2002:a4a:d9c3:0:b0:55e:541b:c6a2 with SMTP id
 l3-20020a4ad9c3000000b0055e541bc6a2mr10304104oou.3.1687468436206; 
 Thu, 22 Jun 2023 14:13:56 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 d14-20020a4aba8e000000b0055ec0ac448csm3119251oop.38.2023.06.22.14.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 14:13:55 -0700 (PDT)
Message-ID: <33ead5e5-ac4f-12b7-c7e4-1777b8b7e5e7@ventanamicro.com>
Date: Thu, 22 Jun 2023 18:13:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/1] target/riscv: Add RVV registers to log
Content-Language: en-US
To: Ivan Klokov <ivan.klokov@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com, 
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230622094346.29853-1-ivan.klokov@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230622094346.29853-1-ivan.klokov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 6/22/23 06:43, Ivan Klokov wrote:
> Print RvV extesion register to log if VPU option is enabled.

Typo: extesion -> extension

> 
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> ---
> v4:
>     - General part of patch has been merged, rebase riscv part and resend.
> ---
>   target/riscv/cpu.c | 56 +++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fb8458bf74..b23f3fde0d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -183,6 +183,14 @@ const char * const riscv_fpr_regnames[] = {
>       "f30/ft10", "f31/ft11"
>   };
>   
> +const char * const riscv_rvv_regnames[] = {
> +  "v0",  "v1",  "v2",  "v3",  "v4",  "v5",  "v6",
> +  "v7",  "v8",  "v9",  "v10", "v11", "v12", "v13",
> +  "v14", "v15", "v16", "v17", "v18", "v19", "v20",
> +  "v21", "v22", "v23", "v24", "v25", "v26", "v27",
> +  "v28", "v29", "v30", "v31"
> +};
> +
>   static const char * const riscv_excp_names[] = {
>       "misaligned_fetch",
>       "fault_fetch",
> @@ -611,7 +619,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
> -    int i;
> +    int i, j;
> +    uint8_t *p;
>   
>   #if !defined(CONFIG_USER_ONLY)
>       if (riscv_has_ext(env, RVH)) {
> @@ -695,6 +704,51 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>               }
>           }
>       }
> +    if (riscv_has_ext(env, RVV) && (flags & CPU_DUMP_VPU)) {
> +        static const int dump_rvv_csrs[] = {
> +                    CSR_VSTART,
> +                    CSR_VXSAT,
> +                    CSR_VXRM,
> +                    CSR_VCSR,
> +                    CSR_VL,
> +                    CSR_VTYPE,
> +                    CSR_VLENB,
> +                };
> +        for (int i = 0; i < ARRAY_SIZE(dump_rvv_csrs); ++i) {
> +            int csrno = dump_rvv_csrs[i];
> +            target_ulong val = 0;
> +            RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
> +
> +            /*
> +             * Rely on the smode, hmode, etc, predicates within csr.c
> +             * to do the filtering of the registers that are present.
> +             */
> +            if (res == RISCV_EXCP_NONE) {
> +                qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
> +                             csr_ops[csrno].name, val);
> +            }
> +        }
> +        uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;

We have a "RISCVCPU *cpu" pointer available at the start of the function. Use
that to access the cfg obj and avoid an unneeded env_archcpu() call:

> +        uint16_t vlenb = cpu->cfg.vlen >> 3;


> +
> +/*
> + * From vector_helper.c
> + * Note that vector data is stored in host-endian 64-bit chunks,
> + * so addressing bytes needs a host-endian fixup.
> + */
> +#if HOST_BIG_ENDIAN
> +#define BYTE(x)   ((x) ^ 7)
> +#else
> +#define BYTE(x)   (x)
> +#endif

Usually we don't declare new macros in the middle of functions. I suggest
moving this #define block to outside of riscv_cpu_dump_state() to keep the
code more line with the current code style we use. Thanks,


Daniel


> +        for (i = 0; i < 32; i++) {
> +            qemu_fprintf(f, " %-8s ", riscv_rvv_regnames[i]);
> +            p = (uint8_t *)env->vreg;
> +            for (j = vlenb - 1 ; j >= 0; j--) {
> +                qemu_fprintf(f, "%02x", *(p + i * vlenb + BYTE(j)));
> +            }
> +            qemu_fprintf(f, "\n");
> +        }
> +    }
>   }
>   
>   static void riscv_cpu_set_pc(CPUState *cs, vaddr value)

