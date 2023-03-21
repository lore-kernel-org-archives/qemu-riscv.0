Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peT5c-0002pd-Ka
	for mharc-qemu-riscv@gnu.org; Mon, 20 Mar 2023 23:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1peT5Z-0002pE-9Y; Mon, 20 Mar 2023 23:55:09 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1peT5V-0001gc-Nm; Mon, 20 Mar 2023 23:55:08 -0400
Received: from [192.168.0.120] (unknown [180.165.240.243])
 by APP-05 (Coremail) with SMTP id zQCowACHjxeOKhlkOOVKBw--.48231S2;
 Tue, 21 Mar 2023 11:54:55 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------a6XMlWZGFdjPlr56qRmibweX"
Message-ID: <2a790eff-8361-ce72-dc20-e401ee1d0e44@iscas.ac.cn>
Date: Tue, 21 Mar 2023 11:54:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v3 11/26] target/riscv/cpu.c: set cpu config in
 set_misa()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
 <20230318200436.299464-12-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230318200436.299464-12-dbarboza@ventanamicro.com>
X-CM-TRANSID: zQCowACHjxeOKhlkOOVKBw--.48231S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZrykCF1UZry7Wr4rtr45Awb_yoW7Jw4kpr
 W8C3yayrWUJrZFqayfJF1kWFWrtw4xK3yaga47Za17WFWDJr4jqFsFkF4UGFyDGFs5Zrya
 g3WkCw1avayxCaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
 106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
 64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
 0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
 0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JjjYL9UUUUU=
X-Originating-IP: [180.165.240.243]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 21 Mar 2023 03:55:09 -0000

This is a multi-part message in MIME format.
--------------a6XMlWZGFdjPlr56qRmibweX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/3/19 04:04, Daniel Henrique Barboza wrote:
> set_misa() is setting all 'misa' related env states and nothing else.
> But other functions, namely riscv_cpu_validate_set_extensions(), uses
> the config object to do its job.
>
> This creates a need to set the single letter extensions in the cfg
> object to keep both in sync. At this moment this is being done by
> register_cpu_props(), forcing every CPU to do a call to this function.
>
> Let's beef up set_misa() and make the function do the sync for us. This
> will relieve named CPUs to having to call register_cpu_props(), which
> will then be redesigned to a more specialized role next.
>
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 40 ++++++++++++++++++++++++++++++++--------
>   target/riscv/cpu.h |  4 ++--
>   2 files changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 36c55abda0..7841676473 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -236,8 +236,40 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>   
>   static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
>   {
> +    RISCVCPU *cpu;
> +
>       env->misa_mxl_max = env->misa_mxl = mxl;
>       env->misa_ext_mask = env->misa_ext = ext;
> +
> +    /*
> +     * ext = 0 will only be a thing during cpu_init() functions
> +     * as a way of setting an extension-agnostic CPU. We do
> +     * not support clearing misa_ext* and the ext_N flags in
> +     * RISCVCPUConfig in regular circunstances.
> +     */
> +    if (ext == 0) {
> +        return;
> +    }
> +
> +    /*
> +     * We can't use riscv_cpu_cfg() in this case because it is
> +     * a read-only inline and we're going to change the values
> +     * of cpu->cfg.
> +     */
> +    cpu = env_archcpu(env);
> +
> +    cpu->cfg.ext_i = ext & RVI;
> +    cpu->cfg.ext_e = ext & RVE;
> +    cpu->cfg.ext_m = ext & RVM;
> +    cpu->cfg.ext_a = ext & RVA;
> +    cpu->cfg.ext_f = ext & RVF;
> +    cpu->cfg.ext_d = ext & RVD;
> +    cpu->cfg.ext_v = ext & RVV;
> +    cpu->cfg.ext_c = ext & RVC;
> +    cpu->cfg.ext_s = ext & RVS;
> +    cpu->cfg.ext_u = ext & RVU;
> +    cpu->cfg.ext_h = ext & RVH;
> +    cpu->cfg.ext_j = ext & RVJ;
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> @@ -340,7 +372,6 @@ static void riscv_any_cpu_init(Object *obj)
>   #endif
>   
>       env->priv_ver = PRIV_VERSION_LATEST;
> -    register_cpu_props(obj);
>   
>       /* inherited from parent obj via riscv_cpu_init() */
>       cpu->cfg.ext_ifencei = true;
> @@ -368,7 +399,6 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       CPURISCVState *env = &cpu->env;
>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> -    register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
> @@ -387,7 +417,6 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
> -    register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -472,8 +501,6 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       CPURISCVState *env = &cpu->env;
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> -
> -    register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
> @@ -492,7 +519,6 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
> -    register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -510,7 +536,6 @@ static void rv32_ibex_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
>       set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> -    register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_11_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -529,7 +554,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
> -    register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 76f81c6b68..ebe0fff668 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -66,8 +66,8 @@
>   #define RV(x) ((target_ulong)1 << (x - 'A'))
>   
>   /*
> - * Consider updating register_cpu_props() when adding
> - * new MISA bits here.
> + * Consider updating set_misa() when adding new
> + * MISA bits here.
>    */
>   #define RVI RV('I')
>   #define RVE RV('E') /* E and I are mutually exclusive */

The assignment for ext_c/u/s in rv64_thead_c906_cpu_init can be removed, 
since all of them have

be done in set_misa.

Similar to ext_g, if RVG is added.

Regards,

Weiwei Li

--------------a6XMlWZGFdjPlr56qRmibweX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/3/19 04:04, Daniel Henrique
      Barboza wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230318200436.299464-12-dbarboza@ventanamicro.com">
      <pre class="moz-quote-pre" wrap="">set_misa() is setting all 'misa' related env states and nothing else.
But other functions, namely riscv_cpu_validate_set_extensions(), uses
the config object to do its job.

This creates a need to set the single letter extensions in the cfg
object to keep both in sync. At this moment this is being done by
register_cpu_props(), forcing every CPU to do a call to this function.

Let's beef up set_misa() and make the function do the sync for us. This
will relieve named CPUs to having to call register_cpu_props(), which
will then be redesigned to a more specialized role next.

Signed-off-by: Daniel Henrique Barboza <a class="moz-txt-link-rfc2396E" href="mailto:dbarboza@ventanamicro.com">&lt;dbarboza@ventanamicro.com&gt;</a>
---
 target/riscv/cpu.c | 40 ++++++++++++++++++++++++++++++++--------
 target/riscv/cpu.h |  4 ++--
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 36c55abda0..7841676473 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -236,8 +236,40 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 
 static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
 {
+    RISCVCPU *cpu;
+
     env-&gt;misa_mxl_max = env-&gt;misa_mxl = mxl;
     env-&gt;misa_ext_mask = env-&gt;misa_ext = ext;
+
+    /*
+     * ext = 0 will only be a thing during cpu_init() functions
+     * as a way of setting an extension-agnostic CPU. We do
+     * not support clearing misa_ext* and the ext_N flags in
+     * RISCVCPUConfig in regular circunstances.
+     */
+    if (ext == 0) {
+        return;
+    }
+
+    /*
+     * We can't use riscv_cpu_cfg() in this case because it is
+     * a read-only inline and we're going to change the values
+     * of cpu-&gt;cfg.
+     */
+    cpu = env_archcpu(env);
+
+    cpu-&gt;cfg.ext_i = ext &amp; RVI;
+    cpu-&gt;cfg.ext_e = ext &amp; RVE;
+    cpu-&gt;cfg.ext_m = ext &amp; RVM;
+    cpu-&gt;cfg.ext_a = ext &amp; RVA;
+    cpu-&gt;cfg.ext_f = ext &amp; RVF;
+    cpu-&gt;cfg.ext_d = ext &amp; RVD;
+    cpu-&gt;cfg.ext_v = ext &amp; RVV;
+    cpu-&gt;cfg.ext_c = ext &amp; RVC;
+    cpu-&gt;cfg.ext_s = ext &amp; RVS;
+    cpu-&gt;cfg.ext_u = ext &amp; RVU;
+    cpu-&gt;cfg.ext_h = ext &amp; RVH;
+    cpu-&gt;cfg.ext_j = ext &amp; RVJ;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -340,7 +372,6 @@ static void riscv_any_cpu_init(Object *obj)
 #endif
 
     env-&gt;priv_ver = PRIV_VERSION_LATEST;
-    register_cpu_props(obj);
 
     /* inherited from parent obj via riscv_cpu_init() */
     cpu-&gt;cfg.ext_ifencei = true;
@@ -368,7 +399,6 @@ static void rv64_sifive_u_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &amp;cpu-&gt;env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(obj);
     env-&gt;priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
@@ -387,7 +417,6 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     env-&gt;priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -472,8 +501,6 @@ static void rv32_sifive_u_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &amp;cpu-&gt;env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-
-    register_cpu_props(obj);
     env-&gt;priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
@@ -492,7 +519,6 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     env-&gt;priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -510,7 +536,6 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    register_cpu_props(obj);
     env-&gt;priv_ver = PRIV_VERSION_1_11_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -529,7 +554,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
-    register_cpu_props(obj);
     env-&gt;priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 76f81c6b68..ebe0fff668 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,8 +66,8 @@
 #define RV(x) ((target_ulong)1 &lt;&lt; (x - 'A'))
 
 /*
- * Consider updating register_cpu_props() when adding
- * new MISA bits here.
+ * Consider updating set_misa() when adding new
+ * MISA bits here.
  */
 #define RVI RV('I')
 #define RVE RV('E') /* E and I are mutually exclusive */</pre>
    </blockquote>
    <p>The assignment for ext_c/u/s <span class="pl-en">in
        rv64_thead_c906_cpu_init can be removed, since all of them have<br>
      </span></p>
    <p><span class="pl-en">be done in set_misa. <br>
      </span></p>
    <p><span class="pl-en">Similar to ext_g, if RVG is added.</span></p>
    <p><span class="pl-en">Regards,</span></p>
    <p><span class="pl-en">Weiwei Li<br>
      </span></p>
    <p><span class="pl-en"></span></p>
    <blockquote type="cite"
      cite="mid:20230318200436.299464-12-dbarboza@ventanamicro.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------a6XMlWZGFdjPlr56qRmibweX--


