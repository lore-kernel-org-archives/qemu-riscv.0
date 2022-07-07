Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o9bBB-00049l-69
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jul 2022 19:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o9bB9-00049S-QQ; Thu, 07 Jul 2022 19:45:03 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:44330 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o9bB6-0002LR-CY; Thu, 07 Jul 2022 19:45:03 -0400
Received: from [192.168.0.104] (unknown [117.151.235.252])
 by APP-01 (Coremail) with SMTP id qwCowACnPVryb8diGqCYDQ--.18284S2;
 Fri, 08 Jul 2022 07:44:50 +0800 (CST)
Subject: Re: [RFC PATCH v5 1/4] target/riscv: Add smstateen support
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
 <20220603160425.3667456-2-mchitale@ventanamicro.com>
 <43569e92.214c.181be6c8e52.Coremail.angell1518@163.com>
 <746ba0e1f67cafde5fae05725ccef0587de67ad3.camel@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <fb974b62-030d-5244-f3ce-21c23900a4bf@iscas.ac.cn>
Date: Fri, 8 Jul 2022 07:44:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <746ba0e1f67cafde5fae05725ccef0587de67ad3.camel@ventanamicro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowACnPVryb8diGqCYDQ--.18284S2
X-Coremail-Antispam: 1UD129KBjvAXoW3KFWDWryfZF1xXFWruFyrtFb_yoW8XFW8Go
 Wrtr1fArs3KryjyFnF93y2qr4SqFs5tr4kZayfCrsrKF1Syr4jkr48KrWfAF4rGrWSgr4U
 Aa48JFyUZF18W3W3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYD7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
 W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyU
 JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x0JU2LvtUUUUU=
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
X-List-Received-Date: Thu, 07 Jul 2022 23:45:04 -0000


在 2022/7/8 上午12:53, Mayuresh Chitale 写道:
> On Sat, 2022-07-02 at 18:19 +0800, angell1518 wrote:
>> At 2022-06-04 00:04:22, "Mayuresh Chitale" <mchitale@ventanamicro.com
>>> wrote:
>>> Smstateen extension specifies a mechanism to close
>>> the potential covert channels that could cause security issues.
>>>
>>> This patch adds the CSRs defined in the specification and
>>> the corresponding predicates and read/write functions.
>>>
>>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>>> ---
>>> target/riscv/cpu.c      |   2 +
>>> target/riscv/cpu.h      |   4 +
>>> target/riscv/cpu_bits.h |  36 +++++++
>>> target/riscv/csr.c      | 210
>> ++++++++++++++++++++++++++++++++++++++++
>>> target/riscv/machine.c  |  21 ++++
>>> 5 files changed, 273 insertions(+)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index e6e878ceb3..2d65ccd90f 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -913,6 +913,7 @@ static Property riscv_cpu_properties[] = {
>>>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>>>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>>>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>>> +    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen,
>> false),
>>>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>>>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>>> @@ -1104,6 +1105,7 @@ static void riscv_isa_string_ext(RISCVCPU
>> *cpu, char **isa_str, int max_str_len)
>>>          ISA_EDATA_ENTRY(zve64f, ext_zve64f),
>>>          ISA_EDATA_ENTRY(zhinx, ext_zhinx),
>>>          ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
>>> +        ISA_EDATA_ENTRY(smstateen, ext_smstateen),
>>>          ISA_EDATA_ENTRY(svinval, ext_svinval),
>>>          ISA_EDATA_ENTRY(svnapot, ext_svnapot),
>>>          ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> index f08c3e8813..1c269b77bd 100644
>>> --- a/target/riscv/cpu.h
>>> +++ b/target/riscv/cpu.h
>>> @@ -327,6 +327,9 @@ struct CPUArchState {
>>>
>>>      /* CSRs for execution enviornment configuration */
>>>      uint64_t menvcfg;
>>> +    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
>>> +    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
>>> +    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
>>>      target_ulong senvcfg;
>>>      uint64_t henvcfg;
>>> #endif
>>> @@ -411,6 +414,7 @@ struct RISCVCPUConfig {
>>>      bool ext_zhinxmin;
>>>      bool ext_zve32f;
>>>      bool ext_zve64f;
>>> +    bool ext_smstateen;
>>>
>>>      uint32_t mvendorid;
>>>      uint64_t marchid;
>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>> index 4a55c6a709..2a3ef26d21 100644
>>> --- a/target/riscv/cpu_bits.h
>>> +++ b/target/riscv/cpu_bits.h
>>> @@ -208,6 +208,12 @@
>>> /* Supervisor Configuration CSRs */
>>> #define CSR_SENVCFG         0x10A
>>>
>>> +/* Supervisor state CSRs */
>>> +#define CSR_SSTATEEN0       0x10C
>>> +#define CSR_SSTATEEN1       0x10D
>>> +#define CSR_SSTATEEN2       0x10E
>>> +#define CSR_SSTATEEN3       0x10F
>>> +
>>> /* Supervisor Trap Handling */
>>> #define CSR_SSCRATCH        0x140
>>> #define CSR_SEPC            0x141
>>> @@ -257,6 +263,16 @@
>>> #define CSR_HENVCFG         0x60A
>>> #define CSR_HENVCFGH        0x61A
>>>
>>> +/* Hypervisor state CSRs */
>>> +#define CSR_HSTATEEN0       0x60C
>>> +#define CSR_HSTATEEN0H      0x61C
>>> +#define CSR_HSTATEEN1       0x60D
>>> +#define CSR_HSTATEEN1H      0x61D
>>> +#define CSR_HSTATEEN2       0x60E
>>> +#define CSR_HSTATEEN2H      0x61E
>>> +#define CSR_HSTATEEN3       0x60F
>>> +#define CSR_HSTATEEN3H      0x61F
>>> +
>>> /* Virtual CSRs */
>>> #define CSR_VSSTATUS        0x200
>>> #define CSR_VSIE            0x204
>>> @@ -304,6 +320,26 @@
>>> #define CSR_MENVCFG         0x30A
>>> #define CSR_MENVCFGH        0x31A
>>>
>>> +/* Machine state CSRs */
>>> +#define CSR_MSTATEEN0       0x30C
>>> +#define CSR_MSTATEEN0H      0x31C
>>> +#define CSR_MSTATEEN1       0x30D
>>> +#define CSR_MSTATEEN1H      0x31D
>>> +#define CSR_MSTATEEN2       0x30E
>>> +#define CSR_MSTATEEN2H      0x31E
>>> +#define CSR_MSTATEEN3       0x30F
>>> +#define CSR_MSTATEEN3H      0x31F
>>> +
>>> +/* Common defines for all smstateen */
>>> +#define SMSTATEEN_MAX_COUNT 4
>>> +#define SMSTATEEN0_CS       0
>>> +#define SMSTATEEN0_FCSR     0
>>> +#define SMSTATEEN0_IMSIC    58
>>> +#define SMSTATEEN0_AIA      59
>>> +#define SMSTATEEN0_SVSLCT   60
>>> +#define SMSTATEEN0_HSENVCFG 62
>>> +#define SMSTATEEN_STATEN    63
>>> +
>>> /* Enhanced Physical Memory Protection (ePMP) */
>>> #define CSR_MSECCFG         0x747
>>> #define CSR_MSECCFGH        0x757
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index 409a209f14..324fefce59 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.c
>>> @@ -247,6 +247,42 @@ static RISCVException hmode32(CPURISCVState
>> *env, int csrno)
>>> }
>>>
>>> +static RISCVException mstateen(CPURISCVState *env, int csrno)
>>> +{
>>> +    CPUState *cs = env_cpu(env);
>>> +    RISCVCPU *cpu = RISCV_CPU(cs);
>>> +
>>> +    if (!cpu->cfg.ext_smstateen) {
>>> +        return RISCV_EXCP_ILLEGAL_INST;
>>> +    }
>>> +
>>> +    return any(env, csrno);
>>> +}
>>> +
>>> +static RISCVException hstateen(CPURISCVState *env, int csrno)
>>> +{
>>> +    CPUState *cs = env_cpu(env);
>>> +    RISCVCPU *cpu = RISCV_CPU(cs);
>>> +
>>> +    if (!cpu->cfg.ext_smstateen) {
>>> +        return RISCV_EXCP_ILLEGAL_INST;
>>> +    }
>>> +
>>> +    return hmode(env, csrno);
>>> +}
>>> +
>> I think we should take the stateen bit(bit 63) for matching mstateen
>> into consideration here.
>> Similar to following sstateen function.
> ok.
>
>>> +static RISCVException sstateen(CPURISCVState *env, int csrno)
>>> +{
>>> +    CPUState *cs = env_cpu(env);
>>> +    RISCVCPU *cpu = RISCV_CPU(cs);
>>> +
>>> +    if (!cpu->cfg.ext_smstateen) {
>>> +        return RISCV_EXCP_ILLEGAL_INST;
>>> +    }
>>> +
>>> +    return smode(env, csrno);
>>> +}
>>> +
>>> /* Checks if PointerMasking registers could be accessed */
>>> static RISCVException pointer_masking(CPURISCVState *env, int
>> csrno)
>>> {
>>> @@ -1574,6 +1610,129 @@ static RISCVException
>> write_henvcfgh(CPURISCVState *env, int csrno,
>>>      return RISCV_EXCP_NONE;
>>> }
>>>
>>> +static inline void write_smstateen(CPURISCVState *env, uint64_t
>> *reg,
>>> +                                   uint64_t wr_mask, uint64_t
>> new_val)
>>> +{
>>> +    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
>>> +}
>>> +
>>> +static RISCVException read_mstateen(CPURISCVState *env, int csrno,
>>> +                                    target_ulong *val)
>>> +{
>>> +    *val = env->mstateen[csrno - CSR_MSTATEEN0];
>>> +
>>> +    return RISCV_EXCP_NONE;
>>> +}
>>> +
>>> +static RISCVException write_mstateen(CPURISCVState *env, int csrno,
>>> +                                     target_ulong new_val)
>>> +{
>>> +    uint64_t *reg;
>>> +    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
>>> +
>>> +    reg = &env->mstateen[csrno - CSR_MSTATEEN0];
>>> +    write_smstateen(env, reg, wr_mask, new_val);
>>> +
>>> +    return RISCV_EXCP_NONE;
>>> +}
>>> +
>>> +static RISCVException read_mstateenh(CPURISCVState *env, int csrno,
>>> +                                     target_ulong *val)
>>> +{
>>> +    *val = env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
>>> +
>>> +    return RISCV_EXCP_NONE;
>>> +}
>>> +
>>> +static RISCVException write_mstateenh(CPURISCVState *env, int
>> csrno,
>>> +                                      target_ulong new_val)
>>> +{
>>> +    uint64_t *reg;
>>> +    uint64_t val;
>>> +    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
>>> +
>>> +    reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
>>> +    val = (uint64_t)new_val << 32;
>>> +    val |= *reg & 0xFFFFFFFF;
>>> +    write_smstateen(env, reg, wr_mask, val);
>>> +
>>> +    return RISCV_EXCP_NONE;
>>> +}
>>> +
>>> +static RISCVException read_hstateen(CPURISCVState *env, int csrno,
>>> +                                    target_ulong *val)
>>> +{
>>> +    *val = env->hstateen[csrno - CSR_HSTATEEN0];
>>> +
>>> +    return RISCV_EXCP_NONE;
>>> +}
>>> +
>> I think we should also take mstateen into consideration here just
>> like the following write function.
>> As the spec said, If we set certain bit in the matching mstateen csr
>> to zero, the same bit in hstateen should be read-only zero.
>> However, writes to mstateen will not affect the value in matching
>> hstateen directly in current implementation,
>> so if we read hstateen just immediately after write zero to certain
>> bit of mstateen, the same bit  read from hstateen may not be zero.
> I need to check this but as per my understanding this it is the
> responsibility of the software to clear the corresponding
> hstateen/stateen bits.

I have sent a issue for how the hstateen/sstateen become read-only zero  
for zero bits in mstateen:

https://github.com/riscv/riscv-state-enable/issues/9

Regards,

Weiwei Li

>> similar to read function of sstateen.
>>> +static RISCVException write_hstateen(CPURISCVState *env, int csrno,
>>> +                                     target_ulong new_val)
>>> +{
>>> +    uint64_t *reg;
>>> +    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
>>> +    int index = csrno - CSR_HSTATEEN0;
>>> +
>>> +    reg = &env->hstateen[index];
>>> +    wr_mask &= env->mstateen[index];
>>> +    write_smstateen(env, reg, wr_mask, new_val);
>>> +
>>> +    return RISCV_EXCP_NONE;
>>> +}
>>> +
>>> +static RISCVException read_hstateenh(CPURISCVState *env, int csrno,
>>> +                                     target_ulong *val)
>>> +{
>>> +    *val = env->hstateen[csrno - CSR_HSTATEEN0H] >> 32;
>>> +
>>> +    return RISCV_EXCP_NONE;
>>> +}
>>> +
>>> +static RISCVException write_hstateenh(CPURISCVState *env, int
>> csrno,
>>> +                                      target_ulong new_val)
>>> +{
>>> +    uint64_t *reg;
>>> +    uint64_t val;
>>> +    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
>>> +    int index = csrno - CSR_HSTATEEN0H;
>>> +
>>> +    reg = &env->hstateen[index];
>>> +    val = (uint64_t)new_val << 32;
>>> +    val |= *reg & 0xFFFFFFFF;
>>> +    wr_mask &= env->mstateen[index];
>>> +
>>> +    write_smstateen(env, reg, wr_mask, val);
>>> +    return RISCV_EXCP_NONE;
>>> +}
>>> +
>>> +static RISCVException read_sstateen(CPURISCVState *env, int csrno,
>>> +                                    target_ulong *val)
>>> +{
>>> +    *val = env->sstateen[csrno - CSR_SSTATEEN0];
>>> +
>>> +    return RISCV_EXCP_NONE;
>>> +}
>>> +
>>> +static RISCVException write_sstateen(CPURISCVState *env, int csrno,
>>> +                                     target_ulong new_val)
>>> +{
>>> +    uint64_t *reg;
>>> +    uint64_t wr_mask = 0;
>>> +    int index = csrno - CSR_SSTATEEN0;
>>> +    bool virt = riscv_cpu_virt_enabled(env);
>>> +
>>> +    reg = &env->sstateen[index];
>>> +    if (virt) {
>>> +        wr_mask &= env->mstateen[index];
>>> +    } else {
>>> +        wr_mask &= env->hstateen[index];
>>> +    }
>> Why this? I think hstateen works in virt mode, so this may be:
>> if (virt) {
>>    wr_mask &= env->mstateen[index] & env->hstateen[index];;
>> } else {
>>    wr_mask &= env->mstateen[index];
>> }
>>> +    write_smstateen(env, reg, wr_mask, new_val);
>>> +
>>> +    return RISCV_EXCP_NONE;
>>> +}
>>> +
>>> static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>>>                                  uint64_t *ret_val,
>>>                                  uint64_t new_val, uint64_t wr_mask)
>>> @@ -3441,6 +3600,57 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE]
>> = {
>>>      [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh,
>> write_henvcfgh,
>>>                                            .min_priv_ver =
>> PRIV_VERSION_1_12_0 },
>>> +    /* Smstateen extension CSRs */
>>> +    [CSR_MSTATEEN0] = { "mstateen0", mstateen, read_mstateen,
>> write_mstateen,
>>> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_MSTATEEN0H] = { "mstateen0h", mstateen, read_mstateenh,
>>> +                          write_mstateenh,
>>> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_MSTATEEN1] = { "mstateen1", mstateen, read_mstateen,
>> write_mstateen,
>>> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>> It seems unreasonable for mstateen1~3 to share the same read/write
>> function with mstateen0 ,
>> since their field mask is different.
>> Similar to sstateen1~3 and hstateen1~3
> I will fix it in the next version.
>> Regards,
>> Weiwei Li
>>> +    [CSR_MSTATEEN1H] = { "mstateen1h", mstateen, read_mstateenh,
>>> +                          write_mstateenh,
>>> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_MSTATEEN2] = { "mstateen2", mstateen, read_mstateen,
>> write_mstateen,
>>> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_MSTATEEN2H] = { "mstateen2h", mstateen, read_mstateenh,
>>> +                          write_mstateenh,
>>> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_MSTATEEN3] = { "mstateen3", mstateen, read_mstateen,
>> write_mstateen,
>>> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_MSTATEEN3H] = { "mstateen3h", mstateen, read_mstateenh,
>>> +                          write_mstateenh,
>>> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +
>>> +    [CSR_HSTATEEN0] = { "hstateen0", hstateen, read_hstateen,
>> write_hstateen,
>>> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_HSTATEEN0H] = { "hstateen0h", hstateen, read_hstateenh,
>>> +                          write_hstateenh,
>>> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_HSTATEEN1] = { "hstateen1", hstateen, read_hstateen,
>> write_hstateen,
>>> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_HSTATEEN1H] = { "hstateen1h", hstateen, read_hstateenh,
>>> +                          write_hstateenh,
>>> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_HSTATEEN2] = { "hstateen2", hstateen, read_hstateen,
>> write_hstateen,
>>> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_HSTATEEN2H] = { "hstateen2h", hstateen, read_hstateenh,
>>> +                          write_hstateenh,
>>> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_HSTATEEN3] = { "hstateen3", hstateen, read_hstateen,
>> write_hstateen,
>>> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_HSTATEEN3H] = { "hstateen3h", hstateen, read_hstateenh,
>>> +                          write_hstateenh,
>>> +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +
>>> +    [CSR_SSTATEEN0] = { "sstateen0", sstateen, read_sstateen,
>> write_sstateen,
>>> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_SSTATEEN1] = { "sstateen1", sstateen, read_sstateen,
>> write_sstateen,
>>> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_SSTATEEN2] = { "sstateen2", sstateen, read_sstateen,
>> write_sstateen,
>>> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>>> +    [CSR_SSTATEEN3] = { "sstateen3", sstateen, read_sstateen,
>> write_sstateen,
>>> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>>>      /* Supervisor Trap Setup */
>>>      [CSR_SSTATUS]    = { "sstatus",    smode,
>> read_sstatus,    write_sstatus, NULL,
>>>                                                read_sstatus_i128
>>               },
>>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>>> index 2a437b29a1..84a75dbb08 100644
>>> --- a/target/riscv/machine.c
>>> +++ b/target/riscv/machine.c
>>> @@ -262,6 +262,26 @@ static int riscv_cpu_post_load(void *opaque,
>> int version_id)
>>>      return 0;
>>> }
>>>
>>> +static bool smstateen_needed(void *opaque)
>>> +{
>>> +    RISCVCPU *cpu = opaque;
>>> +
>>> +    return cpu->cfg.ext_smstateen;
>>> +}
>>> +
>>> +static const VMStateDescription vmstate_smstateen = {
>>> +    .name = "cpu/smtateen",
>>> +    .version_id = 1,
>>> +    .minimum_version_id = 1,
>>> +    .needed = smstateen_needed,
>>> +    .fields = (VMStateField[]) {
>>> +        VMSTATE_UINT64_ARRAY(env.mstateen, RISCVCPU, 4),
>>> +        VMSTATE_UINT64_ARRAY(env.hstateen, RISCVCPU, 4),
>>> +        VMSTATE_UINT64_ARRAY(env.sstateen, RISCVCPU, 4),
>>> +        VMSTATE_END_OF_LIST()
>>> +    }
>>> +};
>>> +
>>> static bool envcfg_needed(void *opaque)
>>> {
>>>      RISCVCPU *cpu = opaque;
>>> @@ -347,6 +367,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>>>          &vmstate_kvmtimer,
>>>          &vmstate_envcfg,
>>>          &vmstate_debug,
>>> +        &vmstate_smstateen,
>>>          NULL
>>>      }
>>> };
>>> -- 
>>> 2.25.1
>>>


