Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEgaD-0002tP-V2
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 20:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oEga3-0002sx-6J; Thu, 21 Jul 2022 20:31:49 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:40732 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oEgZw-0004Bq-57; Thu, 21 Jul 2022 20:31:46 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-05 (Coremail) with SMTP id zQCowADX3rLe79liLl6WEA--.29541S2;
 Fri, 22 Jul 2022 08:31:27 +0800 (CST)
Subject: Re: [PATCH v6 1/5] target/riscv: Add smstateen support
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-2-mchitale@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <4f472f90-e60b-50a9-c145-aa71f45e8085@iscas.ac.cn>
Date: Fri, 22 Jul 2022 08:31:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220721153136.377578-2-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowADX3rLe79liLl6WEA--.29541S2
X-Coremail-Antispam: 1UD129KBjvAXoW3Zry8ZFy3ur17GrW8Kw1xKrg_yoW8Ww4xAo
 WxtF1a9rsYk342yF929rW2qr4SvF4kAws3ZFySkrs2gr1xKr45Gr4xKaySya48KrWrKrWU
 A34SqFWUtF18CFy3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYh7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfUjRRRDUUUU
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 KHOP_HELO_FCRDNS=0.187, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 22 Jul 2022 00:31:49 -0000


在 2022/7/21 下午11:31, Mayuresh Chitale 写道:
> Smstateen extension specifies a mechanism to close
> the potential covert channels that could cause security issues.
>
> This patch adds the CSRs defined in the specification and
> the corresponding predicates and read/write functions.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/cpu.h      |   4 +
>   target/riscv/cpu_bits.h |  37 ++++
>   target/riscv/csr.c      | 370 ++++++++++++++++++++++++++++++++++++++++
>   target/riscv/machine.c  |  21 +++
>   4 files changed, 432 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ffb1a18873..7f8e5b0014 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -354,6 +354,9 @@ struct CPUArchState {
>   
>       /* CSRs for execution enviornment configuration */
>       uint64_t menvcfg;
> +    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
> +    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
> +    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
>       target_ulong senvcfg;
>       uint64_t henvcfg;
>   #endif
> @@ -426,6 +429,7 @@ struct RISCVCPUConfig {
>       bool ext_zkt;
>       bool ext_ifencei;
>       bool ext_icsr;
> +    bool ext_smstateen;
>       bool ext_svinval;
>       bool ext_svnapot;
>       bool ext_svpbmt;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 6be5a9e9f0..56b7c5bed6 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -199,6 +199,12 @@
>   /* Supervisor Configuration CSRs */
>   #define CSR_SENVCFG         0x10A
>   
> +/* Supervisor state CSRs */
> +#define CSR_SSTATEEN0       0x10C
> +#define CSR_SSTATEEN1       0x10D
> +#define CSR_SSTATEEN2       0x10E
> +#define CSR_SSTATEEN3       0x10F
> +
>   /* Supervisor Trap Handling */
>   #define CSR_SSCRATCH        0x140
>   #define CSR_SEPC            0x141
> @@ -242,6 +248,16 @@
>   #define CSR_HENVCFG         0x60A
>   #define CSR_HENVCFGH        0x61A
>   
> +/* Hypervisor state CSRs */
> +#define CSR_HSTATEEN0       0x60C
> +#define CSR_HSTATEEN0H      0x61C
> +#define CSR_HSTATEEN1       0x60D
> +#define CSR_HSTATEEN1H      0x61D
> +#define CSR_HSTATEEN2       0x60E
> +#define CSR_HSTATEEN2H      0x61E
> +#define CSR_HSTATEEN3       0x60F
> +#define CSR_HSTATEEN3H      0x61F
> +
>   /* Virtual CSRs */
>   #define CSR_VSSTATUS        0x200
>   #define CSR_VSIE            0x204
> @@ -283,6 +299,27 @@
>   #define CSR_MENVCFG         0x30A
>   #define CSR_MENVCFGH        0x31A
>   
> +/* Machine state CSRs */
> +#define CSR_MSTATEEN0       0x30C
> +#define CSR_MSTATEEN0H      0x31C
> +#define CSR_MSTATEEN1       0x30D
> +#define CSR_MSTATEEN1H      0x31D
> +#define CSR_MSTATEEN2       0x30E
> +#define CSR_MSTATEEN2H      0x31E
> +#define CSR_MSTATEEN3       0x30F
> +#define CSR_MSTATEEN3H      0x31F
> +
> +/* Common defines for all smstateen */
> +#define SMSTATEEN_MAX_COUNT 4
> +#define SMSTATEEN0_CS       (1ULL << 0)
> +#define SMSTATEEN0_FCSR     (1ULL << 1)
> +#define SMSTATEEN0_HSCONTXT (1ULL << 57)
> +#define SMSTATEEN0_IMSIC    (1ULL << 58)
> +#define SMSTATEEN0_AIA      (1ULL << 59)
> +#define SMSTATEEN0_SVSLCT   (1ULL << 60)
> +#define SMSTATEEN0_HSENVCFG (1ULL << 62)
> +#define SMSTATEEN_STATEN    (1ULL << 63)
Maybe  SMSTATEEN_STATEEN better.
> +
>   /* Enhanced Physical Memory Protection (ePMP) */
>   #define CSR_MSECCFG         0x747
>   #define CSR_MSECCFGH        0x757
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 235f2a011e..27032a416c 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -339,6 +339,68 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
>   
>   }
>   
> +static RISCVException mstateen(CPURISCVState *env, int csrno)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_smstateen) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return any(env, csrno);
> +}
> +
> +static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_smstateen) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (!(env->mstateen[csrno - base] & SMSTATEEN_STATEN)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return hmode(env, csrno);
> +}
> +
> +static RISCVException hstateen(CPURISCVState *env, int csrno)
> +{
> +    return hstateen_pred(env, csrno, CSR_HSTATEEN0);
> +}
> +
> +static RISCVException hstateenh(CPURISCVState *env, int csrno)
> +{
> +    return hstateen_pred(env, csrno, CSR_HSTATEEN0H);
> +}
> +
> +static RISCVException sstateen(CPURISCVState *env, int csrno)
> +{
> +    bool virt = riscv_cpu_virt_enabled(env);
> +    int index = csrno - CSR_SSTATEEN0;
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_smstateen) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (!(env->mstateen[index] & SMSTATEEN_STATEN)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (virt) {
> +        if (!(env->hstateen[index] & SMSTATEEN_STATEN)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +    }
> +
> +    return smode(env, csrno);
> +}
> +
>   /* Checks if PointerMasking registers could be accessed */
>   static RISCVException pointer_masking(CPURISCVState *env, int csrno)
>   {
> @@ -1699,6 +1761,263 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> +static inline void write_smstateen(CPURISCVState *env, uint64_t *reg,
> +                                   uint64_t wr_mask, uint64_t new_val)
> +{
> +    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
> +}
> +
> +static RISCVException read_mstateen(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val = env->mstateen[csrno - CSR_MSTATEEN0];
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mstateen(CPURISCVState *env, int csrno,
> +                                     uint64_t wr_mask, target_ulong new_val)
> +{
> +    uint64_t *reg;
> +
> +    reg = &env->mstateen[csrno - CSR_MSTATEEN0];
> +    write_smstateen(env, reg, wr_mask, new_val);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    uint64_t wr_mask = SMSTATEEN_STATEN;
> +
> +    return write_mstateen(env, csrno, wr_mask, new_val);
> +}
> +
> +static RISCVException write_mstateen1(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_mstateen(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException write_mstateen2(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_mstateen(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException write_mstateen3(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_mstateen(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
Mstateen1~3  can share the same write function currently. The same to 
h/sstateen1~3.
> +static RISCVException read_mstateenh(CPURISCVState *env, int csrno,
> +                                      target_ulong *val)
> +{
> +    *val = env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
> +                                      uint64_t wr_mask, target_ulong new_val)
> +{
> +    uint64_t *reg, val;
> +
> +    reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
> +    val = (uint64_t)new_val << 32;
> +    val |= *reg & 0xFFFFFFFF;
> +    write_smstateen(env, reg, wr_mask, val);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    uint64_t wr_mask = SMSTATEEN_STATEN;
> +
> +    return write_mstateenh(env, csrno, wr_mask, new_val);
> +}
> +
> +static RISCVException write_mstateen1h(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_mstateenh(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException write_mstateen2h(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_mstateenh(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException write_mstateen3h(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_mstateenh(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException read_hstateen(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    int index = csrno - CSR_HSTATEEN0;
> +
> +    *val = env->hstateen[index] & env->mstateen[index];
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_hstateen(CPURISCVState *env, int csrno,
> +                                     uint64_t mask, target_ulong new_val)
> +{
> +    int index = csrno - CSR_HSTATEEN0;
> +    uint64_t *reg, wr_mask;
> +
> +    reg = &env->hstateen[index];
> +    wr_mask = env->mstateen[index] & mask;
> +    write_smstateen(env, reg, wr_mask, new_val);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    uint64_t wr_mask = SMSTATEEN_STATEN;
> +
> +    return write_hstateen(env, csrno, wr_mask, new_val);
> +}
> +
> +static RISCVException write_hstateen1(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_hstateen(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException write_hstateen2(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_hstateen(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException write_hstateen3(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_hstateen(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException read_hstateenh(CPURISCVState *env, int csrno,
> +                                     target_ulong *val)
> +{
> +    int index = csrno - CSR_HSTATEEN0H;
> +
> +    *val = (env->hstateen[index] >> 32) & (env->mstateen[index] >> 32);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
> +                                      uint64_t mask, target_ulong new_val)
> +{
> +    int index = csrno - CSR_HSTATEEN0H;
> +    uint64_t *reg, wr_mask, val;
> +
> +    reg = &env->hstateen[index];
> +    val = (uint64_t)new_val << 32;
> +    val |= *reg & 0xFFFFFFFF;
> +    wr_mask = env->mstateen[index] & mask;
> +    write_smstateen(env, reg, wr_mask, val);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
> +                                       target_ulong new_val)
> +{
> +    uint64_t wr_mask = SMSTATEEN_STATEN;
> +
> +    return write_hstateenh(env, csrno, wr_mask, new_val);
> +}
> +
> +static RISCVException write_hstateen1h(CPURISCVState *env, int csrno,
> +                                       target_ulong new_val)
> +{
> +    return write_hstateenh(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException write_hstateen2h(CPURISCVState *env, int csrno,
> +                                       target_ulong new_val)
> +{
> +    return write_hstateenh(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException write_hstateen3h(CPURISCVState *env, int csrno,
> +                                       target_ulong new_val)
> +{
> +    return write_hstateenh(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException read_sstateen(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    bool virt = riscv_cpu_virt_enabled(env);
> +    int index = csrno - CSR_SSTATEEN0;
> +
> +    *val = env->sstateen[index] & env->mstateen[index];
> +    if (virt) {
> +        *val &= env->hstateen[index];
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_sstateen(CPURISCVState *env, int csrno,
> +                                     uint64_t mask, target_ulong new_val)
> +{
> +    bool virt = riscv_cpu_virt_enabled(env);
> +    int index = csrno - CSR_SSTATEEN0;
> +    uint64_t wr_mask;
> +    uint64_t *reg;
> +
> +    wr_mask = env->mstateen[index] & mask;
> +    if (virt) {
> +        wr_mask &= env->hstateen[index];
> +    }
> +
> +    reg = &env->sstateen[index];
> +    write_smstateen(env, reg, wr_mask, new_val);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    uint64_t wr_mask = SMSTATEEN_STATEN;
> +
> +    return write_sstateen(env, csrno, wr_mask, new_val);
> +}
> +
> +static RISCVException write_sstateen1(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_sstateen(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException write_sstateen2(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_sstateen(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
> +static RISCVException write_sstateen3(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_sstateen(env, csrno, SMSTATEEN_STATEN, new_val);
> +}
> +
>   static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>                                   uint64_t *ret_val,
>                                   uint64_t new_val, uint64_t wr_mask)
> @@ -3558,6 +3877,57 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
>                                             .min_priv_ver = PRIV_VERSION_1_12_0 },
>   
> +    /* Smstateen extension CSRs */
> +    [CSR_MSTATEEN0] = { "mstateen0", mstateen, read_mstateen, write_mstateen0,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },

The new lines have been updated to align with the last line in my 
previous patchset(accepted).

So it's better to make ' . ' align with ' " '.

Regards,

Weiwei Li

> +    [CSR_MSTATEEN0H] = { "mstateen0h", mstateen, read_mstateenh,
> +                          write_mstateen0h,
> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN1] = { "mstateen1", mstateen, read_mstateen, write_mstateen1,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN1H] = { "mstateen1h", mstateen, read_mstateenh,
> +                          write_mstateen1h,
> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN2] = { "mstateen2", mstateen, read_mstateen, write_mstateen2,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN2H] = { "mstateen2h", mstateen, read_mstateenh,
> +                          write_mstateen2h,
> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN3] = { "mstateen3", mstateen, read_mstateen, write_mstateen3,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN3H] = { "mstateen3h", mstateen, read_mstateenh,
> +                          write_mstateen3h,
> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +
> +    [CSR_HSTATEEN0] = { "hstateen0", hstateen, read_hstateen, write_hstateen0,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN0H] = { "hstateen0h", hstateenh, read_hstateenh,
> +                          write_hstateen0h,
> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN1] = { "hstateen1", hstateen, read_hstateen, write_hstateen1,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN1H] = { "hstateen1h", hstateenh, read_hstateenh,
> +                          write_hstateen1h,
> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN2] = { "hstateen2", hstateen, read_hstateen, write_hstateen2,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN2H] = { "hstateen2h", hstateenh, read_hstateenh,
> +                          write_hstateen2h,
> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN3] = { "hstateen3", hstateen, read_hstateen, write_hstateen3,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN3H] = { "hstateen3h", hstateenh, read_hstateenh,
> +                          write_hstateen3h,
> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +
> +    [CSR_SSTATEEN0] = { "sstateen0", sstateen, read_sstateen, write_sstateen0,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_SSTATEEN1] = { "sstateen1", sstateen, read_sstateen, write_sstateen1,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_SSTATEEN2] = { "sstateen2", sstateen, read_sstateen, write_sstateen2,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_SSTATEEN3] = { "sstateen3", sstateen, read_sstateen, write_sstateen3,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       /* Supervisor Trap Setup */
>       [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus, NULL,
>                                                 read_sstatus_i128                 },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index dc182ca811..ef418ac19d 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -262,6 +262,26 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
>       return 0;
>   }
>   
> +static bool smstateen_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +
> +    return cpu->cfg.ext_smstateen;
> +}
> +
> +static const VMStateDescription vmstate_smstateen = {
> +    .name = "cpu/smtateen",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = smstateen_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64_ARRAY(env.mstateen, RISCVCPU, 4),
> +        VMSTATE_UINT64_ARRAY(env.hstateen, RISCVCPU, 4),
> +        VMSTATE_UINT64_ARRAY(env.sstateen, RISCVCPU, 4),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static bool envcfg_needed(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
> @@ -372,6 +392,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           &vmstate_kvmtimer,
>           &vmstate_envcfg,
>           &vmstate_debug,
> +        &vmstate_smstateen,
>           NULL
>       }
>   };


