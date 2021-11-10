Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkhfQ-0005j5-Dn
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 02:05:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkhfN-0005ic-M3; Wed, 10 Nov 2021 02:05:05 -0500
Received: from out28-76.mail.aliyun.com ([115.124.28.76]:46141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkhfK-0003y1-Tq; Wed, 10 Nov 2021 02:05:05 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1005868|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0238114-0.000240622-0.975948;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LqV5B0t_1636527896; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LqV5B0t_1636527896)
 by smtp.aliyun-inc.com(10.147.41.187);
 Wed, 10 Nov 2021 15:04:56 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 00/14] Support UXL filed in xstatus
Date: Wed, 10 Nov 2021 15:04:38 +0800
Message-Id: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.76; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-76.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Nov 2021 07:05:06 -0000

In this patch set, we process the pc reigsters writes,
gdb reads and writes, and address calculation under
different UXLEN settings.

v2:
  Split out vill from vtype
  Remove context switch when xlen changes at exception
  Use XL instead of OL in many places
  Use pointer masking and XLEN for vector address
  Define an common fuction to calculate address for ldst

LIU Zhiwei (14):
  target/riscv: Sign extend pc for different XLEN
  target/riscv: Ignore the pc bits above XLEN
  target/riscv: Extend pc for runtime pc write
  target/riscv: Use gdb xml according to max mxlen
  target/riscv: Calculate address according to XLEN
  target/riscv: Adjust vsetvl according to XLEN
  target/riscv: Ajdust vector atomic check with XLEN
  target/riscv: Fix check range for first fault only
  target/riscv: Relax debug check for pm write
  target/riscv: Adjust vector address with mask
  target/riscv: Adjust scalar reg in vector with XLEN
  target/riscv: Split out the vill from vtype
  target/riscv: Don't save pc when exception return
  target/riscv: Enable uxl field write

 target/riscv/cpu.c                            | 23 +++++-
 target/riscv/cpu.h                            |  9 +++
 target/riscv/cpu_helper.c                     | 47 +++++++++++-
 target/riscv/csr.c                            | 42 ++++++++++-
 target/riscv/gdbstub.c                        | 73 ++++++++++++++-----
 target/riscv/helper.h                         |  6 +-
 .../riscv/insn_trans/trans_privileged.c.inc   |  7 +-
 target/riscv/insn_trans/trans_rvd.c.inc       | 23 +-----
 target/riscv/insn_trans/trans_rvf.c.inc       | 23 +-----
 target/riscv/insn_trans/trans_rvi.c.inc       | 22 +-----
 target/riscv/insn_trans/trans_rvv.c.inc       | 12 +--
 target/riscv/internals.h                      |  1 +
 target/riscv/machine.c                        | 11 +++
 target/riscv/op_helper.c                      |  7 +-
 target/riscv/translate.c                      | 29 +++++++-
 target/riscv/vector_helper.c                  | 54 +++++++++-----
 16 files changed, 263 insertions(+), 126 deletions(-)

-- 
2.25.1


