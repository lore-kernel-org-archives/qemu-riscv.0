Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llROX-000401-R3
	for mharc-qemu-riscv@gnu.org; Tue, 25 May 2021 03:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1llROV-0003zZ-Pr; Tue, 25 May 2021 03:22:27 -0400
Received: from out28-170.mail.aliyun.com ([115.124.28.170]:40214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1llROR-0000Ll-Pi; Tue, 25 May 2021 03:22:27 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07176567|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0126492-8.3722e-05-0.987267;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KIP.QLB_1621927328; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KIP.QLB_1621927328)
 by smtp.aliyun-inc.com(10.147.42.253);
 Tue, 25 May 2021 15:22:09 +0800
Subject: Re: [PATCH] target/riscv: hardwire bits in hideleg and hedeleg
To: Jose Martins <josemartins90@gmail.com>, qemu-devel@nongnu.org
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210522155902.374439-1-josemartins90@gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <434d8825-8bd6-5344-aea2-e176fad6183e@c-sky.com>
Date: Tue, 25 May 2021 15:22:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210522155902.374439-1-josemartins90@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------3A719C23A2C0B1D4B11E73BA"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.170; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-170.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 May 2021 07:22:28 -0000

This is a multi-part message in MIME format.
--------------3A719C23A2C0B1D4B11E73BA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/22/21 11:59 PM, Jose Martins wrote:
> The specification mandates for certain bits to be hardwired in the
> hypervisor delegation registers. This was not being enforced.
>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>
> ---
>   target/riscv/csr.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d2585395bf..9b74a00cc9 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -394,6 +394,7 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
>   
>   static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
>                                              VS_MODE_INTERRUPTS;
> +static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
We can use it directly if only one macro VS_MODE_INTERRUPTS.
>   static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
>                                        VS_MODE_INTERRUPTS;
>   static const target_ulong delegable_excps =
> @@ -416,6 +417,14 @@ static const target_ulong delegable_excps =
>       (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
>       (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
>       (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
> +static const target_ulong vs_delegable_excps = delegable_excps &
> +    ~((1ULL << (RISCV_EXCP_S_ECALL)) |
> +    (1ULL << (RISCV_EXCP_VS_ECALL)) |
I didn't find that the RISCV_EXCP_VS_ECALL should be read-only 0 from 
the specification.
> +    (1ULL << (RISCV_EXCP_M_ECALL)) |
> +    (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) |
> +    (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
> +    (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
> +    (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
>   static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
>       SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
>       SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
> @@ -963,7 +972,7 @@ static int read_hedeleg(CPURISCVState *env, int csrno, target_ulong *val)
>   
>   static int write_hedeleg(CPURISCVState *env, int csrno, target_ulong val)
>   {
> -    env->hedeleg = val;
> +    env->hedeleg = val & vs_delegable_excps;

I think it's OK here.

However, as hedeleg is WARL, you had better reserve the other fields 
like medeleg:

	env->medeleg = (env->medeleg & ~delegable_excps) | (val & delegable_excps);

I really don't understand why medeleg codes this way. Is there anyone 
can give a better explanation?

>       return 0;
>   }
>   
> @@ -975,7 +984,7 @@ static int read_hideleg(CPURISCVState *env, int csrno, target_ulong *val)
>   
>   static int write_hideleg(CPURISCVState *env, int csrno, target_ulong val)
>   {
> -    env->hideleg = val;
> +    env->hideleg = val & vs_delegable_ints;
>       return 0;
>   }
>   

The similar comments for hedeleg.

Zhiwei


--------------3A719C23A2C0B1D4B11E73BA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/22/21 11:59 PM, Jose Martins
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210522155902.374439-1-josemartins90@gmail.com">
      <pre class="moz-quote-pre" wrap="">The specification mandates for certain bits to be hardwired in the
hypervisor delegation registers. This was not being enforced.

Signed-off-by: Jose Martins <a class="moz-txt-link-rfc2396E" href="mailto:josemartins90@gmail.com">&lt;josemartins90@gmail.com&gt;</a>
---
 target/riscv/csr.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d2585395bf..9b74a00cc9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -394,6 +394,7 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 
 static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
+static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;</pre>
    </blockquote>
    We can use it directly if only one macro VS_MODE_INTERRUPTS.<br>
    <blockquote type="cite"
      cite="mid:20210522155902.374439-1-josemartins90@gmail.com">
      <pre class="moz-quote-pre" wrap="">
 static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
                                      VS_MODE_INTERRUPTS;
 static const target_ulong delegable_excps =
@@ -416,6 +417,14 @@ static const target_ulong delegable_excps =
     (1ULL &lt;&lt; (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
     (1ULL &lt;&lt; (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
     (1ULL &lt;&lt; (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
+static const target_ulong vs_delegable_excps = delegable_excps &amp;
+    ~((1ULL &lt;&lt; (RISCV_EXCP_S_ECALL)) |
+    (1ULL &lt;&lt; (RISCV_EXCP_VS_ECALL)) |</pre>
    </blockquote>
    I didn't find that the RISCV_EXCP_VS_ECALL should be read-only 0
    from the specification.<br>
    <blockquote type="cite"
      cite="mid:20210522155902.374439-1-josemartins90@gmail.com">
      <pre class="moz-quote-pre" wrap="">
+    (1ULL &lt;&lt; (RISCV_EXCP_M_ECALL)) |
+    (1ULL &lt;&lt; (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) |
+    (1ULL &lt;&lt; (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
+    (1ULL &lt;&lt; (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
+    (1ULL &lt;&lt; (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
@@ -963,7 +972,7 @@ static int read_hedeleg(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_hedeleg(CPURISCVState *env, int csrno, target_ulong val)
 {
-    env-&gt;hedeleg = val;
+    env-&gt;hedeleg = val &amp; vs_delegable_excps;</pre>
    </blockquote>
    <p>I think it's OK here.<br>
    </p>
    <p>However, as hedeleg is WARL, you had better reserve the other
      fields like medeleg:</p>
    <pre>	env-&gt;medeleg = (env-&gt;medeleg &amp; ~delegable_excps) | (val &amp; delegable_excps);

</pre>
    <p>I really don't understand why medeleg codes this way. Is there
      anyone can give a better explanation?<br>
    </p>
    <blockquote type="cite"
      cite="mid:20210522155902.374439-1-josemartins90@gmail.com">
      <pre class="moz-quote-pre" wrap="">
     return 0;
 }
 
@@ -975,7 +984,7 @@ static int read_hideleg(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_hideleg(CPURISCVState *env, int csrno, target_ulong val)
 {
-    env-&gt;hideleg = val;
+    env-&gt;hideleg = val &amp; vs_delegable_ints;
     return 0;
 }
 </pre>
    </blockquote>
    <p>The similar comments for hedeleg.</p>
    <p>Zhiwei<br>
    </p>
    <blockquote type="cite"
      cite="mid:20210522155902.374439-1-josemartins90@gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3A719C23A2C0B1D4B11E73BA--

