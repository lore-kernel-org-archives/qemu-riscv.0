Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZzhs-0004qa-UM
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 14:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pZzhr-0004qJ-J1
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 14:44:11 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pZzhp-0000Ji-W3
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 14:44:11 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 p13-20020a9d744d000000b0069438f0db7eso9616241otk.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 11:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678304648;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Va8WlO+A1D+uCK+sXUAuGdfKcLA2q71EZisg6zxJxwE=;
 b=KumMekCoJ8b5+GNCIGc1s2rQmGzjzN9fGBK8c1MurUhwXe5wFPTV7t2soL9Ve0u5qs
 w086ILNDWyW76JQh4u4ZhAW8O0C7WWvPEPiSJRIksfgy1bucKTFh1SK0x53IYSgyBW53
 NeUWRXGLGcyHOrbGKRBnC1yBCW7095C9YwWatLYNf+R+KY7bjz+/rcSbLzlptx75kzhT
 kOFIiAWnVLXVIFJbUCoR0AA8xMzN5caa6hjyRnSZPta4mn4r29q4R5Eh/JMIEOTwOMAd
 pjojfkWXvExzUVcg2mrGH0ni7wsiLSh9C9lwK/UyjXOz1QMXkqjRRIyCnF8mUauip8vI
 i6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678304648;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Va8WlO+A1D+uCK+sXUAuGdfKcLA2q71EZisg6zxJxwE=;
 b=C6K/d1ffFPTssTXsws5p4JKvfK5IxlK98IabGO2e2lydrKwlR2KjFKOtD4rvnld5r3
 0pF1UVWgKzMk0+gvrNU0p2zKQ+PPM7l1RHocDzYeuZ4ivyn2l5oYFW3s5cBX+2TAOoPT
 5HSYE974KuZRNZNuRWy+fhn7XafSjKbbkPWaegdCHNYN1l0cynYSibZhLhZlea8n5ZU3
 r5lWXqpjPOgc1tRHq+XauG2Aoa619083btuCdgi0ucVcHN33u/iQYpA9d7tpPSJ29U7u
 yx8TlqFTWmFvOxb50bWduPl562YREN0hnjvSkFTAZ/WaikiEeDO1BpBA/4RYbZEvx/Io
 0qiA==
X-Gm-Message-State: AO0yUKUzGJMn8HxjBubFu1m6xDuEXy7riHKhGVstaXO0dn5ofcLxRrDu
 U5eHeQ3c6iihUOoGEQZ3wsUqag==
X-Google-Smtp-Source: AK7set+aJt3cLv8wSYaPgJz6wUOL/wGTpYxVE6zTG47ie261N0ROfZ4slfaICr3sjww8gY4DSJhAdw==
X-Received: by 2002:a9d:3c6:0:b0:68b:dacf:a530 with SMTP id
 f64-20020a9d03c6000000b0068bdacfa530mr9186940otf.15.1678304648362; 
 Wed, 08 Mar 2023 11:44:08 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a9d71d2000000b0068bd9a6d644sm6946840otj.23.2023.03.08.11.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 11:44:07 -0800 (PST)
Message-ID: <adbe0c52-61f0-2779-c32f-a75bf0a303e1@ventanamicro.com>
Date: Wed, 8 Mar 2023 16:44:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/riscv/csr.c: fix H extension TVM trap
Content-Language: en-US
To: chenyi2000@zju.edu.cn, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230308123417.12555-1-chenyi2000@zju.edu.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230308123417.12555-1-chenyi2000@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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
X-List-Received-Date: Wed, 08 Mar 2023 19:44:11 -0000



On 3/8/23 09:34, chenyi2000@zju.edu.cn wrote:
> From: Yi Chen <chenyi2000@zju.edu.cn>
> 
> Trap accesses to hgatp if MSTATUS_TVM is enabled.
> Don't trap accesses to vsatp even if MSTATUS_TVM is enabled.
> 
> Signed-off-by: Yi Chen <chenyi2000@zju.edu.cn>
> ---
>   target/riscv/csr.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ab56663..09bc780 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2655,7 +2655,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
>           return RISCV_EXCP_NONE;
>       }
>   
> -    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
> +    if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) && get_field(env->mstatus, MSTATUS_TVM)) {

The commit message mentions 'vsatp' but this patch is changing satp callbacks.

Any reason to not change read_vsatp() and write_vsatp() instead?


>           return RISCV_EXCP_ILLEGAL_INST;
>       } else {
>           *val = env->satp;
> @@ -2683,7 +2683,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
>       }
>   
>       if (vm && mask) {
> -        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
> +        if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) && get_field(env->mstatus, MSTATUS_TVM)) {
>               return RISCV_EXCP_ILLEGAL_INST;
>           } else {
>               /*
> @@ -3047,14 +3047,24 @@ static RISCVException read_hgeip(CPURISCVState *env, int csrno,
>   static RISCVException read_hgatp(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
> -    *val = env->hgatp;
> +    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
> +        return RISCV_EXCP_ILLEGAL_INST;

The end of the first paragraph of ISA 8.2.10 goes as follows:

====
When mstatus.TVM=1, attempts to read or write hgatp while executing
in HS-mode will raise an illegal instruction exception.
====

I believe you need to check for HS-mode, not just PRV_S. riscv_csrrw_check() in
target/riscv/csr.c checks for HS-mode as follows:

     if (riscv_has_ext(env, RVH) && env->priv == PRV_S &&
         !riscv_cpu_virt_enabled(env)) {

Same goes for write_hgatp() below.

> +    } else {
> +        *val = env->hgatp;
> +    }
> +

You can discard the 'else' since you're doing a return in the if:

if (...) {
     return RISCV_EXCP_ILLEGAL_INST;
}

*val = env->hgatp;


>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException write_hgatp(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
> -    env->hgatp = val;
> +    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    } else {
> +        env->hgatp = val;
> +    }

No need for else here either:

if (...) {
     return RISCV_EXCP_ILLEGAL_INST;
}

env->hgatp = val;



Thanks,


Daniel

> +
>       return RISCV_EXCP_NONE;
>   }
>   

