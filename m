Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngyB0-0000RE-JD
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 20:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1ngyAy-0000Qs-Qa
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 20:26:33 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:40784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1ngyAw-00019j-G7
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 20:26:32 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id i20so73012ybj.7
 for <qemu-riscv@nongnu.org>; Tue, 19 Apr 2022 17:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RWq7v6eQUq3JyBAcQ/g/2j2RyZUpTmb0bb4u67RgFDo=;
 b=CBJZN2/0s+s3xnPfeuVhwE5yB6WGT+dNmT3Ta9e38PAynCJzcsDNhorkDqTD2W8FYJ
 a8uGNxhOe+qlneH/1XUgj3JJpskg64bTz6PTxzKPNZRxl1U76lDcab4TMFaKw+W5ymLF
 S41qrV7WPSzBARxseaq1dVhlEhgpRAPKYTgas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RWq7v6eQUq3JyBAcQ/g/2j2RyZUpTmb0bb4u67RgFDo=;
 b=bPdDgMrXH2ihteXv2DJOfqQVd+m/7+fiA1L5oaGM5V+lRHrRTyPqedAOBICYYHGGU6
 ztlzQRwYbL1cDKAVv0kSot8uYqAegtFi/XIEjTu1Wf/E20meqpfs28hPWXZte1L4I+6R
 /umCBe7Zw1tTDfoMAaaZt09TjpnT7ks2lIgj25FM80T+HjNF0Kx5heMmk7fc7axlQFaL
 t0FquTl1LYHDxcFbVgq12uW393WxgfmlOQAzm/6QJnGrPIyRwA17qsew8ZCZGkFDi+Sg
 UpyW6tz9MwlTHaQ4zj0F/zc0ehh5e+FI0DB0wy+RpQXC93/GH4G9WITRn7QqJuwQ47bv
 ENDg==
X-Gm-Message-State: AOAM5330NfE8qM3t61o6SlY17nkR7AWt1NMDqXKgaOMZwEd2p6NtL/nk
 5CvkJFXJ4uk6lKX+rH0WVCY7Oewn9XUICtoGCo9R
X-Google-Smtp-Source: ABdhPJz3g2C3gop1vyRHIYi/OyqVNQXLN5OKFk18FblTpAJPuT6Z+rSBsgjV4uHtAFbRK4uxOrxp/RWAmxVhUwGl0ko=
X-Received: by 2002:a25:a029:0:b0:63d:f892:e7af with SMTP id
 x38-20020a25a029000000b0063df892e7afmr17545440ybh.14.1650414388765; Tue, 19
 Apr 2022 17:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220412021009.582424-1-atishp@rivosinc.com>
 <Yl7oiF7kUrIQ0qk5@redhat.com>
In-Reply-To: <Yl7oiF7kUrIQ0qk5@redhat.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Apr 2022 17:26:17 -0700
Message-ID: <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Atish Patra <atishp@rivosinc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Apr 2022 00:26:33 -0000

On Tue, Apr 19, 2022 at 9:51 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Apr 11, 2022 at 07:10:06PM -0700, Atish Patra wrote:
> >
> > The RISC-V virt machine has helped RISC-V software eco system to evolve=
 at a
> > rapid pace even in absense of the real hardware. It is definitely comme=
ndable.
> > However, the number of devices & commandline options keeps growing as a=
 result
> > of that as well. That adds flexibility but will also become bit difficu=
lt
> > to manage in the future as more extension support will be added. As it =
is the
> > most commonly used qemu machine, it needs to support all kinds of devic=
e and
> > interrupts as well. Moreover, virt machine has limitations on the maxim=
um
> > number of harts it can support because of all the MMIO devices it has t=
o support.
> >
> > The RISC-V IMSIC specification allows to develop machines completely re=
lying
> > on MSI and don't care about the wired interrupts at all. It just requir=
es
> > all the devices to be present behind a PCI bus or present themselves as=
 platform
> > MSI device. The former is a more common scenario in x86 world where mos=
t
> > of the devices are behind PCI bus. As there is very limited MMIO device
> > support, it can also scale to very large number of harts.
> >
> > That's why, this patch series introduces a minimalistic yet very extens=
ible
> > forward looking machine called as "RISC-V Mini Computer" or "minic". Th=
e
> > idea is to build PC or server like systems with this machine. The machi=
ne can
> > work with or without virtio framework. The current implementation only
> > supports RV64. I am not sure if building a RV32 machine would be of int=
erest
> > for such machines. The only mmio device it requires is clint to emulate
> > the mtimecmp.
>
> I would ask what you see as the long term future usage for 'virt' vs
> 'minic' machine types ? Would you expect all existing users of 'virt'
> to ultimately switch to 'minic', or are there distinct non-overlapping
> use cases for 'virt' vs 'minic' such that both end up widely used ?
>

Nope. I don't expect existing 'virt' users to switch to 'minic' as
they aim to cater to different users.

Here are the major differences
1. virt machine supports MMIO devices & wired interrupts. Minic doesn't
2. virt machine doesn't support the MSI only option yet (can be added
though[1]). Minic does.
3. Number of cpu supported by virt machine are limited because of the
MMIO devices. Minic can scale to very
large numbers of cpu.
4. 'Minic' only supports PCI based MSI capable devices. Thus, MSI is a
mandatory requirement for 'minic' while
it is optional for 'virt'.

'Minic' aims towards the users who want to create virtual machines
that are MSI based and don't care about
a million options that virt machines provide.  Virt machine is more
complex so that it can be flexible in terms of
what it supports. Minic is a minimalistic machine which doesn't need
to be expanded a lot in the future given that
most of the devices can be behind PCI.

[1] https://github.com/atishp04/qemu/tree/virt_imsic_only

> Is 'minic' intended to be able to mimic real physical hardware at all,
> or is it still intended as a purely virtual machine, like a 'virt-ng' ?
>

Any future hardware that relies only on PCI-MSI based devices, they
can be created on top of minic.
At that point, minic will provide a useful abstract for all those
machines as well. minic doesn't need a virtio framework.
Thus, it can closely emulate such hardware as well.

> Essentially 'virt' was positioned as the standard machine to use if
> you want to run a virtual machine, without any particular match to
> physical hardware. It feels like 'minic' is creating a second machine
> type to fill the same purpose, so how do users decide which to use ?
>

I envision 'minic' to be a standard machine for a specific set of user
requirements (x86 style PCI based
machines). Virt machine will continue to be a standard machine for
more generic use cases with MMIO devices.

> > "Naming is hard". I am not too attached with the name "minic".
> > I just chose least bad one out of the few on my mind :). I am definitel=
y
> > open to any other name as well.
> >
> > The other alternative to provide MSI only option to aia in the
> > existing virt machine to build MSI only machines. This is certainly doa=
ble
> > and here is the patch that supports that kind of setup.
> >
> > https://github.com/atishp04/qemu/tree/virt_imsic_only
> >
> > However, it even complicates the virt machine even further with additio=
nal
> > command line option, branches in the code. I believe virt machine will =
become
> > very complex if we continue this path. I am interested to learn what ev=
eryone
> > else think.
> >
> > It is needless to say that the current version of minic machine
> > is inspired from virt machine and tries to reuse as much as code possib=
le.
> > The first patch in this series adds MSI support for serial-pci device s=
o
> > console can work on such a machine. The 2nd patch moves some common fun=
ctions
> > between minic and the virt machine to a helper file. The PATCH3 actuall=
y
> > implements the new minic machine.
> >
> > I have not added the fw-cfg/flash support. We probably should add those
> > but I just wanted to start small and get the feedback first.
> > This is a work in progress and have few more TODO items before becoming=
 the
> > new world order :)
> >
> > 1. OpenSBI doesn't have PCI support. Thus, no console support for OpenS=
BI
> > for now.
> > 2. The ns16550 driver in OpenSBI also need to support MSI/MSI-X.
> > 3. Add MSI-X support for serial-pci device.
> >
> > This series can boot Linux distros with the minic machine with or witho=
ut virtio
> > devices with out-of-tree Linux kernel patches[1]. Here is an example co=
mmandline
> >
> > Without virtio devices (nvme, serial-pci & e1000e):
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > /scratch/workspace/qemu/build/qemu-system-riscv64 -cpu rv64 -M minic -m=
 1G -smp 4 -nographic -nodefaults \
> > -display none -bios /scratch/workspace/opensbi/build/platform/generic/f=
irmware/fw_dynamic.elf \
> > -kernel /scratch/workspace/linux/arch/riscv/boot/Image \
> > -chardev stdio,mux=3Don,signal=3Doff,id=3Dcharconsole0 \
> > -mon chardev=3Dcharconsole0,mode=3Dreadline \
> > -device pci-serial,msi=3Dtrue,chardev=3Dcharconsole0 \
> > -drive id=3Ddisk3,file=3D/scratch/workspace/rootfs_images//fedora/Fedor=
a-Developer-Rawhide-20211110.n.0-sda.raw,format=3Draw,if=3Dnone,id=3Ddrive-=
system-disk,cache=3Dnone,format=3Draw \
> > -device nvme,serial=3Ddeadbeef,drive=3Ddisk3 \
> > -netdev user,id=3Dusernet,hostfwd=3Dtcp::10000-:22 -device e1000e,netde=
v=3Dusernet,bus=3Dpcie.0 \
> > -append 'root=3D/dev/nvme0n1p2 rw loglevel=3D8 memblock=3Ddebug console=
=3DttyS0 earlycon' -d in_asm -D log.txt -s
> >
> > With virtio devices (virtio-scsi-pci, serial-pci & virtio-net-pci)
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > /scratch/workspace/qemu/build/qemu-system-riscv64 -cpu rv64 -M minic -m=
 1G -smp 4 -nographic -nodefaults \
> > -display none -bios /scratch/workspace/opensbi/build/platform/generic/f=
irmware/fw_dynamic.elf \
> > -kernel /scratch/workspace/linux/arch/riscv/boot/Image \
> > -chardev stdio,mux=3Don,signal=3Doff,id=3Dcharconsole0 \
> > -mon chardev=3Dcharconsole0,mode=3Dreadline \
> > -device pci-serial,msi=3Dtrue,chardev=3Dcharconsole0 \
> > -drive file=3D/scratch/workspace/rootfs_images//fedora/Fedora-Developer=
-Rawhide-20211110.n.0-sda.raw,format=3Draw,if=3Dnone,id=3Ddrive-system-disk=
,cache=3Dnone \
> > -device virtio-scsi-pci,id=3Dscsi0 -device scsi-hd,bus=3Dscsi0.0,drive=
=3Ddrive-system-disk,id=3Dsystem-disk,bootindex=3D1 \
> > -netdev user,id=3Dn1,hostfwd=3Dtcp::10000-:22 -device virtio-net-pci,ne=
tdev=3Dn1 \
> > -append 'root=3D/dev/sda2 rw loglevel=3D8 memblock=3Ddebug console=3Dtt=
yS0 earlycon'
> >
> > The objective of this series is to engage the community to solve this p=
roblem.
> > Please suggest if you have another alternatve solution.
> >
> > [1] https://github.com/atishp04/linux/tree/msi_only_console
> >
> > Atish Patra (3):
> > serial: Enable MSI capablity and option
> > hw/riscv: virt: Move common functions to a separate helper file
> > hw/riscv: Create a new qemu machine for RISC-V
> >
> > configs/devices/riscv64-softmmu/default.mak |   1 +
> > hw/char/serial-pci.c                        |  36 +-
> > hw/riscv/Kconfig                            |  11 +
> > hw/riscv/machine_helper.c                   | 417 +++++++++++++++++++
> > hw/riscv/meson.build                        |   2 +
> > hw/riscv/minic.c                            | 438 ++++++++++++++++++++
> > hw/riscv/virt.c                             | 403 ++----------------
> > include/hw/riscv/machine_helper.h           |  87 ++++
> > include/hw/riscv/minic.h                    |  65 +++
> > include/hw/riscv/virt.h                     |  13 -
> > 10 files changed, 1090 insertions(+), 383 deletions(-)
> > create mode 100644 hw/riscv/machine_helper.c
> > create mode 100644 hw/riscv/minic.c
> > create mode 100644 include/hw/riscv/machine_helper.h
> > create mode 100644 include/hw/riscv/minic.h
> >
> > --
> > 2.25.1
> >
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>
>


--=20
Regards,
Atish

