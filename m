Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngr4g-0008MG-I5
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 12:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngr4f-0008Lt-85
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 12:51:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngr4c-0001Xx-Je
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 12:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650387090;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zBCOCZQgiMLLDxlC4rA2vN0Dk4Od1oV+ARld4Fb1mq8=;
 b=dj+Y1cfAi5s5nn4MRdj4JVO96uYQZ2XqrcusBuqMC5FDpiggJIPhzgBzRicBSma5YzUzzI
 iUzKz4YOPkgxWg47Wjf/v/UYWi6E8fGqSTLVbFGmEXrjOXpx+bxTPOOpmw6/fAFH08VdD2
 pJOa/0LOAyQ4O55+NSyicXr5tDwiEJY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-MVR-lL6XOzmKdQOMhyiL6w-1; Tue, 19 Apr 2022 12:51:27 -0400
X-MC-Unique: MVR-lL6XOzmKdQOMhyiL6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71212833964;
 Tue, 19 Apr 2022 16:51:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBAAD145B97F;
 Tue, 19 Apr 2022 16:51:24 +0000 (UTC)
Date: Tue, 19 Apr 2022 17:51:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
Message-ID: <Yl7oiF7kUrIQ0qk5@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220412021009.582424-1-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20220412021009.582424-1-atishp@rivosinc.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 19 Apr 2022 16:51:33 -0000

On Mon, Apr 11, 2022 at 07:10:06PM -0700, Atish Patra wrote:
> 
> The RISC-V virt machine has helped RISC-V software eco system to evolve at a
> rapid pace even in absense of the real hardware. It is definitely commendable.
> However, the number of devices & commandline options keeps growing as a result
> of that as well. That adds flexibility but will also become bit difficult
> to manage in the future as more extension support will be added. As it is the
> most commonly used qemu machine, it needs to support all kinds of device and
> interrupts as well. Moreover, virt machine has limitations on the maximum
> number of harts it can support because of all the MMIO devices it has to support.
> 
> The RISC-V IMSIC specification allows to develop machines completely relying
> on MSI and don't care about the wired interrupts at all. It just requires
> all the devices to be present behind a PCI bus or present themselves as platform
> MSI device. The former is a more common scenario in x86 world where most
> of the devices are behind PCI bus. As there is very limited MMIO device
> support, it can also scale to very large number of harts.
> 
> That's why, this patch series introduces a minimalistic yet very extensible
> forward looking machine called as "RISC-V Mini Computer" or "minic". The
> idea is to build PC or server like systems with this machine. The machine can
> work with or without virtio framework. The current implementation only
> supports RV64. I am not sure if building a RV32 machine would be of interest
> for such machines. The only mmio device it requires is clint to emulate
> the mtimecmp.

I would ask what you see as the long term future usage for 'virt' vs
'minic' machine types ? Would you expect all existing users of 'virt'
to ultimately switch to 'minic', or are there distinct non-overlapping
use cases for 'virt' vs 'minic' such that both end up widely used ?

Is 'minic' intended to be able to mimic real physical hardware at all,
or is it still intended as a purely virtual machine, like a 'virt-ng' ?

Essentially 'virt' was positioned as the standard machine to use if
you want to run a virtual machine, without any particular match to
physical hardware. It feels like 'minic' is creating a second machine
type to fill the same purpose, so how do users decide which to use ? 

> "Naming is hard". I am not too attached with the name "minic". 
> I just chose least bad one out of the few on my mind :). I am definitely
> open to any other name as well. 
> 
> The other alternative to provide MSI only option to aia in the 
> existing virt machine to build MSI only machines. This is certainly doable
> and here is the patch that supports that kind of setup.
> 
> https://github.com/atishp04/qemu/tree/virt_imsic_only
> 
> However, it even complicates the virt machine even further with additional
> command line option, branches in the code. I believe virt machine will become
> very complex if we continue this path. I am interested to learn what everyone
> else think.
> 
> It is needless to say that the current version of minic machine
> is inspired from virt machine and tries to reuse as much as code possible.
> The first patch in this series adds MSI support for serial-pci device so
> console can work on such a machine. The 2nd patch moves some common functions
> between minic and the virt machine to a helper file. The PATCH3 actually
> implements the new minic machine.
> 
> I have not added the fw-cfg/flash support. We probably should add those
> but I just wanted to start small and get the feedback first.
> This is a work in progress and have few more TODO items before becoming the
> new world order :)
> 
> 1. OpenSBI doesn't have PCI support. Thus, no console support for OpenSBI
> for now.
> 2. The ns16550 driver in OpenSBI also need to support MSI/MSI-X.
> 3. Add MSI-X support for serial-pci device.
> 
> This series can boot Linux distros with the minic machine with or without virtio
> devices with out-of-tree Linux kernel patches[1]. Here is an example commandline 
> 
> Without virtio devices (nvme, serial-pci & e1000e):
> =====================================================
> /scratch/workspace/qemu/build/qemu-system-riscv64 -cpu rv64 -M minic -m 1G -smp 4 -nographic -nodefaults \
> -display none -bios /scratch/workspace/opensbi/build/platform/generic/firmware/fw_dynamic.elf \
> -kernel /scratch/workspace/linux/arch/riscv/boot/Image \
> -chardev stdio,mux=on,signal=off,id=charconsole0 \
> -mon chardev=charconsole0,mode=readline \
> -device pci-serial,msi=true,chardev=charconsole0 \
> -drive id=disk3,file=/scratch/workspace/rootfs_images//fedora/Fedora-Developer-Rawhide-20211110.n.0-sda.raw,format=raw,if=none,id=drive-system-disk,cache=none,format=raw \
> -device nvme,serial=deadbeef,drive=disk3 \
> -netdev user,id=usernet,hostfwd=tcp::10000-:22 -device e1000e,netdev=usernet,bus=pcie.0 \
> -append 'root=/dev/nvme0n1p2 rw loglevel=8 memblock=debug console=ttyS0 earlycon' -d in_asm -D log.txt -s
> 
> With virtio devices (virtio-scsi-pci, serial-pci & virtio-net-pci)
> ==================================================================
> /scratch/workspace/qemu/build/qemu-system-riscv64 -cpu rv64 -M minic -m 1G -smp 4 -nographic -nodefaults \
> -display none -bios /scratch/workspace/opensbi/build/platform/generic/firmware/fw_dynamic.elf \
> -kernel /scratch/workspace/linux/arch/riscv/boot/Image \
> -chardev stdio,mux=on,signal=off,id=charconsole0 \
> -mon chardev=charconsole0,mode=readline \
> -device pci-serial,msi=true,chardev=charconsole0 \
> -drive file=/scratch/workspace/rootfs_images//fedora/Fedora-Developer-Rawhide-20211110.n.0-sda.raw,format=raw,if=none,id=drive-system-disk,cache=none \
> -device virtio-scsi-pci,id=scsi0 -device scsi-hd,bus=scsi0.0,drive=drive-system-disk,id=system-disk,bootindex=1 \
> -netdev user,id=n1,hostfwd=tcp::10000-:22 -device virtio-net-pci,netdev=n1 \
> -append 'root=/dev/sda2 rw loglevel=8 memblock=debug console=ttyS0 earlycon'
> 
> The objective of this series is to engage the community to solve this problem.
> Please suggest if you have another alternatve solution.
> 
> [1] https://github.com/atishp04/linux/tree/msi_only_console 
> 
> Atish Patra (3):
> serial: Enable MSI capablity and option
> hw/riscv: virt: Move common functions to a separate helper file
> hw/riscv: Create a new qemu machine for RISC-V
> 
> configs/devices/riscv64-softmmu/default.mak |   1 +
> hw/char/serial-pci.c                        |  36 +-
> hw/riscv/Kconfig                            |  11 +
> hw/riscv/machine_helper.c                   | 417 +++++++++++++++++++
> hw/riscv/meson.build                        |   2 +
> hw/riscv/minic.c                            | 438 ++++++++++++++++++++
> hw/riscv/virt.c                             | 403 ++----------------
> include/hw/riscv/machine_helper.h           |  87 ++++
> include/hw/riscv/minic.h                    |  65 +++
> include/hw/riscv/virt.h                     |  13 -
> 10 files changed, 1090 insertions(+), 383 deletions(-)
> create mode 100644 hw/riscv/machine_helper.c
> create mode 100644 hw/riscv/minic.c
> create mode 100644 include/hw/riscv/machine_helper.h
> create mode 100644 include/hw/riscv/minic.h
> 
> --
> 2.25.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


