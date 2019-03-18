Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5oi5-0007uG-VA
	for mharc-qemu-riscv@gnu.org; Mon, 18 Mar 2019 05:37:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david.abdurachmanov@gmail.com>) id 1h5oi2-0007qy-0R
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 05:37:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david.abdurachmanov@gmail.com>) id 1h5oi0-00044V-3u
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 05:37:29 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45945)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <david.abdurachmanov@gmail.com>)
	id 1h5ohr-000402-Ge; Mon, 18 Mar 2019 05:37:20 -0400
Received: by mail-oi1-x243.google.com with SMTP id y84so71208oia.12;
	Mon, 18 Mar 2019 02:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IR7nrUfiy1oAf5+BBU2G8iLrCI9VgwXTKG3LjMMqtkY=;
	b=PghtMGkuIiombWkan2buLNQHzsL7Tup8wkzEbtRt+uLPKszxs379XI2+iOdZR+Yx+D
	Cytb9V/Ql5v29FMHd/+tXR21RbbFn4XRdyu9Tgf6NyvgWjguPHq5x+84+fgV1WDpf0Ee
	xmgocsk5BGf1FrDFh8voDPK8Bc9efo3huBAIvRV2Lu2sEUc1N0x2T8E9uK0dNBzvES22
	us5XXDLKfRogsnY8znGTfMCKiT9FeXTh6blfKGo2qm0G44MFJSad1DZXlDg5Mc9xvpCh
	/m+wAR2+ndSO63KTScrL3FQr0YCqWJ3UW1fUtl5m3E7TT5BMrKp42NqDVX4daEJPyinj
	US0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IR7nrUfiy1oAf5+BBU2G8iLrCI9VgwXTKG3LjMMqtkY=;
	b=aoq909IdOdmP329AAKPuj1l8paM6be4mJiBs0hwPQZpDMtoLeUDPX63YQaWWk3Yl0C
	NQH2/5en+/GXY+rx7iRm5/80ufOtMRmc/dZITgbsHNLeqlDddU8C2ai015SmNaPoHzJx
	QrF1ZwJ+Zp2fKe9nGoaXj0Mnyi5xXG7er1Vti6sLvQtg3VOqMEu/C8MnV3+pIE/PAKZ+
	0kKI47XSVdekfHBlXsT/Eh5DNmS3R9N5PSsntFd3dWxBWAmmksPgRX7ylwcv2lc0Q2eW
	fUwP+nEokzSE/w7dnVo1zPk6wCB0kgkhOvFXwCu5CrLWlW7mWOKCy386td3ZD/cbRjmP
	NZ3g==
X-Gm-Message-State: APjAAAVn/uZboo8rKRseNX4vGRne7L/Tor4gaHEZaoMQlVdshn6pbqEx
	A0wPgyUGwP7ThfJHKwY8Ktep6tVXnWkB9IozmGA=
X-Google-Smtp-Source: APXvYqxa8kGZ3h9zpjcZXUluJSAPBWc6c/bF6L/AMhuQD6seAg3W/9mP2Esop9JvizbeWCdrT+RXnPczclTOOmuLA+U=
X-Received: by 2002:aca:5d0a:: with SMTP id r10mr8865608oib.92.1552901836406; 
	Mon, 18 Mar 2019 02:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <256afbb2da005dc62c159b0f4a4fc0d95c050660.1552679970.git.alistair.francis@wdc.com>
	<52be9b1c-772a-326a-584b-606fac5c6638@redhat.com>
	<e6aecb3c495e77deae90d5067efc81a0341816c3.camel@redhat.com>
In-Reply-To: <e6aecb3c495e77deae90d5067efc81a0341816c3.camel@redhat.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Mon, 18 Mar 2019 10:37:05 +0100
Message-ID: <CAEn-LTqjnzLQ2bQ=o4VvbJn_k=o6TGGD4K=gO6freaKP+pVohw@mail.gmail.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"palmer@sifive.com" <palmer@sifive.com>,
	"alistair23@gmail.com" <alistair23@gmail.com>, 
	"rjones@redhat.com" <rjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-riscv] [PATCH v1 1/1] riscv: plic: Set msi_nonbroken as
 true
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2019 09:37:33 -0000

On Mon, Mar 18, 2019 at 10:22 AM Andrea Bolognani <abologna@redhat.com> wrote:
>
> On Mon, 2019-03-18 at 09:39 +0100, Paolo Bonzini wrote:
> > On 15/03/19 21:05, Alistair Francis wrote:
> > > Set msi_nonbroken as true for the PLIC.
> > >
> > > According to the comment located here:
> > > https://git.qemu.org/?p=qemu.git;a=blob;f=hw/pci/msi.c;h=47d2b0f33c664533b8dbd5cb17faa8e6a01afe1f;hb=HEAD#l38
> > > the msi_nonbroken variable should be set to true even if they don't
> > > support MSI. In this case that is what we are doing as we don't support
> > > MSI.
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > Reported-by: Andrea Bolognani <abologna@redhat.com>
> > > Reported-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> > > ---
> > > This should allow working pcie-root-ports in QEMU and allow libvirt
> > > to start using PCIe by default for RISC-V guests.
> > >
> > > hw/riscv/sifive_plic.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
> > > index d12ec3fc9a..4b0537c912 100644
> > > --- a/hw/riscv/sifive_plic.c
> > > +++ b/hw/riscv/sifive_plic.c
> > > @@ -22,6 +22,7 @@
> > >  #include "qemu/log.h"
> > >  #include "qemu/error-report.h"
> > >  #include "hw/sysbus.h"
> > > +#include "hw/pci/msi.h"
> > >  #include "target/riscv/cpu.h"
> > >  #include "hw/riscv/sifive_plic.h"
> > >
> > > @@ -443,6 +444,8 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
> > >      plic->enable = g_new0(uint32_t, plic->bitfield_words * plic->num_addrs);
> > >      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
> > >      qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
> > > +
> > > +    msi_nonbroken = true;
> > >  }
> > >
> > >  static void sifive_plic_class_init(ObjectClass *klass, void *data)
> >
> > I can queue this patch, and add the "select MSI" to CONFIG_SIFIVE.
>
> The interrupt controller is used by the virt machine type too IIUC,
> so the same should be added to CONFIG_RISCV_VIRT I think.

CONFIG_SIFIVE is selected by CONFIG_RISCV_VIRT thus we should be good.

>
> --
> Andrea Bolognani / Red Hat / Virtualization
>

