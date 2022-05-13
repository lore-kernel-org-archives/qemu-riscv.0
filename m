Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npRsh-000672-0K
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 05:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRse-00060W-Mn; Fri, 13 May 2022 05:46:40 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:53432
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRsc-0004zq-TC; Fri, 13 May 2022 05:46:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 2D951300089;
 Fri, 13 May 2022 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652435196;
 bh=TLnUEwKN/kexjxeay7Y8S/KC+ywqS291/qPkVp5ueH8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=sCL2ElUeiHtcWJDk1t0g8LwK3LKcEq3bZw6kaG7wNy05E00RXUDhaE62+y0oNxz8I
 RrwY7tUlUoaZmlcaQ4tZeXtWn6l8feHMyaZNqVMauTkmYrGjb7OmLHKcKGmUZofU8C
 2UPsJ6sSWBkc6j3UWSeUGY6/+kXyLWCjr+FTuMTM=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 5/5] target/riscv: Move/refactor ISA extension checks
Date: Fri, 13 May 2022 18:45:50 +0900
Message-Id: <f409b6e9d8930ca9687b3ea1b08cc2eaa92e42ac.1652435138.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652435138.git.research_trasio@irq.a4lg.com>
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Fri, 13 May 2022 09:46:41 -0000

We should separate "check" and "configure" steps as possible.
This commit separates both steps except vector/Zfinx-related checks.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5371b0fd17..f654a6727f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -635,11 +635,23 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
+        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
+            error_setg(errp, "Zve32f/Zve64f extensions require F extension");
+            return;
+        }
+
+        /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
             cpu->cfg.ext_zhinxmin) {
             cpu->cfg.ext_zfinx = true;
         }
 
+        if (cpu->cfg.ext_zfinx && !cpu->cfg.ext_f) {
+            error_setg(errp,
+                    "Zfinx cannot be supported together with F extension");
+            return;
+        }
+
         if (cpu->cfg.ext_zk) {
             cpu->cfg.ext_zkn = true;
             cpu->cfg.ext_zkr = true;
@@ -663,7 +675,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             cpu->cfg.ext_zksh = true;
         }
 
-        /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_i) {
             ext |= RVI;
         }
@@ -734,20 +745,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
-        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
-            error_setg(errp, "Zve32f/Zve64f extension depends upon RVF.");
-            return;
-        }
         if (cpu->cfg.ext_j) {
             ext |= RVJ;
         }
-        if (cpu->cfg.ext_zfinx && ((ext & (RVF | RVD)) || cpu->cfg.ext_zfh ||
-                                   cpu->cfg.ext_zfhmin)) {
-            error_setg(errp,
-                    "'Zfinx' cannot be supported together with 'F', 'D', 'Zfh',"
-                    " 'Zfhmin'");
-            return;
-        }
 
         set_misa(env, env->misa_mxl, ext);
     }
-- 
2.34.1


