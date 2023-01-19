Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIWJj-0003s2-6R
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIWJh-0003oj-BL
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:55:01 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIWJg-0002iV-1t
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:55:01 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pIW1R-007gSL-4q; Thu, 19 Jan 2023 14:36:10 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [RFC PATCH 32/39] target/riscv: add zvkg cpu property
Date: Thu, 19 Jan 2023 14:35:21 +0000
Message-Id: <20230119143528.1290950-33-lawrence.hunter@codethink.co.uk>
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
X-List-Received-Date: Thu, 19 Jan 2023 14:55:01 -0000

Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/cpu.c | 1 +
 target/riscv/cpu.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c0c2d70abf..8045a7cec0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -101,6 +101,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_12_0, ext_zve32f),
     ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
     ISA_EXT_DATA_ENTRY(zvkb, true, PRIV_VERSION_1_12_0, ext_zvkb),
+    ISA_EXT_DATA_ENTRY(zvkg, true, PRIV_VERSION_1_12_0, ext_zvkg),
     ISA_EXT_DATA_ENTRY(zvknha, true, PRIV_VERSION_1_12_0, ext_zvknha),
     ISA_EXT_DATA_ENTRY(zvknhb, true, PRIV_VERSION_1_12_0, ext_zvknhb),
     ISA_EXT_DATA_ENTRY(zvkns, true, PRIV_VERSION_1_12_0, ext_zvkns),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 92624bfc57..b3b1174d74 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -462,6 +462,7 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
     bool ext_zvkb;
+    bool ext_zvkg;
     bool ext_zvknha;
     bool ext_zvknhb;
     bool ext_zvkns;
-- 
2.39.1


