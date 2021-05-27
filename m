Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmBZh-000844-Is
	for mharc-qemu-riscv@gnu.org; Thu, 27 May 2021 04:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lmBZf-00082R-4X; Thu, 27 May 2021 04:41:03 -0400
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:50133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lmBZa-00072X-69; Thu, 27 May 2021 04:41:01 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436848|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.0526879-0.000351409-0.946961;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KJTSSyt_1622104846; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KJTSSyt_1622104846)
 by smtp.aliyun-inc.com(10.147.41.121);
 Thu, 27 May 2021 16:40:47 +0800
Subject: Re: [PATCH v3] target/riscv: fix VS interrupts forwarding to HS
To: Jose Martins <josemartins90@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210522154429.361235-1-josemartins90@gmail.com>
 <94455d68-c088-5875-d115-acd95829406e@c-sky.com>
 <CAC41xo3XAWZrqtFxiLDQ+H4fr=FVkWmZfe8P+PaTx-MPU_fpfw@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <578409c2-c267-7f93-d9b5-c408ed8aa10e@c-sky.com>
Date: Thu, 27 May 2021 16:40:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAC41xo3XAWZrqtFxiLDQ+H4fr=FVkWmZfe8P+PaTx-MPU_fpfw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------96DF4F93F7A939B304A0C2E6"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.221; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-221.mail.aliyun.com
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
X-List-Received-Date: Thu, 27 May 2021 08:41:03 -0000

This is a multi-part message in MIME format.
--------------96DF4F93F7A939B304A0C2E6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/26/21 7:50 PM, Jose Martins wrote:
> Hello Zhiwei, thank you for reviewing the patch.
>
> I'll split the patch in a series as you suggest. But first can you
> help me understand what the problems are with
> riscv_cpu_local_irq_pending?
>
>> I think there are two errors in riscv_cpu_local_irq_pending.
>>
>> 1) VS interrupts can't be forwarded to hs-mode rightly . It has
>> nothing to do with delegate or not in hideleg. The reason is that
>> VS interrupts are always discarded when V=0 in
>> riscv_cpu_local_irq_pending.
> I don't see why this is the case. The way I see it, VS interrupts are
> only discarded for V=0 *iff* they are delegated in mideleg/hideleg.
First I paste the code to ensure we are talking about the same version.

  static int riscv_cpu_local_irq_pending(CPURISCVState *env)

  {

      target_ulong irqs;

  

      target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);

      target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);

      target_ulong hs_mstatus_sie = get_field(env->mstatus_hs, MSTATUS_SIE);

  

      target_ulong pending = env->mip & env->mie &

                                 ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);

      target_ulong vspending = (env->mip & env->mie &

                                (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));

  

      target_ulong mie    = env->priv < PRV_M ||

                            (env->priv == PRV_M && mstatus_mie);

      target_ulong sie    = env->priv < PRV_S ||

                            (env->priv == PRV_S && mstatus_sie);

      target_ulong hs_sie = env->priv < PRV_S ||

                            (env->priv == PRV_S && hs_mstatus_sie);

  

      if (riscv_cpu_virt_enabled(env)) {

          target_ulong pending_hs_irq = pending & -hs_sie;

  

          if (pending_hs_irq) {

              riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);

              return ctz64(pending_hs_irq);

          }

  

          pending = vspending;

      }

  

      irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);

  

      if (irqs) {

          return ctz64(irqs); /* since non-zero */

      } else {

          return RISCV_EXCP_NONE; /* indicates no pending interrupt */

      }

  }

Only when VS = 0, the variable vspending can transfer to
variable pending. Any interrupt not included in variable pending
is discarded.

That's why I say VS interrupts are always discarded
when V=0 in riscv_cpu_local_irq_pending.
> I
> actually tested it and I see the correct forwarding of vs-mode
> interrupts to hs-mode. I tested it by running in hs-mode with all the
> needed interrupt enables set, the interrupts not delegated in hideleg,
> and forcing the trigger of the interrupt by writing hvip. But maybe
> there are some corner cases I'm not taking into account. Can you
> explain this further? Maybe walk me through an example of when this
> issue might occur.
>
>> 2) Use MSTATUS_SIE in mstatus_hs to select pending_hs_irqs.

I mean the second error is to misuse MSATUS_SIE in mstatus_hs to
select pending_hs_irqs.

> I don't think you need to go through mstatus_hs to get the correct sie
> state.
Agree.
> My logic behind this is: env->mstatus will have the vs-level
> sie if V=1 and hs-level sie if V=0. Due to the short-circuiting
> property of the logic operators the sie variable will only have an
> effect on hsie if V=0 and on vsie if V=1. So the value of sie is only
> used in the correct context.

The  swap regs funciton has done the right thing.

I think V mode and hideleg/mideleg  make it possible to process

VS interrupt or HS interrupt like other interrupts.

Zhiwei

>
> Again, please correct me if I'm wrong. I might be missing something.
>
> Best,
> José

--------------96DF4F93F7A939B304A0C2E6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/26/21 7:50 PM, Jose Martins wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAC41xo3XAWZrqtFxiLDQ+H4fr=FVkWmZfe8P+PaTx-MPU_fpfw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hello Zhiwei, thank you for reviewing the patch.

I'll split the patch in a series as you suggest. But first can you
help me understand what the problems are with
riscv_cpu_local_irq_pending?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I think there are two errors in riscv_cpu_local_irq_pending.

1) VS interrupts can't be forwarded to hs-mode rightly . It has
nothing to do with delegate or not in hideleg. The reason is that
VS interrupts are always discarded when V=0 in
riscv_cpu_local_irq_pending.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't see why this is the case. The way I see it, VS interrupts are
only discarded for V=0 *iff* they are delegated in mideleg/hideleg.  </pre>
    </blockquote>
    First I paste the code to ensure we are talking about the same
    version.<br>
    <pre> static int riscv_cpu_local_irq_pending(CPURISCVState *env)
</pre>
    <pre> {
</pre>
    <pre>     target_ulong irqs;
</pre>
    <pre> </pre>
    <pre>     target_ulong mstatus_mie = get_field(env-&gt;mstatus, MSTATUS_MIE);
</pre>
    <pre>     target_ulong mstatus_sie = get_field(env-&gt;mstatus, MSTATUS_SIE);
</pre>
    <pre>     target_ulong hs_mstatus_sie = get_field(env-&gt;mstatus_hs, MSTATUS_SIE);
</pre>
    <pre> </pre>
    <pre>     target_ulong pending = env-&gt;mip &amp; env-&gt;mie &amp;
</pre>
    <pre>                                ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
</pre>
    <pre>     target_ulong vspending = (env-&gt;mip &amp; env-&gt;mie &amp;
</pre>
    <pre>                               (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
</pre>
    <pre> </pre>
    <pre>     target_ulong mie    = env-&gt;priv &lt; PRV_M ||
</pre>
    <pre>                           (env-&gt;priv == PRV_M &amp;&amp; mstatus_mie);
</pre>
    <pre>     target_ulong sie    = env-&gt;priv &lt; PRV_S ||
</pre>
    <pre>                           (env-&gt;priv == PRV_S &amp;&amp; mstatus_sie);
</pre>
    <pre>     target_ulong hs_sie = env-&gt;priv &lt; PRV_S ||
</pre>
    <pre>                           (env-&gt;priv == PRV_S &amp;&amp; hs_mstatus_sie);
</pre>
    <pre> </pre>
    <pre>     if (riscv_cpu_virt_enabled(env)) {
</pre>
    <pre>         target_ulong pending_hs_irq = pending &amp; -hs_sie;
</pre>
    <pre> </pre>
    <pre>         if (pending_hs_irq) {
</pre>
    <pre>             riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
</pre>
    <pre>             return ctz64(pending_hs_irq);
</pre>
    <pre>         }
</pre>
    <pre> </pre>
    <pre>         pending = vspending;
</pre>
    <pre>     }
</pre>
    <pre> </pre>
    <pre>     irqs = (pending &amp; ~env-&gt;mideleg &amp; -mie) | (pending &amp;  env-&gt;mideleg &amp; -sie);
</pre>
    <pre> </pre>
    <pre>     if (irqs) {
</pre>
    <pre>         return ctz64(irqs); /* since non-zero */
</pre>
    <pre>     } else {
</pre>
    <pre>         return RISCV_EXCP_NONE; /* indicates no pending interrupt */
</pre>
    <pre>     }
</pre>
    <pre> }
</pre>
    Only when VS = 0, the variable vspending can transfer to<br>
    variable pending. Any interrupt not included in variable pending<br>
    is discarded. <br>
    <br>
    That's why I say VS interrupts are always discarded<br>
    when V=0 in riscv_cpu_local_irq_pending.
    <blockquote type="cite"
cite="mid:CAC41xo3XAWZrqtFxiLDQ+H4fr=FVkWmZfe8P+PaTx-MPU_fpfw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">I
actually tested it and I see the correct forwarding of vs-mode
interrupts to hs-mode. I tested it by running in hs-mode with all the
needed interrupt enables set, the interrupts not delegated in hideleg,
and forcing the trigger of the interrupt by writing hvip. But maybe
there are some corner cases I'm not taking into account. Can you
explain this further? Maybe walk me through an example of when this
issue might occur.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">2) Use MSTATUS_SIE in mstatus_hs to select pending_hs_irqs.
</pre>
      </blockquote>
    </blockquote>
    <p>I mean the second error is to misuse MSATUS_SIE in mstatus_hs to<br>
      select pending_hs_irqs.</p>
    <blockquote type="cite"
cite="mid:CAC41xo3XAWZrqtFxiLDQ+H4fr=FVkWmZfe8P+PaTx-MPU_fpfw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
I don't think you need to go through mstatus_hs to get the correct sie
state. </pre>
    </blockquote>
    Agree.<br>
    <blockquote type="cite"
cite="mid:CAC41xo3XAWZrqtFxiLDQ+H4fr=FVkWmZfe8P+PaTx-MPU_fpfw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">My logic behind this is: env-&gt;mstatus will have the vs-level
sie if V=1 and hs-level sie if V=0. Due to the short-circuiting
property of the logic operators the sie variable will only have an
effect on hsie if V=0 and on vsie if V=1. So the value of sie is only
used in the correct context.</pre>
    </blockquote>
    <p>The  swap regs funciton has done the right thing.</p>
    <p>I think V mode and hideleg/mideleg  make it possible to process<br>
    </p>
    <p>VS interrupt or HS interrupt like other interrupts.</p>
    <p>Zhiwei<br>
    </p>
    <blockquote type="cite"
cite="mid:CAC41xo3XAWZrqtFxiLDQ+H4fr=FVkWmZfe8P+PaTx-MPU_fpfw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Again, please correct me if I'm wrong. I might be missing something.

Best,
José
</pre>
    </blockquote>
  </body>
</html>

--------------96DF4F93F7A939B304A0C2E6--

