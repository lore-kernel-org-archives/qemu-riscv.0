Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5944DC4345F
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 19:28:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rxXQT-0001fH-Az; Thu, 18 Apr 2024 15:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXP7-0008Cw-Tm
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:26:47 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXP4-0007W0-9b
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:26:41 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a4715991c32so134651466b.1
 for <qemu-riscv@nongnu.org>; Thu, 18 Apr 2024 12:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713468396; x=1714073196; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jio+r+AEUkjjrU5gDZl4zBsemaqAFeHzEWFaXnqFrOQ=;
 b=H9ay9pzyZ3ABmD/RWdVRSmHZJ7NF0E3NBJrceLHGEJzh6D7hJPH+8f2V1ryKITt3ud
 /B3wppTVSXUgTFlvB63p+1EKTKSIGLDYekYP/JSXjD5ogQiuK89yM44cC6X0kRqw8VMq
 dPP4gljVL+cBnfA8M4m3V67fVvUoorMzwLr3wSy4Wg9JOhVtV8WbmGtvc/rN1bn4rP94
 IfkdTDv83Dfn+TueCEwTIv5uOmw7J30z3m9GIha/9F5lkqNUyooZOiYbjS0Y81TSqkC7
 qD+ALB49Pq+ZT8OnjAnk4roeyzf99jWE4yIgwVTFCCDLa+0kj5jnEdP6ueDv9/pMbc+l
 RIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713468396; x=1714073196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jio+r+AEUkjjrU5gDZl4zBsemaqAFeHzEWFaXnqFrOQ=;
 b=Fw5Bb/9w3QCdoyd0FBNOGphWfXiPx6gcm1B5+XL6PHVwkaFnKv2/0HcRvqUiqc1yeW
 5AgxJNoPcmEmFmJAkjyqevvttZRaOVnA+O9N/miCPu8XrrBRTYI632NoMKCV0sY2b2Vk
 Ba17aro3IrLYsO9WPYFf6SLhvIZO3SQ/YJzxG3Qb4qd4/LEGob3zfqnYmh2Gv1OX2JnS
 Ui3nQ7sa1hoDvDx/3xIOrDMZSTIaj5BL2d/6Rt2KwPF988Q22SX8wJllw4S2veYZXR3O
 RJtuToboJMm9vndiSJ+DO4gXDBcyEr59XWbwLyJ5SSmshw3qSJnKErS2YI851GMTFK0E
 mm8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA7fjaDddVgSCfSlr5CezVRBD56mQWbztEWeoBxCe45UAB/gNICZKXtquTe7yTGFWRPwU67qmVYfU1KQ6QblOEj4LSDbA=
X-Gm-Message-State: AOJu0YzkNCzmymL/arm0GK2uv8Awnhmy3wS7AZ7brV4dCxhEIUCuBbxD
 vujHr0nE7NQ7NGlz6zs4kJLKsDlIyUcUrz3W215TCF6499YiE+1T6e1w9Yfv79c=
X-Google-Smtp-Source: AGHT+IGvos0mZIxaTBgDhPQVJFUlHPzRnRLeB+2FoZuf4Lvw2zFvFjAnSJwEUd4r5lLo33Y0Jgv61A==
X-Received: by 2002:a17:906:1f48:b0:a4e:cd5c:da72 with SMTP id
 d8-20020a1709061f4800b00a4ecd5cda72mr43114ejk.63.1713468396179; 
 Thu, 18 Apr 2024 12:26:36 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.151.213])
 by smtp.gmail.com with ESMTPSA id
 lu10-20020a170906faca00b00a52299d8eecsm1238430ejb.135.2024.04.18.12.26.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Apr 2024 12:26:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 11/24] exec: Move tlb_reset_dirty*() declarations to
 'exec/cputlb.h'
Date: Thu, 18 Apr 2024 21:25:10 +0200
Message-ID: <20240418192525.97451-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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

Declare tlb_reset_dirty() and tlb_reset_dirty_range_all()
in "exec/cputlb.h". Restrict tlb_reset_dirty_range_all()
to TCG accel.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cputlb.h   | 12 +++++++++++-
 include/exec/exec-all.h |  3 ---
 include/exec/ram_addr.h |  1 +
 system/physmem.c        |  2 ++
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index 3594f904b4..dc92befb93 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -49,6 +49,9 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
 void tlb_protect_code(ram_addr_t ram_addr);
 void tlb_unprotect_code(ram_addr_t ram_addr);
 
+void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
+void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
+
 /**
  * iotlb_to_section:
  * @cpu: CPU performing the access
@@ -69,6 +72,13 @@ hwaddr memory_region_section_get_iotlb(CPUState *cpu,
 
 #endif /* CONFIG_USER_ONLY */
 
-#endif /* CONFIG_TCG */
+#else /* !CONFIG_TCG */
+
+static inline void tlb_reset_dirty_range_all(ram_addr_t start,
+                                             ram_addr_t length)
+{
+}
+
+#endif /* !CONFIG_TCG */
 
 #endif
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 778c82ba8e..6f46015ab4 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -640,9 +640,6 @@ static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
 #define WITH_MMAP_LOCK_GUARD()
 
-void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
-void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
-
 #endif
 
 #endif
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 3fc83587c0..f06ae9b516 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -26,6 +26,7 @@
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 #include "exec/exec-all.h"
+#include "cputlb.h"
 #include "qemu/rcu.h"
 
 extern uint64_t total_dirty_pages;
diff --git a/system/physmem.c b/system/physmem.c
index 38d3ede9f9..7a7876a375 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -850,6 +850,7 @@ found:
     return block;
 }
 
+#ifdef CONFIG_TCG
 void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length)
 {
     CPUState *cpu;
@@ -869,6 +870,7 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length)
         tlb_reset_dirty(cpu, start1, length);
     }
 }
+#endif
 
 /* Note: start and end must be within the same ram block.  */
 bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
-- 
2.41.0


