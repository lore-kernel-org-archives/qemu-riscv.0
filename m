Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28C0C28B2F
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 20:02:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ts5lI-0002rw-NI; Tue, 11 Mar 2025 15:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts5kA-000101-Dg
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 15:58:29 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts5k6-00006V-GM
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 15:58:25 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22580c9ee0aso38784915ad.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 12:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741723101; x=1742327901; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8l5XLcA1+OCzVWAzWmOGo6RbdXUAYo+RpTNM4YWpKg=;
 b=jCZOuqjDyeG6b/7Cfe9xwtPZdgpXh1oekmFRQeZKDvTzMjmmO2sSdHkZVl/rxzjFOO
 MEAFG7R6Im6LpUVFZ7L38M4/tX6t1NAcYmEyW2gzfmLuhQT0mLhXIxNRTe5wF2Ow86GR
 /26uXB5esJ++aah0uvEGd6j0K0sIBnVAQt7jQu+VI7mQ9W6m+1b5W/bKz1aUw/QHpWTi
 b7k1JvcT4mdX+cvXD+6H2skS+BYRtRDH/3H4mXe6M5IthRi3JmHPveaEBvw8IaRS+PzV
 94JrAUSG7bD6z3CRUnq7rtFm2Kfa6uiehDBwydEenr21AiK2hRErRpDbQ8AxOzLvz4+J
 4VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741723101; x=1742327901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8l5XLcA1+OCzVWAzWmOGo6RbdXUAYo+RpTNM4YWpKg=;
 b=sMuwbGxZCRaqHtQjCBXsCi1Z333xVuqDYLAvNheQmLivfSH1wM2t7BAxTztpkeNdcv
 LN41QGZv6TjkRWwtssZMv0lZui7zxCvNDxSYmDDn0Y8sDihWct7R1UGRtVfhdOzKO9d/
 Yolv88BY7MY3DCHyC5fSOmV8U3eXmyaG9xXsm02md7cWnH8Bs11xi/zBSIZx7d+2v2lU
 Ll42jruW8flCu1xnLPKKeT2DZRN90d4ZkSEQHs1R9g6dlL4WgsmaNMkkMaTrE1w0AqBu
 V/GahQg6VNppKuMSafxgbRPhkawYPsaqdyJcFQn79pLU7y0E1ybl6Wgp4UFJAPMhRvLg
 rqNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfwaL6jJ2FU/y+ip7Rkm0+lGS4ejnro43zYvZ4/WV2e9lo5J+kZhQvR2fc7Zo34XrwTs0bmTyeewHA@nongnu.org
X-Gm-Message-State: AOJu0YwLsXfOARXmBt+Wt54g1ZHolvpdTFce+Je+TjiPqXnCOJ2bP7zx
 b+0tudGM260reK4g7uTgm1gg8w8F4ejkpllJbpBWEpzWGJ/JstdP2yYcSoqxNp4=
X-Gm-Gg: ASbGnctdTPkBfC+hWj11oOQQHd1UluwxokA3zCd+XPlReldtP2HXBhzHCJUyoViy5vP
 YDD4b8avM4s0eQgt4PS1W2oUyDA7f7FGK2b+HXrpgIwpCZYqiRhvqChjHOgCzUUVGnuzTKvZEg0
 b3a41iEMPC1y4k1WMeKZojH3RfPeJ+8w6pC+mi61owQHfJ7t9OKYbg221c4gbWq54JsPwxhmBlv
 8Tps9fdrl7dufwN1PWDL9m3dgLyu9boNF1bYDQ9WUomjwRHknrSVSRkZLvLARK8kEfnZf8svf2x
 g6+uUTJhkIx8rzUheOwcw6eX2chdsqLTTnm8ztfuajoD
X-Google-Smtp-Source: AGHT+IEgYvc9dMvCeCMS1wOBfk7GI8sssnnWj2guiDlIPD98ekjEveZX8r3rPhR4gVsvHIzZwJ8+qw==
X-Received: by 2002:a17:903:1a05:b0:224:1294:1d26 with SMTP id
 d9443c01a7336-2242888bf0fmr253744785ad.13.1741723100980; 
 Tue, 11 Mar 2025 12:58:20 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:20 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 manos.pitsidianakis@linaro.org, Peter Xu <peterx@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, alex.bennee@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 09/17] exec/ram_addr: remove dependency on cpu.h
Date: Tue, 11 Mar 2025 12:57:55 -0700
Message-Id: <20250311195803.4115788-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
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

Needed so compilation units including it can be common.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 3d8df4edf15..7c011fadd11 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -20,13 +20,14 @@
 #define RAM_ADDR_H
 
 #ifndef CONFIG_USER_ONLY
-#include "cpu.h"
 #include "system/xen.h"
 #include "system/tcg.h"
 #include "exec/cputlb.h"
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 #include "exec/exec-all.h"
+#include "exec/memory.h"
+#include "exec/target_page.h"
 #include "qemu/rcu.h"
 
 #include "exec/hwaddr.h"
-- 
2.39.5


