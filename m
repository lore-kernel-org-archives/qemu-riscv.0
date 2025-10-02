Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F64CAC5B8
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 15:01:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v4Kld-0007RZ-5s; Thu, 02 Oct 2025 10:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4KlQ-0007OC-FG
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 10:58:37 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4Kl4-0000Lw-J9
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 10:58:34 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e6ba26c50so5239645e9.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Oct 2025 07:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759417088; x=1760021888; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0izgqgQPxEFUV3fbD9mNX/9Xd9YILFJwZ3Tpv0yfZhc=;
 b=YM1uv/8y4S1PtmoMt4L4jy3suO7qjsKkrVhWwcZh6+h0n1DHMKNVc5UjhjBUKnJdap
 sWS/BcJcjDP0eTpWXqZ8MUUDSjZWuOcIOln+ss38//JIeU4naftCBemqxmo0H3oioub2
 ErVttl3lH4CsIC2NLfBL0ZFrAuR3wMqkn9x9fSj1P995Fgikv9k1dFjJuVlFeXHfcYKc
 ORye/67C6+I+2YVCJ24inazcrAJbYUOlvu99E22kTymS9jD556qRaLfi/0q9E/oS3A+o
 9wdx3QoAAYQ/AIVs/YnFM44MyvS4O2y1l1zpyBloViEbmMrRcQI11V1QS+EOZEmkxFF4
 rBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759417088; x=1760021888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0izgqgQPxEFUV3fbD9mNX/9Xd9YILFJwZ3Tpv0yfZhc=;
 b=EjCjKHwUS9huXDCiLC+m8PAEK6hScv+xN4n4uWgE1IAJdo/lKj6gT77eI+d5+oDw49
 DGFU8TUCILFLWmvISAwH6J0SY1niqTNQlC2KeVVw8Ao3Ro42wGuX1OrDwcY5W9M6EzaM
 fdcMliLt8fcwJFvjZY84Dum6R/MvBOuMxvm956PLtc5Jdo8iMGaTT8+o+o8OrjKzuvar
 pZbnCfCuDqm69SSchVz2S9j1zCixytxiScBWLMlYbWrngCxCzJ3MQszj1o4p2YZM8urI
 RNw6YdrCSx1oSuQcxC6XOhVD4lr9FUEHGXc53+u3IMzwcIPHnrII5tDVZ0daBpPE+/2D
 T/7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY6UCwK1IsKozcZ5BMUaeViOzsVpQLLM43ahiQwwturYlU/lZgJpHLliWaUAKRPmuUMJwAaR8GEGBM@nongnu.org
X-Gm-Message-State: AOJu0YxrHlIA0hsK6Ubmrf7JlmxyNsh9+sq2OERxExfRf5xx2FOpNiua
 w3FUz6W0PL657ngo6IFvrzEob4v0rin+pxAjwz2Bt9Ib5B5vxG5wqixeLdWVXkMyqOE=
X-Gm-Gg: ASbGncsbE9qlmzLVsJw6y5uw0708Ep3mHaecVImNIGZCjPE0kov7KwT/FaX/f+yDWVJ
 V2M33BlTlT6JwS4cJnqu2PAKB2XpZ6SdcRttxG87cBYvmvB9UhEEINagWoe7+dDLwoRrLkfXzcw
 w4rK7xDyLVgN0Nm8jtz6NXLMNpuygaFRZMEOMj+4nIcNAEH3TTcEbwZevxu1NrRCt9seQkjo9sG
 XNO7EEzcWXvXg9NHOrdp7BB8oP7UQq4f/qmIMEYc5g8uwjUtv+597Jth5i3kF3yeEAXIoh1FHud
 JwaJRItTqET0s5lUNNkpKOFOOhakxsAHPGsW+kY9ACSRRexC61f8u0FCCex2wxgd5Pufo0sSgX9
 9SvRGdV2jKYfWoDyzIhr+T2wp1qh13lnsoQh37ThrG2Y7DfcnaZGki9U0MykEXMM6B3uEVTcxNE
 xpeNzkw9hV57LuL9pIH5Qx9I3D
X-Google-Smtp-Source: AGHT+IF6k7IasRkJZ6/byTlNsF0gw6uHMcWrt6aJ835DaIWYOqY74I6isesCnT6ffcFG6J+pVs2Afg==
X-Received: by 2002:a05:600c:1d1e:b0:46e:1fc2:f9ac with SMTP id
 5b1f17b1804b1-46e6a2e09aemr22076735e9.10.1759417088212; 
 Thu, 02 Oct 2025 07:58:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619c396esm85237665e9.8.2025.10.02.07.58.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 07:58:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/6] target/xtensa: Replace legacy
 cpu_physical_memory_[un]map() calls
Date: Thu,  2 Oct 2025 16:57:40 +0200
Message-ID: <20251002145742.75624-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002145742.75624-1-philmd@linaro.org>
References: <20251002145742.75624-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Commit b7ecba0f6f6 ("docs/devel/loads-stores.rst: Document our
various load and store APIs") mentioned cpu_physical_memory_*()
methods are legacy, the replacement being address_space_*().

Replace the *_map() / *_unmap() methods in the SIMCALL helper,
using the vCPU default address space. No behavioral change expected.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/xtensa-semi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index 636f421da2b..431c263dc57 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -32,6 +32,7 @@
 #include "exec/target_page.h"
 #include "semihosting/semihost.h"
 #include "semihosting/uaccess.h"
+#include "system/memory.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
 
@@ -192,7 +193,9 @@ void xtensa_sim_open_console(Chardev *chr)
 
 void HELPER(simcall)(CPUXtensaState *env)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     CPUState *cs = env_cpu(env);
+    AddressSpace *as = cs->as;
     uint32_t *regs = env->regs;
 
     switch (regs[2]) {
@@ -215,7 +218,7 @@ void HELPER(simcall)(CPUXtensaState *env)
                     TARGET_PAGE_SIZE - (vaddr & (TARGET_PAGE_SIZE - 1));
                 uint32_t io_sz = page_left < len ? page_left : len;
                 hwaddr sz = io_sz;
-                void *buf = cpu_physical_memory_map(paddr, &sz, !is_write);
+                void *buf = address_space_map(as, paddr, &sz, !is_write, attrs);
                 uint32_t io_done;
                 bool error = false;
 
@@ -261,7 +264,7 @@ void HELPER(simcall)(CPUXtensaState *env)
                         error = true;
                         io_done = 0;
                     }
-                    cpu_physical_memory_unmap(buf, sz, !is_write, io_done);
+                    address_space_unmap(as, buf, sz, !is_write, io_done);
                 } else {
                     error = true;
                     regs[3] = TARGET_EINVAL;
@@ -408,11 +411,11 @@ void HELPER(simcall)(CPUXtensaState *env)
 
             while (sz) {
                 hwaddr len = sz;
-                void *buf = cpu_physical_memory_map(base, &len, 1);
+                void *buf = address_space_map(as, base, &len, true, attrs);
 
                 if (buf && len) {
                     memset(buf, regs[4], len);
-                    cpu_physical_memory_unmap(buf, len, 1, len);
+                    address_space_unmap(as, buf, len, true, len);
                 } else {
                     len = 1;
                 }
-- 
2.51.0


