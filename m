Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHwpy-00050B-Ef
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 16:11:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHwpv-0004yI-TX
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:11:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHwpk-000066-21
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:11:23 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:41254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHwpd-0008VC-Ir; Wed, 31 Oct 2018 16:11:13 -0400
Received: by mail-lj1-x243.google.com with SMTP id z80-v6so9986432ljb.8;
	Wed, 31 Oct 2018 13:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MQxfZwaSZdaShXueqQz78A4ZYsldc/QBAqACFB959C8=;
	b=h1L9QegJdCDj9KDn4ufSUIbMinDb9iwCy0wnEhcv4VXjNbYT4u7Fg0oRjxm+kJi8Sm
	42mK033qKbRShV1Pl9hFr1ZxvhKYjeS94RkXbsobnerNs8jZMikfA5NE7NiFifIya4x5
	mXY+obEjyvKADiEGTVeeRZ886OEbMOrVKI9VypLYRyNCj25DXZFk+Nj6b61otnW0tF2v
	FM5uyUll8KV2FRR5qQra1MB1xsZ3Vp+DrI1kpZpEtJsbcTvanHskX21lh93Q1pLXKzzG
	ZMsbpaHSHPlT4PFAZokxkP6ftVHZBII1jVF73pweB4Jwcbq4boyRVJ1Tx0g4SBJlBOPD
	ruNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MQxfZwaSZdaShXueqQz78A4ZYsldc/QBAqACFB959C8=;
	b=DS08x95+wUp4sLppqThtszq+GTslRpjJXdxs5Fd4vv2SUSBgO6ahJ+jKbieUu5L32U
	ft0NIVngga44f4olqccHN4lUM5S1hRn05/xUJFolDDBpVPBSa69vJV+xcwELdb//5yJU
	Z+n3iSv2Y1r+ixY++GGOyp5s1oo3T3aEBZqs8aqO3ZQCX3W/zMTWANNxBsn7klACIbNJ
	bNJbSD++9WkosaQEQl152Q/R7XnoSZQthMV7Ib/NyFkGfA9shSV081B6Kr5cFcczE5no
	z5N5UUr5q2lYb/uSfV7KusTpXI/rJaiX8M41pOP4QLvwl5I1LI/HVD1mDFxHeU6vhHlO
	wpCA==
X-Gm-Message-State: AGRZ1gJJ56VXiOvQyxAP7ouGPZGQhIWXgYG2Ek3jYgntQ4+H3/YwhRYI
	2JDwmBzwknmMPPvCErC1FATzIJGlZ0fKdx+kyKc=
X-Google-Smtp-Source: AJdET5e8SqlW9tenfZF4Yk/0nlQ37TiekFZ05xgvPTXIs8emAFE1n+f8EsOvH9d/ohuIT3CNo5QwhBra4kdzmjG+TI8=
X-Received: by 2002:a2e:449c:: with SMTP id
	b28-v6mr2908347ljf.47.1541016671347; 
	Wed, 31 Oct 2018 13:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540937826.git.alistair.francis@wdc.com>
	<3f834825634e34ad107fe9e7af1b417cb47fc1f1.camel@redhat.com>
In-Reply-To: <3f834825634e34ad107fe9e7af1b417cb47fc1f1.camel@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Oct 2018 13:10:43 -0700
Message-ID: <CAKmqyKNF+tQFf50BCj91_RypYeHbnoZLvpm8gH71iW1og9uWfA@mail.gmail.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
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
X-List-Received-Date: Wed, 31 Oct 2018 20:11:32 -0000

On Wed, Oct 31, 2018 at 7:51 AM Andrea Bolognani <abologna@redhat.com> wrote:
>
> On Tue, 2018-10-30 at 22:17 +0000, Alistair Francis wrote:
> > V6:
> >  - Fix the interrupt issue for the GPEX device
>
> I gave this a spin.
>
> With the pcie.0 <- pcie-root-port <- virtio-net-pci setup I get
>
>   qemu-system-riscv64: -device pcie-root-port,port=0x8,chassis=1,\
>   id=pci.1,bus=pcie.0,multifunction=on,addr=0x1: MSI-X is not \
>   supported by interrupt controller
>
> just like last time, which as I mentioned is a problem for libvirt
> because we follow the recommendations outlined in qemu/docs/pcie.txt
> and never plug devices into pcie.0 directly.

At the moment we can't support MSI, the interrupt controller doesn't
support MSI.

>
> Even after working around that issue by manually placing the device
> at 0000:00:01.0, it still doesn't work: I see
>
>   pci 0000:00:01.0: BAR 6: assigned [mem 0x00000000-0x0003ffff pref]
>   pci 0000:00:01.0: BAR 4: assigned [mem 0x00040000-0x00043fff 64bit pref]
>   pci 0000:00:01.0: BAR 0: no space for [io  size 0x0020]
>   pci 0000:00:01.0: BAR 0: failed to assign [io  size 0x0020]
>   ...
>   virtio_net virtio3: virtio: device uses modern interface but does not have VIRTIO_F_VERSION_1
>   virtio_net: probe of virtio3 failed with error -22

Yep, someone else pointed out a problem as well. I have made some
changes [1] but I still can't get the BAR to line up.

>
> in dmesg and, while the device shows up in the output of lspci(8),
> it's nowhere to be seen when running 'ip addr' and friends.
>
> Let me know if you need me to try anything else :)

Any ideas on how to debug the confusing memory mappings or
non-existent interrupts would be helpful :)

1: https://github.com/alistair23/qemu/tree/mainline/alistair/sifive_pcie.next

Alistair

>
> --
> Andrea Bolognani / Red Hat / Virtualization
>

