Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDD7C282DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 05:01:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trVES-000349-BV; Mon, 10 Mar 2025 00:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVEB-0002hS-BR
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:00 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVE9-0008BQ-AN
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:58:59 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-225477548e1so20294925ad.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Mar 2025 21:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741582736; x=1742187536; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKLFWb+An2Ks9U+R2rK1VtO2Tw0/JUbGbAmdQc7IQwE=;
 b=JdiFIFNFGaRXaPCm8U5P8FdZpKmDB6O6YwU21ocPjsoaVLe0lq1/R4rxCoDY9Ephfm
 NJ1tnLk2zDSG592CXIBfXbup8YOL0RRq4zJEMrHzaGChWnaqyI7+0BiMHbDPdQK46bqq
 ZB7mnF+8WGf3zj0GiU8mC2CVw5NS+50HqrS8G65oFyh5P48K4sNZiRC+4EXVytz/6rrB
 dtI4cjaPOTgpk1WHHWlepIhydmduKHlzTiqACZ8ZBHvypuaiBejPXSoRdQMFrLSMKwxd
 pR4zYO95cwV76eW/VA54czC+YQQ0EBlb3ooPWiNJHiA9tABq487eGCEocBBroNVLpWHz
 p+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741582736; x=1742187536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gKLFWb+An2Ks9U+R2rK1VtO2Tw0/JUbGbAmdQc7IQwE=;
 b=qg7hJJbJ5qQ+rSpPpLQGTB+OENRnVv4hVpUI5369sljgxSBpPwfbe61Q5Ac+FoTC2s
 0xXqikRJvt0O4UEwwuV2MqxamQOBDx2aDZGXo8SApJYXAB8D/Shk8pPoQxjMuIiyIaSN
 cUMV03KjpHuQ6xNMDV3LlRtPDLVSSzcXSvlve8rQm5xGrwgGA0En1f49js9754c6uu+p
 Gb9cytoz4luEqmEd3GW8ACehKsDYfLtxZw3VPy13kREvoTNmJ/SrDdTfdT3nYu7ZRSyx
 FknC8ogwdmpb/01HfxyZ2J3/4bxZm9EE69p2s6qb1tdt1UIOQkGTPcfrfHvGq6vVVVCu
 aclg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJYxBKFFyvoe8NEogwfs1Kq0DjosVp4ATnwB+ATMl3QYkxPmTTrdydyB30R+VV0SjscbfmBGG3fIiv@nongnu.org
X-Gm-Message-State: AOJu0YyyzrCNcrscuelm7uq3SxtG82Xm4rSsHKORJnt30hBP2Xmrqj/e
 D5VJ/9glQ/NQez7p8ldhUU1YGP/PvOMVgNePsK4knGGKyM0iQhbLDchRpvJiwzs=
X-Gm-Gg: ASbGncuMWASNaKtIIARWCMCHQBwKONEFinta6kF86ezr1Wy/7N7c7SbPu63uRppuVZm
 dII31MqwWsRHTUV8xif0xDl5wEPLpieh3EopvV9IGNZEvBNq1RLfCCe4iaVXwC9iUcEayKSPIfz
 IhvJ+thXUBfOH6hXc9/KCGptXQV4AjwokFITvQx+/A1vx1Gh/AvMilIu13aPE5s2R/FIS0gAkKP
 wLREuV/prZnLu4eoMxDQxNJmgTWizx6VKeclRzgWygmzL17w1EnPByyYpM2TxChPXlopKf4F4hP
 sY8fgIDr79pPj+uTIpmvmBsO8LOO+txEJUYiiG0hrItF
X-Google-Smtp-Source: AGHT+IEAovvlOy2ME9s2bcowigrmpQEpYOhHLOJWN1HotCTdKvUP3vKFXajlsE4wLKble7VBohAKKQ==
X-Received: by 2002:a05:6a00:4fc6:b0:736:32d2:aa82 with SMTP id
 d2e1a72fcca58-736aab17045mr17832470b3a.23.1741582735793; 
 Sun, 09 Mar 2025 21:58:55 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:55 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 manos.pitsidianakis@linaro.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 05/16] qemu/bswap: implement {ld,st}.*_p as functions
Date: Sun,  9 Mar 2025 21:58:31 -0700
Message-Id: <20250310045842.2650784-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For now, they are duplicate of the same macros in cpu-all.h that we
eliminate in next commit.

Keep code readable by not defining them with macros, but simply their
implementation.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/qemu/bswap.h | 70 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index ebf6f9e5f5c..46ec62f716d 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -442,6 +442,76 @@ DO_STN_LDN_P(be)
 
 #undef DO_STN_LDN_P
 
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
 #undef le_bswap
 #undef be_bswap
 #undef le_bswaps
-- 
2.39.5


