Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ki2St-0002Gc-If
	for mharc-qemu-riscv@gnu.org; Wed, 25 Nov 2020 16:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1ki2Sr-0002GF-Pa; Wed, 25 Nov 2020 16:36:37 -0500
Received: from home.keithp.com ([63.227.221.253]:36926 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1ki2Sp-0001AK-DD; Wed, 25 Nov 2020 16:36:37 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 8C88B3F2E288;
 Wed, 25 Nov 2020 13:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1606340187; bh=tGkOZyd/9GYTCytL2ts1t7fw0WSivX7vnC0R1Ld40Ic=;
 h=From:To:Cc:Subject:Date:From;
 b=nWkQYM97UV7iwR0u/pS6MXBkIaAgEa/0fqiwa0YRkG9DNyeLBGnQ+OJ6qLQzgG0/6
 xw3iF2DKV1m/6faCVfHpFXSfmcD8dvzDgnFAXdlfH9/+psdvE8Bh6HkdJ9gp3lmo+o
 E+5uZhtcUHDUKqwU1AZp0e6tSoVyPlf2TikAehb/mvgo8pk9B8gsHws2vDOn20ibAb
 ZNsiUOLeW9n24HH6uKX5IFrBUcQ0DtelDVf1UMLfY/CmxY9bNUXYwWMxkQtlN2fJOR
 TesXDe7An3OE7nvVFGeJpRxsOiDW5VNhY/abZx/yMYz+eq4DXTBRDC0kXTiNR3NqMh
 fCg2C8Pt8yP+g==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 16__NwTy8MBl; Wed, 25 Nov 2020 13:36:27 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 2BC2A3F2E287;
 Wed, 25 Nov 2020 13:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1606340187; bh=tGkOZyd/9GYTCytL2ts1t7fw0WSivX7vnC0R1Ld40Ic=;
 h=From:To:Cc:Subject:Date:From;
 b=nWkQYM97UV7iwR0u/pS6MXBkIaAgEa/0fqiwa0YRkG9DNyeLBGnQ+OJ6qLQzgG0/6
 xw3iF2DKV1m/6faCVfHpFXSfmcD8dvzDgnFAXdlfH9/+psdvE8Bh6HkdJ9gp3lmo+o
 E+5uZhtcUHDUKqwU1AZp0e6tSoVyPlf2TikAehb/mvgo8pk9B8gsHws2vDOn20ibAb
 ZNsiUOLeW9n24HH6uKX5IFrBUcQ0DtelDVf1UMLfY/CmxY9bNUXYwWMxkQtlN2fJOR
 TesXDe7An3OE7nvVFGeJpRxsOiDW5VNhY/abZx/yMYz+eq4DXTBRDC0kXTiNR3NqMh
 fCg2C8Pt8yP+g==
Received: by keithp.com (Postfix, from userid 1000)
 id CF96D15821B9; Wed, 25 Nov 2020 13:36:26 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH 0/8] Add RISC-V semihosting 0.2. Finish ARM semihosting 2.0
Date: Wed, 25 Nov 2020 13:36:09 -0800
Message-Id: <20201125213617.2496935-1-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 25 Nov 2020 21:36:38 -0000

This series adds support for RISC-V Semihosting, version 0.2 as
specified here:

	https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2

This specification references the ARM semihosting release 2.0 as specified here:

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
 5. Add RISC-V semihosting implementation
 6-8. Add missing semihosting operations from release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>



