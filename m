Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paB0u-0002pN-FE
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 02:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1paB0l-0002nz-UM; Thu, 09 Mar 2023 02:48:29 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1paB0j-0007kg-0d; Thu, 09 Mar 2023 02:48:27 -0500
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-01 (Coremail) with SMTP id qwCowAB3kNRBjwlkKUtEDQ--.19216S2;
 Thu, 09 Mar 2023 15:48:17 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------0LipbmQGvucsbdvYurQzdocT"
Message-ID: <18d2b7d5-fa56-eb32-4803-74e85f24e1a2@iscas.ac.cn>
Date: Thu, 9 Mar 2023 15:48:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] target/riscv/csr.c: fix H extension TVM trap
Content-Language: en-US
To: chenyi2000@zju.edu.cn, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230308123417.12555-1-chenyi2000@zju.edu.cn>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230308123417.12555-1-chenyi2000@zju.edu.cn>
X-CM-TRANSID: qwCowAB3kNRBjwlkKUtEDQ--.19216S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWUAFW8trW7tFykKF47CFg_yoW8tr4rpa
 18t3yYkayjgFWqyayfJr1qg3W5ArWUGayDAwn7Wa1rAr1fAryrCF1DXr9IqF1DWryDJFs2
 vFWDuF93JF429a7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv2
 0xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7
 xvr2IY64vIr41l7480Y4vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK
 82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWw
 C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
 MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
 IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
 87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUwyCGUUUUU
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 09 Mar 2023 07:48:30 -0000

This is a multi-part message in MIME format.
--------------0LipbmQGvucsbdvYurQzdocT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/3/8 20:34, chenyi2000@zju.edu.cn wrote:
> From: Yi Chen<chenyi2000@zju.edu.cn>
>
> Trap accesses to hgatp if MSTATUS_TVM is enabled.
> Don't trap accesses to vsatp even if MSTATUS_TVM is enabled.
>
> Signed-off-by: Yi Chen<chenyi2000@zju.edu.cn>
> ---
>   target/riscv/csr.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ab56663..09bc780 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2655,7 +2655,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
>           return RISCV_EXCP_NONE;
>       }
>   
> -    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
> +    if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) && get_field(env->mstatus, MSTATUS_TVM)) {
>           return RISCV_EXCP_ILLEGAL_INST;

This line seems too long (> 80).

And hstatus.VTVM should also be taken into consideration.

Similar to following write_satp.

>       } else {
>           *val = env->satp;
> @@ -2683,7 +2683,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
>       }
>   
>       if (vm && mask) {
> -        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
> +        if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) && get_field(env->mstatus, MSTATUS_TVM)) {
>               return RISCV_EXCP_ILLEGAL_INST;
>           } else {
>               /*
> @@ -3047,14 +3047,24 @@ static RISCVException read_hgeip(CPURISCVState *env, int csrno,
>   static RISCVException read_hgatp(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
> -    *val = env->hgatp;
> +    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
> +        return RISCV_EXCP_ILLEGAL_INST;

This check will do before privilege check in riscv_csrrw_check. So it 
will make VS mode access trigger

ILLEGAL_INST exception, However, it should be VIRTUAL_INST exception in 
this case.

Regards,

Weiwei Li

> +    } else {
> +        *val = env->hgatp;
> +    }
> +
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException write_hgatp(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
> -    env->hgatp = val;
> +    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    } else {
> +        env->hgatp = val;
> +    }
> +
>       return RISCV_EXCP_NONE;
>   }
>   
--------------0LipbmQGvucsbdvYurQzdocT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/3/8 20:34,
      <a class="moz-txt-link-abbreviated" href="mailto:chenyi2000@zju.edu.cn">chenyi2000@zju.edu.cn</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230308123417.12555-1-chenyi2000@zju.edu.cn">
      <pre class="moz-quote-pre" wrap="">From: Yi Chen <a class="moz-txt-link-rfc2396E" href="mailto:chenyi2000@zju.edu.cn">&lt;chenyi2000@zju.edu.cn&gt;</a>

Trap accesses to hgatp if MSTATUS_TVM is enabled.
Don't trap accesses to vsatp even if MSTATUS_TVM is enabled.

Signed-off-by: Yi Chen <a class="moz-txt-link-rfc2396E" href="mailto:chenyi2000@zju.edu.cn">&lt;chenyi2000@zju.edu.cn&gt;</a>
---
 target/riscv/csr.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ab56663..09bc780 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2655,7 +2655,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
-    if (env-&gt;priv == PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {
+    if (env-&gt;priv == PRV_S &amp;&amp; !riscv_cpu_virt_enabled(env) &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {
         return RISCV_EXCP_ILLEGAL_INST;</pre>
    </blockquote>
    <p>This line seems too long (&gt; 80).<br>
    </p>
    <p>And hstatus.VTVM should also be taken into consideration.</p>
    <p>Similar to following write_satp.</p>
    <blockquote type="cite"
      cite="mid:20230308123417.12555-1-chenyi2000@zju.edu.cn">
      <pre class="moz-quote-pre" wrap="">
     } else {
         *val = env-&gt;satp;
@@ -2683,7 +2683,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
     }
 
     if (vm &amp;&amp; mask) {
-        if (env-&gt;priv == PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {
+        if (env-&gt;priv == PRV_S &amp;&amp; !riscv_cpu_virt_enabled(env) &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             /*
@@ -3047,14 +3047,24 @@ static RISCVException read_hgeip(CPURISCVState *env, int csrno,
 static RISCVException read_hgatp(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
-    *val = env-&gt;hgatp;
+    if (env-&gt;priv == PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;</pre>
    </blockquote>
    <p>This check will do before privilege check in <span style="color:
        #000000;">riscv_csrrw_check</span>. So it will make VS mode
      access trigger</p>
    <p>ILLEGAL_INST exception, However, it should be VIRTUAL_INST
      exception in this case. <br>
    </p>
    <p>Regards,</p>
    <p>Weiwei Li</p>
    <p></p>
    <blockquote type="cite"
      cite="mid:20230308123417.12555-1-chenyi2000@zju.edu.cn">
      <pre class="moz-quote-pre" wrap="">
+    } else {
+        *val = env-&gt;hgatp;
+    }
+
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_hgatp(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
-    env-&gt;hgatp = val;
+    if (env-&gt;priv == PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    } else {
+        env-&gt;hgatp = val;
+    }
+
     return RISCV_EXCP_NONE;
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------0LipbmQGvucsbdvYurQzdocT--


