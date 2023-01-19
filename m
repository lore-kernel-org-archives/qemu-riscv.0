Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIW2T-000806-9m
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1D-000744-NX
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:08 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1B-0006xW-LT
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:35:55 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pIW13-007gSL-Lb; Thu, 19 Jan 2023 14:35:46 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [RFC PATCH 00/39] Add RISC-V cryptography extensions standardisation
Date: Thu, 19 Jan 2023 14:34:49 +0000
Message-Id: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 Jan 2023 14:36:15 -0000

This RFC introduces an implementation for the six instruction sets
of the draft RISC-V cryptography extensions standardisation
specification. Once the specification has been ratified we will submit
these changes as a pull request email to this mailing list. Would this
be prefered by instruction group or unified as in this RFC?

This patch set implements the instruction sets as per the 20221202
version of the specification (1).

Work performed by Dickon, Lawrence, Nazar, Kiran, and William from Codethink
sponsored by SiFive, and Max Chou from SiFive.

1. https://github.com/riscv/riscv-crypto/releases

Dickon Hood (1):
  target/riscv: Add vrol.[vv,vx] and vror.[vv,vx,vi] decoding,
    translation and execution support

Kiran Ostrolenk (4):
  target/riscv: Add vsha2ms.vv decoding, translation and execution
    support
  target/riscv: add zvksh cpu property
  target/riscv: Add vsm3c.vi decoding, translation and execution support
  target/riscv: expose zvksh cpu property

Lawrence Hunter (16):
  target/riscv: Add vclmul.vv decoding, translation and execution
    support
  target/riscv: Add vclmul.vx decoding, translation and execution
    support
  target/riscv: Add vclmulh.vv decoding, translation and execution
    support
  target/riscv: Add vclmulh.vx decoding, translation and execution
    support
  target/riscv: Add vaesef.vv decoding, translation and execution
    support
  target/riscv: Add vaesef.vs decoding, translation and execution
    support
  target/riscv: Add vaesdf.vv decoding, translation and execution
    support
  target/riscv: Add vaesdf.vs decoding, translation and execution
    support
  target/riscv: Add vaesdm.vv decoding, translation and execution
    support
  target/riscv: Add vaesdm.vs decoding, translation and execution
    support
  target/riscv: Add vaesz.vs decoding, translation and execution support
  target/riscv: Add vsha2c[hl].vv decoding, translation and execution
    support
  target/riscv: Add vsm3me.vv decoding, translation and execution
    support
  target/riscv: add zvkg cpu property
  target/riscv: Add vghmac.vv decoding, translation and execution
    support
  target/riscv: expose zvkg cpu property

Max Chou (5):
  crypto: Move SM4_SBOXWORD from target/riscv
  crypto: Add SM4 constant parameter CK.
  target/riscv: Add zvksed cfg property
  target/riscv: Add Zvksed support
  target/riscv: Expose Zvksed property

Nazar Kazakov (10):
  target/riscv: add zvkb cpu property
  target/riscv: Add vrev8.v decoding, translation and execution support
  target/riscv: Add vandn.[vv,vx,vi] decoding, translation and execution
    support
  target/riscv: expose zvkb cpu property
  target/riscv: add zvkns cpu property
  target/riscv: Add vaeskf1.vi decoding, translation and execution
    support
  target/riscv: Add vaeskf2.vi decoding, translation and execution
    support
  target/riscv: expose zvkns cpu property
  target/riscv: add zvknh cpu properties
  target/riscv: expose zvknh cpu properties

William Salmon (3):
  target/riscv: Add vbrev8.v decoding, translation and execution support
  target/riscv: Add vaesem.vv decoding, translation and execution
    support
  target/riscv: Add vaesem.vs decoding, translation and execution
    support

 crypto/sm4.c                                 |   10 +
 include/crypto/sm4.h                         |    8 +
 include/qemu/bitops.h                        |   32 +
 target/arm/crypto_helper.c                   |   10 +-
 target/riscv/cpu.c                           |   15 +
 target/riscv/cpu.h                           |    7 +
 target/riscv/crypto_helper.c                 |    1 +
 target/riscv/helper.h                        |   69 ++
 target/riscv/insn32.decode                   |   48 +
 target/riscv/insn_trans/trans_rvzvkb.c.inc   |  164 +++
 target/riscv/insn_trans/trans_rvzvkg.c.inc   |    8 +
 target/riscv/insn_trans/trans_rvzvknh.c.inc  |   47 +
 target/riscv/insn_trans/trans_rvzvkns.c.inc  |  121 +++
 target/riscv/insn_trans/trans_rvzvksed.c.inc |   38 +
 target/riscv/insn_trans/trans_rvzvksh.c.inc  |   20 +
 target/riscv/meson.build                     |    4 +-
 target/riscv/translate.c                     |    6 +
 target/riscv/vcrypto_helper.c                | 1013 ++++++++++++++++++
 target/riscv/vector_helper.c                 |  242 +----
 target/riscv/vector_internals.c              |   63 ++
 target/riscv/vector_internals.h              |  226 ++++
 21 files changed, 1902 insertions(+), 250 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzvkb.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvkg.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvknh.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvkns.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvksed.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvksh.c.inc
 create mode 100644 target/riscv/vcrypto_helper.c
 create mode 100644 target/riscv/vector_internals.c
 create mode 100644 target/riscv/vector_internals.h

-- 
2.39.1


