Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oi8Aj-00037p-Ei
	for mharc-qemu-riscv@gnu.org; Tue, 11 Oct 2022 01:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oi8AB-0002xs-38; Tue, 11 Oct 2022 01:50:58 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oi8A7-0002XV-TU; Tue, 11 Oct 2022 01:50:46 -0400
Received: by mail-pj1-x102a.google.com with SMTP id 70so11566997pjo.4;
 Mon, 10 Oct 2022 22:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GrMzEa9OlJlw3Zx/EKsC9JKzqEjp1oIc/wBShsbet6U=;
 b=KITQzxa7N7ZdOja6N6tOL+LkMmQqtMUlbvrglHeDTw0XHKV6HXov8T2jx6w7JA8AcK
 lb0TyE2qSEQC5X90R/PvST3uW5VWm/TRH3g7IdPl1reYCosvdUfo+W060sCflQobZVnH
 fpGJvUBU664pH9WssMi4RZWtByo099RUGLpEJj2fiIoRqzh1Sx/bXjuc9gHip6mjEyYz
 gydCDFYgsrQRvcwncyiYsZVrRivkpm2c2W+pKHoB4mp2Or5kwtMVdCgtu9y4njNn5g+e
 7FaIyutyyoXGXdXASEegRsIfrTbVJdJ/cz9OtfTFggrbcAnK0N/i6G/AXlZ6geghLA6/
 55FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GrMzEa9OlJlw3Zx/EKsC9JKzqEjp1oIc/wBShsbet6U=;
 b=pX91g4GxJnxAP6iFjBN0d26Hema+h3gjhyj/u56JIUS+8cPBosTZlsagvoq9f5vHiW
 31hqcfCjeDiDdu2FF3JwgKFjaWdZOFDJ7K5daPbMF25fn8Amyx25l52sC07lMBG8KDPk
 gmJyarGf50Tfh6i/W8O7IyUTyJjtqwAyf3tWoEfOngQWdb01xAyI+A46IcmTgryq5qdo
 Sei9+2EfdosXufubSZA40f003fb8zEHT959xJ3kPFvfNe/9/op8xxowcl8PPOw13DO3y
 cUpZiAGOwO0aIdxbIyLO/kPGjIYFF3AtL2OMRHFtQAfzXQjGfQK/DjePy0N3pAQLrqKx
 hbgQ==
X-Gm-Message-State: ACrzQf0D+cfUsrPPS9L2xmb6I2tLew61WipXHs7o9GaoCCsAj0z9YFK+
 tc5vArvX7xaFVpxSNAhTfJvDpJv/kUw3Uw68fjY=
X-Google-Smtp-Source: AMsMyM7BjYilYYRHDWpQj7wegX6Chjf5KHy31M+jM48xUCWYsYJqLTp2A5SenL28Xxvgfs584W8iGD1a+lY6l8YCFuQ=
X-Received: by 2002:a17:902:b092:b0:17b:833e:74f7 with SMTP id
 p18-20020a170902b09200b0017b833e74f7mr22638094plr.149.1665467439157; Mon, 10
 Oct 2022 22:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221003041440.2320-1-jim.shu@sifive.com>
 <20221003041440.2320-3-jim.shu@sifive.com>
 <CAJ307EjG0j8ydXk8_y5j0jsdmhqY3Fm1FqohMAY1J1hpfmvVMw@mail.gmail.com>
In-Reply-To: <CAJ307EjG0j8ydXk8_y5j0jsdmhqY3Fm1FqohMAY1J1hpfmvVMw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Oct 2022 15:50:12 +1000
Message-ID: <CAKmqyKOSubH3b7qUZxWd_64Cjz1QjYu2hriYEn_WY6154j56mw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hw/intc: sifive_plic: change interrupt priority
 register to WARL field
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: Jim Shu <jim.shu@sifive.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Tue, 11 Oct 2022 05:51:20 -0000

On Mon, Oct 3, 2022 at 5:07 PM Cl=C3=A9ment Chigot <chigot@adacore.com> wro=
te:
>
> On Mon, Oct 3, 2022 at 6:14 AM Jim Shu <jim.shu@sifive.com> wrote:
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

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> > ---
> >  hw/intc/sifive_plic.c | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> > index f864efa761..c2dfacf028 100644
> > --- a/hw/intc/sifive_plic.c
> > +++ b/hw/intc/sifive_plic.c
> > @@ -180,7 +180,15 @@ static void sifive_plic_write(void *opaque, hwaddr=
 addr, uint64_t value,
> >      if (addr_between(addr, plic->priority_base, plic->num_sources << 2=
)) {
> >          uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
> >
> > -        if (value <=3D plic->num_priorities) {
> > +        if (((plic->num_priorities + 1) & plic->num_priorities) =3D=3D=
 0) {
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
> > +            if (((plic->num_priorities + 1) & plic->num_priorities) =
=3D=3D 0) {
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
> Reviewed-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
>

