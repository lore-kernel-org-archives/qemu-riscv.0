Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449CEC7EE26
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 09:37:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1ORH-0006vt-3V; Tue, 23 May 2023 05:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1ORA-0006ra-Pq; Tue, 23 May 2023 05:36:12 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1OR6-0007Ut-0y; Tue, 23 May 2023 05:36:12 -0400
Received: from localhost.localdomain (unknown [61.165.37.98])
 by APP-05 (Coremail) with SMTP id zQCowABXXYn8iGxkwiCaAw--.15216S4;
 Tue, 23 May 2023 17:35:59 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 2/8] target/riscv: Split RISCVCPUConfig declarations from
 cpu.h into cpu_cfg.h
Date: Tue, 23 May 2023 17:35:33 +0800
Message-Id: <20230523093539.203909-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
References: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXXYn8iGxkwiCaAw--.15216S4
X-Coremail-Antispam: 1UD129KBjvJXoWxKr4UWFyrtFyUuF1rAry8AFb_yoWxAFW5pr
 W5GF13CrsxXr1xurnrJw1jqr1Fkws3Ja18tF1Utrn5JrWIqrW5ta1kC3WUXFWUJF18GF15
 Kr1jyFyUJryjvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
 v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
 Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
 0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
 AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjYiiDUUUUU=
 =
X-Originating-IP: [61.165.37.98]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Split RISCVCPUConfig declarations to prepare for passing it to disas.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.h     | 114 +---------------------------------
 target/riscv/cpu_cfg.h | 136 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+), 113 deletions(-)
 create mode 100644 target/riscv/cpu_cfg.h

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de7e43126a..dc1229b69c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -27,6 +27,7 @@
 #include "qom/object.h"
 #include "qemu/int128.h"
 #include "cpu_bits.h"
+#include "cpu_cfg.h"
 #include "qapi/qapi-types-common.h"
 #include "cpu-qom.h"
 
@@ -368,119 +369,6 @@ struct CPUArchState {
     uint64_t kvm_timer_frequency;
 };
 
-/*
- * map is a 16-bit bitmap: the most significant set bit in map is the maximum
- * satp mode that is supported. It may be chosen by the user and must respect
- * what qemu implements (valid_1_10_32/64) and what the hw is capable of
- * (supported bitmap below).
- *
- * init is a 16-bit bitmap used to make sure the user selected a correct
- * configuration as per the specification.
- *
- * supported is a 16-bit bitmap used to reflect the hw capabilities.
- */
-typedef struct {
-    uint16_t map, init, supported;
-} RISCVSATPMap;
-
-struct RISCVCPUConfig {
-    bool ext_zba;
-    bool ext_zbb;
-    bool ext_zbc;
-    bool ext_zbkb;
-    bool ext_zbkc;
-    bool ext_zbkx;
-    bool ext_zbs;
-    bool ext_zca;
-    bool ext_zcb;
-    bool ext_zcd;
-    bool ext_zce;
-    bool ext_zcf;
-    bool ext_zcmp;
-    bool ext_zcmt;
-    bool ext_zk;
-    bool ext_zkn;
-    bool ext_zknd;
-    bool ext_zkne;
-    bool ext_zknh;
-    bool ext_zkr;
-    bool ext_zks;
-    bool ext_zksed;
-    bool ext_zksh;
-    bool ext_zkt;
-    bool ext_ifencei;
-    bool ext_icsr;
-    bool ext_icbom;
-    bool ext_icboz;
-    bool ext_zicond;
-    bool ext_zihintpause;
-    bool ext_smstateen;
-    bool ext_sstc;
-    bool ext_svadu;
-    bool ext_svinval;
-    bool ext_svnapot;
-    bool ext_svpbmt;
-    bool ext_zdinx;
-    bool ext_zawrs;
-    bool ext_zfh;
-    bool ext_zfhmin;
-    bool ext_zfinx;
-    bool ext_zhinx;
-    bool ext_zhinxmin;
-    bool ext_zve32f;
-    bool ext_zve64f;
-    bool ext_zve64d;
-    bool ext_zmmul;
-    bool ext_zvfh;
-    bool ext_zvfhmin;
-    bool ext_smaia;
-    bool ext_ssaia;
-    bool ext_sscofpmf;
-    bool rvv_ta_all_1s;
-    bool rvv_ma_all_1s;
-
-    uint32_t mvendorid;
-    uint64_t marchid;
-    uint64_t mimpid;
-
-    /* Vendor-specific custom extensions */
-    bool ext_xtheadba;
-    bool ext_xtheadbb;
-    bool ext_xtheadbs;
-    bool ext_xtheadcmo;
-    bool ext_xtheadcondmov;
-    bool ext_xtheadfmemidx;
-    bool ext_xtheadfmv;
-    bool ext_xtheadmac;
-    bool ext_xtheadmemidx;
-    bool ext_xtheadmempair;
-    bool ext_xtheadsync;
-    bool ext_XVentanaCondOps;
-
-    uint8_t pmu_num;
-    char *priv_spec;
-    char *user_spec;
-    char *bext_spec;
-    char *vext_spec;
-    uint16_t vlen;
-    uint16_t elen;
-    uint16_t cbom_blocksize;
-    uint16_t cboz_blocksize;
-    bool mmu;
-    bool pmp;
-    bool epmp;
-    bool debug;
-    bool misa_w;
-
-    bool short_isa_string;
-
-#ifndef CONFIG_USER_ONLY
-    RISCVSATPMap satp_mode;
-#endif
-};
-
-typedef struct RISCVCPUConfig RISCVCPUConfig;
-
 /*
  * RISCVCPU:
  * @env: #CPURISCVState
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
new file mode 100644
index 0000000000..c4a627d335
--- /dev/null
+++ b/target/riscv/cpu_cfg.h
@@ -0,0 +1,136 @@
+/*
+ * QEMU RISC-V CPU CFG
+ *
+ * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
+ * Copyright (c) 2017-2018 SiFive, Inc.
+ * Copyright (c) 2021-2023 PLCT Lab
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef RISCV_CPU_CFG_H
+#define RISCV_CPU_CFG_H
+
+/*
+ * map is a 16-bit bitmap: the most significant set bit in map is the maximum
+ * satp mode that is supported. It may be chosen by the user and must respect
+ * what qemu implements (valid_1_10_32/64) and what the hw is capable of
+ * (supported bitmap below).
+ *
+ * init is a 16-bit bitmap used to make sure the user selected a correct
+ * configuration as per the specification.
+ *
+ * supported is a 16-bit bitmap used to reflect the hw capabilities.
+ */
+typedef struct {
+    uint16_t map, init, supported;
+} RISCVSATPMap;
+
+struct RISCVCPUConfig {
+    bool ext_zba;
+    bool ext_zbb;
+    bool ext_zbc;
+    bool ext_zbkb;
+    bool ext_zbkc;
+    bool ext_zbkx;
+    bool ext_zbs;
+    bool ext_zca;
+    bool ext_zcb;
+    bool ext_zcd;
+    bool ext_zce;
+    bool ext_zcf;
+    bool ext_zcmp;
+    bool ext_zcmt;
+    bool ext_zk;
+    bool ext_zkn;
+    bool ext_zknd;
+    bool ext_zkne;
+    bool ext_zknh;
+    bool ext_zkr;
+    bool ext_zks;
+    bool ext_zksed;
+    bool ext_zksh;
+    bool ext_zkt;
+    bool ext_ifencei;
+    bool ext_icsr;
+    bool ext_icbom;
+    bool ext_icboz;
+    bool ext_zicond;
+    bool ext_zihintpause;
+    bool ext_smstateen;
+    bool ext_sstc;
+    bool ext_svadu;
+    bool ext_svinval;
+    bool ext_svnapot;
+    bool ext_svpbmt;
+    bool ext_zdinx;
+    bool ext_zawrs;
+    bool ext_zfh;
+    bool ext_zfhmin;
+    bool ext_zfinx;
+    bool ext_zhinx;
+    bool ext_zhinxmin;
+    bool ext_zve32f;
+    bool ext_zve64f;
+    bool ext_zve64d;
+    bool ext_zmmul;
+    bool ext_zvfh;
+    bool ext_zvfhmin;
+    bool ext_smaia;
+    bool ext_ssaia;
+    bool ext_sscofpmf;
+    bool rvv_ta_all_1s;
+    bool rvv_ma_all_1s;
+
+    uint32_t mvendorid;
+    uint64_t marchid;
+    uint64_t mimpid;
+
+    /* Vendor-specific custom extensions */
+    bool ext_xtheadba;
+    bool ext_xtheadbb;
+    bool ext_xtheadbs;
+    bool ext_xtheadcmo;
+    bool ext_xtheadcondmov;
+    bool ext_xtheadfmemidx;
+    bool ext_xtheadfmv;
+    bool ext_xtheadmac;
+    bool ext_xtheadmemidx;
+    bool ext_xtheadmempair;
+    bool ext_xtheadsync;
+    bool ext_XVentanaCondOps;
+
+    uint8_t pmu_num;
+    char *priv_spec;
+    char *user_spec;
+    char *bext_spec;
+    char *vext_spec;
+    uint16_t vlen;
+    uint16_t elen;
+    uint16_t cbom_blocksize;
+    uint16_t cboz_blocksize;
+    bool mmu;
+    bool pmp;
+    bool epmp;
+    bool debug;
+    bool misa_w;
+
+    bool short_isa_string;
+
+#ifndef CONFIG_USER_ONLY
+    RISCVSATPMap satp_mode;
+#endif
+};
+
+typedef struct RISCVCPUConfig RISCVCPUConfig;
+#endif
-- 
2.25.1


