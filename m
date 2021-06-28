Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxm1D-0001Xp-OC
	for mharc-qemu-riscv@gnu.org; Mon, 28 Jun 2021 03:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxm1B-0001XB-RO
 for qemu-riscv@nongnu.org; Mon, 28 Jun 2021 03:49:21 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxm19-0000Wn-7e
 for qemu-riscv@nongnu.org; Mon, 28 Jun 2021 03:49:21 -0400
Received: by mail-pf1-x433.google.com with SMTP id s14so12149600pfg.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Jun 2021 00:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kKqTlffdGT1dszQCEFbZc8eeKk/EppgCJ7VPDCHhKdU=;
 b=ThCuizfZDY0imqw9Yv0zO9gv1w0Rz8RMGbvfbJzEAtLSbvYm3LVB6V8UwdWVOXWbm+
 nvFtXhiIm+XagRyVcN73deCjK1UAEyxAwkWKsVRhL/OfhUyYJ+Xn04NO+g5U/yR+8M1p
 iT1CnDgds5uBfBvgyVMlKCZrWxvRvCWBKgHGCX9VtsCBcdK4fvWJeltZdrRsVxbXdXlm
 F0DtTTB/bI5kwb99Ikdbq10JwWQsklA04y6gqHKXi7zvLtgSln40i1FZCyEttIH9/ayM
 CrmrViLWwQ5xCZMVfi+wSR7HCXHVkbXlRImm/mkr1XChagMKvWpqCTX9UEUMumIJhIBk
 dGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kKqTlffdGT1dszQCEFbZc8eeKk/EppgCJ7VPDCHhKdU=;
 b=ffTQDVb6f6I0A4xZnao89NfRABZrFRWRyzTwVTuqOOp1alj+e0hbHTDhYHxCq7u543
 F8tMDhEvdUcpGch7FhSDizpi7PQfS4v+E6Si5SLzMbO5whrLdrS10xO2Hnv7jK0wEI4t
 bCWE6ma4T/KUMnx32xIHjXlHSCn2kLlSIwaqAKxI5Iy+S0afchWDDCV8twd2S/vfUZ1b
 HTsgFQBmdO125c9rpUZEPis6B1oH7eLa6WIKsbdLN2Eefye8RlwpJEyiHk9C9P44/TpG
 uVa3hXCMfNqBr55pwYu8db/iwIf3wZF/+xr5/EVBLzsUI/ddhAbXbfh/P7gjRGDNeybi
 GZQg==
X-Gm-Message-State: AOAM532is+c4sEngLEtoigp80BO3Hn12aBUullvnQIwvK8Rn3Um4sBuM
 3V+Kk/X8QS/wHQLiZm5u9Sa5zTBpTE4x8xh8
X-Google-Smtp-Source: ABdhPJxrgTneWSNH+ES+5o4c8aA5AOqwaadAtqfh3XBRMpr/Mp8SGWuP/xBOJZycBGCO7BH6A7Zv8Q==
X-Received: by 2002:a05:6a00:1496:b029:308:29bc:6d4d with SMTP id
 v22-20020a056a001496b029030829bc6d4dmr21388832pfu.14.1624866557493; 
 Mon, 28 Jun 2021 00:49:17 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com.
 [209.85.214.181])
 by smtp.gmail.com with ESMTPSA id c62sm13418996pfa.12.2021.06.28.00.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 00:49:17 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id v12so8435202plo.10;
 Mon, 28 Jun 2021 00:49:17 -0700 (PDT)
X-Received: by 2002:a17:90a:f291:: with SMTP id
 fs17mr26439011pjb.47.1624866556799; 
 Mon, 28 Jun 2021 00:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-4-zhiwei_liu@c-sky.com>
 <CANzO1D0v5F4K--ACjGaMT7imyXK4vUhZpET3T7CpsEscOPUV2A@mail.gmail.com>
 <52225a77-c509-9999-9d8a-942ea407f44d@c-sky.com>
 <CAE_xrPg9qG-uOfkMeGvudWZFLUCG+7SSEbvS08iWmL_KKq7KZA@mail.gmail.com>
 <27879b9f-bffa-96c9-a8b2-033eb0a0be4c@c-sky.com>
 <CANzO1D062NOxsNG=fmoagXGJfQMu5tw_3uku307hm+t7iB_i7Q@mail.gmail.com>
 <6c9c894c-6f85-c6bb-a372-d69e15896571@c-sky.com>
In-Reply-To: <6c9c894c-6f85-c6bb-a372-d69e15896571@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 28 Jun 2021 15:49:05 +0800
X-Gmail-Original-Message-ID: <CANzO1D1RVotEcropVmHu5bPp7Hq30t2-BkR0pn7=iD18mKZiXw@mail.gmail.com>
Message-ID: <CANzO1D1RVotEcropVmHu5bPp7Hq30t2-BkR0pn7=iD18mKZiXw@mail.gmail.com>
Subject: Re: [RFC PATCH 03/11] hw/intc: Add CLIC device
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, wxy194768@alibaba-inc.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ecee2905c5ceb96b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Mon, 28 Jun 2021 07:49:22 -0000

--000000000000ecee2905c5ceb96b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B46=E6=9C=8828=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:40=E5=AF=AB=E9=81=93=EF=BC=9A

>
> On 2021/6/28 =E4=B8=8B=E5=8D=883:23, Frank Chang wrote:
>
> LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B46=E6=9C=8828=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:17=E5=AF=AB=E9=81=93=EF=BC=9A
>
>>
>> On 2021/6/26 =E4=B8=8B=E5=8D=888:56, Frank Chang wrote:
>>
>> On Wed, Jun 16, 2021 at 10:56 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote=
:
>>
>>>
>>> On 6/13/21 6:10 PM, Frank Chang wrote:
>>>
>>> LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:57=E5=AF=AB=E9=81=93=EF=BC=9A
>>>
>>> +static void riscv_clic_realize(DeviceState *dev, Error **errp)
>>>> +{
>>>> +    RISCVCLICState *clic =3D RISCV_CLIC(dev);
>>>> +    size_t harts_x_sources =3D clic->num_harts * clic->num_sources;
>>>> +    int irqs, i;
>>>> +
>>>> +    if (clic->prv_s && clic->prv_u) {
>>>> +        irqs =3D 3 * harts_x_sources;
>>>> +    } else if (clic->prv_s || clic->prv_u) {
>>>> +        irqs =3D 2 * harts_x_sources;
>>>> +    } else {
>>>> +        irqs =3D harts_x_sources;
>>>> +    }
>>>> +
>>>> +    clic->clic_size =3D irqs * 4 + 0x1000;
>>>> +    memory_region_init_io(&clic->mmio, OBJECT(dev), &riscv_clic_ops,
>>>> clic,
>>>> +                          TYPE_RISCV_CLIC, clic->clic_size);
>>>> +
>>>> +    clic->clicintip =3D g_new0(uint8_t, irqs);
>>>> +    clic->clicintie =3D g_new0(uint8_t, irqs);
>>>> +    clic->clicintattr =3D g_new0(uint8_t, irqs);
>>>> +    clic->clicintctl =3D g_new0(uint8_t, irqs);
>>>> +    clic->active_list =3D g_new0(CLICActiveInterrupt, irqs);
>>>> +    clic->active_count =3D g_new0(size_t, clic->num_harts);
>>>> +    clic->exccode =3D g_new0(uint32_t, clic->num_harts);
>>>> +    clic->cpu_irqs =3D g_new0(qemu_irq, clic->num_harts);
>>>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &clic->mmio);
>>>> +
>>>> +    /* Allocate irq through gpio, so that we can use qtest */
>>>> +    qdev_init_gpio_in(dev, riscv_clic_set_irq, irqs);
>>>> +    qdev_init_gpio_out(dev, clic->cpu_irqs, clic->num_harts);
>>>> +
>>>> +    for (i =3D 0; i < clic->num_harts; i++) {
>>>> +        RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(i));
>>>>
>>>
>>> As spec says:
>>>   Smaller single-core systems might have only a CLIC,
>>>   while multicore systems might have a CLIC per-core and a single share=
d
>>> PLIC.
>>>   The PLIC xeip signals are treated as hart-local interrupt sources by
>>> the CLIC at each core.
>>>
>>> It looks like it's possible to have one CLIC instance per core.
>>>
>>> If you want to delivery an interrupt to one hart, you should encode the
>>> IRQ by the interrupt number
>>> , the hart number and the interrupt target privilege, then set the irq.
>>>
>>> I think how to calculate the hart number is the task of PLIC and it can
>>> make use of "hartid-base"
>>> to calculate it.
>>>
>>> Thanks,
>>> Zhiwei
>>>
>>
>> Hi Zhiwei,
>>
>> What I mean is if there are multiple CLIC instances, each per core (CLIC
>> spec allows that).
>> If you try to bind CLIC with CPU index start from 0,
>> it will be impossible for CLIC instance to bind CPU from index other tha=
n
>> 0.
>>
>> For example, for 4 cores system, it's possible to have 4 CLIC instances:
>>   * CLIC 0 binds to CPU 0
>>   * CLIC 1 binds to CPU 1
>>   * CLIC 2 binds to CPU 2
>>   * CLIC 3 binds to CPU 3
>>
>> and that's why I said it's possible to pass an extra "hartid-base" just
>> like PLIC.
>> I know most of hardid are calculated by the requesing address, so most
>> hartid usages should be fine.
>> But I saw two places using qemu_get_cpu(),
>>
>> which may cause the problem for the scenario I describe above:
>> i.e. riscv_clic_next_interrupt() and riscv_clic_realize() as my original
>> reply.
>>
>> So what's the problem here?
>>
>> Currently all cores share the same CLIC instance. Do you want to give
>> each core  a CLIC instance?
>>
> Yes, that's what I mean, which should be supported as what spec says[1]:
>   The CLIC complements the PLIC. Smaller single-core systems might have
> only a CLIC,
>   while multicore systems might have *a CLIC per-core* and a single
> shared PLIC.
>   The PLIC xeip signals are treated as hart-local interrupt sources by th=
e
> CLIC at each core.
>
> [1]
> https://github.com/riscv/riscv-fast-interrupt/blob/646310a5e4ae055964b468=
0f12c1c04a7cc0dd56/clic.adoc#12-clic-versus-plic
>
> Thanks,
> Frank Chang
>
>
> If we give each core a CLIC instance, it is not convenient to access the
> shared memory, such as 0x0-0x1000.
> Which CLIC instance should contain this memory region?
>
What do you mean by: "access the shared memory" here?
I thought the memory region is defined during CLIC's creation?
So it should depend on the platform that creates CLIC instances.

Thanks,
Frank Chang


> Thanks,
> Zhiwei
>
>
>> Thanks,
>> Zhiwei
>>
> Regards,
>> Frank Chang
>>
>>
>>> However if you try to bind CPU reference start from index i =3D 0.
>>> It's not possible for each per-core CLIC to bind their own CPU instance
>>> in multicore system
>>> as they have to bind from CPU 0.
>>>
>>> I'm not sure if we add a new "hartid-base" property just like what
>>> SiFive PLIC is
>>> implemented would be a good idea or not.
>>>
>>>
>>> Regards,
>>> Frank Chang
>>>
>>>
>>>> +        qemu_irq irq =3D qemu_allocate_irq(riscv_clic_cpu_irq_handler=
,
>>>> +                                         &cpu->env, 1);
>>>> +        qdev_connect_gpio_out(dev, i, irq);
>>>> +        cpu->env.clic =3D clic;
>>>> +    }
>>>> +}
>>>> +
>>>>
>>>>
>>>>

--000000000000ecee2905c5ceb96b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B46=E6=9C=
=8828=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:40=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p><br>
    </p>
    <div>On 2021/6/28 =E4=B8=8B=E5=8D=883:23, Frank Chang wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.=
com" target=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;
          =E6=96=BC 2021=E5=B9=B46=E6=9C=8828=E6=97=A5 =E9=80=B1=E4=B8=80 =
=E4=B8=8B=E5=8D=883:17=E5=AF=AB=E9=81=93=EF=BC=9A<br>
        </div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p><br>
              </p>
              <div>On 2021/6/26 =E4=B8=8B=E5=8D=888:56, Frank Chang wrote:<=
br>
              </div>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div dir=3D"ltr">On Wed, Jun 16, 2021 at 10:56 AM LIU
                    Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targ=
et=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;
                    wrote:<br>
                  </div>
                  <div class=3D"gmail_quote">
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div>
                        <p><br>
                        </p>
                        <div>On 6/13/21 6:10 PM, Frank Chang wrote:<br>
                        </div>
                        <blockquote type=3D"cite">
                          <div dir=3D"ltr">
                            <div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mail=
to:zhiwei_liu@c-sky.com" target=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;
                              =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:57=E5=AF=AB=E9=81=93=EF=BC=9A<br>
                            </div>
                            <div class=3D"gmail_quote"><br>
                              <blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
                                +static void
                                riscv_clic_realize(DeviceState *dev,
                                Error **errp)<br>
                                +{<br>
                                +=C2=A0 =C2=A0 RISCVCLICState *clic =3D
                                RISCV_CLIC(dev);<br>
                                +=C2=A0 =C2=A0 size_t harts_x_sources =3D
                                clic-&gt;num_harts *
                                clic-&gt;num_sources;<br>
                                +=C2=A0 =C2=A0 int irqs, i;<br>
                                +<br>
                                +=C2=A0 =C2=A0 if (clic-&gt;prv_s &amp;&amp=
;
                                clic-&gt;prv_u) {<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs =3D 3 * h=
arts_x_sources;<br>
                                +=C2=A0 =C2=A0 } else if (clic-&gt;prv_s ||
                                clic-&gt;prv_u) {<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs =3D 2 * h=
arts_x_sources;<br>
                                +=C2=A0 =C2=A0 } else {<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs =3D harts=
_x_sources;<br>
                                +=C2=A0 =C2=A0 }<br>
                                +<br>
                                +=C2=A0 =C2=A0 clic-&gt;clic_size =3D irqs =
* 4 +
                                0x1000;<br>
                                +=C2=A0 =C2=A0
                                memory_region_init_io(&amp;clic-&gt;mmio,
                                OBJECT(dev), &amp;riscv_clic_ops, clic,<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                                TYPE_RISCV_CLIC, clic-&gt;clic_size);<br>
                                +<br>
                                +=C2=A0 =C2=A0 clic-&gt;clicintip =3D
                                g_new0(uint8_t, irqs);<br>
                                +=C2=A0 =C2=A0 clic-&gt;clicintie =3D
                                g_new0(uint8_t, irqs);<br>
                                +=C2=A0 =C2=A0 clic-&gt;clicintattr =3D
                                g_new0(uint8_t, irqs);<br>
                                +=C2=A0 =C2=A0 clic-&gt;clicintctl =3D
                                g_new0(uint8_t, irqs);<br>
                                +=C2=A0 =C2=A0 clic-&gt;active_list =3D
                                g_new0(CLICActiveInterrupt, irqs);<br>
                                +=C2=A0 =C2=A0 clic-&gt;active_count =3D
                                g_new0(size_t, clic-&gt;num_harts);<br>
                                +=C2=A0 =C2=A0 clic-&gt;exccode =3D g_new0(=
uint32_t,
                                clic-&gt;num_harts);<br>
                                +=C2=A0 =C2=A0 clic-&gt;cpu_irqs =3D
                                g_new0(qemu_irq, clic-&gt;num_harts);<br>
                                +=C2=A0 =C2=A0
                                sysbus_init_mmio(SYS_BUS_DEVICE(dev),
                                &amp;clic-&gt;mmio);<br>
                                +<br>
                                +=C2=A0 =C2=A0 /* Allocate irq through gpio=
, so
                                that we can use qtest */<br>
                                +=C2=A0 =C2=A0 qdev_init_gpio_in(dev,
                                riscv_clic_set_irq, irqs);<br>
                                +=C2=A0 =C2=A0 qdev_init_gpio_out(dev,
                                clic-&gt;cpu_irqs, clic-&gt;num_harts);<br>
                                +<br>
                                +=C2=A0 =C2=A0 for (i =3D 0; i &lt;
                                clic-&gt;num_harts; i++) {<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =
=3D
                                RISCV_CPU(qemu_get_cpu(i));<br>
                              </blockquote>
                              <div><br>
                              </div>
                              <div>As spec says:</div>
                              <div>=C2=A0 Smaller single-core systems might
                                have only a CLIC,</div>
                              <div>=C2=A0 while multicore systems might hav=
e
                                a CLIC per-core and a single shared
                                PLIC.</div>
                              <div>=C2=A0 The PLIC xeip signals are treated
                                as hart-local interrupt sources by the
                                CLIC at each core.<br>
                              </div>
                              <div><br>
                              </div>
                              <div>It looks like it&#39;s possible to have
                                one CLIC instance per core.</div>
                            </div>
                          </div>
                        </blockquote>
                        <p>If you want to delivery an interrupt to one
                          hart, you should encode the IRQ by the
                          interrupt number<br>
                          , the hart number and the interrupt target
                          privilege, then set the irq.</p>
                        <p>I think how to calculate the hart number is
                          the task of PLIC and it can make use of
                          &quot;hartid-base&quot;<br>
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
                    <div>What I mean is if there are multiple CLIC
                      instances, each per core (CLIC spec allows that).</di=
v>
                    <div>If you try to bind CLIC with CPU index start
                      from 0,</div>
                    <div>it will be impossible for CLIC instance=C2=A0to bi=
nd
                      CPU from index other than 0.</div>
                    <div><br>
                    </div>
                    <div>For example, for 4 cores system, it&#39;s possible
                      to have 4 CLIC instances:</div>
                    <div>=C2=A0 * CLIC 0 binds to CPU 0</div>
                    <div>=C2=A0 * CLIC 1 binds to CPU 1</div>
                    <div>=C2=A0 * CLIC 2 binds to CPU 2</div>
                    <div>=C2=A0 * CLIC 3 binds to CPU 3</div>
                    <div><br>
                    </div>
                    <div>and that&#39;s why I said it&#39;s possible to pas=
s an
                      extra &quot;hartid-base&quot; just like PLIC.</div>
                    <div>I know most of hardid are calculated by the
                      requesing address, so most hartid=C2=A0usages should =
be
                      fine.</div>
                    <div>But I saw two places using=C2=A0qemu_get_cpu(),<br=
>
                    </div>
                  </div>
                </div>
              </blockquote>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div class=3D"gmail_quote">
                    <div>which may cause the problem for the scenario I
                      describe above:</div>
                    <div>i.e. riscv_clic_next_interrupt() and
                      riscv_clic_realize() as my original reply.</div>
                  </div>
                </div>
              </blockquote>
              <p>So what&#39;s the problem here?</p>
              <p>Currently all cores share the same CLIC instance. Do
                you want to give each core=C2=A0 a CLIC instance?</p>
            </div>
          </blockquote>
          <div>
            <div>Yes, that&#39;s what I mean, which should be supported as
              what spec says[1]:</div>
            <div>=C2=A0=C2=A0The CLIC complements the PLIC. Smaller single-=
core
              systems might have only a CLIC,</div>
            <div>=C2=A0 while multicore systems might have <b>a CLIC
                per-core</b> and a single shared PLIC.</div>
            <div>=C2=A0 The PLIC xeip signals are treated as hart-local
              interrupt sources by the CLIC at each core.</div>
            <div><br>
            </div>
            <div>[1]=C2=A0<a href=3D"https://github.com/riscv/riscv-fast-in=
terrupt/blob/646310a5e4ae055964b4680f12c1c04a7cc0dd56/clic.adoc#12-clic-ver=
sus-plic" target=3D"_blank">https://github.com/riscv/riscv-fast-interrupt/b=
lob/646310a5e4ae055964b4680f12c1c04a7cc0dd56/clic.adoc#12-clic-versus-plic<=
/a></div>
            <div><br>
            </div>
            <div>Thanks,</div>
            <div>Frank Chang</div>
          </div>
          <div>=C2=A0</div>
        </div>
      </div>
    </blockquote>
    <p>If we give each core a CLIC instance, it is not convenient to
      access the shared memory, such as 0x0-0x1000.<br>
      Which CLIC instance should contain this memory region?</p></div></blo=
ckquote><div>What do you mean by: &quot;access the shared memory&quot; here=
?</div><div>I thought the memory region is defined during CLIC&#39;s creati=
on?</div><div>So it should depend on the platform that creates CLIC instanc=
es.</div><div><br></div><div>Thanks,</div><div>Frank Chang</div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    <p>Thanks,<br>
      Zhiwei<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p> <br>
              </p>
              <p>Thanks,<br>
                Zhiwei</p>
            </div>
          </blockquote>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div class=3D"gmail_quote">
                    <div>Regards,</div>
                    <div>Frank Chang</div>
                    <div>=C2=A0<br>
                    </div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div>
                        <p> </p>
                        <blockquote type=3D"cite">
                          <div dir=3D"ltr">
                            <div class=3D"gmail_quote">
                              <div>However if you try to bind CPU
                                reference start from index i =3D 0.</div>
                              <div>It&#39;s not possible for each per-core
                                CLIC to bind their own CPU instance in
                                multicore system</div>
                              <div>as they have to bind from CPU 0.</div>
                              <div><br>
                                I&#39;m not sure if we add a new
                                &quot;hartid-base&quot; property just like =
what
                                SiFive PLIC is</div>
                              <div>implemented would be a good idea or
                                not.</div>
                              <div><br>
                              </div>
                              <div><br>
                              </div>
                              <div>Regards,</div>
                              <div>Frank Chang</div>
                              <div>=C2=A0</div>
                              <blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"> +=C2=A0 =C2=A0
                                =C2=A0 =C2=A0 qemu_irq irq =3D
                                qemu_allocate_irq(riscv_clic_cpu_irq_handle=
r,<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0&amp;cpu-&gt;env, 1);<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_g=
pio_out(dev, i,
                                irq);<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;env.cl=
ic =3D clic;<br>
                                +=C2=A0 =C2=A0 }<br>
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
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div></div>

--000000000000ecee2905c5ceb96b--

