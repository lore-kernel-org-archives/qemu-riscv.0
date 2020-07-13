Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jv4Nn-0005UY-91
	for mharc-qemu-riscv@gnu.org; Mon, 13 Jul 2020 15:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jv4Nl-0005U3-Mv; Mon, 13 Jul 2020 15:44:57 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:33577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jv4Nk-000210-8I; Mon, 13 Jul 2020 15:44:57 -0400
Received: by mail-io1-xd42.google.com with SMTP id d18so14840778ion.0;
 Mon, 13 Jul 2020 12:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3erh4qMgLZTK5xvcKDeAtxWG6rsClVq2Bn2xLBtZTq4=;
 b=AddhXMGfhKBQgo4V3pC2KFjt4VxiCuvzXq7XE6p0cQhrg3IMKZ8GeXbcP2h8IYtQDt
 Jrvq9DoQ2K2+/knlW0FTQF/sqNaM0qt4Thfpjuqphnhcj/83hDSqap6z4Mj5Sp9pmgag
 AiP/aDMnHbgS8qsfVI/agXNOrFa/6cb6akzlXC+rioCYJflIwjbWE/WK7ZChWCYebpgI
 jcls5Pfmo0sFSeucW/PhmyaXOy4Av/H3eFI51Zb8Js4eiCv13z8cn+Ckt4WHULmeAPWC
 T92dzWwg40KBgE0qru9CU7BmKEVaGe3j6odv58glKO2KcsJu4CUZz9iqDKg3fGllRYvf
 1Z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3erh4qMgLZTK5xvcKDeAtxWG6rsClVq2Bn2xLBtZTq4=;
 b=qPtnOtVyqvVDCzjRadeJWBjI/JK4zIClvNGUycVDhrotMdaCNjyUtmBIDL0Tq1CZiM
 VxQ0sbNXq+8NeY1lakK11BWONP9PqtLcdOSWrx905bXYi1WDthbLSdNpuBby2wL+JSTf
 olufrDu+O4H1gg3jxuWOnncO9KeiZOyerqJqZ0/OfWTguUFGZftBGzqmnS/6o4mW5hY2
 y31vscahGVm3k/19UPdKzw5WOQPgEitJHoiFlltTHFLH8sKHg5tNSe4HBKYkAEU2pnlz
 IPkaG69bF/vyvmigPRMZCLvCDjhV3AI+/KjEEGooYewGrzvTKx4YOlM3fmNS0aUOzl80
 xyZQ==
X-Gm-Message-State: AOAM530jbsbwmC7UNtXQKIntTIGmGDslLQY63A7llUkqhYkYFKyBYhdR
 TzBFMGG7R+5/ewm7sWTS0au4xg5MeJplWK9P9ZI=
X-Google-Smtp-Source: ABdhPJwc8weT/A55twXeNnLTPokqLCp90/VWIZplm6FbEjfhKkfd3qc6SAp5UzQ5YC/31kHO54/TLHd3ZEfIEVAYGZE=
X-Received: by 2002:a5d:9306:: with SMTP id l6mr1386321ion.105.1594669494780; 
 Mon, 13 Jul 2020 12:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200706084550.24117-1-amergnat@baylibre.com>
 <CAKmqyKMhsF+X4L2Eahn3f-f-_F6ZUeTTimKWGibYo2VxVbFSiw@mail.gmail.com>
 <CAFGrd9qQ=VVdv15tGoTK_MF+3gwp1AKtuMBQCP_XMNOHJdQsnw@mail.gmail.com>
In-Reply-To: <CAFGrd9qQ=VVdv15tGoTK_MF+3gwp1AKtuMBQCP_XMNOHJdQsnw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Jul 2020 12:34:56 -0700
Message-ID: <CAKmqyKPHZhCx9iTPAu-Zg5hyKqYCuUYG7t3p8rtTkOKHY4uEDA@mail.gmail.com>
Subject: Re: [PATCH v1] target/riscv: fix pmp implementation
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 baylibre-upstreaming@groups.io, 
 Nicolas Royer <nroyer@baylibre.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 13 Jul 2020 19:44:57 -0000

On Mon, Jul 13, 2020 at 3:10 AM Alexandre Mergnat <amergnat@baylibre.com> w=
rote:
>
> Le ven. 10 juil. 2020 =C3=A0 22:35, Alistair Francis <alistair23@gmail.co=
m> a =C3=A9crit :
> >
> > On Mon, Jul 6, 2020 at 2:45 AM Alexandre Mergnat <amergnat@baylibre.com=
> wrote:
> > >
> > > The end address calculation for NA4 mode is wrong because the address
> > > used isn't shifted.
> > >
> > > That imply all NA4 setup are not applied by the PMP.
> >
> > I'm not sure what you mean here, can you clarify this?
>
> I'm just saying NA4 configuration doesn't work properly on QEMU (It
> doesn't watch 4byte but a huge range)
> because the end address calculation is wrong.

Ok, I replaced the original sentence with:

It doesn't watch 4 bytes but a huge range because the end address
calculation is wrong.

and changed the title to: target/riscv: Fix pmp NA4 implementation

and applied it to the RISC-V tree.

Alistair

>
> >
> > >
> > > The solution is to use the shifted address calculated for start addre=
ss
> > > variable.
> > >
> > > Modifications are tested on Zephyr OS userspace test suite which work=
s
> > > for other RISC-V boards (E31 and E34 core).
> > >
> > > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> >
> > Otherwise:
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >
> > Alistair
> >
> > > ---
> > >  target/riscv/pmp.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > > index 9418660f1b..2a2b9f5363 100644
> > > --- a/target/riscv/pmp.c
> > > +++ b/target/riscv/pmp.c
> > > @@ -171,7 +171,7 @@ static void pmp_update_rule(CPURISCVState *env, u=
int32_t pmp_index)
> > >
> > >      case PMP_AMATCH_NA4:
> > >          sa =3D this_addr << 2; /* shift up from [xx:0] to [xx+2:2] *=
/
> > > -        ea =3D (this_addr + 4u) - 1u;
> > > +        ea =3D (sa + 4u) - 1u;
> > >          break;
> > >
> > >      case PMP_AMATCH_NAPOT:
> > > --
> > > 2.17.1
> > >
> > >

