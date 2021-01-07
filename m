Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kxYvt-0005rr-JR
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jan 2021 12:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@vr.keithp.com>)
 id 1kxYvs-0005oU-C4; Thu, 07 Jan 2021 12:18:44 -0500
Received: from home.keithp.com ([63.227.221.253]:55722 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@vr.keithp.com>)
 id 1kxYvq-0003Uw-NM; Thu, 07 Jan 2021 12:18:44 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id D09783F2E325;
 Thu,  7 Jan 2021 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1610039246; bh=bhuL9gru7dcwx7hNurPSG0LXo6Gk/htLgalKFE4yYNQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zfa93vr1u9afwP+YSO+A13dxkreCFQveHsyyh3lk7ZvpgWFrCvari1WRkCYDBrWKT
 4C3W4Q0V7YYrTBgZG8RPH5RWHfD9E8zLEKNNrmnrm9ZJA2dHpLmq+8abhN5wXaR7uF
 MzuWNAKCfX3SC17bNbirn6LgVAAhN8HwiAAPnusmC4/pckjgjzGdoDp1ddRN7iMxYg
 2qDwD+pw/JAr+5Sn6kpL6iB8VsXe9pD6ZSd4spIWWZ196KRmfeuveGVR27BRp+6zFO
 J+OHYaEh9NPRZNBPrPebn4fce8N33gOC17EvQqHkyR86LsCinpfrf6/3PVRgWmJ2Ww
 IOV3iCgfXpTUw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id TcbzPHBZo4ah; Thu,  7 Jan 2021 09:07:26 -0800 (PST)
Received: from vr.keithp.com (vr.keithp.com [10.0.0.39])
 by elaine.keithp.com (Postfix) with ESMTP id 0C36B3F2E35D;
 Thu,  7 Jan 2021 09:07:24 -0800 (PST)
Received: by vr.keithp.com (Postfix, from userid 1000)
 id E3715742D0D; Thu,  7 Jan 2021 09:07:23 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Kito Cheng <kito.cheng@sifive.com>, Keith Packard <keithp@keithp.com>
Subject: [PATCH 6/9] riscv: Add semihosting support for user mode
Date: Thu,  7 Jan 2021 09:07:14 -0800
Message-Id: <20210107170717.2098982-7-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107170717.2098982-1-keithp@keithp.com>
References: <20210107170717.2098982-1-keithp@keithp.com>
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
X-List-Received-Date: Thu, 07 Jan 2021 17:18:45 -0000

From: Kito Cheng <kito.cheng@sifive.com>

This could made testing more easier and ARM/AArch64 has supported on
their linux user mode too, so I think it should be reasonable.

Verified GCC testsuite with newlib/semihosting.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Keith Packard <keithp@keithp.com>
Message-Id: <20201214200713.3886611-7-keithp@keithp.com>
---
 linux-user/riscv/cpu_loop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index aa9e437875..9665dabb09 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -23,6 +23,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "elf.h"
+#include "hw/semihosting/common-semi.h"
 
 void cpu_loop(CPURISCVState *env)
 {
@@ -91,6 +92,10 @@ void cpu_loop(CPURISCVState *env)
             sigcode = TARGET_SEGV_MAPERR;
             sigaddr = env->badaddr;
             break;
+        case RISCV_EXCP_SEMIHOST:
+            env->gpr[xA0] = do_common_semihosting(cs);
+            env->pc += 4;
+            break;
         case EXCP_DEBUG:
         gdbstep:
             signum = TARGET_SIGTRAP;
-- 
2.29.2


