Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAWSJ-0002ru-CH
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 07:22:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAWS6-0002oA-M8; Thu, 20 Jan 2022 07:22:08 -0500
Received: from out28-101.mail.aliyun.com ([115.124.28.101]:47439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAWS3-0007gG-Ft; Thu, 20 Jan 2022 07:22:06 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07495575|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0187251-0.00017002-0.981105;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.MfxvgjL_1642681316; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfxvgjL_1642681316)
 by smtp.aliyun-inc.com(10.147.42.241);
 Thu, 20 Jan 2022 20:21:56 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v8 00/23] Support UXL filed in xstatus
Date: Thu, 20 Jan 2022 20:20:27 +0800
Message-Id: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.101; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-101.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jan 2022 12:22:09 -0000

In this patch set, we process the pc reigsters writes,
gdb reads and writes, and address calculation under
different UXLEN settings.

The patch set v8 has been tested by running rv64 Linux with 
rv32 rootfs in compat mode. You can almost follow the test [1]
given by GuoRen, except using the branch riscv-upstream-uxl-v8
on my QEMU repo [2].

[1] https://lore.kernel.org/linux-arm-kernel/20211228143958.3409187-17-guoren@kernel.org/t/
[2] https://github.com/romanheros/qemu.git 

Except patch 22 is new, the other patches have been reviewed or acked.

v8:
  Set default XLEN for hypervisor vsstatus and mstatus_hs

v7:
  Rebase to Alistair riscv_to_apply.next branch
  Add commit message for create xl field in CPURISCVState

v6:
  Pass boot 32bit rootfs on compat Linux
  Pass test cases on compat OpenTee
  Fix csr write mask 
  Fix WARL for uxl
  Fix sstatus read for uxl
  Relax UXL field for debugging
  Don't bump machine state version for xl
  Rename cpu_get_xl to cpu_recompute_xl
  Rebase to vector v1.0
  Rebase to 128 bit cpu

v5:
  Add xl field in env to clear up redundant riscv_cpu_xl
  Adjust pmpcfg access with mxl
  Select gdb core xml according to mxl 

v4:
  Support SSTATUS64_UXL write
  Bump vmstate version for vill split

v3:
  Merge gen_pm_adjust_address into a canonical address function
  Adjust address for RVA with XLEN
  Split pm_enabled into pm_mask_enabled and pm_base_enabled
  Replace array of pm tcg globals with one scalar tcg global
  Split and change patch sequence

v2:
  Split out vill from vtype
  Remove context switch when xlen changes at exception
  Use XL instead of OL in many places
  Use pointer masking and XLEN for vector address
  Define an common fuction to calculate address for ld

LIU Zhiwei (23):
  target/riscv: Adjust pmpcfg access with mxl
  target/riscv: Don't save pc when exception return
  target/riscv: Sign extend link reg for jal and jalr
  target/riscv: Sign extend pc for different XLEN
  target/riscv: Create xl field in env
  target/riscv: Ignore the pc bits above XLEN
  target/riscv: Extend pc for runtime pc write
  target/riscv: Use gdb xml according to max mxlen
  target/riscv: Relax debug check for pm write
  target/riscv: Adjust csr write mask with XLEN
  target/riscv: Create current pm fields in env
  target/riscv: Alloc tcg global for cur_pm[mask|base]
  target/riscv: Calculate address according to XLEN
  target/riscv: Split pm_enabled into mask and base
  target/riscv: Split out the vill from vtype
  target/riscv: Adjust vsetvl according to XLEN
  target/riscv: Remove VILL field in VTYPE
  target/riscv: Fix check range for first fault only
  target/riscv: Adjust vector address with mask
  target/riscv: Adjust scalar reg in vector with XLEN
  target/riscv: Set default XLEN for hypervisor
  target/riscv: Enable uxl field write
  target/riscv: Relax UXL field for debugging

 target/riscv/cpu.c                            | 42 +++++++--
 target/riscv/cpu.h                            | 45 ++++++++-
 target/riscv/cpu_bits.h                       |  3 +
 target/riscv/cpu_helper.c                     | 94 +++++++++----------
 target/riscv/csr.c                            | 84 +++++++++++++++--
 target/riscv/gdbstub.c                        | 71 ++++++++++----
 target/riscv/helper.h                         |  4 +-
 .../riscv/insn_trans/trans_privileged.c.inc   |  9 +-
 target/riscv/insn_trans/trans_rva.c.inc       |  9 +-
 target/riscv/insn_trans/trans_rvd.c.inc       | 19 +---
 target/riscv/insn_trans/trans_rvf.c.inc       | 19 +---
 target/riscv/insn_trans/trans_rvi.c.inc       | 39 +++-----
 target/riscv/insn_trans/trans_rvv.c.inc       |  6 +-
 target/riscv/machine.c                        | 16 +++-
 target/riscv/op_helper.c                      |  7 +-
 target/riscv/pmp.c                            | 12 +--
 target/riscv/translate.c                      | 90 +++++++++---------
 target/riscv/vector_helper.c                  | 39 +++++---
 18 files changed, 377 insertions(+), 231 deletions(-)

-- 
2.25.1


