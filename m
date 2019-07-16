Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnSX5-0000Rw-9K
	for mharc-qemu-riscv@gnu.org; Tue, 16 Jul 2019 14:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38348)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=093fafc25=alistair.francis@wdc.com>)
 id 1hnSX2-0000Ei-Jp
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 14:50:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=093fafc25=alistair.francis@wdc.com>)
 id 1hnSWx-0003f7-SV
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 14:50:30 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:2489)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=093fafc25=alistair.francis@wdc.com>)
 id 1hnSWm-0003Ks-Ax; Tue, 16 Jul 2019 14:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1563303016; x=1594839016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pyc8C0lP7aIaEt+tSPSbPgmwMr8fiGr4m282CuJ03CM=;
 b=lps9xIWrHu4n9VCERYwVcCLDv80BpkmxT4fCV8BSCOTqRH66tej7HR/Z
 AdnjzVl6uxsf1m/+dWjqsKDM0g+angpHKC8nfyU3+gA0vWyWfvOwD2mge
 qyS4RlJzCT02DcK0ICVH6tnQ0ONP+SyGDbaKQA2LLYuMrfVr8l0ZybBRx
 RrlIxrO6S7oEI0YcExS+TSNY+PHc+uArQEkcpEBig8muSAM5vNZkbeCQo
 dV+jE9yDxibFr4c+65agTeRSwa1NwpYr4i7A0ZH+h4WnhSWvgOiUQpDmj
 nyCDVoBDhpP2PRSlqyui4HIAzGGdnTFBx6r7QUZz0B/audi70qewN0m16 Q==;
IronPort-SDR: zUf+9+4OZaFJAmBLIh1Ax1u8Qntf6Mt6yfRqJrWw0BV9IFckV+ILjTOZFoI3SnMFwxss6rPUQm
 ygLu3daTT6VfsiPhqu+DxB/0lS0kGZw/gZrsb8naLmIESruYY7yeC1iJZKU1hEFM3d9xTdfOXO
 shhM+iCwK+NhvwfUsyt/FGJqPE0UuMYfudErnkXJCODSz6t5Aap7dVQsA5jcrK0UgkCjgN2Idc
 scQjPKSOmUKSdE+vFqC4wXlDAWON8sFFN2t3rk3DnteMfAEnWhd4pVFzavQ8fHSb+ztzx9TRB8
 UXA=
X-IronPort-AV: E=Sophos;i="5.64,271,1559491200"; d="scan'208";a="114341623"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2019 02:50:11 +0800
IronPort-SDR: +ojD1y3il0xzQOUrEH7L0ZJb7fL1vsRMIx9BpUtTYMQmYBKs2jXEebbjOb3rX7LRMQz/bxtLTy
 LpcUyQaxObl39XQhUzd461L99cNSiqSJc1y4eJ2jkmvFDsZ7n0XBW0Knyja6kRyjVPwer3FzQ3
 meRLUguY+wwXXTHZLAuIl+BTVkf0JRON4twauf2Fd0TCI+yha38vw648fadW9GHIX4hXL68cHl
 fxTb1LWUybQ/VrciyhG6YTvXJenyHfjUbskc3CU6mpSqyexE4PsVAc2ZJqnfkM4QVGzuF9imdv
 NvayVzWblzZ7Br8yfESRnYmj
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 16 Jul 2019 11:48:43 -0700
IronPort-SDR: dCUDR9F2k3gZm9GciJn9jF2PoPa64/kTKQCUkhnXDev9aRVSNgSAEDnWwJKmEaRH7gweB1sflW
 5xwYHVnbu65LFvt+X55Q8D3YbJE5a/Rw1//YCP4lzG6Ybkl96FSB/YR2RsyE/CMgZgLHZ8m8fl
 xINFJ829yQtg5n+rC/iD0fudIM1e4mSVc6VehH9ZgEDDpSSuwkGTLVw/7OgzE5U5/K5Y4WulPm
 WsmfEishGMUCw7dwcR/hnWbhB+M6BOCwNZwEj+J+VV/C5GZCzMMTYdl1dvSK0U8SB50hEsStXu
 duE=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Jul 2019 11:50:11 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	palmer@sifive.com
Cc: peter.maydell@linaro.org, codyprime@gmail.com, anup@brainfault.org,
 stefanha@redhat.com, pbonzini@redhat.com, alistair23@gmail.com,
 bmeng.cn@gmail.com, linux@roeck-us.ne, stefanha@gmail.co,
 alistair.francis@wdc.com
Date: Tue, 16 Jul 2019 11:47:19 -0700
Message-Id: <cover.1563302751.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v3 0/2]  RISC-V: Add default OpenSBI ROM
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jul 2019 18:50:34 -0000

This series includes the OpenSBI firmware for QEMU RISC-V users.

To avoid breakages we have not changed the default behaviour of QEMU.
The plan is to change the default though, which is why an entry to the
qemu-deprecated.texi file has been added as well as a new warning.

After this series QEMU 4.1 has three options:
 1. ``-bios none`` - This is the current default behavior if no -bios option
      is included. QEMU will not automatically load any firmware. It is up
      to the user to load all the images they need.
 2. ``-bios default`` - In a future QEMU release this will become the default
      behaviour if no -bios option is specified. This option will load the
      default OpenSBI firmware automatically. The firmware is included with
      the QEMU release and no user interaction is required. All a user needs
      to do is specify the kernel they want to boot with the -kernel option
 3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.

All users should transition to using a -bios option. We can start
updating all documentation after the release of 4.1.

At the end of this series and the transition period we are in the good
place of no longer requiring users to build firmware to boot a kernel.
Instead users can just run QEMU with the -kernel option and everything
will work. They can also override the firmware with their own using
the -bios option. Using "-bios none" will result in no firmware being
loaded (as it is today).

The commits can be found here: https://github.com/alistair23/qemu/tree/mainline/alistair/opensbi.next

v3:
 - Use the QEMU mirror of OpenSBI
v2:
 - Error and exit if we can't load the default firmware


Alistair Francis (2):
  roms: Add OpenSBI version 0.4
  hw/riscv: Load OpenSBI as the default firmware

 .gitmodules                                  |   3 ++
 LICENSE                                      |  21 +++++---
 Makefile                                     |   5 +-
 hw/riscv/boot.c                              |  54 +++++++++++++++++++
 hw/riscv/sifive_u.c                          |   7 +--
 hw/riscv/virt.c                              |  11 ++--
 include/hw/riscv/boot.h                      |   3 ++
 pc-bios/README                               |  11 ++++
 pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 0 -> 36888 bytes
 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 0 -> 40968 bytes
 pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 0 -> 40968 bytes
 qemu-deprecated.texi                         |  20 +++++++
 roms/Makefile                                |  48 ++++++++++++-----
 roms/opensbi                                 |   1 +
 14 files changed, 157 insertions(+), 27 deletions(-)
 create mode 100755 pc-bios/opensbi-riscv32-virt-fw_jump.bin
 create mode 100755 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 create mode 100755 pc-bios/opensbi-riscv64-virt-fw_jump.bin
 create mode 160000 roms/opensbi

-- 
2.22.0


