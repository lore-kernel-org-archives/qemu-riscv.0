Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B81606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vu7nAhA7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLxC1-0001Jt-Lt; Wed, 28 Oct 2026 02:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLxBv-0001GU-Rw
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 02:31:23 -0400
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLxBt-0004qZ-Vo
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 02:31:19 -0400
Received: by mail-dl1-x122f.google.com with SMTP id
 a92af1059eb24-15ea896ddc8so905564c88.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 23:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793169067; x=1793773867; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SCvaE1xWeWnx7UnU/1gnWw/QKe7acN1+xJB52VmOclA=;
 b=vu7nAhA77F2Mg+olzyJbUH5wOvNCJLdgz9BjEyliaHKbuip4C7XEcFwj9Yrf/8Ja3S
 Pl+rGNi4rCNQ8uWtU0GMhjAvURrNi6r8bMEf98Yci5KtfKBjY6F3fmrCzC2XMX5n0Esn
 d2+Vckt5WOeOYWFTmaygn77KSzI/jOPGXpRoI4VUZHBdEz6tql1tYx1h73cDo/vnX5tZ
 5T8vfDhpImoLIQrVA8Kbfh/yKYtx/XbMlwY+oQ+q4MiFUJ3vzCmX82lqcQRIZtGRl3wc
 NjnV4trdcSGin2EHp39mOGdu4DvmSAN9aQhUEkD30/RXqwDJMBuELp45Dxmj2wNImYg8
 RIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793169067; x=1793773867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SCvaE1xWeWnx7UnU/1gnWw/QKe7acN1+xJB52VmOclA=;
 b=RPwUqg7WTXK07AbkPgKIBjLxF8AG8V1PDnkj6NMk1mYQ9ZNqflzgXF5sY816SwtyuC
 FU4avChBv0asCRt/XzdHWhAyUuvTA8kxv1jdETkiO668fGjW9JAfoOR0UsyTJ7rHqXEX
 4Fjy1PJ+53DHLs1Nt8THn6zcTHVTjGBkOfP8PljExrrsBefoPmZyuGo/mDvda52MR2Ri
 KeWter0DhX6s17uPL8ax7sIwKimGQQAbJfrQ0+TyDiroC5AP430VMsDpQeHZcib1IJCA
 /yOXBIDe+kZrzIQ5maAFF5fFaqJDKhOsXaHxxTyM3MYuv7s9ccAZLZpRZEcDdcMQ4AZQ
 ZIhQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwOYzX0kqYRtl6IqnmtSWahCUnPKPvSuRTJ9jENASeXKBO2cxTgrCtArWPkdOpe7RNJhf9rqEyBX0Fn@nongnu.org
X-Gm-Message-State: AFq9FYKMcRSrADvLlt76FyifkN65UzUc331nM1vSuRpW5OaQMFQM5A80
 dREIeIG1NaZGOUpD5GHQ+M+9UyXJtfL/3EwBctWdS/4wiE0f+r+xYKxx
X-Gm-Gg: AYBFou0pL5a7247xc5DqDDSp9cvn8A66BSVZbIOUwAG81F9xdxpzRh80IMvBSNHNBT0
 Ky5CZo3huBbX3Xm4Tespl5lkncVLXoXdBcFaWJqNTLqa7X7CheTJc2eH0Ihn0oF9O4d/rXW0x1O
 4juthb1pa1qPUiFTaIRjz8uUcmRP//NGHHeCVL6ppp2lV1NJo9DTizDj9w1hImvOTOkg5/T0Rpv
 vbLaEwDgqdLLX731KJHWJgZYOFNxLEj/0oA0ueSbh13LjT9Jk1DEGlG6RZGNZcJxjFMl6fx08H2
 UzCre5+/UomiTp7jA9Q4tzqi+CqtdQqWfHCPa7saEHXhf6jD/XpgspOgS0z+A4Ei/ijuz0WeeA4
 xx4uvnl1X7YxIcXPiwGjvUMLMIjZaKL7TJWfbjQfV36yIG2SgfNbQRFDr92yhaQtl8zcXQ3IMLH
 WWnbjgb6NcdxsPn+RbE4U3w8nT+kIurf2/pJMjcu0cMqhAjrAhJSoCN+cUgQXYlDLnOLVh7gnig
 mzu4nMFhegRTGN7+qnDIMgG7zXbdXJG/tcOIj3OOM6Ef8IXllAw0+K+criDEKA1i2MTxlrZwol0
 4g+4azcv1RLirHDlFUCb5UM1ZfNg6lDUuqbu4rH/hcOvPvr8
X-Received: by 2002:a05:7022:298:b0:19a:20d3:a3d6 with SMTP id
 a92af1059eb24-1a6c85d1368mr1804797c88.1.1793169066871; 
 Tue, 27 Oct 2026 23:31:06 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1a75e5c6d4fsm4512584c88.14.2026.10.27.23.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 23:31:06 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Weiwei Li <liwei1518@gmail.com>
Subject: [PATCH v2 2/3] Revert "target/riscv/kvm: restrict kvm-accel-riscv-cpu
 to riscv targets"
Date: Wed, 28 Oct 2026 14:30:47 +0800
Message-ID: <20261028063049.2530-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261028063049.2530-1-luoyonggang@gmail.com>
References: <20261028063049.2530-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is redundant now as all accel-$cpu_type parent is already registered.

This reverts commit 2d3e6b4003d5380c245ce8ffac4b8866f6d10a33.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/kvm/kvm-cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 5a82a63b822..c085b22b23e 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -26,7 +26,6 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
-#include "qemu/target-info.h"
 #include "qapi/visitor.h"
 #include "system/system.h"
 #include "system/kvm.h"
@@ -2236,7 +2235,6 @@ static const TypeInfo kvm_cpu_accel_type_info = {
 
     .parent = TYPE_ACCEL_CPU,
     .class_init = kvm_cpu_accel_class_init,
-    .is_available = target_base_riscv,
     .abstract = true,
 };
 static void kvm_cpu_accel_register_types(void)
-- 
2.55.0.windows.3


