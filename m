Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXnHf-0005Tv-52
	for mharc-qemu-riscv@gnu.org; Wed, 28 Oct 2020 11:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXnHa-0005RF-39
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2020 11:22:39 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:34367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXnHX-0006og-H2
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2020 11:22:37 -0400
Received: by mail-pl1-x641.google.com with SMTP id r3so2638581plo.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2020 08:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tRIDLUSNGtzNRczBIMOLPFujWfWDdVx3YveTpcJNWtM=;
 b=k7O0G0RA7AqV94Hsj0RGZLrOkr4At7CjF9r+g92yXDlTNkZluUfKrfF4vWRldNlQi3
 sxmUEko6X5/RmhnTIisgswF1j0ipRPg7KRt+2DFeTxytUJX/8c1T0X+i2vMFaYcJ/yvE
 Wz76NwcHMse+23GTsnaQk13iprrN/9wBmvtoQaFd8JBN+VFbeUnfVCyw/XKxMvagFPY2
 jsR+RzjPIspsvN4ULsDJOEMX3V0MPCxbRfewvlkqBR8xMCMbXV7EPLzXLVQ2/dtWNsvU
 Z8P7eO4v/77KU5VHHxanWkv8Rvinjk8Dw2FzNm3eF7kB4R9UqPxEIiogx6Zr85w73btB
 58Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tRIDLUSNGtzNRczBIMOLPFujWfWDdVx3YveTpcJNWtM=;
 b=VrONslhO/Cqity7PnqQ8tBwiMiGYHNbY1OvOXofSdylaax5Aob8ibQjgr4E548S8Vq
 g2uaEqAJMs8tOqmissiIwuq0Mqimd8aY8fO8NJBWFZc46zYXWcJypQ51ynYnIPkoy3C1
 L7SeLqJAy/OkS2JMOykc5E0jyEpyd+irKqyLyRWkqEGLiuik7FvJLYPweJn+r8+9T+xP
 pxGKkxzcAXuBdctuYxKmQ7pV8vHJPtuzg1DJQ+RwxlUs9ZKYaVrtQWOFwvClVtE0UGiJ
 l7sp1jPhMI7pQb4xPxgZTJy/jVtQmmVrtTEWrQxiFQW4MIu2t2zmtN7G0BMYLSrwCSZT
 2G2A==
X-Gm-Message-State: AOAM530XimkF9stGIl1ybYJKieJDvqZFMbeg+0E/sB8LHGExugZ2tR3S
 U7lFABrhjGFvl1lmDQDBr37ymw==
X-Google-Smtp-Source: ABdhPJyO5/l8nv6NTA272Ev3cLxUsAufqrjF4MeoWRLMNOYgOaaQ3xxwcA2UDEPGzlhtKajVNXCbKw==
X-Received: by 2002:a17:90a:4684:: with SMTP id
 z4mr7132020pjf.97.1603898552258; 
 Wed, 28 Oct 2020 08:22:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f4sm6263037pfc.63.2020.10.28.08.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 08:22:31 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] target/riscv: Split the Hypervisor execute load
 helpers
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1603896075.git.alistair.francis@wdc.com>
 <a88d9bdcebe49ada0d0a69b37ac532124971c91c.1603896076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <66b758d2-395f-142c-aa66-ba197c926364@linaro.org>
Date: Wed, 28 Oct 2020 08:22:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a88d9bdcebe49ada0d0a69b37ac532124971c91c.1603896076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.921,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2020 15:22:39 -0000

On 10/28/20 7:42 AM, Alistair Francis wrote:
> +target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
>  {
>      if (env->priv == PRV_M ||
>          (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
>          (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
>              get_field(env->hstatus, HSTATUS_HU))) {
> +        int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +
> +        return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
> +    }
> +
> +    if (riscv_cpu_virt_enabled(env)) {
> +        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
> +    } else {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    }
> +    return 0;
> +}
> +
> +target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
> +{
> +    if (env->priv == PRV_M ||
> +        (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
> +        (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
> +            get_field(env->hstatus, HSTATUS_HU))) {
> +        int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
>  
> +        return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
>      }

Do not replicate the PRV tests.

My first suggestion is to compute this into TBFLAGS and test it at translate
time, so that these functions just become the one cpu_ld* call.

But failing that, at least split out the test + exception into a common helper
function.

r~

