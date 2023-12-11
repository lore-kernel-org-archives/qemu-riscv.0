Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFFDC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:28:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnjO-0004DE-Ep; Mon, 11 Dec 2023 16:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnjN-0004Bb-1y
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:22:25 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnjK-0005jf-Ir
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:22:24 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54f4f7e88feso4741071a12.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329741; x=1702934541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31p8j5Jt1hoDV9F+fYTdM7YWxOI6Tic5VBGPVB9TKlo=;
 b=WH1TVbEr7xsnjmJiqykhQC49Z7oj7479RqnoctPft4KZ5ieIJSJVDptDD4Oy9Nub+Y
 l8D6KMjEEBnK7LMqwsefrSPfltObQWVqJ5Jdzy7704J89XP3iIW2CI4c8kuzsur8XJB8
 OsBIXzJeqPfWtfOYQsXjQWg0h2v4uKz42cuMMEHVIre6F2PP3x1jIG6lsgACj+ByR1rH
 f94SyGgI6Ff61zg5c3/D0CzMyw1v5FoU4nAuL9gYtYACkTYxD0gvOUKsdikjT1U2ogWJ
 /n2LNrECUTMlyMPQZOUi5mLfiu+aHIO0hNwNQHc2PpfKpFwnlu23sC9pgKZgho/O7ik8
 sX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329741; x=1702934541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=31p8j5Jt1hoDV9F+fYTdM7YWxOI6Tic5VBGPVB9TKlo=;
 b=HN+0j/CgO01ddt4b7ihq250nLwVMEnhx343wyC4Jw+lsWDhhJ4qo/+2IY0rkpkyebM
 Ua2fZ2WYYDNrIbabahxQeTA33TWKfn16CtF7N8BWq5LD68GeSJ6gxS6tmw7hiwICDmej
 bNcDJjS6QSKhyLxx9rJZk2ebg+B5MYcrKrj47LWxMh37AKwEBmnUFM8gqYqenIcmbs7G
 jkR6N8KOMzTIRFKV+RzuR/6r/z0bT6e5KToCy+H6wCEmo86gKK5SEcdklrZpsGrIB6yv
 DursvSiGhGjdfqoMKh0fjxz8Ll6oVScR1OKN3ZFiUCheVYgnVt01QmvKLtkPniH+86dZ
 IfXQ==
X-Gm-Message-State: AOJu0YxRAnyR+Uc7+ipCc8nb3JQKTnmfS0umIikuzzAfEjJ9DxnZnPEK
 QoETmiAtpEPKP4Ba7FFOoXWAXw==
X-Google-Smtp-Source: AGHT+IEmyjseetZ6MABzDolM2F1vBB3vF3EY9+Y9NrS2c3NXJni7DdLVf2NG0DPdko7jlFhqGhfwLQ==
X-Received: by 2002:aa7:c513:0:b0:54c:a689:2d8c with SMTP id
 o19-20020aa7c513000000b0054ca6892d8cmr3367204edq.69.1702329741047; 
 Mon, 11 Dec 2023 13:22:21 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a056402230c00b0054c7aee67acsm4014017eda.97.2023.12.11.13.22.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:22:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Claudio Fontana <cfontana@suse.de>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/24] exec/cpu-all: Reduce 'qemu/rcu.h' header inclusion
Date: Mon, 11 Dec 2023 22:19:53 +0100
Message-ID: <20231211212003.21686-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
---
 include/exec/cpu-all.h  | 1 -
 include/exec/ram_addr.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index b1e293a08f..2d568ae4f0 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -22,7 +22,6 @@
 #include "exec/cpu-common.h"
 #include "exec/memory.h"
 #include "exec/tswap.h"
-#include "qemu/rcu.h"
 
 /* some important defines:
  *
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 90676093f5..aab7d6c57c 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -25,6 +25,7 @@
 #include "sysemu/tcg.h"
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
+#include "qemu/rcu.h"
 
 extern uint64_t total_dirty_pages;
 
-- 
2.41.0


