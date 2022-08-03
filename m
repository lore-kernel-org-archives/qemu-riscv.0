Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJ9gS-0002HX-2B
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 04:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oJ9gQ-0002Gj-4Q; Wed, 03 Aug 2022 04:24:50 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:47880 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oJ9gM-0005kY-II; Wed, 03 Aug 2022 04:24:48 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-01 (Coremail) with SMTP id qwCowACX3JzEMOpifQ3YBQ--.28374S2;
 Wed, 03 Aug 2022 16:24:36 +0800 (CST)
Subject: Re: [PATCH v7 2/4] target/riscv: smstateen check for h/senvcfg
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
References: <20220801171843.72986-1-mchitale@ventanamicro.com>
 <20220801171843.72986-3-mchitale@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <3e1bc732-caef-7a46-eaa8-933e4d92f07d@iscas.ac.cn>
Date: Wed, 3 Aug 2022 16:24:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220801171843.72986-3-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowACX3JzEMOpifQ3YBQ--.28374S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw4xtF1DCF43Ww13WFWDXFb_yoWxXw47pF
 4UXrsxG34vqF92van3GF1DWF13C3ykG3y3Zws7Wa1vyF17tryrGF1qqasxZr4kW3yDJr4I
 vay0kF1DCr42vFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-List-Received-Date: Wed, 03 Aug 2022 08:24:50 -0000


ÔÚ 2022/8/2 ÉÏÎç1:18, Mayuresh Chitale Ð´µÀ:
> Accesses to henvcfg, henvcfgh and senvcfg are allowed only if
> corresponding bit in mstateen0/hstateen0 is enabled. Otherwise an
> illegal instruction trap is generated.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   roms/opensbi       |  2 +-
>   target/riscv/csr.c | 83 ++++++++++++++++++++++++++++++++++++++++++----
>   2 files changed, 77 insertions(+), 8 deletions(-)
>
> diff --git a/roms/opensbi b/roms/opensbi
> index 4489876e93..48f91ee9c9 160000
> --- a/roms/opensbi
> +++ b/roms/opensbi
> @@ -1 +1 @@
> -Subproject commit 4489876e933d8ba0d8bc6c64bae71e295d45faac
> +Subproject commit 48f91ee9c960f048c4a7d1da4447d31e04931e38
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ad1642fb9b..011d6c5976 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -40,6 +40,38 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>   }
>   
>   /* Predicates */
> +#if !defined(CONFIG_USER_ONLY)
> +static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
> +                                       uint64_t bit)
> +{
> +    bool virt = riscv_cpu_virt_enabled(env);
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!(env->mstateen[index] & bit)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (virt) {
> +        if (!(env->hstateen[index] & bit)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +    }
> +
> +    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
> +        if (!(env->sstateen[index] & bit)) {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }

VU mode seems not be taken into consideration. For VU mode, the 
exception will be

RISCV_EXCP_VIRT_INSTRUCTION_FAULT instead if "!(env->sstateen[index] & bit)" here.

Regards,

Weiwei Li

> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +#endif
> +
>   static RISCVException fs(CPURISCVState *env, int csrno)
>   {
>   #if !defined(CONFIG_USER_ONLY)
> @@ -1715,6 +1747,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>   static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       *val = env->senvcfg;
>       return RISCV_EXCP_NONE;
>   }
> @@ -1723,15 +1762,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
>       uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
> +    RISCVException ret;
>   
> -    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
>   
> +    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       *val = env->henvcfg;
>       return RISCV_EXCP_NONE;
>   }
> @@ -1740,6 +1791,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
>       uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>           mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> @@ -1753,6 +1810,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>   static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       *val = env->henvcfg >> 32;
>       return RISCV_EXCP_NONE;
>   }
> @@ -1762,9 +1826,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>   {
>       uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
>       uint64_t valh = (uint64_t)val << 32;
> +    RISCVException ret;
>   
> -    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
>   
> +    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -1796,7 +1865,7 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
>   static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
>                                         target_ulong new_val)
>   {
> -    uint64_t wr_mask = SMSTATEEN_STATEEN;
> +    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
>       return write_mstateen(env, csrno, wr_mask, new_val);
>   }
> @@ -1843,7 +1912,7 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
>   static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
>                                         target_ulong new_val)
>   {
> -    uint64_t wr_mask = SMSTATEEN_STATEEN;
> +    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
>       return write_mstateenh(env, csrno, wr_mask, new_val);
>   }
> @@ -1892,7 +1961,7 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
>   static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
>                                         target_ulong new_val)
>   {
> -    uint64_t wr_mask = SMSTATEEN_STATEEN;
> +    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
>       return write_hstateen(env, csrno, wr_mask, new_val);
>   }
> @@ -1943,7 +2012,7 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
>   static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
>                                          target_ulong new_val)
>   {
> -    uint64_t wr_mask = SMSTATEEN_STATEEN;
> +    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
>       return write_hstateenh(env, csrno, wr_mask, new_val);
>   }
> @@ -2002,7 +2071,7 @@ static RISCVException write_sstateen(CPURISCVState *env, int csrno,
>   static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
>                                         target_ulong new_val)
>   {
> -    uint64_t wr_mask = SMSTATEEN_STATEEN;
> +    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
>       return write_sstateen(env, csrno, wr_mask, new_val);
>   }


