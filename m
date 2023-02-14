Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRr7H-0004Q7-Ot
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 03:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRr76-0004Na-1S; Tue, 14 Feb 2023 03:56:37 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRr73-0001Hh-Mg; Tue, 14 Feb 2023 03:56:35 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowAB3f_O7TOtjv8QsBQ--.42554S2;
 Tue, 14 Feb 2023 16:56:29 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------6ETmkRiD7gT5TYBtuftbZtMb"
Message-ID: <ef991710-bd3c-465b-0215-c0a1af350a59@iscas.ac.cn>
Date: Tue, 14 Feb 2023 16:56:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 09/18] target/riscv: Avoid reporting odd-numbered pmpcfgX
 in the CSR XML for RV64
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-10-bmeng@tinylab.org>
Content-Language: en-US
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230213180215.1524938-10-bmeng@tinylab.org>
X-CM-TRANSID: zQCowAB3f_O7TOtjv8QsBQ--.42554S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4rtF4DJr4kuFWrKw4UArb_yoW8uFyDpw
 4UG3ySgryIqayvvan3tF1DJF15Cw1xK3yUAw4qka1rJr45u3yFyFnI934ruFyrXaykursF
 yF4DAFyrAF4UZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2
 z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
 106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
 64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr
 0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbMGQDUUUU
 U==
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 14 Feb 2023 08:56:46 -0000

This is a multi-part message in MIME format.
--------------6ETmkRiD7gT5TYBtuftbZtMb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/2/14 02:02, Bin Meng wrote:
> At present the odd-numbered PMP configuration registers for RV64 are
> reported in the CSR XML by QEMU gdbstub. However these registers do
> not exist on RV64 so trying to access them from gdb results in 'E14'.
>
> Move the pmpcfgX index check from the actual read/write routine to
> the PMP CSR predicate() routine, so that non-existent pmpcfgX won't
> be reported in the CSR XML for RV64.
>
> Signed-off-by: Bin Meng<bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
> ---
>
>   target/riscv/csr.c | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0a3f2bef6f..749d0ef83e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -412,6 +412,14 @@ static int aia_hmode32(CPURISCVState *env, int csrno)
>   static RISCVException pmp(CPURISCVState *env, int csrno)
>   {
>       if (riscv_feature(env, RISCV_FEATURE_PMP)) {
> +        if (csrno <= CSR_PMPCFG3) {
> +            uint32_t reg_index = csrno - CSR_PMPCFG0;
> +
> +            if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +        }
> +
>           return RISCV_EXCP_NONE;
>       }
>   
> @@ -3334,23 +3342,11 @@ static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> -static bool check_pmp_reg_index(CPURISCVState *env, uint32_t reg_index)
> -{
> -    /* TODO: RV128 restriction check */
> -    if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {
> -        return false;
> -    }
> -    return true;
> -}
> -
>   static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>   {
>       uint32_t reg_index = csrno - CSR_PMPCFG0;
>   
> -    if (!check_pmp_reg_index(env, reg_index)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
>       *val = pmpcfg_csr_read(env, reg_index);
>       return RISCV_EXCP_NONE;
>   }
> @@ -3360,9 +3356,6 @@ static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
>   {
>       uint32_t reg_index = csrno - CSR_PMPCFG0;
>   
> -    if (!check_pmp_reg_index(env, reg_index)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
>       pmpcfg_csr_write(env, reg_index, val);
>       return RISCV_EXCP_NONE;
>   }
--------------6ETmkRiD7gT5TYBtuftbZtMb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/2/14 02:02, Bin Meng wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230213180215.1524938-10-bmeng@tinylab.org">
      <pre class="moz-quote-pre" wrap="">At present the odd-numbered PMP configuration registers for RV64 are
reported in the CSR XML by QEMU gdbstub. However these registers do
not exist on RV64 so trying to access them from gdb results in 'E14'.

Move the pmpcfgX index check from the actual read/write routine to
the PMP CSR predicate() routine, so that non-existent pmpcfgX won't
be reported in the CSR XML for RV64.

Signed-off-by: Bin Meng <a class="moz-txt-link-rfc2396E" href="mailto:bmeng@tinylab.org">&lt;bmeng@tinylab.org&gt;</a></pre>
    </blockquote>
    Reviewed-by: Weiwei Li <a class="moz-txt-link-rfc2396E"
      href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a>
    <br>
    <br>
    Regards,
    <br>
    Weiwei Li
    <div style="color: #000000;background-color: #ffffff;font-family: 'Droid Sans Mono', 'monospace', monospace;font-weight: normal;font-size: 18px;line-height: 24px;white-space: pre;"><div><span style="color: #000000;">
</span></div></div>
    <blockquote type="cite"
      cite="mid:20230213180215.1524938-10-bmeng@tinylab.org">
      <pre class="moz-quote-pre" wrap="">
---

 target/riscv/csr.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0a3f2bef6f..749d0ef83e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -412,6 +412,14 @@ static int aia_hmode32(CPURISCVState *env, int csrno)
 static RISCVException pmp(CPURISCVState *env, int csrno)
 {
     if (riscv_feature(env, RISCV_FEATURE_PMP)) {
+        if (csrno &lt;= CSR_PMPCFG3) {
+            uint32_t reg_index = csrno - CSR_PMPCFG0;
+
+            if ((reg_index &amp; 1) &amp;&amp; (riscv_cpu_mxl(env) == MXL_RV64)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+        }
+
         return RISCV_EXCP_NONE;
     }
 
@@ -3334,23 +3342,11 @@ static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static bool check_pmp_reg_index(CPURISCVState *env, uint32_t reg_index)
-{
-    /* TODO: RV128 restriction check */
-    if ((reg_index &amp; 1) &amp;&amp; (riscv_cpu_mxl(env) == MXL_RV64)) {
-        return false;
-    }
-    return true;
-}
-
 static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
     uint32_t reg_index = csrno - CSR_PMPCFG0;
 
-    if (!check_pmp_reg_index(env, reg_index)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     *val = pmpcfg_csr_read(env, reg_index);
     return RISCV_EXCP_NONE;
 }
@@ -3360,9 +3356,6 @@ static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
 {
     uint32_t reg_index = csrno - CSR_PMPCFG0;
 
-    if (!check_pmp_reg_index(env, reg_index)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     pmpcfg_csr_write(env, reg_index, val);
     return RISCV_EXCP_NONE;
 }
</pre>
    </blockquote>
  </body>
</html>

--------------6ETmkRiD7gT5TYBtuftbZtMb--


