Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D14CCA470
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:13:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3ySX-0004U8-C7; Wed, 01 Oct 2025 11:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yST-0004Qo-Fd
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:09:33 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQV-0000sQ-Nh
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:09:33 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e42fa08e4so47968115e9.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331244; x=1759936044; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7o+nv06XBHGB51yxt1OEKJBgV9gHbisZFhpgcb1BqQ=;
 b=YUVzAZRCiIkvBfFyTl8r3vmMvqXgpkn9m0laU+u/bmKA4r1IbzpciSeTdnQmc0Tskf
 Ukzj7HaX9S+T9sILSe667G+FKJIuwojtlwtiR1SiUd17RL/YJZGm0Myp6RxTYGhZcSwM
 gQSxVCZqTuolxlgc40nvSRP5QwLJQjb1N70nw2wYC1jxoFLf02F/V+90TeqYiJ1qMpvl
 HN1Dheyn6fbBwBwy4IKdomzGXwIIbSAmZIHqP3Gi75Ze6KqESOb5/v/oCN911kfxLBzA
 tU6aSq0UtD8Y1JTfKNirvraPcUXdvjaGiNTQkkpUpwV0CT0GcTdzwZb9vQOOH98bZjyp
 C0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331244; x=1759936044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7o+nv06XBHGB51yxt1OEKJBgV9gHbisZFhpgcb1BqQ=;
 b=upEsUlT2HvYDAhASw3iXNWjBTyDZLgtu5F5+hys4ouTDiLpJbeGGd4PRQeEgRoCaTM
 bMXPhcYQgR7f8LrJeZjVnRCsZtBLvyA/x68UwfESRvX0WmDJ3a8gdUs0yJ9QDrBz6V0M
 f+Ze/agNWtAep9TxRgasFxJUhIoout+auCw6JkCdrnaSNRWqQVPDCt8kkyehLQ5zhZHe
 YpBXK6sw/vhqq1ST5Ujip9ZdbueeKxb8b46Vac/V81uWeDhMp3Xyh95H15iU6JpsEm3G
 x4+ODbVwGUN/m5s9xkJ+qF9//R7KbZaiO2BCKj1gecyh6E8UuKcV0DAMi+17eFusxMh6
 4i5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2blwQcPNcmyLDJKB6vXfaWSral4toAptINwT9rMpRUobbiHuMZYKABzLVddl3tDv78IBBdKJp3T3c@nongnu.org
X-Gm-Message-State: AOJu0YyAiINslHgFOisUEFVedTEaM//I9SFmRccqcPCbbae/wMw9S58/
 +Uzq1EuTB7I6ZsacN0UmuofwdC88vCfVKWVnMnUKADx8jv0QkX1k/w/aSxBpe8nL38o=
X-Gm-Gg: ASbGncvHCpUgoPhBFnHq4HRobbqiSo7bqV7JKV+y9TXAUKz9bS7HxhivPtnXejsLVhd
 sbrwtBW1yVBjH4G+4yqCIPoanr5E01Lg27EdsNF8FgziffsgI/mxMvE8ko1OPw2xRbkjU77QdSH
 Vd4Mkd7U3nHiAAg7bdnu1onlciuI5oHO34IHJiXRgw9tHM1BltIWp540mGWFQs4r9XDtE2D8/rp
 gRbHNTt0Z3HNgYOBiaJ8ieahbIQngFnnI6pI4z+n8FJBIwX58u9S/HBfDNExJt/OtdrGmNtZERF
 b9XNtgGmyHhX50bJDJbQJELydUphAsqDzr8GLbbywA6+oN+0g+RKFVvXu8rCfW7iDVzqbzxQtVa
 Ciu6P6rRMNbGp5d0eZn1rZnngTRyu1SpXS7e1g9pyJE8U5IJtygKZJn5XU1SboaVyDat9k9wbTi
 NvuWOab+eQFjz37hFbDWBmVMYQRsi8v4U=
X-Google-Smtp-Source: AGHT+IFkQNGVq0nEvAqiHZde44QbZe8PBGEZKor8cq6aaYtJtyGE0kwMUg/fi8b17T+fFK2R+KPQFg==
X-Received: by 2002:a05:600c:348a:b0:46e:3f6f:a8ee with SMTP id
 5b1f17b1804b1-46e67a5c7a0mr7124835e9.13.1759331243991; 
 Wed, 01 Oct 2025 08:07:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc8aa0078sm27313031f8f.59.2025.10.01.08.07.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:07:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 22/22] target/sparc: Reduce inclusions of 'exec/cpu-common.h'
Date: Wed,  1 Oct 2025 17:05:27 +0200
Message-ID: <20251001150529.14122-23-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Only 2 files require declarations from "exec/cpu-common.h".
Include it there once, instead than polluting all files
including "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/cpu.h          | 1 -
 target/sparc/helper.c       | 1 +
 target/sparc/int64_helper.c | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 31cb3d97eb1..7169a502432 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -3,7 +3,6 @@
 
 #include "qemu/bswap.h"
 #include "cpu-qom.h"
-#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
diff --git a/target/sparc/helper.c b/target/sparc/helper.c
index 9163b9d46ad..c5d88de37c9 100644
--- a/target/sparc/helper.c
+++ b/target/sparc/helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "qemu/timer.h"
 #include "qemu/host-utils.h"
+#include "exec/cpu-common.h"
 #include "exec/helper-proto.h"
 
 void cpu_raise_exception_ra(CPUSPARCState *env, int tt, uintptr_t ra)
diff --git a/target/sparc/int64_helper.c b/target/sparc/int64_helper.c
index 23adda4cad7..96ef81c26cd 100644
--- a/target/sparc/int64_helper.c
+++ b/target/sparc/int64_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "exec/cpu-common.h"
 #include "exec/helper-proto.h"
 #include "exec/log.h"
 #include "trace.h"
-- 
2.51.0


