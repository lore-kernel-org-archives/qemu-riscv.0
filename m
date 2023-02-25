Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqkK-0001P0-8i
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjd-0007iB-8d
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:53 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjZ-00035n-0H
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:52 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso5231970pjb.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gP1FaZV2jwIFaxfD+zljAWbUZCjQNTs1C1nJUdyENMk=;
 b=fs0fTH3vrf/1IwKgl45ef46u7ytbBe1ya5mkka7jxDKJUPTdmrGorektm3cx63qtd6
 lQy2PM75KNoNdWqJVDL6j/Wwrx+em+IlcgXGrZvttLkK3iTjMgzXdyAdutqPhKvmVvUy
 PIks4x+6GwhwNlVIq748LBGLOCY4W7sPrUHZ5AQ5Ipu1WbjtjiBfTcFwtuh3PlQxLqFM
 kObrH7rYhFDZWB3LXA2sySha8Sx3jVvpJP/YEwwqcz2nznk+O4exzdqPEtO5BObEruJ2
 B+M7zAiZnZhCuTWPPa0dIXHTFdGrXgbirkiaEjx0ds4af21Ad3HuEIHFfKzhfxP2NEP5
 oXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gP1FaZV2jwIFaxfD+zljAWbUZCjQNTs1C1nJUdyENMk=;
 b=yW0RDk3u8TEtOkKxZZ33DOJbzz3TvcMhXBF+X1T/jPjT8BARhufwyoIr1NMormywIw
 kxmezHnvTTvFuSAPPNmGrPLZALbGwuKqWKQMI9n7/JwBAoxSlg1F1g3iIZwnKqLexEop
 q52CefG/NjGuhLLYi5F/teXbwpmW5XWhYtynVig6n/Gk054K6swYRNs8Jop+i9QWRP0a
 Fz1HeviMfgjQsu5y8PKWklLQ3vlXEJ2qJjRt/5rvqhLVo4kKd0qEgTMEMc9HzD385+lM
 1cblP4jFNXLDdigMyO23ZFUNOgAi7iBWsnlNyh/G8dKSlbgR/7R0lWJbin6UCfKP+tRJ
 6CWA==
X-Gm-Message-State: AO0yUKXafJYF1uyeTe6f4h8fvPl67kyjwebVo446qHpvCUc5Yn/xI9s2
 nGFd6UZcm+gsHgAnXFSit5JJVQ==
X-Google-Smtp-Source: AK7set8n21cgRQwDkk8Cxy0YxJEwXNC2mcJ0/dMxqzElGa1SgjorurYuYipn8yr6JXwO9MoSo6G9Lg==
X-Received: by 2002:a05:6a20:a005:b0:c7:1d82:838c with SMTP id
 p5-20020a056a20a00500b000c71d82838cmr17920260pzj.41.1677316847760; 
 Sat, 25 Feb 2023 01:20:47 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 75/76] tcg: Create tcg/tcg-temp-internal.h
Date: Fri, 24 Feb 2023 23:14:26 -1000
Message-Id: <20230225091427.1817156-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) BAYES_00=-1.9, BITCOIN_OBFU_SUBJ=3.376,
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
X-List-Received-Date: Sat, 25 Feb 2023 09:20:53 -0000

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


