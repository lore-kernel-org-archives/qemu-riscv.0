Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW8F-0004l0-7b
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW70-0000Gb-25
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:47 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6x-0000eC-Nd
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:45 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so8847852pjb.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gP1FaZV2jwIFaxfD+zljAWbUZCjQNTs1C1nJUdyENMk=;
 b=f4NIbzjlpOAYCyVriH3M7UqW19rm5g1zhb8Vg0zjrAq3A/Ny3mUR5FwkHcNn2ZClPO
 iu3zAHqSnQW8QNbrVe93guF0+QqlMC91EKNjVOf16+h7lHI1qw2x+u1DCoMwLSjNprPt
 NdTKomWTAHL8BOMgvsqKAK2OzJSnZlIagSmHIWaFif7l2m5QBnv94WfUQxoWi5Y26LDh
 S0cjIRMjyuW94oTNt4K6HcZthYJZlUTKLcwNV3MhqVJaNYhbGUTCGh2AtT4/TMbUPqMD
 3RUuepvtxphbahSAkDoGmVD0lTaIfWmogV5BdHEbcFzq0XyO6dH7BD5cifsr02DS2qKH
 4qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gP1FaZV2jwIFaxfD+zljAWbUZCjQNTs1C1nJUdyENMk=;
 b=dRdivI/UWQNuRb9D4939NTSLoB694hMp602Y29mNImaJu4wCNOez03Jn7ZPV6n0sGX
 V7EzCij+dzHhAs7jjyDQUUUsYjxdwb6lOGrxYLOHdca4x2zDNMgTp1WwlXaPvFh53kDv
 PH91zQ+VVAZ2xPj5V0sV58Ry426kLXQWodGhEYyuAVbaxs1Zv8ODgV4F4r/hjdS64Hfd
 YtU13MiYFznSfzyOWH/QdLa9UqpaDgxzOrS5QoTNmMWycRD5yc9tgDU/ntC18cgsxLCF
 2X/A4ZVsMpg6LD+rDsMvVNn7vfcyBKJpSnpIBO0KuWqx4D9rlHUo//qWuCGPYXUGFEwY
 qpFg==
X-Gm-Message-State: AO0yUKVbytsTDWTvOOlBa2zGNVrIg/uqQwxvPqHV9ytfAFCT9xWi99gp
 a+wmYWhiG67sDVK2EIUBDyF1bw==
X-Google-Smtp-Source: AK7set+AbJzjGMaSNL/r0t5DJ1tz1MFCQ4SvTMsWCpryhyAfVOTlLDfYe4A0Ijm9hoA91q9Ug3w28Q==
X-Received: by 2002:a17:90b:4a03:b0:233:457f:e71c with SMTP id
 kk3-20020a17090b4a0300b00233457fe71cmr26671400pjb.38.1677475901653; 
 Sun, 26 Feb 2023 21:31:41 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 75/76] tcg: Create tcg/tcg-temp-internal.h
Date: Sun, 26 Feb 2023 19:25:04 -1000
Message-Id: <20230227052505.352889-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) BAYES_00=-1.9, BITCOIN_OBFU_SUBJ=3.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FUZZY_BITCOIN=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:31:51 -0000

Move the  tcg_temp_free_* and tcg_temp_ebb_new_* declarations
and inlines to the new header.  These are private to the
implementation, and will prevent tcg_temp_free_* from creaping
back into the guest front ends.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-temp-internal.h | 83 +++++++++++++++++++++++++++++++++
 include/tcg/tcg.h               | 54 ---------------------
 accel/tcg/plugin-gen.c          |  1 +
 tcg/tcg-op-gvec.c               |  1 +
 tcg/tcg-op-vec.c                |  1 +
 tcg/tcg-op.c                    |  1 +
 tcg/tcg.c                       |  1 +
 7 files changed, 88 insertions(+), 54 deletions(-)
 create mode 100644 include/tcg/tcg-temp-internal.h

diff --git a/include/tcg/tcg-temp-internal.h b/include/tcg/tcg-temp-internal.h
new file mode 100644
index 0000000000..dded2917e5
--- /dev/null
+++ b/include/tcg/tcg-temp-internal.h
@@ -0,0 +1,83 @@
+/*
+ * TCG internals related to TCG temp allocation
+ *
+ * Copyright (c) 2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef TCG_TEMP_INTERNAL_H
+#define TCG_TEMP_INTERNAL_H
+
+/*
+ * Allocation and freeing of EBB temps is reserved to TCG internals
+ */
+
+void tcg_temp_free_internal(TCGTemp *);
+
+static inline void tcg_temp_free_i32(TCGv_i32 arg)
+{
+    tcg_temp_free_internal(tcgv_i32_temp(arg));
+}
+
+static inline void tcg_temp_free_i64(TCGv_i64 arg)
+{
+    tcg_temp_free_internal(tcgv_i64_temp(arg));
+}
+
+static inline void tcg_temp_free_i128(TCGv_i128 arg)
+{
+    tcg_temp_free_internal(tcgv_i128_temp(arg));
+}
+
+static inline void tcg_temp_free_ptr(TCGv_ptr arg)
+{
+    tcg_temp_free_internal(tcgv_ptr_temp(arg));
+}
+
+static inline void tcg_temp_free_vec(TCGv_vec arg)
+{
+    tcg_temp_free_internal(tcgv_vec_temp(arg));
+}
+
+static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    return temp_tcgv_i32(t);
+}
+
+static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    return temp_tcgv_i64(t);
+}
+
+static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    return temp_tcgv_i128(t);
+}
+
+static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    return temp_tcgv_ptr(t);
+}
+
+#endif /* TCG_TEMP_FREE_H */
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index e8f73115ec..43ce4bfa7d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -855,35 +855,9 @@ void tcg_set_frame(TCGContext *s, TCGReg reg, intptr_t start, intptr_t size);
 TCGTemp *tcg_global_mem_new_internal(TCGType, TCGv_ptr,
                                      intptr_t, const char *);
 TCGTemp *tcg_temp_new_internal(TCGType, TCGTempKind);
-void tcg_temp_free_internal(TCGTemp *);
 TCGv_vec tcg_temp_new_vec(TCGType type);
 TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match);
 
-static inline void tcg_temp_free_i32(TCGv_i32 arg)
-{
-    tcg_temp_free_internal(tcgv_i32_temp(arg));
-}
-
-static inline void tcg_temp_free_i64(TCGv_i64 arg)
-{
-    tcg_temp_free_internal(tcgv_i64_temp(arg));
-}
-
-static inline void tcg_temp_free_i128(TCGv_i128 arg)
-{
-    tcg_temp_free_internal(tcgv_i128_temp(arg));
-}
-
-static inline void tcg_temp_free_ptr(TCGv_ptr arg)
-{
-    tcg_temp_free_internal(tcgv_ptr_temp(arg));
-}
-
-static inline void tcg_temp_free_vec(TCGv_vec arg)
-{
-    tcg_temp_free_internal(tcgv_vec_temp(arg));
-}
-
 static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
@@ -891,13 +865,6 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i32(t);
 }
 
-/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
-static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
-    return temp_tcgv_i32(t);
-}
-
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_TB);
@@ -911,26 +878,12 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i64(t);
 }
 
-/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
-static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
-    return temp_tcgv_i64(t);
-}
-
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_TB);
     return temp_tcgv_i64(t);
 }
 
-/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
-static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
-    return temp_tcgv_i128(t);
-}
-
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_TB);
@@ -944,13 +897,6 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_ptr(t);
 }
 
-/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
-static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
-    return temp_tcgv_ptr(t);
-}
-
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_TB);
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index c42a436c0c..5efb8db258 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -44,6 +44,7 @@
  */
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
+#include "tcg/tcg-temp-internal.h"
 #include "tcg/tcg-op.h"
 #include "exec/exec-all.h"
 #include "exec/plugin-gen.h"
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 877b0b659b..f7072b213f 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
+#include "tcg/tcg-temp-internal.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
 #include "qemu/main-loop.h"
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 966d41d65a..0f023f42c6 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
+#include "tcg/tcg-temp-internal.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-mo.h"
 #include "tcg-internal.h"
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index f2269a1b91..53e96b5b69 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
+#include "tcg/tcg-temp-internal.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-mo.h"
 #include "exec/plugin-gen.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index e3c0fa1012..4d3fb6aee2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -60,6 +60,7 @@
 #include "elf.h"
 #include "exec/log.h"
 #include "tcg/tcg-ldst.h"
+#include "tcg/tcg-temp-internal.h"
 #include "tcg-internal.h"
 #include "accel/tcg/perf.h"
 
-- 
2.34.1


