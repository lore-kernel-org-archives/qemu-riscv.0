Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvhfL-0002DZ-F0
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 10:18:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mvhfK-0002Bv-0v
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 10:18:30 -0500
Received: from [2607:f8b0:4864:20::235] (port=38435
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mvhfI-0001vd-2i
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 10:18:29 -0500
Received: by mail-oi1-x235.google.com with SMTP id r26so13632050oiw.5
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 07:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uytk9CbZYhrrFVCeXAsOW+dc2f3EmOXFP9cLyrouMhc=;
 b=oq64BG1SQ3CIA7I8iucaksrZACw8dZDbHfvW9rBCSQBkfondWRvs1k4lfusYFanfVR
 IEea3QQXjjl8on5r1vZ+AmqjEY6FYfKHwj73T93tMFbviXzPVI7/y4uVMGqXDG/YGprZ
 0LopwKFUCFp2USf2ZflljF45txFviExZE16k9oZ2MK8dfszt508kb+C0SNaIq1bKKdh9
 ZBSCLuXhlPbxRrSjjoYEaUq485kLvqyRHIgp+wjv39xYntD7wGfk6ffOu2BqwMt1cZIx
 53GATV1RvOuLoVGvdMbGBxYEUwSaM2SAR9hDd9YLd6rhrvNo7wvnPuZmYXwAyO4YNtGw
 xjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uytk9CbZYhrrFVCeXAsOW+dc2f3EmOXFP9cLyrouMhc=;
 b=WzP/zCicJYhf/bkNSdhhrGmGqmhBWug6ynKj6BSyV9W94QEfgr4qxkpvUHn4un40C9
 pVvS7p2DfVTtbbp05b1RWKc3PE7DLxVK/5biytFVToQYsn87GHVHdjeqN9SmoStIDQNX
 c7spZJ7dYW2MKaWFcUWC1qrhSfBZNRq2yaBh/xjIHePZMkqdYcoYaGMrmqx5P9dHiKNE
 r8NBM8B/K4WHY5iHQ8LRk8oA4p6grvnbQCtthFgtWpKu37ejmebV2PIeaNEEz6xYsLAq
 Mhlhc0A2einWjJyF5FWcD4HRhX75y8Lq1+g6wN8B93535RRx0GPYkLjC1cMx0k6vtYfu
 d06Q==
X-Gm-Message-State: AOAM533PuGSjoPrX+tlWqAp49IaWHrciQ74Np7MCDtK6n4rQRwtKkiJ4
 /AONsqFNRyioQyhEFujQpsPoF/V0UpB0gQ==
X-Google-Smtp-Source: ABdhPJzeL+wQmnwFPpkeYQCMrghLHdda0qtXv7+kRYSDby5J/TijJwfY+NOUgcxzg+b6ST8z1sr9FA==
X-Received: by 2002:a17:90a:6e0c:: with SMTP id
 b12mr24069938pjk.41.1639149116238; 
 Fri, 10 Dec 2021 07:11:56 -0800 (PST)
Received: from [172.20.1.20] (45-19-222-18.lightspeed.sntcca.sbcglobal.net.
 [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id a18sm3332739pfn.185.2021.12.10.07.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 07:11:55 -0800 (PST)
Subject: Re: [PATCH 2/2] target/riscv: Implement the stval/mtval illegal
 instruction
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com
References: <20211210062638.824672-1-alistair.francis@opensource.wdc.com>
 <20211210062638.824672-3-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56a5e33d-bf0f-f588-d288-a302b5631fb4@linaro.org>
Date: Fri, 10 Dec 2021 07:11:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210062638.824672-3-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 15:18:30 -0000

On 12/9/21 10:26 PM, Alistair Francis wrote:
> @@ -975,7 +975,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>       bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
>       target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
>       target_ulong deleg = async ? env->mideleg : env->medeleg;
> -    bool write_tval = false;
>       target_ulong tval = 0;
>       target_ulong htval = 0;
>       target_ulong mtval2 = 0;
> @@ -1004,9 +1003,11 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>           case RISCV_EXCP_INST_PAGE_FAULT:
>           case RISCV_EXCP_LOAD_PAGE_FAULT:
>           case RISCV_EXCP_STORE_PAGE_FAULT:
> -            write_tval  = true;
>               tval = env->badaddr;
>               break;
...
> @@ -1041,17 +1042,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>           if (riscv_has_ext(env, RVH)) {
>               target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
>   
> -            if (env->two_stage_lookup && write_tval) {
> -                /*
> -                 * If we are writing a guest virtual address to stval, set
> -                 * this to 1. If we are trapping to VS we will set this to 0
> -                 * later.
> -                 */
> -                env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 1);
> -            } else {
> -                /* For other HS-mode traps, we set this to 0. */
> -                env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
> -            }
> +            env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
>   
>               if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
>                   /* Trap to VS mode */
> @@ -1063,7 +1054,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                       cause == IRQ_VS_EXT) {
>                       cause = cause - 1;
>                   }
> -                env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
>               } else if (riscv_cpu_virt_enabled(env)) {
>                   /* Trap into HS mode, from virt */
>                   riscv_cpu_swap_hypervisor_regs(env);
> @@ -1071,6 +1061,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                                            env->priv);
>                   env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
>                                            riscv_cpu_virt_enabled(env));
> +                if (tval) {
> +                    /*
> +                     * If we are writing a guest virtual address to stval, set
> +                     * this to 1.
> +                     */
> +                    env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 1);
> +                }

The thing that concerns me here is the very legitimate badaddr of NULL.  I think you need 
to keep some out-of-band flag for that.

In addition, the out-of-band flag should probably be called write_gva, because tval from 
ILLEGAL_INST is not a Guest Virtual Address, and so should not set GVA.

You could even push the setting of the bit down so that it's only done once, e.g.

     hstatus_gva = true;
     tval = env->badaddr;

     if (trap to vs) {
        ...
        hstatus_gva = false;
     } else if (virt enabled) {
        ...
     } else {
        trap into hs
        hstatus_gva = false;
     }
     env->hstatus(set_field(env->hstatus, HSTATUS_GVA, hstatus_gva);


The actual handling of ILLEGAL_INST looks fine.
You may well want to split the GVA handling to a separate patch.


r~

