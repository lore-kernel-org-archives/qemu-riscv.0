Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peyNH-0005BH-5y
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 09:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peyNG-0005B0-KV
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 09:19:30 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peyNE-0002xA-Tb
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 09:19:30 -0400
Received: by mail-pl1-x62b.google.com with SMTP id w4so11159616plg.9
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 06:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679491167;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KB820zidQLpBMDGZot7141AuHdD7FrArDwoCvLpDMpY=;
 b=bbWzJBP/JVmAeUFi0XC638FVPUEU/WkQw2CCU3lwvUCiyblBlmwcnBj3LPBdLKZVno
 UEH5lkPiN4fQNX0T62GG/cDZKqlvhKUajfa2E/ON9pa6t6B6MbT1rg3o6tUyUxpUGsfx
 kzMdrau2v2PhLF6SgoO2mY5nCDmA7KSBbt01Mu69zJdz8/YIaVlWUK4OLKqLlq05Emlm
 f/cqxaXhcOTCdOgBSTRMgHGuzSByq57B28NCN+lkVDQYtNgZte0mBrIN5wMjB9hZdV9X
 l849r/nuRdfOljHuzpi0iLy2A+MApLU3hkYVjJIWAGVB72S/RSgupQLPQlsiRzS7OEEO
 6a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679491167;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KB820zidQLpBMDGZot7141AuHdD7FrArDwoCvLpDMpY=;
 b=cJb4HSJ6088Omz1WrYLwa7cFas/A6zRncUHUD87yS7+hBYj2IcwidM0Rpbpcdu1JAu
 tAR9EB3hu+t6Zv4k8OaKgkAqn7YcGz01HIZZoQgxpg1484Jgo7ZrzZ3DcUyRq76h7ebo
 MITTAoIF5fvfA6DYqXxQXIOy3+ZZVdvQ1+ZrTj/BQV71Fu0CatcmKaSmSgQYo/R1pt+B
 PkktwcJvSAbHynAUqTYzSrfuNAXXQ9cd4oj2MGPTCO3tQVZsdY64GktFzvNG/a7PJzXo
 Ol2V8Nzn/b8jiibhrmDTngmNuN3jgpSyDbDbkzjYFHYm1ICd+blBPbStyf7BJJN6zKFy
 WedA==
X-Gm-Message-State: AO0yUKUBwSi01+24x4+6ThEZjIrVzFbMQl7DJE8zOwppXJD8AJZ/CkYc
 8Q7BAtbLMbA9i4hao1IugV2j1Q==
X-Google-Smtp-Source: AK7set/qqPxgfVZikdf//UP2hwbLWaYt0y59ZvAROaqWyP295oS5zBeN7FT/sk+4DdrANwBTVY8iaQ==
X-Received: by 2002:a17:903:2306:b0:1a1:b5e3:7db4 with SMTP id
 d6-20020a170903230600b001a1b5e37db4mr3070332plh.18.1679491167452; 
 Wed, 22 Mar 2023 06:19:27 -0700 (PDT)
Received: from [192.168.7.32] (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a170902b49400b00196807b5189sm10484191plr.292.2023.03.22.06.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 06:19:26 -0700 (PDT)
Message-ID: <cde0b3bf-7d38-2fc4-c8a9-7241d5bf7339@linaro.org>
Date: Wed, 22 Mar 2023 06:19:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
To: Fei Wu <fei2.wu@intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20230322121240.232303-1-fei2.wu@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230322121240.232303-1-fei2.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 13:19:30 -0000

On 3/22/23 05:12, Fei Wu wrote:
> Kernel needs to access user mode memory e.g. during syscalls, the window
> is usually opened up for a very limited time through MSTATUS.SUM, the
> overhead is too much if tlb_flush() gets called for every SUM change.
> 
> This patch creates a separate MMU index for S+SUM, so that it's not
> necessary to flush tlb anymore when SUM changes. This is similar to how
> ARM handles Privileged Access Never (PAN).
> 
> Result of 'pipe 10' from unixbench boosts from 223656 to 1705006. Many
> other syscalls benefit a lot from this too.
> 
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> ---
>   target/riscv/cpu-param.h  |  2 +-
>   target/riscv/cpu.h        |  2 +-
>   target/riscv/cpu_bits.h   |  1 +
>   target/riscv/cpu_helper.c | 11 +++++++++++
>   target/riscv/csr.c        |  2 +-
>   5 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
> index ebaf26d26d..9e21b943f9 100644
> --- a/target/riscv/cpu-param.h
> +++ b/target/riscv/cpu-param.h
> @@ -27,6 +27,6 @@
>    *  - S mode HLV/HLVX/HSV 0b101
>    *  - M mode HLV/HLVX/HSV 0b111
>    */
> -#define NB_MMU_MODES 8
> +#define NB_MMU_MODES 16

This line no longer exists on master.
The comment above should be updated, and perhaps moved.

>   #define TB_FLAGS_PRIV_MMU_MASK                3
> -#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
> +#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 3)

You can't do this, as you're now overlapping

FIELD(TB_FLAGS, LMUL, 3, 3)

You'd need to shift all other fields up to do this.
There is room, to be sure.

Or you could reuse MMU mode number 2.  For that you'd need to separate 
DisasContext.mem_idx from priv.  Which should probably be done anyway, because tests such as

insn_trans/trans_privileged.c.inc:    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&

are already borderline wrong.

I suggest

- #define TB_FLAGS_PRIV_MMU_MASK                3
- #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)

HYP_ACCESS_MASK never needed to be part of TB_FLAGS; it is only set directly by the hyp 
access instruction translation.  Drop the PRIV mask and represent that directly:

- FIELD(TB_FLAGS, MEM_IDX, 0, 3)
+ FIELD(TB_FLAGS, PRIV, 0, 2)
+ FIELD(TB_FLAGS, SUM, 2, 1)

Let SUM occupy the released bit.

In internals.h,

/*
  * The current MMU Modes are:
  *  - U                 0b000
  *  - S                 0b001
  *  - S+SUM             0b010
  *  - M                 0b011
  *  - HLV/HLVX/HSV adds 0b100
  */
#define MMUIdx_U            0
#define MMUIdx_S            1
#define MMUIdx_S_SUM        2
#define MMUIdx_M            3
#define MMU_HYP_ACCESS_BIT  (1 << 2)


In riscv_tr_init_disas_context:

     ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
     ctx->mmu_idx = ctx->priv;
     if (ctx->mmu_idx == PRV_S && FIELD_EX32(tb_flags, TB_FLAGS, SUM)) {
         ctx->mmu_idx = MMUIdx_S_SUM;
     }

and similarly in riscv_cpu_mmu_index.

Fix all uses of ctx->mmu_idx that are not specifically for memory operations.


r~

