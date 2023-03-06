Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZ6lG-00006g-4B
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 04:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZ6kp-0008VN-1g; Mon, 06 Mar 2023 04:03:39 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZ6kl-0002dQ-Cc; Mon, 06 Mar 2023 04:03:34 -0500
Received: from localhost.localdomain (unknown [180.165.240.213])
 by APP-01 (Coremail) with SMTP id qwCowADX8NRUrAVkS7fuCw--.45017S3;
 Mon, 06 Mar 2023 17:03:18 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 1/1] hw/riscv: Add signature dump function for spike to run
 ACT tests
Date: Mon,  6 Mar 2023 17:03:14 +0800
Message-Id: <20230306090314.74626-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306090314.74626-1-liweiwei@iscas.ac.cn>
References: <20230306090314.74626-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADX8NRUrAVkS7fuCw--.45017S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZF1DXF15KF1xCF1DAF43KFg_yoWrWF15pF
 s3GFn8Cry5JFn3JFnxtw18ua1rGws3J3W7KrsxCw18Zan8WFy7Aan7ta45Zan8GFWxZa1U
 JFWDGFy3KF45Zw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
 IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqAp5UUUUU
 =
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 09:03:52 -0000

Add signature and signature-granularity properties in spike to specify the target
signatrue file and the line size for signature data.

Recgonize the signature section between begin_signature and end_signature symbols
when loading elf of ACT tests. Then dump signature data in signature section just
before the ACT tests exit.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 hw/char/riscv_htif.c | 39 ++++++++++++++++++++++++++++++++++++++-
 hw/riscv/spike.c     | 16 ++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 098de50e35..2a82ed8500 100644
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
+extern const char *sig_file;
+extern uint8_t line_size;
+
+static uint64_t fromhost_addr, tohost_addr, sig_addr, sig_len;
 
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
                           uint64_t st_size)
@@ -68,6 +73,10 @@ void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
             error_report("HTIF tohost must be 8 bytes");
             exit(1);
         }
+    } else if (strcmp("begin_signature", st_name) == 0) {
+        sig_addr = st_value;
+    } else if (strcmp("end_signature", st_name) == 0) {
+        sig_len = st_value - sig_addr;
     }
 }
 
@@ -161,6 +170,34 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
         /* frontend syscall handler, shutdown and exit code support */
         if (cmd == HTIF_SYSTEM_CMD_SYSCALL) {
             if (payload & 0x1) {
+                /* Dump signature data to sig_file if specified */
+                if (sig_file) {
+                    char *sig_data = g_malloc(sig_len);
+                    dma_memory_read(&address_space_memory, sig_addr, sig_data,
+                                    sig_len, MEMTXATTRS_UNSPECIFIED);
+                    FILE *signature = fopen(sig_file, "w");
+                    if (signature == NULL) {
+                        error_report("open %s: %s", sig_file,
+                                     strerror(errno));
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
                 /* exit code */
                 int exit_code = payload >> 1;
                 exit(exit_code);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index a584d5b3a2..eaa7f54fd6 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -41,6 +41,9 @@
 
 #include <libfdt.h>
 
+const char *sig_file;
+uint8_t line_size = 16;
+
 static const MemMapEntry spike_memmap[] = {
     [SPIKE_MROM] =     {     0x1000,     0xf000 },
     [SPIKE_HTIF] =     {  0x1000000,     0x1000 },
@@ -332,6 +335,11 @@ static void spike_board_init(MachineState *machine)
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
@@ -350,6 +358,14 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
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
-- 
2.25.1


