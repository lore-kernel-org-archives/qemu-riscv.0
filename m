Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927C5606A31E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 02:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=b2ruRhxH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xW2tf-0000Pc-Cy; Tue, 24 Nov 2026 21:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xW2t3-0000Dd-QL
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 21:37:36 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xW2t0-0006gt-Is
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 21:37:33 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8b2d14968c9so49950547b3.0
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 18:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1795574248; x=1796179048; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jFHhwHMgrIoOJ5yqs7RMfUf7Q9Iqhbn4Sz+oDFcTYA4=;
 b=b2ruRhxHvEjy/cRve5PGxuQS6n47OWjKdEvMY3VKOCCXYlZhvu20vQQotHmCojints
 YD4SuyM4pd3KIzpBNx3feOazySbzaBe6z3jrqE4PdFtTrf0zJQ4AqCmiusC+T5dSM8qt
 +WLbD0lUKCouVqkf+13BCV6I+ZxpiSEYAfZQTk9GFvWt8XMoPYcIlrMAaVRFvDbtzmc9
 s6cpLr7kic5dq66PEIGho0aWmW4IeW77YsSaICkdXnOX7RYgv3T3Qh+IiVXrNYht32IF
 hW4dcAqa8WLvdgVDVS0m9kXr+oIN+2fBSRl9bEIgc4crgW1v1XN392RQkRAzqWt/dwXu
 PhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795574248; x=1796179048;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jFHhwHMgrIoOJ5yqs7RMfUf7Q9Iqhbn4Sz+oDFcTYA4=;
 b=ZTbb5j74F9P2Qy/dKr81oFB+EmgpJSvo7xbKTSvLWyKWCp3t9VXqMsIons94A/U3Na
 Hi28/7qnkPnJl+32F6BWq81yk1p091lP57F4GLId9UxxCLxetxAJh1erJVEuTC6GUvBr
 V5jETFwG9lc2Q6yu50HJdYvb4E1vCsRz+SfeV96WCWWUjRq9l9VWL6Q958DGwMt1b7cw
 L19md9pSXcY6l0vSWuaR9+z91r3bd56HKUp7h+imYKJDGX7YNMuh81oH86HF1E5CCuX/
 lG/7EgEGnsB8H3VtEJuhMR297mQ4GPmO9yQJglOzo3TfL9f7rpIIZSt26aRjoBoLF9q7
 9kyA==
X-Forwarded-Encrypted: i=1;
 AL+hErG0FVpq4prLloRaYRcD55cM5Ft22ptq7LOIjZ9VQAvh+qvhx0zHPDNiIAWwD0DOaq94X/FlzrOrRYoS@nongnu.org
X-Gm-Message-State: APuU4Z9K7ypuc7Bj9KKSP3cq0yJMKdIcyXiWiLE3ONme03Vz4HCpfYfk
 fCh4JJEZK6IFfeNkPoPrsIVmcSvAwlOtepd8BFQuuvE7F4KW5sGIiTN7Hm4qPFp8vUI=
X-Gm-Gg: AZFdTZf7hKpC0oLRxeogNdwgdI4FRSg6wn29r97HzviAXK7adSN8vqS6uY/Jl2snNLX
 Qji5JHCJIIfV9tCGLs8VDYqdhHfm00RA++DtLCh72U37BXL7TQsvfe4YckE4QcogaqDU19chP/C
 otgWc2+A6XYhr6KBHxRWUuyjhfe+WlSRLRPOoNY2ZRHEN4bG2dGW+CHlLqJenM26Bxx5Zc65rhR
 KkPFPOc79PDI9NpPHCd9bgpTCX5pnh1LSzokqHp5xlbvae/KnhxgeSx6xj07w1AgnfMj51X0V7V
 sqNtkTXGD+rMuGr/VrAOOk6uMEW4GP/5phmZFU8Sz/J7NSZ6BkW9XU7jKTdHjjyNvSLxt4rwuPv
 /w9ZnANHu6kX8u9j54LhQq06vE7zsraxvlnjHZ0RDur2JluvfRCVBVHRTCJ7G+2f+gboK8vEsht
 Tbh9FzYNxw6nbiKYTKSyYmpN1lmXopDIPI1GnWpygo8uaAeDjci8U6okp+DgC7eoMaFHpaWa+py
 amJ10EWInODWzdxDCdWHH7kU5s1PZPwJmfdH/kEiZtdxJZYZuj/Yt5ipPpqHBQKOduxQ9a2UFw4
 CvvMexi16HP1Wr9Aw6SGb9DBKrfBFrULTcNQ/3+35Q98BXFGtkANLrIVulUUgW/iGU3i8TBjqyS
 hcdQbc1a2XHhqa6iiWg91NwyUGALg9Nc=
X-Received: by 2002:a05:690c:b99:b0:8b3:504a:42e9 with SMTP id
 00721157ae682-8b520436e29mr58803837b3.10.1795574248253; 
 Tue, 24 Nov 2026 18:37:28 -0800 (PST)
Received: from [192.168.2.129] ([2600:1700:220:59e0:ea8f:7897:2f4d:9891])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b52028d628sm65626717b3.8.2026.11.24.18.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 18:37:27 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 24 Nov 2026 20:37:20 -0600
Subject: [PATCH 1/8] target/riscv: Add Spacemit X100 CPU type
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-spacemit_k3-v1-1-e911d6e88542@oss.tenstorrent.com>
References: <20261124-spacemit_k3-v1-0-e911d6e88542@oss.tenstorrent.com>
In-Reply-To: <20261124-spacemit_k3-v1-0-e911d6e88542@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Jeuk Kim <jeuk20.kim@samsung.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adds a CPU definition for the X100 cores present in the Spacemit K3 SoC.
The CPU definition is based on information from datasheet[1] and Linux
device tree. The custom CSRs are based on what the Spacemit K3 bootrom,
U-Boot SPL and OpenSBI write to during the boot process.

[1] https://github.com/spacemit-com/docs-chip/tree/main/en/key_stone/k3

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                     |  6 +++
 target/riscv/cpu-qom.h          |  1 +
 target/riscv/cpu.c              | 87 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu_vendorid.h     |  4 ++
 target/riscv/tcg/csr.h          |  3 ++
 target/riscv/tcg/meson.build    |  1 +
 target/riscv/tcg/spacemit_csr.c | 82 ++++++++++++++++++++++++++++++++++++++
 7 files changed, 184 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 40bf63651c..a9dbb39815 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1854,6 +1854,12 @@ F: hw/*/*sifive*.c
 F: include/hw/*/*sifive*.h
 F: tests/functional/riscv64/test_sifive_u.py
 
+Spacemit Machines
+M: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: target/riscv/tcg/spacemit_csr.c
+
 Tenstorrent Machines
 M: Joel Stanley <joel@jms.id.au>
 M: Nicholas Piggin <npiggin@gmail.com>
diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 61234842e3..d88a56f514 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -56,6 +56,7 @@
 #define TYPE_RISCV_CPU_THEAD_C908       RISCV_CPU_TYPE_NAME("thead-c908")
 #define TYPE_RISCV_CPU_THEAD_C908V      RISCV_CPU_TYPE_NAME("thead-c908v")
 #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
+#define TYPE_RISCV_CPU_SPACEMIT_X100    RISCV_CPU_TYPE_NAME("spacemit-x100")
 #define TYPE_RISCV_CPU_TT_ASCALON       RISCV_CPU_TYPE_NAME("tt-ascalon")
 #define TYPE_RISCV_CPU_XIANGSHAN_NANHU  RISCV_CPU_TYPE_NAME("xiangshan-nanhu")
 #define TYPE_RISCV_CPU_XIANGSHAN_KMH    RISCV_CPU_TYPE_NAME("xiangshan-kunminghu")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 15c27f4ce4..9bbe0cf626 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3616,6 +3616,93 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .misa_mxl_max = MXL_RV64,
     ),
 
+    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_SPACEMIT_X100, TYPE_RISCV_VENDOR_CPU,
+        .misa_mxl_max = MXL_RV64,
+        .misa_ext = RVG | RVB | RVC | RVS | RVU | RVH | RVV,
+        .priv_spec = PRIV_VERSION_1_13_0,
+        .vext_spec = VEXT_VERSION_1_00_0,
+#if !defined(CONFIG_USER_ONLY)
+        .cfg.pmp_granularity = 1 << 12,
+        /*
+         * QEMU doesn't allow setting this yet
+         * .cfg.pmp_addr_bits = 38,
+         */
+        .custom_csrs = spacemit_csr_list,
+        .num_triggers = 4,
+#endif
+
+        /* ISA extensions */
+        .cfg.mmu = true,
+        .cfg.vlenb = 256 >> 3,
+        .cfg.elen = 64,
+        .cfg.pmp = true,
+        .cfg.pmp_regions = 16,
+        .cfg.cbom_blocksize = 64,
+        .cfg.cbop_blocksize = 64,
+        .cfg.cboz_blocksize = 64,
+        .cfg.ext_zic64b = true,
+        .cfg.ext_zicbom = true,
+        .cfg.ext_zicbop = true,
+        .cfg.ext_zicboz = true,
+        .cfg.ext_zicntr = true,
+        .cfg.ext_zicond = true,
+        .cfg.ext_zicsr = true,
+        .cfg.ext_zifencei = true,
+        .cfg.ext_zihintntl = true,
+        .cfg.ext_zihintpause = true,
+        .cfg.ext_zihpm = true,
+        .cfg.ext_zimop = true,
+        .cfg.ext_zawrs = true,
+        .cfg.ext_zfa = true,
+        .cfg.ext_zfbfmin = true,
+        .cfg.ext_zfh = true,
+        .cfg.ext_zfhmin = true,
+        .cfg.ext_zcb = true,
+        .cfg.ext_zcmop = true,
+        .cfg.ext_zba = true,
+        .cfg.ext_zbb = true,
+        .cfg.ext_zbc = true,
+        .cfg.ext_zbs = true,
+        .cfg.ext_zkt = true,
+        .cfg.ext_zvbb = true,
+        .cfg.ext_zvbc = true,
+        .cfg.ext_zvfbfmin = true,
+        .cfg.ext_zvfbfwma = true,
+        .cfg.ext_zvfh = true,
+        .cfg.ext_zvfhmin = true,
+        .cfg.ext_zvkb = true,
+        .cfg.ext_zvkg = true,
+        .cfg.ext_zvkn = true,
+        .cfg.ext_zvknc = true,
+        .cfg.ext_zvkned = true,
+        .cfg.ext_zvkng = true,
+        .cfg.ext_zvknha = true,
+        .cfg.ext_zvknhb = true,
+        .cfg.ext_zvks = true,
+        .cfg.ext_zvksc = true,
+        .cfg.ext_zvksed = true,
+        .cfg.ext_zvksg = true,
+        .cfg.ext_zvksh = true,
+        .cfg.ext_zvkt = true,
+        .cfg.ext_smaia = true,
+        .cfg.ext_smcntrpmf = true,
+        .cfg.ext_smstateen = true,
+        .cfg.ext_ssaia = true,
+        .cfg.ext_sscofpmf = true,
+        .cfg.ext_sstc = true,
+        .cfg.ext_svinval = true,
+        .cfg.ext_svnapot = true,
+        .cfg.ext_svpbmt = true,
+
+        .cfg.mvendorid = SPACEMIT_VENDOR_ID,
+        .cfg.marchid = SPACEMIT_X100_MARCHID,
+        .cfg.mimpid = SPACEMIT_X100_MIMPID,
+
+        .cfg.pmu_mask = MAKE_64BIT_MASK(3, 16),
+
+        .cfg.max_satp_mode = VM_1_10_SV39,
+    ),
+
     DEFINE_RISCV_CPU(TYPE_RISCV_CPU_THEAD_C906, TYPE_RISCV_VENDOR_CPU,
         .misa_mxl_max = MXL_RV64,
         .misa_ext = RVG | RVC | RVS | RVU,
diff --git a/target/riscv/cpu_vendorid.h b/target/riscv/cpu_vendorid.h
index 751a13aace..885604604d 100644
--- a/target/riscv/cpu_vendorid.h
+++ b/target/riscv/cpu_vendorid.h
@@ -10,4 +10,8 @@
 
 #define TENSTORRENT_VENDOR_ID   0x7a1
 
+#define SPACEMIT_VENDOR_ID      0x710
+#define SPACEMIT_X100_MARCHID   0x8000000058000002
+#define SPACEMIT_X100_MIMPID    0x33d8a600
+
 #endif /*  TARGET_RISCV_CPU_VENDORID_H */
diff --git a/target/riscv/tcg/csr.h b/target/riscv/tcg/csr.h
index 53ba3b4a4d..e2515a9e4c 100644
--- a/target/riscv/tcg/csr.h
+++ b/target/riscv/tcg/csr.h
@@ -81,6 +81,9 @@ bool riscv_csr_is_vpu(int csrno);
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, const riscv_csr_operations *ops);
 
+/* In spacemit_csr.c */
+extern const RISCVCSR spacemit_csr_list[];
+
 /* In th_csr.c */
 extern const RISCVCSR th_csr_list[];
 
diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
index 86805b30cb..3d7fc5fcc7 100644
--- a/target/riscv/tcg/meson.build
+++ b/target/riscv/tcg/meson.build
@@ -24,6 +24,7 @@ riscv_system_ss.add(files(
   'mips_csr.c',
   'pmp.c',
   'pmu.c',
+  'spacemit_csr.c',
   'th_csr.c',
 ))
 
diff --git a/target/riscv/tcg/spacemit_csr.c b/target/riscv/tcg/spacemit_csr.c
new file mode 100644
index 0000000000..8f7a9b9418
--- /dev/null
+++ b/target/riscv/tcg/spacemit_csr.c
@@ -0,0 +1,82 @@
+/*
+ * Spacemit X100 CSRs
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright 2026 Anirudh Srinivasan
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "cpu_vendorid.h"
+#include "csr.h"
+
+#define CSR_SPACEMIT_TCMCFG   0x5db
+#define CSR_SPACEMIT_MSETUP   0x7c0
+#define CSR_SPACEMIT_MHCR     0x7c1
+#define CSR_SPACEMIT_MHCOR    0x7c2
+#define CSR_SPACEMIT_PMACFG0  0x7de
+#define CSR_SPACEMIT_PMAADDR8 0x7e8
+#define CSR_SPACEMIT_ML2SETUP 0x7f0
+#define CSR_SPACEMIT_ML2HINT  0x7f7
+#define CSR_SPACEMIT_MVMD1    0xbf9
+
+static RISCVException read_zero(CPURISCVState *env, int csrno,
+                                target_ulong *val)
+{
+    *val = 0;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_none(CPURISCVState *env, int csrno,
+                                 target_ulong val, uintptr_t ra)
+{
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException any_x100(CPURISCVState *env, int csrno)
+{
+    if (env_archcpu(env)->cfg.mimpid != SPACEMIT_X100_MIMPID ||
+      env_archcpu(env)->cfg.marchid != SPACEMIT_X100_MARCHID) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static bool test_spacemit_mvendorid(RISCVCPU *cpu)
+{
+    return cpu->cfg.mvendorid == SPACEMIT_VENDOR_ID;
+}
+
+const RISCVCSR spacemit_csr_list[] = {
+    { .csrno = CSR_SPACEMIT_TCMCFG,
+      .insertion_test = test_spacemit_mvendorid,
+      .csr_ops = { "tcmcfg", any_x100, read_zero, write_none } },
+    { .csrno = CSR_SPACEMIT_MSETUP,
+      .insertion_test = test_spacemit_mvendorid,
+      .csr_ops = { "msetup", any_x100, read_zero, write_none } },
+    { .csrno = CSR_SPACEMIT_MHCR,
+      .insertion_test = test_spacemit_mvendorid,
+      .csr_ops = { "mhcr", any_x100, read_zero, write_none } },
+    { .csrno = CSR_SPACEMIT_MHCOR,
+      .insertion_test = test_spacemit_mvendorid,
+      .csr_ops = { "mhcor", any_x100, read_zero, write_none } },
+    { .csrno = CSR_SPACEMIT_PMACFG0,
+      .insertion_test = test_spacemit_mvendorid,
+      .csr_ops = { "pmacfg0", any_x100, read_zero, write_none } },
+    { .csrno = CSR_SPACEMIT_PMAADDR8,
+      .insertion_test = test_spacemit_mvendorid,
+      .csr_ops = { "pmaaddr8", any_x100, read_zero, write_none } },
+    { .csrno = CSR_SPACEMIT_ML2SETUP,
+      .insertion_test = test_spacemit_mvendorid,
+      .csr_ops = { "ml2setup", any_x100, read_zero, write_none } },
+    { .csrno = CSR_SPACEMIT_ML2HINT,
+      .insertion_test = test_spacemit_mvendorid,
+      .csr_ops = { "ml2hint", any_x100, read_zero, write_none } },
+    { .csrno = CSR_SPACEMIT_MVMD1,
+      .insertion_test = test_spacemit_mvendorid,
+      .csr_ops = { "mvmd1", any_x100, read_zero, write_none } },
+    { }
+};

-- 
2.43.0


