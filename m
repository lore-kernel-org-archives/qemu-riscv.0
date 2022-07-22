Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEhgj-00022I-Ei
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 21:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oEhgi-00021z-0L; Thu, 21 Jul 2022 21:42:44 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:58314 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oEhgf-0006OE-5e; Thu, 21 Jul 2022 21:42:43 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-01 (Coremail) with SMTP id qwCowABXnJyGANpigddcAA--.16798S2;
 Fri, 22 Jul 2022 09:42:32 +0800 (CST)
Subject: Re: [PATCH v6 3/5] target/riscv: smstateen check for fcsr
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-4-mchitale@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <e819eb9c-fdec-5138-5b94-f8ddd2331f7a@iscas.ac.cn>
Date: Fri, 22 Jul 2022 09:42:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220721153136.377578-4-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowABXnJyGANpigddcAA--.16798S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtF1DWF15uF1UXr15Zw1DJrb_yoW7Xw4xp3
 ykGFZxG3s5JryIya13JFn8JF9xKan7K3yIkwnrtw1ktF4DGrWFgF4kt347XryUJFykXr1f
 CayjvFnxur4xZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyU
 JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUjRRRDUUUU
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
X-List-Received-Date: Fri, 22 Jul 2022 01:42:44 -0000


ÔÚ 2022/7/21 ÏÂÎç11:31, Mayuresh Chitale Ð´µÀ:
> If smstateen is implemented and sstateen0.fcsr is clear then the
> floating point operations must return illegal instruction exception.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/csr.c                        | 23 ++++++++++++++
>   target/riscv/insn_trans/trans_rvf.c.inc   | 38 +++++++++++++++++++++--
>   target/riscv/insn_trans/trans_rvzfh.c.inc |  4 +++
>   3 files changed, 63 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ab06b117f9..a597b6cbc7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -96,6 +96,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
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
> @@ -1876,6 +1880,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
>                                         target_ulong new_val)
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
>   
>       return write_mstateen(env, csrno, wr_mask, new_val);
>   }
> @@ -1924,6 +1931,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>   
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>       return write_mstateenh(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -1973,6 +1984,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>   
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>       return write_hstateen(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -2024,6 +2039,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>   
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>       return write_hstateenh(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -2083,6 +2102,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>   
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>       return write_sstateen(env, csrno, wr_mask, new_val);
>   }
>   
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index a1d3eb52ad..c43c48336b 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -24,9 +24,43 @@
>               return false; \
>   } while (0)
>   
> +#ifndef CONFIG_USER_ONLY
> +#define SMSTATEEN_CHECK(ctx) do {\
> +    CPUState *cpu = ctx->cs; \
> +    CPURISCVState *env = cpu->env_ptr; \
> +    if (ctx->cfg_ptr->ext_smstateen && \
> +        (env->priv < PRV_M)) { \
> +        uint64_t stateen = env->mstateen[0]; \
> +        uint64_t hstateen = env->hstateen[0]; \
> +        uint64_t sstateen = env->sstateen[0]; \
> +        if (!(stateen & SMSTATEEN_STATEN)) {\
> +            hstateen = 0; \
> +            sstateen = 0; \
> +        } \
> +        if (ctx->virt_enabled) { \
> +            stateen &= hstateen; \
> +            if (!(hstateen & SMSTATEEN_STATEN)) {\
> +                sstateen = 0; \
> +            } \
> +        } \
> +        if (env->priv == PRV_U && has_ext(ctx, RVS)) {\
> +            stateen &= sstateen; \
> +        } \
> +        if (!(stateen & SMSTATEEN0_FCSR)) { \
> +            return false; \
> +        } \
> +    } \
> +} while (0)

It's better to add a space before '\'.

> +#else
> +#define SMSTATEEN_CHECK(ctx)
> +#endif
> +
>   #define REQUIRE_ZFINX_OR_F(ctx) do {\
> -    if (!ctx->cfg_ptr->ext_zfinx) { \
> -        REQUIRE_EXT(ctx, RVF); \
> +    if (!has_ext(ctx, RVF)) { \
> +        SMSTATEEN_CHECK(ctx); \
> +        if (!ctx->cfg_ptr->ext_zfinx) { \
> +            return false; \
> +        } \
>       } \
>   } while (0)

SMSTATEEN_CHECK is for CSR. and REQUIRE_ZFINX_OR_F is for Extension.
I think It's better to separate them. By the way, if we want the smallest modification
for current code, adding it to REQUIRE_FPU seems better.
Regards,
Weiwei Li

>   
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 5d07150cd0..b165ea9d58 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -17,24 +17,28 @@
>    */
>   
>   #define REQUIRE_ZFH(ctx) do { \
> +    SMSTATEEN_CHECK(ctx); \
>       if (!ctx->cfg_ptr->ext_zfh) {      \
>           return false;         \
>       }                         \
>   } while (0)
>   
>   #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
> +    SMSTATEEN_CHECK(ctx); \
>       if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
>           return false;                  \
>       }                                  \
>   } while (0)
>   
>   #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
> +    SMSTATEEN_CHECK(ctx); \
>       if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
>           return false;                         \
>       }                                         \
>   } while (0)
>   
>   #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
> +    SMSTATEEN_CHECK(ctx); \
>       if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin ||          \
>             ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) {     \
>           return false;                                        \


