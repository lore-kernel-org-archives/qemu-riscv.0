Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcljS-0000JQ-6i
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 05:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljQ-0000GH-5g; Tue, 19 Oct 2021 05:48:28 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:54578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljO-0006Pd-55; Tue, 19 Oct 2021 05:48:27 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 09EA741F73;
 Tue, 19 Oct 2021 11:48:22 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id E418F601E2;
 Tue, 19 Oct 2021 11:48:21 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 3A34914005A;
 Tue, 19 Oct 2021 11:48:21 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v3 00/21] Adding partial support for 128-bit riscv target
Date: Tue, 19 Oct 2021 11:47:51 +0200
Message-Id: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 19 Oct 2021 09:48:28 -0000

This series of patches provides partial 128-bit support for the riscv
target architecture, namely RVI and RVM, with minimal csr support.

This v3 is based on Richard proposal for handling correctly the various
register sizes (v4 version of his series).
As compared to the v2, it simplifies a bit the API, and also allows to
reuse existing generation functions where wrappers were needed before.
It also should handle 128-bit sign extension in RV128 running as RV32 or
RV64 correctly, but I did/could not run any tests making sure of it.

Based-on: 20211019000108.3678724-1-richard.henderson@linaro.org

Frédéric Pétrot (21):
  memory: change define name for consistency
  memory: add a few defines for octo (128-bit) values
  Int128.h: addition of a few 128-bit operations
  target/riscv: additional macros to check instruction support
  target/riscv: separation of bitwise logic and aritmetic helpers
  target/riscv: array for the 64 upper bits of 128-bit registers
  target/riscv: setup everything so that riscv128-softmmu compiles
  target/riscv: adding accessors to the registers upper part
  target/riscv: moving some insns close to similar insns
  target/riscv: support for 128-bit loads and store
  target/riscv: support for 128-bit bitwise instructions
  target/riscv: support for 128-bit U-type instructions
  target/riscv: support for 128-bit shift instructions
  target/riscv: support for 128-bit arithmetic instructions
  target/riscv: support for 128-bit M extension
  target/riscv: adding high part of some csrs
  target/riscv: helper functions to wrap calls to 128-bit csr insns
  target/riscv: modification of the trans_csrxx for 128-bit support
  target/riscv: actual functions to realize crs 128-bit insns
  target/riscv: adding 128-bit access functions for some csrs
  target/riscv: support for 128-bit satp

 configs/devices/riscv128-softmmu/default.mak |  17 +
 configs/targets/riscv128-softmmu.mak         |   6 +
 include/disas/dis-asm.h                      |   1 +
 include/exec/memop.h                         |  12 +-
 include/hw/riscv/sifive_cpu.h                |   3 +
 include/qemu/int128.h                        | 264 ++++++
 target/arm/translate-a32.h                   |   4 +-
 target/riscv/cpu-param.h                     |  10 +
 target/riscv/cpu.h                           |  32 +
 target/riscv/cpu_bits.h                      |  11 +
 target/riscv/helper.h                        |   9 +
 target/riscv/insn16.decode                   |  32 +-
 target/riscv/insn32.decode                   |  24 +
 disas/riscv.c                                |   5 +
 target/arm/translate-a64.c                   |   8 +-
 target/arm/translate-neon.c                  |   6 +-
 target/arm/translate-sve.c                   |   2 +-
 target/arm/translate-vfp.c                   |   8 +-
 target/arm/translate.c                       |   2 +-
 target/ppc/translate.c                       |  24 +-
 target/riscv/cpu.c                           |  23 +-
 target/riscv/cpu_helper.c                    |  54 +-
 target/riscv/csr.c                           | 329 +++++++-
 target/riscv/gdbstub.c                       |   3 +
 target/riscv/m128_helper.c                   | 109 +++
 target/riscv/op_helper.c                     |  44 +
 target/riscv/translate.c                     | 308 ++++++-
 target/sparc/translate.c                     |   4 +-
 target/ppc/translate/fixedpoint-impl.c.inc   |  20 +-
 target/ppc/translate/fp-impl.c.inc           |   4 +-
 target/ppc/translate/vsx-impl.c.inc          |   4 +-
 target/riscv/insn_trans/trans_rvb.c.inc      |  48 +-
 target/riscv/insn_trans/trans_rvd.c.inc      |  12 +-
 target/riscv/insn_trans/trans_rvf.c.inc      |   6 +-
 target/riscv/insn_trans/trans_rvi.c.inc      | 803 ++++++++++++++++---
 target/riscv/insn_trans/trans_rvm.c.inc      | 273 ++++++-
 tcg/aarch64/tcg-target.c.inc                 |   2 +-
 tcg/arm/tcg-target.c.inc                     |  10 +-
 tcg/i386/tcg-target.c.inc                    |   4 +-
 tcg/mips/tcg-target.c.inc                    |   4 +-
 tcg/ppc/tcg-target.c.inc                     |   8 +-
 tcg/riscv/tcg-target.c.inc                   |   6 +-
 tcg/s390x/tcg-target.c.inc                   |  10 +-
 gdb-xml/riscv-128bit-cpu.xml                 |  48 ++
 gdb-xml/riscv-128bit-virtual.xml             |  12 +
 target/riscv/Kconfig                         |   3 +
 target/riscv/meson.build                     |   1 +
 47 files changed, 2358 insertions(+), 274 deletions(-)
 create mode 100644 configs/devices/riscv128-softmmu/default.mak
 create mode 100644 configs/targets/riscv128-softmmu.mak
 create mode 100644 target/riscv/m128_helper.c
 create mode 100644 gdb-xml/riscv-128bit-cpu.xml
 create mode 100644 gdb-xml/riscv-128bit-virtual.xml

-- 
2.33.0


