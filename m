Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXn8f-0005F8-HT
	for mharc-qemu-riscv@gnu.org; Wed, 28 Oct 2020 11:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXn8d-0005BB-TC
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2020 11:13:23 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXn8b-0005cL-SE
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2020 11:13:23 -0400
Received: by mail-pg1-x541.google.com with SMTP id t14so2970719pgg.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2020 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a8e7bwmN1ozxs6n3UcR6YxE55vDhpo8v5fZ533jeo8E=;
 b=R4nX8R6e6y/Rs9q2o+A2a8HUWeJQkapzEar8ULWIIjw07DCvvy9ToCncKh9X9yVMFy
 6THvto1L+pnpeWh8sZTwKg8MVjc1C1DxzAnzknM52CMgP4gALm9YRUSP5BFo60H+3I0t
 NFHXsxeWJIphfNSeVqJVt2+t/UEz42lpWb50L0i4A+2r8rlbDSaVXPPTZVDcgDdqWEdI
 /LWcHjbDe8RirqPVZghkdeKFls71FqU3jM+JkzRKxk8TAWyliuX84c3hYpyyrtbziEOg
 d7kdL77mPHIQWOyIb5YBQdohxXjZETcuwmuwddcH8ckJwzRvTNRkmJInxJEf2qBR1pRy
 66ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a8e7bwmN1ozxs6n3UcR6YxE55vDhpo8v5fZ533jeo8E=;
 b=eRoOGmbTRCQC+y9ZkSrhuHJ6lHHeDFCE+2IEZmfEXozy+CpkH6zHW5So57YdEw2XWt
 30Lsg23zK+u34bzFs7MYX9slOl2zgBGEX4a1u61oTHcOljZyr6LuXpdb+WEsHnZhgieX
 t9z1OIbnxqynBlXhS6LwUfnNqwojqUrVgX59Bp5Nzh7up8V0E31U2Xd3/jV+Dsjks9Ek
 +xhi7aJO7x0xPjx1huBU/jGxVFWH6tdaxNY1/qmjkojybgg5yU5WefZfxMjAKX6619UD
 0/jeYveFfbA1cfNjYfUQL0zCt3oi/RvybCVOTGZwaJCcmMmlDFPGXTutIbNxnvkldMTm
 ezSw==
X-Gm-Message-State: AOAM531AAoA0bfvNz7W8xNi0nz4RuArh3exPFsc2zhG1XOUwpNqwOBPh
 Tzt2Zg9y5ZJLM5/jql+E6EoXsg==
X-Google-Smtp-Source: ABdhPJwJs2Ovs67DN2QujSy/IbOIahlqgNMXU+TO+7Hiec3j/9sbrGiRwxr4tqToFhj7AwRyPjOLdQ==
X-Received: by 2002:a63:ce02:: with SMTP id y2mr6346957pgf.348.1603898000354; 
 Wed, 28 Oct 2020 08:13:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id k6sm1878365pfu.89.2020.10.28.08.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 08:13:19 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] target/riscv: Add a virtualised MMU Mode
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1603896075.git.alistair.francis@wdc.com>
 <d0eeb9ea64462044a67f5b803d6cb62dd10e017a.1603896075.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8c23bed-3b6c-e01d-cb04-ce945d509970@linaro.org>
Date: Wed, 28 Oct 2020 08:13:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d0eeb9ea64462044a67f5b803d6cb62dd10e017a.1603896075.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.921,
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
X-List-Received-Date: Wed, 28 Oct 2020 15:13:24 -0000

On 10/28/20 7:42 AM, Alistair Francis wrote:
> Add a new MMU mode that includes the current virt mode.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu-param.h  | 10 +++++++++-
>  target/riscv/cpu.h        |  4 +++-
>  target/riscv/cpu_helper.c |  6 +++++-
>  3 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
> index 664fc1d371..0db6e23140 100644
> --- a/target/riscv/cpu-param.h
> +++ b/target/riscv/cpu-param.h
> @@ -18,6 +18,14 @@
>  # define TARGET_VIRT_ADDR_SPACE_BITS 32 /* sv32 */
>  #endif
>  #define TARGET_PAGE_BITS 12 /* 4 KiB Pages */
> -#define NB_MMU_MODES 4
> +/*
> + * The current MMU Modes are:
> + *  - U  mode 0b000
> + *  - S  mode 0b001
> + *  - M  mode 0b011
> + *  - HU mode 0b100
> + *  - HS mode 0b101
> + */
> +#define NB_MMU_MODES 6
>  
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 87b68affa8..5d8e54c426 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -363,7 +363,9 @@ void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>  void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>  
> -#define TB_FLAGS_MMU_MASK   3
> +#define TB_FLAGS_MMU_MASK   7
> +#define TB_FLAGS_PRIV_MMU_MASK                3
> +#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>  #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
>  
>  typedef CPURISCVState CPUArchState;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 3eb3a034db..453e4c6d8a 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -30,6 +30,10 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  #ifdef CONFIG_USER_ONLY
>      return 0;
>  #else
> +    if (riscv_cpu_virt_enabled(env)) {
> +        return env->priv | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +    }

This is wrong.  You only want to set this flag in response to one of the
hypervisor special instructions.  This is setting it any time virt is enabled.


r~

