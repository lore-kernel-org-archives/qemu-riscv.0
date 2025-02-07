Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5791AC02194
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 15:34:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tgQMv-0003Bv-Dz; Fri, 07 Feb 2025 10:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKQ-0008BT-Pb
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:31:39 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKD-000430-UN
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:31:38 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38dd14c99d3so84707f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2025 07:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738942283; x=1739547083; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ss1s/z8UDnfCDTK92VTNTdO4MGHnAPeMCWUHdvvh61s=;
 b=nNMZDgnhuQajNYVVq558zMpeT6wnXeS/yqwKxgtG3MYBrNDn/sG1+zozdI/ayyzUFZ
 EuEq7Qh7stYMgyk2KcVByC1KGPQjadhB1QGzSSt1bxtDZynBJ6Kj8gLdjS+9pNdynlhh
 yXEL6t84aWrRmdo9bqUk3FDvO4/oB4kURd7Ub4iB0Yv8uONtp4fqzhZT/p2mu76epJPV
 EPyKGmRhTmeKMs58iVLx79nUZy/U746UIRSTnwwOvOOWy6W0AdJ4Wk2G2i6H5en0fjqG
 +pwj58/5H/sUFieGkcGTk8VqsqB344Ivai4FYGxYTpzQ39wg6CYQnK/ucLrhDAmsqaXq
 9dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942283; x=1739547083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ss1s/z8UDnfCDTK92VTNTdO4MGHnAPeMCWUHdvvh61s=;
 b=sWmh5eTf+2EtXz6pCRQhmXYjBGtpN0tkmHrA0nuwU/+hOT8NtgxXu+t7El9Uhs/bZ2
 +ktTxBso/6VLXeJTYmOiD6J1qC8D/eFucIKxCGOEy0jFWIYhFVrUW7RcB/6ilqh1UY7b
 V3oMnwVZ2ZlgaO0l+jQxAFUsIwP5xO6e4u2hmoELCpJ3Sf5ubVVUACFrhJ5PJmtLxqr+
 /Yx+IPMNQ6uaKqyRdv+PsaE8lr5hiQcZf88VfQR2ajLHZs5UXQr1lgu3LB6ansNX1q7U
 AS/vv/RdYFDkmMvWuZw6WaxIqhlth/eXHzHLAT7wi2eVH86AGl1ZS9SYisneMX+5ObPd
 GGhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvz2IDP3trfJRscMqsENtDkQLwBsTJS9JbnExGiva8+nYHFJqW6mCr849sFzgEGNwN2eOXPD8QK7ue@nongnu.org
X-Gm-Message-State: AOJu0YyjmhDxop2/edaCl+X7z6e+SjaGsfqdxviM7wy6+CjZ2maarW93
 z2uq4vna/VjNLRcJh7U8qGU4Z323GHTx3uxxCUn6rG4Ux3nn0YBpH91/bdISNOs=
X-Gm-Gg: ASbGncsPiJONqebvib8g7zEA+9COsosjsX8C6xi3MZVsKe6NhCw8STA3NAtGp0zIGU5
 l4Vx6Cg5HDDbg6Ufo9fcd9oTiLCS+/7K0+whs1zogOLpO9lomxnNUgZMgnFZCrjy9UnkCK5iZiH
 H2FLrhWO+9YdgFMphcMZdYT3mPb1Yzh1PKlZCJIFvg9EgsqFVuptnWrgeP0dzTCaOu/BBvILRO0
 cSFGrZp7IAT/OG397zic/Z/q4ciUVRaiRNSzSdjCdt6f+986e0OwWLNdw54rV58fDC+khtpAb9w
 pTfB7xngYokUEosMaw==
X-Google-Smtp-Source: AGHT+IG2SX5Q4KH4eRUVjOQ+1iALf4yNIx/St/braMTwifGpTyevkQkBwosEMcyUpLup4bcyJ/NyEA==
X-Received: by 2002:a5d:584b:0:b0:38b:e32a:109f with SMTP id
 ffacd0b85a97d-38dc8dbfc57mr2993423f8f.12.1738942283500; 
 Fri, 07 Feb 2025 07:31:23 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab779832909sm246283066b.49.2025.02.07.07.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:31:18 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7F319609FC;
 Fri,  7 Feb 2025 15:31:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Kyle Evans <kevans@freebsd.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Alexandre Iooss <erdnaxe@crans.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 qemu-riscv@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 12/17] user: Introduce user/signal.h
Date: Fri,  7 Feb 2025 15:31:07 +0000
Message-Id: <20250207153112.3939799-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

gdbstub needs target_to_host_signal(), so move its declaration to a
public header.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20250117001542.8290-4-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 bsd-user/signal-common.h   |  1 -
 include/user/signal.h      | 23 +++++++++++++++++++++++
 linux-user/signal-common.h |  1 -
 bsd-user/signal.c          |  1 +
 linux-user/signal.c        |  1 +
 linux-user/syscall.c       |  1 +
 6 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 include/user/signal.h

diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index 77d7c7a78b..4e634e04a3 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -42,7 +42,6 @@ void process_pending_signals(CPUArchState *env);
 void queue_signal(CPUArchState *env, int sig, int si_type,
                   target_siginfo_t *info);
 void signal_init(void);
-int target_to_host_signal(int sig);
 void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
 
 /*
diff --git a/include/user/signal.h b/include/user/signal.h
new file mode 100644
index 0000000000..19b6b9e5dd
--- /dev/null
+++ b/include/user/signal.h
@@ -0,0 +1,23 @@
+/*
+ * Signal-related declarations.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef USER_SIGNAL_H
+#define USER_SIGNAL_H
+
+#ifndef CONFIG_USER_ONLY
+#error Cannot include this header from system emulation
+#endif
+
+/**
+ * target_to_host_signal:
+ * @sig: target signal.
+ *
+ * On success, return the host signal between 0 (inclusive) and NSIG
+ * (exclusive) corresponding to the target signal @sig. Return any other value
+ * on failure.
+ */
+int target_to_host_signal(int sig);
+
+#endif
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 8584d9ecc2..196d2406f8 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -61,7 +61,6 @@ void queue_signal(CPUArchState *env, int sig, int si_type,
                   target_siginfo_t *info);
 void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
 void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
-int target_to_host_signal(int sig);
 int host_to_target_signal(int sig);
 long do_sigreturn(CPUArchState *env);
 long do_rt_sigreturn(CPUArchState *env);
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index b4e1458237..8c51f6ce65 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -24,6 +24,7 @@
 #include "user/cpu_loop.h"
 #include "exec/page-protection.h"
 #include "user/page-protection.h"
+#include "user/signal.h"
 #include "user/tswap-target.h"
 #include "gdbstub/user.h"
 #include "signal-common.h"
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 087c4d270e..bffbef235c 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -36,6 +36,7 @@
 #include "user/cpu_loop.h"
 #include "user/page-protection.h"
 #include "user/safe-syscall.h"
+#include "user/signal.h"
 #include "tcg/tcg.h"
 
 /* target_siginfo_t must fit in gdbstub's siginfo save area. */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6ee02383da..90afaa4426 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -138,6 +138,7 @@
 #include "user-mmap.h"
 #include "user/page-protection.h"
 #include "user/safe-syscall.h"
+#include "user/signal.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
-- 
2.39.5


