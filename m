Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8NrC-0008DX-Nc
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jul 2022 11:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o8NrB-0008DL-Lv; Mon, 04 Jul 2022 11:19:25 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:35660 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o8Nr7-0001eQ-6T; Mon, 04 Jul 2022 11:19:25 -0400
Received: from [192.168.0.138] (unknown [117.151.235.183])
 by APP-05 (Coremail) with SMTP id zQCowACnx3zpBMNimutfCg--.40262S2;
 Mon, 04 Jul 2022 23:19:06 +0800 (CST)
Subject: Re: [PATCH v10 09/12] target/riscv: Simplify counter predicate
 function
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-10-atishp@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <88b34ac2-c126-c4de-f238-f882d73365c6@iscas.ac.cn>
Date: Mon, 4 Jul 2022 23:19:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220620231603.2547260-10-atishp@rivosinc.com>
Content-Type: multipart/alternative;
 boundary="------------A97CE9A6DA9AF4F3631AE4DB"
Content-Language: en-US
X-CM-TRANSID: zQCowACnx3zpBMNimutfCg--.40262S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr4kAr1xAr1DZF4xXr13Arb_yoWxXw4fp3
 W3tay3K392vrn8Ca9Fg3Z8Gr18ur97Way5Gw4rGayvkw45JF15W3WDur4jqas5tr90ywsF
 9w4Uua95Za1UX37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2
 jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II
 8E6IAqYI8I648v4I1l7480Y4vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l
 c7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
 4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
 67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
 x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
 6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
 DU0xZFpf9x0JUSsjbUUUUU=
X-Originating-IP: [117.151.235.183]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 04 Jul 2022 15:19:25 -0000

This is a multi-part message in MIME format.
--------------A97CE9A6DA9AF4F3631AE4DB
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/6/21 上午7:15, Atish Patra 写道:
> All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
> as a unified counter. Thus, the predicate function doesn't need handle each
> case separately.
>
> Simplify the predicate function so that we just handle things differently
> between RV32/RV64 and S/HS mode.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/csr.c | 112 +++++----------------------------------------
>   1 file changed, 11 insertions(+), 101 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2664ce265784..9367e2af9b90 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>       CPUState *cs = env_cpu(env);
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       int ctr_index;
> +    target_ulong ctr_mask;
>       int base_csrno = CSR_CYCLE;
>       bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>   
> @@ -82,122 +83,31 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>           base_csrno += 0x80;
>       }
>       ctr_index = csrno - base_csrno;
> +    ctr_mask = BIT(ctr_index);
>   
>       if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
>           (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
>           goto skip_ext_pmu_check;
>       }
>   
> -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
> +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & ctr_mask))) {
>           /* No counter is enabled in PMU or the counter is out of range */
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
>   skip_ext_pmu_check:
>   
> -    if (env->priv == PRV_S) {
> -        switch (csrno) {
> -        case CSR_CYCLE:
> -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_TIME:
> -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_INSTRET:
> -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        }
> -        if (rv32) {
> -            switch (csrno) {
> -            case CSR_CYCLEH:
> -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_TIMEH:
> -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_INSTRETH:
> -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            }
> -        }
> +    if (((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) ||
> +       ((env->priv == PRV_U) && (!get_field(env->scounteren, ctr_mask)))) {
> +        return RISCV_EXCP_ILLEGAL_INST;
>       }

Sorry. I didn't realize this simplification and sent a similar patch to 
fix the problems in Xcounteren

related check I found when I tried to learn the patchset for state 
enable extension two days ago.

I think there are several difference between our understanding, 
following is my modifications:

+    if (csrno <= CSR_HPMCOUNTER31 && csrno >= CSR_CYCLE) {
+        field = 1 << (csrno - CSR_CYCLE);
+    } else if (riscv_cpu_mxl(env) == MXL_RV32 && csrno <= CSR_HPMCOUNTER31H &&
+               csrno >= CSR_CYCLEH) {
+        field = 1 << (csrno - CSR_CYCLEH);
+    }
+
+    if (env->priv < PRV_M && !get_field(env->mcounteren, field)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (riscv_cpu_virt_enabled(env) && !get_field(env->hcounteren, field)) {
+        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+    }
+
+    if (riscv_has_ext(env, RVS) && env->priv == PRV_U &&
+        !get_field(env->scounteren, field)) {
+        if (riscv_cpu_virt_enabled(env)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        } else {
+            return RISCV_EXCP_ILLEGAL_INST;
          }
      }


1) For any less-privileged mode under M, illegal exception is raised if matching
bit in mcounteren is zero.

2) For VS/VU mode('H' extension is supported implicitly), virtual instruction
exception is raised if matching bit in hcounteren is zero.

3) scounteren csr only works in U/VU mode when 'S' extension is supported:
    For U mode, illegal exception is raised if matching bit in scounteren is zero.
    For VU mode, virtual instruction exception exception is raised if matching bit
in scounteren is zero.

Regards,
Weiwei Li

>   
>       if (riscv_cpu_virt_enabled(env)) {
> -        switch (csrno) {
> -        case CSR_CYCLE:
> -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> -                get_field(env->mcounteren, COUNTEREN_CY)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_TIME:
> -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> -                get_field(env->mcounteren, COUNTEREN_TM)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_INSTRET:
> -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> -                get_field(env->mcounteren, COUNTEREN_IR)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> -                 get_field(env->mcounteren, 1 << ctr_index)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        }
> -        if (rv32) {
> -            switch (csrno) {
> -            case CSR_CYCLEH:
> -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> -                    get_field(env->mcounteren, COUNTEREN_CY)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_TIMEH:
> -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> -                    get_field(env->mcounteren, COUNTEREN_TM)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_INSTRETH:
> -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> -                    get_field(env->mcounteren, COUNTEREN_IR)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> -                     get_field(env->mcounteren, 1 << ctr_index)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            }
> +        if (!get_field(env->mcounteren, ctr_mask)) {
> +            /* The bit must be set in mcountern for HS mode access */
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        } else if (!get_field(env->hcounteren, ctr_mask)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>           }
>       }
>   #endif

--------------A97CE9A6DA9AF4F3631AE4DB
Content-Type: text/html; charset=gbk
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/6/21 上午7:15, Atish Patra 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220620231603.2547260-10-atishp@rivosinc.com">
      <pre class="moz-quote-pre" wrap="">All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
as a unified counter. Thus, the predicate function doesn't need handle each
case separately.

Simplify the predicate function so that we just handle things differently
between RV32/RV64 and S/HS mode.

Reviewed-by: Bin Meng <a class="moz-txt-link-rfc2396E" href="mailto:bmeng.cn@gmail.com">&lt;bmeng.cn@gmail.com&gt;</a>
Acked-by: Alistair Francis <a class="moz-txt-link-rfc2396E" href="mailto:alistair.francis@wdc.com">&lt;alistair.francis@wdc.com&gt;</a>
Signed-off-by: Atish Patra <a class="moz-txt-link-rfc2396E" href="mailto:atishp@rivosinc.com">&lt;atishp@rivosinc.com&gt;</a>
---
 target/riscv/csr.c | 112 +++++----------------------------------------
 1 file changed, 11 insertions(+), 101 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 2664ce265784..9367e2af9b90 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
+    target_ulong ctr_mask;
     int base_csrno = CSR_CYCLE;
     bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
 
@@ -82,122 +83,31 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
         base_csrno += 0x80;
     }
     ctr_index = csrno - base_csrno;
+    ctr_mask = BIT(ctr_index);
 
     if ((csrno &gt;= CSR_CYCLE &amp;&amp; csrno &lt;= CSR_INSTRET) ||
         (csrno &gt;= CSR_CYCLEH &amp;&amp; csrno &lt;= CSR_INSTRETH)) {
         goto skip_ext_pmu_check;
     }
 
-    if ((!cpu-&gt;cfg.pmu_num || !(cpu-&gt;pmu_avail_ctrs &amp; BIT(ctr_index)))) {
+    if ((!cpu-&gt;cfg.pmu_num || !(cpu-&gt;pmu_avail_ctrs &amp; ctr_mask))) {
         /* No counter is enabled in PMU or the counter is out of range */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
 skip_ext_pmu_check:
 
-    if (env-&gt;priv == PRV_S) {
-        switch (csrno) {
-        case CSR_CYCLE:
-            if (!get_field(env-&gt;mcounteren, COUNTEREN_CY)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        case CSR_TIME:
-            if (!get_field(env-&gt;mcounteren, COUNTEREN_TM)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        case CSR_INSTRET:
-            if (!get_field(env-&gt;mcounteren, COUNTEREN_IR)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        }
-        if (rv32) {
-            switch (csrno) {
-            case CSR_CYCLEH:
-                if (!get_field(env-&gt;mcounteren, COUNTEREN_CY)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            case CSR_TIMEH:
-                if (!get_field(env-&gt;mcounteren, COUNTEREN_TM)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            case CSR_INSTRETH:
-                if (!get_field(env-&gt;mcounteren, COUNTEREN_IR)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            }
-        }
+    if (((env-&gt;priv == PRV_S) &amp;&amp; (!get_field(env-&gt;mcounteren, ctr_mask))) ||
+       ((env-&gt;priv == PRV_U) &amp;&amp; (!get_field(env-&gt;scounteren, ctr_mask)))) {
+        return RISCV_EXCP_ILLEGAL_INST;
     }</pre>
    </blockquote>
    <p>Sorry. I didn't realize this simplification and sent a similar
      patch to fix the problems in Xcounteren <br>
    </p>
    <p>related check I found when I tried to learn the patchset for
      state enable extension two days ago. <br>
    </p>
    <p>I think there are several difference between our understanding,
      following is my modifications:<br>
    </p>
    <pre>+    if (csrno &lt;= CSR_HPMCOUNTER31 &amp;&amp; csrno &gt;= CSR_CYCLE) {
+        field = 1 &lt;&lt; (csrno - CSR_CYCLE);
+    } else if (riscv_cpu_mxl(env) == MXL_RV32 &amp;&amp; csrno &lt;= CSR_HPMCOUNTER31H &amp;&amp;
+               csrno &gt;= CSR_CYCLEH) {
+        field = 1 &lt;&lt; (csrno - CSR_CYCLEH);
+    }
+
+    if (env-&gt;priv &lt; PRV_M &amp;&amp; !get_field(env-&gt;mcounteren, field)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (riscv_cpu_virt_enabled(env) &amp;&amp; !get_field(env-&gt;hcounteren, field)) {
+        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+    }
+
+    if (riscv_has_ext(env, RVS) &amp;&amp; env-&gt;priv == PRV_U &amp;&amp;
+        !get_field(env-&gt;scounteren, field)) {
+        if (riscv_cpu_virt_enabled(env)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        } else {
+            return RISCV_EXCP_ILLEGAL_INST;
         }
     }


1) For any less-privileged mode under M, illegal exception is raised if matching
bit in mcounteren is zero.

2) For VS/VU mode('H' extension is supported implicitly), virtual instruction
exception is raised if matching bit in hcounteren is zero.

3) scounteren csr only works in U/VU mode when 'S' extension is supported:
   For U mode, illegal exception is raised if matching bit in scounteren is zero.
   For VU mode, virtual instruction exception exception is raised if matching bit
in scounteren is zero.

Regards,
Weiwei Li 
</pre>
    <blockquote type="cite"
      cite="mid:20220620231603.2547260-10-atishp@rivosinc.com">
      <pre class="moz-quote-pre" wrap="">
 
     if (riscv_cpu_virt_enabled(env)) {
-        switch (csrno) {
-        case CSR_CYCLE:
-            if (!get_field(env-&gt;hcounteren, COUNTEREN_CY) &amp;&amp;
-                get_field(env-&gt;mcounteren, COUNTEREN_CY)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_TIME:
-            if (!get_field(env-&gt;hcounteren, COUNTEREN_TM) &amp;&amp;
-                get_field(env-&gt;mcounteren, COUNTEREN_TM)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_INSTRET:
-            if (!get_field(env-&gt;hcounteren, COUNTEREN_IR) &amp;&amp;
-                get_field(env-&gt;mcounteren, COUNTEREN_IR)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env-&gt;hcounteren, 1 &lt;&lt; ctr_index) &amp;&amp;
-                 get_field(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        }
-        if (rv32) {
-            switch (csrno) {
-            case CSR_CYCLEH:
-                if (!get_field(env-&gt;hcounteren, COUNTEREN_CY) &amp;&amp;
-                    get_field(env-&gt;mcounteren, COUNTEREN_CY)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_TIMEH:
-                if (!get_field(env-&gt;hcounteren, COUNTEREN_TM) &amp;&amp;
-                    get_field(env-&gt;mcounteren, COUNTEREN_TM)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_INSTRETH:
-                if (!get_field(env-&gt;hcounteren, COUNTEREN_IR) &amp;&amp;
-                    get_field(env-&gt;mcounteren, COUNTEREN_IR)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env-&gt;hcounteren, 1 &lt;&lt; ctr_index) &amp;&amp;
-                     get_field(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            }
+        if (!get_field(env-&gt;mcounteren, ctr_mask)) {
+            /* The bit must be set in mcountern for HS mode access */
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        } else if (!get_field(env-&gt;hcounteren, ctr_mask)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
     }
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------A97CE9A6DA9AF4F3631AE4DB--


