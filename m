Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmXvI-0001Mw-OT
	for mharc-qemu-riscv@gnu.org; Thu, 05 May 2022 05:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmXvF-0001Da-HZ; Thu, 05 May 2022 05:37:21 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:33398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmXvC-0001Th-Ux; Thu, 05 May 2022 05:37:21 -0400
Received: by mail-io1-xd34.google.com with SMTP id i20so4165944ion.0;
 Thu, 05 May 2022 02:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tvbGsMRIYBDsWoMkDclb3oF2OAh687Xz82crV3CPXQ8=;
 b=LgivHzTqEq9w+Z4FPMcInLR1w54LaNfM3RUKyrx0JJ8ha/xzKIF/DL4qYo9z/q+EAP
 tImnx+8sB8cQdimgALBGrjebK498faWSTWl/CRPpwH1zrLw77AAY5QIHh3E1WYlO8KaK
 sYY8HLuo5YMVov5RnlWYyo2Pik7GwbRS6hYniJ/Uwb+U/G7MTTBFD9y+rTxSFWjgZ21a
 B9rCWYDNd4NduW78yc6n812ekb/XRLvizRgTCiQO62tFJnWymMuZWKx+N7iZ9xww0CJV
 esPC9tqPlczzF7czKbAmaeSa6LduhHpWZa2741fLQnASXeEh/2Wu0hPPuO7Cv8qdOW1A
 Ukhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tvbGsMRIYBDsWoMkDclb3oF2OAh687Xz82crV3CPXQ8=;
 b=OD7RiNacBdODJ5YIOLBh1o4G4aFepuDDwATjEoTmWxJldxUbI0tUi/IsgnvzrLAg2L
 xxxjE79uQppRGLdlzw6DbV9h8a8jMEKS8Gf9ykGo9RTnX/dmiFwf8H2f/IpdyjArghNi
 SflXQxcaqCyZgSXiXvrJ9VVkP0qVhYIldJn5Hqt5LSGi+a3DbVKkL0npNP7uqSyILr9N
 QLyqLuS7piSh++reF6sbhaVfuvDm/6tlFcW3tU60QdZ6hPRbf1Rsv5GKPwYD23ngcjK3
 HOgy1DfWA9hA81E04FOEhpGKLTm+gE1YAGRxI8aPt9qfzWT+JkR35HReAalIUk4I48VU
 lscw==
X-Gm-Message-State: AOAM5314aLNyTZupc+rPFwrF26zzgDz4sIgbBxuugfcUjuSuPshyUlL9
 hVzQisC6BPPLbhAlH9XeblCymhhoG6LsU7kcank=
X-Google-Smtp-Source: ABdhPJxefbhEsXPKcJDir35SRnFuOp9nDh9kaLxvxLZTCiuabCUC3beUjioDvEucYS+kg63QnKM2toLx0dfD3uKgH/Q=
X-Received: by 2002:a05:6602:2c07:b0:657:8347:d7c0 with SMTP id
 w7-20020a0566022c0700b006578347d7c0mr10135788iov.93.1651743437368; Thu, 05
 May 2022 02:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220412021009.582424-1-atishp@rivosinc.com>
 <Yl7oiF7kUrIQ0qk5@redhat.com>
 <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
 <CAOnJCUK9_qzOLr3GVdFTP95rs3avNE=7E2R27dADkMMsOhnGEQ@mail.gmail.com>
In-Reply-To: <CAOnJCUK9_qzOLr3GVdFTP95rs3avNE=7E2R27dADkMMsOhnGEQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 May 2022 19:36:51 +1000
Message-ID: <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Atish Patra <atishp@rivosinc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 05 May 2022 09:37:21 -0000

On Tue, May 3, 2022 at 5:57 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Apr 19, 2022 at 5:26 PM Atish Patra <atishp@atishpatra.org> wrote=
:
> >
> > On Tue, Apr 19, 2022 at 9:51 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Mon, Apr 11, 2022 at 07:10:06PM -0700, Atish Patra wrote:
> > > >
> > > > The RISC-V virt machine has helped RISC-V software eco system to ev=
olve at a
> > > > rapid pace even in absense of the real hardware. It is definitely c=
ommendable.
> > > > However, the number of devices & commandline options keeps growing =
as a result
> > > > of that as well. That adds flexibility but will also become bit dif=
ficult
> > > > to manage in the future as more extension support will be added. As=
 it is the
> > > > most commonly used qemu machine, it needs to support all kinds of d=
evice and
> > > > interrupts as well. Moreover, virt machine has limitations on the m=
aximum
> > > > number of harts it can support because of all the MMIO devices it h=
as to support.
> > > >
> > > > The RISC-V IMSIC specification allows to develop machines completel=
y relying
> > > > on MSI and don't care about the wired interrupts at all. It just re=
quires
> > > > all the devices to be present behind a PCI bus or present themselve=
s as platform
> > > > MSI device. The former is a more common scenario in x86 world where=
 most
> > > > of the devices are behind PCI bus. As there is very limited MMIO de=
vice
> > > > support, it can also scale to very large number of harts.
> > > >
> > > > That's why, this patch series introduces a minimalistic yet very ex=
tensible
> > > > forward looking machine called as "RISC-V Mini Computer" or "minic"=
. The
> > > > idea is to build PC or server like systems with this machine. The m=
achine can
> > > > work with or without virtio framework. The current implementation o=
nly
> > > > supports RV64. I am not sure if building a RV32 machine would be of=
 interest
> > > > for such machines. The only mmio device it requires is clint to emu=
late
> > > > the mtimecmp.
> > >
>
> Any other thoughts ?

I don't *love* this idea. I think the virt machine is useful, but I'm
not convinced we need a second one.

This feels a little bit more like a "none" machine, as it contains
just the bare minimum to work.

>
> > > I would ask what you see as the long term future usage for 'virt' vs
> > > 'minic' machine types ? Would you expect all existing users of 'virt'
> > > to ultimately switch to 'minic', or are there distinct non-overlappin=
g
> > > use cases for 'virt' vs 'minic' such that both end up widely used ?
> > >
> >
> > Nope. I don't expect existing 'virt' users to switch to 'minic' as
> > they aim to cater to different users.
> >
> > Here are the major differences
> > 1. virt machine supports MMIO devices & wired interrupts. Minic doesn't

This seems like the main difference

> > 2. virt machine doesn't support the MSI only option yet (can be added
> > though[1]). Minic does.

This could be fixed

> > 3. Number of cpu supported by virt machine are limited because of the
> > MMIO devices. Minic can scale to very
> > large numbers of cpu.

Similar to 1

> > 4. 'Minic' only supports PCI based MSI capable devices. Thus, MSI is a
> > mandatory requirement for 'minic' while
> > it is optional for 'virt'.

I'm not fully convinced we need this, but it also doesn't seem to cost
us a lot in terms of maintenance. It would be beneficial if we could
share a bit more of the code. Can we share the socket creation code as
well?

I don't like the name minic though. What about something like
`virt-hpc`, `virt-pcie-minimal` or something like that? That way we
indicate it's still a virt board

Alistair

> >
> > 'Minic' aims towards the users who want to create virtual machines
> > that are MSI based and don't care about
> > a million options that virt machines provide.  Virt machine is more
> > complex so that it can be flexible in terms of
> > what it supports. Minic is a minimalistic machine which doesn't need
> > to be expanded a lot in the future given that
> > most of the devices can be behind PCI.
> >
> > [1] https://github.com/atishp04/qemu/tree/virt_imsic_only
> >
> > > Is 'minic' intended to be able to mimic real physical hardware at all=
,
> > > or is it still intended as a purely virtual machine, like a 'virt-ng'=
 ?
> > >
> >
> > Any future hardware that relies only on PCI-MSI based devices, they
> > can be created on top of minic.
> > At that point, minic will provide a useful abstract for all those
> > machines as well. minic doesn't need a virtio framework.
> > Thus, it can closely emulate such hardware as well.
> >
> > > Essentially 'virt' was positioned as the standard machine to use if
> > > you want to run a virtual machine, without any particular match to
> > > physical hardware. It feels like 'minic' is creating a second machine
> > > type to fill the same purpose, so how do users decide which to use ?
> > >
> >
> > I envision 'minic' to be a standard machine for a specific set of user
> > requirements (x86 style PCI based
> > machines). Virt machine will continue to be a standard machine for
> > more generic use cases with MMIO devices.
> >
> > > > "Naming is hard". I am not too attached with the name "minic".
> > > > I just chose least bad one out of the few on my mind :). I am defin=
itely
> > > > open to any other name as well.
> > > >
> > > > The other alternative to provide MSI only option to aia in the
> > > > existing virt machine to build MSI only machines. This is certainly=
 doable
> > > > and here is the patch that supports that kind of setup.
> > > >
> > > > https://github.com/atishp04/qemu/tree/virt_imsic_only
> > > >
> > > > However, it even complicates the virt machine even further with add=
itional
> > > > command line option, branches in the code. I believe virt machine w=
ill become
> > > > very complex if we continue this path. I am interested to learn wha=
t everyone
> > > > else think.
> > > >
> > > > It is needless to say that the current version of minic machine
> > > > is inspired from virt machine and tries to reuse as much as code po=
ssible.
> > > > The first patch in this series adds MSI support for serial-pci devi=
ce so
> > > > console can work on such a machine. The 2nd patch moves some common=
 functions
> > > > between minic and the virt machine to a helper file. The PATCH3 act=
ually
> > > > implements the new minic machine.
> > > >
> > > > I have not added the fw-cfg/flash support. We probably should add t=
hose
> > > > but I just wanted to start small and get the feedback first.
> > > > This is a work in progress and have few more TODO items before beco=
ming the
> > > > new world order :)
> > > >
> > > > 1. OpenSBI doesn't have PCI support. Thus, no console support for O=
penSBI
> > > > for now.
> > > > 2. The ns16550 driver in OpenSBI also need to support MSI/MSI-X.
> > > > 3. Add MSI-X support for serial-pci device.
> > > >
> > > > This series can boot Linux distros with the minic machine with or w=
ithout virtio
> > > > devices with out-of-tree Linux kernel patches[1]. Here is an exampl=
e commandline
> > > >
> > > > Without virtio devices (nvme, serial-pci & e1000e):
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > > > /scratch/workspace/qemu/build/qemu-system-riscv64 -cpu rv64 -M mini=
c -m 1G -smp 4 -nographic -nodefaults \
> > > > -display none -bios /scratch/workspace/opensbi/build/platform/gener=
ic/firmware/fw_dynamic.elf \
> > > > -kernel /scratch/workspace/linux/arch/riscv/boot/Image \
> > > > -chardev stdio,mux=3Don,signal=3Doff,id=3Dcharconsole0 \
> > > > -mon chardev=3Dcharconsole0,mode=3Dreadline \
> > > > -device pci-serial,msi=3Dtrue,chardev=3Dcharconsole0 \
> > > > -drive id=3Ddisk3,file=3D/scratch/workspace/rootfs_images//fedora/F=
edora-Developer-Rawhide-20211110.n.0-sda.raw,format=3Draw,if=3Dnone,id=3Ddr=
ive-system-disk,cache=3Dnone,format=3Draw \
> > > > -device nvme,serial=3Ddeadbeef,drive=3Ddisk3 \
> > > > -netdev user,id=3Dusernet,hostfwd=3Dtcp::10000-:22 -device e1000e,n=
etdev=3Dusernet,bus=3Dpcie.0 \
> > > > -append 'root=3D/dev/nvme0n1p2 rw loglevel=3D8 memblock=3Ddebug con=
sole=3DttyS0 earlycon' -d in_asm -D log.txt -s
> > > >
> > > > With virtio devices (virtio-scsi-pci, serial-pci & virtio-net-pci)
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > /scratch/workspace/qemu/build/qemu-system-riscv64 -cpu rv64 -M mini=
c -m 1G -smp 4 -nographic -nodefaults \
> > > > -display none -bios /scratch/workspace/opensbi/build/platform/gener=
ic/firmware/fw_dynamic.elf \
> > > > -kernel /scratch/workspace/linux/arch/riscv/boot/Image \
> > > > -chardev stdio,mux=3Don,signal=3Doff,id=3Dcharconsole0 \
> > > > -mon chardev=3Dcharconsole0,mode=3Dreadline \
> > > > -device pci-serial,msi=3Dtrue,chardev=3Dcharconsole0 \
> > > > -drive file=3D/scratch/workspace/rootfs_images//fedora/Fedora-Devel=
oper-Rawhide-20211110.n.0-sda.raw,format=3Draw,if=3Dnone,id=3Ddrive-system-=
disk,cache=3Dnone \
> > > > -device virtio-scsi-pci,id=3Dscsi0 -device scsi-hd,bus=3Dscsi0.0,dr=
ive=3Ddrive-system-disk,id=3Dsystem-disk,bootindex=3D1 \
> > > > -netdev user,id=3Dn1,hostfwd=3Dtcp::10000-:22 -device virtio-net-pc=
i,netdev=3Dn1 \
> > > > -append 'root=3D/dev/sda2 rw loglevel=3D8 memblock=3Ddebug console=
=3DttyS0 earlycon'
> > > >
> > > > The objective of this series is to engage the community to solve th=
is problem.
> > > > Please suggest if you have another alternatve solution.
> > > >
> > > > [1] https://github.com/atishp04/linux/tree/msi_only_console
> > > >
> > > > Atish Patra (3):
> > > > serial: Enable MSI capablity and option
> > > > hw/riscv: virt: Move common functions to a separate helper file
> > > > hw/riscv: Create a new qemu machine for RISC-V
> > > >
> > > > configs/devices/riscv64-softmmu/default.mak |   1 +
> > > > hw/char/serial-pci.c                        |  36 +-
> > > > hw/riscv/Kconfig                            |  11 +
> > > > hw/riscv/machine_helper.c                   | 417 +++++++++++++++++=
++
> > > > hw/riscv/meson.build                        |   2 +
> > > > hw/riscv/minic.c                            | 438 +++++++++++++++++=
+++
> > > > hw/riscv/virt.c                             | 403 ++---------------=
-
> > > > include/hw/riscv/machine_helper.h           |  87 ++++
> > > > include/hw/riscv/minic.h                    |  65 +++
> > > > include/hw/riscv/virt.h                     |  13 -
> > > > 10 files changed, 1090 insertions(+), 383 deletions(-)
> > > > create mode 100644 hw/riscv/machine_helper.c
> > > > create mode 100644 hw/riscv/minic.c
> > > > create mode 100644 include/hw/riscv/machine_helper.h
> > > > create mode 100644 include/hw/riscv/minic.h
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > > >
> > >
> > > With regards,
> > > Daniel
> > > --
> > > |: https://berrange.com      -o-    https://www.flickr.com/photos/dbe=
rrange :|
> > > |: https://libvirt.org         -o-            https://fstop138.berran=
ge.com :|
> > > |: https://entangle-photo.org    -o-    https://www.instagram.com/dbe=
rrange :|
> > >
> > >
> >
> >
> > --
> > Regards,
> > Atish
>
>
>
> --
> Regards,
> Atish
>

