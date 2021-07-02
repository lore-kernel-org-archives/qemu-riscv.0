Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lzDQa-0000bP-4y
	for mharc-qemu-riscv@gnu.org; Fri, 02 Jul 2021 03:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lzDQV-0000aa-Ip; Fri, 02 Jul 2021 03:17:27 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:42608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lzDQQ-0000cr-Iv; Fri, 02 Jul 2021 03:17:27 -0400
Received: by mail-io1-xd2c.google.com with SMTP id v3so10505736ioq.9;
 Fri, 02 Jul 2021 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lPluDSX54pRSBY9RnEIqpfUvL6ApZLBD6Rg8r3hsa9o=;
 b=sgGSyRbVVvp9MLCVAVuLXykJGfvD/TTEHzwYA7XXM8GwScif4WJsA06AHk785Coq4a
 1kUffbfT2Hwn7ef5VbuAsXjNYVYF0er2GXXnllxKRdStmhLlYvxm4iU68+4XpoYQqIFf
 p1ZaIHuqyy10eZbFKXhYrQ0TpAN50nCMaHPUv5ZQBdwfkbbHZNddmYZYcWUnj9xa5o9Q
 VJHhhT1PJVMTOw/jkPwPmK0ZPSgWBeYWa8GsgE/dYco1PL9Kv/l1cZ/iMELDndHG+Vxj
 hyFxIqyyzjbPvpG0LYrNGeKX06I3yDy8ywHkO15fy+ohK/4Bje1lGhI1SA9wu3d1qB5z
 qKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lPluDSX54pRSBY9RnEIqpfUvL6ApZLBD6Rg8r3hsa9o=;
 b=Ig+kv52urwylAdbmSlFEzRSncotiHIH5iNDjmZVcP2DuU8rhXY97t2bGmtpgGH1uT7
 p3vDg2xmknmAEedin86l/r/Jr0T78y+6wfr39mwJ/sia+psPRtsa+H4QZkB3hiMUPN/4
 Kvhv2/T4zD88rosOWbwji5/0u/KyeFGwP9f/AvPArAxpiRlaePL/7R7Xs2kdNOzCfgIP
 AxMYIeGJN6vqlKwElR3ec+VJWK+GsY4dU3bq60+HA/q71IETRkL+AG1L4PG6E6S19hte
 y5NmKNFiou5yDgAAPU467VYRzR81Vi4D1VdbRslZPkcA/ab3IdA/FvUjHe9526afJkL4
 XUjg==
X-Gm-Message-State: AOAM5337H9g/ZdUYYuTDdEXb3dTtkAVaFuYAuosEZZSC6Adg3v8RchHL
 cUIsuEHFKuX+WIhCLy+QcnDcdEPw3IYsaQc8ZnM=
X-Google-Smtp-Source: ABdhPJyRzpyyN660Nm5mAT1h6tAbqqcErijlcMLSWjg0QtkTTswerrzY619pOUMhqvWczgXIgyh3BHmmsXOJzoAZszQ=
X-Received: by 2002:a5d:8453:: with SMTP id w19mr1572492ior.105.1625210240714; 
 Fri, 02 Jul 2021 00:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-2-zhiwei_liu@c-sky.com>
 <CAKmqyKMc4TiKgJKM8nUpGR+hWAyUAdjh8bG7chBAdsXq57-V5A@mail.gmail.com>
 <20304ba9-6f87-f7b9-a24d-15d4b3d3f75a@c-sky.com>
 <CANzO1D0zjHowQp46fWmnoPB=ChUuh5-=Q+ajWxpv2yFzONP9gg@mail.gmail.com>
 <CAKmqyKNwES2zU9QfusTy-bnL1ByBP0zi-8=tqLBtS_8p+24Ghg@mail.gmail.com>
 <3e7f6ec6-21a0-9a21-8126-68ea8c2fbf15@c-sky.com>
In-Reply-To: <3e7f6ec6-21a0-9a21-8126-68ea8c2fbf15@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jul 2021 17:16:54 +1000
Message-ID: <CAKmqyKOb9FP-UKkdBmr7dEKxWLv8x=J=3Rz=w8csRpWf8vh2xA@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] target/riscv: Add CLIC CSR mintstatus
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 02 Jul 2021 07:17:27 -0000

On Fri, Jul 2, 2021 at 4:11 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2021/7/2 =E4=B8=8B=E5=8D=881:38, Alistair Francis wrote:
> > On Thu, Jul 1, 2021 at 6:45 PM Frank Chang <frank.chang@sifive.com> wro=
te:
> >> LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=8820=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=888:49=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >>>
> >>> On 2021/4/20 =E4=B8=8A=E5=8D=887:23, Alistair Francis wrote:
> >>>> On Fri, Apr 9, 2021 at 5:52 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wro=
te:
> >>>>> CSR mintstatus holds the active interrupt level for each supported
> >>>>> privilege mode. sintstatus, and user, uintstatus, provide restricte=
d
> >>>>> views of mintstatus.
> >>>>>
> >>>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> >>>>> ---
> >>>>>    target/riscv/cpu.h      |  2 ++
> >>>>>    target/riscv/cpu_bits.h | 11 +++++++++++
> >>>>>    target/riscv/csr.c      | 26 ++++++++++++++++++++++++++
> >>>>>    3 files changed, 39 insertions(+)
> >>>>>
> >>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >>>>> index 0a33d387ba..1a44ca62c7 100644
> >>>>> --- a/target/riscv/cpu.h
> >>>>> +++ b/target/riscv/cpu.h
> >>>>> @@ -159,6 +159,7 @@ struct CPURISCVState {
> >>>>>        target_ulong mip;
> >>>>>
> >>>>>        uint32_t miclaim;
> >>>>> +    uint32_t mintstatus; /* clic-spec */
> >>>>>
> >>>>>        target_ulong mie;
> >>>>>        target_ulong mideleg;
> >>>>> @@ -243,6 +244,7 @@ struct CPURISCVState {
> >>>>>
> >>>>>        /* Fields from here on are preserved across CPU reset. */
> >>>>>        QEMUTimer *timer; /* Internal timer */
> >>>>> +    void *clic;       /* clic interrupt controller */
> >>>> This should be the CLIC type.
> >>> OK.
> >>>
> >>> Actually there are many versions of CLIC in my branch as different
> >>> devices. But it is better to use CLIC type for the upstream version.
> >>
> >> Hi Alistair and Zhiwei,
> >>
> >> Replacing void *clic with RISCVCLICState *clic may create a circular l=
oop
> >> because CPURISCVState is also referenced in riscv_clic.h.
> >>
> >> However, I would like to ask what is the best approach to add
> >> the reference of CLIC device in CPURISCVState struct?
> >>
> >> There may be different kinds of CLIC devices.
> >> AFAK, there was another RFC patchset trying to add void *eclic
> >> for Nuclei processor into CPURISCVState struct:
> >> https://patchwork.kernel.org/project/qemu-devel/patch/20210507081654.1=
1056-2-wangjunqiang@iscas.ac.cn/
> >>
> >> Is it okay to add the device reference directly into CPURISCVState str=
uct like that,
> >> or we should create some abstraction for these CLIC devices?
> >> (However, I'm not sure how big the differences are for these CLIC devi=
ces...)
> > I would prefer to not have the CLIC in the struct at all.
> >
> > Why is the CLIC required from the CPU?
>
> In my opinion,   the tight coupled interrupt controller, like NVIC in
> ARM,  is much different from other devices.
> CPU harts need to communicate with it through many ways.

Agreed.

The difference with RISC-V is that we already have multiple tightly
coupled interrupt controllers. We have the PLIC, CLIC, eCLIC and AIA,
not to mention possible vendor controllers. Do we really need a CPU
struct entry for every single one?

I would like to try and keep all of that logic outside of the CPU
state. It might not be possible (at least without being a mess) in
which case that's fine, but it's at least worth considering.

>
> We can store the CLIC instance in the struct CPURISCVState or a global
> variable.  Is that any other way?

We could split the device. So for example the CSRs and other parts
that relate to the CPU could be in the CPU while the register mappings
and GPIO lines could be it's own device.

Another option is to use GPIO lines to indicate the status, but for
anything too complex that will be messy.

>
> > I'm guessing we at least need it for CLIC CSR accesses. Could we
> > handle that in the CPU and avoid needing a reference to the CLIC?
> CSR access is one case. Other cases are:
>
> 1. When process an interrupt and decide ISP address,  we need to know
> current interrupt is vectored or not.
>
> 2.  When interrupt returned, we need to choose another interrupt to
> serve, so that it will not miss any interrupt.

Thanks!

Alistair

>
> Thanks,
> Zhiwei
> >
> > Alistair
> >
> >> Thanks,
> >> Frank Chang
> >>
> >>>
> >>>>>    };
> >>>>>
> >>>>>    OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> >>>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> >>>>> index caf4599207..c4ce6ec3d9 100644
> >>>>> --- a/target/riscv/cpu_bits.h
> >>>>> +++ b/target/riscv/cpu_bits.h
> >>>>> @@ -165,6 +165,7 @@
> >>>>>    #define CSR_MCAUSE          0x342
> >>>>>    #define CSR_MTVAL           0x343
> >>>>>    #define CSR_MIP             0x344
> >>>>> +#define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
> >>>>>
> >>>>>    /* Legacy Machine Trap Handling (priv v1.9.1) */
> >>>>>    #define CSR_MBADADDR        0x343
> >>>>> @@ -183,6 +184,7 @@
> >>>>>    #define CSR_SCAUSE          0x142
> >>>>>    #define CSR_STVAL           0x143
> >>>>>    #define CSR_SIP             0x144
> >>>>> +#define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
> >>>>>
> >>>>>    /* Legacy Supervisor Trap Handling (priv v1.9.1) */
> >>>>>    #define CSR_SBADADDR        0x143
> >>>>> @@ -585,6 +587,15 @@
> >>>>>    #define SIP_STIP                           MIP_STIP
> >>>>>    #define SIP_SEIP                           MIP_SEIP
> >>>>>
> >>>>> +/* mintstatus */
> >>>>> +#define MINTSTATUS_MIL                     0xff000000 /* mil[7:0] =
*/
> >>>>> +#define MINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] =
*/
> >>>>> +#define MINTSTATUS_UIL                     0x000000ff /* uil[7:0] =
*/
> >>>>> +
> >>>>> +/* sintstatus */
> >>>>> +#define SINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] =
*/
> >>>>> +#define SINTSTATUS_UIL                     0x000000ff /* uil[7:0] =
*/
> >>>> The bit fields in the comments are out of date.
> >>> I didn't notice it.   Fix it in next version.
> >>>
> >>> Thanks.
> >>>
> >>> Zhiwei
> >>>
> >>>> Alistair
> >>>>
> >>>>> +
> >>>>>    /* MIE masks */
> >>>>>    #define MIE_SEIE                           (1 << IRQ_S_EXT)
> >>>>>    #define MIE_UEIE                           (1 << IRQ_U_EXT)
> >>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >>>>> index d2585395bf..320b18ab60 100644
> >>>>> --- a/target/riscv/csr.c
> >>>>> +++ b/target/riscv/csr.c
> >>>>> @@ -188,6 +188,12 @@ static int pmp(CPURISCVState *env, int csrno)
> >>>>>    {
> >>>>>        return -!riscv_feature(env, RISCV_FEATURE_PMP);
> >>>>>    }
> >>>>> +
> >>>>> +static int clic(CPURISCVState *env, int csrno)
> >>>>> +{
> >>>>> +    return !!env->clic;
> >>>>> +}
> >>>>> +
> >>>>>    #endif
> >>>>>
> >>>>>    /* User Floating-Point CSRs */
> >>>>> @@ -734,6 +740,12 @@ static int rmw_mip(CPURISCVState *env, int csr=
no, target_ulong *ret_value,
> >>>>>        return 0;
> >>>>>    }
> >>>>>
> >>>>> +static int read_mintstatus(CPURISCVState *env, int csrno, target_u=
long *val)
> >>>>> +{
> >>>>> +    *val =3D env->mintstatus;
> >>>>> +    return 0;
> >>>>> +}
> >>>>> +
> >>>>>    /* Supervisor Trap Setup */
> >>>>>    static int read_sstatus(CPURISCVState *env, int csrno, target_ul=
ong *val)
> >>>>>    {
> >>>>> @@ -893,6 +905,13 @@ static int rmw_sip(CPURISCVState *env, int csr=
no, target_ulong *ret_value,
> >>>>>        return ret;
> >>>>>    }
> >>>>>
> >>>>> +static int read_sintstatus(CPURISCVState *env, int csrno, target_u=
long *val)
> >>>>> +{
> >>>>> +    target_ulong mask =3D SINTSTATUS_SIL | SINTSTATUS_UIL;
> >>>>> +    *val =3D env->mintstatus & mask;
> >>>>> +    return 0;
> >>>>> +}
> >>>>> +
> >>>>>    /* Supervisor Protection and Translation */
> >>>>>    static int read_satp(CPURISCVState *env, int csrno, target_ulong=
 *val)
> >>>>>    {
> >>>>> @@ -1644,5 +1663,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE]=
 =3D {
> >>>>>        [CSR_MHPMCOUNTER29H] =3D { "mhpmcounter29h", any32,  read_ze=
ro },
> >>>>>        [CSR_MHPMCOUNTER30H] =3D { "mhpmcounter30h", any32,  read_ze=
ro },
> >>>>>        [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", any32,  read_ze=
ro },
> >>>>> +
> >>>>> +    /* Machine Mode Core Level Interrupt Controller */
> >>>>> +    [CSR_MINTSTATUS] =3D { "mintstatus", clic,  read_mintstatus },
> >>>>> +
> >>>>> +    /* Supervisor Mode Core Level Interrupt Controller */
> >>>>> +    [CSR_SINTSTATUS] =3D { "sintstatus", clic,  read_sintstatus },
> >>>>> +
> >>>>>    #endif /* !CONFIG_USER_ONLY */
> >>>>>    };
> >>>>> --
> >>>>> 2.25.1
> >>>>>
> >>>>>

