Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BA8C35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 09:52:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGFhu-0006Rm-Gx; Thu, 21 Dec 2023 04:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <duchao@eswincomputing.com>)
 id 1rGFhb-0006NG-Qt; Thu, 21 Dec 2023 04:50:53 -0500
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <duchao@eswincomputing.com>)
 id 1rGFhX-0002WN-UJ; Thu, 21 Dec 2023 04:50:50 -0500
Received: from localhost.localdomain (unknown [10.12.130.31])
 by app1 (Coremail) with SMTP id TAJkCgAHk_0TCoRlUowCAA--.24821S4;
 Thu, 21 Dec 2023 17:49:08 +0800 (CST)
From: Chao Du <duchao@eswincomputing.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 alistair23@gmail.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org
Subject: [RFC PATCH 0/4] target/riscv/kvm: QEMU support for KVM Guest Debug on
 RISC-V
Date: Thu, 21 Dec 2023 09:49:19 +0000
Message-Id: <20231221094923.7349-1-duchao@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: TAJkCgAHk_0TCoRlUowCAA--.24821S4
X-Coremail-Antispam: 1UD129KBjvdXoWrZr1rXF13ZFWUtw17CF48Zwb_yoWkXrXEkr
 Z3XrW8G3yDWFy0vFZ7A3WrGFWrGrWfWw1IvFnFvr4UKr9rur4UJan5ta48A34UZF4rZas7
 AFn3tryfAr13WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbIxYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
 wI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
 wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
 7IU8IzuJUUUUU==
X-CM-SenderInfo: xgxfxt3r6h245lqf0zpsxwx03jof0z/
Received-SPF: pass client-ip=206.189.21.223;
 envelope-from=duchao@eswincomputing.com;
 helo=zg8tmja2lje4os4yms4ymjma.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This series implements QEMU KVM Guest Debug on RISC-V. Currently, we can
debug RISC-V KVM guest from the host side, with software breakpoints.

A brief test was done on QEMU RISC-V hypervisor emulator.

A TODO list which will be added later:
1. HW breakpoints support
2. Test cases

This series is based on QEMU 8.2.0-rc4 and is also available at:
https://github.com/Du-Chao/qemu/tree/riscv_gd_sw

This is dependent on KVM side changes:
https://github.com/Du-Chao/linux/tree/riscv_gd_sw

Chao Du (4):
  target/riscv/kvm: add software breakpoints support
  target/riscv/kvm: implement kvm_arch_update_guest_debug()
  target/riscv/kvm: handle the exit with debug reason
  linux-headers: enable KVM GUEST DEBUG for RISC-V

 accel/kvm/kvm-all.c           |   8 +--
 include/sysemu/kvm.h          |   6 +-
 linux-headers/asm-riscv/kvm.h |   1 +
 target/arm/kvm64.c            |   6 +-
 target/i386/kvm/kvm.c         |   6 +-
 target/mips/kvm.c             |   6 +-
 target/ppc/kvm.c              |   6 +-
 target/riscv/kvm/kvm-cpu.c    | 101 ++++++++++++++++++++++++++++++++++
 target/s390x/kvm/kvm.c        |   6 +-
 9 files changed, 130 insertions(+), 16 deletions(-)

--
2.17.1


