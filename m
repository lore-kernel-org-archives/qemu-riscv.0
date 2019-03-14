Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4QbY-0008El-Bt
	for mharc-qemu-riscv@gnu.org; Thu, 14 Mar 2019 09:41:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1h4QHv-0005DC-8b
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 09:20:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1h4Pyv-0007PJ-SC
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 09:01:12 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46510)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1h4Pyt-0007FG-Io
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 09:01:07 -0400
Received: by mail-qt1-f195.google.com with SMTP id z25so5830668qti.13
	for <qemu-riscv@nongnu.org>; Thu, 14 Mar 2019 06:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=yIvilkws+BY0XJsr7Nb/vUvypM0UaTK1WockMuYf7RA=;
	b=GMiQPcLWgDP0sZThRBLKuh9OFMZGs8Lmhwtw3FNwhAPr0SdvX5GQ6UDI1kpes0BBc+
	37YkvpcaKMw/Mo1e5cfeDNzHmHOuqwBIR6cPqBTbu5HZBs+P1Odg6pavn17woMPw3PdK
	VRVaD2adZdCSi+zaHgOV0xFSzRj0IWY2m2W8wAabrRCxCXN0yD9ZlW2UkULGA74uGocH
	KpgyE8f0qYYsKgmAeDmv8L8zCyaL+Q83gzXb6CJWk98u8mZKTcRvNuECJB3hnEbp7JuX
	rOugBdz0hA9p+jYw2tPnTP3F7/KXcdYLx6dJLsVkMxcjWSg5NolMNCY1uW9S7Yxz3FEa
	gKqA==
X-Gm-Message-State: APjAAAXCXheatp/BWM8XQ0O4kVtlhziPGG8z7YLr/ynXojY9Ss0ezfdk
	vpb9QgLKUoj/R88HvuhnDFw4RA==
X-Google-Smtp-Source: APXvYqwXLFK7V3jw14SLh5s0Ou7xAnLGOL2Lhx1V2jWHnltCYrQJslBYIQTdppiD/kVnpPljOaEIcg==
X-Received: by 2002:a0c:d60d:: with SMTP id c13mr39677473qvj.43.1552568449602; 
	Thu, 14 Mar 2019 06:00:49 -0700 (PDT)
Received: from redhat.com (pool-173-76-246-42.bstnma.fios.verizon.net.
	[173.76.246.42]) by smtp.gmail.com with ESMTPSA id
	r17sm1301052qkm.17.2019.03.14.06.00.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Mar 2019 06:00:48 -0700 (PDT)
Date: Thu, 14 Mar 2019 09:00:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org, Yang Zhong <yang.zhong@intel.com>,
	thuth@redhat.com, Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	David Abdurachmanov <david.abdurachmanov@gmail.com>
Message-ID: <20190314085921-mutt-send-email-mst@kernel.org>
References: <1551723614-1823-1-git-send-email-pbonzini@redhat.com>
	<1551723614-1823-16-git-send-email-pbonzini@redhat.com>
	<100bab7e060234ff76a1fe7d0d97bc79368a2a4e.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <100bab7e060234ff76a1fe7d0d97bc79368a2a4e.camel@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.195
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
X-List-Received-Date: Thu, 14 Mar 2019 13:20:51 -0000

On Thu, Mar 14, 2019 at 01:53:48PM +0100, Andrea Bolognani wrote:
> On Mon, 2019-03-04 at 19:19 +0100, Paolo Bonzini wrote:
> > Instead of including the same list of devices for each target,
> > set CONFIG_PCI to true, and make the devices default to present
> > whenever PCI is available.  However, s390x does not want all the
> > PCI devices, so there is a separate symbol to enable them.
> [...]
> > +++ b/default-configs/riscv32-softmmu.mak
> > @@ -1,8 +1,8 @@
> >  # Default configuration for riscv-softmmu
> >  
> > -include pci.mak
> >  include usb.mak
> > -
> > +CONFIG_PCI=y
> > +CONFIG_PCI_DEVICES=y
> >  CONFIG_SERIAL=y
> >  CONFIG_VIRTIO_MMIO=y
> 
> I *think* this might have caused some unwanted changes for RISC-V.
> 
> pcie-root-port is built into qemu-system-riscv64 by default as of
> dbbc277510aa (along with ioh3420!), but if you actually try to use it
> you'll get:
> 
>   $ ./riscv64-softmmu/qemu-system-riscv64 \
>     -M virt \
>     -device pcie-root-port
>   qemu-system-riscv64: -device pcie-root-port: MSI-X is not
>                        supported by interrupt controller
> 
> This is a limitation we have been aware of, and the plan was to
> enable the device in QEMU once it had been addressed: from the
> libvirt side, the availability of the device would have meant that it
> was safe to use it, but if the device is enabled in QEMU before it
> can actually be used, then that makes detection on the libvirt side
> problematic.
> 
> I haven't spent time digging further - and I'm not familiar enough
> with the QEMU build system anyway O:-) - but I wouldn't be surprised
> if the same happened for other architectures, too.

I'd say just disable it at build time by default.
How about a dependency on BROKEN? Developers can
enable it temporarily. Paolo?

> -- 
> Andrea Bolognani / Red Hat / Virtualization

