Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKVgl-0006C4-Vi
	for mharc-qemu-riscv@gnu.org; Wed, 07 Nov 2018 16:48:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gKVgk-0006B2-38
	for qemu-riscv@nongnu.org; Wed, 07 Nov 2018 16:48:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gKVgg-0000tV-6d
	for qemu-riscv@nongnu.org; Wed, 07 Nov 2018 16:48:36 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:34236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gKVgU-0000i0-E8; Wed, 07 Nov 2018 16:48:24 -0500
Received: by mail-lj1-x241.google.com with SMTP id u6-v6so16169339ljd.1;
	Wed, 07 Nov 2018 13:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kM4v3VhZqKzsbUTUXXTeE9t5Tvaq9TJoETa0r2gFvCk=;
	b=uCErfR03vHit2xGCHo0sv0+dMcoOBkQNE+DvBOvtWnI5KjsKYu1t9q1Np0GCYkHvzg
	Vx/01CuquRoXz2Id5KJGyR6h/yFfpzxbhTcf/10RTf+jwu2lAcrDHLOapgp8K/1jxPkG
	E+Pdz36y9a1PTEVwgMXohU6zdNJx6fJ7RmbRseuu1q3vOJhhb3+pHx9g3ly9v12+RwKN
	T8e1Q5I6PJi+YXB6bbHM4qpDx9w2MhNNRhpeqyybPEQ0qIHYBKmkYeF6mQ8odz6S6LU9
	nlMOCr6JpDeIzBYwApL3wszefkvaXgkOQ5kO4wnW+++iL4jnxib9l8/LO4Yin3sS05ZO
	rnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kM4v3VhZqKzsbUTUXXTeE9t5Tvaq9TJoETa0r2gFvCk=;
	b=Nq6zPM4WRWi+mkh34QgJV2LGWANyzTlveCDJtpkQL8Rru//pdnquC16GmvxWgkCLqf
	43WIJdusE7J2PigcJvXF/i961W3fm+hJqR08vwCREXrQ3IbtQraBwzz6xMJyDD1XehXY
	Ak02lYie2f/ExO2b5n/S7G5QPwrfOqP2xwbrZqZaLPXmfSI1xOV4hnkMoAmvNQNVclEA
	eUuhyYZmX5MuIvMaTX6a9Qk0yTXx0JOF7W0H0F2gBlPz3zDP2tX9aaMlgZnwvmA/s8ih
	IbTvZcsuQG9r65xv2Dtd33dnxgBgofc5yTS9Wdu/LwOL0RkGXQ0QfvGukytn7lzpO76/
	Jtyg==
X-Gm-Message-State: AGRZ1gIDFH4jUmXfH2hjS8KE3fWukqlpAi2ParXuW1BaXQlK6QLW32np
	u2+UegGo2BxTg33hOZJm5UoSZL8yD3ctzwPU7ck=
X-Google-Smtp-Source: AJdET5dD1L9lxhH5ny4922cvuG9a866J8YvH+yUCzRqk5p2uWHQxWwrTR0wwVkFmW1USqiT8ukULdTAz94ayT0F9iYE=
X-Received: by 2002:a2e:4601:: with SMTP id
	t1-v6mr1290927lja.111.1541627298859; 
	Wed, 07 Nov 2018 13:48:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1540937826.git.alistair.francis@wdc.com>
	<3f834825634e34ad107fe9e7af1b417cb47fc1f1.camel@redhat.com>
	<CAKmqyKNF+tQFf50BCj91_RypYeHbnoZLvpm8gH71iW1og9uWfA@mail.gmail.com>
	<f91286ff09066c577d359b1d185aca9fb7d21331.camel@redhat.com>
In-Reply-To: <f91286ff09066c577d359b1d185aca9fb7d21331.camel@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Nov 2018 13:47:51 -0800
Message-ID: <CAKmqyKMM=M-1G15k-0Rgo7+sp-jnq31z=GqcHaciXx5TuHNE2Q@mail.gmail.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 0/5] Connect a PCIe host
 and graphics support to RISC-V
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
X-List-Received-Date: Wed, 07 Nov 2018 21:48:39 -0000

On Thu, Nov 1, 2018 at 1:20 AM Andrea Bolognani <abologna@redhat.com> wrote:
>
> On Wed, 2018-10-31 at 13:10 -0700, Alistair Francis wrote:
> > On Wed, Oct 31, 2018 at 7:51 AM Andrea Bolognani <abologna@redhat.com> wrote:
> > > With the pcie.0 <- pcie-root-port <- virtio-net-pci setup I get
> > >
> > >   qemu-system-riscv64: -device pcie-root-port,port=0x8,chassis=1,\
> > >   id=pci.1,bus=pcie.0,multifunction=on,addr=0x1: MSI-X is not \
> > >   supported by interrupt controller
> > >
> > > just like last time, which as I mentioned is a problem for libvirt
> > > because we follow the recommendations outlined in qemu/docs/pcie.txt
> > > and never plug devices into pcie.0 directly.
> >
> > At the moment we can't support MSI, the interrupt controller doesn't
> > support MSI.
>
> I see. Are there plans for that to change? Will we eventually need
> something like Arm's 'gic-version' machine option to pick a more
> featureful interrupt controller?

I don't think there is even MSI support in the interrupt spec (I
haven't looked at all though), yet alone in QEMU. Unfortunately it
seems low down on the list of things we need to do so it will probably
be awhile.

Alistair

>
> Either way, as it is we certainly can't flip the default to
> virtio-pci at the libvirt level quite yet, so we'll have to stick
> with virtio-mmio for a while longer... Not exactly the outcome I
> was hoping for :(
>
> > > Let me know if you need me to try anything else :)
> >
> > Any ideas on how to debug the confusing memory mappings or
> > non-existent interrupts would be helpful :)
>
> Sorry, not really my area of expertise O:-)
>
> --
> Andrea Bolognani / Red Hat / Virtualization
>

