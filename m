Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6073BC282EC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 05:01:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trVEH-0002nI-Us; Mon, 10 Mar 2025 00:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVE8-0002eY-Mx
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:58:56 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVE6-0008AN-Nc
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:58:56 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-22401f4d35aso65267265ad.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Mar 2025 21:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741582733; x=1742187533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OGwlDw5fL6/8/4sqaw9ZjtskhrLsqkJfziSvtmiyf9E=;
 b=C/dmSnoo/WaJwqv1MvGKpaZcIRy/+iYe73PGBeuXHt7fEZVcPRu3VP1DjJinKaKuG1
 8jGgHm/K3T04G9Gx4n2heD+Ij+qc0LmPGb4jED36fyF2uUWa2yS8tZAVoTqrgYqHRQen
 /MZyXK8hVI7OvG/OqDEl4RRIh6NaD6xfPpn3Q9gjjdim5R27yrms1bSzC07AROFSaZc6
 CPEFDx7+aRUfmj+tu44eaXWD3aiQ2KIRvtlKA/qGMTDOoLV/TPu/vSqfhy/kAP6WcyFH
 PDzdQ3v7DGbRt9CUMZse3ki2pcIrqINMe38C2LptuEN3SUfN7PaaSaW0WilHAGnTFRbJ
 SuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741582733; x=1742187533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OGwlDw5fL6/8/4sqaw9ZjtskhrLsqkJfziSvtmiyf9E=;
 b=ZdSvASlNvTIu20dYTjpouWQB71kqwgeqrprVodY9DySvHBjA2U9Kbocgjv5H9Vs7Mf
 fxnkoMIAM1aRPGwcH9cl4gTzco5gZ31O1MuSubPX9gYPxEupuvl8f6IhQZeo6qmmakW4
 JKe42YGY6MDgGOm11OW+BssGVpuNLbQrHBFjedrNUIclAmsW2STWM/DGopK5JhabU5Cm
 ik9m424VKl/rk9JBtBuhS8gQR5K+ok9V1qwY4t/4mj3Fo0e+c116YEbW0REOZGRFW+Ny
 zBjCEJleJMjCzH/O7ZKjz0ZH6++nRSZSGfSGkbHL3VO1D5kkhpAOKylOHRk9DI7bQ9k2
 X2qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ2IdLQNjxk2K2eAav7kKDXActhlu1A2DPSICTL8kIEzcXBVv4Vm1NWa/OThEzbqBvKHIGwkxC/c0Z@nongnu.org
X-Gm-Message-State: AOJu0YxsOW1d7dEU7aWv4RwGyUvJKpwIHlk/nGtP4Pu3Jfz4kMgD3qn/
 muj0ceNo4eJyj7VR1Y3xN0Z5km7T4ESZ9o5Tnwn4oSR3/3g230RrF4cARFtsINE=
X-Gm-Gg: ASbGnct/mNkHi+2OXpb7ZSs6JbNTu+lgvB1Azp5AUg/MK1zqsn4D8rbtZM7mEQioIGx
 vBZQqZmbVBglSzoAALFTBxFN+oSjO45Vl8z5t0Zg78vi9L5h1O4qI3u4XWOjoyjcmyIg4A3d7vS
 UDn0Pilhdr+m+J5OaYzyAye3EEY212hrE2iE5Efvad1Sm3ag3Ss25wJOVfsoh1jAJzJH6PlaFh7
 DmuFIAbPeJ+mj9uhSDGhvfzU2tnmigm9ygGYCy7murXcCxbBdDjDIMZIS/F0KfSpXGUSM1TKTFw
 Zx3MJNvBWcbVaUIF/yf8nMv4p1Sfj+R4id0zJxRA2pL2
X-Google-Smtp-Source: AGHT+IF9OJp4stFJ9k/lsvOwoQRvqqkA/ZzdxglsajfWtO3On0dbMxz5MT0xvVfYC1mLC7gyZMGdug==
X-Received: by 2002:a05:6a00:13a9:b0:736:3be3:3d77 with SMTP id
 d2e1a72fcca58-736aaac69ddmr15637676b3a.16.1741582733352; 
 Sun, 09 Mar 2025 21:58:53 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:52 -0700 (PDT)
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
Subject: [PATCH 03/16] include: move target_words_bigendian() from tswap to
 bswap
Date: Sun,  9 Mar 2025 21:58:29 -0700
Message-Id: <20250310045842.2650784-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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

This is needed for next commits (especially when implementing st/ld
primitives which will use this function).
As well, remove reference to TARGET_BIG_ENDIAN, as we are about to
remove this dependency.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/tswap.h | 11 -----------
 include/qemu/bswap.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index ecd4faef015..cc662cd8b54 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -10,17 +10,6 @@
 
 #include "qemu/bswap.h"
 
-/**
- * target_words_bigendian:
- * Returns true if the (default) endianness of the target is big endian,
- * false otherwise. Note that in target-specific code, you can use
- * TARGET_BIG_ENDIAN directly instead. On the other hand, common
- * code should normally never need to know about the endianness of the
- * target, so please do *not* use this function unless you know very well
- * what you are doing!
- */
-bool target_words_bigendian(void);
-
 /*
  * If we're in target-specific code, we can hard-code the swapping
  * condition, otherwise we have to do (slower) run-time checks.
diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index b915835bead..ebf6f9e5f5c 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -1,6 +1,8 @@
 #ifndef BSWAP_H
 #define BSWAP_H
 
+#include <stdbool.h>
+
 #undef  bswap16
 #define bswap16(_x) __builtin_bswap16(_x)
 #undef  bswap32
@@ -8,6 +10,16 @@
 #undef  bswap64
 #define bswap64(_x) __builtin_bswap64(_x)
 
+/**
+ * target_words_bigendian:
+ * Returns true if the (default) endianness of the target is big endian,
+ * false otherwise.
+ * Common code should normally never need to know about the endianness of the
+ * target, so please do *not* use this function unless you know very well
+ * what you are doing!
+ */
+bool target_words_bigendian(void);
+
 static inline uint32_t bswap24(uint32_t x)
 {
     return (((x & 0x000000ffU) << 16) |
-- 
2.39.5


