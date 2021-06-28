Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxlWF-0000r3-TY
	for mharc-qemu-riscv@gnu.org; Mon, 28 Jun 2021 03:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lxlWD-0000nl-W4; Mon, 28 Jun 2021 03:17:22 -0400
Received: from out28-146.mail.aliyun.com ([115.124.28.146]:49256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lxlW8-0000yA-FF; Mon, 28 Jun 2021 03:17:21 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436308|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.0303065-0.00758275-0.962111;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DU; RN=6; RT=6; SR=0; TI=SMTPD_---.KZ7mFMe_1624864621; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KZ7mFMe_1624864621)
 by smtp.aliyun-inc.com(10.147.44.145);
 Mon, 28 Jun 2021 15:17:07 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: Re: [RFC PATCH 03/11] hw/intc: Add CLIC device
To: Frank Chang <frank.chang@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-4-zhiwei_liu@c-sky.com>
 <CANzO1D0v5F4K--ACjGaMT7imyXK4vUhZpET3T7CpsEscOPUV2A@mail.gmail.com>
 <52225a77-c509-9999-9d8a-942ea407f44d@c-sky.com>
 <CAE_xrPg9qG-uOfkMeGvudWZFLUCG+7SSEbvS08iWmL_KKq7KZA@mail.gmail.com>
Message-ID: <27879b9f-bffa-96c9-a8b2-033eb0a0be4c@c-sky.com>
Date: Mon, 28 Jun 2021 15:15:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPg9qG-uOfkMeGvudWZFLUCG+7SSEbvS08iWmL_KKq7KZA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------5B4C7790D4F3E0C20B49FDD0"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.146; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-146.mail.aliyun.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.765, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Mon, 28 Jun 2021 07:17:22 -0000

This is a multi-part message in MIME format.
--------------5B4C7790D4F3E0C20B49FDD0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/6/26 下午8:56, Frank Chang wrote:
> On Wed, Jun 16, 2021 at 10:56 AM LIU Zhiwei <zhiwei_liu@c-sky.com 
> <mailto:zhiwei_liu@c-sky.com>> wrote:
>
>
>     On 6/13/21 6:10 PM, Frank Chang wrote:
>>     LIU Zhiwei <zhiwei_liu@c-sky.com <mailto:zhiwei_liu@c-sky.com>> 於
>>     2021年4月9日 週五 下午3:57寫道：
>>
>>         +static void riscv_clic_realize(DeviceState *dev, Error **errp)
>>         +{
>>         +    RISCVCLICState *clic = RISCV_CLIC(dev);
>>         +    size_t harts_x_sources = clic->num_harts *
>>         clic->num_sources;
>>         +    int irqs, i;
>>         +
>>         +    if (clic->prv_s && clic->prv_u) {
>>         +        irqs = 3 * harts_x_sources;
>>         +    } else if (clic->prv_s || clic->prv_u) {
>>         +        irqs = 2 * harts_x_sources;
>>         +    } else {
>>         +        irqs = harts_x_sources;
>>         +    }
>>         +
>>         +    clic->clic_size = irqs * 4 + 0x1000;
>>         +    memory_region_init_io(&clic->mmio, OBJECT(dev),
>>         &riscv_clic_ops, clic,
>>         +                          TYPE_RISCV_CLIC, clic->clic_size);
>>         +
>>         +    clic->clicintip = g_new0(uint8_t, irqs);
>>         +    clic->clicintie = g_new0(uint8_t, irqs);
>>         +    clic->clicintattr = g_new0(uint8_t, irqs);
>>         +    clic->clicintctl = g_new0(uint8_t, irqs);
>>         +    clic->active_list = g_new0(CLICActiveInterrupt, irqs);
>>         +    clic->active_count = g_new0(size_t, clic->num_harts);
>>         +    clic->exccode = g_new0(uint32_t, clic->num_harts);
>>         +    clic->cpu_irqs = g_new0(qemu_irq, clic->num_harts);
>>         +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &clic->mmio);
>>         +
>>         +    /* Allocate irq through gpio, so that we can use qtest */
>>         +    qdev_init_gpio_in(dev, riscv_clic_set_irq, irqs);
>>         +    qdev_init_gpio_out(dev, clic->cpu_irqs, clic->num_harts);
>>         +
>>         +    for (i = 0; i < clic->num_harts; i++) {
>>         +        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(i));
>>
>>
>>     As spec says:
>>       Smaller single-core systems might have only a CLIC,
>>       while multicore systems might have a CLIC per-core and a single
>>     shared PLIC.
>>       The PLIC xeip signals are treated as hart-local interrupt
>>     sources by the CLIC at each core.
>>
>>     It looks like it's possible to have one CLIC instance per core.
>
>     If you want to delivery an interrupt to one hart, you should
>     encode the IRQ by the interrupt number
>     , the hart number and the interrupt target privilege, then set the
>     irq.
>
>     I think how to calculate the hart number is the task of PLIC and
>     it can make use of "hartid-base"
>     to calculate it.
>
>     Thanks,
>     Zhiwei
>
>
> Hi Zhiwei,
>
> What I mean is if there are multiple CLIC instances, each per core 
> (CLIC spec allows that).
> If you try to bind CLIC with CPU index start from 0,
> it will be impossible for CLIC instance to bind CPU from index other 
> than 0.
>
> For example, for 4 cores system, it's possible to have 4 CLIC instances:
>   * CLIC 0 binds to CPU 0
>   * CLIC 1 binds to CPU 1
>   * CLIC 2 binds to CPU 2
>   * CLIC 3 binds to CPU 3
>
> and that's why I said it's possible to pass an extra "hartid-base" 
> just like PLIC.
> I know most of hardid are calculated by the requesing address, so most 
> hartid usages should be fine.
> But I saw two places using qemu_get_cpu(),
> which may cause the problem for the scenario I describe above:
> i.e. riscv_clic_next_interrupt() and riscv_clic_realize() as my 
> original reply.

So what's the problem here?

Currently all cores share the same CLIC instance. Do you want to give 
each core  a CLIC instance?

Thanks,
Zhiwei

>
> Regards,
> Frank Chang
>
>>     However if you try to bind CPU reference start from index i = 0.
>>     It's not possible for each per-core CLIC to bind their own CPU
>>     instance in multicore system
>>     as they have to bind from CPU 0.
>>
>>     I'm not sure if we add a new "hartid-base" property just like
>>     what SiFive PLIC is
>>     implemented would be a good idea or not.
>>
>>
>>     Regards,
>>     Frank Chang
>>
>>         + qemu_irq irq = qemu_allocate_irq(riscv_clic_cpu_irq_handler,
>>         +  &cpu->env, 1);
>>         +        qdev_connect_gpio_out(dev, i, irq);
>>         +        cpu->env.clic = clic;
>>         +    }
>>         +}
>>         +
>>
>>

--------------5B4C7790D4F3E0C20B49FDD0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/6/26 下午8:56, Frank Chang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAE_xrPg9qG-uOfkMeGvudWZFLUCG+7SSEbvS08iWmL_KKq7KZA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">On Wed, Jun 16, 2021 at 10:56 AM LIU Zhiwei &lt;<a
            href="mailto:zhiwei_liu@c-sky.com" moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <p><br>
              </p>
              <div>On 6/13/21 6:10 PM, Frank Chang wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div dir="ltr">LIU Zhiwei &lt;<a
                      href="mailto:zhiwei_liu@c-sky.com" target="_blank"
                      moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;
                    於 2021年4月9日 週五 下午3:57寫道：<br>
                  </div>
                  <div class="gmail_quote"><br>
                    <blockquote class="gmail_quote" style="margin:0px
                      0px 0px 0.8ex;border-left:1px solid
                      rgb(204,204,204);padding-left:1ex"> +static void
                      riscv_clic_realize(DeviceState *dev, Error **errp)<br>
                      +{<br>
                      +    RISCVCLICState *clic = RISCV_CLIC(dev);<br>
                      +    size_t harts_x_sources = clic-&gt;num_harts *
                      clic-&gt;num_sources;<br>
                      +    int irqs, i;<br>
                      +<br>
                      +    if (clic-&gt;prv_s &amp;&amp; clic-&gt;prv_u)
                      {<br>
                      +        irqs = 3 * harts_x_sources;<br>
                      +    } else if (clic-&gt;prv_s || clic-&gt;prv_u)
                      {<br>
                      +        irqs = 2 * harts_x_sources;<br>
                      +    } else {<br>
                      +        irqs = harts_x_sources;<br>
                      +    }<br>
                      +<br>
                      +    clic-&gt;clic_size = irqs * 4 + 0x1000;<br>
                      +    memory_region_init_io(&amp;clic-&gt;mmio,
                      OBJECT(dev), &amp;riscv_clic_ops, clic,<br>
                      +                          TYPE_RISCV_CLIC,
                      clic-&gt;clic_size);<br>
                      +<br>
                      +    clic-&gt;clicintip = g_new0(uint8_t, irqs);<br>
                      +    clic-&gt;clicintie = g_new0(uint8_t, irqs);<br>
                      +    clic-&gt;clicintattr = g_new0(uint8_t, irqs);<br>
                      +    clic-&gt;clicintctl = g_new0(uint8_t, irqs);<br>
                      +    clic-&gt;active_list =
                      g_new0(CLICActiveInterrupt, irqs);<br>
                      +    clic-&gt;active_count = g_new0(size_t,
                      clic-&gt;num_harts);<br>
                      +    clic-&gt;exccode = g_new0(uint32_t,
                      clic-&gt;num_harts);<br>
                      +    clic-&gt;cpu_irqs = g_new0(qemu_irq,
                      clic-&gt;num_harts);<br>
                      +    sysbus_init_mmio(SYS_BUS_DEVICE(dev),
                      &amp;clic-&gt;mmio);<br>
                      +<br>
                      +    /* Allocate irq through gpio, so that we can
                      use qtest */<br>
                      +    qdev_init_gpio_in(dev, riscv_clic_set_irq,
                      irqs);<br>
                      +    qdev_init_gpio_out(dev, clic-&gt;cpu_irqs,
                      clic-&gt;num_harts);<br>
                      +<br>
                      +    for (i = 0; i &lt; clic-&gt;num_harts; i++) {<br>
                      +        RISCVCPU *cpu =
                      RISCV_CPU(qemu_get_cpu(i));<br>
                    </blockquote>
                    <div><br>
                    </div>
                    <div>As spec says:</div>
                    <div>  Smaller single-core systems might have only a
                      CLIC,</div>
                    <div>  while multicore systems might have a CLIC
                      per-core and a single shared PLIC.</div>
                    <div>  The PLIC xeip signals are treated as
                      hart-local interrupt sources by the CLIC at each
                      core.<br>
                    </div>
                    <div><br>
                    </div>
                    <div>It looks like it's possible to have one CLIC
                      instance per core.</div>
                  </div>
                </div>
              </blockquote>
              <p>If you want to delivery an interrupt to one hart, you
                should encode the IRQ by the interrupt number<br>
                , the hart number and the interrupt target privilege,
                then set the irq.</p>
              <p>I think how to calculate the hart number is the task of
                PLIC and it can make use of "hartid-base"<br>
                to calculate it.</p>
              <p>Thanks,<br>
                Zhiwei<br>
              </p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Hi Zhiwei,</div>
          <div><br>
          </div>
          <div>What I mean is if there are multiple CLIC instances, each
            per core (CLIC spec allows that).</div>
          <div>If you try to bind CLIC with CPU index start from 0,</div>
          <div>it will be impossible for CLIC instance to bind CPU from
            index other than 0.</div>
          <div><br>
          </div>
          <div>For example, for 4 cores system, it's possible to have 4
            CLIC instances:</div>
          <div>  * CLIC 0 binds to CPU 0</div>
          <div>  * CLIC 1 binds to CPU 1</div>
          <div>  * CLIC 2 binds to CPU 2</div>
          <div>  * CLIC 3 binds to CPU 3</div>
          <div><br>
          </div>
          <div>and that's why I said it's possible to pass an extra
            "hartid-base" just like PLIC.</div>
          <div>I know most of hardid are calculated by the requesing
            address, so most hartid usages should be fine.</div>
          <div>But I saw two places using qemu_get_cpu(),<br>
          </div>
        </div>
      </div>
    </blockquote>
    <blockquote type="cite"
cite="mid:CAE_xrPg9qG-uOfkMeGvudWZFLUCG+7SSEbvS08iWmL_KKq7KZA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>which may cause the problem for the scenario I describe
            above:</div>
          <div>i.e. riscv_clic_next_interrupt() and riscv_clic_realize()
            as my original reply.</div>
        </div>
      </div>
    </blockquote>
    <p>So what's the problem here?</p>
    <p>Currently all cores share the same CLIC instance. Do you want to
      give each core  a CLIC instance? <br>
    </p>
    <p>Thanks,<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite"
cite="mid:CAE_xrPg9qG-uOfkMeGvudWZFLUCG+7SSEbvS08iWmL_KKq7KZA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Regards,</div>
          <div>Frank Chang</div>
          <div> <br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <p> </p>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div>However if you try to bind CPU reference start
                      from index i = 0.</div>
                    <div>It's not possible for each per-core CLIC to
                      bind their own CPU instance in multicore system</div>
                    <div>as they have to bind from CPU 0.</div>
                    <div><br>
                      I'm not sure if we add a new "hartid-base"
                      property just like what SiFive PLIC is</div>
                    <div>implemented would be a good idea or not.</div>
                    <div><br>
                    </div>
                    <div><br>
                    </div>
                    <div>Regards,</div>
                    <div>Frank Chang</div>
                    <div> </div>
                    <blockquote class="gmail_quote" style="margin:0px
                      0px 0px 0.8ex;border-left:1px solid
                      rgb(204,204,204);padding-left:1ex"> +       
                      qemu_irq irq =
                      qemu_allocate_irq(riscv_clic_cpu_irq_handler,<br>
                      +                                       
                       &amp;cpu-&gt;env, 1);<br>
                      +        qdev_connect_gpio_out(dev, i, irq);<br>
                      +        cpu-&gt;env.clic = clic;<br>
                      +    }<br>
                      +}<br>
                      +<br>
                      <br>
                      <br>
                    </blockquote>
                  </div>
                </div>
              </blockquote>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------5B4C7790D4F3E0C20B49FDD0--

