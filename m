Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIW2e-0008BT-0l
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1j-0007Ej-5Q
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:28 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1e-00072X-1O
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:24 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pIW1O-007gSL-Br; Thu, 19 Jan 2023 14:36:07 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Subject: [RFC PATCH 27/39] target/riscv: expose zvknh cpu properties
Date: Thu, 19 Jan 2023 14:35:16 +0000
Message-Id: <20230119143528.1290950-28-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
References: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 Jan 2023 14:36:29 -0000

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 50bc96be5c..09d9686baf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1075,6 +1075,8 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
 
     DEFINE_PROP_BOOL("zvkb", RISCVCPU, cfg.ext_zvkb, false),
+    DEFINE_PROP_BOOL("zvknha", RISCVCPU, cfg.ext_zvknha, false),
+    DEFINE_PROP_BOOL("zvknhb", RISCVCPU, cfg.ext_zvknhb, false),
     DEFINE_PROP_BOOL("zvkns", RISCVCPU, cfg.ext_zvkns, false),
 
     /* Vendor-specific custom extensions */
-- 
2.39.1


