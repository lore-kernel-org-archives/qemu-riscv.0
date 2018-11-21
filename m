Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPX8X-00052f-9b
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:22:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPX8U-0004zs-15
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:22:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPX8R-00085W-Ne
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:22:01 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:35788)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPX8K-0007br-Fo; Wed, 21 Nov 2018 13:21:54 -0500
Received: by mail-lf1-x141.google.com with SMTP id e26so4716860lfc.2;
	Wed, 21 Nov 2018 10:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AaKsprWHQUBNWFfCQ8LoXcz1FpLgcEMvLWvrAkRgVHc=;
	b=KJ71nV8qtAZwKL0vQEqF43kZLSVMCjkjthKS51emqxTCiql9AtquGLFUaysgxFaSdv
	/TIx+qTtflRv9gs1jr76akDkozoiMGY/9cH7D0ri720iyQyeu/Oy7HR6nM5U14MK4MdQ
	EnQOrLPGYLRMjNEwfXVOu1xs9gNAlHTFKzUNBN2+eaZeky9GgZl7GZERGZcBAw3RouWq
	MCVbvObBtXXNw5ERIjd7Nor9b4SBJ8pOPZw800ntln4hd9NdL1DV8GI7fBaQ/CgVxP9N
	A4Y+q7HSskS+McTBpRb6GmqRBEQvM3VV9rrH5g1VNWEzsDmXCY2tdvP+zkznhlB2QA4B
	S6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AaKsprWHQUBNWFfCQ8LoXcz1FpLgcEMvLWvrAkRgVHc=;
	b=hqOIPag2Mrk0zPKt+EskUsfbgS9OZoe5TFqs72wUtyt2BGZogwIhyMcLegriCX3qBs
	pzPeksv7u5lUYIWGoU0yjUMCHtEubXBSIQjKTqEsC6ymxyif2MgSwb2zAb2XkvXnQ5CS
	3kHNaLSCweOidH4fsFLDWkMHkPqIhqrRlq3ngwoMRcUDyMf4g+sPE2NGXWF+p+nWal6O
	uiqZ/yMgilJG5he2ypGgSIob4JoxJ9ueAAJ+ivEjh1f06o8tSSoj1+hVAC6Rbafli1nE
	FduNNepJWif89VlD2y0yBg4JwLKdc9ya+ZbwLAHtFRAwlv0fgh3dvHmRS4c9zQZGN74q
	3P0w==
X-Gm-Message-State: AGRZ1gIpnoTvYZtLP9lcjRVhsb8gPgQ6GrYWWIuS9k7rr8f4IVwmsY7v
	wj3ks6EuhpdsMiUZwJDUFBeiPkRnq0tEGMsDu00=
X-Google-Smtp-Source: AJdET5eD1ijiERkS40zqy6yJSOvIj51lfjn3tzl7t8z0KpYp7gDSiEgYnumqHcW2sZHD0fV1/Y3/TUXySoMoIkpn+Io=
X-Received: by 2002:a19:8fce:: with SMTP id s75mr4348734lfk.151.1542824507250; 
	Wed, 21 Nov 2018 10:21:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<86e2120f18412152ed2994b72bd874120b86d749.1542819633.git.alistair.francis@wdc.com>
	<b49b54bf-2548-5a6b-1808-511b57cd33ad@deltatee.com>
In-Reply-To: <b49b54bf-2548-5a6b-1808-511b57cd33ad@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 10:21:19 -0800
Message-ID: <CAKmqyKP4pp_QFGrLHTm4TzjTKzpTcCXyA+_5+unbtrkiEUj9Ug@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 3/6] hw/riscv/virt: Connect the
 gpex PCIe
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
X-List-Received-Date: Wed, 21 Nov 2018 18:22:03 -0000

On Wed, Nov 21, 2018 at 10:01 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 10:02 a.m., Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
>
>
> > diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
> > index 7937c69e22..3e3d195f37 100644
> > --- a/default-configs/riscv32-softmmu.mak
> > +++ b/default-configs/riscv32-softmmu.mak
> > @@ -1,7 +1,11 @@
> >  # Default configuration for riscv-softmmu
> >
> > +include pci.mak
> > +
> >  CONFIG_SERIAL=y
> >  CONFIG_VIRTIO_MMIO=y
> > -include virtio.mak
> >
> >  CONFIG_CADENCE=y
> > +
> > +CONFIG_PCI_GENERIC=y
> > +CONFIG_PCI_XILINX=y
>
> Nit: should PCI_XILINX not be in patch 5? It's not used in this patch
> and was a bit confusing when reviewing.

It probably should be, I have moved it.

Alistair

>
> Logan

