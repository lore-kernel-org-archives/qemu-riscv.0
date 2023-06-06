Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB29C77B73
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:14:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6XRB-000475-TR; Tue, 06 Jun 2023 10:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XRB-00045x-8h
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:13:29 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XR9-0005cL-2l
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:13:29 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f6d3f83d0cso62711465e9.2
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686060805; x=1688652805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vM4MJj/z0alc8hubdwq0cm43Ebd3YBftyjtiu8qEFRQ=;
 b=oeqtuk+y44lQZZaihF7z7kKap+ioNkZFFKeoXer0NT0osQJHcb9C5FTWyVRhkyIpzi
 i5MhC/c4/iDLBeqK3JTkGJg7nLIKvCahJx0ty99ETQOP6PW54E3o3/8+iiZf3MANu3vJ
 NgCQ1sIMfYbPGk7rAfA3HBJkTBqlBJ03DlXyRVPyX3O5nApuZSCtdopbIGn7KeYF6AuR
 h2/xsm4Krh4rwMHVCr/8rnC2ltwyBBci0Sl5wwYNkPnhpaZXnL75Z193zHFOPasB6yq2
 4w4bccbTWyCFBsVs/Lu083lcOFdo/uKdhywo8c+43fq3NyT2fH25/Ndo4f5lyn66hHy1
 p6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060805; x=1688652805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vM4MJj/z0alc8hubdwq0cm43Ebd3YBftyjtiu8qEFRQ=;
 b=gfAaeT5M2SwUUfa8jJVdrQov0RT6gEBhIvXKVvGO9595qHjqaoWmVZm37274if7qpy
 ovjh3k8tKfZkOKWlBhDjlmwarq+PB4RLIUSIvBWP0tUGBnl+fR9lxUXVLqPhdqRZQM1j
 jXqDvoIwg32fde4BJw70yA8zlLp10KmSTU7C9nHP9Fr5k0gvSimDnNIlcuDCBBnvRKk/
 OQJS3m73GRT733EbRpbvigF7/cjnrHCUjYUU44c+aJWIJdkyLWzfXPgszcckpbA8AkkM
 ae+1ixxXIS++G+f8pLU30HCoSeLgZAn9KrQzfboy5NCsgwVAxizhCGUjkLaeHgvkJf3F
 9zwg==
X-Gm-Message-State: AC+VfDwvlmNhClw1aZXhDQC2+nvvf8vEpWICyhy4rOUWl18FqWSc+FN1
 qT96cDvGw9kwfdW+EmN8PpBOqA==
X-Google-Smtp-Source: ACHHUZ78y++AtMtrSaXumSdfU3h5fIob83va8+q2yza7sdaAZCNItugm3mZ8M0t+m0a42X3bgLG2Nw==
X-Received: by 2002:a05:600c:202:b0:3f6:1474:905 with SMTP id
 2-20020a05600c020200b003f614740905mr2701053wmi.29.1686060805454; 
 Tue, 06 Jun 2023 07:13:25 -0700 (PDT)
Received: from localhost.localdomain
 (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr. [176.184.50.104])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a1ced11000000b003f4266965fbsm17802853wmh.5.2023.06.06.07.13.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Jun 2023 07:13:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/5] tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc
Date: Tue,  6 Jun 2023 16:12:52 +0200
Message-Id: <20230606141252.95032-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230606141252.95032-1-philmd@linaro.org>
References: <20230606141252.95032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented as the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename 'bti-crt.inc.c' as 'bti-crt.c.inc'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/tcg/aarch64/bti-1.c                          | 2 +-
 tests/tcg/aarch64/bti-3.c                          | 2 +-
 tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} (100%)

diff --git a/tests/tcg/aarch64/bti-1.c b/tests/tcg/aarch64/bti-1.c
index 61924f0d7a..99a879af23 100644
--- a/tests/tcg/aarch64/bti-1.c
+++ b/tests/tcg/aarch64/bti-1.c
@@ -2,7 +2,7 @@
  * Branch target identification, basic notskip cases.
  */
 
-#include "bti-crt.inc.c"
+#include "bti-crt.c.inc"
 
 static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 {
diff --git a/tests/tcg/aarch64/bti-3.c b/tests/tcg/aarch64/bti-3.c
index a852856d9a..8c534c09d7 100644
--- a/tests/tcg/aarch64/bti-3.c
+++ b/tests/tcg/aarch64/bti-3.c
@@ -2,7 +2,7 @@
  * BTI vs PACIASP
  */
 
-#include "bti-crt.inc.c"
+#include "bti-crt.c.inc"
 
 static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 {
diff --git a/tests/tcg/aarch64/bti-crt.inc.c b/tests/tcg/aarch64/bti-crt.c.inc
similarity index 100%
rename from tests/tcg/aarch64/bti-crt.inc.c
rename to tests/tcg/aarch64/bti-crt.c.inc
-- 
2.38.1


