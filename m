Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC91C4345F
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 19:51:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s0RUs-0006Na-DY; Fri, 26 Apr 2024 15:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUd-0004Ub-CW
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:44:23 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUZ-0003ew-55
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:44:21 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e6a1edecfso3986126a12.1
 for <qemu-riscv@nongnu.org>; Fri, 26 Apr 2024 12:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160657; x=1714765457; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kun4qJkDCY8XFQaHg2bl7DDiQ3ue/fUb7wf0Dab2h8M=;
 b=zjNy8o5ctbqYsWy55pbL8x4GCRe082H68yonSDQeUt19r1D12E25YYbkO9IjbjH0hw
 MNhwCsvcOWw2Si4uRZG0f+CaTqItsxtjMAfdQqATIxbNnPM/yUx2oF3FdLGa9ast+EnZ
 U3Dmxd22owEq9T87OBZBC5wBdzLAdhXnFHD5CUxx5p5cuKAPt65wzojK+AlQLz80vh1E
 /wTRu9W0gqb+AvriFSQ5qhqVtL/tYzyML826YSYMfJY9rzHdk3sX3HTg/ZX7Ru2HllOy
 O0FsMaUixweP9bwWy4GPxA9b0EbogGtBuNbTYc0MjGlwgYYGW3q7STdp835h4t80pQ+W
 Al8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160657; x=1714765457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kun4qJkDCY8XFQaHg2bl7DDiQ3ue/fUb7wf0Dab2h8M=;
 b=ZJrg82TphUhYBD7PdP+rCcqxRnuEPKQhiZghZ3K6UnBwvwBtEh1EbUcXlkN3SdOkcK
 58qt5FWIubuP+bI6lQgzxKuO3EHehUyXvKEjHlFw3DSyHwHuBcBmzRhe2v4AtPcB2gqt
 T1gz1bJkHk2pKpG8SZxFUoATMMBqVSXoHYnF92UHHdVs4zuGTzuiwFUCX+M6PdGgTvWy
 PLexC66rafkh8hqv5lS+abaCjHZKzkrVbmMA5u+fysPWbyxLPtu5J9Xk5vEyHc/q3tKE
 nY9pSyhp2cp/sJDk4e8xv66cPGW6bwxbeyCfI1kh6W7HYTnj70oLVv2ccm2GQOBvIRR0
 rvEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDPhEuncLHVYufjzHgr/pgMLpzF4T8f+h7SEC/EIo/UMesmlET0yRJ1cT8j93lGzVaXS7EMdOawaa7tb8kAEqATzYhSmU=
X-Gm-Message-State: AOJu0YwZiDYwBi+FaiHzWANE2Tb4lRQr+JFKS/OkSY7CwV3ezIIJsMF5
 dUuaDcthGQkDSgKc2NHM4BvTurwTyvg47q6+ZC5RqvaIBGRepUHCPfd8tNjnz1w=
X-Google-Smtp-Source: AGHT+IHqngFWwDgb0rYQ3GqLy9Zix06CYoYLyA9WqDf2g9v+ZszRfz88pRroPMSezzIpI1ZSWWMxtQ==
X-Received: by 2002:a50:c34f:0:b0:56e:42e0:e53c with SMTP id
 q15-20020a50c34f000000b0056e42e0e53cmr395812edb.34.1714160657683; 
 Fri, 26 Apr 2024 12:44:17 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 cn18-20020a0564020cb200b00571bfc97b79sm10018803edb.55.2024.04.26.12.44.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:44:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 23/38] exec/cpu-all: Reduce 'qemu/rcu.h' header inclusion
Date: Fri, 26 Apr 2024 21:41:43 +0200
Message-ID: <20240426194200.43723-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
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

"exec/cpu-all.h" doesn't need definitions from "qemu/rcu.h",
however "exec/ram_addr.h" does.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231211212003.21686-17-philmd@linaro.org>
---
 include/exec/cpu-all.h  | 1 -
 include/exec/ram_addr.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index b86209fc49..586dc56d9e 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -24,7 +24,6 @@
 #include "exec/tswap.h"
 #include "qemu/thread.h"
 #include "hw/core/cpu.h"
-#include "qemu/rcu.h"
 
 /* some important defines:
  *
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 07c8f86375..891c44cf2d 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -26,6 +26,7 @@
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 #include "exec/exec-all.h"
+#include "qemu/rcu.h"
 
 extern uint64_t total_dirty_pages;
 
-- 
2.41.0


