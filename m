Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kxYrT-00010V-48
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jan 2021 12:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@vr.keithp.com>)
 id 1kxYrO-0000t4-Kl; Thu, 07 Jan 2021 12:14:06 -0500
Received: from home.keithp.com ([63.227.221.253]:55618 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@vr.keithp.com>)
 id 1kxYrL-0001pg-KI; Thu, 07 Jan 2021 12:14:06 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 6DD2A3F2E315;
 Thu,  7 Jan 2021 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1610039246; bh=9BOTQrPtZFuoNkEto83jhRHuzrY24cMlHGqNa4OHSIY=;
 h=From:To:Cc:Subject:Date:From;
 b=gNDedzCS515exhvhhtzTot0CtnkZW1iSO1ZPFPPrW5m/Ib9ji6Fo1jHJEWY1uBSRu
 RNOoegtnZOJnL4ZjlMIJyST5YFHVcLGWdbeVx8YD4EkUHGAr+bdOmeAX8i156tLxMp
 elI6gvNOQ6eef+NF3QnqBKBCDBE4x1p+yPzwvh9nkbIdyoRMzUOOl6ctiaxVFDSfCv
 lJ0NJ5SPm8jO/UFXT1C8DcPE3ewqr5NsMk2p+raA75NrtNl0fAZ/m/8jXdLW7uwrjF
 oJ+LxSQHOgutqov+a86WKz5XkF37+TqGZ2A6qutRriTAvUum6GAqgfmgvVcfP21M5I
 uAWoyrEew4yBA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id JrZe3ojHtXJn; Thu,  7 Jan 2021 09:07:26 -0800 (PST)
Received: from vr.keithp.com (vr.keithp.com [10.0.0.39])
 by elaine.keithp.com (Postfix) with ESMTP id E5CE53F2E325;
 Thu,  7 Jan 2021 09:07:23 -0800 (PST)
Received: by vr.keithp.com (Postfix, from userid 1000)
 id 65703742C81; Thu,  7 Jan 2021 09:07:23 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH 0/9] Add RISC-V semihosting 0.2. Finish ARM semihosting 2.0
Date: Thu,  7 Jan 2021 09:07:08 -0800
Message-Id: <20210107170717.2098982-1-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=63.227.221.253; envelope-from=keithp@vr.keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 07 Jan 2021 17:14:09 -0000

This series adds support for RISC-V Semihosting, version 0.2 as
specified here:

	https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2

This specification references the ARM semihosting release 2.0 as
specified here:

	https://static.docs.arm.com/100863/0200/semihosting.pdf

That specification includes several semihosting calls which were not
previously implemented. This series includes implementations for the
remaining calls so that both RISC-V and ARM versions are now complete.

Tests for release 2.0 can be found in picolibc on the semihost-2.0-all
branch:

	https://github.com/picolibc/picolibc/tree/semihost-2.0-all

These tests uncovered a bug in the SYS_HEAPINFO implementation for
ARM, which has been fixed in this series as well.

The series is structured as follows:

 1. Move shared semihosting files
 2. Change public common semihosting APIs
 3. Change internal semihosting interfaces
 4. Fix SYS_HEAPINFO crash on ARM
 5-6. Add RISC-V semihosting implementation
 7-9. Add missing semihosting operations from release 2.0



