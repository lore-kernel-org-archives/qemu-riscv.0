Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8NyF-000488-6W
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jul 2022 11:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o8NyE-00046C-75; Mon, 04 Jul 2022 11:26:42 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:36750 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o8NyB-0002yH-7z; Mon, 04 Jul 2022 11:26:41 -0400
Received: from [192.168.0.138] (unknown [117.151.235.183])
 by APP-05 (Coremail) with SMTP id zQCowAA3WX6mBsNiI1BgCg--.57213S2;
 Mon, 04 Jul 2022 23:26:30 +0800 (CST)
Subject: Re: [PATCH v10 04/12] target/riscv: pmu: Make number of counters
 configurable
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-5-atishp@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <f9b33706-4630-1f9b-a190-29e64d630e0a@iscas.ac.cn>
Date: Mon, 4 Jul 2022 23:26:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220620231603.2547260-5-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAA3WX6mBsNiI1BgCg--.57213S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XF1rZr15ZrWfJr4xtF43ZFb_yoWfXrW3pr
 yDKFy7Gws7Jryvya93Cw1UGr9xZr1I9ayY93yfZw1Iyr48XrZ5XF1FgF4YyrW8GrWrZwn3
 XFyj9wn7Aa1kGFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUjdHUDUUUUU==
X-Originating-IP: [117.151.235.183]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 04 Jul 2022 15:26:42 -0000


在 2022/6/21 上午7:15, Atish Patra 写道:
> The RISC-V privilege specification provides flexibility to implement
> any number of counters from 29 programmable counters. However, the QEMU
> implements all the counters.
>
> Make it configurable through pmu config parameter which now will indicate
> how many programmable counters should be implemented by the cpu.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/cpu.c |  3 +-
>   target/riscv/cpu.h |  2 +-
>   target/riscv/csr.c | 94 ++++++++++++++++++++++++++++++----------------
>   3 files changed, 63 insertions(+), 36 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1b57b3c43980..d12c6dc630ca 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -851,7 +851,6 @@ static void riscv_cpu_init(Object *obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    cpu->cfg.ext_pmu = true;
>       cpu->cfg.ext_ifencei = true;
>       cpu->cfg.ext_icsr = true;
>       cpu->cfg.mmu = true;
> @@ -879,7 +878,7 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>       DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
>       DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
> -    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
> +    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),

I think It's better to add  a check on cfg.pmu_num to  <= 29.

>       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 252c30a55d78..ffee54ea5c27 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -397,7 +397,6 @@ struct RISCVCPUConfig {
>       bool ext_zksed;
>       bool ext_zksh;
>       bool ext_zkt;
> -    bool ext_pmu;
>       bool ext_ifencei;
>       bool ext_icsr;
>       bool ext_svinval;
> @@ -421,6 +420,7 @@ struct RISCVCPUConfig {
>       /* Vendor-specific custom extensions */
>       bool ext_XVentanaCondOps;
>   
> +    uint8_t pmu_num;
>       char *priv_spec;
>       char *user_spec;
>       char *bext_spec;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0ca05c77883c..b4a8e15f498f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -73,9 +73,17 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>       CPUState *cs = env_cpu(env);
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       int ctr_index;
> +    int base_csrno = CSR_HPMCOUNTER3;
> +    bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>   
> -    if (!cpu->cfg.ext_pmu) {
> -        /* The PMU extension is not enabled */
> +    if (rv32 && csrno >= CSR_CYCLEH) {
> +        /* Offset for RV32 hpmcounternh counters */
> +        base_csrno += 0x80;
> +    }
> +    ctr_index = csrno - base_csrno;
> +
> +    if (!cpu->cfg.pmu_num || ctr_index >= (cpu->cfg.pmu_num)) {
> +        /* No counter is enabled in PMU or the counter is out of range */

I seems unnecessary to add '!cpu->cfg.pmu_num ' here,   'ctr_index >= 
(cpu->cfg.pmu_num)' is true

when cpu->cfg.pmu_num is zero if the problem for base_csrno is fixed.

Ragards,

Weiwei Li

>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -103,7 +111,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>               }
>               break;
>           }
> -        if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        if (rv32) {
>               switch (csrno) {
>               case CSR_CYCLEH:
>                   if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> @@ -158,7 +166,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>               }
>               break;
>           }
> -        if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        if (rv32) {
>               switch (csrno) {
>               case CSR_CYCLEH:
>                   if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> @@ -202,6 +210,26 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
>   }
>   
>   #if !defined(CONFIG_USER_ONLY)
> +static RISCVException mctr(CPURISCVState *env, int csrno)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    int ctr_index;
> +    int base_csrno = CSR_MHPMCOUNTER3;
> +
> +    if ((riscv_cpu_mxl(env) == MXL_RV32) && csrno >= CSR_MCYCLEH) {
> +        /* Offset for RV32 mhpmcounternh counters */
> +        base_csrno += 0x80;
> +    }
> +    ctr_index = csrno - base_csrno;
> +    if (!cpu->cfg.pmu_num || ctr_index >= cpu->cfg.pmu_num) {
> +        /* The PMU is not enabled or counter is out of range*/
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>   static RISCVException any(CPURISCVState *env, int csrno)
>   {
>       return RISCV_EXCP_NONE;
> @@ -3687,35 +3715,35 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_zero },
>       [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_zero },
>   
> -    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   any,    read_zero },
> -    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   any,    read_zero },
> -    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   any,    read_zero },
> -    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   any,    read_zero },
> -    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   any,    read_zero },
> -    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   any,    read_zero },
> -    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   any,    read_zero },
> -    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  any,    read_zero },
> -    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  any,    read_zero },
> -    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  any,    read_zero },
> -    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  any,    read_zero },
> -    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  any,    read_zero },
> -    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  any,    read_zero },
> -    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  any,    read_zero },
> -    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  any,    read_zero },
> -    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  any,    read_zero },
> -    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  any,    read_zero },
> -    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  any,    read_zero },
> -    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  any,    read_zero },
> -    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  any,    read_zero },
> -    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  any,    read_zero },
> -    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  any,    read_zero },
> -    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  any,    read_zero },
> -    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  any,    read_zero },
> -    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  any,    read_zero },
> -    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  any,    read_zero },
> -    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  any,    read_zero },
> -    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  any,    read_zero },
> -    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  any,    read_zero },
> +    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
>   
>       [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
>       [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },


