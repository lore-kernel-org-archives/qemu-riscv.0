Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paIBa-0003QS-Rr
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 10:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1paIBS-0003Mi-Og; Thu, 09 Mar 2023 10:28:03 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1paIBP-0007Wh-GE; Thu, 09 Mar 2023 10:27:58 -0500
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-01 (Coremail) with SMTP id qwCowAAnJEDy+glkzkVrDQ--.22680S2;
 Thu, 09 Mar 2023 23:27:46 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------7cWHIhhR5oskOqIpmOaBJvfL"
Message-ID: <aba228b8-03fa-c096-72bf-1b920cbe4f9f@iscas.ac.cn>
Date: Thu, 9 Mar 2023 23:27:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH] target/riscv/csr.c: fix H extension TVM trap
Content-Language: en-US
To: CHEN Yi <chenyi2000@zju.edu.cn>, qemu-devel@nongnu.org
References: <20230308123417.12555-1-chenyi2000@zju.edu.cn>
 <18d2b7d5-fa56-eb32-4803-74e85f24e1a2@iscas.ac.cn>
 <3b6c6f15.8a1c1.186c6e4ff7d.Coremail.chenyi2000@zju.edu.cn>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <3b6c6f15.8a1c1.186c6e4ff7d.Coremail.chenyi2000@zju.edu.cn>
X-CM-TRANSID: qwCowAAnJEDy+glkzkVrDQ--.22680S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFWkGFWrXryUZr48uFyxuFg_yoW5uFy8pF
 48tw4YkayUKrWqvanaqr1qgF15ArWUGa9rAw1xGay8Aw1fAry5CFyDX3yaqr1DWFWkXFW2
 vFWDuF93AF42ka7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 I_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
 W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1g4S7UUUUU==
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
X-List-Received-Date: Thu, 09 Mar 2023 15:28:05 -0000

This is a multi-part message in MIME format.
--------------7cWHIhhR5oskOqIpmOaBJvfL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/3/9 23:02, CHEN Yi wrote:
>
>
>
>     -----Original Messages-----
>     *From:*liweiwei <liweiwei@iscas.ac.cn>
>     *Sent Time:*2023-03-09 15:48:17 (Thursday)
>     *To:* chenyi2000@zju.edu.cn, qemu-devel@nongnu.org
>     *Cc:* "Palmer Dabbelt" <palmer@dabbelt.com>, "Alistair Francis"
>     <alistair.francis@wdc.com>, "Bin Meng" <bin.meng@windriver.com>,
>     "Daniel Henrique Barboza" <dbarboza@ventanamicro.com>, "Liu
>     Zhiwei" <zhiwei_liu@linux.alibaba.com>, "open list:RISC-V TCG
>     CPUs" <qemu-riscv@nongnu.org>
>     *Subject:* Re: [PATCH] target/riscv/csr.c: fix H extension TVM trap
>
>
>     On 2023/3/8 20:34, chenyi2000@zju.edu.cn wrote:
>>     From: Yi Chen<chenyi2000@zju.edu.cn>  Trap accesses to hgatp if MSTATUS_TVM is enabled.
>>     Don't trap accesses to vsatp even if MSTATUS_TVM is enabled.
>>
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
>
>     This line seems too long (> 80).
>
>     And hstatus.VTVM should also be taken into consideration.
>
>     Similar to following write_satp.
>
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
>
>
> Thanks a lot. In the next version, I will fix the code style issue and 
> consider hstatus.VTVM.
>
>
>>     @@ -3047,14 +3047,24 @@ static RISCVException read_hgeip(CPURISCVState *env, int csrno,
>>       static RISCVException read_hgatp(CPURISCVState *env, int csrno,
>>                                        target_ulong *val)
>>       {
>>     -    *val = env->hgatp;
>>     +    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>>     +        return RISCV_EXCP_ILLEGAL_INST;
>
>     This check will do before privilege check in riscv_csrrw_check. So
>     it will make VS mode access trigger
>
>     ILLEGAL_INST exception, However, it should be VIRTUAL_INST
>     exception in this case.
>
>     Regards,
>
>     Weiwei Li
>
>
>
> In riscv_csrrw(), riscv_csrrw_check() is called before 
> riscv_csrrw_do64(). So I think VIRTUAL_INST will be triggered. Could 
> you please explain why this check will do before the privilege check 
> in riscv_csrrw_check? I'm new to Qemu source code and am sorry I can't 
> understand that.
>
>
Yeah, You are right. Sorry that I mistook this check for check in the 
predicate.

By the way, I think this check is better to be done in the predicate.

Regards,

Weiwei Li

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
>>       
>
>
> Thanks,
>
> Yi
>
--------------7cWHIhhR5oskOqIpmOaBJvfL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/3/9 23:02, CHEN Yi wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3b6c6f15.8a1c1.186c6e4ff7d.Coremail.chenyi2000@zju.edu.cn">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <br>
      <br>
      <br>
      <blockquote name="replyContent" class="ReferenceQuote"
        style="padding-left:5px;margin-left:5px;border-left:#b6b6b6 2px
        solid;margin-right:0;"> -----Original Messages-----<br>
        <b>From:</b><span id="rc_from">liweiwei
          <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a></span><br>
        <b>Sent Time:</b><span id="rc_senttime">2023-03-09 15:48:17
          (Thursday)</span><br>
        <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:chenyi2000@zju.edu.cn">chenyi2000@zju.edu.cn</a>, <a class="moz-txt-link-abbreviated" href="mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a><br>
        <b>Cc:</b> "Palmer Dabbelt" <a class="moz-txt-link-rfc2396E" href="mailto:palmer@dabbelt.com">&lt;palmer@dabbelt.com&gt;</a>,
        "Alistair Francis" <a class="moz-txt-link-rfc2396E" href="mailto:alistair.francis@wdc.com">&lt;alistair.francis@wdc.com&gt;</a>, "Bin Meng"
        <a class="moz-txt-link-rfc2396E" href="mailto:bin.meng@windriver.com">&lt;bin.meng@windriver.com&gt;</a>, "Daniel Henrique Barboza"
        <a class="moz-txt-link-rfc2396E" href="mailto:dbarboza@ventanamicro.com">&lt;dbarboza@ventanamicro.com&gt;</a>, "Liu Zhiwei"
        <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@linux.alibaba.com">&lt;zhiwei_liu@linux.alibaba.com&gt;</a>, "open list:RISC-V TCG
        CPUs" <a class="moz-txt-link-rfc2396E" href="mailto:qemu-riscv@nongnu.org">&lt;qemu-riscv@nongnu.org&gt;</a><br>
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
Don't trap accesses to vsatp even if MSTATUS_TVM is enabled.

Signed-off-by: Yi Chen <a class="moz-txt-link-rfc2396E" href="mailto:chenyi2000@zju.edu.cn" moz-do-not-send="true">&lt;chenyi2000@zju.edu.cn&gt;</a> ---
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
        <p> This line seems too long (&gt; 80). </p>
        <p> And hstatus.VTVM should also be taken into consideration. </p>
        <p> Similar to following write_satp. </p>
        <blockquote type="cite"
          cite="mid:20230308123417.12555-1-chenyi2000@zju.edu.cn">
          <pre class="moz-quote-pre" wrap="">     } else {
         *val = env-&gt;satp;
@@ -2683,7 +2683,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
     }
 
     if (vm &amp;&amp; mask) {
-        if (env-&gt;priv == PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {
+        if (env-&gt;priv == PRV_S &amp;&amp; !riscv_cpu_virt_enabled(env) &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             /*</pre>
        </blockquote>
      </blockquote>
      <p> <br>
      </p>
      <p> Thanks a lot. In the next version, I will fix the code style
        issue and consider hstatus.VTVM.
      </p>
      <p> <br>
      </p>
      <blockquote name="replyContent" class="ReferenceQuote"
        style="padding-left:5px;margin-left:5px;border-left:#b6b6b6 2px
        solid;margin-right:0;">
        <blockquote type="cite"
          cite="mid:20230308123417.12555-1-chenyi2000@zju.edu.cn">
          <pre class="moz-quote-pre" wrap="">@@ -3047,14 +3047,24 @@ static RISCVException read_hgeip(CPURISCVState *env, int csrno,
 static RISCVException read_hgatp(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
-    *val = env-&gt;hgatp;
+    if (env-&gt;priv == PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;</pre>
        </blockquote>
        <p> This check will do before privilege check in <span
            style="color:#000000;">riscv_csrrw_check</span>. So it will
          make VS mode access trigger </p>
        <p> ILLEGAL_INST exception, However, it should be VIRTUAL_INST
          exception in this case. </p>
        <p> Regards, </p>
        <p> Weiwei Li </p>
        <p> <br>
        </p>
      </blockquote>
      <p> <br>
      </p>
      <p> In riscv_csrrw(), riscv_csrrw_check() is called before
        riscv_csrrw_do64(). So I think VIRTUAL_INST will be triggered.
        Could you please explain why this check will do before the
        privilege check in riscv_csrrw_check? I'm new to Qemu source
        code and am sorry I can't understand that.<span
          style="font-family:&quot;Source Han Sans
          SC&quot;;font-size:medium;white-space:normal;"></span>
      </p>
      <p> <br>
      </p>
    </blockquote>
    <p>Yeah, You are right. Sorry that I mistook this check for check in
      the predicate.</p>
    <p>By the way, I think this check is better to be done in the
      predicate.</p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
      cite="mid:3b6c6f15.8a1c1.186c6e4ff7d.Coremail.chenyi2000@zju.edu.cn">
      <p>
      </p>
      <blockquote name="replyContent" class="ReferenceQuote"
        style="padding-left:5px;margin-left:5px;border-left:#b6b6b6 2px
        solid;margin-right:0;">
        <blockquote type="cite"
          cite="mid:20230308123417.12555-1-chenyi2000@zju.edu.cn">
          <pre class="moz-quote-pre" wrap="">+    } else {
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
      </blockquote>
      <p> <br>
      </p>
      <p> Thanks,
      </p>
      <p> Yi
      </p>
    </blockquote>
  </body>
</html>

--------------7cWHIhhR5oskOqIpmOaBJvfL--


