Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjztZ-0001po-CS
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 05:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjztY-0001pG-32; Wed, 05 Apr 2023 05:57:36 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjztV-00077V-Ao; Wed, 05 Apr 2023 05:57:35 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowACHjxcBRi1kENNKDg--.27388S3;
 Wed, 05 Apr 2023 17:57:23 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v4 1/1] hw/riscv: Add signature dump function for spike to run
 ACT tests
Date: Wed,  5 Apr 2023 17:57:20 +0800
Message-Id: <20230405095720.75848-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405095720.75848-1-liweiwei@iscas.ac.cn>
References: <20230405095720.75848-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHjxcBRi1kENNKDg--.27388S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZF1DXrWfZF1fuF1UGr4rKrg_yoWrury7pF
 ZxCFn3ury5JFn3GFnxtw1UGa15Gan5Wr1jkr13Zr1kZFs8WFy7Caykt3W7Za98Gr4Ivw45
 Ar4DKFW7GF45Zw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPF14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWx
 Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5SoX
 UUUUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 05 Apr 2023 09:57:36 -0000

Add signature and signature-granularity properties in spike to specify the target
signatrue file and the line size for signature data.

Recgonize the signature section between begin_signature and end_signature symbols
when loading elf of ACT tests. Then dump signature data in signature section just
before the ACT tests exit.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 hw/char/riscv_htif.c         | 44 +++++++++++++++++++++++++++++++++++-
 hw/riscv/spike.c             | 13 +++++++++++
 include/hw/char/riscv_htif.h |  3 +++
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 098de50e35..37d3ccc76b 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -29,6 +29,8 @@
 #include "chardev/char-fe.h"
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
+#include "exec/address-spaces.h"
+#include "sysemu/dma.h"
 
 #define RISCV_DEBUG_HTIF 0
 #define HTIF_DEBUG(fmt, ...)                                                   \
@@ -51,7 +53,10 @@
 /* PK system call number */
 #define PK_SYS_WRITE            64
 
-static uint64_t fromhost_addr, tohost_addr;
+const char *sig_file;
+uint8_t line_size = 16;
+
+static uint64_t fromhost_addr, tohost_addr, begin_sig_addr, end_sig_addr;
 
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
                           uint64_t st_size)
@@ -68,6 +73,10 @@ void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
             error_report("HTIF tohost must be 8 bytes");
             exit(1);
         }
+    } else if (strcmp("begin_signature", st_name) == 0) {
+        begin_sig_addr = st_value;
+    } else if (strcmp("end_signature", st_name) == 0) {
+        end_sig_addr = st_value;
     }
 }
 
@@ -163,6 +172,39 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
             if (payload & 0x1) {
                 /* exit code */
                 int exit_code = payload >> 1;
+
+                /*
+                 * Dump signature data if sig_file is specified and
+                 * begin/end_signature symbols exist.
+                 */
+                if (sig_file && begin_sig_addr && end_sig_addr) {
+                    uint64_t sig_len = end_sig_addr - begin_sig_addr;
+                    char *sig_data = g_malloc(sig_len);
+                    dma_memory_read(&address_space_memory, begin_sig_addr,
+                                    sig_data, sig_len, MEMTXATTRS_UNSPECIFIED);
+                    FILE *signature = fopen(sig_file, "w");
+                    if (signature == NULL) {
+                        error_report("Unable to open %s with error %s",
+                                     sig_file, strerror(errno));
+                        exit(1);
+                    }
+
+                    for (int i = 0; i < sig_len; i += line_size) {
+                        for (int j = line_size; j > 0; j--) {
+                            if (i + j <= sig_len) {
+                                fprintf(signature, "%02x",
+                                        sig_data[i + j - 1] & 0xff);
+                            } else {
+                                fprintf(signature, "%02x", 0);
+                            }
+                        }
+                        fprintf(signature, "\n");
+                    }
+
+                    fclose(signature);
+                    g_free(sig_data);
+                }
+
                 exit(exit_code);
             } else {
                 uint64_t syscall[8];
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index a584d5b3a2..2c5546560a 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -332,6 +332,11 @@ static void spike_board_init(MachineState *machine)
                  htif_custom_base);
 }
 
+static void spike_set_signature(Object *obj, const char *val, Error **errp)
+{
+    sig_file = g_strdup(val);
+}
+
 static void spike_machine_instance_init(Object *obj)
 {
 }
@@ -350,6 +355,14 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
     mc->default_ram_id = "riscv.spike.ram";
+    object_class_property_add_str(oc, "signature", NULL, spike_set_signature);
+    object_class_property_set_description(oc, "signature",
+                                          "File to write ACT test signature");
+    object_class_property_add_uint8_ptr(oc, "signature-granularity",
+                                        &line_size, OBJ_PROP_FLAG_WRITE);
+    object_class_property_set_description(oc, "signature-granularity",
+                                          "Size of each line in ACT signature "
+                                          "file");
 }
 
 static const TypeInfo spike_machine_typeinfo = {
diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index 5958c5b986..df493fdf6b 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -40,6 +40,9 @@ typedef struct HTIFState {
     uint64_t pending_read;
 } HTIFState;
 
+extern const char *sig_file;
+extern uint8_t line_size;
+
 /* HTIF symbol callback */
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
     uint64_t st_size);
-- 
2.25.1


