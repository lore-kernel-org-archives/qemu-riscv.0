Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCdnw-0000k8-LG
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jan 2022 03:37:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nCdnu-0000eh-Hy; Wed, 26 Jan 2022 03:37:22 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:41622 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nCdnr-00021W-3q; Wed, 26 Jan 2022 03:37:22 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAA3JkE2CPFh5V8AAA--.1543S2;
 Wed, 26 Jan 2022 16:37:11 +0800 (CST)
Subject: Re: [RFC 4/5] target/riscv: Add *envcfg* CSRs support
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20220120200735.2739543-1-atishp@rivosinc.com>
 <20220120200735.2739543-5-atishp@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <91dbc7a1-f23f-709b-82e8-10e4c96e4482@iscas.ac.cn>
Date: Wed, 26 Jan 2022 16:37:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220120200735.2739543-5-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAA3JkE2CPFh5V8AAA--.1543S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gry7ur4kCrW5WrWkJr4xZwb_yoW3Gw4kpF
 1UuF98G3yvqFyIq3Z3Kry5WF13Aw1xGa9xZws7C395tF45J3yrGFnFgrsxJrW8Wa95Gr1j
 va1qkr13Cr4DZa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1U
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 26 Jan 2022 08:37:22 -0000


在 2022/1/21 上午4:07, Atish Patra 写道:
> The RISC-V privileged specification v1.12 defines few execution
> environment configuration CSRs that can be used enable/disable
> extensions per privilege levels.
>
> Add the basic support for these CSRs.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/cpu.h      |  8 ++++
>   target/riscv/cpu_bits.h | 31 +++++++++++++++
>   target/riscv/csr.c      | 84 +++++++++++++++++++++++++++++++++++++++++
>   target/riscv/machine.c  | 26 +++++++++++++
>   4 files changed, 149 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7f87917204c5..b9462300a472 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -264,6 +264,14 @@ struct CPURISCVState {
>       target_ulong spmbase;
>       target_ulong upmmask;
>       target_ulong upmbase;
> +
> +    /* CSRs for execution enviornment configuration */
> +
> +    target_ulong menvcfg;
> +    target_ulong menvcfgh;

I think we needn't maintain seperate menvcfg and menvcfgh, just use 
"uint64_t menvcfg" as the way of mstatus.

Similar to  henvcfg and henvcfg.

> +    target_ulong senvcfg;
> +    target_ulong henvcfg;
> +    target_ulong henvcfgh;
>   #endif
>   
>       float_status fp_status;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index f6f90b5cbd52..afb237c2313b 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -177,6 +177,9 @@
>   #define CSR_STVEC           0x105
>   #define CSR_SCOUNTEREN      0x106
>   
> +/* Supervisor Configuration CSRs */
> +#define CSR_SENVCFG         0x10A
> +
>   /* Supervisor Trap Handling */
>   #define CSR_SSCRATCH        0x140
>   #define CSR_SEPC            0x141
> @@ -204,6 +207,10 @@
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
> @@ -218,6 +225,10 @@
>   #define CSR_MTINST          0x34a
>   #define CSR_MTVAL2          0x34b
>   
> +/* Machine Configuration CSRs */
> +#define CSR_MENVCFG         0x30A
> +#define CSR_MENVCFGH        0x31A
> +
>   /* Enhanced Physical Memory Protection (ePMP) */
>   #define CSR_MSECCFG         0x747
>   #define CSR_MSECCFGH        0x757
> @@ -578,6 +589,26 @@ typedef enum RISCVException {
>   #define PM_EXT_CLEAN    0x00000002ULL
>   #define PM_EXT_DIRTY    0x00000003ULL
>   
> +/* Execution enviornment configuration bits */
> +#define MENVCFG_FIOM                       (1 << 0)
> +#define MENVCFG_CBE                        0x30000ULL
> +#define MENVCFG_CBCFE                      (1 << 6)
> +#define MENVCFG_CBZE                       (1 << 7)
> +#define MENVCFG_PBMTE                      (1 << 62)
> +#define MENVCFG_STCE                       (1 << 63)
> +
> +#define SENVCFG_FIOM                       MENVCFG_FIOM
> +#define SENVCFG_CBE                        MENVCFG_CBE
> +#define SENVCFG_CBCFE                      MENVCFG_CBCFE
> +#define SENVCFG_CBZE                       MENVCFG_CBZE
> +
> +#define HENVCFG_FIOM                       MENVCFG_FIOM
> +#define HENVCFG_CBE                        MENVCFG_CBE
> +#define HENVCFG_CBCFE                      MENVCFG_CBCFE
> +#define HENVCFG_CBZE                       MENVCFG_CBZE
> +#define HENVCFG_PBMTE                      MENVCFG_PBMTE
> +#define HENVCFG_STCE                       MENVCFG_STCE
> +
>   /* Offsets for every pair of control bits per each priv level */
>   #define XS_OFFSET    0ULL
>   #define U_OFFSET     2ULL
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e66bf2201857..a4bbae7a1bbd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -853,6 +853,77 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
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
> +static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    *val = env->menvcfgh;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    env->menvcfgh = val;
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
> +    *val = env->henvcfgh;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    env->henvcfgh = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
>   static RISCVException rmw_mip(CPURISCVState *env, int csrno,
>                                 target_ulong *ret_value,
>                                 target_ulong new_value, target_ulong write_mask)
> @@ -2054,6 +2125,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
>       [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
>   
> +    /* Execution environment configuration */
> +    [CSR_MENVCFG]  = { "menvcfg",  any,     read_menvcfg,  write_menvcfg, NULL,
> +                                            NULL, NULL, PRIV_VERSION_1_12_0},
> +    [CSR_MENVCFGH] = { "menvcfgh", any32,   read_menvcfgh, write_menvcfgh, NULL,
> +                                            NULL, NULL, PRIV_VERSION_1_12_0},
> +    [CSR_SENVCFG]  = { "senvcfg",  smode,   read_senvcfg,  write_senvcfg, NULL,
> +                                            NULL, NULL, PRIV_VERSION_1_12_0},
> +    [CSR_HENVCFG]  = { "henvcfg",  hmode,   read_henvcfg, write_henvcfg, NULL,
> +                                            NULL, NULL, PRIV_VERSION_1_12_0},
> +    [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh, NULL,
> +                                            NULL, NULL, PRIV_VERSION_1_12_0},
> +
> +
Two new lines here.
>       /* Supervisor Trap Setup */
>       [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus, NULL,
>                                                 read_sstatus_i128                 },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 13b9ab375b95..59479a999b87 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -185,6 +185,31 @@ static const VMStateDescription vmstate_rv128 = {
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
> +        VMSTATE_UINTTL(env.menvcfg, RISCVCPU),
> +        VMSTATE_UINTTL(env.menvcfgh, RISCVCPU),
> +        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
> +        VMSTATE_UINTTL(env.henvcfg, RISCVCPU),
> +        VMSTATE_UINTTL(env.henvcfgh, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
>       .version_id = 3,
> @@ -240,6 +265,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           &vmstate_vector,
>           &vmstate_pointermasking,
>           &vmstate_rv128,
> +        &vmstate_envcfg,
>           NULL
>       }
>   };

Regards,

Weiwei Li


