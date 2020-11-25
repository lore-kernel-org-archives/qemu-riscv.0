Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ki2T4-0002c1-ON
	for mharc-qemu-riscv@gnu.org; Wed, 25 Nov 2020 16:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1ki2Sx-0002M1-W8; Wed, 25 Nov 2020 16:36:45 -0500
Received: from home.keithp.com ([63.227.221.253]:37066 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1ki2Sv-0001Eg-ID; Wed, 25 Nov 2020 16:36:43 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 887533F2E28D;
 Wed, 25 Nov 2020 13:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1606340194; bh=FgE+/ceRdQ5QyczkoIKEDBQkeANqnbnZZ159aE22FPc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GfsxZTibe8Udu5GnRr2FGaSJgAgUAJ/OU3wuvsXClaDgKq/0B7F70y5FzIp7nIdxR
 z2XlXuVX6lmKdgP//BxLtWuEhUURQyxfZzh18RRQsQkxFO07+EF/r1WhBsuIrnjr0x
 vD+sA7pay6dAN5euR/KtdlgoaxfxlfVumEk53lTQ14kiIRJ/SAMIBE3x4hyEv2yqoT
 wreljoMw+pBCwpJeprpgjvFYxANZ1gY8SImD9Bm/p80j5xntoOPHu0CBG6aQY9zy7F
 7jOl+CkIbpQQa5KFIIedECcjRououIeSwHRN4FEYlFr29ZjShh5KbpYidwrFq9fTI6
 QwQRhddULBnCQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 328h7N6Smk8K; Wed, 25 Nov 2020 13:36:34 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id DEB2A3F2E290;
 Wed, 25 Nov 2020 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1606340191; bh=FgE+/ceRdQ5QyczkoIKEDBQkeANqnbnZZ159aE22FPc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NukZG3Dxu+PDk2NKh4YZIKRnizoHsVPc9HYjba3XvSdjsBZjIJ8UxHJmcJi4QRMeG
 JbSFYkdLS0AjJA4H+cL7Dfc3bJxjcfUqWgd2e2sHrHd0Bnf0hEha7R7fUocIdVB3Ub
 uAuPNLT8sxFrt0IAPHo0vZSR08Qkz05KiYPvoQu6ZJobB9nOixEgnmA1JREAhJOQ4e
 AYx4mjizBm1og9CiGy7bL+SEmJpTmQsf6N7JSDEq7iBmEYLvQ5RszC98AwJmdioupK
 Gd+VqBEbULn6+2M30ZnIp7iXNlyDwJXLGcRzyhI0RakUU5kyYvWe2dS9bFAO+G2JFi
 dCEr5MuW9mF3Q==
Received: by keithp.com (Postfix, from userid 1000)
 id B5D6C15821C8; Wed, 25 Nov 2020 13:36:31 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH 8/8] semihosting: Implement SYS_ISERROR
Date: Wed, 25 Nov 2020 13:36:17 -0800
Message-Id: <20201125213617.2496935-9-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125213617.2496935-1-keithp@keithp.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
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
X-List-Received-Date: Wed, 25 Nov 2020 21:36:45 -0000

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index 9a04d98e4e..fda0e714ef 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -55,6 +55,7 @@
 #define TARGET_SYS_WRITE       0x05
 #define TARGET_SYS_READ        0x06
 #define TARGET_SYS_READC       0x07
+#define TARGET_SYS_ISERROR     0x08
 #define TARGET_SYS_ISTTY       0x09
 #define TARGET_SYS_SEEK        0x0a
 #define TARGET_SYS_FLEN        0x0c
@@ -962,6 +963,9 @@ target_ulong do_common_semihosting(CPUState *cs)
         return guestfd_fns[gf->type].readfn(cs, gf, arg1, len);
     case TARGET_SYS_READC:
         return qemu_semihosting_console_inc(cs->env_ptr);
+    case TARGET_SYS_ISERROR:
+        GET_ARG(0);
+        return (target_long) arg0 < 0 ? 1 : 0;
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
 
-- 
2.29.2


