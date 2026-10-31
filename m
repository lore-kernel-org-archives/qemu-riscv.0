Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77219606A31A
	for <qemu-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V1iZJU4j
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNCaU-0003pk-OG; Sat, 31 Oct 2026 13:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNCaT-0003pE-4p
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 13:09:49 -0400
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNCaR-0001VR-KC
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 13:09:48 -0400
Received: by mail-dl1-x1232.google.com with SMTP id
 a92af1059eb24-14394530ec6so2244284c88.1
 for <qemu-riscv@nongnu.org>; Sat, 31 Oct 2026 10:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793466586; x=1794071386; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SCvaE1xWeWnx7UnU/1gnWw/QKe7acN1+xJB52VmOclA=;
 b=V1iZJU4jjNZdqvQIdP19g0LWBrnhsZnQYPh0zpFcot3gH9nKvjnEPIFlbpzFc5N+Ju
 Y7Z9q6gD703fhNxLefJ+gvVHhaBQKDttTex0NUr/kb4ZCvRsMUq0cgn2rsiCNp78rRlr
 mO6kyAIo2jdqJtZE2HH2UwjS094rudsY5f6QHAwXUIkrXSQt+Xy/MPytsN+Em/bxpqyM
 IzXvEldMqrAEljCdeR5r4s72yE8urpAcQPbE/9ZNylXbyXSzAmCdLJJQdfLMrwe9IjG3
 w8mVxhVXKbdYsbbNoLlSRBNKfH8mKoKyruc2BLmD9My5gH97KQWtiunS93aEu99HgRky
 YznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793466586; x=1794071386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SCvaE1xWeWnx7UnU/1gnWw/QKe7acN1+xJB52VmOclA=;
 b=HuFgcvCAu8liqUSrAZBDaCKgiiZ1+xBLpB7P7+NTaLzOfmDwdEhHq73mVT1PXYTc6M
 Ipu4Y2Pe5SzEHLcGMkgYeySwSXeI3FLaYP3wXdEQQg2ZPk+OPj/gYGoKgIFK9sIPvXjp
 xODBOYzE13khNTgDN9V0aB7Yt3wlGXJDZYuvJSZrmI6VfSbbBdtN2S7+79Qa6WM7Gv4T
 qTr1hVyMrwuNiyHhXhgM1QUC7btRDKIZPVzsEG9s1VRcISd62tfJK1xuTQwAqTljk6/f
 P6Cuh/miUGVu0PXk+hY6i7EeoyF3UbTwhNqSIGgtnfmWTVRtw/GfJ8f810JdjGaLXa0+
 sXbA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwyc8quRmjNJwHU9TYoTVBonVLLmuuwlIEWeiB6DeUNh0dS12PJC/9md66RDqb/I4N0kJHCWg/Ay/vU@nongnu.org
X-Gm-Message-State: AFq9FYJbQM7Yn0ID8IGPAvdIic0KJokphiqoxjwCULalJOKTcCx/zZh5
 j23U8rVmUpg7P1AaTrxJu3W47BUnE3QXnH9ZxaOSFTJHvUkJTnYhwhEW
X-Gm-Gg: AYBFou3s7AwJdsY5WJXSQYDCqNrf7O+ZBqHnfC3vZAe0W6m1YG3wJ60H9S0DWP9e1Xd
 y25SfI/2UCzkp+RIfALbEk43hSKz/6DhgfJzVQ4GRllMXxkXbMAhw7HIXMMRIcORFymPT1ARGDR
 hx82LD5RnF+gNu1mfMvcwReS9pdiTGEpB6eM2u/1OlrHAuIl645GThXEo0whLCM8XynTFU+EFaf
 yahaHQFSnp1crViRGVZSxa7o+cJN3gkouATefol17p046hzTUvKvwEf0m8fVpsUA5rxvrGz+Gsr
 hZRS+LAkJq+jbucH2o6bE7P1Wm0y6NlimRPTwPdPNJDss2IgZgD2tE1uVPzjebiJw6jNhmMdGHg
 Fqz4NCi5o8pTmCqEWq8TyeIKMUAw3XZ1czaHppt7NhuEL1VEbiAY1GpFHRrbOuw/fDMkAJZ/M8E
 daL9sBNgqoHyp7saXeyKoacEwXOZ63QQIl3Mp0E5G1/2NNNlnRbgEjjdIv2TO1tyncqG5+7NJZh
 jXnu0/nZ57qY2oKUyVEjzSDj2AqNqK+bmptxvWEWHqHU7Z/Lr8/O1aFVLgLYbcYRUzgDmxKT+87
 T7SYpRpxp6j+Op81UxALuMdLCsZQxeN2JJd0s75le3/5K+0R
X-Received: by 2002:a05:701b:4206:20b0:1a4:9eaa:d01d with SMTP id
 a92af1059eb24-1ac5fd08905mr7930123c88.45.1793466585766; 
 Sat, 31 Oct 2026 10:09:45 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854da78sm23749065c88.6.2026.10.31.10.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:09:44 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>
Subject: [PATCH v3 2/3] Revert "target/riscv/kvm: restrict kvm-accel-riscv-cpu
 to riscv targets"
Date: Sun,  1 Nov 2026 01:09:24 +0800
Message-ID: <20261031170925.789-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261031170925.789-1-luoyonggang@gmail.com>
References: <20261031170925.789-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1232;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1232.google.com
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


