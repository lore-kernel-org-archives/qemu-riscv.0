Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1inDo3-0002BP-1B
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jan 2020 22:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1inDo0-000299-J8
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2020 22:39:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1inDnz-0002sS-H2
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2020 22:39:20 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:42373)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1inDnz-0002n5-7S
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2020 22:39:19 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.278808|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.173433-0.0325199-0.794047; DS=||;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l04364; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.GV9YvOJ_1578022440; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GV9YvOJ_1578022440)
 by smtp.aliyun-inc.com(10.147.42.16); Fri, 03 Jan 2020 11:34:01 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: alistair23@gmail.com, richard.henderson@linaro.org,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 0/4] RISC-V: support vector extension part 1
Date: Fri,  3 Jan 2020 11:33:43 +0800
Message-Id: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Fri, 03 Jan 2020 03:39:21 -0000

This is the first part of v3 patchset. The changelog of v3 is only coverd
the part1.

Features:
  * support specification riscv-v-spec-0.7.1.
  * support basic vector extension.                                                
  * support Zvlsseg.                                                               
  * support Zvamo.                                                                 
  * not support Zvediv as it is changing.
  * fixed SLEN 128bit.
  * element width support 8bit, 16bit, 32bit, 64bit.

Changelog:
v3
  * support VLEN configure from qemu command line.
  * support ELEN configure from qemu command line.
  * support vector specification version configure from qemu command line.
  * only default on for "any" cpu, others turn on from command line.
  * use a continous memory block for vector register description.
V2
  * use float16_compare{_quiet}
  * only use GETPC() in outer most helper
  * add ctx.ext_v Property

LIU Zhiwei (4):
  RISC-V: add vector extension field in CPURISCVState
  RISC-V: configure and turn on vector extension from command line
  RISC-V: support vector extension csr
  RISC-V: add vector extension configure instruction

 target/riscv/Makefile.objs              |  2 +-
 target/riscv/cpu.c                      | 43 +++++++++++-
 target/riscv/cpu.h                      | 77 ++++++++++++++++++---
 target/riscv/cpu_bits.h                 | 15 ++++
 target/riscv/csr.c                      | 92 +++++++++++++++++--------
 target/riscv/helper.h                   |  2 +
 target/riscv/insn32.decode              |  5 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 52 ++++++++++++++
 target/riscv/translate.c                | 17 ++++-
 target/riscv/vector_helper.c            | 51 ++++++++++++++
 10 files changed, 314 insertions(+), 42 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvv.inc.c
 create mode 100644 target/riscv/vector_helper.c

-- 
2.23.0


