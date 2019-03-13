Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h40h2-0003iG-9n
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 06:01:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1h40gy-0003hH-30
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 06:00:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1h40gm-00039G-Fw
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 06:00:49 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:36520)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1h40gi-00038s-Rm; Wed, 13 Mar 2019 06:00:44 -0400
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 zuban)
	id 1h40gg-0001sK-LB; Wed, 13 Mar 2019 11:00:38 +0100
Received: from mail.uni-paderborn.de by magmaria with queue id 3203560-3;
	Wed, 13 Mar 2019 10:00:37 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, kbastian@mail.uni-paderborn.de
Cc: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 13 Mar 2019 11:00:28 +0100
Message-Id: <20190313100030.17628-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.3.13.95116, AntiVirus-Engine: 5.58.0,
	AntiVirus-Data: 2019.2.22.5580002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v9 00/29] target/riscv: Convert to decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2019 10:00:58 -0000

Hi,

this has just a bunch compile fixes caused by patches 17 and 18. So I only
resend these patches.

full tree is available at
https://github.com/bkoppelmann/qemu/tree/riscv-dt-v9

Bastian Koppelmann (29):
  target/riscv: Activate decodetree and implemnt LUI & AUIPC
  target/riscv: Convert RVXI branch insns to decodetree
  target/riscv: Convert RV32I load/store insns to decodetree
  target/riscv: Convert RV64I load/store insns to decodetree
  target/riscv: Convert RVXI arithmetic insns to decodetree
  target/riscv: Convert RVXI fence insns to decodetree
  target/riscv: Convert RVXI csr insns to decodetree
  target/riscv: Convert RVXM insns to decodetree
  target/riscv: Convert RV32A insns to decodetree
  target/riscv: Convert RV64A insns to decodetree
  target/riscv: Convert RV32F insns to decodetree
  target/riscv: Convert RV64F insns to decodetree
  target/riscv: Convert RV32D insns to decodetree
  target/riscv: Convert RV64D insns to decodetree
  target/riscv: Convert RV priv insns to decodetree
  target/riscv: Convert quadrant 0 of RVXC insns to decodetree
  target/riscv: Convert quadrant 1 of RVXC insns to decodetree
  target/riscv: Convert quadrant 2 of RVXC insns to decodetree
  target/riscv: Remove gen_jalr()
  target/riscv: Remove manual decoding from gen_branch()
  target/riscv: Remove manual decoding from gen_load()
  target/riscv: Remove manual decoding from gen_store()
  target/riscv: Move gen_arith_imm() decoding into trans_* functions
  target/riscv: make ADD/SUB/OR/XOR/AND insn use arg lists
  target/riscv: Remove shift and slt insn manual decoding
  target/riscv: Remove manual decoding of RV32/64M insn
  target/riscv: Rename trans_arith to gen_arith
  target/riscv: Remove gen_system()
  target/riscv: Remove decode_RV32_64G()

 target/riscv/Makefile.objs                    |   19 +
 target/riscv/insn16.decode                    |  129 ++
 target/riscv/insn32-64.decode                 |   72 +
 target/riscv/insn32.decode                    |  201 ++
 .../riscv/insn_trans/trans_privileged.inc.c   |  110 +
 target/riscv/insn_trans/trans_rva.inc.c       |  218 ++
 target/riscv/insn_trans/trans_rvc.inc.c       |  327 +++
 target/riscv/insn_trans/trans_rvd.inc.c       |  442 ++++
 target/riscv/insn_trans/trans_rvf.inc.c       |  439 ++++
 target/riscv/insn_trans/trans_rvi.inc.c       |  568 +++++
 target/riscv/insn_trans/trans_rvm.inc.c       |  120 ++
 target/riscv/translate.c                      | 1847 +++--------------
 12 files changed, 2897 insertions(+), 1595 deletions(-)
 create mode 100644 target/riscv/insn16.decode
 create mode 100644 target/riscv/insn32-64.decode
 create mode 100644 target/riscv/insn32.decode
 create mode 100644 target/riscv/insn_trans/trans_privileged.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rva.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvc.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvd.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvf.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvi.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvm.inc.c

-- 
2.21.0


