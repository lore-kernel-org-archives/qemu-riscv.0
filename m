Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mV8CT-0007Yy-Di
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 04:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mV8CR-0007Uf-R8
 for qemu-riscv@nongnu.org; Tue, 28 Sep 2021 04:10:51 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:37743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mV8CN-0002VF-Sn
 for qemu-riscv@nongnu.org; Tue, 28 Sep 2021 04:10:51 -0400
Received: by mail-il1-x12f.google.com with SMTP id i13so22352946ilm.4
 for <qemu-riscv@nongnu.org>; Tue, 28 Sep 2021 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g7iJ9Z6gFRIzEmkHYZ5kKRhlf5k4/0pioTCSHUv71L4=;
 b=I+Pwm1LZjd8E5s2cCyMbokXJRTkNhSMrsIVah7lEUUSQRN2PK4wmhxvK4T7nxh3u6Z
 AMvv5Nlj1hUKW+YWHy/HCtc8uG1CsNpxrQHwMQD2+HjjwolYtcYM2xCOYac+2HNmD88l
 O0kvLucer9oEVcfQ3X/Es5ieZup0kq1tw8kNqOvO9VAMHKDfV4Nhpp5MCizxSvoi87+l
 ch888dxs/UH2ehKoLkRA9RkMjDhzvUTOD5g9/jo/OxqLVqxExU96p45YG/yZZzf2uJNY
 JZKQ82vImLGgvgXmA8WWpt98LMsNp6PlZJv89deXDeK38VIDYjVkizIzxUo03dEOA88b
 48DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g7iJ9Z6gFRIzEmkHYZ5kKRhlf5k4/0pioTCSHUv71L4=;
 b=fHSjuRZECvE5vOcfPumBoxmaucgfSPTO1/td001N1uL/8VB+I6ZvGhx2dYO83G5La/
 iukRcF+t4FseGozJWAyLk/mps21QtL9gbFYyaiIsDm3oxUe79lhlFjLDmyPfQVScRlFe
 8lWUj5uPQkwCHD3fCwhK93NRqKUwb9+qLz+JKC9kXkcahcQ01oW+o+dwsHHuWPvQTPOS
 bCPN1HpQepmr+SDcgjCMtwGsHrlLkHW1YtHl2mNodBtd5+EtDatv3p1BWgQ8P210PQxw
 P3pizyexXzEmaHnpwV+uIZM/7cHrMOGz4WXWGrMUSQIQ+AxVAXBd2uw9M82kcFx/lNT0
 KlqA==
X-Gm-Message-State: AOAM5330WzQ0ajkaz0YV9gEyG8vggqA1xHUCIAgp1uKP0KPgIVIA4/uh
 W5H3/GgnySTI7JUlNPaKQH+WthwWFNmQ99ASOOiAXw==
X-Google-Smtp-Source: ABdhPJyKVAPsJq8oSj5BrfsXKN2wFFrby+8gAn6PaIWQaR5xi3qT6bLopTdBZ4HgqUUATJadR4Q2a3UDAkGIrYZ2KLc=
X-Received: by 2002:a05:6e02:893:: with SMTP id
 z19mr3402331ils.224.1632816644541; 
 Tue, 28 Sep 2021 01:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-2-zhiwei_liu@c-sky.com>
 <CAKmqyKMc4TiKgJKM8nUpGR+hWAyUAdjh8bG7chBAdsXq57-V5A@mail.gmail.com>
 <20304ba9-6f87-f7b9-a24d-15d4b3d3f75a@c-sky.com>
 <CANzO1D0zjHowQp46fWmnoPB=ChUuh5-=Q+ajWxpv2yFzONP9gg@mail.gmail.com>
 <CAKmqyKNwES2zU9QfusTy-bnL1ByBP0zi-8=tqLBtS_8p+24Ghg@mail.gmail.com>
 <3e7f6ec6-21a0-9a21-8126-68ea8c2fbf15@c-sky.com>
 <CAKmqyKOb9FP-UKkdBmr7dEKxWLv8x=J=3Rz=w8csRpWf8vh2xA@mail.gmail.com>
In-Reply-To: <CAKmqyKOb9FP-UKkdBmr7dEKxWLv8x=J=3Rz=w8csRpWf8vh2xA@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 28 Sep 2021 16:10:33 +0800
Message-ID: <CAE_xrPjprth7927uK1QhCvUxv8sjsqwc_+FmvW92vbj+rpNrXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] target/riscv: Add CLIC CSR mintstatus
To: Alistair Francis <alistair23@gmail.com>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com, ShihPo Hung <shihpo.hung@sifive.com>
Content-Type: multipart/alternative; boundary="00000000000014e28c05cd09c054"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=frank.chang@sifive.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Tue, 28 Sep 2021 08:10:52 -0000

--00000000000014e28c05cd09c054
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 2, 2021 at 3:17 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Fri, Jul 2, 2021 at 4:11 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >
> >
> > On 2021/7/2 =E4=B8=8B=E5=8D=881:38, Alistair Francis wrote:
> > > On Thu, Jul 1, 2021 at 6:45 PM Frank Chang <frank.chang@sifive.com>
> wrote:
> > >> LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=882=
0=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=888:49=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > >>>
> > >>> On 2021/4/20 =E4=B8=8A=E5=8D=887:23, Alistair Francis wrote:
> > >>>> On Fri, Apr 9, 2021 at 5:52 PM LIU Zhiwei <zhiwei_liu@c-sky.com>
> wrote:
> > >>>>> CSR mintstatus holds the active interrupt level for each supporte=
d
> > >>>>> privilege mode. sintstatus, and user, uintstatus, provide
> restricted
> > >>>>> views of mintstatus.
> > >>>>>
> > >>>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> > >>>>> ---
> > >>>>>    target/riscv/cpu.h      |  2 ++
> > >>>>>    target/riscv/cpu_bits.h | 11 +++++++++++
> > >>>>>    target/riscv/csr.c      | 26 ++++++++++++++++++++++++++
> > >>>>>    3 files changed, 39 insertions(+)
> > >>>>>
> > >>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > >>>>> index 0a33d387ba..1a44ca62c7 100644
> > >>>>> --- a/target/riscv/cpu.h
> > >>>>> +++ b/target/riscv/cpu.h
> > >>>>> @@ -159,6 +159,7 @@ struct CPURISCVState {
> > >>>>>        target_ulong mip;
> > >>>>>
> > >>>>>        uint32_t miclaim;
> > >>>>> +    uint32_t mintstatus; /* clic-spec */
> > >>>>>
> > >>>>>        target_ulong mie;
> > >>>>>        target_ulong mideleg;
> > >>>>> @@ -243,6 +244,7 @@ struct CPURISCVState {
> > >>>>>
> > >>>>>        /* Fields from here on are preserved across CPU reset. */
> > >>>>>        QEMUTimer *timer; /* Internal timer */
> > >>>>> +    void *clic;       /* clic interrupt controller */
> > >>>> This should be the CLIC type.
> > >>> OK.
> > >>>
> > >>> Actually there are many versions of CLIC in my branch as different
> > >>> devices. But it is better to use CLIC type for the upstream version=
.
> > >>
> > >> Hi Alistair and Zhiwei,
> > >>
> > >> Replacing void *clic with RISCVCLICState *clic may create a circular
> loop
> > >> because CPURISCVState is also referenced in riscv_clic.h.
> > >>
> > >> However, I would like to ask what is the best approach to add
> > >> the reference of CLIC device in CPURISCVState struct?
> > >>
> > >> There may be different kinds of CLIC devices.
> > >> AFAK, there was another RFC patchset trying to add void *eclic
> > >> for Nuclei processor into CPURISCVState struct:
> > >>
> https://patchwork.kernel.org/project/qemu-devel/patch/20210507081654.1105=
6-2-wangjunqiang@iscas.ac.cn/
> > >>
> > >> Is it okay to add the device reference directly into CPURISCVState
> struct like that,
> > >> or we should create some abstraction for these CLIC devices?
> > >> (However, I'm not sure how big the differences are for these CLIC
> devices...)
> > > I would prefer to not have the CLIC in the struct at all.
> > >
> > > Why is the CLIC required from the CPU?
> >
> > In my opinion,   the tight coupled interrupt controller, like NVIC in
> > ARM,  is much different from other devices.
> > CPU harts need to communicate with it through many ways.
>
> Agreed.
>
> The difference with RISC-V is that we already have multiple tightly
> coupled interrupt controllers. We have the PLIC, CLIC, eCLIC and AIA,
> not to mention possible vendor controllers. Do we really need a CPU
> struct entry for every single one?
>
> I would like to try and keep all of that logic outside of the CPU
> state. It might not be possible (at least without being a mess) in
> which case that's fine, but it's at least worth considering.
>
> >
> > We can store the CLIC instance in the struct CPURISCVState or a global
> > variable.  Is that any other way?
>
> We could split the device. So for example the CSRs and other parts
> that relate to the CPU could be in the CPU while the register mappings
> and GPIO lines could be it's own device.
>
> Another option is to use GPIO lines to indicate the status, but for
> anything too complex that will be messy.
>

Hi Alistair,

I would like to know whether:
"Using GPIO lines to indicate the status of CPU"
is the right approach for future RISC-V CPU/peripherals development?

As RISC-V ecosystem is open to everyone and there are more and more
peripherals
being designed by different vendors.
I think there is a rising requirement to have an approach for CPU to notify
those core tightly-coupled peripherals after certain instruction/action has
been completed.
(for this case, CLIC would need to choose the next interrupt to be served
after returning from interrupt in mret/sret)

Is it possible to add something like:
*  qemu_irq gpio_out[NUM_OF_GPIOS];*
into *CPURISCVState* struct so that we can connect the GPIO lines
at machine/SoC-level, e.g. *sifive_u* or *sifive_e*?

When certain instruction or event is executed/completed by CPU.
It's possible for CPU to notify the peripheral through these GPIO lines,
and the rest of the tasks can be completed solely by the peripheral itself.
We don't have to add the hacky codes to the generic CPU routines.

This is just the rough scenario I have come up.
There might be some other issues I may not think of.
(For example, how do we determine which GPIO line should be driven by CPU
at a certain point?)

Any comments are welcome.

Regards,
Frank Chang


>
> >
> > > I'm guessing we at least need it for CLIC CSR accesses. Could we
> > > handle that in the CPU and avoid needing a reference to the CLIC?
> > CSR access is one case. Other cases are:
> >
> > 1. When process an interrupt and decide ISP address,  we need to know
> > current interrupt is vectored or not.
> >
> > 2.  When interrupt returned, we need to choose another interrupt to
> > serve, so that it will not miss any interrupt.
>
> Thanks!
>
> Alistair
>
> >
> > Thanks,
> > Zhiwei
> > >
> > > Alistair
> > >
> > >> Thanks,
> > >> Frank Chang
> > >>
> > >>>
> > >>>>>    };
> > >>>>>
> > >>>>>    OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> > >>>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > >>>>> index caf4599207..c4ce6ec3d9 100644
> > >>>>> --- a/target/riscv/cpu_bits.h
> > >>>>> +++ b/target/riscv/cpu_bits.h
> > >>>>> @@ -165,6 +165,7 @@
> > >>>>>    #define CSR_MCAUSE          0x342
> > >>>>>    #define CSR_MTVAL           0x343
> > >>>>>    #define CSR_MIP             0x344
> > >>>>> +#define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
> > >>>>>
> > >>>>>    /* Legacy Machine Trap Handling (priv v1.9.1) */
> > >>>>>    #define CSR_MBADADDR        0x343
> > >>>>> @@ -183,6 +184,7 @@
> > >>>>>    #define CSR_SCAUSE          0x142
> > >>>>>    #define CSR_STVAL           0x143
> > >>>>>    #define CSR_SIP             0x144
> > >>>>> +#define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
> > >>>>>
> > >>>>>    /* Legacy Supervisor Trap Handling (priv v1.9.1) */
> > >>>>>    #define CSR_SBADADDR        0x143
> > >>>>> @@ -585,6 +587,15 @@
> > >>>>>    #define SIP_STIP                           MIP_STIP
> > >>>>>    #define SIP_SEIP                           MIP_SEIP
> > >>>>>
> > >>>>> +/* mintstatus */
> > >>>>> +#define MINTSTATUS_MIL                     0xff000000 /* mil[7:0=
]
> */
> > >>>>> +#define MINTSTATUS_SIL                     0x0000ff00 /* sil[7:0=
]
> */
> > >>>>> +#define MINTSTATUS_UIL                     0x000000ff /* uil[7:0=
]
> */
> > >>>>> +
> > >>>>> +/* sintstatus */
> > >>>>> +#define SINTSTATUS_SIL                     0x0000ff00 /* sil[7:0=
]
> */
> > >>>>> +#define SINTSTATUS_UIL                     0x000000ff /* uil[7:0=
]
> */
> > >>>> The bit fields in the comments are out of date.
> > >>> I didn't notice it.   Fix it in next version.
> > >>>
> > >>> Thanks.
> > >>>
> > >>> Zhiwei
> > >>>
> > >>>> Alistair
> > >>>>
> > >>>>> +
> > >>>>>    /* MIE masks */
> > >>>>>    #define MIE_SEIE                           (1 << IRQ_S_EXT)
> > >>>>>    #define MIE_UEIE                           (1 << IRQ_U_EXT)
> > >>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > >>>>> index d2585395bf..320b18ab60 100644
> > >>>>> --- a/target/riscv/csr.c
> > >>>>> +++ b/target/riscv/csr.c
> > >>>>> @@ -188,6 +188,12 @@ static int pmp(CPURISCVState *env, int csrno=
)
> > >>>>>    {
> > >>>>>        return -!riscv_feature(env, RISCV_FEATURE_PMP);
> > >>>>>    }
> > >>>>> +
> > >>>>> +static int clic(CPURISCVState *env, int csrno)
> > >>>>> +{
> > >>>>> +    return !!env->clic;
> > >>>>> +}
> > >>>>> +
> > >>>>>    #endif
> > >>>>>
> > >>>>>    /* User Floating-Point CSRs */
> > >>>>> @@ -734,6 +740,12 @@ static int rmw_mip(CPURISCVState *env, int
> csrno, target_ulong *ret_value,
> > >>>>>        return 0;
> > >>>>>    }
> > >>>>>
> > >>>>> +static int read_mintstatus(CPURISCVState *env, int csrno,
> target_ulong *val)
> > >>>>> +{
> > >>>>> +    *val =3D env->mintstatus;
> > >>>>> +    return 0;
> > >>>>> +}
> > >>>>> +
> > >>>>>    /* Supervisor Trap Setup */
> > >>>>>    static int read_sstatus(CPURISCVState *env, int csrno,
> target_ulong *val)
> > >>>>>    {
> > >>>>> @@ -893,6 +905,13 @@ static int rmw_sip(CPURISCVState *env, int
> csrno, target_ulong *ret_value,
> > >>>>>        return ret;
> > >>>>>    }
> > >>>>>
> > >>>>> +static int read_sintstatus(CPURISCVState *env, int csrno,
> target_ulong *val)
> > >>>>> +{
> > >>>>> +    target_ulong mask =3D SINTSTATUS_SIL | SINTSTATUS_UIL;
> > >>>>> +    *val =3D env->mintstatus & mask;
> > >>>>> +    return 0;
> > >>>>> +}
> > >>>>> +
> > >>>>>    /* Supervisor Protection and Translation */
> > >>>>>    static int read_satp(CPURISCVState *env, int csrno,
> target_ulong *val)
> > >>>>>    {
> > >>>>> @@ -1644,5 +1663,12 @@ riscv_csr_operations
> csr_ops[CSR_TABLE_SIZE] =3D {
> > >>>>>        [CSR_MHPMCOUNTER29H] =3D { "mhpmcounter29h", any32,
> read_zero },
> > >>>>>        [CSR_MHPMCOUNTER30H] =3D { "mhpmcounter30h", any32,
> read_zero },
> > >>>>>        [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", any32,
> read_zero },
> > >>>>> +
> > >>>>> +    /* Machine Mode Core Level Interrupt Controller */
> > >>>>> +    [CSR_MINTSTATUS] =3D { "mintstatus", clic,  read_mintstatus =
},
> > >>>>> +
> > >>>>> +    /* Supervisor Mode Core Level Interrupt Controller */
> > >>>>> +    [CSR_SINTSTATUS] =3D { "sintstatus", clic,  read_sintstatus =
},
> > >>>>> +
> > >>>>>    #endif /* !CONFIG_USER_ONLY */
> > >>>>>    };
> > >>>>> --
> > >>>>> 2.25.1
> > >>>>>
> > >>>>>
>

--00000000000014e28c05cd09c054
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Jul 2, 2021 at 3:17 PM Alistair F=
rancis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Fri, Jul 2, 2021 at 4:11 PM LIU Zhiwei &lt;<a hre=
f=3D"mailto:zhiwei_liu@c-sky.com" target=3D"_blank">zhiwei_liu@c-sky.com</a=
>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 2021/7/2 =E4=B8=8B=E5=8D=881:38, Alistair Francis wrote:<br>
&gt; &gt; On Thu, Jul 1, 2021 at 6:45 PM Frank Chang &lt;<a href=3D"mailto:=
frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wr=
ote:<br>
&gt; &gt;&gt; LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" target=
=3D"_blank">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=882=
0=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=888:49=E5=AF=AB=E9=81=93=EF=
=BC=9A<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On 2021/4/20 =E4=B8=8A=E5=8D=887:23, Alistair Francis wro=
te:<br>
&gt; &gt;&gt;&gt;&gt; On Fri, Apr 9, 2021 at 5:52 PM LIU Zhiwei &lt;<a href=
=3D"mailto:zhiwei_liu@c-sky.com" target=3D"_blank">zhiwei_liu@c-sky.com</a>=
&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; CSR mintstatus holds the active interrupt level f=
or each supported<br>
&gt; &gt;&gt;&gt;&gt;&gt; privilege mode. sintstatus, and user, uintstatus,=
 provide restricted<br>
&gt; &gt;&gt;&gt;&gt;&gt; views of mintstatus.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:z=
hiwei_liu@c-sky.com" target=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 ++<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 target/riscv/cpu_bits.h | 11 +++++++=
++++<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=
=A0 | 26 ++++++++++++++++++++++++++<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 3 files changed, 39 insertions(+)<br=
>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cp=
u.h<br>
&gt; &gt;&gt;&gt;&gt;&gt; index 0a33d387ba..1a44ca62c7 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt; --- a/target/riscv/cpu.h<br>
&gt; &gt;&gt;&gt;&gt;&gt; +++ b/target/riscv/cpu.h<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -159,6 +159,7 @@ struct CPURISCVState {<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong mip;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t miclaim;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 uint32_t mintstatus; /* clic-spec =
*/<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong mie;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong mideleg;<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -243,6 +244,7 @@ struct CPURISCVState {<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Fields from here on=
 are preserved across CPU reset. */<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMUTimer *timer; /* I=
nternal timer */<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 void *clic;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* clic interrupt controller */<br>
&gt; &gt;&gt;&gt;&gt; This should be the CLIC type.<br>
&gt; &gt;&gt;&gt; OK.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Actually there are many versions of CLIC in my branch as =
different<br>
&gt; &gt;&gt;&gt; devices. But it is better to use CLIC type for the upstre=
am version.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Hi Alistair and Zhiwei,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Replacing void *clic with RISCVCLICState *clic may create a c=
ircular loop<br>
&gt; &gt;&gt; because CPURISCVState is also referenced in riscv_clic.h.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; However, I would like to ask what is the best approach to add=
<br>
&gt; &gt;&gt; the reference of CLIC device in CPURISCVState struct?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; There may be different kinds of CLIC devices.<br>
&gt; &gt;&gt; AFAK, there was another RFC patchset trying to add void *ecli=
c<br>
&gt; &gt;&gt; for Nuclei processor into CPURISCVState struct:<br>
&gt; &gt;&gt; <a href=3D"https://patchwork.kernel.org/project/qemu-devel/pa=
tch/20210507081654.11056-2-wangjunqiang@iscas.ac.cn/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://patchwork.kernel.org/project/qemu-devel/patch/20210=
507081654.11056-2-wangjunqiang@iscas.ac.cn/</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Is it okay to add the device reference directly into CPURISCV=
State struct like that,<br>
&gt; &gt;&gt; or we should create some abstraction for these CLIC devices?<=
br>
&gt; &gt;&gt; (However, I&#39;m not sure how big the differences are for th=
ese CLIC devices...)<br>
&gt; &gt; I would prefer to not have the CLIC in the struct at all.<br>
&gt; &gt;<br>
&gt; &gt; Why is the CLIC required from the CPU?<br>
&gt;<br>
&gt; In my opinion,=C2=A0 =C2=A0the tight coupled interrupt controller, lik=
e NVIC in<br>
&gt; ARM,=C2=A0 is much different from other devices.<br>
&gt; CPU harts need to communicate with it through many ways.<br>
<br>
Agreed.<br>
<br>
The difference with RISC-V is that we already have multiple tightly<br>
coupled interrupt controllers. We have the PLIC, CLIC, eCLIC and AIA,<br>
not to mention possible vendor controllers. Do we really need a CPU<br>
struct entry for every single one?<br>
<br>
I would like to try and keep all of that logic outside of the CPU<br>
state. It might not be possible (at least without being a mess) in<br>
which case that&#39;s fine, but it&#39;s at least worth considering.<br>
<br>
&gt;<br>
&gt; We can store the CLIC instance in the struct CPURISCVState or a global=
<br>
&gt; variable.=C2=A0 Is that any other way?<br>
<br>
We could split the device. So for example the CSRs and other parts<br>
that relate to the CPU could be in the CPU while the register mappings<br>
and GPIO lines could be it&#39;s own device.<br>
<br>
Another option is to use GPIO lines to indicate the status, but for<br>
anything too complex that will be messy.<br></blockquote><div><br></div><di=
v>Hi Alistair,</div><div><br></div><div>I would like to know whether:</div>=
<div>&quot;Using GPIO lines to indicate the status of CPU&quot;</div><div>i=
s the right approach for future RISC-V CPU/peripherals development?</div><d=
iv><br></div><div>As RISC-V ecosystem is open to everyone and there are mor=
e and more peripherals</div><div>being designed by different vendors.</div>=
<div>I think there is a rising requirement to have an approach for CPU to n=
otify</div><div>those core tightly-coupled peripherals after certain instru=
ction/action has been completed.</div><div>(for this case, CLIC would need =
to choose the next interrupt to be served after returning from interrupt in=
 mret/sret)</div><div><br></div><div>Is it possible to add something like:<=
/div><div><i>=C2=A0 qemu_irq gpio_out[NUM_OF_GPIOS];</i></div><div>into <i>=
CPURISCVState</i> struct so that we can connect the GPIO lines</div><div>at=
 machine/SoC-level, e.g. <i>sifive_u</i> or <i>sifive_e</i>?</div><div><br>=
</div><div>When certain instruction or event is executed/completed by CPU.<=
br></div><div>It&#39;s possible for CPU to notify the peripheral through th=
ese GPIO lines,</div><div>and the rest of the tasks can be completed solely=
 by the peripheral itself.</div><div>We don&#39;t have to add the hacky cod=
es to the generic CPU routines.</div><div><br></div><div>This is just the r=
ough scenario I have come up.</div><div>There might be some other issues I =
may not think of.</div><div>(For example, how do we determine which GPIO li=
ne should be driven by CPU at a certain point?)</div><div><br></div><div>An=
y comments are welcome.<br></div><div><br></div><div>Regards,<br></div><div=
>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt;<br>
&gt; &gt; I&#39;m guessing we at least need it for CLIC CSR accesses. Could=
 we<br>
&gt; &gt; handle that in the CPU and avoid needing a reference to the CLIC?=
<br>
&gt; CSR access is one case. Other cases are:<br>
&gt;<br>
&gt; 1. When process an interrupt and decide ISP address,=C2=A0 we need to =
know<br>
&gt; current interrupt is vectored or not.<br>
&gt;<br>
&gt; 2.=C2=A0 When interrupt returned, we need to choose another interrupt =
to<br>
&gt; serve, so that it will not miss any interrupt.<br>
<br>
Thanks!<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Zhiwei<br>
&gt; &gt;<br>
&gt; &gt; Alistair<br>
&gt; &gt;<br>
&gt; &gt;&gt; Thanks,<br>
&gt; &gt;&gt; Frank Chang<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 };<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVC=
PUClass,<br>
&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/target/riscv/cpu_bits.h b/target/ris=
cv/cpu_bits.h<br>
&gt; &gt;&gt;&gt;&gt;&gt; index caf4599207..c4ce6ec3d9 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt; --- a/target/riscv/cpu_bits.h<br>
&gt; &gt;&gt;&gt;&gt;&gt; +++ b/target/riscv/cpu_bits.h<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -165,6 +165,7 @@<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #define CSR_MCAUSE=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x342<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #define CSR_MTVAL=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x343<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #define CSR_MIP=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x344<br>
&gt; &gt;&gt;&gt;&gt;&gt; +#define CSR_MINTSTATUS=C2=A0 =C2=A0 =C2=A0 0x346=
 /* clic-spec-draft */<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 /* Legacy Machine Trap Handling (pri=
v v1.9.1) */<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #define CSR_MBADADDR=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x343<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -183,6 +184,7 @@<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #define CSR_SCAUSE=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x142<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #define CSR_STVAL=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x143<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #define CSR_SIP=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x144<br>
&gt; &gt;&gt;&gt;&gt;&gt; +#define CSR_SINTSTATUS=C2=A0 =C2=A0 =C2=A0 0x146=
 /* clic-spec-draft */<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 /* Legacy Supervisor Trap Handling (=
priv v1.9.1) */<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #define CSR_SBADADDR=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x143<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -585,6 +587,15 @@<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #define SIP_STIP=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MIP_STIP<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #define SIP_SEIP=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MIP_SEIP<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +/* mintstatus */<br>
&gt; &gt;&gt;&gt;&gt;&gt; +#define MINTSTATUS_MIL=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xff000000 /* mil[7:0] =
*/<br>
&gt; &gt;&gt;&gt;&gt;&gt; +#define MINTSTATUS_SIL=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000ff00 /* sil[7:0] =
*/<br>
&gt; &gt;&gt;&gt;&gt;&gt; +#define MINTSTATUS_UIL=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000000ff /* uil[7:0] =
*/<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +/* sintstatus */<br>
&gt; &gt;&gt;&gt;&gt;&gt; +#define SINTSTATUS_SIL=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000ff00 /* sil[7:0] =
*/<br>
&gt; &gt;&gt;&gt;&gt;&gt; +#define SINTSTATUS_UIL=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000000ff /* uil[7:0] =
*/<br>
&gt; &gt;&gt;&gt;&gt; The bit fields in the comments are out of date.<br>
&gt; &gt;&gt;&gt; I didn&#39;t notice it.=C2=A0 =C2=A0Fix it in next versio=
n.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Thanks.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Zhiwei<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Alistair<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 /* MIE masks */<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #define MIE_SEIE=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(1 &lt;&lt; IRQ_S_EXT)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #define MIE_UEIE=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(1 &lt;&lt; IRQ_U_EXT)<br>
&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/target/riscv/csr.c b/target/riscv/cs=
r.c<br>
&gt; &gt;&gt;&gt;&gt;&gt; index d2585395bf..320b18ab60 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt; --- a/target/riscv/csr.c<br>
&gt; &gt;&gt;&gt;&gt;&gt; +++ b/target/riscv/csr.c<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -188,6 +188,12 @@ static int pmp(CPURISCVState=
 *env, int csrno)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 {<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -!riscv_feature=
(env, RISCV_FEATURE_PMP);<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +static int clic(CPURISCVState *env, int csrno)<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +{<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 return !!env-&gt;clic;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +}<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #endif<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 /* User Floating-Point CSRs */<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -734,6 +740,12 @@ static int rmw_mip(CPURISCVS=
tate *env, int csrno, target_ulong *ret_value,<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +static int read_mintstatus(CPURISCVState *env, i=
nt csrno, target_ulong *val)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +{<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;mintstatus;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +}<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 /* Supervisor Trap Setup */<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 static int read_sstatus(CPURISCVStat=
e *env, int csrno, target_ulong *val)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 {<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -893,6 +905,13 @@ static int rmw_sip(CPURISCVS=
tate *env, int csrno, target_ulong *ret_value,<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +static int read_sintstatus(CPURISCVState *env, i=
nt csrno, target_ulong *val)<br>
&gt; &gt;&gt;&gt;&gt;&gt; +{<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 target_ulong mask =3D SINTSTATUS_S=
IL | SINTSTATUS_UIL;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;mintstatus &amp; =
mask;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +}<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 /* Supervisor Protection and Transla=
tion */<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 static int read_satp(CPURISCVState *=
env, int csrno, target_ulong *val)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 {<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -1644,5 +1663,12 @@ riscv_csr_operations csr_o=
ps[CSR_TABLE_SIZE] =3D {<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 [CSR_MHPMCOUNTER29H] =
=3D { &quot;mhpmcounter29h&quot;, any32,=C2=A0 read_zero },<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 [CSR_MHPMCOUNTER30H] =
=3D { &quot;mhpmcounter30h&quot;, any32,=C2=A0 read_zero },<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 [CSR_MHPMCOUNTER31H] =
=3D { &quot;mhpmcounter31h&quot;, any32,=C2=A0 read_zero },<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 /* Machine Mode Core Level Interru=
pt Controller */<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 [CSR_MINTSTATUS] =3D { &quot;mints=
tatus&quot;, clic,=C2=A0 read_mintstatus },<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 /* Supervisor Mode Core Level Inte=
rrupt Controller */<br>
&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 [CSR_SINTSTATUS] =3D { &quot;sints=
tatus&quot;, clic,=C2=A0 read_sintstatus },<br>
&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #endif /* !CONFIG_USER_ONLY */<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 };<br>
&gt; &gt;&gt;&gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt;&gt;&gt; 2.25.1<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
</blockquote></div></div>

--00000000000014e28c05cd09c054--

