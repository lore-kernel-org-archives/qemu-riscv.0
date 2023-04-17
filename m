Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poPNb-0001qh-2i
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 09:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1poPNY-0001nt-7Y; Mon, 17 Apr 2023 09:58:48 -0400
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1poPNT-0002gH-QS; Mon, 17 Apr 2023 09:58:47 -0400
Received: from [167.98.27.226] (helo=lawrence-thinkpad.guest.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1poPNM-0034ER-Oc; Mon, 17 Apr 2023 14:58:36 +0100
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [PATCH v2 00/17] Add RISC-V vector cryptographic instruction set
 support
Date: Mon, 17 Apr 2023 14:58:04 +0100
Message-Id: <20230417135821.609964-1-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Apr 2023 13:58:48 -0000

This patchset provides an implementation for Zvbb, Zvbc, Zvkned, Zvknh, Zvksh,
Zvkg, and Zvksed of the draft RISC-V vector cryptography extensions as per the
v20230407 version of the specification(1) (3206f07). This is an update to the
patchset submitted to qemu-devel on Friday, 10 Mar 2023 16:03:01 +0000.

We've included the following refactorings:

  - squashed commits into one commit per extension with separate commits for
    each refactoring
  - unified trans_rvzvk*.c.inc files into one trans_rvvk.c.inc
  - style fixes in insn32.decode and other files
  - added macros for EGS values in translation functions.

We've also updated from v20230303 to v20230407 of the spec:
  - Zvkb has been split into Zvbb and Zvbc
  - vbrev, vclz, vctz, vcpop and vwsll have been added to Zvbb.

Please note that the Zvkt data-independent execution latency extension (and all
extensions including it) has not been implemented, and we would recommend not
using these patches in an environment where timing attacks are an issue.

Work performed by Dickon, Lawrence, Nazar, Kiran, and William from Codethink
sponsored by SiFive, as well as Max Chou and Frank Chang from SiFive.

For convenience we have created a git repo with our patches on top of a recent
master. https://github.com/CodethinkLabs/qemu-ct

1. https://github.com/riscv/riscv-crypto/releases

Dickon Hood (3):
  target/riscv: Refactor translation of vector-widening instruction
  qemu/bitops.h: Limit rotate amounts
  target/riscv: Add Zvbb ISA extension support

Kiran Ostrolenk (5):
  target/riscv: Refactor some of the generic vector functionality
  target/riscv: Refactor vector-vector translation macro
  target/riscv: Refactor some of the generic vector functionality
  qemu/host-utils.h: Add clz and ctz functions for lower-bit integers
  target/riscv: Add Zvknh ISA extension support

Lawrence Hunter (2):
  target/riscv: Add Zvbc ISA extension support
  target/riscv: Add Zvksh ISA extension support

Max Chou (3):
  crypto: Create sm4_subword
  crypto: Add SM4 constant parameter CK
  target/riscv: Add Zvksed ISA extension support

Nazar Kazakov (4):
  target/riscv: Move vector translation checks
  target/riscv: Add Zvkned ISA extension support
  target/riscv: Add Zvkg ISA extension support
  target/riscv: Expose Zvk* and Zvb[b,c] cpu properties

 accel/tcg/tcg-runtime-gvec.c             |   11 +
 accel/tcg/tcg-runtime.h                  |    1 +
 crypto/sm4.c                             |   10 +
 include/crypto/sm4.h                     |    9 +
 include/qemu/bitops.h                    |   24 +-
 include/qemu/host-utils.h                |   54 ++
 target/arm/tcg/crypto_helper.c           |   10 +-
 target/riscv/cpu.c                       |   39 +
 target/riscv/cpu.h                       |    8 +
 target/riscv/helper.h                    |   95 ++
 target/riscv/insn32.decode               |   58 ++
 target/riscv/insn_trans/trans_rvv.c.inc  |  145 ++-
 target/riscv/insn_trans/trans_rvvk.c.inc |  617 +++++++++++++
 target/riscv/meson.build                 |    4 +-
 target/riscv/op_helper.c                 |    6 +
 target/riscv/translate.c                 |    1 +
 target/riscv/vcrypto_helper.c            | 1052 ++++++++++++++++++++++
 target/riscv/vector_helper.c             |  243 +----
 target/riscv/vector_internals.c          |   81 ++
 target/riscv/vector_internals.h          |  228 +++++
 20 files changed, 2362 insertions(+), 334 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvvk.c.inc
 create mode 100644 target/riscv/vcrypto_helper.c
 create mode 100644 target/riscv/vector_internals.c
 create mode 100644 target/riscv/vector_internals.h

-- 
2.40.0


