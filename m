Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8dkC-00056A-KC
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 04:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o8dk4-00052k-8S; Tue, 05 Jul 2022 04:17:13 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:59616 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o8dk0-0001ZL-Ki; Tue, 05 Jul 2022 04:17:07 -0400
Received: from [192.168.0.138] (unknown [117.151.235.252])
 by APP-01 (Coremail) with SMTP id qwCowADX3w9188NiwUNzDA--.2552S2;
 Tue, 05 Jul 2022 16:16:54 +0800 (CST)
Subject: Re: [PATCH v10 04/12] target/riscv: pmu: Make number of counters
 configurable
To: Atish Kumar Patra <atishp@rivosinc.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-5-atishp@rivosinc.com>
 <f9b33706-4630-1f9b-a190-29e64d630e0a@iscas.ac.cn>
 <be29c8d6-9099-70cf-6a7c-d1ab0dba066d@iscas.ac.cn>
 <CAHBxVyF7GfA+Mk=nA9Lss76xAQ5YdwLkvN=g+bxKjFe9JyatKw@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <f4e87280-54bd-34dc-4c94-358146af8f20@iscas.ac.cn>
Date: Tue, 5 Jul 2022 16:16:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHBxVyF7GfA+Mk=nA9Lss76xAQ5YdwLkvN=g+bxKjFe9JyatKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowADX3w9188NiwUNzDA--.2552S2
X-Coremail-Antispam: 1UD129KBjvJXoWfJw13ZrW5GFWDZr1xtF45GFg_yoWDXryfpr
 yDKFy7Gan7Jry0kFsayw1UKr9Ivr1xKaya93yfZ3Z2yr1kWrs5XF1rWF15ArW8Gr4rZ3Za
 qryY93Z3C3W0kFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoO
 J5UUUUU
X-Originating-IP: [117.151.235.252]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 05 Jul 2022 08:17:13 -0000


在 2022/7/5 下午3:51, Atish Kumar Patra 写道:
> On Mon, Jul 4, 2022 at 5:38 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>
>> 在 2022/7/4 下午11:26, Weiwei Li 写道:
>>> 在 2022/6/21 上午7:15, Atish Patra 写道:
>>>> The RISC-V privilege specification provides flexibility to implement
>>>> any number of counters from 29 programmable counters. However, the QEMU
>>>> implements all the counters.
>>>>
>>>> Make it configurable through pmu config parameter which now will
>>>> indicate
>>>> how many programmable counters should be implemented by the cpu.
>>>>
>>>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>>> ---
>>>>    target/riscv/cpu.c |  3 +-
>>>>    target/riscv/cpu.h |  2 +-
>>>>    target/riscv/csr.c | 94 ++++++++++++++++++++++++++++++----------------
>>>>    3 files changed, 63 insertions(+), 36 deletions(-)
>>>>
>>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>>> index 1b57b3c43980..d12c6dc630ca 100644
>>>> --- a/target/riscv/cpu.c
>>>> +++ b/target/riscv/cpu.c
>>>> @@ -851,7 +851,6 @@ static void riscv_cpu_init(Object *obj)
>>>>    {
>>>>        RISCVCPU *cpu = RISCV_CPU(obj);
>>>>    -    cpu->cfg.ext_pmu = true;
>>>>        cpu->cfg.ext_ifencei = true;
>>>>        cpu->cfg.ext_icsr = true;
>>>>        cpu->cfg.mmu = true;
>>>> @@ -879,7 +878,7 @@ static Property riscv_cpu_extensions[] = {
>>>>        DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>>>>        DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
>>>>        DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
>>>> -    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
>>>> +    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>>> I think It's better to add  a check on cfg.pmu_num to  <= 29.
>>>
>> OK, I find this check in the following patch.
>>>>        DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>>>>        DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>>>>        DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>> index 252c30a55d78..ffee54ea5c27 100644
>>>> --- a/target/riscv/cpu.h
>>>> +++ b/target/riscv/cpu.h
>>>> @@ -397,7 +397,6 @@ struct RISCVCPUConfig {
>>>>        bool ext_zksed;
>>>>        bool ext_zksh;
>>>>        bool ext_zkt;
>>>> -    bool ext_pmu;
>>>>        bool ext_ifencei;
>>>>        bool ext_icsr;
>>>>        bool ext_svinval;
>>>> @@ -421,6 +420,7 @@ struct RISCVCPUConfig {
>>>>        /* Vendor-specific custom extensions */
>>>>        bool ext_XVentanaCondOps;
>>>>    +    uint8_t pmu_num;
>>>>        char *priv_spec;
>>>>        char *user_spec;
>>>>        char *bext_spec;
>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>> index 0ca05c77883c..b4a8e15f498f 100644
>>>> --- a/target/riscv/csr.c
>>>> +++ b/target/riscv/csr.c
>>>> @@ -73,9 +73,17 @@ static RISCVException ctr(CPURISCVState *env, int
>>>> csrno)
>>>>        CPUState *cs = env_cpu(env);
>>>>        RISCVCPU *cpu = RISCV_CPU(cs);
>>>>        int ctr_index;
>>>> +    int base_csrno = CSR_HPMCOUNTER3;
>>>> +    bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>>>>    -    if (!cpu->cfg.ext_pmu) {
>>>> -        /* The PMU extension is not enabled */
>>>> +    if (rv32 && csrno >= CSR_CYCLEH) {
>>>> +        /* Offset for RV32 hpmcounternh counters */
>>>> +        base_csrno += 0x80;
>>>> +    }
>>>> +    ctr_index = csrno - base_csrno;
>>>> +
>>>> +    if (!cpu->cfg.pmu_num || ctr_index >= (cpu->cfg.pmu_num)) {
>>>> +        /* No counter is enabled in PMU or the counter is out of
>>>> range */
>>> I seems unnecessary to add '!cpu->cfg.pmu_num ' here, 'ctr_index >=
>>> (cpu->cfg.pmu_num)' is true
> The check is improved in the following patches as well.
>
Do you mean 'if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & 
ctr_mask)))'  in patch 9 ?

In this condition, '!cpu->cfg.pmu_num' seems unnecessary too.

Regards,

Weiwei Li

>> Typo.  I -> It
>>> when cpu->cfg.pmu_num is zero if the problem for base_csrno is fixed.
>>>
>>> Ragards,
>>>
>>> Weiwei Li
>>>
>>>>            return RISCV_EXCP_ILLEGAL_INST;
>>>>        }
>>>>    @@ -103,7 +111,7 @@ static RISCVException ctr(CPURISCVState *env,
>>>> int csrno)
>>>>                }
>>>>                break;
>>>>            }
>>>> -        if (riscv_cpu_mxl(env) == MXL_RV32) {
>>>> +        if (rv32) {
>>>>                switch (csrno) {
>>>>                case CSR_CYCLEH:
>>>>                    if (!get_field(env->mcounteren, COUNTEREN_CY)) {
>>>> @@ -158,7 +166,7 @@ static RISCVException ctr(CPURISCVState *env, int
>>>> csrno)
>>>>                }
>>>>                break;
>>>>            }
>>>> -        if (riscv_cpu_mxl(env) == MXL_RV32) {
>>>> +        if (rv32) {
>>>>                switch (csrno) {
>>>>                case CSR_CYCLEH:
>>>>                    if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>>>> @@ -202,6 +210,26 @@ static RISCVException ctr32(CPURISCVState *env,
>>>> int csrno)
>>>>    }
>>>>      #if !defined(CONFIG_USER_ONLY)
>>>> +static RISCVException mctr(CPURISCVState *env, int csrno)
>>>> +{
>>>> +    CPUState *cs = env_cpu(env);
>>>> +    RISCVCPU *cpu = RISCV_CPU(cs);
>>>> +    int ctr_index;
>>>> +    int base_csrno = CSR_MHPMCOUNTER3;
>>>> +
>>>> +    if ((riscv_cpu_mxl(env) == MXL_RV32) && csrno >= CSR_MCYCLEH) {
>>>> +        /* Offset for RV32 mhpmcounternh counters */
>>>> +        base_csrno += 0x80;
>>>> +    }
>>>> +    ctr_index = csrno - base_csrno;
>>>> +    if (!cpu->cfg.pmu_num || ctr_index >= cpu->cfg.pmu_num) {
>>>> +        /* The PMU is not enabled or counter is out of range*/
>>>> +        return RISCV_EXCP_ILLEGAL_INST;
>>>> +    }
>>>> +
>>>> +    return RISCV_EXCP_NONE;
>>>> +}
>>>> +
>>>>    static RISCVException any(CPURISCVState *env, int csrno)
>>>>    {
>>>>        return RISCV_EXCP_NONE;
>>>> @@ -3687,35 +3715,35 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>>>        [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr, read_zero },
>>>>        [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr, read_zero },
>>>>    -    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   any, read_zero },
>>>> -    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   any, read_zero },
>>>> -    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   any, read_zero },
>>>> -    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   any, read_zero },
>>>> -    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   any, read_zero },
>>>> -    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   any, read_zero },
>>>> -    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   any, read_zero },
>>>> -    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  any, read_zero },
>>>> -    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  any, read_zero },
>>>> +    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr, read_zero },
>>>> +    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr, read_zero },
>>>>          [CSR_MHPMEVENT3]     = { "mhpmevent3",     any, read_zero },
>>>>        [CSR_MHPMEVENT4]     = { "mhpmevent4",     any, read_zero },


