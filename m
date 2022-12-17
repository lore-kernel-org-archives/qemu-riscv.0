Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6bov-0004Lo-VH
	for mharc-qemu-riscv@gnu.org; Sat, 17 Dec 2022 13:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6bou-0004LI-DR
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 13:22:00 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6bos-0003BQ-IP
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 13:21:59 -0500
Received: by mail-ej1-x62a.google.com with SMTP id fc4so13017928ejc.12
 for <qemu-riscv@nongnu.org>; Sat, 17 Dec 2022 10:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hCDbeK1ydBYPvIImx9zIe08Zc6llPRZLRtqbvVac4iM=;
 b=oNV0DE5xbbWO9NIKzFZHG2B0b1Exxq6qEwBfWIjpUbLFg03WJ4Px7m+HcXzMWq6jwV
 zteVKcZEBmSrw12pxa7WjcwtDHznTWUAyT0nueXUnU7hUACRqKmrMwIZc57yFH8JCMIM
 VWMovNO7iX8cE143FCIY6czvmdjBEmJCDH+xUVRo+3LLPzYgSim0HLGhI+sxXSNPfYnX
 KS0iOCbKRAh3azxFyGmhhu2ynGEdGGrmkmrppcFzbtUy88rF7rnXn1SGfHIIyDdJQ7w8
 TRT9zWbJPwCXZPvC+BTG291LEiudJV2GZl/C4oxzHIs6O9+DhXzuavRPNA2tXLTL+tjx
 O1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hCDbeK1ydBYPvIImx9zIe08Zc6llPRZLRtqbvVac4iM=;
 b=sf2wlUlRCOZ6DFuuXL+LaJsiFxbGHFTxDoRl9Cj2djyxzKGC99ZxnWCyV/Zj2So4sF
 8vhv2/r9uzfA3Erb/6ZIJB96lksjYp4x4qeW49XslyYMVQPA5vfPCbNPx8UUwYG9Ikc3
 ECrWaKh0hckfoJ2gP4DaGIQre5u553ArpfkFb/UM0GV13tBEQWXGZirV3S3URKZIDy7Q
 n0Ra+6qnqt8Ck3k9kpxg82dsZQ370XrJMKJCUbHm0QNps+RUU/OEzcTeQWQMyX0U44tF
 t5i1dl7B8qCs9vVeF0lqeVnZJ1YLo6j6tdFkiNLt06+lLk4OQcgcB0ix5MNJxj3vLWYs
 Qr0w==
X-Gm-Message-State: ANoB5pkdeGeBJrIbmjFdgDwkc7vwLaxz/sEFPiIjZZNOqSLuo7uASg4D
 DFkM8Ht//PqlMMyqpbzVBMde+w==
X-Google-Smtp-Source: AA0mqf7sjfmofz7LtR6/Kln3IBwo2V5bIF15UFuZkXFmTE3F86kuKN/bBYg7NhHhw5yGaMrV8Oqnag==
X-Received: by 2002:a17:906:298c:b0:7c1:9eb:845b with SMTP id
 x12-20020a170906298c00b007c109eb845bmr30495391eje.16.1671301316822; 
 Sat, 17 Dec 2022 10:21:56 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a17090653d200b007c1651aeeacsm2219985ejo.181.2022.12.17.10.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 10:21:56 -0800 (PST)
Message-ID: <44ff8209-236d-cd2f-25cd-d608303ad96f@linaro.org>
Date: Sat, 17 Dec 2022 19:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v12 08/61] target/riscv: add fault-only-first unit stride
 load
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, wxy194768@alibaba-inc.com,
 wenmeng_zhang@c-sky.com, Alistair Francis <alistair.francis@wdc.com>,
 palmer@dabbelt.com, Laurent Vivier <laurent@vivier.eu>
References: <20200701152549.1218-1-zhiwei_liu@c-sky.com>
 <20200701152549.1218-9-zhiwei_liu@c-sky.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20200701152549.1218-9-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Sat, 17 Dec 2022 18:22:00 -0000

(unburying an old patch)

On 1/7/20 17:24, LIU Zhiwei wrote:
> The unit-stride fault-only-fault load instructions are used to
> vectorize loops with data-dependent exit conditions(while loops).
> These instructions execute as a regular load except that they
> will only take a trap on element 0.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/helper.h                   |  22 +++++
>   target/riscv/insn32.decode              |   7 ++
>   target/riscv/insn_trans/trans_rvv.inc.c |  73 ++++++++++++++++
>   target/riscv/vector_helper.c            | 110 ++++++++++++++++++++++++
>   4 files changed, 212 insertions(+)

> +/*
> + *** unit-stride fault-only-fisrt load instructions
> + */
> +static inline void
> +vext_ldff(void *vd, void *v0, target_ulong base,
> +          CPURISCVState *env, uint32_t desc,
> +          vext_ldst_elem_fn *ldst_elem,
> +          clear_fn *clear_elem,
> +          uint32_t esz, uint32_t msz, uintptr_t ra)
> +{
> +    void *host;
> +    uint32_t i, k, vl = 0;
> +    uint32_t mlen = vext_mlen(desc);
> +    uint32_t nf = vext_nf(desc);
> +    uint32_t vm = vext_vm(desc);
> +    uint32_t vlmax = vext_maxsz(desc) / esz;
> +    target_ulong addr, offset, remain;
> +
> +    /* probe every access*/
> +    for (i = 0; i < env->vl; i++) {
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        addr = base + nf * i * msz;
> +        if (i == 0) {
> +            probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);

Shouldn't we check page_check_range() in user-mode here?

> +        } else {
> +            /* if it triggers an exception, no need to check watchpoint */
> +            remain = nf * msz;
> +            while (remain > 0) {
> +                offset = -(addr | TARGET_PAGE_MASK);
> +                host = tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD,
> +                                         cpu_mmu_index(env, false));
> +                if (host) {
> +#ifdef CONFIG_USER_ONLY
> +                    if (page_check_range(addr, nf * msz, PAGE_READ) < 0) {
> +                        vl = i;
> +                        goto ProbeSuccess;
> +                    }
> +#else
> +                    probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
> +#endif
> +                } else {
> +                    vl = i;
> +                    goto ProbeSuccess;
> +                }
> +                if (remain <=  offset) {
> +                    break;
> +                }
> +                remain -= offset;
> +                addr += offset;
> +            }
> +        }
> +    }
> +ProbeSuccess:
> +    /* load bytes from guest memory */
> +    if (vl != 0) {
> +        env->vl = vl;
> +    }
> +    for (i = 0; i < env->vl; i++) {
> +        k = 0;
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        while (k < nf) {
> +            target_ulong addr = base + (i * nf + k) * msz;
> +            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            k++;
> +        }
> +    }
> +    /* clear tail elements */
> +    if (vl != 0) {
> +        return;
> +    }
> +    for (k = 0; k < nf; k++) {
> +        clear_elem(vd, env->vl + k * vlmax, env->vl * esz, vlmax * esz);
> +    }
> +}

