Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVWVH-0007PD-Kx
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 06:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVWVE-0007MM-Kh
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 06:44:40 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVWVC-0003jo-FZ
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 06:44:40 -0500
Received: by mail-oi1-x234.google.com with SMTP id bk2so14757657oib.10
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 03:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQ+/6c9TigHhV8OLVAat+yHZmBQ8yT8EV6RG/ZtIhHY=;
 b=Nu6evUN0HvgKg+UIPAuctVoSC94W6qTA2vpOcDTEUfA7A3BVFP8WLBE73QPRoHd5Gc
 8WUjh53Do2gadKYlKEwRL4M5HeGiAtAumBc7a0hg8W8FRkSIs+Qn7juYxpRsAtT2RD3t
 Uvez1egDbNjaH6vn7fwYn/qVctc6EtiwfuHGB2nNK7EuWiGjEAiGzSyl2As5j3WvFYhU
 HrDYMskIXQCa+Qt5E3hwgUHMgEgFg+AwmA/aKTrAWvAUVKIqdL3SBZhhgux0WBSVAooc
 z3JHvHRYUouRSv8rEqSX93bQuqNC1ev0xXQ9z62Tkhtt21Wik4ZVtMlM2RQ3ftXQ4NZZ
 nb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQ+/6c9TigHhV8OLVAat+yHZmBQ8yT8EV6RG/ZtIhHY=;
 b=yTj0bsQ9RB7yr597ItevseRogH/pKdObT5clincThJg4rRplBUl9xLeS8kbAhGyVRK
 qRcTqtAc6FKSquiJ9y17/Aev5fD6l6OmYv4PgBs3OulOCqjSyGN7+Ke85Ae3ILP+tgSv
 ioc5TW1bjkTJuzu4doPboyG7WyuEAx2Sxo4ruF/fYGN9WlKcF/vrRsoVEkKJc1R7HO1Z
 IdN/HL/Ii6U4n7AGuWrTgAapbs5S3VDaoQSswcvCRmEq5rW2gNU/S9TB/uMRFI/IHaUz
 4il8n/FVWzyIF4iT9IcEsGVMJ7uFvW/9nkhxTx5eZg5N7Gw3spFHDvttKmo3tc3EKUY8
 oGUg==
X-Gm-Message-State: AO0yUKX9Sy+mUWV5iC+Xt6J0VOy6sHw8pslhjaqUMb9Xw0gJD8XyNKdf
 awCWsPczJVvM4KrTRIHjri6D7g==
X-Google-Smtp-Source: AK7set+OPvf4a2QRWJWc9jA1870oa8MS5Ss4SBIktfQrooGQufpnVCt/VFi2zBUEdbfriXE5YFmC4Q==
X-Received: by 2002:a05:6808:8e2:b0:378:90dd:b6a with SMTP id
 d2-20020a05680808e200b0037890dd0b6amr2744533oic.39.1677239077262; 
 Fri, 24 Feb 2023 03:44:37 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:a2b4:12ba:56fa:c61d:cd8f?
 ([2804:7f0:bcc0:a2b4:12ba:56fa:c61d:cd8f])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a9d7093000000b0068663820588sm4401205otj.44.2023.02.24.03.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 03:44:36 -0800 (PST)
Message-ID: <a54a31d7-a85c-57eb-5d0b-d85e59348be3@ventanamicro.com>
Date: Fri, 24 Feb 2023 08:44:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/6] target/riscv: Fix the relationship of PBMTE/STCE
 fields between menvcfg and henvcfg
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230224040852.37109-1-liweiwei@iscas.ac.cn>
 <20230224040852.37109-3-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230224040852.37109-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Fri, 24 Feb 2023 11:44:40 -0000



On 2/24/23 01:08, Weiwei Li wrote:
> henvcfg.PBMTE/STCE are read-only zero if menvcfg.PBMTE/STCE are zero.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/csr.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index feae23cab0..02cb2c2bb7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1956,7 +1956,11 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>           return ret;
>       }
>   
> -    *val = env->henvcfg;
> +    /*
> +     * henvcfg.pbmte is read_only 0 when menvcfg.pbmte = 0
> +     * henvcfg.stce is read_only 0 when menvcfg.stce = 0
> +     */
> +    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) | env->menvcfg);
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -1972,7 +1976,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>       }
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
> -        mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> +        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
>       }
>   
>       env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
> @@ -1990,14 +1994,15 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>           return ret;
>       }
>   
> -    *val = env->henvcfg >> 32;
> +    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) |
> +                            env->menvcfg)) >> 32;
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
> -    uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
> +    uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
>       uint64_t valh = (uint64_t)val << 32;
>       RISCVException ret;
>   

