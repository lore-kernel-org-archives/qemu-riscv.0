Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mqZMl-0001Qj-Na
	for mharc-qemu-riscv@gnu.org; Fri, 26 Nov 2021 06:26:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqZMb-0001Pa-CC
 for qemu-riscv@nongnu.org; Fri, 26 Nov 2021 06:25:59 -0500
Received: from [2a00:1450:4864:20::42d] (port=42634
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqZMY-0003Jt-3L
 for qemu-riscv@nongnu.org; Fri, 26 Nov 2021 06:25:56 -0500
Received: by mail-wr1-x42d.google.com with SMTP id c4so17916971wrd.9
 for <qemu-riscv@nongnu.org>; Fri, 26 Nov 2021 03:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yr9jOC1pGsGdgIenzCxYIJ8jAVDiQvpRdloz/KzY1IM=;
 b=lk4BQXqXHgQHLqSrjrX81TrzRtorPMdWhSuY7Q1l1tSzMuNGRE+dRTSePyo1sBRwKY
 ACfoyFU5ldB7ozmfv9J9pQ0b3nTZhyGIuKfoewDvkEVFOMj6xJ2hUpzD3LcGvv0W4elD
 3kAD0JshZinja2CgQh2eH/tmHfGuVj388H7DMpODQ366s9iJbm49Y2KEy9/6XvVG7XEi
 lKutXUJ9HQY6CmMwnbD3+0V12IFmNppBUPbLxf0l9yov7ojRL68y4eioBvgwp8TnkdnK
 41eFX+ZpMz8QNDq6IFeDpNhYCQEOSc/2v/Q9e/2P/KZV6zcDkAqoi6cJS7tATJS7dhWG
 BVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yr9jOC1pGsGdgIenzCxYIJ8jAVDiQvpRdloz/KzY1IM=;
 b=Hq1xFin/W6UBzKP8Pl+kXq1gmpLtMjlUxnf4qVYGId+N1NPXokecqps2hCQFBdMNWW
 M4D23010y4ct8M4eCs/9scD+sO99z9k/EyekAbZZjVD5awLbACg3BTjb1ycY2VDtGwcq
 sEJxo8+tBYaBx6/dSXrg+ZBfAMZ7I3Jm3CU7uS7rNN/VddOdvZOLwiHUPBijcnccYM90
 TNztcD8yNlggDmibDh+6tl1fOoIL/hcXzoOVUHLLTLidCJzCWnJat8dnSs1uUGS67Stg
 wpYMvJbRYMJqvux44spE6sHBrk6WKlb2LF0gSKApoh3z3EiUoSz/iJuhIrczrRAu++nq
 hsAQ==
X-Gm-Message-State: AOAM5316UnM9902uq8kLpXh05ItbL14GV3tu2v6g/s1v5BuK54cUnTFC
 iBfwl2Jz9j04KUUK3+Hh6NAuuQ==
X-Google-Smtp-Source: ABdhPJzaRwY8oag20f2IB0KQkQBgeKqT+lWECLiqRidOpzzg+3FCHPxYoCX8JEN9qqdAfuy1N6GMWw==
X-Received: by 2002:a5d:624f:: with SMTP id m15mr13439327wrv.13.1637925952348; 
 Fri, 26 Nov 2021 03:25:52 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id k13sm5226274wri.6.2021.11.26.03.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 03:25:51 -0800 (PST)
Subject: Re: [PATCH v5 04/22] target/riscv: Create xl field in env
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
 <20211125073951.57678-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de83d72e-6637-7237-e299-09765f5ed3b1@linaro.org>
Date: Fri, 26 Nov 2021 12:25:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125073951.57678-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 26 Nov 2021 11:26:03 -0000

On 11/25/21 8:39 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.c        | 1 +
>   target/riscv/cpu.h        | 3 +++
>   target/riscv/cpu_helper.c | 3 ++-
>   target/riscv/csr.c        | 2 ++
>   target/riscv/machine.c    | 5 +++--
>   5 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f812998123..5c757ce33a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -377,6 +377,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>       /* mmte is supposed to have pm.current hardwired to 1 */
>       env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
>   #endif
> +    env->xl = riscv_cpu_mxl(env);
>       cs->exception_index = RISCV_EXCP_NONE;
>       env->load_res = -1;
>       set_default_nan_mode(1, &env->fp_status);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0760c0af93..412339dbad 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -138,6 +138,7 @@ struct CPURISCVState {
>       uint32_t misa_mxl_max;  /* max mxl for this cpu */
>       uint32_t misa_ext;      /* current extensions */
>       uint32_t misa_ext_mask; /* max ext for this cpu */
> +    uint32_t xl;            /* current xlen */
>   
>       uint32_t features;
>   
> @@ -420,6 +421,8 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
>   }
>   #endif
>   
> +RISCVMXL cpu_get_xl(CPURISCVState *env);

Probably this name should be a define/inline function, just like riscv_cpu_mxl.  The 
proper function should probably be renamed cpu_recompute_xl, or something.

>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
> -    .version_id = 3,
> -    .minimum_version_id = 3,
> +    .version_id = 4,
> +    .minimum_version_id = 4,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>           VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> @@ -183,6 +183,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           VMSTATE_UINT32(env.misa_ext, RISCVCPU),
>           VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
>           VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
> +        VMSTATE_UINT32(env.xl, RISCVCPU),

Do not save this.  We prefer to only save architectural state (which is of course 
required), and recompute anything else (which is qemu internal) from that in the post_load 
hook.  This allows qemu internals to change without breaking compatibility.


r~

