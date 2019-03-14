Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4Qba-0008FP-40
	for mharc-qemu-riscv@gnu.org; Thu, 14 Mar 2019 09:41:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david.abdurachmanov@gmail.com>) id 1h4QHg-0003bH-NR
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 09:20:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david.abdurachmanov@gmail.com>) id 1h4Q29-0000GZ-Ts
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 09:04:31 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <david.abdurachmanov@gmail.com>)
	id 1h4Q1s-00006j-SV; Thu, 14 Mar 2019 09:04:13 -0400
Received: by mail-oi1-x243.google.com with SMTP id z14so4322335oid.0;
	Thu, 14 Mar 2019 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XpK8MY1Hbr28XA7pG2eXGYlHD0wromVwgOBvNgVhcfU=;
	b=E0w/eQ+uWDQuJdWqQ9fKDXoy2XJZZ1dgQXgYhSr0g8tFZtQOt6MnzSdeszps1i1ha1
	f6DqENphQiE1O0PY76T3wMqaAWCthuVWgY409l96CJJiZhszmV4bW25GfHvDWEd3XmNz
	KViFTBVqOQiemEXE7qxSNvR1gHP6MxPTW2TMnGS8FXdikga1YVD+3UMTyc07m8ZTt4Ih
	YNfBMNVnOhieGoVpDDpaL22QKL30xan7CbnNmvijHp2bV5j9OIdRTo346aqYBRh7QgJN
	m5jxDNhl8juyZXHxnGTryFyEVwwnOSRNRCZDQL4kT5Wo+FJ3hib8seXFL3znD6e/p5Vm
	ExQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XpK8MY1Hbr28XA7pG2eXGYlHD0wromVwgOBvNgVhcfU=;
	b=pLQ3UqXDwJi+2h+jo6JOzAgPi3DPn2VsdquGeMOFmokZmMyNFq1Nt+9Qls9OqyKVHO
	j1+CC+YlGMVgE0wJSA8KDpFqMvNV8+9x1ZWLkx6QyKNZEUCzUQpdbJMavdkMrH6cEQ46
	roK5oePQNz+099rbXpK/r5jPg5YZswtrZx25za6jQV0edLDVoeG/fhlULdotc4nHwZYy
	Hdto8WAiepk9peRj5nUlwaFfYB+Sd7Tr9wEaGX2J1L29NSeqFF3yyKR68G1hwgAdeGqW
	X0AthJzIdLGay/XE2waM7OwddJGoC3Kjk1qO74xpHarZR9J0n3tXXL4Xnfw12fcc+BY0
	3EXA==
X-Gm-Message-State: APjAAAV2UWyd80gEb2dTS+pzAxMWL7nDhiDU+Oqi9uB/1i9o/S60dElS
	F5nLoCHSbuB7QuE6ghPU/vv1dpkGSTAYSQ2BRbk=
X-Google-Smtp-Source: APXvYqxuVYYfbxwP4V9s7OTs7lP8nsM0jURvOew/asdMiPeyzAnqK9nUX0Dl/mcpVnWWBihFz4AIWW9wsbGvFRn3LnQ=
X-Received: by 2002:aca:b8d5:: with SMTP id i204mr1897028oif.169.1552568638821;
	Thu, 14 Mar 2019 06:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <1551723614-1823-1-git-send-email-pbonzini@redhat.com>
	<1551723614-1823-16-git-send-email-pbonzini@redhat.com>
	<100bab7e060234ff76a1fe7d0d97bc79368a2a4e.camel@redhat.com>
	<20190314085921-mutt-send-email-mst@kernel.org>
In-Reply-To: <20190314085921-mutt-send-email-mst@kernel.org>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 14 Mar 2019 14:03:47 +0100
Message-ID: <CAEn-LTrgapxSbiYK2MoBxg5q2mc9i2gDMpcp451NDY2ob7-c3g@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, 
	qemu-riscv@nongnu.org, Yang Zhong <yang.zhong@intel.com>,
	thuth@redhat.com, Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	"Richard W.M. Jones" <rjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
X-Mailman-Approved-At: Thu, 14 Mar 2019 09:41:03 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 15/54] build: convert pci.mak
 to Kconfig
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
X-List-Received-Date: Thu, 14 Mar 2019 13:20:34 -0000

On Thu, Mar 14, 2019 at 2:00 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Mar 14, 2019 at 01:53:48PM +0100, Andrea Bolognani wrote:
> > On Mon, 2019-03-04 at 19:19 +0100, Paolo Bonzini wrote:
> > > Instead of including the same list of devices for each target,
> > > set CONFIG_PCI to true, and make the devices default to present
> > > whenever PCI is available.  However, s390x does not want all the
> > > PCI devices, so there is a separate symbol to enable them.
> > [...]
> > > +++ b/default-configs/riscv32-softmmu.mak
> > > @@ -1,8 +1,8 @@
> > >  # Default configuration for riscv-softmmu
> > >
> > > -include pci.mak
> > >  include usb.mak
> > > -
> > > +CONFIG_PCI=y
> > > +CONFIG_PCI_DEVICES=y
> > >  CONFIG_SERIAL=y
> > >  CONFIG_VIRTIO_MMIO=y
> >
> > I *think* this might have caused some unwanted changes for RISC-V.
> >
> > pcie-root-port is built into qemu-system-riscv64 by default as of
> > dbbc277510aa (along with ioh3420!), but if you actually try to use it
> > you'll get:
> >
> >   $ ./riscv64-softmmu/qemu-system-riscv64 \
> >     -M virt \
> >     -device pcie-root-port
> >   qemu-system-riscv64: -device pcie-root-port: MSI-X is not
> >                        supported by interrupt controller
> >
> > This is a limitation we have been aware of, and the plan was to
> > enable the device in QEMU once it had been addressed: from the
> > libvirt side, the availability of the device would have meant that it
> > was safe to use it, but if the device is enabled in QEMU before it
> > can actually be used, then that makes detection on the libvirt side
> > problematic.
> >
> > I haven't spent time digging further - and I'm not familiar enough
> > with the QEMU build system anyway O:-) - but I wouldn't be surprised
> > if the same happened for other architectures, too.
>
> I'd say just disable it at build time by default.
> How about a dependency on BROKEN? Developers can
> enable it temporarily. Paolo?

Would it be enough to modify ./default-configs/riscv32-softmmu.mak by
adding:

CONFIG_PCIE_PORT=n

?
>
> > --
> > Andrea Bolognani / Red Hat / Virtualization

