Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mx9Rr-00061z-Dy
	for mharc-qemu-riscv@gnu.org; Tue, 14 Dec 2021 10:10:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1mx9JU-0002R1-Ez; Tue, 14 Dec 2021 10:01:56 -0500
Received: from gloria.sntech.de ([185.11.138.130]:54462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1mx9JQ-0001Yh-UX; Tue, 14 Dec 2021 10:01:56 -0500
Received: from p5b127e95.dip0.t-ipconnect.de ([91.18.126.149]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mx9JH-0008Un-4l; Tue, 14 Dec 2021 16:01:43 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, liweiwei <liweiwei@iscas.ac.cn>,
 lazyparser@gmail.com, liweiwei <liweiwei@iscas.ac.cn>
Subject: Re: [RFC PATCH 3/3] target/riscv: add support for svpbmt extension
Date: Tue, 14 Dec 2021 16:01:42 +0100
Message-ID: <2304988.zUQuKtGZoq@phil>
In-Reply-To: <20211128135255.22089-4-liweiwei@iscas.ac.cn>
References: <20211128135255.22089-1-liweiwei@iscas.ac.cn>
 <20211128135255.22089-4-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: none client-ip=185.11.138.130; envelope-from=heiko@sntech.de;
 helo=gloria.sntech.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 14 Dec 2021 10:10:34 -0500
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
X-List-Received-Date: Tue, 14 Dec 2021 15:01:57 -0000

Am Sonntag, 28. November 2021, 14:52:55 CET schrieb liweiwei:
> It uses two PTE bits, but QEMU is sequentially consistent, So it has no effect on QEMU currently.
> 
> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>

with the Linux svpbmt patchset
Tested-by: Heiko Stuebner <heiko@sntech.de>

Thanks
Heiko

> ---
>  target/riscv/cpu_bits.h   | 4 ++++
>  target/riscv/cpu_helper.c | 9 +++++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 70391424b0..62713ec37a 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -473,7 +473,11 @@ typedef enum {
>  #define PTE_A               0x040 /* Accessed */
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
> +#define PTE_RSVD            0x1FC0000000000000 /* Reserved for future use */
> +#define PTE_PBMT            0x6000000000000000 /* Page-based memory types */
>  #define PTE_N               0x8000000000000000
> +#define PTE_ATTR            0xFFC0000000000000 /* All attributes bits */
> +
>  
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e68db3e119..94b01bbf78 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -588,13 +588,18 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>  
> -        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
> +        hwaddr ppn = (pte & ~(target_ulong)PTE_ATTR) >> PTE_PPN_SHIFT;
>  
> -        if (!(pte & PTE_V)) {
> +        if (pte & PTE_RSVD) {
> +            return TRANSLATE_FAIL;
> +        } else if (!(pte & PTE_V)) {
>              /* Invalid PTE */
>              return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              /* Inner PTE, continue walking */
> +            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N | PTE_PBMT)) {
> +                return TRANSLATE_FAIL;
> +            }
>              base = ppn << PGSHIFT;
>          } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
>              /* Reserved leaf PTE flags: PTE_W */
> 





