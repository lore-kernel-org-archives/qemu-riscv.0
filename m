Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kou88-0001Rc-5n
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kou82-0001B1-9k; Mon, 14 Dec 2020 15:07:30 -0500
Received: from home.keithp.com ([63.227.221.253]:51870 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kou7z-0004H3-GG; Mon, 14 Dec 2020 15:07:30 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id D965F3F2E37D;
 Mon, 14 Dec 2020 12:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607976440; bh=AY23CfBi0c3vtSQCvpxnzKbVG3QpC88qHLH0dGoVpoI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F4DhU0zkZL89XzzLTcsmt+odzuBk4TMpQH0ZNS25zBVNqS4y/eQ0fjZ06k+wyufyb
 9FlUvkf5JHzFZVZXI/gp3GTMMFRYiuqt1MA9PTbryEw2YaDCih+tLoz8eoI6CNygPO
 L0Bv8S+5Ps4cvuwsZ2AziOTlU5Kj51WGH4OS2lp59a4DWjBhYxegcF25/fgxhN+R2K
 XbhSYCzolyJih3+/V/scdIct3Tebe8xX4oZL36/1TftDUvDN3oj9nB98pILMLU1PYW
 +/7eM0FvFXknSZmJGueP4kVZjp4u4+q3XilvU4PNgKTLSJkBOkvyriFalZ/eFxio1i
 YztD4EnozOeGQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id EnWiC6NnVfvt; Mon, 14 Dec 2020 12:07:20 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id C99493F2E391;
 Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607976437; bh=AY23CfBi0c3vtSQCvpxnzKbVG3QpC88qHLH0dGoVpoI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=woPLroOD667jpLIvfckXEoyx0d1jgITfLVKizZm7SGP6zEAdSbsXLTKSD84Tac0cv
 Bp9p0qroqDceD0XI1ztXljgEARTqs3nhAfmPMpLyleXMMS89YqbXVtVZD/d0R7PrTV
 gH55FkFrhotquAHmejt2vJnw6nOCd0LrBToXZEWWulKQlWacCmRFkJxLSBaf/D4F1S
 jrAvrO1Vn+m4UWSR9XXJVk5De1XWsznlpXaqv36WnVGHL5D69tAlc8VfroTmOxFEuh
 7LItHvaRvl/W/7nPUZ8YFNoarMlJbnyMLWhAuGVa040TXpgF0fjgIxMecQ7AR1+hij
 vCpt7pGLTpmww==
Received: by keithp.com (Postfix, from userid 1000)
 id 5964F1582298; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH 8/9] semihosting: Implement SYS_TMPNAM
Date: Mon, 14 Dec 2020 12:07:12 -0800
Message-Id: <20201214200713.3886611-9-keithp@keithp.com>
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
X-List-Received-Date: Mon, 14 Dec 2020 20:07:31 -0000

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index b1368d945c..b0648c3812 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -835,6 +835,7 @@ target_ulong do_common_semihosting(CPUState *cs)
     CPUArchState *env = cs->env_ptr;
     target_ulong args;
     target_ulong arg0, arg1, arg2, arg3;
+    target_ulong ul_ret;
     char * s;
     int nr;
     uint32_t ret;
@@ -998,8 +999,24 @@ target_ulong do_common_semihosting(CPUState *cs)
 
         return guestfd_fns[gf->type].flenfn(cs, gf);
     case TARGET_SYS_TMPNAM:
-        qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
-        return -1;
+        GET_ARG(0);
+        GET_ARG(1);
+        GET_ARG(2);
+        if (asprintf(&s, "/tmp/qemu-%x%02x", getpid(),
+                     (int) (arg1 & 0xff)) < 0) {
+            return -1;
+        }
+        ul_ret = (target_ulong) -1;
+
+        /* Make sure there's enough space in the buffer */
+        if (strlen(s) < arg2) {
+            char *output = lock_user(VERIFY_WRITE, arg0, arg2, 0);
+            strcpy(output, s);
+            unlock_user(output, arg0, arg2);
+            ul_ret = 0;
+        }
+        free(s);
+        return ul_ret;
     case TARGET_SYS_REMOVE:
         GET_ARG(0);
         GET_ARG(1);
-- 
2.29.2


