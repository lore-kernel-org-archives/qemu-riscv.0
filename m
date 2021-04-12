Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lVqSC-0007wF-Fy
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 02:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1lVqS7-0007iQ-Pl; Mon, 12 Apr 2021 02:53:43 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:4615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1lVqS1-0004Qs-MV; Mon, 12 Apr 2021 02:53:43 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FJfXG3S84z9yZR;
 Mon, 12 Apr 2021 14:51:10 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Mon, 12 Apr 2021
 14:53:17 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup.patel@wdc.com>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <sagark@eecs.berkeley.edu>,
 <kbastian@mail.uni-paderborn.de>, <bin.meng@windriver.com>,
 <fanliang@huawei.com>, <wu.wubin@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, <yinyipeng1@huawei.com>, Yifei Jiang
 <jiangyifei@huawei.com>
Subject: [PATCH RFC v5 00/12] Add riscv kvm accel support
Date: Mon, 12 Apr 2021 14:52:34 +0800
Message-ID: <20210412065246.1853-1-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=jiangyifei@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 12 Apr 2021 06:53:44 -0000

This series adds both riscv32 and riscv64 kvm support, and implements
migration based on riscv. It is based on temporarily unaccepted kvm:
https://github.com/kvm-riscv/linux (lastest version v17).

This series depends on above pending changes which haven't yet been
accepted, so this QEMU patch series is treated as RFC patches until
that dependency has been dealt with.

Several steps to use this:
1. Build emulation
$ ./configure --target-list=riscv64-softmmu
$ make -j$(nproc)

2. Build kernel
https://github.com/kvm-riscv/linux

3. Build QEMU VM
Cross built in riscv toolchain.
$ PKG_CONFIG_LIBDIR=<toolchain pkgconfig path>
$ export PKG_CONFIG_SYSROOT_DIR=<toolchain sysroot path>
$ ./configure --target-list=riscv64-softmmu --enable-kvm \
--cross-prefix=riscv64-linux-gnu- --disable-libiscsi --disable-glusterfs \
--disable-libusb --disable-usb-redir --audio-drv-list= --disable-opengl \
--disable-libxml2
$ make -j$(nproc)

4. Start emulation
$ ./qemu-system-riscv64 -M virt -m 4096M -cpu rv64,x-h=true -nographic \
        -name guest=riscv-hyp,debug-threads=on \
        -smp 4 \
        -bios ./fw_jump.bin \
        -kernel ./Image \
        -drive file=./hyp.img,format=raw,id=hd0 \
        -device virtio-blk-device,drive=hd0 \
        -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"

5. Start kvm-acceled QEMU VM in emulation
$ ./qemu-system-riscv64 -M virt,accel=kvm -m 1024M -cpu host -nographic \
        -name guest=riscv-guset \
        -smp 2 \
        -bios none \
        -kernel ./Image \
        -drive file=./guest.img,format=raw,id=hd0 \
        -device virtio-blk-device,drive=hd0 \
        -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"

Changes since RFC v4
- Rebase on QEMU v6.0.0-rc2 and kvm-riscv linux v17.
- Remove time scaling support as software solution is incomplete.
  Because it will cause unacceptable performance degradation. and
  We will post a better solution.
- Revise according to Alistair's review comments.
  - Remove compile time XLEN checks in kvm_riscv_reg_id
  - Surround TYPE_RISCV_CPU_HOST definition by CONFIG_KVM and share
    it between RV32 and RV64.
  - Add kvm-stub.c for reduce unnecessary compilation checks.
  - Add riscv_setup_direct_kernel() to direct boot kernel for KVM.

Changes since RFC v3
- Rebase on QEMU v5.2.0-rc2 and kvm-riscv linux v15.
- Add time scaling support(New patches 13, 14 and 15).
- Fix the bug that guest vm can't reboot.

Changes since RFC v2
- Fix checkpatch error at target/riscv/sbi_ecall_interface.h.
- Add riscv migration support.

Changes since RFC v1
- Add separate SBI ecall interface header.
- Add riscv32 kvm accel support.

Yifei Jiang (12):
  linux-header: Update linux/kvm.h
  target/riscv: Add target/riscv/kvm.c to place the public kvm interface
  target/riscv: Implement function kvm_arch_init_vcpu
  target/riscv: Implement kvm_arch_get_registers
  target/riscv: Implement kvm_arch_put_registers
  target/riscv: Support start kernel directly by KVM
  hw/riscv: PLIC update external interrupt by KVM when kvm enabled
  target/riscv: Handle KVM_EXIT_RISCV_SBI exit
  target/riscv: Add host cpu type
  target/riscv: Add kvm_riscv_get/put_regs_timer
  target/riscv: Implement virtual time adjusting with vm state changing
  target/riscv: Support virtual time context synchronization

 hw/intc/sifive_plic.c              |  29 +-
 hw/riscv/boot.c                    |  11 +
 hw/riscv/virt.c                    |   7 +
 include/hw/riscv/boot.h            |   1 +
 linux-headers/linux/kvm.h          |  97 +++++
 meson.build                        |   2 +
 target/riscv/cpu.c                 |  17 +
 target/riscv/cpu.h                 |  10 +
 target/riscv/kvm-stub.c            |  30 ++
 target/riscv/kvm.c                 | 605 +++++++++++++++++++++++++++++
 target/riscv/kvm_riscv.h           |  25 ++
 target/riscv/machine.c             |  14 +
 target/riscv/meson.build           |   1 +
 target/riscv/sbi_ecall_interface.h |  72 ++++
 14 files changed, 912 insertions(+), 9 deletions(-)
 create mode 100644 target/riscv/kvm-stub.c
 create mode 100644 target/riscv/kvm.c
 create mode 100644 target/riscv/kvm_riscv.h
 create mode 100644 target/riscv/sbi_ecall_interface.h

-- 
2.19.1


