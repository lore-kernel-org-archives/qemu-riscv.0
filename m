Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmQZ3-0001zH-Rh
	for mharc-qemu-riscv@gnu.org; Wed, 23 Jan 2019 17:00:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gmQZ1-0001xq-Qe
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 17:00:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gmQZ0-0000JO-Pe
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 17:00:03 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:40583)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gmQYy-0000Dv-Ez; Wed, 23 Jan 2019 17:00:00 -0500
Received: by mail-lj1-x241.google.com with SMTP id n18-v6so3372716lji.7;
	Wed, 23 Jan 2019 13:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RYNC419dXNsotzOPav0GEzqqBgx5uHUc/LFQ6Qgs0Y0=;
	b=TkRySEH9dZ366+LZ8bT5T0Uyrfa6z58KqZwBp4ZI4R2Bdz9uYFPbcZj19OvIlzDyOL
	yp/CfRi7f+jJBowZVXUdfAfZo7ber0gf/aTEVoqMsaKm7RoVT1Bz+IN5hfdPaeA93JcY
	nPKZlrw4UcQMNg2Z9wCYOZJB2nld4bimNnCyAWhjKFEqJa/z/IMvJknFu7no4yM3qwOo
	DCB67gMRU5O9cGyeUyE/pHQs62QWqc6Lksn7Rx/BJGbHySM6xjgAnIaifBwUu/bCawd1
	sPMo94CiEcr2KfUYtfb25JSYs19GeSz45lqRoKYEoSitAutJq9TZUEaARLpEPZp4VBXa
	XjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RYNC419dXNsotzOPav0GEzqqBgx5uHUc/LFQ6Qgs0Y0=;
	b=Ra6/CXoClYWwKcARKcA9nv/fym4/qswUi9Sq5VipKl+6qI7R84eyy0YiYP/s8vgjvp
	SkpSYUdM3Fm0KB4cYCpMihRUCKFajbLezJR84uwaITGs5rAuSNTLuRqJYDrx0P74PY/i
	t2fkW+VQz2SUqu9kbqpauKQ6Bkwao2109Fh5BDEPHN/AsKEHOzdTIW7oNwvOs5At7l6D
	Rfdk9bydKgTBo9U6nJlTyFuWTREJebu0EvDn5kO6SjZBSSKAFjGil4HLOdtwwUMQyfC5
	lxlReJjiiyIJZBlAnNsl2e8tdRUWENqMoMbUutd5fq8z8H0fcpb+dFKi4PMFvUn6aKid
	s7lg==
X-Gm-Message-State: AJcUukdb7MWdojSvZbRD0kBJDY/6aZyu1mXkUUGXyIBUbW/9yJ8oN0YE
	JR72kZw119d7R5nJeoz86eu7h626a/YvjvlJaC4=
X-Google-Smtp-Source: ALg8bN51gH7euzSB63dXd6zZMvMwwCxjpjZTQAxcYYOybkarNTnugo4YB+at01MsSQggfh8SImBoNBQxJYHo3iLUrkk=
X-Received: by 2002:a2e:5747:: with SMTP id
	r7-v6mr3298650ljd.141.1548280796787; 
	Wed, 23 Jan 2019 13:59:56 -0800 (PST)
MIME-Version: 1.0
References: <20190123065618.3520-1-yang.zhong@intel.com>
	<20190123065618.3520-15-yang.zhong@intel.com>
	<dcd4155e-0278-4fed-6808-84ed89bed65a@redhat.com>
In-Reply-To: <dcd4155e-0278-4fed-6808-84ed89bed65a@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 23 Jan 2019 13:59:30 -0800
Message-ID: <CAKmqyKNkAqqYhCCkzB_zZopG_KgZ6OjwVjWtWyxZTvPMMqqPPg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	Paolo Bonzini <pbonzini@redhat.com>, sameo@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC PATCH v4 14/44]
 hw/riscv/Makefile.objs: Create CONFIG_* for riscv boards
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
X-List-Received-Date: Wed, 23 Jan 2019 22:00:04 -0000

On Wed, Jan 23, 2019 at 8:12 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 2019-01-23 07:55, Yang Zhong wrote:
> > Add the new configs to default-configs/riscv*-sofmmu.mak.
> >
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  default-configs/riscv32-softmmu.mak |  7 +++++++
> >  default-configs/riscv64-softmmu.mak |  7 +++++++
> >  hw/riscv/Makefile.objs              | 22 +++++++++++-----------
> >  3 files changed, 25 insertions(+), 11 deletions(-)
> >
> > diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
> > index fbfd1d4e4b..65337166e1 100644
> > --- a/default-configs/riscv32-softmmu.mak
> > +++ b/default-configs/riscv32-softmmu.mak
> > @@ -12,3 +12,10 @@ CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=y
> >
> >  CONFIG_VGA=y
> >  CONFIG_VGA_PCI=y
> > +
> > +CONFIG_SPIKE=y
> > +CONFIG_HART=y
> > +CONFIG_SIFIVE_E=y
> > +CONFIG_SIFIVE=y
> > +CONFIG_SIFIVE_U=y
> > +CONFIG_RISCV_VIRT=y
> > diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-softmmu.mak
> > index fbfd1d4e4b..65337166e1 100644
> > --- a/default-configs/riscv64-softmmu.mak
> > +++ b/default-configs/riscv64-softmmu.mak
> > @@ -12,3 +12,10 @@ CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=y
> >
> >  CONFIG_VGA=y
> >  CONFIG_VGA_PCI=y
> > +
> > +CONFIG_SPIKE=y
> > +CONFIG_HART=y
> > +CONFIG_SIFIVE_E=y
> > +CONFIG_SIFIVE=y
> > +CONFIG_SIFIVE_U=y
> > +CONFIG_RISCV_VIRT=y
> > diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
> > index 1dde01d39d..79bfb3abf9 100644
> > --- a/hw/riscv/Makefile.objs
> > +++ b/hw/riscv/Makefile.objs
> > @@ -1,11 +1,11 @@
> > -obj-y += riscv_htif.o
> > -obj-y += riscv_hart.o
> > -obj-y += sifive_e.o
> > -obj-y += sifive_clint.o
> > -obj-y += sifive_prci.o
> > -obj-y += sifive_plic.o
> > -obj-y += sifive_test.o
> > -obj-y += sifive_u.o
> > -obj-y += sifive_uart.o
> > -obj-y += spike.o
> > -obj-y += virt.o
> > +obj-$(CONFIG_SPIKE) += riscv_htif.o
> > +obj-$(CONFIG_HART) += riscv_hart.o
> > +obj-$(CONFIG_SIFIVE_E) += sifive_e.o
> > +obj-$(CONFIG_SIFIVE) += sifive_clint.o
> > +obj-$(CONFIG_SIFIVE) += sifive_prci.o
> > +obj-$(CONFIG_SIFIVE) += sifive_plic.o
> > +obj-$(CONFIG_SIFIVE) += sifive_test.o
> > +obj-$(CONFIG_SIFIVE_U) += sifive_u.o
> > +obj-$(CONFIG_SIFIVE) += sifive_uart.o
> > +obj-$(CONFIG_SPIKE) += spike.o
> > +obj-$(CONFIG_RISCV_VIRT) += virt.o
>
> Looks reasonable to me, so I dare to say:
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>
> ... but I'm not an expert here, I hope some of the RISC-V maintainers
> could chime in?

Looks right to me

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>

