Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYETe-0007xd-KN
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETW-0007wD-KF; Wed, 06 Oct 2021 17:29:19 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETU-0007l5-82; Wed, 06 Oct 2021 17:29:18 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 57C2C40FCE;
 Wed,  6 Oct 2021 23:29:08 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 3F97F60066;
 Wed,  6 Oct 2021 23:29:08 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 6AB5914005C;
 Wed,  6 Oct 2021 23:29:07 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 00/27] Adding partial support for 128-bit riscv target
Date: Wed,  6 Oct 2021 23:28:06 +0200
Message-Id: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 06 Oct 2021 21:29:20 -0000

This series of patches provides partial 128-bit support for the riscv
target architecture.
Feedback on v1 was most useful and led to many improvements.
+ the load and store make use of a not yet upstreamed patch from Richard,
+ use of the existing Int128 computations in helpers, and addition of
  a few more operations there, in particular division and remainder
+ refactoring of the calls to the code generation helpers, as suggested
  by Richard, lead to a much cleaner solution. I did that for gen_arith
  and gen_shift, not for gen_unary as it used only for the bitmanip
  extension that I did not take into consideration yet
+ split of the patch in smaller pieces, as advised by Alistair

Two things suggested I could not achieve:
- the total eviction of the #ifdefs taking the target size into account:
  I cheated by using #else when I needed, IMHO a shame
- the qemu_build_not_reached() use when accessing the upper part of the
  registers: the misa/misah field is used for this check, and in 128-bit
  the compiler cannot infer that the field is read only.

The checks I made in between each patch:
* smooth boot of busybear linux on rv64
* correct execution of all riscv-probe programs on rv32

For the 128-bit, the tests are there: https://github.com/fpetrot/128-test
* from hash 925e1af2c7, run the tests in unit_test_i
* from hash 6d4a39f2c4, run in addition the tests in unit_test_m
* from hash 864e563916, run in addition the tests unit_test_csr


Frédéric Pétrot (27):
  memory: add a few defines for octo (128-bit) values
  Int128.h: addition of a few 128-bit operations
  target/riscv: adding upper 64 bits for misa
  target/riscv: array for the 64 upper bits of 128-bit registers
  target/riscv: additional macros to check instruction support
  target/riscv: separation of bitwise logic and aritmetic helpers
  target/riscv: refactoring calls to gen_arith
  target/riscv: refactoring calls to gen_shift
  target/riscv: setup everything so that riscv128-softmmu compiles
  target/riscv: adding accessors to the registers upper part
  target/riscv: handling 128-bit part in logic/arith/shift gen helpers
  target/riscv: moving some insns close to similar insns
  target/riscv: rename a few gen function helpers
  target/riscv: 128-bit support for instructions using
    gen_arith/gen_logic
  target/riscv: 128-bit support for instructions using gen_shift
  target/riscv: support for 128-bit loads and store
  target/riscv: 128-bit double word integer arithmetic instructions
  target/riscv: 128-bit double word integer shift instructions
  target/riscv: support for 128-bit base multiplications insns
  target/riscv: addition of the 'd' insns for 128-bit mult/div/rem
  target/riscv: div and rem insns on 128-bit
  target/riscv: adding high part of some csrs
  target/riscv: helper functions to wrap calls to 128-bit csr insns
  target/riscv: modification of the trans_csrxx for 128-bit support
  target/riscv: actual functions to realize crs 128-bit insns
  target/riscv: adding 128-bit access functions for some csrs
  target/riscv: support for 128-bit satp

 configs/devices/riscv128-softmmu/default.mak |  17 +
 configs/targets/riscv128-softmmu.mak         |   6 +
 include/exec/memop.h                         |   6 +
 include/hw/riscv/sifive_cpu.h                |   3 +
 include/qemu/int128.h                        | 264 ++++++
 target/riscv/cpu-param.h                     |  10 +
 target/riscv/cpu.h                           |  40 +
 target/riscv/cpu_bits.h                      |  11 +
 target/riscv/helper.h                        |   9 +
 target/riscv/insn16.decode                   |  32 +-
 target/riscv/insn32.decode                   |  25 +
 target/riscv/cpu.c                           |  49 +-
 target/riscv/cpu_helper.c                    |  54 +-
 target/riscv/csr.c                           | 329 ++++++-
 target/riscv/gdbstub.c                       |   3 +
 target/riscv/m128_helper.c                   | 109 +++
 target/riscv/op_helper.c                     |  44 +
 target/riscv/translate.c                     | 351 ++++++-
 target/riscv/insn_trans/trans_rvb.c.inc      |  80 +-
 target/riscv/insn_trans/trans_rvd.c.inc      |  12 +-
 target/riscv/insn_trans/trans_rvf.c.inc      |   6 +-
 target/riscv/insn_trans/trans_rvi.c.inc      | 936 ++++++++++++++++---
 target/riscv/insn_trans/trans_rvm.c.inc      | 352 ++++++-
 gdb-xml/riscv-128bit-cpu.xml                 |  48 +
 gdb-xml/riscv-128bit-virtual.xml             |  12 +
 target/riscv/Kconfig                         |   3 +
 target/riscv/meson.build                     |   1 +
 27 files changed, 2579 insertions(+), 233 deletions(-)
 create mode 100644 configs/devices/riscv128-softmmu/default.mak
 create mode 100644 configs/targets/riscv128-softmmu.mak
 create mode 100644 target/riscv/m128_helper.c
 create mode 100644 gdb-xml/riscv-128bit-cpu.xml
 create mode 100644 gdb-xml/riscv-128bit-virtual.xml

-- 
2.33.0


