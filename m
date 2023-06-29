Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38358EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:35:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEqrd-0003rx-1F; Thu, 29 Jun 2023 08:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEqrR-0003p9-Pg
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 08:34:58 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEqrG-0007jt-Hj
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 08:34:53 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1b06a46e1a9so552132fac.2
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688042083; x=1690634083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5eaAO9UDEBw25C1EKJKv4pXPNE79KwRl7HLgXY11MT4=;
 b=mKQ47sznbuiwIRI4Vo3QHVydhYLPV+pq/+e1moJ/k00uxdyEIInYx8NoJA9UvY47JQ
 tGVhYkTkv0EvVio231299Dgt6xdECJzcGlvnwvDv9qLtTwPZIBxLnunClEa5Whuiiho5
 uTkQry8eBlg6wMvygUREI18IesXHVXlvaRcwJZ+DFTcCbWsDP0f1QKBPIwZ90NLuvrcQ
 rzQneRKRUB3nGkfUbbbcygdJ5bBitvo6eDxGU79RgTDWjfl2NMgRG6WOedQHNZZcre0x
 152x/zQBVjhIIsVv/kSuNwCjl8tdewt2+1ZSWySmK+FQMEkYxNzTDD23J9Aal42x0G0R
 GZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688042083; x=1690634083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5eaAO9UDEBw25C1EKJKv4pXPNE79KwRl7HLgXY11MT4=;
 b=DZRdFIEzcCLW3vwHUcZzTVPDly11PGBNlbHzsji9FlEY2kXSEpqIb/8WzdhqSPHK+f
 SmseREtLWhg18FXAwoA2+zWPKYT/b1U1GjktGKNfiJ6Ju1de8TMD9vfc9f7gdbPOOQmj
 /ajUo0oUe+uuj3HlbPbvdiuikxm5stso/2qzKHeJrkzmrcUuJk8J0tBtts7Np0nUeCMG
 dkAaif2U32v4etfWX9sVAeXnToRIRCOknzJNHk+OQpOAjxyD/UtP/bZy5RhpF6IXsFnO
 gVLP3jZ2JHUSYYrw3ndpLBDkv3BURrpw3sVX4Z0+DoFt3VCEOR1DzfSnRWgwB+pKNbNA
 DeOA==
X-Gm-Message-State: AC+VfDwgIE3mGoDCFIv5og4yleSg1qfl0jQikHw2wbMAAueQJxjJM+P4
 s9y4bkiyZdhiS9PxvCkevARgxQ==
X-Google-Smtp-Source: ACHHUZ5qUwHnGYQs1hJSmBgWjEyIZXW3Y/zPubqE/JCmM1huqlRoFPHrmgbg4eyvzMTPkH+7boxTqA==
X-Received: by 2002:a05:6870:8602:b0:1b0:9b9:60a9 with SMTP id
 h2-20020a056870860200b001b009b960a9mr10671937oal.1.1688042083005; 
 Thu, 29 Jun 2023 05:34:43 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 w18-20020a056870a2d200b001aa1779d0besm7581043oak.7.2023.06.29.05.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 05:34:42 -0700 (PDT)
Message-ID: <317de214-2fb9-ca55-d3f0-b630a13c1933@ventanamicro.com>
Date: Thu, 29 Jun 2023 09:34:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 1/1] target/riscv: Add RVV registers to log
Content-Language: en-US
To: Ivan Klokov <ivan.klokov@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com, 
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230629083730.386604-1-ivan.klokov@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230629083730.386604-1-ivan.klokov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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



On 6/29/23 05:37, Ivan Klokov wrote:
> Print RvV extension register to log if VPU option is enabled.
> 
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> ---
> v5:
>     - Fix typo, move macros out of function, direct access to cfg.vlen field.
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 57 +++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 881bddf393..ff29573b1f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -55,6 +55,17 @@ struct isa_ext_data {
>   #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
>       {#_name, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
>   
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
> +
>   /*
>    * Here are the ordering rules of extension naming defined by RISC-V
>    * specification :
> @@ -183,6 +194,14 @@ const char * const riscv_fpr_regnames[] = {
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
> @@ -608,7 +627,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
> -    int i;
> +    int i, j;
> +    uint8_t *p;
>   
>   #if !defined(CONFIG_USER_ONLY)
>       if (riscv_has_ext(env, RVH)) {
> @@ -692,6 +712,41 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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
> +        uint16_t vlenb = cpu->cfg.vlen >> 3;
> +
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

