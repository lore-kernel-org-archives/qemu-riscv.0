Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE27C282EC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 04:59:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trVEM-0002qQ-Mn; Mon, 10 Mar 2025 00:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVED-0002iD-GO
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:01 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVEB-0008C8-4Q
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:00 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2fecba90cc3so7410104a91.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Mar 2025 21:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741582737; x=1742187537; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ErKU0wbfVZdnsjs5NMSuiTB4KixyX1gD9AraKkIZNBI=;
 b=Wwce749RdHqlRIBZdhrckPzjhjP88AYfjokiqXFaAhgQLoXstreXcOoKtRrqZFr1Q/
 7GcYLPbDlUIzkM/14W+uly017zKgkxkbl9nLoKSa7Bt7KEb1T+xvZ/s4nCGpD/CPHALl
 2h6jRWIHOEcdVQXGUY5JZQxLq6JQQJNWbaCSwAdn7owihpXGldkiiJpknoXlaDNG0B+c
 mv1PJubKa68QATrc+S4EF635osuJQB00I2WDI/qrU5HZ+4gfrSL1vDsoNtsiQiJ7uwoh
 z14m92uCqW61mWzZI3GcnLoxmzG5fZU3McNEI7x+lTBQotkjNuUmdPfglZHWM9bZEJ0z
 +XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741582737; x=1742187537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ErKU0wbfVZdnsjs5NMSuiTB4KixyX1gD9AraKkIZNBI=;
 b=CH3zTiFnJbYowO91q9w8ewU9D1rpP6OToWJrDSa8LHSe3HtYUvxJ8deForvuPJqTcv
 K/NVWxblmKgbu2w7RErw6gTdWozOXl8+0ZxW88NjiEg0OutqjxNv0BdLgYAN4W2gMUkx
 U3zUIaqMOIPzPNypz74ePROYeSj0tsqAWmu8TckD9vNQ5Q+EuYdkoQL/iYldq+5RxtkV
 dwyaJL4ni6sZQ6WWm57iuMgvFHZJGX+gglSShAPm0zIHfyYrQM/pcALzloGkjdYOEvV3
 F6nOz098piRShf8HvVkZ/zWsdOwGJtL9m1Aa52v9M2UHLY9K9qlQeD7sMQUyyQnFKPhm
 mQNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJlvMizl4V6iL702Ugfq2jNFdiwV/qQjjb2l1Aa9tg4Maj5q2mR5Xk9BZa81iK5q/lPREENqDdBomH@nongnu.org
X-Gm-Message-State: AOJu0YwZkuc09aI9XjJjJFlDkdzJQlHn0YDWPcp8NKlAGyfGahtkj0c9
 TF/8B6fY8uxDfTpIBmai8L9VwLaR6GR2DYoTi9MNZvpWfDW0rkcaAWSjDE4ql5E=
X-Gm-Gg: ASbGncuviVD8oQ6cUH/22KvTIU2v4XX5ZH7JvIi/3ruFLB4fe4ywJruL9k/C9b/1Vtu
 Z2U68iv566valZNpScDhhHRzB8szSxHF8qzdIPRyI6Iqwr05n0KEwgjHJPJe1JWov7I7C6rfMbd
 46X0yTWsTmP5aNwMdcj2oJD9u68ZbInaHBs9YH0g4SX5wSc9K4mdHK4UlPsY0QmC878wmz1MEzb
 sFZpdUeT+1PFntPV1gr+DiTiY5qOOUf+xU5b/6zMHD8WcFoIlVkM2TjdgSvNBtV3pzpH/yCwLXx
 CE2KA9XG6bX/uRrhfVHaHWCMBpVIlPqsCBLd+tStcxm1
X-Google-Smtp-Source: AGHT+IHO0adHTKDFbdiZLdbwVjzffyYfi7nVPL6wN+0ieHxoGwNOezFQMlR0NxHpJZQhWhI8f44U4w==
X-Received: by 2002:a05:6a21:9786:b0:1f5:8506:5039 with SMTP id
 adf61e73a8af0-1f585065599mr1040552637.28.1741582737079; 
 Sun, 09 Mar 2025 21:58:57 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:56 -0700 (PDT)
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
Subject: [PATCH 06/16] exec/cpu-all.h: we can now remove ld/st macros
Date: Sun,  9 Mar 2025 21:58:32 -0700
Message-Id: <20250310045842.2650784-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1035.google.com
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

Functions declared in bswap.h will be used instead.

At this point, we finished to extract memory API from cpu-all.h, and it
can be called from any common or target dependent code.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 1c2e18f492b..625b4c51f3c 100644
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
-- 
2.39.5


