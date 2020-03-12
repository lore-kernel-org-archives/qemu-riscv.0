Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCPJE-0008DH-19
	for mharc-qemu-riscv@gnu.org; Thu, 12 Mar 2020 10:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCPJB-0008BK-4f
 for qemu-riscv@nongnu.org; Thu, 12 Mar 2020 10:59:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCPJ9-0008CF-GT
 for qemu-riscv@nongnu.org; Thu, 12 Mar 2020 10:59:37 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:35901)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jCPJ3-0007lP-DQ; Thu, 12 Mar 2020 10:59:30 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07487719|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.03378-0.000359326-0.965861;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16378; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.H-NREhQ_1584025152; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H-NREhQ_1584025152)
 by smtp.aliyun-inc.com(10.147.41.143);
 Thu, 12 Mar 2020 22:59:13 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v5 00/60] target/riscv: support vector extension v0.7.1
Date: Thu, 12 Mar 2020 22:58:00 +0800
Message-Id: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Thu, 12 Mar 2020 14:59:38 -0000

This patchset implements the vector extension for RISC-V on QEMU.

You can also find the patchset and all *test cases* in
my repo(https://github.com/romanheros/qemu.git branch:vector-upstream-v3).
All the test cases are in the directory qemu/tests/riscv/vector/. They are
riscv64 linux user mode programs.

You can test the patchset by the script qemu/tests/riscv/vector/runcase.sh.

Features:
  * support specification riscv-v-spec-0.7.1.(https://github.com/riscv/riscv-v-spec/releases/tag/0.7.1/)
  * support basic vector extension.
  * support Zvlsseg.
  * support Zvamo.
  * not support Zvediv as it is changing.
  * SLEN always equals VLEN.
  * element width support 8bit, 16bit, 32bit, 64bit.

Changelog:
v5
  * fixup a bug in tb flags.
v4
  * no change
v3
  * move check code from execution-time to translation-time
  * use a continous memory block for vector register description.
  * vector registers as direct fields in RISCVCPUState.
  * support VLEN configure from qemu command line.
  * support ELEN configure from qemu command line.
  * support vector specification version configure from qemu command line.
  * probe pages before real load or store access.
  * use probe_page_check for no-fault operations in linux user mode.
  * generation atomic exit exception when in parallel environment.
  * fixup a lot of concrete bugs.

V2
  * use float16_compare{_quiet}
  * only use GETPC() in outer most helper
  * add ctx.ext_v Property


LIU Zhiwei (60):
  target/riscv: add vector extension field in CPURISCVState
  target/riscv: implementation-defined constant parameters
  target/riscv: support vector extension csr
  target/riscv: add vector configure instruction
  target/riscv: add vector stride load and store instructions
  target/riscv: add vector index load and store instructions
  target/riscv: add fault-only-first unit stride load
  target/riscv: add vector amo operations
  target/riscv: vector single-width integer add and subtract
  target/riscv: vector widening integer add and subtract
  target/riscv: vector integer add-with-carry / subtract-with-borrow
    instructions
  target/riscv: vector bitwise logical instructions
  target/riscv: vector single-width bit shift instructions
  target/riscv: vector narrowing integer right shift instructions
  target/riscv: vector integer comparison instructions
  target/riscv: vector integer min/max instructions
  target/riscv: vector single-width integer multiply instructions
  target/riscv: vector integer divide instructions
  target/riscv: vector widening integer multiply instructions
  target/riscv: vector single-width integer multiply-add instructions
  target/riscv: vector widening integer multiply-add instructions
  target/riscv: vector integer merge and move instructions
  target/riscv: vector single-width saturating add and subtract
  target/riscv: vector single-width averaging add and subtract
  target/riscv: vector single-width fractional multiply with rounding
    and saturation
  target/riscv: vector widening saturating scaled multiply-add
  target/riscv: vector single-width scaling shift instructions
  target/riscv: vector narrowing fixed-point clip instructions
  target/riscv: vector single-width floating-point add/subtract
    instructions
  target/riscv: vector widening floating-point add/subtract instructions
  target/riscv: vector single-width floating-point multiply/divide
    instructions
  target/riscv: vector widening floating-point multiply
  target/riscv: vector single-width floating-point fused multiply-add
    instructions
  target/riscv: vector widening floating-point fused multiply-add
    instructions
  target/riscv: vector floating-point square-root instruction
  target/riscv: vector floating-point min/max instructions
  target/riscv: vector floating-point sign-injection instructions
  target/riscv: vector floating-point compare instructions
  target/riscv: vector floating-point classify instructions
  target/riscv: vector floating-point merge instructions
  target/riscv: vector floating-point/integer type-convert instructions
  target/riscv: widening floating-point/integer type-convert
    instructions
  target/riscv: narrowing floating-point/integer type-convert
    instructions
  target/riscv: vector single-width integer reduction instructions
  target/riscv: vector wideing integer reduction instructions
  target/riscv: vector single-width floating-point reduction
    instructions
  target/riscv: vector widening floating-point reduction instructions
  target/riscv: vector mask-register logical instructions
  target/riscv: vector mask population count vmpopc
  target/riscv: vmfirst find-first-set mask bit
  target/riscv: set-X-first mask bit
  target/riscv: vector iota instruction
  target/riscv: vector element index instruction
  target/riscv: integer extract instruction
  target/riscv: integer scalar move instruction
  target/riscv: floating-point scalar move instructions
  target/riscv: vector slide instructions
  target/riscv: vector register gather instruction
  target/riscv: vector compress instruction
  target/riscv: configure and turn on vector extension from command line

 target/riscv/Makefile.objs              |    2 +-
 target/riscv/cpu.c                      |   49 +
 target/riscv/cpu.h                      |   89 +-
 target/riscv/cpu_bits.h                 |   15 +
 target/riscv/csr.c                      |   75 +-
 target/riscv/helper.h                   | 1075 +++++
 target/riscv/insn32-64.decode           |   11 +
 target/riscv/insn32.decode              |  366 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 2386 ++++++++++++
 target/riscv/translate.c                |   24 +-
 target/riscv/vector_helper.c            | 4745 +++++++++++++++++++++++
 11 files changed, 8824 insertions(+), 13 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvv.inc.c
 create mode 100644 target/riscv/vector_helper.c

-- 
2.23.0


