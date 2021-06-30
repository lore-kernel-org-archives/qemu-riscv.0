Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lySuj-0007OQ-MM
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jun 2021 01:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lySui-0007O9-2O
 for qemu-riscv@nongnu.org; Wed, 30 Jun 2021 01:37:32 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lySud-00041b-R5
 for qemu-riscv@nongnu.org; Wed, 30 Jun 2021 01:37:31 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t9so1131245pgn.4
 for <qemu-riscv@nongnu.org>; Tue, 29 Jun 2021 22:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w3WIZis4ebUNuH3otOOlmAhNhR2jT/q18Z3QhESmAow=;
 b=Mr7ZQWE0y0Su0H66z3gLvIMNLHbzVK52zEcwMjXGzVdiZYmF6uTc/7DT43/GhHPQCL
 legrzXFYU+nI8AoCqdTD+4gWiNrehCPluPAPzOg8/F8y1dElHbLaIuwvxGYIvRytKVXy
 fQ12NRIWLoh9jl5mAW9ZZxIbD+1IhGfEfI0ORB/jjUYSahHBV/DbjqSUGbY+HwEYgz2p
 8h/+xTD6yhd7T78cjK2Zi+FQTNsDSR/MjOcrIR7ynYjKvMpKxnsHX9l4gwb6XrbJUsb8
 I8l6Mr5QkpRBlDsvSbAV50F93YRWaMmqdehetZueQa9hCM/JiII7amIwb9gMJS6BFN+A
 jkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3WIZis4ebUNuH3otOOlmAhNhR2jT/q18Z3QhESmAow=;
 b=lDJaKHMA+v7GXjDSfjHmkljTkVsHCiPkADiBhXbYHesrc3/K8K4qvjM5+wf/VKUIEe
 Wsvtz0NY2SYlnDLpjdRoMjuRDYxWtNpOMjTk+1DI3IkpDGtMDmYwMi/LXaaOAN6Iakty
 oOkzrLV+VD7Gmxc3J0oCCJ55gf/enNDMV3UitV76WbMxYKCB4beewaO+IdSC1g0PAFym
 g9Q3bq01yQuEH9ktAG74RMp58sCLN5Dp9M8ByfGMISIqz4eDTd1mwa/yjTmT267of1aG
 FK75NAbkZd+ciA0mCJ6Ls75UB29Yp4pVdoqRuey+fuMYpL6sPk6iLvT/wtnhBxs+Mf2b
 T/dA==
X-Gm-Message-State: AOAM533LGGJaxeB6SUOtxFSayDKeBnAQe3ClbgIecKePMrOkO+44aeWA
 ckeD2Av8ok0yRhFqpg2trG3txZAOPkoksQ==
X-Google-Smtp-Source: ABdhPJzP9uCvdVKnEqnisUeNs6xL92c9+T06lP+U0R53BQrTg6MVxX9L6p+K2pIxPtHKpIQD+Al2Mg==
X-Received: by 2002:a05:6a00:1591:b029:30f:bfb6:5b76 with SMTP id
 u17-20020a056a001591b029030fbfb65b76mr2251285pfk.33.1625031444799; 
 Tue, 29 Jun 2021 22:37:24 -0700 (PDT)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com.
 [209.85.210.170])
 by smtp.gmail.com with ESMTPSA id u7sm20218273pjn.26.2021.06.29.22.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 22:37:23 -0700 (PDT)
Received: by mail-pf1-f170.google.com with SMTP id j199so932970pfd.7;
 Tue, 29 Jun 2021 22:37:23 -0700 (PDT)
X-Received: by 2002:a62:2686:0:b029:30c:828f:4447 with SMTP id
 m128-20020a6226860000b029030c828f4447mr14206542pfm.31.1625031443503; Tue, 29
 Jun 2021 22:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-4-zhiwei_liu@c-sky.com>
 <CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com>
 <4ca1ca94-52d0-9b67-2b65-c9f48d484c7c@c-sky.com>
In-Reply-To: <4ca1ca94-52d0-9b67-2b65-c9f48d484c7c@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 30 Jun 2021 13:37:12 +0800
X-Gmail-Original-Message-ID: <CANzO1D0AgbpYL0u2B8hwfxVc6OR7t_wi5XSWem-YVH3Wup0YCQ@mail.gmail.com>
Message-ID: <CANzO1D0AgbpYL0u2B8hwfxVc6OR7t_wi5XSWem-YVH3Wup0YCQ@mail.gmail.com>
Subject: Re: [RFC PATCH 03/11] hw/intc: Add CLIC device
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000f05ff205c5f51dde"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 30 Jun 2021 05:37:32 -0000

--000000000000f05ff205c5f51dde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B46=E6=9C=8829=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:45=E5=AF=AB=E9=81=93=EF=BC=9A

> Hi Frank,
>
> Thanks for a lot of good points.
> On 2021/6/26 =E4=B8=8B=E5=8D=8811:03, Frank Chang wrote:
>
> LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
>> +static uint8_t
>> +riscv_clic_get_interrupt_level(RISCVCLICState *clic, uint8_t intctl)
>> +{
>> +    int nlbits =3D clic->nlbits;
>> +
>> +    uint8_t mask_il =3D ((1 << nlbits) - 1) << (8 - nlbits);
>> +    uint8_t mask_padding =3D (1 << (8 - nlbits)) - 1;
>> +    /* unused level bits are set to 1 */
>> +    return (intctl & mask_il) | mask_padding;
>> +}
>>
>
> According to spec:
>   if the nlbits > CLICINTCTLBITS, then the lower bits of the 8-bit
>   interrupt level are assumed to be all 1s.
>
> That is, the valid nlbits should be: min(clic->nlbits, CLICINTCTLBITS);
> The cliccfg example in spec also shows that:
>
> CLICINTCTLBITS  nlbits  clicintctl[i]  interrupt levels
>       0                       2         ........         255
>       1                       2         l.......         127,255
>       2                       2         ll......         63,127,191,255
>       3                       3         lll.....
>  31,63,95,127,159,191,223,255
>       4                       1         lppp....      127,255
>
>
> Agree, thanks.
>
>
>> + * In a system with multiple harts, the M-mode CLIC regions for all the
>> harts
>> + * are placed contiguously in the memory space, followed by the S-mode
>> CLIC
>> + * regions for all harts. (Section 3.11)
>> + */
>>
>
> The above description is not true any more in the latest spec:
>   The CLIC specification does not dictate how CLIC memory-mapped register=
s
> are
>   split between M/S/U regions as well as the layout of multiple harts as
> this is generally
>   a platform issue and each platform needs to define a discovery mechanis=
m
> to determine
>   the memory map locations.
>
> But I think we can just keep the current design for now anyway, as it's
> also one of legal memory layout.
> Otherwise, the design would be more complicated I think.
>
> We can pass an array containing indexed by hart_id and mode from the
> machine board, such as
>
> hwaddr clic_memmap[HARTS][MODE] =3D {
>
> {0x0000, 0x10000, 0x20000},
>
> {0x4000, 0x14000, 0x24000},
>
> {0x8000, 0x18000, 0x28000},
>
> {0xc000, 0x1c000, 0x2c000},
>
> }
>
That would be great.
We can create different memory regions for each memory map
and assign them with the same read/write ops.

Thanks,
Frank Chang


>
>
>>
>> +static void
>> +riscv_clic_update_intie(RISCVCLICState *clic, int mode, int hartid,
>> +                        int irq, uint64_t new_intie)
>> +{
>> +    size_t hart_offset =3D hartid * clic->num_sources;
>> +    size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> irq);
>> +    CLICActiveInterrupt *active_list =3D &clic->active_list[hart_offset=
];
>> +    size_t *active_count =3D &clic->active_count[hartid];
>> +
>> +    uint8_t old_intie =3D clic->clicintie[irq_offset];
>> +    clic->clicintie[irq_offset] =3D !!new_intie;
>> +
>> +    /* Add to or remove from list of active interrupts */
>> +    if (new_intie && !old_intie) {
>> +        active_list[*active_count].intcfg =3D (mode << 8) |
>> +                                            clic->clicintctl[irq_offset=
];
>> +        active_list[*active_count].irq =3D irq;
>> +        (*active_count)++;
>> +    } else if (!new_intie && old_intie) {
>> +        CLICActiveInterrupt key =3D {
>> +            (mode << 8) | clic->clicintctl[irq_offset], irq
>> +        };
>> +        CLICActiveInterrupt *result =3D bsearch(&key,
>> +                                              active_list, *active_coun=
t,
>> +
>> sizeof(CLICActiveInterrupt),
>> +                                              riscv_clic_active_compare=
);
>> +        size_t elem =3D (result - active_list) /
>> sizeof(CLICActiveInterrupt);
>>
>
> I think what you are trying to do here is to get the number of elements
> right after the active interrupt to be deleted in order to calculate the
> size of
> active interrupts to be memmoved.
>
> Agree, thanks.
>
> However, according to C spec:
>   When two pointers are subtracted, both shall point to elements of the
> same array object,
>   or one past the last element of the array object; the result is the
> difference of the
>   subscripts of the two array elements.
>
> So I think: (result - active_list) is already the number of elements you
> want.
> You don't have to divide it with sizeof(CLICActiveInterrupt) again.
>
>
>> +        size_t sz =3D (--(*active_count) - elem) *
>> sizeof(CLICActiveInterrupt);
>> +        assert(result);
>>
>
> Nit: assert(result) can be moved above size_t elem statement.
>
> Agree.
>
>
>
>> +        memmove(&result[0], &result[1], sz);
>> +    }
>> +
>> +    /* Sort list of active interrupts */
>> +    qsort(active_list, *active_count,
>> +          sizeof(CLICActiveInterrupt),
>> +          riscv_clic_active_compare);
>> +
>> +    riscv_clic_next_interrupt(clic, hartid);
>> +}
>> +
>> +static void
>> +riscv_clic_hart_write(RISCVCLICState *clic, hwaddr addr,
>> +                      uint64_t value, unsigned size,
>> +                      int mode, int hartid, int irq)
>> +{
>> +    int req =3D extract32(addr, 0, 2);
>> +    size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> irq);
>> +
>> +    if (hartid >=3D clic->num_harts) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "clic: invalid hartid %u: 0x%" HWADDR_PRIx "\n",
>> +                      hartid, addr);
>> +        return;
>> +    }
>> +
>> +    if (irq >=3D clic->num_sources) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "clic: invalid irq %u: 0x%" HWADDR_PRIx "\n", irq=
,
>> addr);
>> +        return;
>> +    }
>> +
>> +    switch (req) {
>>
>
> Spec. says that it's legal to write 32-bit value to set
> {clicintctl[i], clicintattr[i], clicintie[i] ,clicintip[i]} at the same
> time:
>   A 32-bit write to {clicintctl,clicintattr,clicintie,clicintip} is legal=
.
>   However, there is no specified order in which the effects of
>   the individual byte updates take effect.
>
>
> I miss it. I think it only supports 1 byte access or 4 bytes access. For =
4
> bytes access,  we need to pass an flag to specify to the order from the
> machine board.
>
> Thoughts?
>
> +    case 0: /* clicintip[i] */
>> +        if (riscv_clic_validate_intip(clic, mode, hartid, irq)) {
>> +            /*
>> +             * The actual pending bit is located at bit 0 (i.e., the
>> +             * leastsignificant bit). In case future extensions expand
>> the bit
>>
>
> Typo: leastsignificant =3D> least significant
>
> OK.
>
>
>
>> +             * field, from FW perspective clicintip[i]=3Dzero means no
>> interrupt
>> +             * pending, and clicintip[i]!=3D0 (not just 1) indicates an
>> +             * interrupt is pending. (Section 3.4)
>> +             */
>> +            if (value !=3D clic->clicintip[irq_offset]) {
>> +                riscv_clic_update_intip(clic, mode, hartid, irq, value)=
;
>> +            }
>> +        }
>> +        break;
>> +    case 1: /* clicintie[i] */
>> +        if (clic->clicintie[irq_offset] !=3D value) {
>> +            riscv_clic_update_intie(clic, mode, hartid, irq, value);
>> +        }
>> +        break;
>> +    case 2: /* clicintattr[i] */
>> +        if (riscv_clic_validate_intattr(clic, value)) {
>> +            if (clic->clicintattr[irq_offset] !=3D value) {
>> +                /* When nmbits=3D2, check WARL */
>> +                bool invalid =3D (clic->nmbits =3D=3D 2) &&
>> +                               (extract64(value, 6, 2) =3D=3D 0b10);
>> +                if (invalid) {
>> +                    uint8_t old_mode =3D
>> extract32(clic->clicintattr[irq_offset],
>> +                                                 6, 2);
>> +                    value =3D deposit32(value, 6, 2, old_mode);
>> +                }
>> +                clic->clicintattr[irq_offset] =3D value;
>> +                riscv_clic_next_interrupt(clic, hartid);
>> +            }
>> +        }
>> +        break;
>> +    case 3: /* clicintctl[i] */
>> +        if (value !=3D clic->clicintctl[irq_offset]) {
>> +            clic->clicintctl[irq_offset] =3D value;
>>
>
> If irq i is already in the active_list, when will its intcfg been synced?
>
> Good. I think should sync immediately.
>
>
>
>> +            riscv_clic_next_interrupt(clic, hartid);
>> +        }
>> +        break;
>> +    }
>> +}
>> +
>> +static uint64_t
>> +riscv_clic_hart_read(RISCVCLICState *clic, hwaddr addr, int mode,
>> +                     int hartid, int irq)
>> +{
>> +    int req =3D extract32(addr, 0, 2);
>> +    size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> irq);
>> +
>> +    if (hartid >=3D clic->num_harts) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "clic: invalid hartid %u: 0x%" HWADDR_PRIx "\n",
>> +                      hartid, addr);
>> +        return 0;
>> +    }
>> +
>> +    if (irq >=3D clic->num_sources) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "clic: invalid irq %u: 0x%" HWADDR_PRIx "\n", irq=
,
>> addr);
>> +        return 0;
>> +    }
>> +
>> +    switch (req) {
>> +    case 0: /* clicintip[i] */
>> +        return clic->clicintip[irq_offset];
>> +    case 1: /* clicintie[i] */
>> +        return clic->clicintie[irq_offset];
>> +    case 2: /* clicintattr[i] */
>> +        /*
>> +         * clicintattr register layout
>> +         * Bits Field
>> +         * 7:6 mode
>> +         * 5:3 reserved (WPRI 0)
>> +         * 2:1 trig
>> +         * 0 shv
>> +         */
>> +        return clic->clicintattr[irq_offset] & ~0x38;
>> +    case 3: /* clicintctrl */
>>
>
> Typo: clicintctl
>
> OK.
>
>
>
>> +        /*
>> +         * The implemented bits are kept left-justified in the
>> most-significant
>> +         * bits of each 8-bit clicintctl[i] register, with the lower
>> +         * unimplemented bits treated as hardwired to 1.(Section 3.7)
>> +         */
>> +        return clic->clicintctl[irq_offset] |
>> +               ((1 << (8 - clic->clicintctlbits)) - 1);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>
>> +static void
>> +riscv_clic_write(void *opaque, hwaddr addr, uint64_t value, unsigned
>> size)
>> +{
>> +    RISCVCLICState *clic =3D opaque;
>> +    hwaddr clic_size =3D clic->clic_size;
>> +    int hartid, mode, irq;
>> +
>> +    if (addr < clic_size) {
>>
>
> Is this necessary?
> I think memory region size already limits the request address to be withi=
n
> the range of clic_size.
>
> At this point, not necessary.
>
>
>
>>
>> +static uint64_t riscv_clic_read(void *opaque, hwaddr addr, unsigned siz=
e)
>> +{
>> +    RISCVCLICState *clic =3D opaque;
>> +    hwaddr clic_size =3D clic->clic_size;
>> +    int hartid, mode, irq;
>> +
>> +    if (addr < clic_size) {
>>
>
> Same to riscv_clic_write().
>
> Thanks,
> Frank Chang
>
>
>> +        if (addr < 0x1000) {
>> +            assert(addr % 4 =3D=3D 0);
>> +            int index =3D addr / 4;
>> +            switch (index) {
>> +            case 0: /* cliccfg */
>> +                return clic->nvbits |
>> +                       (clic->nlbits << 1) |
>> +                       (clic->nmbits << 5);
>> +            case 1: /* clicinfo */
>> +                /*
>> +                 * clicinfo register layout
>> +                 *
>> +                 * Bits Field
>> +                 * 31 reserved (WARL 0)
>> +                 * 30:25 num_trigger
>> +                 * 24:21 CLICINTCTLBITS
>> +                 * 20:13 version (for version control)
>> +                 * 12:0 num_interrupt
>> +                 */
>> +                return clic->clicinfo & ~INT32_MAX;
>>
>
> clic->clicinfo should represent the CLIC setting information.
> I think it's better to add clic reset function or in riscv_clic_realize()
> to initialize clic->clicinfo.
>
> Agree.
>
>
>
>> +
>> +static void riscv_clic_realize(DeviceState *dev, Error **errp)
>> +{
>> +    RISCVCLICState *clic =3D RISCV_CLIC(dev);
>> +    size_t harts_x_sources =3D clic->num_harts * clic->num_sources;
>> +    int irqs, i;
>> +
>> +    if (clic->prv_s && clic->prv_u) {
>> +        irqs =3D 3 * harts_x_sources;
>> +    } else if (clic->prv_s || clic->prv_u) {
>> +        irqs =3D 2 * harts_x_sources;
>> +    } else {
>> +        irqs =3D harts_x_sources;
>> +    }
>> +
>> +    clic->clic_size =3D irqs * 4 + 0x1000;
>> +    memory_region_init_io(&clic->mmio, OBJECT(dev), &riscv_clic_ops,
>> clic,
>> +                          TYPE_RISCV_CLIC, clic->clic_size);
>> +
>> +    clic->clicintip =3D g_new0(uint8_t, irqs);
>> +    clic->clicintie =3D g_new0(uint8_t, irqs);
>> +    clic->clicintattr =3D g_new0(uint8_t, irqs);
>> +    clic->clicintctl =3D g_new0(uint8_t, irqs);
>> +    clic->active_list =3D g_new0(CLICActiveInterrupt, irqs);
>>
>
> Should the size of clic->active_list be: harts_x_sources?
>
> Every irq can be in the active_list, so just the number of irqs.
>
> Remind we will only use M-mode IRQ in next patch set, I still think we
> should use the
> irqs here, because irq in active_list has privilege information.
>
> Thanks,
> Zhiwei
>
>
>
>>
>>

--000000000000f05ff205c5f51dde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B46=E6=9C=
=8829=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:45=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>Hi Frank,</p>
    <p>Thanks for a lot of good points.=C2=A0 <br>
    </p>
    <div>On 2021/6/26 =E4=B8=8B=E5=8D=8811:03, Frank Chang
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.=
com" target=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;
          =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=A5 =E9=80=B1=E4=BA=94 =
=E4=B8=8B=E5=8D=883:57=E5=AF=AB=E9=81=93=EF=BC=9A<br>
        </div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+static uint8_t=
<br>
            +riscv_clic_get_interrupt_level(RISCVCLICState *clic,
            uint8_t intctl)<br>
            +{<br>
            +=C2=A0 =C2=A0 int nlbits =3D clic-&gt;nlbits;<br>
            +<br>
            +=C2=A0 =C2=A0 uint8_t mask_il =3D ((1 &lt;&lt; nlbits) - 1) &l=
t;&lt; (8
            - nlbits);<br>
            +=C2=A0 =C2=A0 uint8_t mask_padding =3D (1 &lt;&lt; (8 - nlbits=
)) - 1;<br>
            +=C2=A0 =C2=A0 /* unused level bits are set to 1 */<br>
            +=C2=A0 =C2=A0 return (intctl &amp; mask_il) | mask_padding;<br=
>
            +}<br>
          </blockquote>
          <div><br>
          </div>
          <div>According to spec:</div>
          <div>=C2=A0 if the nlbits &gt; CLICINTCTLBITS, then the lower bit=
s
            of the 8-bit</div>
          <div>=C2=A0 interrupt level are assumed to be all 1s.<br>
          </div>
          <div><br>
          </div>
          <div>That is, the valid nlbits should be: min(clic-&gt;nlbits,
            CLICINTCTLBITS);</div>
          <div>The cliccfg example in spec also shows that:</div>
          <div><br>
          </div>
          <div>CLICINTCTLBITS=C2=A0 nlbits=C2=A0 clicintctl[i]=C2=A0 interr=
upt levels<br>
            =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0........=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0255<br>
            =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0l.......=C2=A0 =C2=A0 =C2=A0 =C2=A0
            =C2=A0127,255<br>
            =C2=A0 =C2=A0 =C2=A0 2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ll......=C2=A0 =C2=A0 =C2=A0 =C2=A0
            =C2=A063,127,191,255<br>
            =C2=A0 =C2=A0 =C2=A0 3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0lll.....=C2=A0 =C2=A0 =C2=A0 =C2=A0
            =C2=A031,63,95,127,159,191,223,255<br>
            =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0lppp....=C2=A0 =C2=A0 =C2=A0
            127,255<br>
          </div>
          <div>=C2=A0</div>
        </div>
      </div>
    </blockquote>
    Agree, thanks.<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
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
          <div>=C2=A0 The CLIC specification does not dictate how CLIC
            memory-mapped registers are</div>
          <div>=C2=A0 split between M/S/U regions as well as the layout of
            multiple harts as this is generally</div>
          <div>=C2=A0 a platform issue and each platform needs to define a
            discovery mechanism to determine</div>
          <div>=C2=A0 the memory map locations.<br>
          </div>
          <div><br>
          </div>
          <div>But I think we can just keep the current design for now
            anyway, as it&#39;s also one of legal memory layout.</div>
          <div>Otherwise, the design would be more complicated I think.</di=
v>
        </div>
      </div>
    </blockquote>
    <p>We can pass an array containing indexed by hart_id and mode from
      the machine board, such as</p>
    <p><font face=3D"monospace">hwaddr clic_memmap[HARTS][MODE] =3D {</font=
></p>
    <p><font face=3D"monospace">{0x0000, 0x10000, 0x20000},<br>
      </font></p>
    <p><font face=3D"monospace">{0x4000, 0x14000, 0x24000},</font></p>
    <p><font face=3D"monospace">{0x8000, 0x18000, 0x28000},</font></p>
    <p><font face=3D"monospace">{0xc000, 0x1c000, 0x2c000},</font></p>
    <p><font face=3D"monospace">}</font></p></div></blockquote><div>That wo=
uld be great.</div><div>We can create different memory regions for each mem=
ory map</div><div>and assign them with the same read/write ops.</div><div><=
br></div><div>Thanks,</div><div>Frank Chang</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
            <br>
            +static void<br>
            +riscv_clic_update_intie(RISCVCLICState *clic, int mode, int
            hartid,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 int irq, uint64_t new_intie)<br>
            +{<br>
            +=C2=A0 =C2=A0 size_t hart_offset =3D hartid * clic-&gt;num_sou=
rces;<br>
            +=C2=A0 =C2=A0 size_t irq_offset =3D riscv_clic_get_irq_offset(=
clic,
            mode, hartid, irq);<br>
            +=C2=A0 =C2=A0 CLICActiveInterrupt *active_list =3D
            &amp;clic-&gt;active_list[hart_offset];<br>
            +=C2=A0 =C2=A0 size_t *active_count =3D
            &amp;clic-&gt;active_count[hartid];<br>
            +<br>
            +=C2=A0 =C2=A0 uint8_t old_intie =3D clic-&gt;clicintie[irq_off=
set];<br>
            +=C2=A0 =C2=A0 clic-&gt;clicintie[irq_offset] =3D !!new_intie;<=
br>
            +<br>
            +=C2=A0 =C2=A0 /* Add to or remove from list of active interrup=
ts */<br>
            +=C2=A0 =C2=A0 if (new_intie &amp;&amp; !old_intie) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 active_list[*active_count].intcfg =
=3D (mode &lt;&lt;
            8) |<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
            clic-&gt;clicintctl[irq_offset];<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 active_list[*active_count].irq =3D=
 irq;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*active_count)++;<br>
            +=C2=A0 =C2=A0 } else if (!new_intie &amp;&amp; old_intie) {<br=
>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CLICActiveInterrupt key =3D {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (mode &lt;&lt; 8) |
            clic-&gt;clicintctl[irq_offset], irq<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CLICActiveInterrupt *result =3D bs=
earch(&amp;key,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 active_list,
            *active_count,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
            sizeof(CLICActiveInterrupt),<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
            riscv_clic_active_compare);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t elem =3D (result - active_l=
ist) /
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
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>However, according to C spec:</div>
          <div>=C2=A0 When two pointers are subtracted, both shall point to
            elements of the same array object,</div>
          =C2=A0 or one past the last element of the array object; the resu=
lt
          is the difference of the<br>
          =C2=A0 subscripts of the two array elements.</div>
        <div class=3D"gmail_quote"><br>
        </div>
        <div class=3D"gmail_quote">So I think: (result - active_list) is
          already the number of elements you want.</div>
        <div class=3D"gmail_quote">You don&#39;t have to divide it with
          sizeof(CLICActiveInterrupt) again.<br>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t sz =3D (--(*active_count) -=
 elem) *
            sizeof(CLICActiveInterrupt);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(result);<br>
          </blockquote>
          <div><br>
          </div>
          <div>Nit: assert(result) can be moved above size_t elem
            statement.</div>
        </div>
      </div>
    </blockquote>
    Agree.<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memmove(&amp;result[0], &amp;resul=
t[1], sz);<br>
            +=C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 /* Sort list of active interrupts */<br>
            +=C2=A0 =C2=A0 qsort(active_list, *active_count,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(CLICActiveInterrupt)=
,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_active_compare);=
<br>
            +<br>
            +=C2=A0 =C2=A0 riscv_clic_next_interrupt(clic, hartid);<br>
            +}<br>
            +<br>
            +static void<br>
            +riscv_clic_hart_write(RISCVCLICState *clic, hwaddr addr,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 uint64_t value, unsigned size,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 int mode, int hartid, int irq)<br>
            +{<br>
            +=C2=A0 =C2=A0 int req =3D extract32(addr, 0, 2);<br>
            +=C2=A0 =C2=A0 size_t irq_offset =3D riscv_clic_get_irq_offset(=
clic,
            mode, hartid, irq);<br>
            +<br>
            +=C2=A0 =C2=A0 if (hartid &gt;=3D clic-&gt;num_harts) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;clic: invalid hartid %u: 0x%&quot;
            HWADDR_PRIx &quot;\n&quot;,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 hartid, addr);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
            +=C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 if (irq &gt;=3D clic-&gt;num_sources) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;clic: invalid irq %u: 0x%&quot;
            HWADDR_PRIx &quot;\n&quot;, irq, addr);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
            +=C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 switch (req) {<br>
          </blockquote>
          <div><br>
          </div>
          <div>Spec. says that it&#39;s legal to write 32-bit value to set<=
br>
          </div>
          <div>{clicintctl[i], clicintattr[i], clicintie[i]
            ,clicintip[i]} at the same time:<br>
          </div>
          <div>=C2=A0 A 32-bit write to
            {clicintctl,clicintattr,clicintie,clicintip} is legal.<br>
          </div>
          <div>=C2=A0 However, there is no specified order in which the
            effects of</div>
          <div>=C2=A0 the individual byte updates take effect.</div>
          <div>=C2=A0</div>
        </div>
      </div>
    </blockquote>
    <p>I miss it. I think it only supports 1 byte access or 4 bytes
      access. For 4 bytes access,=C2=A0 we need to pass an flag to specify =
to
      the order from the machine board.</p>
    <p>Thoughts?</p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 case 0: /* clicintip[i] */<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_clic_validate_intip(clic=
, mode, hartid,
            irq)) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The actual p=
ending bit is located at bit 0
            (i.e., the<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* leastsignifi=
cant bit). In case future
            extensions expand the bit<br>
          </blockquote>
          <div><br>
          </div>
          <div>Typo: leastsignificant =3D&gt; least significant</div>
        </div>
      </div>
    </blockquote>
    OK.<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* field, from =
FW perspective clicintip[i]=3Dzero
            means no interrupt<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* pending, and=
 clicintip[i]!=3D0 (not just 1)
            indicates an<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* interrupt is=
 pending. (Section 3.4)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value !=3D clic-=
&gt;clicintip[irq_offset]) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_=
clic_update_intip(clic, mode, hartid,
            irq, value);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
            +=C2=A0 =C2=A0 case 1: /* clicintie[i] */<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (clic-&gt;clicintie[irq_offset]=
 !=3D value) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_update_in=
tie(clic, mode, hartid,
            irq, value);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
            +=C2=A0 =C2=A0 case 2: /* clicintattr[i] */<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_clic_validate_intattr(cl=
ic, value)) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (clic-&gt;clicint=
attr[irq_offset] !=3D value)
            {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Whe=
n nmbits=3D2, check WARL */<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool i=
nvalid =3D (clic-&gt;nmbits =3D=3D 2)
            &amp;&amp;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(extract64(value, 6, 2) =
=3D=3D
            0b10);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (in=
valid) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 uint8_t old_mode =3D
            extract32(clic-&gt;clicintattr[irq_offset],<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06, 2);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 value =3D deposit32(value, 6, 2,
            old_mode);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic-&=
gt;clicintattr[irq_offset] =3D value;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_=
clic_next_interrupt(clic, hartid);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
            +=C2=A0 =C2=A0 case 3: /* clicintctl[i] */<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value !=3D clic-&gt;clicintctl=
[irq_offset]) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic-&gt;clicintctl[=
irq_offset] =3D value;<br>
          </blockquote>
          <div><br>
          </div>
          <div>If irq i is already in the active_list, when will
            its=C2=A0intcfg been synced?<br>
          </div>
        </div>
      </div>
    </blockquote>
    Good. I think should sync immediately.<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_next_inte=
rrupt(clic, hartid);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
            +=C2=A0 =C2=A0 }<br>
            +}<br>
            +<br>
            +static uint64_t<br>
            +riscv_clic_hart_read(RISCVCLICState *clic, hwaddr addr, int
            mode,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0int hartid, int irq)<br>
            +{<br>
            +=C2=A0 =C2=A0 int req =3D extract32(addr, 0, 2);<br>
            +=C2=A0 =C2=A0 size_t irq_offset =3D riscv_clic_get_irq_offset(=
clic,
            mode, hartid, irq);<br>
            +<br>
            +=C2=A0 =C2=A0 if (hartid &gt;=3D clic-&gt;num_harts) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;clic: invalid hartid %u: 0x%&quot;
            HWADDR_PRIx &quot;\n&quot;,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 hartid, addr);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
            +=C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 if (irq &gt;=3D clic-&gt;num_sources) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;clic: invalid irq %u: 0x%&quot;
            HWADDR_PRIx &quot;\n&quot;, irq, addr);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
            +=C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 switch (req) {<br>
            +=C2=A0 =C2=A0 case 0: /* clicintip[i] */<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;clicintip[irq_offs=
et];<br>
            +=C2=A0 =C2=A0 case 1: /* clicintie[i] */<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;clicintie[irq_offs=
et];<br>
            +=C2=A0 =C2=A0 case 2: /* clicintattr[i] */<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* clicintattr register layou=
t<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Bits Field<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 7:6 mode<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 5:3 reserved (WPRI 0)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 2:1 trig<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0 shv<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;clicintattr[irq_of=
fset] &amp;
            ~0x38;<br>
            +=C2=A0 =C2=A0 case 3: /* clicintctrl */<br>
          </blockquote>
          <div><br>
          </div>
          <div>Typo:=C2=A0clicintctl</div>
        </div>
      </div>
    </blockquote>
    OK.<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The implemented bits are k=
ept left-justified in
            the most-significant<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* bits of each 8-bit clicint=
ctl[i] register, with
            the lower<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unimplemented bits treated=
 as hardwired to
            1.(Section 3.7)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;clicintctl[irq_off=
set] |<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((1 &lt=
;&lt; (8 - clic-&gt;clicintctlbits))
            - 1);<br>
            +=C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 return 0;<br>
            +}<br>
            +<br>
            <br>
            +static void<br>
            +riscv_clic_write(void *opaque, hwaddr addr, uint64_t value,
            unsigned size)<br>
            +{<br>
            +=C2=A0 =C2=A0 RISCVCLICState *clic =3D opaque;<br>
            +=C2=A0 =C2=A0 hwaddr clic_size =3D clic-&gt;clic_size;<br>
            +=C2=A0 =C2=A0 int hartid, mode, irq;<br>
            +<br>
            +=C2=A0 =C2=A0 if (addr &lt; clic_size) {<br>
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
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
            +static uint64_t riscv_clic_read(void *opaque, hwaddr addr,
            unsigned size)<br>
            +{<br>
            +=C2=A0 =C2=A0 RISCVCLICState *clic =3D opaque;<br>
            +=C2=A0 =C2=A0 hwaddr clic_size =3D clic-&gt;clic_size;<br>
            +=C2=A0 =C2=A0 int hartid, mode, irq;<br>
            +<br>
            +=C2=A0 =C2=A0 if (addr &lt; clic_size) {<br>
          </blockquote>
          <div><br>
          </div>
          <div>Same to riscv_clic_write().<br>
          </div>
          <div><br>
          </div>
          <div>Thanks,</div>
          <div>Frank Chang</div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; 0x1000) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(addr % 4 =3D=
=3D 0);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int index =3D addr /=
 4;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (index) {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /* cliccfg *=
/<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 clic-&gt;nvbits |<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(clic-&gt;nlbits &lt;&lt; 1) |<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(clic-&gt;nmbits &lt;&lt; 5);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1: /* clicinfo =
*/<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
* clicinfo register layout<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
*<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
* Bits Field<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
* 31 reserved (WARL 0)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
* 30:25 num_trigger<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
* 24:21 CLICINTCTLBITS<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
* 20:13 version (for version control)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
* 12:0 num_interrupt<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
*/<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 clic-&gt;clicinfo &amp; ~INT32_MAX;<br>
          </blockquote>
          <div><br>
          </div>
          <div>clic-&gt;clicinfo should represent the CLIC setting
            information.</div>
          <div>I think it&#39;s better to add clic reset function or
            in=C2=A0riscv_clic_realize() to initialize clic-&gt;clicinfo.</=
div>
        </div>
      </div>
    </blockquote>
    Agree.<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +<br>
            +static void riscv_clic_realize(DeviceState *dev, Error
            **errp)<br>
            +{<br>
            +=C2=A0 =C2=A0 RISCVCLICState *clic =3D RISCV_CLIC(dev);<br>
            +=C2=A0 =C2=A0 size_t harts_x_sources =3D clic-&gt;num_harts *
            clic-&gt;num_sources;<br>
            +=C2=A0 =C2=A0 int irqs, i;<br>
            +<br>
            +=C2=A0 =C2=A0 if (clic-&gt;prv_s &amp;&amp; clic-&gt;prv_u) {<=
br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs =3D 3 * harts_x_sources;<br>
            +=C2=A0 =C2=A0 } else if (clic-&gt;prv_s || clic-&gt;prv_u) {<b=
r>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs =3D 2 * harts_x_sources;<br>
            +=C2=A0 =C2=A0 } else {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs =3D harts_x_sources;<br>
            +=C2=A0 =C2=A0 }<br>
            +<br>
            +=C2=A0 =C2=A0 clic-&gt;clic_size =3D irqs * 4 + 0x1000;<br>
            +=C2=A0 =C2=A0 memory_region_init_io(&amp;clic-&gt;mmio, OBJECT=
(dev),
            &amp;riscv_clic_ops, clic,<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_RISCV_CLIC,
            clic-&gt;clic_size);<br>
            +<br>
            +=C2=A0 =C2=A0 clic-&gt;clicintip =3D g_new0(uint8_t, irqs);<br=
>
            +=C2=A0 =C2=A0 clic-&gt;clicintie =3D g_new0(uint8_t, irqs);<br=
>
            +=C2=A0 =C2=A0 clic-&gt;clicintattr =3D g_new0(uint8_t, irqs);<=
br>
            +=C2=A0 =C2=A0 clic-&gt;clicintctl =3D g_new0(uint8_t, irqs);<b=
r>
            +=C2=A0 =C2=A0 clic-&gt;active_list =3D g_new0(CLICActiveInterr=
upt,
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
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div></div>

--000000000000f05ff205c5f51dde--

