Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKIhn-0007pE-8V
	for mharc-qemu-riscv@gnu.org; Wed, 16 Feb 2022 06:42:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1nKIhl-0007p1-JD; Wed, 16 Feb 2022 06:42:41 -0500
Received: from gloria.sntech.de ([185.11.138.130]:33602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1nKIhh-0003wv-OH; Wed, 16 Feb 2022 06:42:41 -0500
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nKIhY-00074g-DG; Wed, 16 Feb 2022 12:42:28 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: qemu-devel@nongnu.org, Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH v2] target/riscv: Add isa extenstion strings to the device
 tree
Date: Wed, 16 Feb 2022 12:42:27 +0100
Message-ID: <2042914.xst4mCEuAT@diego>
In-Reply-To: <20220216000904.1217872-1-atishp@rivosinc.com>
References: <20220216000904.1217872-1-atishp@rivosinc.com>
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
X-List-Received-Date: Wed, 16 Feb 2022 11:42:42 -0000

Am Mittwoch, 16. Februar 2022, 01:09:04 CET schrieb Atish Patra:
> The Linux kernel parses the ISA extensions from "riscv,isa" DT
> property. It used to parse only the single letter base extensions
> until now. A generic ISA extension parsing framework was proposed[1]
> recently that can parse multi-letter ISA extensions as well.
> 
> Generate the extended ISA string by appending  the available ISA extensions
> to the "riscv,isa" string if it is enabled so that kernel can process it.
> 
> [1] https://lkml.org/lkml/2022/2/15/263
> 
> Suggested-by: Heiko Stubner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Tested-by: Heiko Stuebner <heiko@sntech.de>

> ---
> Changes from v1->v2:
> 1. Improved the code redability by using arrays instead of individual check
> ---
>  target/riscv/cpu.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b0a40b83e7a8..9bf8923f164b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,13 @@
>  
>  /* RISC-V CPU definitions */
>  
> +/* This includes the null terminated character '\0' */
> +#define MAX_ISA_EXT_LEN 256
> +struct isa_ext_data {
> +        const char *name;
> +        bool enabled;
> +};
> +
>  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>  
>  const char * const riscv_int_regnames[] = {
> @@ -881,10 +888,35 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>  
> +static void riscv_isa_string_ext(RISCVCPU *cpu, char *isa_str, int max_str_len)
> +{
> +    int offset = strnlen(isa_str, max_str_len);
> +    int i;
> +    struct isa_ext_data isa_edata_arr[] = {
> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
> +        { "svinval", cpu->cfg.ext_svinval },
> +        { "svnapot", cpu->cfg.ext_svnapot },
> +    };
> +
> +    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> +        if (!isa_edata_arr[i].enabled) {
> +            continue;
> +        }
> +        /* check available space */
> +        if ((offset + strlen(isa_edata_arr[i].name) + 1) > max_str_len) {
> +            qemu_log("No space left to append isa extension");
> +            return;
> +        }
> +        offset += snprintf(isa_str + offset, max_str_len, "_%s",
> +                           isa_edata_arr[i].name);
> +    }
> +}
> +
>  char *riscv_isa_string(RISCVCPU *cpu)
>  {
>      int i;
> -    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) + 1;
> +    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) +
> +                          MAX_ISA_EXT_LEN;
>      char *isa_str = g_new(char, maxlen);
>      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
>      for (i = 0; i < sizeof(riscv_exts); i++) {
> @@ -893,6 +925,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>          }
>      }
>      *p = '\0';
> +    riscv_isa_string_ext(cpu, isa_str, maxlen);
>      return isa_str;
>  }
>  
> 





