Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nFb9d-0003IO-BS
	for mharc-qemu-riscv@gnu.org; Thu, 03 Feb 2022 07:24:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1nFb9V-0003E2-8U; Thu, 03 Feb 2022 07:23:53 -0500
Received: from gloria.sntech.de ([185.11.138.130]:36284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1nFb9S-0006pW-0G; Thu, 03 Feb 2022 07:23:52 -0500
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nFb9N-0001lD-N9; Thu, 03 Feb 2022 13:23:45 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: qemu-devel@nongnu.org, Atish Patra <atishp@rivosinc.com>
Cc: qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC 4/5] target/riscv: Add *envcfg* CSRs support
Date: Thu, 03 Feb 2022 13:23:44 +0100
Message-ID: <2696860.3DGziXre4Q@diego>
In-Reply-To: <20220120200735.2739543-5-atishp@rivosinc.com>
References: <20220120200735.2739543-1-atishp@rivosinc.com>
 <20220120200735.2739543-5-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: none client-ip=185.11.138.130; envelope-from=heiko@sntech.de;
 helo=gloria.sntech.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 03 Feb 2022 12:23:58 -0000

Hi Atish,

Am Donnerstag, 20. Januar 2022, 21:07:34 CET schrieb Atish Patra:
> The RISC-V privileged specification v1.12 defines few execution
> environment configuration CSRs that can be used enable/disable
> extensions per privilege levels.
> 
> Add the basic support for these CSRs.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu.h      |  8 ++++
>  target/riscv/cpu_bits.h | 31 +++++++++++++++
>  target/riscv/csr.c      | 84 +++++++++++++++++++++++++++++++++++++++++
>  target/riscv/machine.c  | 26 +++++++++++++
>  4 files changed, 149 insertions(+)
> 
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index f6f90b5cbd52..afb237c2313b 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h

[...]

> @@ -578,6 +589,26 @@ typedef enum RISCVException {
>  #define PM_EXT_CLEAN    0x00000002ULL
>  #define PM_EXT_DIRTY    0x00000003ULL
>  
> +/* Execution enviornment configuration bits */
> +#define MENVCFG_FIOM                       (1 << 0)

> +#define MENVCFG_CBE                        0x30000ULL

Looking both at the cmo spec as well as the most recent privileged spec
(draft) the field is called CBIE it seems.

Also the shift looks wrong. Both cmo as well as privileged spec show
it at bits [5:4] and _not_ [17:16].

Also wouldn't doing it like (_UL(3) << 4) be better to catch such things?

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
>  /* Offsets for every pair of control bits per each priv level */
>  #define XS_OFFSET    0ULL
>  #define U_OFFSET     2ULL


Heiko



