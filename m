Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqRA7-0002mp-GZ
	for mharc-qemu-riscv@gnu.org; Sun, 15 May 2022 23:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqRA6-0002kO-4J; Sun, 15 May 2022 23:12:46 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:45760 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqRA2-0007xg-Sk; Sun, 15 May 2022 23:12:45 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAD3c+EdwYFimvYXBw--.62827S2;
 Mon, 16 May 2022 11:12:30 +0800 (CST)
Subject: Re: [PATCH v2 5/5] target/riscv: Move/refactor ISA extension checks
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>, Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
 <c3145fa37a529484cf3047c8cb9841e9effad4b0.1652583332.git.research_trasio@irq.a4lg.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <afb58d24-4ba9-7229-8aed-870593222516@iscas.ac.cn>
Date: Mon, 16 May 2022 11:12:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c3145fa37a529484cf3047c8cb9841e9effad4b0.1652583332.git.research_trasio@irq.a4lg.com>
Content-Type: multipart/alternative;
 boundary="------------9DDCE4E890982D4B2497A537"
Content-Language: en-US
X-CM-TRANSID: rQCowAD3c+EdwYFimvYXBw--.62827S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw4rGF13Zw1rWry8ur1fCrg_yoW5Gryrpr
 47Ga9IkryDGr1xC3yfXF1UK3W5ur1xKaySg39aq3WxGFW3KrWaqr1vkw18WFWYqwn5Xa1f
 uFy7CrnrZFsrJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv
 7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7
 Aq67IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUjzBT5UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 16 May 2022 03:12:46 -0000

This is a multi-part message in MIME format.
--------------9DDCE4E890982D4B2497A537
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/5/15 上午10:56, Tsukasa OI 写道:
> We should separate "check" and "configure" steps as possible.
> This commit separates both steps except vector/Zfinx-related checks.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>   target/riscv/cpu.c | 31 ++++++++++++++++---------------
>   1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f910a41407..5ab246bf63 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -630,14 +630,27 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>               return;
>           }
>   
> +        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
> +            error_setg(errp, "Zve32f/Zve64f extensions require F extension");
> +            return;
> +        }
> +
> +        /* Set the ISA extensions, checks should have happened above */
>           if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
>               cpu->cfg.ext_zhinxmin) {
>               cpu->cfg.ext_zfinx = true;
>           }
>   
> -        if (cpu->cfg.ext_zfinx && !cpu->cfg.ext_icsr) {
> -            error_setg(errp, "Zfinx extension requires Zicsr");
> -            return;
> +        if (cpu->cfg.ext_zfinx) {
> +            if (!cpu->cfg.ext_icsr) {
> +                error_setg(errp, "Zfinx extension requires Zicsr");
> +                return;
> +            }
> +            if (cpu->cfg.ext_f) {
> +                error_setg(errp,
> +                    "Zfinx cannot be supported together with F extension");
> +                return;
> +            }
>           }

I think these checks for non-single-letter extensions are  better to 
move  out of the 'if (env->misa_ext == 0)) { ...}', since they are enabled

directly by cfg property, such as we can set cpu option to sifive-u34 
with zfinx=true. This may not be a proper way to set cpu option,

However it's truly a legal command option, but  configure an illegal 
supported ISA which enable both f and zfinx.

Regards,

Weiwei Li

>   
>           if (cpu->cfg.ext_zk) {
> @@ -663,7 +676,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>               cpu->cfg.ext_zksh = true;
>           }
>   
> -        /* Set the ISA extensions, checks should have happened above */
>           if (cpu->cfg.ext_i) {
>               ext |= RVI;
>           }
> @@ -734,20 +746,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>               }
>               set_vext_version(env, vext_version);
>           }
> -        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
> -            error_setg(errp, "Zve32f/Zve64f extension depends upon RVF.");
> -            return;
> -        }
>           if (cpu->cfg.ext_j) {
>               ext |= RVJ;
>           }
> -        if (cpu->cfg.ext_zfinx && ((ext & (RVF | RVD)) || cpu->cfg.ext_zfh ||
> -                                   cpu->cfg.ext_zfhmin)) {
> -            error_setg(errp,
> -                    "'Zfinx' cannot be supported together with 'F', 'D', 'Zfh',"
> -                    " 'Zfhmin'");
> -            return;
> -        }
>   
>           set_misa(env, env->misa_mxl, ext);
>       }

--------------9DDCE4E890982D4B2497A537
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/5/15 上午10:56, Tsukasa OI 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:c3145fa37a529484cf3047c8cb9841e9effad4b0.1652583332.git.research_trasio@irq.a4lg.com">
      <pre class="moz-quote-pre" wrap="">We should separate "check" and "configure" steps as possible.
This commit separates both steps except vector/Zfinx-related checks.

Signed-off-by: Tsukasa OI <a class="moz-txt-link-rfc2396E" href="mailto:research_trasio@irq.a4lg.com">&lt;research_trasio@irq.a4lg.com&gt;</a>
---
 target/riscv/cpu.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f910a41407..5ab246bf63 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -630,14 +630,27 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
+        if ((cpu-&gt;cfg.ext_zve32f || cpu-&gt;cfg.ext_zve64f) &amp;&amp; !cpu-&gt;cfg.ext_f) {
+            error_setg(errp, "Zve32f/Zve64f extensions require F extension");
+            return;
+        }
+
+        /* Set the ISA extensions, checks should have happened above */
         if (cpu-&gt;cfg.ext_zdinx || cpu-&gt;cfg.ext_zhinx ||
             cpu-&gt;cfg.ext_zhinxmin) {
             cpu-&gt;cfg.ext_zfinx = true;
         }
 
-        if (cpu-&gt;cfg.ext_zfinx &amp;&amp; !cpu-&gt;cfg.ext_icsr) {
-            error_setg(errp, "Zfinx extension requires Zicsr");
-            return;
+        if (cpu-&gt;cfg.ext_zfinx) {
+            if (!cpu-&gt;cfg.ext_icsr) {
+                error_setg(errp, "Zfinx extension requires Zicsr");
+                return;
+            }
+            if (cpu-&gt;cfg.ext_f) {
+                error_setg(errp,
+                    "Zfinx cannot be supported together with F extension");
+                return;
+            }
         }</pre>
    </blockquote>
    <p>I think these checks for non-single-letter extensions are  better
      to move  out of the 'if (env-&gt;misa_ext == 0)) { ...}', since
      they are enabled</p>
    <p> directly by cfg property, such as we can set cpu option to <font
        color="#0e170a">sifive-u34 with zfinx=true. This may not be a
        proper way to set cpu option, <br>
      </font></p>
    <p><font color="#0e170a">However it's truly a legal command option,
        but  configure an illegal supported ISA which enable both f and
        zfinx.</font></p>
    <p><font color="#0e170a">Regards,</font></p>
    <p><font color="#0e170a">Weiwei Li<br>
      </font></p>
    <blockquote type="cite"
cite="mid:c3145fa37a529484cf3047c8cb9841e9effad4b0.1652583332.git.research_trasio@irq.a4lg.com">
      <pre class="moz-quote-pre" wrap="">
 
         if (cpu-&gt;cfg.ext_zk) {
@@ -663,7 +676,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             cpu-&gt;cfg.ext_zksh = true;
         }
 
-        /* Set the ISA extensions, checks should have happened above */
         if (cpu-&gt;cfg.ext_i) {
             ext |= RVI;
         }
@@ -734,20 +746,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
-        if ((cpu-&gt;cfg.ext_zve32f || cpu-&gt;cfg.ext_zve64f) &amp;&amp; !cpu-&gt;cfg.ext_f) {
-            error_setg(errp, "Zve32f/Zve64f extension depends upon RVF.");
-            return;
-        }
         if (cpu-&gt;cfg.ext_j) {
             ext |= RVJ;
         }
-        if (cpu-&gt;cfg.ext_zfinx &amp;&amp; ((ext &amp; (RVF | RVD)) || cpu-&gt;cfg.ext_zfh ||
-                                   cpu-&gt;cfg.ext_zfhmin)) {
-            error_setg(errp,
-                    "'Zfinx' cannot be supported together with 'F', 'D', 'Zfh',"
-                    " 'Zfhmin'");
-            return;
-        }
 
         set_misa(env, env-&gt;misa_mxl, ext);
     }
</pre>
    </blockquote>
  </body>
</html>

--------------9DDCE4E890982D4B2497A537--


