Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ne5zP-0004Ap-5c
	for mharc-qemu-riscv@gnu.org; Mon, 11 Apr 2022 22:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ne5zA-0003yz-JJ
 for qemu-riscv@nongnu.org; Mon, 11 Apr 2022 22:10:30 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ne5z7-0001jG-Q8
 for qemu-riscv@nongnu.org; Mon, 11 Apr 2022 22:10:27 -0400
Received: by mail-pg1-x52b.google.com with SMTP id k14so15861207pga.0
 for <qemu-riscv@nongnu.org>; Mon, 11 Apr 2022 19:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Npk3exz2iXtan5EfgRJNpQEjKQrWwJUx7QHX//nqxOI=;
 b=ATQXGY5D0j+e3yY0omWgCSF95dEZFOTHc0WCSfzWgynWvR2qiCoTUwJF36zjz6llQj
 9EPpt77/HEFDTzF11fp5o/ca9oBAqkgIJpUdJLt2ENcUUCJ2PhmJgqm3fXDIPiGV5R9u
 4DXH7gzsNSBMJVoLKg3KdHXg38m5mz83+8fKRc4LUMGwUEh1Pdkk8kmZd8WebErPiMO1
 JznK9BGP/W1zGuSznBu6e/jMDijgPByStHwslVeD6h2Jsmc2Gw1d02K1ZGwu5swjXX67
 F7tJVel3emgHz4V4JYPFb3PNp8pTACRc3B5j0YanutvoG7K30DdX0VydeTnuFLxLtM1I
 V9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Npk3exz2iXtan5EfgRJNpQEjKQrWwJUx7QHX//nqxOI=;
 b=39mp7DZ9ohVJ82pFrhtPAe/fIOla/U8NO8COFU6M3Ykxe69gIRRBV8FjKTvwo8nYOe
 JEmyA/DmjQTZ1Kvz1XRNlm58cqwEU3UkNasRtQQbwn2qoOjCdCWbd4Erz7un2+W8IKN1
 137agnUMYy9Y7Vl9XFcoD4UE7wIrDNtFH7/tYwlz8f/iodYGVphw+mU7iNgvYxFMYYHt
 rzOGp2XT0NT3FSseGwLTafOaIdLRGTU+jqJzPT3fqsjrJGX7CoLKkndVnNWCn1fhVkFE
 zfPGkshpBnUENeWcGIoG9iKkn+6hnfVkNugRWpt4vhMV80+1xRNuPgk/c6R9dxfpUxWi
 izgQ==
X-Gm-Message-State: AOAM530v1MyUo9W/BD6MSabaDjH5Rd2uc8jqJrh5TJyf8AdFFbxjQosZ
 koprH2cyGJk1A0nSj6EV+5/wTw==
X-Google-Smtp-Source: ABdhPJz8MZLPqzqmBoU5ENh442/UPJXPUpg38OdXf1OyP6cbO8AHbmgC7ZlzqOxKc9hzxFDWY9xqtQ==
X-Received: by 2002:a05:6a00:4199:b0:505:7a19:c0d with SMTP id
 ca25-20020a056a00419900b005057a190c0dmr20271943pfb.49.1649729423883; 
 Mon, 11 Apr 2022 19:10:23 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a056a00158900b004faad3ae570sm37946504pfk.189.2022.04.11.19.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 19:10:23 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Subject: [RFC 0/3] Introduce a new Qemu machine for RISC-V
Date: Mon, 11 Apr 2022 19:10:06 -0700
Message-Id: <20220412021009.582424-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 12 Apr 2022 02:10:30 -0000


The RISC-V virt machine has helped RISC-V software eco system to evolve at a
rapid pace even in absense of the real hardware. It is definitely commendable.
However, the number of devices & commandline options keeps growing as a result
of that as well. That adds flexibility but will also become bit difficult
to manage in the future as more extension support will be added. As it is the
most commonly used qemu machine, it needs to support all kinds of device and
interrupts as well. Moreover, virt machine has limitations on the maximum
number of harts it can support because of all the MMIO devices it has to support.

The RISC-V IMSIC specification allows to develop machines completely relying
on MSI and don't care about the wired interrupts at all. It just requires
all the devices to be present behind a PCI bus or present themselves as platform
MSI device. The former is a more common scenario in x86 world where most
of the devices are behind PCI bus. As there is very limited MMIO device
support, it can also scale to very large number of harts.

That's why, this patch series introduces a minimalistic yet very extensible
forward looking machine called as "RISC-V Mini Computer" or "minic". The
idea is to build PC or server like systems with this machine. The machine can
work with or without virtio framework. The current implementation only
supports RV64. I am not sure if building a RV32 machine would be of interest
for such machines. The only mmio device it requires is clint to emulate
the mtimecmp.

"Naming is hard". I am not too attached with the name "minic". 
I just chose least bad one out of the few on my mind :). I am definitely
open to any other name as well. 

The other alternative to provide MSI only option to aia in the 
existing virt machine to build MSI only machines. This is certainly doable
and here is the patch that supports that kind of setup.

https://github.com/atishp04/qemu/tree/virt_imsic_only

However, it even complicates the virt machine even further with additional
command line option, branches in the code. I believe virt machine will become
very complex if we continue this path. I am interested to learn what everyone
else think.

It is needless to say that the current version of minic machine
is inspired from virt machine and tries to reuse as much as code possible.
The first patch in this series adds MSI support for serial-pci device so
console can work on such a machine. The 2nd patch moves some common functions
between minic and the virt machine to a helper file. The PATCH3 actually
implements the new minic machine.

I have not added the fw-cfg/flash support. We probably should add those
but I just wanted to start small and get the feedback first.
This is a work in progress and have few more TODO items before becoming the
new world order :)

1. OpenSBI doesn't have PCI support. Thus, no console support for OpenSBI
for now.
2. The ns16550 driver in OpenSBI also need to support MSI/MSI-X.
3. Add MSI-X support for serial-pci device.

This series can boot Linux distros with the minic machine with or without virtio
devices with out-of-tree Linux kernel patches[1]. Here is an example commandline 

Without virtio devices (nvme, serial-pci & e1000e):
=====================================================
/scratch/workspace/qemu/build/qemu-system-riscv64 -cpu rv64 -M minic -m 1G -smp 4 -nographic -nodefaults \
-display none -bios /scratch/workspace/opensbi/build/platform/generic/firmware/fw_dynamic.elf \
-kernel /scratch/workspace/linux/arch/riscv/boot/Image \
-chardev stdio,mux=on,signal=off,id=charconsole0 \
-mon chardev=charconsole0,mode=readline \
-device pci-serial,msi=true,chardev=charconsole0 \
-drive id=disk3,file=/scratch/workspace/rootfs_images//fedora/Fedora-Developer-Rawhide-20211110.n.0-sda.raw,format=raw,if=none,id=drive-system-disk,cache=none,format=raw \
-device nvme,serial=deadbeef,drive=disk3 \
-netdev user,id=usernet,hostfwd=tcp::10000-:22 -device e1000e,netdev=usernet,bus=pcie.0 \
-append 'root=/dev/nvme0n1p2 rw loglevel=8 memblock=debug console=ttyS0 earlycon' -d in_asm -D log.txt -s

With virtio devices (virtio-scsi-pci, serial-pci & virtio-net-pci)
==================================================================
/scratch/workspace/qemu/build/qemu-system-riscv64 -cpu rv64 -M minic -m 1G -smp 4 -nographic -nodefaults \
-display none -bios /scratch/workspace/opensbi/build/platform/generic/firmware/fw_dynamic.elf \
-kernel /scratch/workspace/linux/arch/riscv/boot/Image \
-chardev stdio,mux=on,signal=off,id=charconsole0 \
-mon chardev=charconsole0,mode=readline \
-device pci-serial,msi=true,chardev=charconsole0 \
-drive file=/scratch/workspace/rootfs_images//fedora/Fedora-Developer-Rawhide-20211110.n.0-sda.raw,format=raw,if=none,id=drive-system-disk,cache=none \
-device virtio-scsi-pci,id=scsi0 -device scsi-hd,bus=scsi0.0,drive=drive-system-disk,id=system-disk,bootindex=1 \
-netdev user,id=n1,hostfwd=tcp::10000-:22 -device virtio-net-pci,netdev=n1 \
-append 'root=/dev/sda2 rw loglevel=8 memblock=debug console=ttyS0 earlycon'

The objective of this series is to engage the community to solve this problem.
Please suggest if you have another alternatve solution.

[1] https://github.com/atishp04/linux/tree/msi_only_console 

Atish Patra (3):
serial: Enable MSI capablity and option
hw/riscv: virt: Move common functions to a separate helper file
hw/riscv: Create a new qemu machine for RISC-V

configs/devices/riscv64-softmmu/default.mak |   1 +
hw/char/serial-pci.c                        |  36 +-
hw/riscv/Kconfig                            |  11 +
hw/riscv/machine_helper.c                   | 417 +++++++++++++++++++
hw/riscv/meson.build                        |   2 +
hw/riscv/minic.c                            | 438 ++++++++++++++++++++
hw/riscv/virt.c                             | 403 ++----------------
include/hw/riscv/machine_helper.h           |  87 ++++
include/hw/riscv/minic.h                    |  65 +++
include/hw/riscv/virt.h                     |  13 -
10 files changed, 1090 insertions(+), 383 deletions(-)
create mode 100644 hw/riscv/machine_helper.c
create mode 100644 hw/riscv/minic.c
create mode 100644 include/hw/riscv/machine_helper.h
create mode 100644 include/hw/riscv/minic.h

--
2.25.1


