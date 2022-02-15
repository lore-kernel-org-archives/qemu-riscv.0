Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nK0Z3-0000p2-FM
	for mharc-qemu-riscv@gnu.org; Tue, 15 Feb 2022 11:20:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1nK0Z0-0000n9-G3; Tue, 15 Feb 2022 11:20:26 -0500
Received: from gloria.sntech.de ([185.11.138.130]:54332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1nK0Yx-0000cr-1S; Tue, 15 Feb 2022 11:20:26 -0500
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nK0Yr-0000cd-9w; Tue, 15 Feb 2022 17:20:17 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH] target/riscv: Add isa extenstion strings to the device
 tree
Date: Tue, 15 Feb 2022 17:20:16 +0100
Message-ID: <2828317.Et2jP947se@diego>
In-Reply-To: <20220215090530.911828-1-atishp@rivosinc.com>
References: <20220215090530.911828-1-atishp@rivosinc.com>
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
X-List-Received-Date: Tue, 15 Feb 2022 16:20:26 -0000

Am Dienstag, 15. Februar 2022, 10:05:30 CET schrieb Atish Patra:
> Append the available ISA extensions to the "riscv,isa" string if it
> is enabled so that kernel can process it.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b0a40b83e7a8..c70260d0df15 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,9 @@
>  
>  /* RISC-V CPU definitions */
>  
> +/* This includes the null terminated character '\0' */
> +#define MAX_ISA_EXT_LEN 256
> +
>  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>  
>  const char * const riscv_int_regnames[] = {
> @@ -881,10 +884,26 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>  
> +static void riscv_isa_string_ext(RISCVCPU *cpu, char *isa_str, int max_str_len)
> +{
> +    int offset = strnlen(isa_str, max_str_len);
> +
> +    if (cpu->cfg.ext_svpbmt) {
> +        offset += snprintf(isa_str + offset, max_str_len, "_%s", "_svpbmt");
> +    }
> +    if ((offset < max_str_len) && cpu->cfg.ext_svinval) {

shouldn't offset + strlen("svinval") +1 be < max_str_len?
snprintf will write partial strings but this would throw off a
qemu client completely I guess.


> +        offset += snprintf(isa_str + offset, max_str_len, "_%s", "_svinval");
> +    }
> +    if ((offset < max_str_len) && (cpu->cfg.ext_svnapot)) {
> +        offset += snprintf(isa_str + offset, max_str_len, "_%s", "_svnapot");
> +    }

wouldn't it make more sense to do something like:

+    struct {
+        const char *value;
+        bool enabled;
+    } extensions[] = {
+        { "svpbmt", cpu->cfg.ext_svpbmt },
+        { "svinval", cpu->cfg.ext_svinval },
+        { "svnapot", cpu->cfg.ext_svnapot },
+    };
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(extensions); i++) {
+        if (!extensions[i].enabled)
+            continue;
+
+        /* check available space */
+        if (offset + strlen(extensions[i].value) + 1 > max_str_len) {
+            //do warn about exceeded length
+            return;
+        }
+
+        offset += snprintf(isa_str + offset, max_str_len, "_%s",
+                                                          extensions[i].value);
+    }

instead?

Because that list will get longer over time and repeating checks
and snprintf calls will get harder to keep in sync over time?


Heiko




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
> @@ -893,6 +912,8 @@ char *riscv_isa_string(RISCVCPU *cpu)
>          }
>      }
>      *p = '\0';
> +    riscv_isa_string_ext(cpu, isa_str, maxlen);
> +
>      return isa_str;
>  }
>  
> 





