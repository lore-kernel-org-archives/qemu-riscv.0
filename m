Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS8Vt-0003Nu-Jx
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 22:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pS8Vr-0003NM-UO; Tue, 14 Feb 2023 22:31:19 -0500
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pS8Vo-0001vQ-6P; Tue, 14 Feb 2023 22:31:19 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VbiRcg2_1676431867; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbiRcg2_1676431867) by smtp.aliyun-inc.com;
 Wed, 15 Feb 2023 11:31:08 +0800
Message-ID: <c413c4b3-166f-a1ac-7ee4-a81841ad5a9a@linux.alibaba.com>
Date: Wed, 15 Feb 2023 11:31:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 RFC Zisslpcfi 2/9] target/riscv: zisslpcfi CSR, bit
 positions and other definitions
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com
Cc: Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-3-debug@rivosinc.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230209062404.3582018-3-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.35, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Feb 2023 03:31:20 -0000


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

I think you are coding according the sections of the specification. 
However,  when upstream code,
don't add declaration or definition if you don't use it in this patch.

This patch should be split into patches where use these definitions.

> +
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
I didn't see the CSR encoding  number from the link in cover-letter.
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
Why not the VSSTATUS?
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

MENVCFG_CFIE according to the specification.  The definitions in other 
places  should also use X_CFIE.

The same comment here with Weiwei, or you can use BIT_ULL.

Zhiwei

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
>   } mseccfg_field_t;
>   
>   typedef struct {

