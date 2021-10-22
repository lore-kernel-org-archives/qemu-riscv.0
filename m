Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdi6b-0008NA-Nk
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 20:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdi6a-0008MH-1I
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 20:08:16 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdi6X-0004o4-Lj
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 20:08:15 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o4-20020a17090a3d4400b001a1c8344c3fso2288699pjf.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 17:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7bFlb+HbD52ccYl/eUKJkAOSKMiF+Z1E61pMYEhyxoQ=;
 b=PbD0A8d7RNaPCdG7lkQ4jqOs8CDd2cy6YEwDgg2+4vxTR9hVzKeEvpZe/vF0o6FVJO
 ucgtRXu9w1wTtd3NZlW41YUtfOyT0ey5kVry0rw8XiR/Ami267In5rSCIMoVvHF3PB7p
 jH6TYJ8bgE2k4yXuyqzqivqxEsYxtIw4MFrXQI4Tc/vmPmTPdDE3sA30r+muOXHG30uE
 2wNh3Igw84YV4OiMOE1YHu/B6Kc1XlLVQqfrGtcD4KhBCKgz1sgDd+SWs/r0dHogzEOk
 LLoDwENp38UhZhskpEFbBNzMEfDWg0stwNe4CT4BKNi2ZqvCh3kybK4Hhd4fISZaFcHJ
 Cuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7bFlb+HbD52ccYl/eUKJkAOSKMiF+Z1E61pMYEhyxoQ=;
 b=Y5Zp+OgV31fyEmJmyRMBlnCuM/PioKUkNQYqeQutC5MuAChAeaxp6SsAOLpBOSDpjj
 /uy4ZnyixUUDHb+KdJKlJSKxaH8F3YVkgZkXO5DnSBf5skWDUgmxQr5xsEIrDOWoY17E
 qdxLXlb9Y44Y7BnplOwwH/6GWbP7k/yK5klQjzaMMosJp4XHAUZtefKKC1JD0q9LSXpa
 brYtK5y/iTSxurUyvrlGRBMrFGSLzTQva6hqFY99B5iyi3aa60GEIfBeimMYTPDAAgJ/
 hiLA9bjGJJ7X5ipjzaPXy+6SViOWUyuIHy5mp4vlUyCP9Hr5MTRbtE1zUZ1vBVz8i5mK
 YFxQ==
X-Gm-Message-State: AOAM533IcVVNwQ62yiH8EXPDJeps+Jggl1qD3+sGVLithxeF71n/cfJQ
 +7RN+/SNvv/zRbRytDh8itEmDFyqvLv5Eg==
X-Google-Smtp-Source: ABdhPJzqhYSW96v5FKS5UY/DkdWyKLwgk1xPFheFK5reAi+tqyz9+wZyPma/yEggeDuaqSuN8kOGkw==
X-Received: by 2002:a17:90b:ecc:: with SMTP id
 gz12mr10486245pjb.241.1634861291781; 
 Thu, 21 Oct 2021 17:08:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q9sm7696373pfj.88.2021.10.21.17.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 17:08:11 -0700 (PDT)
Subject: Re: [RFC PATCH v5 2/3] riscv: Introduce custom CSR hooks to
 riscv_csrrw()
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>, alistair23@gmail.com,
 wangjunqiang@iscas.ac.cn, bmeng.cn@gmail.com
Cc: ycliang@andestech.com, alankao@andestech.com, dylan@andestech.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211021150921.721630-1-ruinland@andestech.com>
 <20211021150921.721630-3-ruinland@andestech.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cdafb564-6ed8-c951-9381-3a90175abdde@linaro.org>
Date: Thu, 21 Oct 2021 17:08:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021150921.721630-3-ruinland@andestech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Oct 2021 00:08:16 -0000

On 10/21/21 8:09 AM, Ruinland Chuan-Tzu Tsai wrote:
> riscv_csrrw() will be called by CSR handling helpers, which is the
> most suitable place for checking wheter a custom CSR is being accessed.
> 
> If we're touching a custom CSR, invoke the registered handlers.
> 
> Signed-off-by: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
> ---
>   target/riscv/cpu.c             | 19 +++++++++++++++++
>   target/riscv/cpu.h             | 13 +++++++++++-
>   target/riscv/csr.c             | 38 +++++++++++++++++++++++++++-------
>   target/riscv/custom_csr_defs.h |  7 +++++++
>   4 files changed, 68 insertions(+), 9 deletions(-)
>   create mode 100644 target/riscv/custom_csr_defs.h
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0c93b7edd7..a72fd32f01 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,9 @@
>   
>   static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>   
> +GHashTable *custom_csr_map = NULL;

Leftover from a previous revision?

> +#include "custom_csr_defs.h"

I think that the few declarations that are required can just go in internals.h.

> +
>   const char * const riscv_int_regnames[] = {
>     "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
>     "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
> @@ -149,6 +152,22 @@ static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
>   #endif
>   }
>   
> +static void setup_custom_csr(CPURISCVState *env,
> +                             riscv_custom_csr_operations csr_map_struct[])

Why is this static?  Surely it needs to be called from csr_andes.c, etc?
Oh, I see that in the next patch you call this directly from ax25_cpu_init.

I think the split of declarations is less than ideal.  See below.

> +{
> +    int i;
> +    env->custom_csr_map = g_hash_table_new(g_direct_hash, g_direct_equal);
> +    for (i = 0; i < MAX_CUSTOM_CSR_NUM; i++) {

Having a hard maximum seems a mistake.  You should pass in the array size...

> +        if (csr_map_struct[i].csrno != 0) {
> +            g_hash_table_insert(env->custom_csr_map,
> +                GINT_TO_POINTER(csr_map_struct[i].csrno),
> +                &csr_map_struct[i].csr_opset);
> +        } else {
> +            break;
> +        }

... which would also allow you to remove the terminator in the data, and the check here.

> @@ -245,6 +245,11 @@ struct CPURISCVState {
>   
>       /* Fields from here on are preserved across CPU reset. */
>       QEMUTimer *timer; /* Internal timer */
> +
> +    /* Custom CSR opset table per hart */
> +    GHashTable *custom_csr_map;

I think placing this in the CPURISCVState is incorrect.  A much better place would be on 
the RISCVCPUClass, so that there is exactly one copy of this per cpu type, i.e. all 
A25/AX25 cpus would share the same table.

You would of course need to hook class_init, which the current definition of DEFINE_CPU 
does not allow.  But that's easy to fix.

> +    /* Custom CSR value holder per hart */
> +    void *custom_csr_val;
>   };

Value singular?  Anyhow, I think that it's a mistake trying to hide the value structure in 
another file.  It complicates allocation of the CPURISCVState, and you have no mechanism 
by which to migrate the csr values.

I think you should simply place your structure here in CPURISCVState.

> +static gpointer find_custom_csr(CPURISCVState *env, int csrno)
> +{
> +    gpointer ret;
> +    ret = g_hash_table_lookup(env->custom_csr_map, GINT_TO_POINTER(csrno));
> +    return ret;
> +}

Fix the return type; the csr is not gpointer.
It would be better to put the map not null test here.

I think it would be even better to name this find_csr,
and include the normal index of csr_ops[] if the map
test fails.

> @@ -1449,26 +1458,39 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    /* try to handle_custom_csr */
> +    if (unlikely(env->custom_csr_map != NULL)) {
> +        riscv_csr_operations *custom_csr_opset = (riscv_csr_operations *)
> +            find_custom_csr(env, csrno);
> +        if (custom_csr_opset != NULL) {
> +            csr_op = custom_csr_opset;
> +            } else {
> +            csr_op = &csr_ops[csrno];
> +            }
> +        } else {
> +        csr_op = &csr_ops[csrno];
> +        }

As Alistair noted, run checkpatch.pl to find all of these indentation errors.

That said, a better structure here would be

     csr_op = find_csr(env, csrno);
     if (csr_op == NULL) {
         return RISCV_EXCP_ILLEGAL_INST;
     }


r~

