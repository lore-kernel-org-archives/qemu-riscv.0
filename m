Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofL6Z-0007dm-2z
	for mharc-qemu-riscv@gnu.org; Mon, 03 Oct 2022 09:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ofL6N-0007bP-Tf; Mon, 03 Oct 2022 09:03:25 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:33346 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ofL6J-00045E-Pj; Mon, 03 Oct 2022 09:03:18 -0400
Received: from [192.168.124.8] (unknown [139.227.114.201])
 by APP-01 (Coremail) with SMTP id qwCowADX3Y2D3TpjnmcXAw--.39225S2;
 Mon, 03 Oct 2022 21:03:00 +0800 (CST)
Message-ID: <404205f5-9626-23b3-d388-b2288293c7d1@iscas.ac.cn>
Date: Mon, 3 Oct 2022 21:02:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v10 4/5] target/riscv: smstateen check for fcsr
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, liweiwei@iscas.ac.cn
References: <20221003114718.30659-1-mchitale@ventanamicro.com>
 <20221003114718.30659-5-mchitale@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20221003114718.30659-5-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADX3Y2D3TpjnmcXAw--.39225S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtF43uw1fJr18XF1ftw1kKrg_yoW7Ww1rp3
 95GFZxC3s5GryIya1fJFn8AF9xtws7G3s2kw17tw4vqFWDGrWFgF4kK342gr1kXFykWr1S
 yayj9FnxCr47AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
 W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUU
 U==
X-Originating-IP: [139.227.114.201]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.467,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 03 Oct 2022 13:03:30 -0000


On 2022/10/3 19:47, Mayuresh Chitale wrote:
> If smstateen is implemented and sstateen0.fcsr is clear then the floating point
> operations must return illegal instruction exception or virtual instruction
> trap, if relevant.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/csr.c                        | 23 ++++++++++++
>   target/riscv/insn_trans/trans_rvf.c.inc   | 43 +++++++++++++++++++++--
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
>   3 files changed, 75 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 71236f2b5d..8b25f885ec 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -84,6 +84,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
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
> @@ -2023,6 +2027,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
>                                         target_ulong new_val)
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
>   
>       return write_mstateen(env, csrno, wr_mask, new_val);
>   }
> @@ -2059,6 +2066,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
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
> @@ -2096,6 +2107,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
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
> @@ -2135,6 +2150,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
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
> @@ -2182,6 +2201,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
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
> index a1d3eb52ad..93657680c6 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -24,9 +24,46 @@
>               return false; \
>   } while (0)
>   
> -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> -    if (!ctx->cfg_ptr->ext_zfinx) { \
> -        REQUIRE_EXT(ctx, RVF); \
> +#ifndef CONFIG_USER_ONLY
> +static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
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
> +        if (ctx->virt_enabled) {
> +            ctx->virt_inst_excp = true;
> +        }

Are there any considerations for adding  virt_inst_excp instead of directly

"generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT)" here?

Regards,

Weiwei Li

> +        return false;
> +    }
> +
> +    return true;
> +}
> +#else
> +#define smstateen_fcsr_check(ctx, index) (true)
> +#endif
> +
> +#define REQUIRE_ZFINX_OR_F(ctx) do { \
> +    if (!has_ext(ctx, RVF)) { \
> +        if (!ctx->cfg_ptr->ext_zfinx) { \
> +            return false; \
> +        } \
> +        if (!smstateen_fcsr_check(ctx, 0)) { \
> +            return false; \
> +        } \
>       } \
>   } while (0)
>   
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 5d07150cd0..6c2e338c0a 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -20,18 +20,27 @@
>       if (!ctx->cfg_ptr->ext_zfh) {      \
>           return false;         \
>       }                         \
> +    if (!smstateen_fcsr_check(ctx, 0)) { \
> +        return false; \
> +    } \
>   } while (0)
>   
>   #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
>       if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
>           return false;                  \
>       }                                  \
> +    if (!smstateen_fcsr_check(ctx, 0)) { \
> +        return false; \
> +    } \
>   } while (0)
>   
>   #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
>       if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
>           return false;                         \
>       }                                         \
> +    if (!smstateen_fcsr_check(ctx, 0)) { \
> +        return false; \
> +    } \
>   } while (0)
>   
>   #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
> @@ -39,6 +48,9 @@
>             ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) {     \
>           return false;                                        \
>       }                                                        \
> +    if (!smstateen_fcsr_check(ctx, 0)) { \
> +        return false; \
> +    } \
>   } while (0)
>   
>   static bool trans_flh(DisasContext *ctx, arg_flh *a)


