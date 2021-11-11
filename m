Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml36F-00005O-17
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 00:58:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml36C-0008T4-LI; Thu, 11 Nov 2021 00:58:12 -0500
Received: from out28-218.mail.aliyun.com ([115.124.28.218]:49498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml369-00038P-BB; Thu, 11 Nov 2021 00:58:12 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07673907|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0376296-0.000440727-0.96193;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.Lr1M.qq_1636610282; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lr1M.qq_1636610282)
 by smtp.aliyun-inc.com(10.147.43.230);
 Thu, 11 Nov 2021 13:58:02 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 00/20] Support UXL filed in xstatus
Date: Thu, 11 Nov 2021 13:57:40 +0800
Message-Id: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.218; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-218.mail.aliyun.com
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
X-List-Received-Date: Thu, 11 Nov 2021 05:58:13 -0000

In this patch set, we process the pc reigsters writes,
gdb reads and writes, and address calculation under
different UXLEN settings.

The patch set v3 mainly address Richard comments on v2.
Patch 1,2,3,5,6,16,17 have been reviewed.

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
  Define an common fuction to calculate address for ldst

LIU Zhiwei (20):
  target/riscv: Don't save pc when exception return
  target/riscv: Sign extend pc for different XLEN
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
  target/riscv: Fix RESERVED field length in VTYPE
  target/riscv: Adjust vsetvl according to XLEN
  target/riscv: Remove VILL field in VTYPE
  target/riscv: Ajdust vector atomic check with XLEN
  target/riscv: Fix check range for first fault only
  target/riscv: Adjust vector address with mask
  target/riscv: Adjust scalar reg in vector with XLEN
  target/riscv: Enable uxl field write

 target/riscv/cpu.c                            | 23 +++++-
 target/riscv/cpu.h                            | 13 +++-
 target/riscv/cpu_helper.c                     | 66 ++++++++++++----
 target/riscv/csr.c                            | 40 +++++++++-
 target/riscv/gdbstub.c                        | 71 ++++++++++++-----
 target/riscv/helper.h                         |  6 +-
 .../riscv/insn_trans/trans_privileged.c.inc   |  7 +-
 target/riscv/insn_trans/trans_rva.c.inc       |  9 +--
 target/riscv/insn_trans/trans_rvd.c.inc       | 19 +----
 target/riscv/insn_trans/trans_rvf.c.inc       | 19 +----
 target/riscv/insn_trans/trans_rvi.c.inc       | 22 +-----
 target/riscv/insn_trans/trans_rvv.c.inc       | 51 ++++++++----
 target/riscv/machine.c                        | 11 +++
 target/riscv/op_helper.c                      |  7 +-
 target/riscv/translate.c                      | 77 +++++++++----------
 target/riscv/vector_helper.c                  | 38 +++++----
 16 files changed, 293 insertions(+), 186 deletions(-)

-- 
2.25.1


