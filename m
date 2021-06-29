Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ly3kW-0004sM-8l
	for mharc-qemu-riscv@gnu.org; Mon, 28 Jun 2021 22:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ly3kU-0004qG-U4; Mon, 28 Jun 2021 22:45:18 -0400
Received: from out28-121.mail.aliyun.com ([115.124.28.121]:56621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ly3kP-0003D0-Tp; Mon, 28 Jun 2021 22:45:18 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07608247|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_social|0.061983-0.00452916-0.933488;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KZXzqtw_1624934706; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KZXzqtw_1624934706)
 by smtp.aliyun-inc.com(10.147.41.120);
 Tue, 29 Jun 2021 10:45:06 +0800
Subject: Re: [RFC PATCH 03/11] hw/intc: Add CLIC device
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-4-zhiwei_liu@c-sky.com>
 <CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <4ca1ca94-52d0-9b67-2b65-c9f48d484c7c@c-sky.com>
Date: Tue, 29 Jun 2021 10:43:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------9A2008FF1F5A447F30033EB8"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.121; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-121.mail.aliyun.com
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
X-List-Received-Date: Tue, 29 Jun 2021 02:45:19 -0000

This is a multi-part message in MIME format.
--------------9A2008FF1F5A447F30033EB8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Frank,

Thanks for a lot of good points.

On 2021/6/26 下午11:03, Frank Chang wrote:
> LIU Zhiwei <zhiwei_liu@c-sky.com <mailto:zhiwei_liu@c-sky.com>> 於 
> 2021年4月9日 週五 下午3:57寫道：
>
>     +static uint8_t
>     +riscv_clic_get_interrupt_level(RISCVCLICState *clic, uint8_t intctl)
>     +{
>     +    int nlbits = clic->nlbits;
>     +
>     +    uint8_t mask_il = ((1 << nlbits) - 1) << (8 - nlbits);
>     +    uint8_t mask_padding = (1 << (8 - nlbits)) - 1;
>     +    /* unused level bits are set to 1 */
>     +    return (intctl & mask_il) | mask_padding;
>     +}
>
>
> According to spec:
>   if the nlbits > CLICINTCTLBITS, then the lower bits of the 8-bit
>   interrupt level are assumed to be all 1s.
>
> That is, the valid nlbits should be: min(clic->nlbits, CLICINTCTLBITS);
> The cliccfg example in spec also shows that:
>
> CLICINTCTLBITS  nlbits  clicintctl[i]  interrupt levels
>       0                       2         ........         255
>       1                       2         l.......  127,255
>       2                       2         ll......  63,127,191,255
>       3                       3         lll..... 
>  31,63,95,127,159,191,223,255
>       4                       1         lppp.... 127,255
Agree, thanks.
>
>
>     + * In a system with multiple harts, the M-mode CLIC regions for
>     all the harts
>     + * are placed contiguously in the memory space, followed by the
>     S-mode CLIC
>     + * regions for all harts. (Section 3.11)
>     + */
>
>
> The above description is not true any more in the latest spec:
>   The CLIC specification does not dictate how CLIC memory-mapped 
> registers are
>   split between M/S/U regions as well as the layout of multiple harts 
> as this is generally
>   a platform issue and each platform needs to define a discovery 
> mechanism to determine
>   the memory map locations.
>
> But I think we can just keep the current design for now anyway, as 
> it's also one of legal memory layout.
> Otherwise, the design would be more complicated I think.

We can pass an array containing indexed by hart_id and mode from the 
machine board, such as

hwaddr clic_memmap[HARTS][MODE] = {

{0x0000, 0x10000, 0x20000},

{0x4000, 0x14000, 0x24000},

{0x8000, 0x18000, 0x28000},

{0xc000, 0x1c000, 0x2c000},

}


>
>
>     +static void
>     +riscv_clic_update_intie(RISCVCLICState *clic, int mode, int hartid,
>     +                        int irq, uint64_t new_intie)
>     +{
>     +    size_t hart_offset = hartid * clic->num_sources;
>     +    size_t irq_offset = riscv_clic_get_irq_offset(clic, mode,
>     hartid, irq);
>     +    CLICActiveInterrupt *active_list =
>     &clic->active_list[hart_offset];
>     +    size_t *active_count = &clic->active_count[hartid];
>     +
>     +    uint8_t old_intie = clic->clicintie[irq_offset];
>     +    clic->clicintie[irq_offset] = !!new_intie;
>     +
>     +    /* Add to or remove from list of active interrupts */
>     +    if (new_intie && !old_intie) {
>     +        active_list[*active_count].intcfg = (mode << 8) |
>     + clic->clicintctl[irq_offset];
>     +        active_list[*active_count].irq = irq;
>     +        (*active_count)++;
>     +    } else if (!new_intie && old_intie) {
>     +        CLICActiveInterrupt key = {
>     +            (mode << 8) | clic->clicintctl[irq_offset], irq
>     +        };
>     +        CLICActiveInterrupt *result = bsearch(&key,
>     +                                              active_list,
>     *active_count,
>     + sizeof(CLICActiveInterrupt),
>     + riscv_clic_active_compare);
>     +        size_t elem = (result - active_list) /
>     sizeof(CLICActiveInterrupt);
>
>
> I think what you are trying to do here is to get the number of elements
> right after the active interrupt to be deleted in order to calculate 
> the size of
> active interrupts to be memmoved.
>
Agree, thanks.
> However, according to C spec:
>   When two pointers are subtracted, both shall point to elements of 
> the same array object,
>   or one past the last element of the array object; the result is the 
> difference of the
>   subscripts of the two array elements.
>
> So I think: (result - active_list) is already the number of elements 
> you want.
> You don't have to divide it with sizeof(CLICActiveInterrupt) again.
>
>     +        size_t sz = (--(*active_count) - elem) *
>     sizeof(CLICActiveInterrupt);
>     +        assert(result);
>
>
> Nit: assert(result) can be moved above size_t elem statement.
Agree.
>
>     +        memmove(&result[0], &result[1], sz);
>     +    }
>     +
>     +    /* Sort list of active interrupts */
>     +    qsort(active_list, *active_count,
>     +          sizeof(CLICActiveInterrupt),
>     +          riscv_clic_active_compare);
>     +
>     +    riscv_clic_next_interrupt(clic, hartid);
>     +}
>     +
>     +static void
>     +riscv_clic_hart_write(RISCVCLICState *clic, hwaddr addr,
>     +                      uint64_t value, unsigned size,
>     +                      int mode, int hartid, int irq)
>     +{
>     +    int req = extract32(addr, 0, 2);
>     +    size_t irq_offset = riscv_clic_get_irq_offset(clic, mode,
>     hartid, irq);
>     +
>     +    if (hartid >= clic->num_harts) {
>     +        qemu_log_mask(LOG_GUEST_ERROR,
>     +                      "clic: invalid hartid %u: 0x%" HWADDR_PRIx
>     "\n",
>     +                      hartid, addr);
>     +        return;
>     +    }
>     +
>     +    if (irq >= clic->num_sources) {
>     +        qemu_log_mask(LOG_GUEST_ERROR,
>     +                      "clic: invalid irq %u: 0x%" HWADDR_PRIx
>     "\n", irq, addr);
>     +        return;
>     +    }
>     +
>     +    switch (req) {
>
>
> Spec. says that it's legal to write 32-bit value to set
> {clicintctl[i], clicintattr[i], clicintie[i] ,clicintip[i]} at the 
> same time:
>   A 32-bit write to {clicintctl,clicintattr,clicintie,clicintip} is legal.
>   However, there is no specified order in which the effects of
>   the individual byte updates take effect.

I miss it. I think it only supports 1 byte access or 4 bytes access. For 
4 bytes access,  we need to pass an flag to specify to the order from 
the machine board.

Thoughts?

>     +    case 0: /* clicintip[i] */
>     +        if (riscv_clic_validate_intip(clic, mode, hartid, irq)) {
>     +            /*
>     +             * The actual pending bit is located at bit 0 (i.e., the
>     +             * leastsignificant bit). In case future extensions
>     expand the bit
>
>
> Typo: leastsignificant => least significant
OK.
>
>     +             * field, from FW perspective clicintip[i]=zero means
>     no interrupt
>     +             * pending, and clicintip[i]!=0 (not just 1) indicates an
>     +             * interrupt is pending. (Section 3.4)
>     +             */
>     +            if (value != clic->clicintip[irq_offset]) {
>     +                riscv_clic_update_intip(clic, mode, hartid, irq,
>     value);
>     +            }
>     +        }
>     +        break;
>     +    case 1: /* clicintie[i] */
>     +        if (clic->clicintie[irq_offset] != value) {
>     +            riscv_clic_update_intie(clic, mode, hartid, irq, value);
>     +        }
>     +        break;
>     +    case 2: /* clicintattr[i] */
>     +        if (riscv_clic_validate_intattr(clic, value)) {
>     +            if (clic->clicintattr[irq_offset] != value) {
>     +                /* When nmbits=2, check WARL */
>     +                bool invalid = (clic->nmbits == 2) &&
>     +                               (extract64(value, 6, 2) == 0b10);
>     +                if (invalid) {
>     +                    uint8_t old_mode =
>     extract32(clic->clicintattr[irq_offset],
>     +                                                 6, 2);
>     +                    value = deposit32(value, 6, 2, old_mode);
>     +                }
>     +                clic->clicintattr[irq_offset] = value;
>     +                riscv_clic_next_interrupt(clic, hartid);
>     +            }
>     +        }
>     +        break;
>     +    case 3: /* clicintctl[i] */
>     +        if (value != clic->clicintctl[irq_offset]) {
>     +            clic->clicintctl[irq_offset] = value;
>
>
> If irq i is already in the active_list, when will its intcfg been synced?
Good. I think should sync immediately.
>
>     +            riscv_clic_next_interrupt(clic, hartid);
>     +        }
>     +        break;
>     +    }
>     +}
>     +
>     +static uint64_t
>     +riscv_clic_hart_read(RISCVCLICState *clic, hwaddr addr, int mode,
>     +                     int hartid, int irq)
>     +{
>     +    int req = extract32(addr, 0, 2);
>     +    size_t irq_offset = riscv_clic_get_irq_offset(clic, mode,
>     hartid, irq);
>     +
>     +    if (hartid >= clic->num_harts) {
>     +        qemu_log_mask(LOG_GUEST_ERROR,
>     +                      "clic: invalid hartid %u: 0x%" HWADDR_PRIx
>     "\n",
>     +                      hartid, addr);
>     +        return 0;
>     +    }
>     +
>     +    if (irq >= clic->num_sources) {
>     +        qemu_log_mask(LOG_GUEST_ERROR,
>     +                      "clic: invalid irq %u: 0x%" HWADDR_PRIx
>     "\n", irq, addr);
>     +        return 0;
>     +    }
>     +
>     +    switch (req) {
>     +    case 0: /* clicintip[i] */
>     +        return clic->clicintip[irq_offset];
>     +    case 1: /* clicintie[i] */
>     +        return clic->clicintie[irq_offset];
>     +    case 2: /* clicintattr[i] */
>     +        /*
>     +         * clicintattr register layout
>     +         * Bits Field
>     +         * 7:6 mode
>     +         * 5:3 reserved (WPRI 0)
>     +         * 2:1 trig
>     +         * 0 shv
>     +         */
>     +        return clic->clicintattr[irq_offset] & ~0x38;
>     +    case 3: /* clicintctrl */
>
>
> Typo: clicintctl
OK.
>
>     +        /*
>     +         * The implemented bits are kept left-justified in the
>     most-significant
>     +         * bits of each 8-bit clicintctl[i] register, with the lower
>     +         * unimplemented bits treated as hardwired to 1.(Section 3.7)
>     +         */
>     +        return clic->clicintctl[irq_offset] |
>     +               ((1 << (8 - clic->clicintctlbits)) - 1);
>     +    }
>     +
>     +    return 0;
>     +}
>     +
>
>     +static void
>     +riscv_clic_write(void *opaque, hwaddr addr, uint64_t value,
>     unsigned size)
>     +{
>     +    RISCVCLICState *clic = opaque;
>     +    hwaddr clic_size = clic->clic_size;
>     +    int hartid, mode, irq;
>     +
>     +    if (addr < clic_size) {
>
>
> Is this necessary?
> I think memory region size already limits the request address to be 
> within the range of clic_size.

At this point, not necessary.

>
>     +static uint64_t riscv_clic_read(void *opaque, hwaddr addr,
>     unsigned size)
>     +{
>     +    RISCVCLICState *clic = opaque;
>     +    hwaddr clic_size = clic->clic_size;
>     +    int hartid, mode, irq;
>     +
>     +    if (addr < clic_size) {
>
>
> Same to riscv_clic_write().
>
> Thanks,
> Frank Chang
>
>     +        if (addr < 0x1000) {
>     +            assert(addr % 4 == 0);
>     +            int index = addr / 4;
>     +            switch (index) {
>     +            case 0: /* cliccfg */
>     +                return clic->nvbits |
>     +                       (clic->nlbits << 1) |
>     +                       (clic->nmbits << 5);
>     +            case 1: /* clicinfo */
>     +                /*
>     +                 * clicinfo register layout
>     +                 *
>     +                 * Bits Field
>     +                 * 31 reserved (WARL 0)
>     +                 * 30:25 num_trigger
>     +                 * 24:21 CLICINTCTLBITS
>     +                 * 20:13 version (for version control)
>     +                 * 12:0 num_interrupt
>     +                 */
>     +                return clic->clicinfo & ~INT32_MAX;
>
>
> clic->clicinfo should represent the CLIC setting information.
> I think it's better to add clic reset function or 
> in riscv_clic_realize() to initialize clic->clicinfo.
Agree.
>
>     +
>     +static void riscv_clic_realize(DeviceState *dev, Error **errp)
>     +{
>     +    RISCVCLICState *clic = RISCV_CLIC(dev);
>     +    size_t harts_x_sources = clic->num_harts * clic->num_sources;
>     +    int irqs, i;
>     +
>     +    if (clic->prv_s && clic->prv_u) {
>     +        irqs = 3 * harts_x_sources;
>     +    } else if (clic->prv_s || clic->prv_u) {
>     +        irqs = 2 * harts_x_sources;
>     +    } else {
>     +        irqs = harts_x_sources;
>     +    }
>     +
>     +    clic->clic_size = irqs * 4 + 0x1000;
>     +    memory_region_init_io(&clic->mmio, OBJECT(dev),
>     &riscv_clic_ops, clic,
>     +                          TYPE_RISCV_CLIC, clic->clic_size);
>     +
>     +    clic->clicintip = g_new0(uint8_t, irqs);
>     +    clic->clicintie = g_new0(uint8_t, irqs);
>     +    clic->clicintattr = g_new0(uint8_t, irqs);
>     +    clic->clicintctl = g_new0(uint8_t, irqs);
>     +    clic->active_list = g_new0(CLICActiveInterrupt, irqs);
>
>
> Should the size of clic->active_list be: harts_x_sources?

Every irq can be in the active_list, so just the number of irqs.

Remind we will only use M-mode IRQ in next patch set, I still think we 
should use the
irqs here, because irq in active_list has privilege information.

Thanks,
Zhiwei

>
>

--------------9A2008FF1F5A447F30033EB8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Frank,</p>
    <p>Thanks for a lot of good points.  <br>
    </p>
    <div class="moz-cite-prefix">On 2021/6/26 下午11:03, Frank Chang
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">LIU Zhiwei &lt;<a
            href="mailto:zhiwei_liu@c-sky.com" moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;
          於 2021年4月9日 週五 下午3:57寫道：<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">+static uint8_t<br>
            +riscv_clic_get_interrupt_level(RISCVCLICState *clic,
            uint8_t intctl)<br>
            +{<br>
            +    int nlbits = clic-&gt;nlbits;<br>
            +<br>
            +    uint8_t mask_il = ((1 &lt;&lt; nlbits) - 1) &lt;&lt; (8
            - nlbits);<br>
            +    uint8_t mask_padding = (1 &lt;&lt; (8 - nlbits)) - 1;<br>
            +    /* unused level bits are set to 1 */<br>
            +    return (intctl &amp; mask_il) | mask_padding;<br>
            +}<br>
          </blockquote>
          <div><br>
          </div>
          <div>According to spec:</div>
          <div>  if the nlbits &gt; CLICINTCTLBITS, then the lower bits
            of the 8-bit</div>
          <div>  interrupt level are assumed to be all 1s.<br>
          </div>
          <div><br>
          </div>
          <div>That is, the valid nlbits should be: min(clic-&gt;nlbits,
            CLICINTCTLBITS);</div>
          <div>The cliccfg example in spec also shows that:</div>
          <div><br>
          </div>
          <div>CLICINTCTLBITS  nlbits  clicintctl[i]  interrupt levels<br>
                  0                       2         ........         255<br>
                  1                       2         l.......       
             127,255<br>
                  2                       2         ll......       
             63,127,191,255<br>
                  3                       3         lll.....       
             31,63,95,127,159,191,223,255<br>
                  4                       1         lppp....     
            127,255<br>
          </div>
          <div> </div>
        </div>
      </div>
    </blockquote>
    Agree, thanks.<br>
    <blockquote type="cite"
cite="mid:CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            + * In a system with multiple harts, the M-mode CLIC regions
            for all the harts<br>
            + * are placed contiguously in the memory space, followed by
            the S-mode CLIC<br>
            + * regions for all harts. (Section 3.11)<br>
            + */<br>
          </blockquote>
          <div><br>
          </div>
          <div>The above description is not true any more in the latest
            spec:</div>
          <div>  The CLIC specification does not dictate how CLIC
            memory-mapped registers are</div>
          <div>  split between M/S/U regions as well as the layout of
            multiple harts as this is generally</div>
          <div>  a platform issue and each platform needs to define a
            discovery mechanism to determine</div>
          <div>  the memory map locations.<br>
          </div>
          <div><br>
          </div>
          <div>But I think we can just keep the current design for now
            anyway, as it's also one of legal memory layout.</div>
          <div>Otherwise, the design would be more complicated I think.</div>
        </div>
      </div>
    </blockquote>
    <p>We can pass an array containing indexed by hart_id and mode from
      the machine board, such as</p>
    <p><font face="monospace">hwaddr clic_memmap[HARTS][MODE] = {</font></p>
    <p><font face="monospace">{0x0000, 0x10000, 0x20000},<br>
      </font></p>
    <p><font face="monospace">{0x4000, 0x14000, 0x24000},</font></p>
    <p><font face="monospace">{0x8000, 0x18000, 0x28000},</font></p>
    <p><font face="monospace">{0xc000, 0x1c000, 0x2c000},</font></p>
    <p><font face="monospace">}</font></p>
    <br>
    <blockquote type="cite"
cite="mid:CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            <br>
            +static void<br>
            +riscv_clic_update_intie(RISCVCLICState *clic, int mode, int
            hartid,<br>
            +                        int irq, uint64_t new_intie)<br>
            +{<br>
            +    size_t hart_offset = hartid * clic-&gt;num_sources;<br>
            +    size_t irq_offset = riscv_clic_get_irq_offset(clic,
            mode, hartid, irq);<br>
            +    CLICActiveInterrupt *active_list =
            &amp;clic-&gt;active_list[hart_offset];<br>
            +    size_t *active_count =
            &amp;clic-&gt;active_count[hartid];<br>
            +<br>
            +    uint8_t old_intie = clic-&gt;clicintie[irq_offset];<br>
            +    clic-&gt;clicintie[irq_offset] = !!new_intie;<br>
            +<br>
            +    /* Add to or remove from list of active interrupts */<br>
            +    if (new_intie &amp;&amp; !old_intie) {<br>
            +        active_list[*active_count].intcfg = (mode &lt;&lt;
            8) |<br>
            +                                           
            clic-&gt;clicintctl[irq_offset];<br>
            +        active_list[*active_count].irq = irq;<br>
            +        (*active_count)++;<br>
            +    } else if (!new_intie &amp;&amp; old_intie) {<br>
            +        CLICActiveInterrupt key = {<br>
            +            (mode &lt;&lt; 8) |
            clic-&gt;clicintctl[irq_offset], irq<br>
            +        };<br>
            +        CLICActiveInterrupt *result = bsearch(&amp;key,<br>
            +                                              active_list,
            *active_count,<br>
            +                                             
            sizeof(CLICActiveInterrupt),<br>
            +                                             
            riscv_clic_active_compare);<br>
            +        size_t elem = (result - active_list) /
            sizeof(CLICActiveInterrupt);<br>
          </blockquote>
          <div><br>
          </div>
          <div>I think what you are trying to do here is to get the
            number of elements</div>
          <div>right after the active interrupt to be deleted in order
            to calculate the size of</div>
          <div>active interrupts to be memmoved.</div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    Agree, thanks.<br>
    <blockquote type="cite"
cite="mid:CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>However, according to C spec:</div>
          <div>  When two pointers are subtracted, both shall point to
            elements of the same array object,</div>
            or one past the last element of the array object; the result
          is the difference of the<br>
            subscripts of the two array elements.</div>
        <div class="gmail_quote"><br>
        </div>
        <div class="gmail_quote">So I think: (result - active_list) is
          already the number of elements you want.</div>
        <div class="gmail_quote">You don't have to divide it with
          sizeof(CLICActiveInterrupt) again.<br>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +        size_t sz = (--(*active_count) - elem) *
            sizeof(CLICActiveInterrupt);<br>
            +        assert(result);<br>
          </blockquote>
          <div><br>
          </div>
          <div>Nit: assert(result) can be moved above size_t elem
            statement.</div>
        </div>
      </div>
    </blockquote>
    Agree.<br>
    <blockquote type="cite"
cite="mid:CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +        memmove(&amp;result[0], &amp;result[1], sz);<br>
            +    }<br>
            +<br>
            +    /* Sort list of active interrupts */<br>
            +    qsort(active_list, *active_count,<br>
            +          sizeof(CLICActiveInterrupt),<br>
            +          riscv_clic_active_compare);<br>
            +<br>
            +    riscv_clic_next_interrupt(clic, hartid);<br>
            +}<br>
            +<br>
            +static void<br>
            +riscv_clic_hart_write(RISCVCLICState *clic, hwaddr addr,<br>
            +                      uint64_t value, unsigned size,<br>
            +                      int mode, int hartid, int irq)<br>
            +{<br>
            +    int req = extract32(addr, 0, 2);<br>
            +    size_t irq_offset = riscv_clic_get_irq_offset(clic,
            mode, hartid, irq);<br>
            +<br>
            +    if (hartid &gt;= clic-&gt;num_harts) {<br>
            +        qemu_log_mask(LOG_GUEST_ERROR,<br>
            +                      "clic: invalid hartid %u: 0x%"
            HWADDR_PRIx "\n",<br>
            +                      hartid, addr);<br>
            +        return;<br>
            +    }<br>
            +<br>
            +    if (irq &gt;= clic-&gt;num_sources) {<br>
            +        qemu_log_mask(LOG_GUEST_ERROR,<br>
            +                      "clic: invalid irq %u: 0x%"
            HWADDR_PRIx "\n", irq, addr);<br>
            +        return;<br>
            +    }<br>
            +<br>
            +    switch (req) {<br>
          </blockquote>
          <div><br>
          </div>
          <div>Spec. says that it's legal to write 32-bit value to set<br>
          </div>
          <div>{clicintctl[i], clicintattr[i], clicintie[i]
            ,clicintip[i]} at the same time:<br>
          </div>
          <div>  A 32-bit write to
            {clicintctl,clicintattr,clicintie,clicintip} is legal.<br>
          </div>
          <div>  However, there is no specified order in which the
            effects of</div>
          <div>  the individual byte updates take effect.</div>
          <div> </div>
        </div>
      </div>
    </blockquote>
    <p>I miss it. I think it only supports 1 byte access or 4 bytes
      access. For 4 bytes access,  we need to pass an flag to specify to
      the order from the machine board.</p>
    <p>Thoughts?</p>
    <blockquote type="cite"
cite="mid:CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +    case 0: /* clicintip[i] */<br>
            +        if (riscv_clic_validate_intip(clic, mode, hartid,
            irq)) {<br>
            +            /*<br>
            +             * The actual pending bit is located at bit 0
            (i.e., the<br>
            +             * leastsignificant bit). In case future
            extensions expand the bit<br>
          </blockquote>
          <div><br>
          </div>
          <div>Typo: leastsignificant =&gt; least significant</div>
        </div>
      </div>
    </blockquote>
    OK.<br>
    <blockquote type="cite"
cite="mid:CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +             * field, from FW perspective clicintip[i]=zero
            means no interrupt<br>
            +             * pending, and clicintip[i]!=0 (not just 1)
            indicates an<br>
            +             * interrupt is pending. (Section 3.4)<br>
            +             */<br>
            +            if (value != clic-&gt;clicintip[irq_offset]) {<br>
            +                riscv_clic_update_intip(clic, mode, hartid,
            irq, value);<br>
            +            }<br>
            +        }<br>
            +        break;<br>
            +    case 1: /* clicintie[i] */<br>
            +        if (clic-&gt;clicintie[irq_offset] != value) {<br>
            +            riscv_clic_update_intie(clic, mode, hartid,
            irq, value);<br>
            +        }<br>
            +        break;<br>
            +    case 2: /* clicintattr[i] */<br>
            +        if (riscv_clic_validate_intattr(clic, value)) {<br>
            +            if (clic-&gt;clicintattr[irq_offset] != value)
            {<br>
            +                /* When nmbits=2, check WARL */<br>
            +                bool invalid = (clic-&gt;nmbits == 2)
            &amp;&amp;<br>
            +                               (extract64(value, 6, 2) ==
            0b10);<br>
            +                if (invalid) {<br>
            +                    uint8_t old_mode =
            extract32(clic-&gt;clicintattr[irq_offset],<br>
            +                                                 6, 2);<br>
            +                    value = deposit32(value, 6, 2,
            old_mode);<br>
            +                }<br>
            +                clic-&gt;clicintattr[irq_offset] = value;<br>
            +                riscv_clic_next_interrupt(clic, hartid);<br>
            +            }<br>
            +        }<br>
            +        break;<br>
            +    case 3: /* clicintctl[i] */<br>
            +        if (value != clic-&gt;clicintctl[irq_offset]) {<br>
            +            clic-&gt;clicintctl[irq_offset] = value;<br>
          </blockquote>
          <div><br>
          </div>
          <div>If irq i is already in the active_list, when will
            its intcfg been synced?<br>
          </div>
        </div>
      </div>
    </blockquote>
    Good. I think should sync immediately.<br>
    <blockquote type="cite"
cite="mid:CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +            riscv_clic_next_interrupt(clic, hartid);<br>
            +        }<br>
            +        break;<br>
            +    }<br>
            +}<br>
            +<br>
            +static uint64_t<br>
            +riscv_clic_hart_read(RISCVCLICState *clic, hwaddr addr, int
            mode,<br>
            +                     int hartid, int irq)<br>
            +{<br>
            +    int req = extract32(addr, 0, 2);<br>
            +    size_t irq_offset = riscv_clic_get_irq_offset(clic,
            mode, hartid, irq);<br>
            +<br>
            +    if (hartid &gt;= clic-&gt;num_harts) {<br>
            +        qemu_log_mask(LOG_GUEST_ERROR,<br>
            +                      "clic: invalid hartid %u: 0x%"
            HWADDR_PRIx "\n",<br>
            +                      hartid, addr);<br>
            +        return 0;<br>
            +    }<br>
            +<br>
            +    if (irq &gt;= clic-&gt;num_sources) {<br>
            +        qemu_log_mask(LOG_GUEST_ERROR,<br>
            +                      "clic: invalid irq %u: 0x%"
            HWADDR_PRIx "\n", irq, addr);<br>
            +        return 0;<br>
            +    }<br>
            +<br>
            +    switch (req) {<br>
            +    case 0: /* clicintip[i] */<br>
            +        return clic-&gt;clicintip[irq_offset];<br>
            +    case 1: /* clicintie[i] */<br>
            +        return clic-&gt;clicintie[irq_offset];<br>
            +    case 2: /* clicintattr[i] */<br>
            +        /*<br>
            +         * clicintattr register layout<br>
            +         * Bits Field<br>
            +         * 7:6 mode<br>
            +         * 5:3 reserved (WPRI 0)<br>
            +         * 2:1 trig<br>
            +         * 0 shv<br>
            +         */<br>
            +        return clic-&gt;clicintattr[irq_offset] &amp;
            ~0x38;<br>
            +    case 3: /* clicintctrl */<br>
          </blockquote>
          <div><br>
          </div>
          <div>Typo: clicintctl</div>
        </div>
      </div>
    </blockquote>
    OK.<br>
    <blockquote type="cite"
cite="mid:CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +        /*<br>
            +         * The implemented bits are kept left-justified in
            the most-significant<br>
            +         * bits of each 8-bit clicintctl[i] register, with
            the lower<br>
            +         * unimplemented bits treated as hardwired to
            1.(Section 3.7)<br>
            +         */<br>
            +        return clic-&gt;clicintctl[irq_offset] |<br>
            +               ((1 &lt;&lt; (8 - clic-&gt;clicintctlbits))
            - 1);<br>
            +    }<br>
            +<br>
            +    return 0;<br>
            +}<br>
            +<br>
            <br>
            +static void<br>
            +riscv_clic_write(void *opaque, hwaddr addr, uint64_t value,
            unsigned size)<br>
            +{<br>
            +    RISCVCLICState *clic = opaque;<br>
            +    hwaddr clic_size = clic-&gt;clic_size;<br>
            +    int hartid, mode, irq;<br>
            +<br>
            +    if (addr &lt; clic_size) {<br>
          </blockquote>
          <div><br>
          </div>
          <div>Is this necessary?<br>
          </div>
          <div>I think memory region size already limits the request
            address to be within the range of clic_size.</div>
        </div>
      </div>
    </blockquote>
    <p>At this point, not necessary.</p>
    <blockquote type="cite"
cite="mid:CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            +static uint64_t riscv_clic_read(void *opaque, hwaddr addr,
            unsigned size)<br>
            +{<br>
            +    RISCVCLICState *clic = opaque;<br>
            +    hwaddr clic_size = clic-&gt;clic_size;<br>
            +    int hartid, mode, irq;<br>
            +<br>
            +    if (addr &lt; clic_size) {<br>
          </blockquote>
          <div><br>
          </div>
          <div>Same to riscv_clic_write().<br>
          </div>
          <div><br>
          </div>
          <div>Thanks,</div>
          <div>Frank Chang</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +        if (addr &lt; 0x1000) {<br>
            +            assert(addr % 4 == 0);<br>
            +            int index = addr / 4;<br>
            +            switch (index) {<br>
            +            case 0: /* cliccfg */<br>
            +                return clic-&gt;nvbits |<br>
            +                       (clic-&gt;nlbits &lt;&lt; 1) |<br>
            +                       (clic-&gt;nmbits &lt;&lt; 5);<br>
            +            case 1: /* clicinfo */<br>
            +                /*<br>
            +                 * clicinfo register layout<br>
            +                 *<br>
            +                 * Bits Field<br>
            +                 * 31 reserved (WARL 0)<br>
            +                 * 30:25 num_trigger<br>
            +                 * 24:21 CLICINTCTLBITS<br>
            +                 * 20:13 version (for version control)<br>
            +                 * 12:0 num_interrupt<br>
            +                 */<br>
            +                return clic-&gt;clicinfo &amp; ~INT32_MAX;<br>
          </blockquote>
          <div><br>
          </div>
          <div>clic-&gt;clicinfo should represent the CLIC setting
            information.</div>
          <div>I think it's better to add clic reset function or
            in riscv_clic_realize() to initialize clic-&gt;clicinfo.</div>
        </div>
      </div>
    </blockquote>
    Agree.<br>
    <blockquote type="cite"
cite="mid:CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> <br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +<br>
            +static void riscv_clic_realize(DeviceState *dev, Error
            **errp)<br>
            +{<br>
            +    RISCVCLICState *clic = RISCV_CLIC(dev);<br>
            +    size_t harts_x_sources = clic-&gt;num_harts *
            clic-&gt;num_sources;<br>
            +    int irqs, i;<br>
            +<br>
            +    if (clic-&gt;prv_s &amp;&amp; clic-&gt;prv_u) {<br>
            +        irqs = 3 * harts_x_sources;<br>
            +    } else if (clic-&gt;prv_s || clic-&gt;prv_u) {<br>
            +        irqs = 2 * harts_x_sources;<br>
            +    } else {<br>
            +        irqs = harts_x_sources;<br>
            +    }<br>
            +<br>
            +    clic-&gt;clic_size = irqs * 4 + 0x1000;<br>
            +    memory_region_init_io(&amp;clic-&gt;mmio, OBJECT(dev),
            &amp;riscv_clic_ops, clic,<br>
            +                          TYPE_RISCV_CLIC,
            clic-&gt;clic_size);<br>
            +<br>
            +    clic-&gt;clicintip = g_new0(uint8_t, irqs);<br>
            +    clic-&gt;clicintie = g_new0(uint8_t, irqs);<br>
            +    clic-&gt;clicintattr = g_new0(uint8_t, irqs);<br>
            +    clic-&gt;clicintctl = g_new0(uint8_t, irqs);<br>
            +    clic-&gt;active_list = g_new0(CLICActiveInterrupt,
            irqs);<br>
          </blockquote>
          <div><br>
          </div>
          <div>Should the size of clic-&gt;active_list be:
            harts_x_sources?</div>
        </div>
      </div>
    </blockquote>
    <p>Every irq can be in the active_list, so just the number of irqs.</p>
    <p>Remind we will only use M-mode IRQ in next patch set, I still
      think we should use the<br>
      irqs here, because irq in active_list has privilege information.</p>
    <p>Thanks,<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite"
cite="mid:CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> <br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------9A2008FF1F5A447F30033EB8--

