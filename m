Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJ9nx-0001hm-9G
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 04:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oJ9nq-0001ew-Pf; Wed, 03 Aug 2022 04:32:33 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:49684 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oJ9no-0007HC-CC; Wed, 03 Aug 2022 04:32:30 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-01 (Coremail) with SMTP id qwCowACX3JySMupiPpHYBQ--.28427S2;
 Wed, 03 Aug 2022 16:32:18 +0800 (CST)
Subject: Re: [PATCH v7 3/4] target/riscv: smstateen check for fcsr
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
References: <20220801171843.72986-1-mchitale@ventanamicro.com>
 <20220801171843.72986-4-mchitale@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <c5d8304d-315c-bf5b-f63c-2d38348fdf4c@iscas.ac.cn>
Date: Wed, 3 Aug 2022 16:32:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220801171843.72986-4-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowACX3JySMupiPpHYBQ--.28427S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtF1DJF1rKr1kGFyxKry3Arb_yoW7Aryfp3
 y8GF43C3s5JryIva1fJFn8JF9xtws7G3yIk3Zrtw1kXanrKrWFgF4kK347Kr17XFy8Wr1S
 vayj9FnxCr47AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9I14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
 zVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_
 WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
 IYCTnIWIevJa73UjIFyTuYvjfU8TmhUUUUU
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 Aug 2022 08:32:34 -0000


ÔÚ 2022/8/2 ÉÏÎç1:18, Mayuresh Chitale Ð´µÀ:
> If smstateen is implemented and sstateen0.fcsr is clear then the
> floating point operations must return illegal instruction exception.

I think this is not correct. The exception for float point operations 
must be illegal instruction exception

if FCSR is not existed(that is misa.F is zero and Zfinx is not 
supported). However, when FCSR is exsited,

the final exception should be decided by current privilege level and the 
stateen related csr values just

like the access control of FCSR.

Regards,

Weiwei Li

>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/csr.c                        | 23 +++++++++++++
>   target/riscv/insn_trans/trans_rvf.c.inc   | 40 +++++++++++++++++++++--
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
>   3 files changed, 72 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 011d6c5976..0512391220 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -79,6 +79,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
>           !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
> +
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> +    }
>   #endif
>       return RISCV_EXCP_NONE;
>   }
> @@ -1866,6 +1870,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
>                                         target_ulong new_val)
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
>   
>       return write_mstateen(env, csrno, wr_mask, new_val);
>   }
> @@ -1914,6 +1921,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>       return write_mstateenh(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -1963,6 +1974,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>       return write_hstateen(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -2014,6 +2029,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>       return write_hstateenh(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -2073,6 +2092,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>       return write_sstateen(env, csrno, wr_mask, new_val);
>   }
>   
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index a1d3eb52ad..ce8a0cc34b 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -24,9 +24,43 @@
>               return false; \
>   } while (0)
>   
> -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> -    if (!ctx->cfg_ptr->ext_zfinx) { \
> -        REQUIRE_EXT(ctx, RVF); \
> +#ifndef CONFIG_USER_ONLY
> +static inline bool smstateen_check(DisasContext *ctx, int index)
> +{
> +    CPUState *cpu = ctx->cs;
> +    CPURISCVState *env = cpu->env_ptr;
> +    uint64_t stateen = env->mstateen[index];
> +
> +    if (!ctx->cfg_ptr->ext_smstateen || env->priv == PRV_M) {
> +        return true;
> +    }
> +
> +    if (ctx->virt_enabled) {
> +        stateen &= env->hstateen[index];
> +    }
> +
> +    if (env->priv == PRV_U && has_ext(ctx, RVS)) {
> +        stateen &= env->sstateen[index];
> +    }
> +
> +    if (!(stateen & SMSTATEEN0_FCSR)) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +#else
> +#define smstateen_check(ctx, index) (true)
> +#endif
> +
> +#define REQUIRE_ZFINX_OR_F(ctx) do { \
> +    if (!has_ext(ctx, RVF)) { \
> +        if (!ctx->cfg_ptr->ext_zfinx) { \
> +            return false; \
> +        } \
> +        if (!smstateen_check(ctx, 0)) { \
> +            return false; \
> +        } \
>       } \
>   } while (0)
>   
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 5d07150cd0..44d962c920 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -20,18 +20,27 @@
>       if (!ctx->cfg_ptr->ext_zfh) {      \
>           return false;         \
>       }                         \
> +    if (!smstateen_check(ctx, 0)) { \
> +        return false; \
> +    } \
>   } while (0)
>   
>   #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
>       if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
>           return false;                  \
>       }                                  \
> +    if (!smstateen_check(ctx, 0)) { \
> +        return false; \
> +    } \
>   } while (0)
>   
>   #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
>       if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
>           return false;                         \
>       }                                         \
> +    if (!smstateen_check(ctx, 0)) { \
> +        return false; \
> +    } \
>   } while (0)
>   
>   #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
> @@ -39,6 +48,9 @@
>             ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) {     \
>           return false;                                        \
>       }                                                        \
> +    if (!smstateen_check(ctx, 0)) { \
> +        return false; \
> +    } \
>   } while (0)
>   
>   static bool trans_flh(DisasContext *ctx, arg_flh *a)


