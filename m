Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C39C2BA1B
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 04:11:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trqxV-00058v-4M; Tue, 11 Mar 2025 00:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvR-0003IS-5U
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:05 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvO-0006PR-4n
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:04 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22398e09e39so91371895ad.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Mar 2025 21:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741666139; x=1742270939; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9XKPWEC1FDWwfXw4amuYrHiaWnSduBZ0xkgSDXw7jg=;
 b=Pp1t1nw0qvDhSrMhb9aSFJeSYS0LU4LsTCz1ZQZPgNUvo/aaJj8InVdA/OkXOCBLm2
 QZthCfV8oHsqGocvb6En0Dj/FMsuxhytXbSSXGkhx8toEPqhfhyS6wpRGDQyDW/SG/Gq
 +AbvGDu3Y1xB2r3g5eB7VQYsKyoryNycQRTVDAr3kKTNqkIt2tUI5iygL8Sbem/5HoEG
 UM3ApLHFc0NbZ0ZgBtYPbxeJG5ZWbxPFdpSDpL6nQkFea6Y81AcGJuxN8fk+oOjI+3MG
 oP/imM5IGNevwk4lRmgi5uZ14zqgSzVeezoeC57cR69torE05tlDwmep+ZaImvZ2fVGW
 PRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741666139; x=1742270939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9XKPWEC1FDWwfXw4amuYrHiaWnSduBZ0xkgSDXw7jg=;
 b=B1ZnSl+6hGOEFRZ32+xPWHBf0B459wsj2AseMNsrzKl4BZaa40tY85q+S/q3nd9FkY
 Liwt90iBZ7LREZrnX5P3m4+IFq+l4ID0EJUWW4BV4KUYmkbL1cFJLOnUzoHtgzZolB49
 wjN1T/cx1dWe9mIKk+yma7Pq7EtMJ2lXFiWYxXGfd3ZnJudycNFCRpsudFHbIkOacgo5
 UahrW95dNAWIM/9KxLw3BIxaWEG5i/nhZEkL+4+3CgKQWaTKzZcQgNJmhNNgRCOWLAKY
 YFUgz1JHh9HaCRrndJ/Z5B3JCgbBeKXvGtMzJmB4OU4gqGz9yxZBEV+x9iGU969Yble1
 LTKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOwjSDi9U0Z+d72Ci4Pr3TKAMmUfIAiDCKsvvq9N3tbJDKOhEPuy+hfw9VLydhIzZxUBScMk+PK39u@nongnu.org
X-Gm-Message-State: AOJu0Yw1z93/veCnR8jxHOPkyt/Eye6fb1u3U62ZW3+pV72Ly1ew022U
 K66aspdIK1FzLXBH0+ZutNoC4Gi+11qla5ZtKW0wOL0M9NcdAJw/e+Yivvm5AvupFDU1RR1e/GG
 gZro=
X-Gm-Gg: ASbGncveKmx9PjYeKEVOYt+uCDP6MiF9X4jHzWiBDZU86QHPt12ag3XXuI8oPtEipHO
 LLJsSulF7zCiFmRvBnrAWCtlf0myM0DFnhUPW2KhvwTtELKydLBbdbQbrsLZiY3jBgATXW2YIpx
 mfEOGJ8qtd1CX7zIykznLL6A1L1H00iO8QazNuUOM1jM2B6l8Oxk411otAeSo2RQRIn9zmRWRyT
 DCsg5Tyqq0cgLGLCtPQGN22Drkck1LriUuE3V2ilje75gY50L8Azd/WVZhyr2VFbA35B02vUWrK
 RzW5Qnfuj9K8vPS5zLfn8gzfUNqeBgpy5odvewY1wtUv
X-Google-Smtp-Source: AGHT+IFULxKXKLSRt6Qs0nLWBVqgQyDOkjRhSbU6XrRQVwLJue3Ph3bi7X9tYlurUTD8KJTtNJkwJQ==
X-Received: by 2002:a05:6a20:2d24:b0:1f5:7007:9eb7 with SMTP id
 adf61e73a8af0-1f57008366dmr14192716637.37.1741666139634; 
 Mon, 10 Mar 2025 21:08:59 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:08:59 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 02/16] exec/tswap: implement {ld,
 st}.*_p as functions instead of macros
Date: Mon, 10 Mar 2025 21:08:24 -0700
Message-Id: <20250311040838.3937136-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Defining functions allows to use them from common code, by not depending
on TARGET_BIG_ENDIAN.
Remove previous macros from exec/cpu-all.h.
By moving them out of cpu-all.h, we'll be able to break dependency on
cpu.h for memory related functions coming in next commits.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 25 ---------------
 include/exec/tswap.h   | 70 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 25 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 8cd6c00cf89..e56c064d46f 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -38,31 +38,6 @@
 #define BSWAP_NEEDED
 #endif
 
-/* Target-endianness CPU memory access functions. These fit into the
- * {ld,st}{type}{sign}{size}{endian}_p naming scheme described in bswap.h.
- */
-#if TARGET_BIG_ENDIAN
-#define lduw_p(p) lduw_be_p(p)
-#define ldsw_p(p) ldsw_be_p(p)
-#define ldl_p(p) ldl_be_p(p)
-#define ldq_p(p) ldq_be_p(p)
-#define stw_p(p, v) stw_be_p(p, v)
-#define stl_p(p, v) stl_be_p(p, v)
-#define stq_p(p, v) stq_be_p(p, v)
-#define ldn_p(p, sz) ldn_be_p(p, sz)
-#define stn_p(p, sz, v) stn_be_p(p, sz, v)
-#else
-#define lduw_p(p) lduw_le_p(p)
-#define ldsw_p(p) ldsw_le_p(p)
-#define ldl_p(p) ldl_le_p(p)
-#define ldq_p(p) ldq_le_p(p)
-#define stw_p(p, v) stw_le_p(p, v)
-#define stl_p(p, v) stl_le_p(p, v)
-#define stq_p(p, v) stq_le_p(p, v)
-#define ldn_p(p, sz) ldn_le_p(p, sz)
-#define stn_p(p, sz, v) stn_le_p(p, sz, v)
-#endif
-
 /* MMU memory access macros */
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index 2683da0adb7..84060a49994 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -80,4 +80,74 @@ static inline void tswap64s(uint64_t *s)
     }
 }
 
+/* Return ld{word}_{le,be}_p following target endianness. */
+#define LOAD_IMPL(word, args...)                    \
+do {                                                \
+    if (target_words_bigendian()) {                 \
+        return glue(glue(ld, word), _be_p)(args);   \
+    } else {                                        \
+        return glue(glue(ld, word), _le_p)(args);   \
+    }                                               \
+} while (0)
+
+static inline int lduw_p(const void *ptr)
+{
+    LOAD_IMPL(uw, ptr);
+}
+
+static inline int ldsw_p(const void *ptr)
+{
+    LOAD_IMPL(sw, ptr);
+}
+
+static inline int ldl_p(const void *ptr)
+{
+    LOAD_IMPL(l, ptr);
+}
+
+static inline uint64_t ldq_p(const void *ptr)
+{
+    LOAD_IMPL(q, ptr);
+}
+
+static inline uint64_t ldn_p(const void *ptr, int sz)
+{
+    LOAD_IMPL(n, ptr, sz);
+}
+
+#undef LOAD_IMPL
+
+/* Call st{word}_{le,be}_p following target endianness. */
+#define STORE_IMPL(word, args...)           \
+do {                                        \
+    if (target_words_bigendian()) {         \
+        glue(glue(st, word), _be_p)(args);  \
+    } else {                                \
+        glue(glue(st, word), _le_p)(args);  \
+    }                                       \
+} while (0)
+
+
+static inline void stw_p(void *ptr, uint16_t v)
+{
+    STORE_IMPL(w, ptr, v);
+}
+
+static inline void stl_p(void *ptr, uint32_t v)
+{
+    STORE_IMPL(l, ptr, v);
+}
+
+static inline void stq_p(void *ptr, uint64_t v)
+{
+    STORE_IMPL(q, ptr, v);
+}
+
+static inline void stn_p(void *ptr, int sz, uint64_t v)
+{
+    STORE_IMPL(n, ptr, sz, v);
+}
+
+#undef STORE_IMPL
+
 #endif  /* TSWAP_H */
-- 
2.39.5


