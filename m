Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7HsK-00042f-Sh
	for mharc-qemu-riscv@gnu.org; Sun, 16 Aug 2020 08:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@nathanrossi.com>)
 id 1k7HSU-0005bZ-Jb
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2020 08:08:19 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nathan@nathanrossi.com>)
 id 1k7HSR-0006mw-DG
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2020 08:08:18 -0400
Received: by mail-wm1-x344.google.com with SMTP id k20so11675399wmi.5
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2020 05:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nathanrossi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3pzozrvq/Zjaa2RRbzG24LT+gFXCoeMryH4chEhO4WA=;
 b=gk470iRQQUC371JcuMZiq2Gjz2b9J1XrPcneOqfkq4oKx/FGoRx5wcEs+ykOhJYGmN
 vS7xYtJNJGz3UhpWEBsrEJIRDibTQH0mT2RmT++CR5mnlvtk6pYbAGMrzSmfW/zGMYbF
 Dz1IWJ4UyH4fYwCaYcKEefFhOQlB7wuyuL0NujzHHhofSJDiCjqV8HEYkShMd4BDQ3bO
 C57adv7FsnxT4uAGyUxXcuGk4BS9k3YineUqTU2VIAE5Usl4RiSbeX0oEMyxe+Nuvbb/
 36r8Xpl4+fIUVG3Fgb6Ju0Mdm1A1oikWif5QR4tGNUQFsBaPJrZmah+XY//Hc7Z/5JT0
 2cZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3pzozrvq/Zjaa2RRbzG24LT+gFXCoeMryH4chEhO4WA=;
 b=ooCa/eURicYUjxkY5beArVKgbKK3NvB0yH9RcZhUeK/1ujTtQ0HWaqS3ITCcQ9SmNi
 7oHqw8OHghHl8OwEIuuoGYylkCGwTdQSp5msd4U4h6DzLY3gqDGQOj1XKVNXRkCaMOu1
 2EBH38gRo3IRIpGBDsczA7ALM7oQLbxeeAQkBcapsyA/Gl7KDLIiIcvSXKdbiIbVXrJx
 Fcz+jKZHhA1mfMstO4FmkK4u1vNkqKIQ7Jwd+0tBdoGVD1EQ0CF/Z+m2qRBeAJgoZ3pJ
 yxV++WBxIyf8xejE/2CDNmH5rGKM39IbIMIKUSlBd9wJExvbqCqd5Tz4gflLQPue1PSM
 fu/Q==
X-Gm-Message-State: AOAM530olvmWLkjRQneTzsGHaEIuT6sq31Fvvh5ebyFpWR9sXFbZGxWn
 M0g/MqfnReTWmOE7g/CXaRjWuXm7kX5F+hiCt+EWsA==
X-Google-Smtp-Source: ABdhPJwJ2KNk32XeckjVEYgQt8+2wQe/dpPQ5O4MupeUFht51nJMZzjqv5hMPobXrDAdkLb9jRzPf7i2AjI9yeNASDM=
X-Received: by 2002:a7b:c954:: with SMTP id i20mr11346091wml.189.1597579692752; 
 Sun, 16 Aug 2020 05:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
 <1597423256-14847-15-git-send-email-bmeng.cn@gmail.com>
 <e97e1bc4-277d-9fdd-1372-f69d22b4a7e4@amsat.org>
 <CAEUhbmX6O7gGc2+sZFXSve=rBJLZQ5ts2sfWM=OU6k+4j-uryg@mail.gmail.com>
In-Reply-To: <CAEUhbmX6O7gGc2+sZFXSve=rBJLZQ5ts2sfWM=OU6k+4j-uryg@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Sun, 16 Aug 2020 22:08:01 +1000
Message-ID: <CA+aJhH1YooxPkaT2xc4o6CjDYLm++6psSc3ZZW-EiAPFCz=PjA@mail.gmail.com>
Subject: Re: [PATCH 14/18] hw/net: cadence_gem: Add a new 'phy-addr' property
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 John Linn <john.linn@xilinx.com>, 
 "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>, 
 Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 qemu-arm <qemu-arm@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=nathan@nathanrossi.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 16 Aug 2020 08:35:00 -0400
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
X-List-Received-Date: Sun, 16 Aug 2020 12:08:20 -0000

On Sun, 16 Aug 2020 at 18:29, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Aug 15, 2020 at 5:06 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >
> > On 8/14/20 6:40 PM, Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > At present the PHY address of the PHY connected to GEM is hard-coded
> > > to either 23 (BOARD_PHY_ADDRESS) or 0. This might not be the case for
> > > all boards. Add a new 'phy-addr' property so that board can specify
> > > the PHY address for each GEM instance.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > >  hw/net/cadence_gem.c         | 7 +++++--
> > >  include/hw/net/cadence_gem.h | 2 ++
> > >  2 files changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> > > index a93b5c0..9fa03de 100644
> > > --- a/hw/net/cadence_gem.c
> > > +++ b/hw/net/cadence_gem.c
> > > @@ -1446,7 +1446,8 @@ static uint64_t gem_read(void *opaque, hwaddr o=
ffset, unsigned size)
> > >              uint32_t phy_addr, reg_num;
> > >
> > >              phy_addr =3D (retval & GEM_PHYMNTNC_ADDR) >> GEM_PHYMNTN=
C_ADDR_SHFT;
> > > -            if (phy_addr =3D=3D BOARD_PHY_ADDRESS || phy_addr =3D=3D=
 0) {
> > > +            if (phy_addr =3D=3D BOARD_PHY_ADDRESS || phy_addr =3D=3D=
 0 ||
> > > +                phy_addr =3D=3D s->phy_addr) {
> > >                  reg_num =3D (retval & GEM_PHYMNTNC_REG) >> GEM_PHYMN=
TNC_REG_SHIFT;
> > >                  retval &=3D 0xFFFF0000;
> > >                  retval |=3D gem_phy_read(s, reg_num);
> > > @@ -1569,7 +1570,8 @@ static void gem_write(void *opaque, hwaddr offs=
et, uint64_t val,
> > >              uint32_t phy_addr, reg_num;
> > >
> > >              phy_addr =3D (val & GEM_PHYMNTNC_ADDR) >> GEM_PHYMNTNC_A=
DDR_SHFT;
> > > -            if (phy_addr =3D=3D BOARD_PHY_ADDRESS || phy_addr =3D=3D=
 0) {
> > > +            if (phy_addr =3D=3D BOARD_PHY_ADDRESS || phy_addr =3D=3D=
 0 ||
> > > +                phy_addr =3D=3D s->phy_addr) {
> > >                  reg_num =3D (val & GEM_PHYMNTNC_REG) >> GEM_PHYMNTNC=
_REG_SHIFT;
> > >                  gem_phy_write(s, reg_num, val);
> > >              }
> > > @@ -1682,6 +1684,7 @@ static Property gem_properties[] =3D {
> > >      DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
> > >      DEFINE_PROP_UINT32("revision", CadenceGEMState, revision,
> > >                         GEM_MODID_VALUE),
> > > +    DEFINE_PROP_UINT8("phy-addr", CadenceGEMState, phy_addr, 0),
> >
> > This patch would be complete by moving the BOARD_PHY_ADDRESS definition
> > to each board using this NIC, and setting the "phy-addr" property to
> > this value.
>
> I actually have no idea which board in QEMU is using this special PHY
> address instead of default 0.

Given Xilinx's QEMU fork has not used this value for quite some time,
I suspect it was only used to match an early chip emulation
platform/board.

https://github.com/Xilinx/qemu/blame/master/hw/net/cadence_gem.c#L248

>
> It looks BOARD_PHY_ADDRESS has been there since the initial version of
> the cadence_gem model.
>
> commit e9f186e514a70557d695cadd2c2287ef97737023
> Author: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
> Date:   Mon Mar 5 14:39:12 2012 +1000
>
>     cadence_gem: initial version of device model
>
>     Device model for cadence gem ethernet controller.
>
>     Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.c=
om>
>     Signed-off-by: John Linn <john.linn@xilinx.com>
>     Acked-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>     Signed-off-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>
> Later PHY address 0 was added via the following commit:
>
> commit 553893736885e4f2dda424bff3e2200e1b6482a5
> Author: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> Date:   Thu Apr 3 23:55:19 2014 -0700
>
>     net: cadence_gem: Make phy respond to broadcast
>
>     Phys must respond to address 0 by specification. Implement.
>
>     Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
>     Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>     Message-id:
> 6f4d53b04ddbfb19895bfb61a595e69f1c08859a.1396594056.git.peter.crosthwaite=
@xilinx.com
>     Reviewed-by: Beniamino Galvani <b.galvani@gmail.com>
>     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> I doubt the commit message said that PHYs must respond to address 0. I
> am not aware of such specs. The issue was probably that whatever board
> 2nd commit was tested against did not have a PHY at address
> BOARD_PHY_ADDRESS.

It is common for phy devices to support it as a broadcast address. It
is also commonly written in Xilinx documentation that it is treated as
a broadcast address. e.g. the axi ethernet core
(https://www.xilinx.com/support/documentation/ip_documentation/axi_ethernet=
/v7_0/pg138-axi-ethernet.pdf
page 45). But 802.3 does not require it, instead address 0 is only
reserved.

With this commit the "must" refers to the device specification, in
that QEMU is emulating a real phy (though more specifically the phy(s)
that were being emulated for Zynq boards) that does respond to address
0 as a broadcast. This change was a trade off in order to make QEMU
behave as it would on hardware, such that software using address 0 as
broadcast would work correctly.

Regards,
Nathan


>
> + a couple of Xilinx folks to comment.
>
> >
> > >      DEFINE_PROP_UINT8("num-priority-queues", CadenceGEMState,
> > >                        num_priority_queues, 1),
> > >      DEFINE_PROP_UINT8("num-type1-screeners", CadenceGEMState,
> > > diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_ge=
m.h
> > > index 54e646f..01c6189 100644
> > > --- a/include/hw/net/cadence_gem.h
> > > +++ b/include/hw/net/cadence_gem.h
> > > @@ -73,6 +73,8 @@ typedef struct CadenceGEMState {
> > >      /* Mask of register bits which are write 1 to clear */
> > >      uint32_t regs_w1c[CADENCE_GEM_MAXREG];
> > >
> > > +    /* PHY address */
> > > +    uint8_t phy_addr;
> > >      /* PHY registers backing store */
> > >      uint16_t phy_regs[32];
>
> Regards,
> Bin

