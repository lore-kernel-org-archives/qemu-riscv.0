Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paYuA-0001oR-7i
	for mharc-qemu-riscv@gnu.org; Fri, 10 Mar 2023 04:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1paYu8-0001ni-09; Fri, 10 Mar 2023 04:19:12 -0500
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1paYu5-0004GJ-4w; Fri, 10 Mar 2023 04:19:11 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VdWqkPa_1678439937; 
Received: from 30.221.99.193(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdWqkPa_1678439937) by smtp.aliyun-inc.com;
 Fri, 10 Mar 2023 17:18:58 +0800
Content-Type: multipart/alternative;
 boundary="------------lYG1tp08znSCecnfBehMxMjN"
Message-ID: <c78fd321-d287-f55e-fecf-1823367ea485@linux.alibaba.com>
Date: Fri, 10 Mar 2023 17:18:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/riscv/csr.c: fix H extension TVM trap
Content-Language: en-US
To: CHEN Yi <chenyi2000@zju.edu.cn>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230308123417.12555-1-chenyi2000@zju.edu.cn>
 <087472fc-94f1-165d-9776-8e12d60be09d@linux.alibaba.com>
 <33d93933.8ba4c.186cac784e7.Coremail.chenyi2000@zju.edu.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <33d93933.8ba4c.186cac784e7.Coremail.chenyi2000@zju.edu.cn>
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 10 Mar 2023 09:19:12 -0000

This is a multi-part message in MIME format.
--------------lYG1tp08znSCecnfBehMxMjN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/3/10 17:08, CHEN Yi wrote:
>
>     -----Original Messages-----
>     *From:*"LIU Zhiwei" <zhiwei_liu@linux.alibaba.com>
>     *Sent Time:*2023-03-10 10:12:10 (Friday)
>     *To:* chenyi2000@zju.edu.cn, qemu-devel@nongnu.org
>     *Cc:* "Palmer Dabbelt" <palmer@dabbelt.com>, "Alistair Francis"
>     <alistair.francis@wdc.com>, "Bin Meng" <bin.meng@windriver.com>,
>     "Weiwei Li" <liweiwei@iscas.ac.cn>, "Daniel Henrique Barboza"
>     <dbarboza@ventanamicro.com>, "open list:RISC-V TCG CPUs"
>     <qemu-riscv@nongnu.org>
>     *Subject:* Re: [PATCH] target/riscv/csr.c: fix H extension TVM trap
>
>
>     On 2023/3/8 20:34, chenyi2000@zju.edu.cn wrote:
>>     From: Yi Chen<chenyi2000@zju.edu.cn>  Trap accesses to hgatp if MSTATUS_TVM is enabled.
>>     Don't trap accesses to vsatp even if MSTATUS_TVM is enabled.
>
>     By the way, do you know why mstatus_tvm and hstatus_tvm are needed?
>
>     The specification said,
>
>     The TVM mechanism improves virtualization efficiency by permitting guest operating systems to
>     execute in S-mode, rather than classically virtualizing them in U-mode. This approach obviates
>     the need to trap accesses to most S-mode CSRs.
>
>     I don't know how the tvm field obviates the need to trap accesses
>     to most S-mode CSRs.
>
>     Thanks,
>     Zhiwei
>
> When VMs are in U-mode, their accesses to S-mode CSR registers must be 
> emulated. Otherwise, the behavior of the host OS will be affected. But 
> I guess since TVM helps insert another stage of address translation 
> below that controlled by the OS, it enables VMs to run in S-mode, 
> which means that VMs can directly use most S-mode CSR registers 
> instead of emulated ones.
>
If the guest running in S-mode, the other smode CSR accesses may break 
the host OS.

Zhiwei

>
> Best,
>
> Yi
>
>
>
>>     Signed-off-by: Yi Chen<chenyi2000@zju.edu.cn>  ---
>>       target/riscv/csr.c | 18 ++++++++++++++----
>>       1 file changed, 14 insertions(+), 4 deletions(-)
>>
>>     diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>     index ab56663..09bc780 100644
>>     --- a/target/riscv/csr.c
>>     +++ b/target/riscv/csr.c
>>     @@ -2655,7 +2655,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
>>               return RISCV_EXCP_NONE;
>>           }
>>       
>>     -    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>>     +    if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) && get_field(env->mstatus, MSTATUS_TVM)) {
>>               return RISCV_EXCP_ILLEGAL_INST;
>>           } else {
>>               *val = env->satp;
>>     @@ -2683,7 +2683,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
>>           }
>>       
>>           if (vm && mask) {
>>     -        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>>     +        if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) && get_field(env->mstatus, MSTATUS_TVM)) {
>>                   return RISCV_EXCP_ILLEGAL_INST;
>>               } else {
>>                   /*
>>     @@ -3047,14 +3047,24 @@ static RISCVException read_hgeip(CPURISCVState *env, int csrno,
>>       static RISCVException read_hgatp(CPURISCVState *env, int csrno,
>>                                        target_ulong *val)
>>       {
>>     -    *val = env->hgatp;
>>     +    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>>     +        return RISCV_EXCP_ILLEGAL_INST;
>>     +    } else {
>>     +        *val = env->hgatp;
>>     +    }
>>     +
>>           return RISCV_EXCP_NONE;
>>       }
>>       
>>       static RISCVException write_hgatp(CPURISCVState *env, int csrno,
>>                                         target_ulong val)
>>       {
>>     -    env->hgatp = val;
>>     +    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>>     +        return RISCV_EXCP_ILLEGAL_INST;
>>     +    } else {
>>     +        env->hgatp = val;
>>     +    }
>>     +
>>           return RISCV_EXCP_NONE;
>>       }
>
--------------lYG1tp08znSCecnfBehMxMjN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/3/10 17:08, CHEN Yi wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:33d93933.8ba4c.186cac784e7.Coremail.chenyi2000@zju.edu.cn">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <blockquote name="replyContent" class="ReferenceQuote"
        style="padding-left:5px;margin-left:5px;border-left:#b6b6b6 2px
        solid;margin-right:0;"> -----Original Messages-----<br>
        <b>From:</b><span id="rc_from">"LIU Zhiwei"
          <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@linux.alibaba.com">&lt;zhiwei_liu@linux.alibaba.com&gt;</a></span><br>
        <b>Sent Time:</b><span id="rc_senttime">2023-03-10 10:12:10
          (Friday)</span><br>
        <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:chenyi2000@zju.edu.cn">chenyi2000@zju.edu.cn</a>, <a class="moz-txt-link-abbreviated" href="mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a><br>
        <b>Cc:</b> "Palmer Dabbelt" <a class="moz-txt-link-rfc2396E" href="mailto:palmer@dabbelt.com">&lt;palmer@dabbelt.com&gt;</a>,
        "Alistair Francis" <a class="moz-txt-link-rfc2396E" href="mailto:alistair.francis@wdc.com">&lt;alistair.francis@wdc.com&gt;</a>, "Bin Meng"
        <a class="moz-txt-link-rfc2396E" href="mailto:bin.meng@windriver.com">&lt;bin.meng@windriver.com&gt;</a>, "Weiwei Li"
        <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a>, "Daniel Henrique Barboza"
        <a class="moz-txt-link-rfc2396E" href="mailto:dbarboza@ventanamicro.com">&lt;dbarboza@ventanamicro.com&gt;</a>, "open list:RISC-V TCG CPUs"
        <a class="moz-txt-link-rfc2396E" href="mailto:qemu-riscv@nongnu.org">&lt;qemu-riscv@nongnu.org&gt;</a><br>
        <b>Subject:</b> Re: [PATCH] target/riscv/csr.c: fix H extension
        TVM trap<br>
        <br>
        <p> <br>
        </p>
        <div class="moz-cite-prefix"> On 2023/3/8 20:34, <a
            class="moz-txt-link-abbreviated moz-txt-link-freetext"
            href="mailto:chenyi2000@zju.edu.cn" moz-do-not-send="true">chenyi2000@zju.edu.cn</a>
          wrote:<br>
        </div>
        <blockquote type="cite"
          cite="mid:20230308123417.12555-1-chenyi2000@zju.edu.cn">
          <pre class="moz-quote-pre" wrap="">From: Yi Chen <a class="moz-txt-link-rfc2396E" href="mailto:chenyi2000@zju.edu.cn" moz-do-not-send="true">&lt;chenyi2000@zju.edu.cn&gt;</a> Trap accesses to hgatp if MSTATUS_TVM is enabled.
Don't trap accesses to vsatp even if MSTATUS_TVM is enabled.</pre>
        </blockquote>
        <p> By the way, do you know why mstatus_tvm and hstatus_tvm are
          needed? </p>
        <p> The specification said, </p>
        <pre>The TVM mechanism improves virtualization efficiency by permitting guest operating systems to
execute in S-mode, rather than classically virtualizing them in U-mode. This approach obviates
the need to trap accesses to most S-mode CSRs.
</pre>
        <p> I don't know how the tvm field obviates the need to trap
          accesses to most S-mode CSRs. </p>
        <p> Thanks,<br>
          Zhiwei </p>
      </blockquote>
      <p>
      </p>
      <p> When VMs are in U-mode, their accesses to S-mode CSR registers
        must be emulated. Otherwise, the behavior of the host OS will be
        affected. But I guess since TVM helps insert another stage of
        address translation below that controlled by the OS, it enables
        VMs to run in S-mode, which means that VMs can directly use most
        S-mode CSR registers instead of emulated ones.
      </p>
    </blockquote>
    <p>If the guest running in S-mode, the other smode CSR accesses may
      break the host OS.  <br>
    </p>
    <p>Zhiwei<br>
    </p>
    <blockquote type="cite"
      cite="mid:33d93933.8ba4c.186cac784e7.Coremail.chenyi2000@zju.edu.cn">
      <p> <br>
      </p>
      <p> Best,
      </p>
      <p> Yi
      </p>
      <p> <br>
      </p>
      <blockquote name="replyContent" class="ReferenceQuote"
        style="padding-left:5px;margin-left:5px;border-left:#b6b6b6 2px
        solid;margin-right:0;">
        <p> <br>
        </p>
        <blockquote type="cite"
          cite="mid:20230308123417.12555-1-chenyi2000@zju.edu.cn">
          <pre class="moz-quote-pre" wrap="">Signed-off-by: Yi Chen <a class="moz-txt-link-rfc2396E" href="mailto:chenyi2000@zju.edu.cn" moz-do-not-send="true">&lt;chenyi2000@zju.edu.cn&gt;</a> ---
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
 } <span style="font-family:'宋体, arial, Verdana, sans-serif';"><span style="white-space:nowrap;"> </span></span></pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------lYG1tp08znSCecnfBehMxMjN--

