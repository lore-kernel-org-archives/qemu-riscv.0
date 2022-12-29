Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAp8O-0003gs-OD
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 04:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pAp8D-0003cL-TV; Thu, 29 Dec 2022 04:23:22 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pAp8B-0002j4-SE; Thu, 29 Dec 2022 04:23:21 -0500
X-QQ-Spam: true
X-QQ-mid: bizesmtp73t1672305542t3rjmcvu
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 29 Dec 2022 17:19:01 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 11/12] hw/riscv/boot.c: Introduce riscv_find_firmware()
Date: Thu, 29 Dec 2022 17:18:27 +0800
Message-Id: <20221229091828.1945072-12-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229091828.1945072-1-bmeng@tinylab.org>
References: <20221229091828.1945072-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 29 Dec 2022 09:23:26 -0000

Rename previous riscv_find_firmware() to riscv_find_bios(), and
introduce a new riscv_find_firmware() to implement the first half
part of the work done in riscv_find_and_load_firmware().

This new API is helpful for machine that wants to know the final
chosen firmware file name but does not want to load it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 include/hw/riscv/boot.h |  2 ++
 hw/riscv/boot.c         | 39 +++++++++++++++++++++++++--------------
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 60cf320c88..b273ab22f7 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -38,6 +38,8 @@ target_ulong riscv_find_and_load_firmware(MachineState *machine,
                                           hwaddr firmware_load_addr,
                                           symbol_fn_t sym_cb);
 const char *riscv_default_firmware_name(RISCVHartArrayState *harts);
+char *riscv_find_firmware(const char *firmware_filename,
+                          const char *default_machine_firmware);
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index e1a544b1d9..98b80af51b 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -84,11 +84,11 @@ const char *riscv_default_firmware_name(RISCVHartArrayState *harts)
     return RISCV64_BIOS_BIN;
 }
 
-static char *riscv_find_firmware(const char *firmware_filename)
+static char *riscv_find_bios(const char *bios_filename)
 {
     char *filename;
 
-    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_filename);
     if (filename == NULL) {
         if (!qtest_enabled()) {
             /*
@@ -97,8 +97,8 @@ static char *riscv_find_firmware(const char *firmware_filename)
              * running QEMU test will complain hence let's suppress the error
              * report for QEMU testing.
              */
-            error_report("Unable to load the RISC-V firmware \"%s\"",
-                         firmware_filename);
+            error_report("Unable to find the RISC-V BIOS \"%s\"",
+                         bios_filename);
             exit(1);
         }
     }
@@ -106,25 +106,36 @@ static char *riscv_find_firmware(const char *firmware_filename)
     return filename;
 }
 
-target_ulong riscv_find_and_load_firmware(MachineState *machine,
-                                          const char *default_machine_firmware,
-                                          hwaddr firmware_load_addr,
-                                          symbol_fn_t sym_cb)
+char *riscv_find_firmware(const char *firmware_filename,
+                          const char *default_machine_firmware)
 {
-    char *firmware_filename = NULL;
-    target_ulong firmware_end_addr = firmware_load_addr;
+    char *filename = NULL;
 
-    if ((!machine->firmware) || (!strcmp(machine->firmware, "default"))) {
+    if ((!firmware_filename) || (!strcmp(firmware_filename, "default"))) {
         /*
          * The user didn't specify -bios, or has specified "-bios default".
          * That means we are going to load the OpenSBI binary included in
          * the QEMU source.
          */
-        firmware_filename = riscv_find_firmware(default_machine_firmware);
-    } else if (strcmp(machine->firmware, "none")) {
-        firmware_filename = riscv_find_firmware(machine->firmware);
+        filename = riscv_find_bios(default_machine_firmware);
+    } else if (strcmp(firmware_filename, "none")) {
+        filename = riscv_find_bios(firmware_filename);
     }
 
+    return filename;
+}
+
+target_ulong riscv_find_and_load_firmware(MachineState *machine,
+                                          const char *default_machine_firmware,
+                                          hwaddr firmware_load_addr,
+                                          symbol_fn_t sym_cb)
+{
+    char *firmware_filename;
+    target_ulong firmware_end_addr = firmware_load_addr;
+
+    firmware_filename = riscv_find_firmware(machine->firmware,
+                                            default_machine_firmware);
+
     if (firmware_filename) {
         /* If not "none" load the firmware */
         firmware_end_addr = riscv_load_firmware(firmware_filename,
-- 
2.34.1


