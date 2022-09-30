Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oeFlt-0003vr-Hc
	for mharc-qemu-riscv@gnu.org; Fri, 30 Sep 2022 09:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oeFlj-0003qm-V4
 for qemu-riscv@nongnu.org; Fri, 30 Sep 2022 09:09:34 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:43707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oeFlg-00023k-QN
 for qemu-riscv@nongnu.org; Fri, 30 Sep 2022 09:09:31 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-131886d366cso5350765fac.10
 for <qemu-riscv@nongnu.org>; Fri, 30 Sep 2022 06:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=zgXwLiMeTBAtMDDDK72360hBDz52tjw6sLjNB7sOKuE=;
 b=NaDWdOU8zMEABosvP9uTuDBhb6rp/pkbFNGbFy5tGGlXcvvDwsjvnSYHF3SX95/Q+J
 1SKam5LOBN74cNyCQnNdQ5gjIPsd2Tcy8DIXa6wWnCpcYR7EKnfBiw8h0LkZHXV1TlKC
 zGHLqDfKDULRr9bIaDr2vMWs0dszetHOzwxXsusfLvvJCx+fzTECKCW3c4UCE8V/TKay
 iTnG4sXIVc1GScYUPj3ZhjI96XtoksLezNmX28fhScv+Rz22aG0cPIzahN3p0jAW53eW
 725GqNe2jp+em9W41zKTa9LH1xV+Nugt2EfdilcV6B1U+B+98rj0kavQ7bb/COQfMryi
 8Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zgXwLiMeTBAtMDDDK72360hBDz52tjw6sLjNB7sOKuE=;
 b=MxE2MBCaL/KkDM7PUL2zEmhIPl0AKSCP8YchSWkyeScd+X7S+Z9MiWQEmnD7hcMr3W
 uaKrBM8fQPWLe38OJUQ0ULyEo3+cnDPql8DcaPZuAo8OaQFGNQyW8p7DJRsvRtMXvOj/
 vthhWVMtCDn9dmTbOXxsJ+l8evrxz1K5WGpsVmShredolj+a8azGcBn34vT6lU664ZXb
 NELyNd08iFsayAl8p6OTgWmgkQ1xGmvtFm7arIKD/XCZF6ROVEAv0NupLR0UTxJv48or
 5weMShEebDZAnEl+xwX/cYJ1Hi5ye8rljjyCnQiLXnyTGIxfwO4ENpvLahrL/BWSU7R1
 gEZg==
X-Gm-Message-State: ACrzQf2ix40VUyPQ+zB4QmEYN3qPXRQg6ijfLEZcGK5kfFmUvKv8M/NP
 +n/wxUz6MQMcZJYwNLlR8y+zMHXXh8Ptn7kmg47vgQ==
X-Google-Smtp-Source: AMsMyM7btOcGj3mEhpHwjUJdwPGxvJZlylZgdAwYNi+guYabBW+reW9Phlb8yCnrl2rDlAuuCeuMBllz7azWxCTY/yI=
X-Received: by 2002:a05:6870:a2c7:b0:131:d098:9e37 with SMTP id
 w7-20020a056870a2c700b00131d0989e37mr4209511oak.152.1664543367011; Fri, 30
 Sep 2022 06:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220930123239.15515-1-jim.shu@sifive.com>
 <20220930123239.15515-3-jim.shu@sifive.com>
 <CAJ307Ehp8Juy74EpmxyOTq6sVuPF+d-uLYD3T93ba4ZtRLxdBA@mail.gmail.com>
In-Reply-To: <CAJ307Ehp8Juy74EpmxyOTq6sVuPF+d-uLYD3T93ba4ZtRLxdBA@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Fri, 30 Sep 2022 21:09:15 +0800
Message-ID: <CALw707rDW8GwB8fQHyARgY87ZRjPxOV387kZLKWOzqKVZj4=8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/intc: sifive_plic: change interrupt priority
 register to WARL field
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=jim.shu@sifive.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 30 Sep 2022 13:09:34 -0000

hi Cl=C3=A9ment,

Thank you very much.
I'll fix it in the next version patch.

Thanks,
Jim Shu



On Fri, Sep 30, 2022 at 8:58 PM Cl=C3=A9ment Chigot <chigot@adacore.com> wr=
ote:
>
> Hi Jim,
>
> On Fri, Sep 30, 2022 at 2:32 PM Jim Shu <jim.shu@sifive.com> wrote:
> >
> > PLIC spec [1] requires interrupt source priority registers are WARL
> > field and the number of supported priority is power-of-2 to simplify SW
> > discovery.
> >
> > Existing QEMU RISC-V machine (e.g. shakti_c) don't strictly follow PLIC
> > spec, whose number of supported priority is not power-of-2. Just change
> > each bit of interrupt priority register to WARL field when the number o=
f
> > supported priority is power-of-2.
> >
> > [1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.ado=
c#interrupt-priorities
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >  hw/intc/sifive_plic.c | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> > index f864efa761..218ccff8bd 100644
> > --- a/hw/intc/sifive_plic.c
> > +++ b/hw/intc/sifive_plic.c
> > @@ -180,7 +180,15 @@ static void sifive_plic_write(void *opaque, hwaddr=
 addr, uint64_t value,
> >      if (addr_between(addr, plic->priority_base, plic->num_sources << 2=
)) {
> >          uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
> >
> > -        if (value <=3D plic->num_priorities) {
> > +        if ((plic->num_priorities + 1) & (plic->num_priorities)) {
>
> That's the opposite. If n is a power of 2, n & (n-1) =3D=3D 0 (eg 8 & 7 =
=3D=3D
>  0, 9 & 8 =3D=3D 8).
> Note that n must be positive too. But I'm not sure it matters here.
> I'll let you decide.
>
> > +            /*
> > +             * if "num_priorities + 1" is power-of-2, make each regist=
er bit of
> > +             * interrupt priority WARL (Write-Any-Read-Legal). Just fi=
lter
> > +             * out the access to unsupported priority bits.
> > +             */
> > +            plic->source_priority[irq] =3D value % (plic->num_prioriti=
es + 1);
> > +            sifive_plic_update(plic);
> > +        } else if (value <=3D plic->num_priorities) {
> >              plic->source_priority[irq] =3D value;
> >              sifive_plic_update(plic);
> >          }
> > @@ -207,7 +215,16 @@ static void sifive_plic_write(void *opaque, hwaddr=
 addr, uint64_t value,
> >          uint32_t contextid =3D (addr & (plic->context_stride - 1));
> >
> >          if (contextid =3D=3D 0) {
> > -            if (value <=3D plic->num_priorities) {
> > +            if ((plic->num_priorities + 1) & (plic->num_priorities)) {
>
> Same.
>
> > +                /*
> > +                 * if "num_priorities + 1" is power-of-2, each registe=
r bit of
> > +                 * interrupt priority is WARL (Write-Any-Read-Legal). =
Just
> > +                 * filter out the access to unsupported priority bits.
> > +                 */
> > +                plic->target_priority[addrid] =3D value %
> > +                                                (plic->num_priorities =
+ 1);
> > +                sifive_plic_update(plic);
> > +            } else if (value <=3D plic->num_priorities) {
> >                  plic->target_priority[addrid] =3D value;
> >                  sifive_plic_update(plic);
> >              }
> > --
> > 2.17.1
>
> Cl=C3=A9ment

