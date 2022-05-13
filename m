Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npRtS-0007Wh-SN
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 05:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRtR-0007Su-Ee; Fri, 13 May 2022 05:47:29 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:53432
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRtP-00054f-K6; Fri, 13 May 2022 05:47:29 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 5423C300089;
 Fri, 13 May 2022 09:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652435245;
 bh=0HgLZO4BtVFdU4tnF8DdA/gkMFfk00nDFMV7cnelZMU=;
 h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:
 Content-Transfer-Encoding;
 b=BNDg3IUug+rTwqWat7/8cgvbReQ6JH8ZX+UHitMH3Fw4HiFUnqKkNilJdTLH7J7no
 +Ex0ItvXRUYPTCYIm3SbAgwVZ/iFU/AVTM/9v88AUbWNBSaNWZhhj0kk2C5io9y2bj
 SPd7RJnjOMHalN7onBfPXoZrINL6+eHrsqG7g4G4=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 0/2] hw/riscv: Make CPU config error handling generous
Date: Fri, 13 May 2022 18:47:17 +0900
Message-Id: <cover.1652435235.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=153.120.152.154;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 13 May 2022 09:47:30 -0000

Hello,

This patchset involves error handling on RISC-V CPU configuration error.

For instance:

    -cpu rv64,f=on,zfinx=on

This is an example of invalid CPU configuration because "F" and "Zfinx"
cannot coexist.  Detecting such error is a good thing.

The bad thing is, it aborts when such invalid configuration is detected.
I'm making changes to QEMU on Ubuntu 22.04 LTS but once I got a pop-up
window asking whether to send a crash report.  Even if not, it generates
core dumps.  That's not what I wanted.

    Example of error message before this patchset:
    Unexpected error in riscv_cpu_realize() at ../../../../src/qemu/target/riscv/cpu.c:718:
    qemu-system-riscv64: 'Zfinx' cannot be supported together with 'F', 'D', 'Zfh', 'Zfhmin'
    Aborted (core dumped)
    $ (returns to shell but may show error report window on some OS)

Such extreme error handling should be only used on serious runtime errors,
not for minor user-configuration mistakes (that can be easily and *safely*
detectable).

    Example of error message after this patchset:
    qemu-system-riscv64: 'Zfinx' cannot be supported together with 'F', 'D', 'Zfh', 'Zfhmin'
    $ (returns to shell with error status [$?] of 1)

This patchset resolves this problem on following machines, changing error
handling structure from `error_abort' (aborts and generates core dumps
[depends on OS] on error) to `error_fatal' (shows error message and quits
with error status 1 on error):

-   spike (QEMU default)
-   virt
-   sifive_e
-   sifive_u
-   opentitan (RV32 only)

`error_abort' on CPU realization exists on following machines:

-   shakti_c (RV64 only)
-   microchip-icicle-kit (RV64 only)

...but since CPU realization on those machine currently never fails
(because they require fixed CPU), I didn't touch those (may be a TODO).




Tsukasa OI (2):
  target/riscv: Make CPU config error handling generous (virt/spike)
  target/riscv: Make CPU config error handling generous
    (sifive_e/u/opentitan)

 hw/riscv/opentitan.c | 2 +-
 hw/riscv/sifive_e.c  | 2 +-
 hw/riscv/sifive_u.c  | 4 ++--
 hw/riscv/spike.c     | 2 +-
 hw/riscv/virt.c      | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)


base-commit: 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9ab
-- 
2.34.1


