Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kou87-0001QC-N2
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kou81-0001A8-V8; Mon, 14 Dec 2020 15:07:29 -0500
Received: from home.keithp.com ([63.227.221.253]:51872 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kou80-0004H4-23; Mon, 14 Dec 2020 15:07:29 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 06ED03F2E37E;
 Mon, 14 Dec 2020 12:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607976441; bh=SHaBrTVYFaEGb4To3qkPAGlihv7272MZZpVhhlOyO1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LuNw2ZaDvhHrmM7DlwbXWqyGt2Kk9rujLnzy/QZ4H+oIEZXwsEabvd42ct3sBYxJQ
 dhzaIj0BHWQtEuPWc0ls7XoDqX0sySvH7xp/45BVT193CgV9yeHdyUq23aNrTBy9Ql
 9m51qYuqxRucJCE+skVCfhlZYs1id6fnWIm3gdUJouR2+GFdkr8g9vf6ZEiyOdq8az
 eR3FxEVi8TkYVPmMqTxNCWe4MYz3tjiycXVDW5O/NVAMxhe7my/qqXvRaLW/1FBjw8
 Zwu5MJhneaLY2cEVlnxYYVPg2VTwmaZsB6sYeBG2pOforKDbW+EVcUpN9KReHoyJxw
 Bw6g4ohH4X7Zw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id moJfYBEkvgQC; Mon, 14 Dec 2020 12:07:20 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id B9C4C3F2E37A;
 Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607976437; bh=SHaBrTVYFaEGb4To3qkPAGlihv7272MZZpVhhlOyO1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lQikXlR/ZLy2EEIdkPMWnOYaq+lT+w1rFYuaydjqXOv/u/TSZgZcBK3GnEzbFDKSa
 WmA5r0hhgDMoAvK5686xqXRVhevCezaIxVtL4hddEyYfb/cbmER4LUC9TZTl+jc4vG
 p/0tIlBAQAILOj/A/r8XIzl3OxUgVkaMCPisErvR1PNCA3MyzE0+XyF6wGh+nLrc27
 N3pFw9J+hHKgO0elyDcMuU9Z84PtVE3CKhqoUGAYlrdbi9EoZv2I9Oe9WcKKYETV/4
 c4/zoDtpN6rkBDd1toMt0Lj2BhRen2SRStr61AQ6qXj8JSflFxLgM5bsFM+uFRNx3E
 rTWCjTjz3Yz7g==
Received: by keithp.com (Postfix, from userid 1000)
 id 50F581582231; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
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
Date: Mon, 14 Dec 2020 12:07:10 -0800
Message-Id: <20201214200713.3886611-7-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214200713.3886611-1-keithp@keithp.com>
References: <87wnxktost.fsf@linaro.org>
 <20201214200713.3886611-1-keithp@keithp.com>
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
X-List-Received-Date: Mon, 14 Dec 2020 20:07:30 -0000

From: Kito Cheng <kito.cheng@sifive.com>

This could made testing more easier and ARM/AArch64 has supported on
their linux user mode too, so I think it should be reasonable.

Verified GCC testsuite with newlib/semihosting.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Keith Packard <keithp@keithp.com>
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


