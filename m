Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTQwY-0005qX-2e
	for mharc-qemu-riscv@gnu.org; Mon, 05 Apr 2021 11:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQwQ-0005oc-JV
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 11:15:04 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQwN-0000VS-Pv
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 11:15:02 -0400
Received: by mail-pl1-x62f.google.com with SMTP id d8so5804422plh.11
 for <qemu-riscv@nongnu.org>; Mon, 05 Apr 2021 08:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5S8sJ3awaoB1kK8QVfv6OAG4ACV/oCzI6SBf2A8Ddms=;
 b=L3mNvCRoqJTCPISV+aT1fx7iULgLAgDBV9xUqgPmEOe7ltYulPXx9Pcx4ieZi6zlmF
 X7CjNANnCb+jVpEkTTr8QgaA76YWjeHTrsOKzbqNFzX5xDpqH+BPL7F1Tw0yxyOECiA2
 lIiVoahSOhH4pRswL4i0FvK18bV9MMjhCujOrbJWOVTkZV/euxuZ6EF76wmIO5aFD73J
 5GxCmxMMu5bIdIsToDdp4GvQJUmNBh5sRns46POyqiUpKfpiIS5whB+o7XlxIZSBW76H
 M+UYcQBgFBbjzD0piAH/qLTeIJyTmbs3trkUldYMxEoEwFLaInstE7YB+1ZqWtkkqXEs
 gzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5S8sJ3awaoB1kK8QVfv6OAG4ACV/oCzI6SBf2A8Ddms=;
 b=mLUwoNJvlUZX/0RjCTnQhKxAWv4auAtrtuQDLsam1pjt3RopWF95Fn2XGtrWBqzz0m
 e/c8bE7EEHln7L+ojFejRNREPCeIj4jEGZg3BZxbfZS68KHaa4FGfgywsECxDPeLQzJN
 qGEuV3hQVvd3e8sw+ummjlZFyiPX2BU6mbFfHWgJ0YUtbRNmdM7a8HB+qa5HPovvVp7Y
 +II3IH2vh4N/xZRgW/IrO6/zjBw95Ld+EUShFUeuHs3T0dyHgv201PbEwTKf7HL4IPUC
 auFybkXrwll9rPAhnnkdXZpv4wXAH9DnPgJc9klzHr1ePeBB4o7o+oRjxLLt7t3x62Ti
 RmvA==
X-Gm-Message-State: AOAM531jckKedoJc60nmB8T7MJpdnwWS+7jAo2PrUwqW7HtsaRM3qdAZ
 MVkNjy3Mzoc3rdO4xDxHgEBCDQ==
X-Google-Smtp-Source: ABdhPJwpVktkWjUQJ3c/0p7UQght5xIWp42F2S7wna/2cYiJp/oyTk7wN0M70x5E9jN3T8IyvkLsPA==
X-Received: by 2002:a17:902:8693:b029:e8:fdd4:361c with SMTP id
 g19-20020a1709028693b02900e8fdd4361cmr6610676plo.32.1617635698143; 
 Mon, 05 Apr 2021 08:14:58 -0700 (PDT)
Received: from [192.168.73.67] (50-200-230-211-static.hfc.comcastbusiness.net.
 [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id a8sm16515790pfk.138.2021.04.05.08.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 08:14:57 -0700 (PDT)
Subject: Re: [PATCH v1 5/8] target/riscv: Remove the hardcoded SATP_MODE macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <c2a0653687bea5e932747e301112ea0507169385.1617393702.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c99b14f5-081c-70e7-1c13-377087f7bfaa@linaro.org>
Date: Mon, 5 Apr 2021 08:14:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c2a0653687bea5e932747e301112ea0507169385.1617393702.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 05 Apr 2021 15:15:04 -0000

On 4/2/21 1:02 PM, Alistair Francis wrote:
> @@ -622,9 +632,15 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>       CPUState *cs = env_cpu(env);
>       int page_fault_exceptions;
>       if (first_stage) {
> -        page_fault_exceptions =
> -            get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
> -            !pmp_violation;
> +        if (riscv_cpu_is_32bit(env)) {
> +            page_fault_exceptions =
> +                get_field(env->satp, SATP32_MODE) != VM_1_10_MBARE &&
> +                !pmp_violation;
> +        } else {
> +            page_fault_exceptions =
> +                get_field(env->satp, SATP64_MODE) != VM_1_10_MBARE &&
> +                !pmp_violation;
> +        }

Similar commentary wrt HGATP_MODE.

>       } else {
>           if (riscv_cpu_is_32bit(env)) {
>               page_fault_exceptions =
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6052b2d6e9..b0ebaa029e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -930,16 +930,31 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
>       if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
>           return 0;
>       }
> -    if (validate_vm(env, get_field(val, SATP_MODE)) &&
> -        ((val ^ env->satp) & (SATP_MODE | SATP_ASID | SATP_PPN)))
> -    {
> -        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
> -            return -RISCV_EXCP_ILLEGAL_INST;
> -        } else {
> -            if ((val ^ env->satp) & SATP_ASID) {
> -                tlb_flush(env_cpu(env));
> +    if (riscv_cpu_is_32bit(env)) {
> +        if (validate_vm(env, get_field(val, SATP32_MODE)) &&
> +            ((val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN)))
> +        {
> +            if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
> +                return -RISCV_EXCP_ILLEGAL_INST;
> +            } else {
> +                if ((val ^ env->satp) & SATP32_ASID) {
> +                    tlb_flush(env_cpu(env));
> +                }
> +                env->satp = val;
> +            }
> +        }

I think you really don't want to be duplicating this code.
Just select the constants into local variables.


r~

