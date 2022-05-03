Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nlmrk-0005vg-Vo
	for mharc-qemu-riscv@gnu.org; Tue, 03 May 2022 03:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nlmra-0005ss-EZ
 for qemu-riscv@nongnu.org; Tue, 03 May 2022 03:22:29 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:45881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nlmrX-00029l-Sn
 for qemu-riscv@nongnu.org; Tue, 03 May 2022 03:22:25 -0400
Received: by mail-yb1-xb32.google.com with SMTP id v59so29669852ybi.12
 for <qemu-riscv@nongnu.org>; Tue, 03 May 2022 00:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MdoD5FIzDK+GyWTUyU01nSKHv1PSukoUcIhp+HRsIK8=;
 b=hjqWq2uvRJvoNbqq1/R/GEUZ+3RgbNWo+vkBvhDFewuovAmoJFYPZsvK2pd7v7KX3u
 P5+gKjURSvaHrXgxzq80WQD8Zei4SMwQ/IniNjz6JF9Ai4SKA6jPnSKg7WrricF787rk
 6snfbIqkfMStd+saAwd/HE2kgKoRn867vOCB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MdoD5FIzDK+GyWTUyU01nSKHv1PSukoUcIhp+HRsIK8=;
 b=xRty30uwK2PJahGfiHXsA0rvm/mzLpcPItb7BBAK7suGF1BynD5ll3ZYX9RQjNSud/
 Xz4qRPSqMccWj7d/mkHCbvm/YhKKBYWa5nZ348IEeyHtoELHPbQJrrFLb4phbKBrM+sQ
 lLY/xLyP2MfERTvIrMJs6ZCVqorm90K/s8J8dBnz+pLGlXlQTFKAv0qvJMNjM+nFU0Le
 tuqzB7HcJXAnNn7P+LJRXN7XG2bhFqDMOMRe31QTrpV4E71Aw/eafzR6TgnMXv17PjIU
 fJN1BdBEKPHa0pWahWuN4a5Ang2x73vTGCt5F9L4786Ah/e+nWyBTVRDaSkbShLaFjQQ
 ogew==
X-Gm-Message-State: AOAM5320NYGSkBo/oNyoWiy4VOrzhtFXFQbCW6MrOcTZzm4lFT+g3MQE
 o6LnkCmAG/Q2oqU94aTacHi05+f6Uz3lNvGQqqFz
X-Google-Smtp-Source: ABdhPJxgDbZdx94pbaCDxb7h/ghviP9+2q298R2YkBm+lP68XZs1jTJSDxAQyZ8uh/lyiIwz3G0CVjOEFFm4YfP3TNo=
X-Received: by 2002:a25:d6d6:0:b0:645:de57:8058 with SMTP id
 n205-20020a25d6d6000000b00645de578058mr12955763ybg.69.1651562542395; Tue, 03
 May 2022 00:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220412021009.582424-1-atishp@rivosinc.com>
 <Yl7oiF7kUrIQ0qk5@redhat.com>
 <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
In-Reply-To: <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 May 2022 00:22:11 -0700
Message-ID: <CAOnJCUK9_qzOLr3GVdFTP95rs3avNE=7E2R27dADkMMsOhnGEQ@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb32.google.com
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
X-List-Received-Date: Tue, 03 May 2022 07:22:31 -0000

On Tue, Apr 19, 2022 at 5:26 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Apr 19, 2022 at 9:51 AM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> >
> > On Mon, Apr 11, 2022 at 07:10:06PM -0700, Atish Patra wrote:
> > >
> > > The RISC-V virt machine has helped RISC-V software eco system to evol=
ve at a
> > > rapid pace even in absense of the real hardware. It is definitely com=
mendable.
> > > However, the number of devices & commandline options keeps growing as=
 a result
> > > of that as well. That adds flexibility but will also become bit diffi=
cult
> > > to manage in the future as more extension support will be added. As i=
t is the
> > > most commonly used qemu machine, it needs to support all kinds of dev=
ice and
> > > interrupts as well. Moreover, virt machine has limitations on the max=
imum
> > > number of harts it can support because of all the MMIO devices it has=
 to support.
> > >
> > > The RISC-V IMSIC specification allows to develop machines completely =
relying
> > > on MSI and don't care about the wired interrupts at all. It just requ=
ires
> > > all the devices to be present behind a PCI bus or present themselves =
as platform
> > > MSI device. The former is a more common scenario in x86 world where m=
ost
> > > of the devices are behind PCI bus. As there is very limited MMIO devi=
ce
> > > support, it can also scale to very large number of harts.
> > >
> > > That's why, this patch series introduces a minimalistic yet very exte=
nsible
> > > forward looking machine called as "RISC-V Mini Computer" or "minic". =
The
> > > idea is to build PC or server like systems with this machine. The mac=
hine can
> > > work with or without virtio framework. The current implementation onl=
y
> > > supports RV64. I am not sure if building a RV32 machine would be of i=
nterest
> > > for such machines. The only mmio device it requires is clint to emula=
te
> > > the mtimecmp.
> >

Any other thoughts ?

> > I would ask what you see as the long term future usage for 'virt' vs
> > 'minic' machine types ? Would you expect all existing users of 'virt'
> > to ultimately switch to 'minic', or are there distinct non-overlapping
> > use cases for 'virt' vs 'minic' such that both end up widely used ?
> >
>
> Nope. I don't expect existing 'virt' users to switch to 'minic' as
> they aim to cater to different users.
>
> Here are the major differences
> 1. virt machine supports MMIO devices & wired interrupts. Minic doesn't
> 2. virt machine doesn't support the MSI only option yet (can be added
> though[1]). Minic does.
> 3. Number of cpu supported by virt machine are limited because of the
> MMIO devices. Minic can scale to very
> large numbers of cpu.
> 4. 'Minic' only supports PCI based MSI capable devices. Thus, MSI is a
> mandatory requirement for 'minic' while
> it is optional for 'virt'.
>
> 'Minic' aims towards the users who want to create virtual machines
> that are MSI based and don't care about
> a million options that virt machines provide.  Virt machine is more
> complex so that it can be flexible in terms of
> what it supports. Minic is a minimalistic machine which doesn't need
> to be expanded a lot in the future given that
> most of the devices can be behind PCI.
>
> [1] https://github.com/atishp04/qemu/tree/virt_imsic_only
>
> > Is 'minic' intended to be able to mimic real physical hardware at all,
> > or is it still intended as a purely virtual machine, like a 'virt-ng' ?
> >
>
> Any future hardware that relies only on PCI-MSI based devices, they
> can be created on top of minic.
> At that point, minic will provide a useful abstract for all those
> machines as well. minic doesn't need a virtio framework.
> Thus, it can closely emulate such hardware as well.
>
> > Essentially 'virt' was positioned as the standard machine to use if
> > you want to run a virtual machine, without any particular match to
> > physical hardware. It feels like 'minic' is creating a second machine
> > type to fill the same purpose, so how do users decide which to use ?
> >
>
> I envision 'minic' to be a standard machine for a specific set of user
> requirements (x86 style PCI based
> machines). Virt machine will continue to be a standard machine for
> more generic use cases with MMIO devices.
>
> > > "Naming is hard". I am not too attached with the name "minic".
> > > I just chose least bad one out of the few on my mind :). I am definit=
ely
> > > open to any other name as well.
> > >
> > > The other alternative to provide MSI only option to aia in the
> > > existing virt machine to build MSI only machines. This is certainly d=
oable
> > > and here is the patch that supports that kind of setup.
> > >
> > > https://github.com/atishp04/qemu/tree/virt_imsic_only
> > >
> > > However, it even complicates the virt machine even further with addit=
ional
> > > command line option, branches in the code. I believe virt machine wil=
l become
> > > very complex if we continue this path. I am interested to learn what =
everyone
> > > else think.
> > >
> > > It is needless to say that the current version of minic machine
> > > is inspired from virt machine and tries to reuse as much as code poss=
ible.
> > > The first patch in this series adds MSI support for serial-pci device=
 so
> > > console can work on such a machine. The 2nd patch moves some common f=
unctions
> > > between minic and the virt machine to a helper file. The PATCH3 actua=
lly
> > > implements the new minic machine.
> > >
> > > I have not added the fw-cfg/flash support. We probably should add tho=
se
> > > but I just wanted to start small and get the feedback first.
> > > This is a work in progress and have few more TODO items before becomi=
ng the
> > > new world order :)
> > >
> > > 1. OpenSBI doesn't have PCI support. Thus, no console support for Ope=
nSBI
> > > for now.
> > > 2. The ns16550 driver in OpenSBI also need to support MSI/MSI-X.
> > > 3. Add MSI-X support for serial-pci device.
> > >
> > > This series can boot Linux distros with the minic machine with or wit=
hout virtio
> > > devices with out-of-tree Linux kernel patches[1]. Here is an example =
commandline
> > >
> > > Without virtio devices (nvme, serial-pci & e1000e):
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > /scratch/workspace/qemu/build/qemu-system-riscv64 -cpu rv64 -M minic =
-m 1G -smp 4 -nographic -nodefaults \
> > > -display none -bios /scratch/workspace/opensbi/build/platform/generic=
/firmware/fw_dynamic.elf \
> > > -kernel /scratch/workspace/linux/arch/riscv/boot/Image \
> > > -chardev stdio,mux=3Don,signal=3Doff,id=3Dcharconsole0 \
> > > -mon chardev=3Dcharconsole0,mode=3Dreadline \
> > > -device pci-serial,msi=3Dtrue,chardev=3Dcharconsole0 \
> > > -drive id=3Ddisk3,file=3D/scratch/workspace/rootfs_images//fedora/Fed=
ora-Developer-Rawhide-20211110.n.0-sda.raw,format=3Draw,if=3Dnone,id=3Ddriv=
e-system-disk,cache=3Dnone,format=3Draw \
> > > -device nvme,serial=3Ddeadbeef,drive=3Ddisk3 \
> > > -netdev user,id=3Dusernet,hostfwd=3Dtcp::10000-:22 -device e1000e,net=
dev=3Dusernet,bus=3Dpcie.0 \
> > > -append 'root=3D/dev/nvme0n1p2 rw loglevel=3D8 memblock=3Ddebug conso=
le=3DttyS0 earlycon' -d in_asm -D log.txt -s
> > >
> > > With virtio devices (virtio-scsi-pci, serial-pci & virtio-net-pci)
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > /scratch/workspace/qemu/build/qemu-system-riscv64 -cpu rv64 -M minic =
-m 1G -smp 4 -nographic -nodefaults \
> > > -display none -bios /scratch/workspace/opensbi/build/platform/generic=
/firmware/fw_dynamic.elf \
> > > -kernel /scratch/workspace/linux/arch/riscv/boot/Image \
> > > -chardev stdio,mux=3Don,signal=3Doff,id=3Dcharconsole0 \
> > > -mon chardev=3Dcharconsole0,mode=3Dreadline \
> > > -device pci-serial,msi=3Dtrue,chardev=3Dcharconsole0 \
> > > -drive file=3D/scratch/workspace/rootfs_images//fedora/Fedora-Develop=
er-Rawhide-20211110.n.0-sda.raw,format=3Draw,if=3Dnone,id=3Ddrive-system-di=
sk,cache=3Dnone \
> > > -device virtio-scsi-pci,id=3Dscsi0 -device scsi-hd,bus=3Dscsi0.0,driv=
e=3Ddrive-system-disk,id=3Dsystem-disk,bootindex=3D1 \
> > > -netdev user,id=3Dn1,hostfwd=3Dtcp::10000-:22 -device virtio-net-pci,=
netdev=3Dn1 \
> > > -append 'root=3D/dev/sda2 rw loglevel=3D8 memblock=3Ddebug console=3D=
ttyS0 earlycon'
> > >
> > > The objective of this series is to engage the community to solve this=
 problem.
> > > Please suggest if you have another alternatve solution.
> > >
> > > [1] https://github.com/atishp04/linux/tree/msi_only_console
> > >
> > > Atish Patra (3):
> > > serial: Enable MSI capablity and option
> > > hw/riscv: virt: Move common functions to a separate helper file
> > > hw/riscv: Create a new qemu machine for RISC-V
> > >
> > > configs/devices/riscv64-softmmu/default.mak |   1 +
> > > hw/char/serial-pci.c                        |  36 +-
> > > hw/riscv/Kconfig                            |  11 +
> > > hw/riscv/machine_helper.c                   | 417 +++++++++++++++++++
> > > hw/riscv/meson.build                        |   2 +
> > > hw/riscv/minic.c                            | 438 +++++++++++++++++++=
+
> > > hw/riscv/virt.c                             | 403 ++----------------
> > > include/hw/riscv/machine_helper.h           |  87 ++++
> > > include/hw/riscv/minic.h                    |  65 +++
> > > include/hw/riscv/virt.h                     |  13 -
> > > 10 files changed, 1090 insertions(+), 383 deletions(-)
> > > create mode 100644 hw/riscv/machine_helper.c
> > > create mode 100644 hw/riscv/minic.c
> > > create mode 100644 include/hw/riscv/machine_helper.h
> > > create mode 100644 include/hw/riscv/minic.h
> > >
> > > --
> > > 2.25.1
> > >
> > >
> >
> > With regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
> >
> >
>
>
> --
> Regards,
> Atish



--=20
Regards,
Atish

