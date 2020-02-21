Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j54sh-0003r2-S9
	for mharc-qemu-riscv@gnu.org; Fri, 21 Feb 2020 04:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33289)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j54sb-0003oc-6d
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 04:45:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j54sZ-0001YY-D9
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 04:45:52 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:56765)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1j54sQ-0000om-Cb; Fri, 21 Feb 2020 04:45:44 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1274412|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.222334-0.0414369-0.736229;
 DS=CONTINUE|ham_system_inform|0.0303549-0.00256146-0.967084;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16378; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.GqUN7u9_1582278331; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GqUN7u9_1582278331)
 by smtp.aliyun-inc.com(10.147.43.95); Fri, 21 Feb 2020 17:45:32 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v5 0/4] target-riscv: support vector extension part 1
Date: Fri, 21 Feb 2020 17:45:27 +0800
Message-Id: <20200221094531.61894-1-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 21 Feb 2020 09:45:58 -0000

This is the first part of v5 patchset. The changelog of v5 is only coverd
the part1.

Features:
  * support specification riscv-v-spec-0.7.1.
  * support basic vector extension.
  * support Zvlsseg.
  * support Zvamo.
  * not support Zvediv as it is changing.
  * SLEN always equals VLEN.
  * element width support 8bit, 16bit, 32bit, 64bit.

Changelog:

v5
  * vector registers as direct fields in RISCVCPUState.
  * mov the properties to last patch.
  * check RVV in vs().
  * check if rs1 is x0 in vsetvl/vsetvli.
  * check VILL, EDIV, RESERVED fileds in vsetvl.
v4
  * adjust max vlen to 512 bits.
  * check maximum on elen(64bits).
  * check minimum on vlen(128bits).
  * check if rs1 is x0 in vsetvl/vsetvli.
  * use gen_goto_tb in vsetvli instead of exit_tb.
  * fixup fetch vlmax from rs2, not env->vext.type.
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
  target/riscv: add vector extension field in CPURISCVState
  target/riscv: implementation-defined constant parameters
  target/riscv: support vector extension csr
  target/riscv: add vector configure instruction

 MAINTAINERS                             |  1 +
 target/riscv/Makefile.objs              |  2 +-
 target/riscv/cpu.c                      |  7 +++
 target/riscv/cpu.h                      | 78 ++++++++++++++++++++++---
 target/riscv/cpu_bits.h                 | 15 +++++
 target/riscv/csr.c                      | 75 +++++++++++++++++++++++-
 target/riscv/helper.h                   |  2 +
 target/riscv/insn32.decode              |  5 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 69 ++++++++++++++++++++++
 target/riscv/translate.c                | 17 +++++-
 target/riscv/vector_helper.c            | 53 +++++++++++++++++
 11 files changed, 312 insertions(+), 12 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvv.inc.c
 create mode 100644 target/riscv/vector_helper.c

-- 
2.23.0


