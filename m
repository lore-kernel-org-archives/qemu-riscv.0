Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmj2h-00010o-4b
	for mharc-qemu-riscv@gnu.org; Thu, 05 May 2022 17:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nmj2f-00010S-TS
 for qemu-riscv@nongnu.org; Thu, 05 May 2022 17:29:45 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:40621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nmj2d-00032e-8t
 for qemu-riscv@nongnu.org; Thu, 05 May 2022 17:29:45 -0400
Received: by mail-lj1-x22d.google.com with SMTP id l19so7159955ljb.7
 for <qemu-riscv@nongnu.org>; Thu, 05 May 2022 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qGceYjKLrJEs2cWNnjqTn/lKnftHIRemQBauMw4RZIY=;
 b=5X4/lAeyH/4pyp2FzQiPMwZrUvRqDGdS4D2eH4m6HjjpSyF/MgL4f7YawrDVBiEg+Q
 wQdvPto4Lmy30UpaXTAlP8TYtAvfplKHpPRCUAi3p0JfNN8vR79zi3xN5ZhYEBezrOSH
 85WYswJxieu7vZlB2E2lBRQb9b/CQq67I3WDOL5HlDaKvkOW/6M/IkXaSXOim/8lZfGG
 65SZJhZ0B6OoFRtOjIke2oDOYSt9WWz+O3oWgVyZ9TVhdWjEOYDWDPCbgLpsqrOkdUP+
 Fp/6v4axaDNOqCx0KlQqTWfjRi+XYLQ07siW/FLNcP4cP7QOFDNb+2qwAiY9gdpeLn1Y
 19yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qGceYjKLrJEs2cWNnjqTn/lKnftHIRemQBauMw4RZIY=;
 b=0rJ64PWRTfmo18NlAPraVxvMeiOX4xfx/C3k+tuYYzOhUOd2JBikW0VjYPoot44i41
 ZUv0jRfEbg35ziYF+K6h8c/gM1Tqml2rK1n7lD+raneVDV6Oj/uVMCmZJSNmkqcxmLiq
 TDGVZw18fcLIctkY662fIqFPsQa7Q/eJ+vp75VHMLrIsmhgub4GyC5W75YTJQnKDmA9A
 ytiOFP7F6ZzNjTFixQjFkST0QCeAxtmMwbv72kJAUfmtIOlV2eXiPrVFJYhIEnzySPye
 sasLPPdNjIH/D9w9lcNCfCqGBgLZV2i+zl/ZQZ9gMuIbP8y64TPbxXza8TPzMq1Q7SxB
 Nurg==
X-Gm-Message-State: AOAM5311cUWjJwc9vResxk60aJc6QZHdIsnt3+AQsm0Pw351MmHvI8fu
 +9F82z1/UACQCIgeXndFoeeGhoVWk1Kzv41nRcsOAw==
X-Google-Smtp-Source: ABdhPJyTZDTFhUkuL3wqzpEl44xxOuS1tqoyHlmlog+nVH6J5vZWyUsJfnnb192i/THZTGQiR3wwrp7SAs/waNERFfs=
X-Received: by 2002:a05:651c:54a:b0:250:5b67:b7b6 with SMTP id
 q10-20020a05651c054a00b002505b67b7b6mr22321ljp.305.1651786180768; Thu, 05 May
 2022 14:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220412021009.582424-1-atishp@rivosinc.com>
 <Yl7oiF7kUrIQ0qk5@redhat.com>
 <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
 <CAOnJCUK9_qzOLr3GVdFTP95rs3avNE=7E2R27dADkMMsOhnGEQ@mail.gmail.com>
 <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 5 May 2022 14:29:29 -0700
Message-ID: <CAHBxVyE3nyQi38bcu-5pJDGaP=K0jBW7iTpc84thVWc-8UKShQ@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: Alistair Francis <alistair23@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=atishp@rivosinc.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 05 May 2022 21:29:46 -0000

On Thu, May 5, 2022 at 2:37 AM Alistair Francis <alistair23@gmail.com> wrot=
e:
>
> On Tue, May 3, 2022 at 5:57 PM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Tue, Apr 19, 2022 at 5:26 PM Atish Patra <atishp@atishpatra.org> wro=
te:
> > >
> > > On Tue, Apr 19, 2022 at 9:51 AM Daniel P. Berrang=C3=A9 <berrange@red=
hat.com> wrote:
> > > >
> > > > On Mon, Apr 11, 2022 at 07:10:06PM -0700, Atish Patra wrote:
> > > > >
> > > > > The RISC-V virt machine has helped RISC-V software eco system to =
evolve at a
> > > > > rapid pace even in absense of the real hardware. It is definitely=
 commendable.
> > > > > However, the number of devices & commandline options keeps growin=
g as a result
> > > > > of that as well. That adds flexibility but will also become bit d=
ifficult
> > > > > to manage in the future as more extension support will be added. =
As it is the
> > > > > most commonly used qemu machine, it needs to support all kinds of=
 device and
> > > > > interrupts as well. Moreover, virt machine has limitations on the=
 maximum
> > > > > number of harts it can support because of all the MMIO devices it=
 has to support.
> > > > >
> > > > > The RISC-V IMSIC specification allows to develop machines complet=
ely relying
> > > > > on MSI and don't care about the wired interrupts at all. It just =
requires
> > > > > all the devices to be present behind a PCI bus or present themsel=
ves as platform
> > > > > MSI device. The former is a more common scenario in x86 world whe=
re most
> > > > > of the devices are behind PCI bus. As there is very limited MMIO =
device
> > > > > support, it can also scale to very large number of harts.
> > > > >
> > > > > That's why, this patch series introduces a minimalistic yet very =
extensible
> > > > > forward looking machine called as "RISC-V Mini Computer" or "mini=
c". The
> > > > > idea is to build PC or server like systems with this machine. The=
 machine can
> > > > > work with or without virtio framework. The current implementation=
 only
> > > > > supports RV64. I am not sure if building a RV32 machine would be =
of interest
> > > > > for such machines. The only mmio device it requires is clint to e=
mulate
> > > > > the mtimecmp.
> > > >
> >
> > Any other thoughts ?
>
> I don't *love* this idea. I think the virt machine is useful, but I'm
> not convinced we need a second one.
>
> This feels a little bit more like a "none" machine, as it contains
> just the bare minimum to work.
>

Ha ha :). That was the whole point. To create a minimal machine that
is easy to maintain and emulate platforms in the real world.

> >
> > > > I would ask what you see as the long term future usage for 'virt' v=
s
> > > > 'minic' machine types ? Would you expect all existing users of 'vir=
t'
> > > > to ultimately switch to 'minic', or are there distinct non-overlapp=
ing
> > > > use cases for 'virt' vs 'minic' such that both end up widely used ?
> > > >
> > >
> > > Nope. I don't expect existing 'virt' users to switch to 'minic' as
> > > they aim to cater to different users.
> > >
> > > Here are the major differences
> > > 1. virt machine supports MMIO devices & wired interrupts. Minic doesn=
't
>
> This seems like the main difference
>
> > > 2. virt machine doesn't support the MSI only option yet (can be added
> > > though[1]). Minic does.
>
> This could be fixed
>
> > > 3. Number of cpu supported by virt machine are limited because of the
> > > MMIO devices. Minic can scale to very
> > > large numbers of cpu.
>
> Similar to 1
>

Yes. I already had the patch to fix that in the virt machine in the
cover letter.
I did not send it to the mailing list to avoid confusion.

> > > 4. 'Minic' only supports PCI based MSI capable devices. Thus, MSI is =
a
> > > mandatory requirement for 'minic' while
> > > it is optional for 'virt'.
>
> I'm not fully convinced we need this, but it also doesn't seem to cost
> us a lot in terms of maintenance. It would be beneficial if we could
> share a bit more of the code. Can we share the socket creation code as
> well?
>

Yeah. We can move the socket creation to the common code as well.
There are few others small ones (virt_set/get_aia_guests) can be moved
to common code.

In the future, real world hpc machines may just build their machine
on top of this machine instead of developing from scratch if we allow
some configurability
(e.g memory map, machine name, max cpus etc.)

> I don't like the name minic though. What about something like
> `virt-hpc`, `virt-pcie-minimal` or something like that? That way we
> indicate it's still a virt board
>

Fair enough. I can rename it to virt-hpc or something similar.

> Alistair
>
> > >
> > > 'Minic' aims towards the users who want to create virtual machines
> > > that are MSI based and don't care about
> > > a million options that virt machines provide.  Virt machine is more
> > > complex so that it can be flexible in terms of
> > > what it supports. Minic is a minimalistic machine which doesn't need
> > > to be expanded a lot in the future given that
> > > most of the devices can be behind PCI.
> > >
> > > [1] https://github.com/atishp04/qemu/tree/virt_imsic_only
> > >
> > > > Is 'minic' intended to be able to mimic real physical hardware at a=
ll,
> > > > or is it still intended as a purely virtual machine, like a 'virt-n=
g' ?
> > > >
> > >
> > > Any future hardware that relies only on PCI-MSI based devices, they
> > > can be created on top of minic.
> > > At that point, minic will provide a useful abstract for all those
> > > machines as well. minic doesn't need a virtio framework.
> > > Thus, it can closely emulate such hardware as well.
> > >
> > > > Essentially 'virt' was positioned as the standard machine to use if
> > > > you want to run a virtual machine, without any particular match to
> > > > physical hardware. It feels like 'minic' is creating a second machi=
ne
> > > > type to fill the same purpose, so how do users decide which to use =
?
> > > >
> > >
> > > I envision 'minic' to be a standard machine for a specific set of use=
r
> > > requirements (x86 style PCI based
> > > machines). Virt machine will continue to be a standard machine for
> > > more generic use cases with MMIO devices.
> > >
> > > > > "Naming is hard". I am not too attached with the name "minic".
> > > > > I just chose least bad one out of the few on my mind :). I am def=
initely
> > > > > open to any other name as well.
> > > > >
> > > > > The other alternative to provide MSI only option to aia in the
> > > > > existing virt machine to build MSI only machines. This is certain=
ly doable
> > > > > and here is the patch that supports that kind of setup.
> > > > >
> > > > > https://github.com/atishp04/qemu/tree/virt_imsic_only
> > > > >
> > > > > However, it even complicates the virt machine even further with a=
dditional
> > > > > command line option, branches in the code. I believe virt machine=
 will become
> > > > > very complex if we continue this path. I am interested to learn w=
hat everyone
> > > > > else think.
> > > > >
> > > > > It is needless to say that the current version of minic machine
> > > > > is inspired from virt machine and tries to reuse as much as code =
possible.
> > > > > The first patch in this series adds MSI support for serial-pci de=
vice so
> > > > > console can work on such a machine. The 2nd patch moves some comm=
on functions
> > > > > between minic and the virt machine to a helper file. The PATCH3 a=
ctually
> > > > > implements the new minic machine.
> > > > >
> > > > > I have not added the fw-cfg/flash support. We probably should add=
 those
> > > > > but I just wanted to start small and get the feedback first.
> > > > > This is a work in progress and have few more TODO items before be=
coming the
> > > > > new world order :)
> > > > >
> > > > > 1. OpenSBI doesn't have PCI support. Thus, no console support for=
 OpenSBI
> > > > > for now.
> > > > > 2. The ns16550 driver in OpenSBI also need to support MSI/MSI-X.
> > > > > 3. Add MSI-X support for serial-pci device.
> > > > >
> > > > > This series can boot Linux distros with the minic machine with or=
 without virtio
> > > > > devices with out-of-tree Linux kernel patches[1]. Here is an exam=
ple commandline
> > > > >
> > > > > Without virtio devices (nvme, serial-pci & e1000e):
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > > > > /scratch/workspace/qemu/build/qemu-system-riscv64 -cpu rv64 -M mi=
nic -m 1G -smp 4 -nographic -nodefaults \
> > > > > -display none -bios /scratch/workspace/opensbi/build/platform/gen=
eric/firmware/fw_dynamic.elf \
> > > > > -kernel /scratch/workspace/linux/arch/riscv/boot/Image \
> > > > > -chardev stdio,mux=3Don,signal=3Doff,id=3Dcharconsole0 \
> > > > > -mon chardev=3Dcharconsole0,mode=3Dreadline \
> > > > > -device pci-serial,msi=3Dtrue,chardev=3Dcharconsole0 \
> > > > > -drive id=3Ddisk3,file=3D/scratch/workspace/rootfs_images//fedora=
/Fedora-Developer-Rawhide-20211110.n.0-sda.raw,format=3Draw,if=3Dnone,id=3D=
drive-system-disk,cache=3Dnone,format=3Draw \
> > > > > -device nvme,serial=3Ddeadbeef,drive=3Ddisk3 \
> > > > > -netdev user,id=3Dusernet,hostfwd=3Dtcp::10000-:22 -device e1000e=
,netdev=3Dusernet,bus=3Dpcie.0 \
> > > > > -append 'root=3D/dev/nvme0n1p2 rw loglevel=3D8 memblock=3Ddebug c=
onsole=3DttyS0 earlycon' -d in_asm -D log.txt -s
> > > > >
> > > > > With virtio devices (virtio-scsi-pci, serial-pci & virtio-net-pci=
)
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > /scratch/workspace/qemu/build/qemu-system-riscv64 -cpu rv64 -M mi=
nic -m 1G -smp 4 -nographic -nodefaults \
> > > > > -display none -bios /scratch/workspace/opensbi/build/platform/gen=
eric/firmware/fw_dynamic.elf \
> > > > > -kernel /scratch/workspace/linux/arch/riscv/boot/Image \
> > > > > -chardev stdio,mux=3Don,signal=3Doff,id=3Dcharconsole0 \
> > > > > -mon chardev=3Dcharconsole0,mode=3Dreadline \
> > > > > -device pci-serial,msi=3Dtrue,chardev=3Dcharconsole0 \
> > > > > -drive file=3D/scratch/workspace/rootfs_images//fedora/Fedora-Dev=
eloper-Rawhide-20211110.n.0-sda.raw,format=3Draw,if=3Dnone,id=3Ddrive-syste=
m-disk,cache=3Dnone \
> > > > > -device virtio-scsi-pci,id=3Dscsi0 -device scsi-hd,bus=3Dscsi0.0,=
drive=3Ddrive-system-disk,id=3Dsystem-disk,bootindex=3D1 \
> > > > > -netdev user,id=3Dn1,hostfwd=3Dtcp::10000-:22 -device virtio-net-=
pci,netdev=3Dn1 \
> > > > > -append 'root=3D/dev/sda2 rw loglevel=3D8 memblock=3Ddebug consol=
e=3DttyS0 earlycon'
> > > > >
> > > > > The objective of this series is to engage the community to solve =
this problem.
> > > > > Please suggest if you have another alternatve solution.
> > > > >
> > > > > [1] https://github.com/atishp04/linux/tree/msi_only_console
> > > > >
> > > > > Atish Patra (3):
> > > > > serial: Enable MSI capablity and option
> > > > > hw/riscv: virt: Move common functions to a separate helper file
> > > > > hw/riscv: Create a new qemu machine for RISC-V
> > > > >
> > > > > configs/devices/riscv64-softmmu/default.mak |   1 +
> > > > > hw/char/serial-pci.c                        |  36 +-
> > > > > hw/riscv/Kconfig                            |  11 +
> > > > > hw/riscv/machine_helper.c                   | 417 +++++++++++++++=
++++
> > > > > hw/riscv/meson.build                        |   2 +
> > > > > hw/riscv/minic.c                            | 438 +++++++++++++++=
+++++
> > > > > hw/riscv/virt.c                             | 403 ++-------------=
---
> > > > > include/hw/riscv/machine_helper.h           |  87 ++++
> > > > > include/hw/riscv/minic.h                    |  65 +++
> > > > > include/hw/riscv/virt.h                     |  13 -
> > > > > 10 files changed, 1090 insertions(+), 383 deletions(-)
> > > > > create mode 100644 hw/riscv/machine_helper.c
> > > > > create mode 100644 hw/riscv/minic.c
> > > > > create mode 100644 include/hw/riscv/machine_helper.h
> > > > > create mode 100644 include/hw/riscv/minic.h
> > > > >
> > > > > --
> > > > > 2.25.1
> > > > >
> > > > >
> > > >
> > > > With regards,
> > > > Daniel
> > > > --
> > > > |: https://berrange.com      -o-    https://www.flickr.com/photos/d=
berrange :|
> > > > |: https://libvirt.org         -o-            https://fstop138.berr=
ange.com :|
> > > > |: https://entangle-photo.org    -o-    https://www.instagram.com/d=
berrange :|
> > > >
> > > >
> > >
> > >
> > > --
> > > Regards,
> > > Atish
> >
> >
> >
> > --
> > Regards,
> > Atish
> >

