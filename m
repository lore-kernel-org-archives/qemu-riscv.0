Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paSF8-0003zm-Fg
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 21:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1paSF7-0003zT-2y; Thu, 09 Mar 2023 21:12:25 -0500
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1paSF4-0007w3-Ci; Thu, 09 Mar 2023 21:12:24 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R771e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VdVJAIe_1678414331; 
Received: from 30.221.99.193(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdVJAIe_1678414331) by smtp.aliyun-inc.com;
 Fri, 10 Mar 2023 10:12:12 +0800
Content-Type: multipart/alternative;
 boundary="------------Q3SsejpLbgmwUjK7Bx0YaGKI"
Message-ID: <087472fc-94f1-165d-9776-8e12d60be09d@linux.alibaba.com>
Date: Fri, 10 Mar 2023 10:12:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/riscv/csr.c: fix H extension TVM trap
Content-Language: en-US
To: chenyi2000@zju.edu.cn, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230308123417.12555-1-chenyi2000@zju.edu.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230308123417.12555-1-chenyi2000@zju.edu.cn>
Received-SPF: pass client-ip=115.124.30.119;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-119.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Fri, 10 Mar 2023 02:12:25 -0000

This is a multi-part message in MIME format.
--------------Q3SsejpLbgmwUjK7Bx0YaGKI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/3/8 20:34, chenyi2000@zju.edu.cn wrote:
> From: Yi Chen<chenyi2000@zju.edu.cn>
>
> Trap accesses to hgatp if MSTATUS_TVM is enabled.
> Don't trap accesses to vsatp even if MSTATUS_TVM is enabled.

By the way, do you know why mstatus_tvm and hstatus_tvm are needed?

The specification said,

The TVM mechanism improves virtualization efficiency by permitting guest operating systems to
execute in S-mode, rather than classically virtualizing them in U-mode. This approach obviates
the need to trap accesses to most S-mode CSRs.

I don't know how the tvm field obviates the need to trap accesses to 
most S-mode CSRs.

Thanks,
Zhiwei

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
--------------Q3SsejpLbgmwUjK7Bx0YaGKI
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
Don't trap accesses to vsatp even if MSTATUS_TVM is enabled.</pre>
    </blockquote>
    <p>By the way, do you know why mstatus_tvm and hstatus_tvm are
      needed?</p>
    <p>The specification said,</p>
    <pre>The TVM mechanism improves virtualization efficiency by permitting guest operating systems to
execute in S-mode, rather than classically virtualizing them in U-mode. This approach obviates
the need to trap accesses to most S-mode CSRs.
</pre>
    <p>I don't know how the tvm field obviates the need to trap accesses
      to most S-mode CSRs.<br>
    </p>
    <p>Thanks,<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite"
      cite="mid:20230308123417.12555-1-chenyi2000@zju.edu.cn">
      <pre class="moz-quote-pre" wrap="">

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
         return RISCV_EXCP_ILLEGAL_INST;
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
+        return RISCV_EXCP_ILLEGAL_INST;
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

--------------Q3SsejpLbgmwUjK7Bx0YaGKI--

