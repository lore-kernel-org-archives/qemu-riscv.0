Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62867C28B2E
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 04:13:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trqy8-000688-CE; Tue, 11 Mar 2025 00:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvi-0003RK-0j
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:27 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvc-0006ZH-QS
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:20 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-224191d92e4so86288005ad.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Mar 2025 21:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741666155; x=1742270955; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jGKe5PComzh06JRRSjyC3R7ujh2oauOlO5efOCu+zg=;
 b=JEXakf51zH+inLHyfuDwVlhg3gy1ic9uQZGDTUNm0Ye4yqdgKPfJ4DtmwchOUJ/Pw0
 CBaCxiRVo37JBgkYpNq4LnDA9n44kssWDt5igXLZ7mRQ8KxRrgrStwGrVuSPBFZfsO09
 PqWn1z7Exzeni4PBeodzbsGvPlnMMb1iV9EeoskQ7wgcPD1HvnUFa8+6FNhn/XDv/RRs
 4VCg+DofUFtIMT6FC96akOpFd91QctdvRpy5/csjSL+wbQ3XhgDbKzeCLoo4/ST7a0ss
 YhH4d8WC9wjiLz7y1Fe0zVQ5HM+T8ZWgi+ZiNPN0Pl6mbHV89cloAumMmVYA6ZuCklL8
 TFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741666155; x=1742270955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jGKe5PComzh06JRRSjyC3R7ujh2oauOlO5efOCu+zg=;
 b=pyy64dng4NVNBbNC/D3TcjXptdmn57g1uDKUa7M7ZcV0IFFuZ2HuKVRF8RarBYcye4
 4VZWjDyLp61IwyECdJ3WM2ldjpUTJ7b36xQjUGLB75SYW+Y2QUGKbaSL58BoKtHxOzUw
 o9VCt6xwjfMpGfNEQWf8SAm1nl/LlP4p5wmNYCHDxAU/9urR513EPMnnZNo9Oj8luKwe
 7XdxEr9QZu6hDcy4kS2NXgFxruldhyiBW3wmIfkBXwE7r+kw5UkCtZ9nisJR47wSIIQa
 WV8emgqLrMueJ7+c4fTVXJgg7z5KcsXL+DbfnzEW75rge+VeXsgcKV9101YKcsptN9nK
 emwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv7XlfoNpHdgtSuOLFVxQ9OC0bKpcrX8qKJlbQUChiwsmxo6G6pWdSrOCPnJz6q0VpooKqyOQkcjYh@nongnu.org
X-Gm-Message-State: AOJu0YzbFxHHtiLzkcTVE61IjGnuGmtoJoh+t6soRNudSyuSY5BoMVI0
 RF054ze5g0JEHIjL8Avij6RgqASasZ3n9jvfeaIxkBabVBmriQ1bCxRTFB0l4/8=
X-Gm-Gg: ASbGnctxDm8oRtF0N54sopwZeYqJ6KN7erkSHlguMUOvKmhKHicLlAgBKxFQWZOhoRM
 4wjoDfdaBaSQhH0dku+OoXRePragkx3E90xZzROwgoJqBxqR7P+UVn4Ctl4+v19oQfvt0I1clKT
 fBhFjNO/S78jIY8Fcf+9tVR2kZqrmr0Ss7iEt4zKU4QQq3XgKEG0m6UpDSGUeLvxnR/UX7cxF7J
 IhZibuIz/8Hkb0XBLWq35MTRfYGaYxlXf6yC0RpBIHhi/mqmshFkTi+rsEXXh3lVr6dJBeP4mPH
 bq8mOx+BYbVKfcB3TvVdz502tk01dvwVhITI1vO4OSCE
X-Google-Smtp-Source: AGHT+IHyNZlPl+mr9I1Abk1OGoyMfz7g2vsqkJBEqYSKDsIrZops7PpVKyQRnmB7QqPJXfOnNuaTjA==
X-Received: by 2002:a05:6a21:6f8b:b0:1f5:8b9b:ab56 with SMTP id
 adf61e73a8af0-1f58b9bb025mr4529566637.18.1741666154964; 
 Mon, 10 Mar 2025 21:09:14 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:14 -0700 (PDT)
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
Subject: [PATCH v2 16/16] system/ioport: make compilation unit common
Date: Mon, 10 Mar 2025 21:08:38 -0700
Message-Id: <20250311040838.3937136-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/ioport.c    | 1 -
 system/meson.build | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/system/ioport.c b/system/ioport.c
index 55c2a752396..89daae9d602 100644
--- a/system/ioport.c
+++ b/system/ioport.c
@@ -26,7 +26,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
 #include "exec/ioport.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
diff --git a/system/meson.build b/system/meson.build
index 881cb2736fe..3faec7e4dfb 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -1,6 +1,5 @@
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
-  'ioport.c',
 )])
 
 system_ss.add(files(
@@ -12,6 +11,7 @@ system_ss.add(files(
   'dirtylimit.c',
   'dma-helpers.c',
   'globals.c',
+  'ioport.c',
   'memory_mapping.c',
   'memory.c',
   'physmem.c',
-- 
2.39.5


