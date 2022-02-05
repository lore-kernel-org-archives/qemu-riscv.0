Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nGIxm-0000mG-SE
	for mharc-qemu-riscv@gnu.org; Sat, 05 Feb 2022 06:10:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nGIxi-0000k3-1g; Sat, 05 Feb 2022 06:10:38 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:58954 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nGIxd-0000OO-2P; Sat, 05 Feb 2022 06:10:37 -0500
Received: from [192.168.0.107] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABHZ5gbW_5hLWhSAA--.58083S2;
 Sat, 05 Feb 2022 19:10:20 +0800 (CST)
Subject: Re: [PATCH v2 5/6] target/riscv: Add *envcfg* CSRs support
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220205003605.1150143-1-atishp@rivosinc.com>
 <20220205003605.1150143-6-atishp@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <10ffc711-1685-9df9-f620-0e6c70039036@iscas.ac.cn>
Date: Sat, 5 Feb 2022 19:10:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220205003605.1150143-6-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowABHZ5gbW_5hLWhSAA--.58083S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XFy8Zw4xXw4rCr15Jw4xWFg_yoW3Wry7pF
 15WFy3G397tFyIqan3Gry5WF13Aw4xGanxWws7u395tFWrJ3yrGFnFgrsxJrW8Wa95Gr10
 qa1DCw13Crs7Za7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkmb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
 1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
 64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
 0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2YiiDUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 05 Feb 2022 11:10:38 -0000


在 2022/2/5 上午8:36, Atish Patra 写道:
> The RISC-V privileged specification v1.12 defines few execution
> environment configuration CSRs that can be used enable/disable
> extensions per privilege levels.
>
> Add the basic support for these CSRs.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/cpu.h      |  6 +++
>   target/riscv/cpu_bits.h | 39 ++++++++++++++++++
>   target/riscv/csr.c      | 87 +++++++++++++++++++++++++++++++++++++++++
>   target/riscv/machine.c  | 24 ++++++++++++
>   4 files changed, 156 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0741f9822cf0..675f8716b239 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -303,6 +303,12 @@ struct CPURISCVState {
>       target_ulong spmbase;
>       target_ulong upmmask;
>       target_ulong upmbase;
> +
> +    /* CSRs for execution enviornment configuration */
> +
> +    uint64_t menvcfg;
> +    target_ulong senvcfg;
> +    uint64_t henvcfg;
>   #endif
>   
>       float_status fp_status;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 89440241632a..58a0a8d69f72 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -202,6 +202,9 @@
>   #define CSR_STVEC           0x105
>   #define CSR_SCOUNTEREN      0x106
>   
> +/* Supervisor Configuration CSRs */
> +#define CSR_SENVCFG         0x10A
> +
>   /* Supervisor Trap Handling */
>   #define CSR_SSCRATCH        0x140
>   #define CSR_SEPC            0x141
> @@ -247,6 +250,10 @@
>   #define CSR_HTIMEDELTA      0x605
>   #define CSR_HTIMEDELTAH     0x615
>   
> +/* Hypervisor Configuration CSRs */
> +#define CSR_HENVCFG         0x60A
> +#define CSR_HENVCFGH        0x61A
> +
>   /* Virtual CSRs */
>   #define CSR_VSSTATUS        0x200
>   #define CSR_VSIE            0x204
> @@ -290,6 +297,10 @@
>   #define CSR_VSIEH           0x214
>   #define CSR_VSIPH           0x254
>   
> +/* Machine Configuration CSRs */
> +#define CSR_MENVCFG         0x30A
> +#define CSR_MENVCFGH        0x31A
> +
>   /* Enhanced Physical Memory Protection (ePMP) */
>   #define CSR_MSECCFG         0x747
>   #define CSR_MSECCFGH        0x757
> @@ -654,6 +665,34 @@ typedef enum RISCVException {
>   #define PM_EXT_CLEAN    0x00000002ULL
>   #define PM_EXT_DIRTY    0x00000003ULL
>   
> +/* Execution enviornment configuration bits */
> +#define MENVCFG_FIOM                       BIT(0)
> +#define MENVCFG_CBIE                       (3UL << 4)
> +#define MENVCFG_CBCFE                      BIT(6)
> +#define MENVCFG_CBZE                       BIT(7)
> +#define MENVCFG_PBMTE                      BIT(62)
> +#define MENVCFG_STCE                       BIT(63)
> +
> +/* For RV32 */
> +#define MENVCFGH_PBMTE                     BIT(30)
> +#define MENVCFGH_STCE                      BIT(31)
> +
> +#define SENVCFG_FIOM                       MENVCFG_FIOM
> +#define SENVCFG_CBIE                       MENVCFG_CBIE
> +#define SENVCFG_CBCFE                      MENVCFG_CBCFE
> +#define SENVCFG_CBZE                       MENVCFG_CBZE
> +
> +#define HENVCFG_FIOM                       MENVCFG_FIOM
> +#define HENVCFG_CBIE                       MENVCFG_CBIE
> +#define HENVCFG_CBCFE                      MENVCFG_CBCFE
> +#define HENVCFG_CBZE                       MENVCFG_CBZE
> +#define HENVCFG_PBMTE                      MENVCFG_PBMTE
> +#define HENVCFG_STCE                       MENVCFG_STCE
> +
> +/* For RV32 */
> +#define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
> +#define HENVCFGH_STCE                       MENVCFGH_STCE
> +
>   /* Offsets for every pair of control bits per each priv level */
>   #define XS_OFFSET    0ULL
>   #define U_OFFSET     2ULL
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4366e5e95ce8..88c839a5ffaa 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1366,6 +1366,81 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> +/* Execution environment configuration setup */
> +static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    *val = env->menvcfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    env->menvcfg = val;
> +    return RISCV_EXCP_NONE;
> +}
> +

I think mask write to ignore the reserved fields  is better here.

The same to other  *envcfg* csrs.

> +static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    *val = env->menvcfg >> 32;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    uint64_t valh = (uint64_t)val << 32;
> +    env->menvcfg |= valh;
> +

The original high32 of menvcfg should be cleared before ' | ' valh.

Similar for henvcfgh.

Regards,

Weiwei Li

> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    *val = env->senvcfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    env->senvcfg = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    *val = env->henvcfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    env->henvcfg = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    *val = env->henvcfg >> 32;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    uint64_t valh = (uint64_t)val << 32;
> +    env->henvcfg |= valh;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>   static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>                                   uint64_t *ret_val,
>                                   uint64_t new_val, uint64_t wr_mask)
> @@ -3069,6 +3144,18 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_MVIPH]    = { "mviph",    aia_any32, read_zero,  write_ignore },
>       [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
>   
> +    /* Execution environment configuration */
> +    [CSR_MENVCFG]  = { "menvcfg",  any,   read_menvcfg,  write_menvcfg,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MENVCFGH] = { "menvcfgh", any32, read_menvcfgh, write_menvcfgh,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_SENVCFG]  = { "senvcfg",  smode, read_senvcfg,  write_senvcfg,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HENVCFG]  = { "henvcfg",  hmode, read_henvcfg, write_henvcfg,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +
>       /* Supervisor Trap Setup */
>       [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus, NULL,
>                                                 read_sstatus_i128                 },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 9895930b2976..4a50a05937fa 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -220,6 +220,29 @@ static const VMStateDescription vmstate_kvmtimer = {
>       }
>   };
>   
> +/* TODO: henvcfg need both hyper_needed & envcfg_needed */
> +static bool envcfg_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    return (env->priv_ver >= PRIV_VERSION_1_12_0 ? 1 : 0);
> +}
> +
> +static const VMStateDescription vmstate_envcfg = {
> +    .name = "cpu/envcfg",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = envcfg_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(env.menvcfg, RISCVCPU),
> +        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
> +        VMSTATE_UINT64(env.henvcfg, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
>       .version_id = 3,
> @@ -280,6 +303,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           &vmstate_pointermasking,
>           &vmstate_rv128,
>           &vmstate_kvmtimer,
> +        &vmstate_envcfg,
>           NULL
>       }
>   };


