Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQgcr-0001kj-KA
	for mharc-qemu-riscv@gnu.org; Fri, 10 Feb 2023 22:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pQgcq-0001kW-RH; Fri, 10 Feb 2023 22:32:32 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pQgcn-0008S8-AE; Fri, 10 Feb 2023 22:32:32 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowABXVEBBDOdjdsaBBA--.7834S2;
 Sat, 11 Feb 2023 11:32:18 +0800 (CST)
Message-ID: <6b182beb-7e7d-45eb-50ec-3b822759c535@iscas.ac.cn>
Date: Sat, 11 Feb 2023 11:32:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 RFC Zisslpcfi 2/9] target/riscv: zisslpcfi CSR, bit
 positions and other definitions
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, liweiwei@iscas.ac.cn
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-3-debug@rivosinc.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230209062404.3582018-3-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowABXVEBBDOdjdsaBBA--.7834S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKrykCrykWrW7ury5JF4UCFg_yoW7WrW7pF
 45Ga40gw48AFWxK3WftF45X3W3Jr4xCFs5uw4qg398AayrJrW8CFyDtr45JF1DXF1rAry8
 Kr1qvw1YyrWkXw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
 WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUU
 UU=
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sat, 11 Feb 2023 03:32:33 -0000


On 2023/2/9 14:23, Deepak Gupta wrote:
> `zisslpcfi` extension adds two new CSRs. CSR_SSP and CSR_LPLR.
> - CSR_SSP: This CSR holds shadow stack pointer for current privilege mode
>             CSR_SSP is accessible in all modes. Each mode must establish
>             it's own CSR_SSP.
>
> - CSR_LPLR: This CSR holds label value set at the callsite by compiler.
>              On call target label check instructions are emitted by
>              compiler which check label value against value present in
>              CSR_LPRL.
>
> Enabling of `zisslpcfi` is controlled via menvcfg (for S/HS/VS/U/VU) and
> henvcfg (for VS/VU) at bit position 60.
>
> Each mode has enable/disable bits for forward cfi. Backward cfi doesn't
> have separate enable/disable bits for S and M mode. User forward cfi and
> user backward cfi enable/disable bits are in mstatus/sstatus CSR.
> Supervisor forward cfi enable/disable bit are in menvcfg and henvcfg CSR.
> Machine mode forward cfi enable/disable bit is in mseccfg CSR.
>
> If forward cfi enabled, all indirect branches must land on a landing pad
> instruction (`lpcll`, introduced in later commits). CPU/hart tracks this
> internally using a landing pad tracker called `elp` short for `expecting
> landing pad`. An interrupt can occur between an indirect branch and
> target. If such an event occurs `elp` is saved away in mstatus/sstatus
> CSR
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Kip Walker  <kip@rivosinc.com>
> ---
>   target/riscv/cpu.h      |  5 +++++
>   target/riscv/cpu_bits.h | 25 +++++++++++++++++++++++++
>   target/riscv/pmp.h      |  3 ++-
>   3 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9a923760b2..18db61a06a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -181,6 +181,11 @@ struct CPUArchState {
>   
>       uint32_t features;
>   
> +    /* CFI Extension user mode registers and state */
> +    uint32_t     lplr;
> +    target_ulong ssp;
> +    cfi_elp      elp;
> +

cfi_elp is not defined in current or previous patch.

>   #ifdef CONFIG_USER_ONLY
>       uint32_t elf_flags;
>   #endif
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 8b0d7e20ea..1663ba5775 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -39,6 +39,10 @@
>   
>   /* Control and Status Registers */
>   
> +/* CFI CSRs */
> +#define CSR_LPLR            0x006
> +#define CSR_SSP             0x020
> +
>   /* User Trap Setup */
>   #define CSR_USTATUS         0x000
>   #define CSR_UIE             0x004
> @@ -542,6 +546,10 @@
>   #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
>   #define MSTATUS_TW          0x00200000 /* since: priv-1.10 */
>   #define MSTATUS_TSR         0x00400000 /* since: priv-1.10 */
> +#define MSTATUS_UFCFIEN     0x00800000 /* Zisslpcfi-0.1 */
> +#define MSTATUS_UBCFIEN     0x01000000 /* Zisslpcfi-0.1 */
> +#define MSTATUS_SPELP       0x02000000 /* Zisslpcfi-0.1 */
> +#define MSTATUS_MPELP       0x04000000 /* Zisslpcfi-0.1 */
>   #define MSTATUS_GVA         0x4000000000ULL
>   #define MSTATUS_MPV         0x8000000000ULL
>   
> @@ -572,12 +580,21 @@ typedef enum {
>   #define SSTATUS_XS          0x00018000
>   #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
>   #define SSTATUS_MXR         0x00080000
> +#define SSTATUS_UFCFIEN     MSTATUS_UFCFIEN /* Zisslpcfi-0.1 */
> +#define SSTATUS_UBCFIEN     MSTATUS_UBCFIEN /* Zisslpcfi-0.1 */
> +#define SSTATUS_SPELP       MSTATUS_SPELP   /* Zisslpcfi-0.1 */
>   
>   #define SSTATUS64_UXL       0x0000000300000000ULL
>   
>   #define SSTATUS32_SD        0x80000000
>   #define SSTATUS64_SD        0x8000000000000000ULL
>   
> +#define CFISTATUS_M_MASK    (MSTATUS_UFCFIEN | MSTATUS_UBCFIEN | \
> +                             MSTATUS_MPELP | MSTATUS_SPELP)
> +
> +#define CFISTATUS_S_MASK    (SSTATUS_UFCFIEN | SSTATUS_UBCFIEN | \
> +                             SSTATUS_SPELP)
> +
>   /* hstatus CSR bits */
>   #define HSTATUS_VSBE         0x00000020
>   #define HSTATUS_GVA          0x00000040
> @@ -747,10 +764,14 @@ typedef enum RISCVException {
>   #define MENVCFG_CBIE                       (3UL << 4)
>   #define MENVCFG_CBCFE                      BIT(6)
>   #define MENVCFG_CBZE                       BIT(7)
> +#define MENVCFG_SFCFIEN                    BIT(59)
> +#define MENVCFG_CFI                        BIT(60)
We should use 1ULL << 59/60 here.
>   #define MENVCFG_PBMTE                      (1ULL << 62)
>   #define MENVCFG_STCE                       (1ULL << 63)
>   
>   /* For RV32 */
> +#define MENVCFGH_SFCFIEN                   BIT(27)
> +#define MENVCFGH_CFI                       BIT(28)
>   #define MENVCFGH_PBMTE                     BIT(30)
>   #define MENVCFGH_STCE                      BIT(31)
>   
> @@ -763,10 +784,14 @@ typedef enum RISCVException {
>   #define HENVCFG_CBIE                       MENVCFG_CBIE
>   #define HENVCFG_CBCFE                      MENVCFG_CBCFE
>   #define HENVCFG_CBZE                       MENVCFG_CBZE
> +#define HENVCFG_SFCFIEN                    MENVCFG_SFCFIEN
> +#define HENVCFG_CFI                        MENVCFG_CFI
>   #define HENVCFG_PBMTE                      MENVCFG_PBMTE
>   #define HENVCFG_STCE                       MENVCFG_STCE
>   
>   /* For RV32 */
> +#define HENVCFGH_SFCFIEN                    MENVCFGH_SFCFIEN
> +#define HENVCFGH_CFI                        MENVCFGH_CFI
>   #define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
>   #define HENVCFGH_STCE                       MENVCFGH_STCE
>   
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index da32c61c85..f5bfc4955b 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -43,7 +43,8 @@ typedef enum {
>       MSECCFG_MMWP  = 1 << 1,
>       MSECCFG_RLB   = 1 << 2,
>       MSECCFG_USEED = 1 << 8,
> -    MSECCFG_SSEED = 1 << 9
> +    MSECCFG_SSEED = 1 << 9,
> +    MSECCFG_MFCFIEN =  1 << 10

It's unnecessary to use multiple space after '='.

Regards,

Weiwei Li

>   } mseccfg_field_t;
>   
>   typedef struct {


