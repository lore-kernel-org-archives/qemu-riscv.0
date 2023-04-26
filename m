Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prZhI-00054E-M4
	for mharc-qemu-riscv@gnu.org; Wed, 26 Apr 2023 03:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1prZhC-00053r-It; Wed, 26 Apr 2023 03:36:10 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1prZh9-0003al-CO; Wed, 26 Apr 2023 03:36:10 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-01 (Coremail) with SMTP id qwCowAAXXJxI1Ehk0yccCw--.47983S2;
 Wed, 26 Apr 2023 15:35:37 +0800 (CST)
Message-ID: <1d731da7-689a-d2a1-fc88-3902c006fe02@iscas.ac.cn>
Date: Wed, 26 Apr 2023 15:35:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn
Subject: Re: [RFC PATCH v2 1/9] riscv: implement Ssqosid extension and sqoscfg
 CSR
To: Drew Fustini <dfustini@baylibre.com>, Ved Shanbhogue <ved@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?Q?Kornel_Dul=c4=99ba?= <mindal@semihalf.com>
References: <20230425203834.1135306-1-dfustini@baylibre.com>
 <20230425203834.1135306-2-dfustini@baylibre.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230425203834.1135306-2-dfustini@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAXXJxI1Ehk0yccCw--.47983S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtFWDGFy7tw1rCFW7KF1ftFb_yoW7KF1UpF
 4qka43Gws2yFy3Z3Wftr4UXwn5Aw4xGw42kws3uwn5Jrs3JrW8GFnrKrZFgFy8XFs8ur12
 9Fs0vr1rCr4DXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 26 Apr 2023 07:36:10 -0000


On 2023/4/26 04:38, Drew Fustini wrote:
> From: Kornel Dulęba <mindal@semihalf.com>
>
> Implement the sqoscfg CSR defined by the Ssqosid ISA extension
> (Supervisor-mode Quality of Service ID). The CSR contains two fields:
>
>    - Resource Control ID (RCID) used determine resource allocation
>    - Monitoring Counter ID (MCID) used to track resource usage
>
> The CSR is defined for S-mode but accessing it when V=1 shall cause a
> virtual instruction exception. Implement this behavior by calling the
> hmode predicate.
>
> Link: https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.pdf
> Signed-off-by: Kornel Dulęba <mindal@semihalf.com>
> [dfustini: rebase on v8.0.50, reword commit message]
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
> Changes since v1:
> - rebase on current master (v8.0.50) instead of 8.0.0-rc4
>
>   disas/riscv.c           |  1 +
>   target/riscv/cpu.c      |  2 ++
>   target/riscv/cpu.h      |  3 +++
>   target/riscv/cpu_bits.h |  5 +++++
>   target/riscv/csr.c      | 34 ++++++++++++++++++++++++++++++++++
>   5 files changed, 45 insertions(+)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index d6b0fbe5e877..94336f54637b 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2100,6 +2100,7 @@ static const char *csr_name(int csrno)
>       case 0x0143: return "stval";
>       case 0x0144: return "sip";
>       case 0x0180: return "satp";
> +    case 0x0181: return "sqoscfg";
>       case 0x0200: return "hstatus";
>       case 0x0202: return "hedeleg";
>       case 0x0203: return "hideleg";
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e97473af27b..fb3f8c43a32d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -114,6 +114,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
>       ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
>       ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
> +    ISA_EXT_DATA_ENTRY(ssqosid, true, PRIV_VERSION_1_12_0, ext_ssqosid),
>       ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
>       ISA_EXT_DATA_ENTRY(svadu, true, PRIV_VERSION_1_12_0, ext_svadu),
>       ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
> @@ -1397,6 +1398,7 @@ static Property riscv_cpu_extensions[] = {
>   
>       DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
>   
> +    DEFINE_PROP_BOOL("ssqosid", RISCVCPU, cfg.ext_ssqosid, true),
>       DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>       DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>       DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a57..ffc1b5009d15 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -222,6 +222,8 @@ struct CPUArchState {
>       target_ulong mcause;
>       target_ulong mtval;  /* since: priv-1.10.0 */
>   
> +    target_ulong sqoscfg;
> +
>       /* Machine and Supervisor interrupt priorities */
>       uint8_t miprio[64];
>       uint8_t siprio[64];
> @@ -454,6 +456,7 @@ struct RISCVCPUConfig {
>       bool ext_icboz;
>       bool ext_zicond;
>       bool ext_zihintpause;
> +    bool ext_ssqosid;
>       bool ext_smstateen;
>       bool ext_sstc;
>       bool ext_svadu;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index fca7ef0cef91..d11a3928735e 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -217,6 +217,7 @@
>   /* Supervisor Protection and Translation */
>   #define CSR_SPTBR           0x180
>   #define CSR_SATP            0x180
> +#define CSR_SQOSCFG         0x181
>   
>   /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
>   #define CSR_SISELECT        0x150
> @@ -898,4 +899,8 @@ typedef enum RISCVException {
>   #define MHPMEVENT_IDX_MASK                 0xFFFFF
>   #define MHPMEVENT_SSCOF_RESVD              16
>   
> +/* SQOSCFG BITS (QOSID) */
> +#define SQOSCFG_RCID                      0x00000FFF
> +#define SQOSCFG_MCID                      0x0FFF0000
> +
>   #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b63a..5769b3545704 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2700,6 +2700,37 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> +static RISCVException check_sqoscfg(CPURISCVState *env, int csrno)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_ssqosid) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    /*
> +     * Even though this is an S-mode CSR the spec says that we need to throw
> +     * and virt instruction fault if a guest tries to access it.
> +     */
> +    return hmode(env, csrno);

If above comments is true, use hmode() here is not right, since it only 
check whether H extension is supported.

It need another check for guest mode access. And we should use smode() 
instead of hmode() here.

> +}
> +
> +static RISCVException read_sqoscfg(CPURISCVState *env, int csrno,
> +                                target_ulong *val)

'target_ulong' is better to align with 'CPURISCVState'.

Regards,

Weiwei Li

> +{
> +    *val = env->sqoscfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_sqoscfg(CPURISCVState *env, int csrno,
> +                                 target_ulong val)
> +{
> +    env->sqoscfg = val & (SQOSCFG_RCID | SQOSCFG_MCID);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +
> +
>   static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
>   {
>       int irq, ret;
> @@ -4182,6 +4213,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       /* Supervisor Protection and Translation */
>       [CSR_SATP]     = { "satp",     smode, read_satp,     write_satp     },
>   
> +    /* Supervisor-Level Quality of Service Identifier */
> +    [CSR_SQOSCFG]  = { "sqoscfg",  check_sqoscfg, read_sqoscfg, write_sqoscfg },
> +
>       /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
>       [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
>       [CSR_SIREG]      = { "sireg",      aia_smode, NULL, NULL, rmw_xireg },


