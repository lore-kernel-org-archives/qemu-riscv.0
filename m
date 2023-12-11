Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60828C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:23:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCniT-000207-6w; Mon, 11 Dec 2023 16:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCniR-0001xZ-M3
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:21:28 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCniP-0005XE-TD
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:21:27 -0500
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ca0d14976aso66330901fa.2
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329684; x=1702934484; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9l5OJKRIKjrnTI1L+t9VvIOzVTPo5liJg25JIXeLpU=;
 b=U1LPWX306t02JKH6Xnf3/LVbJcwuAO0IbplOOAIyYr66zzMLl5l3+xQxDWa4ETf+gn
 GW4LRMLejdEcgafSEoSVIOSnXc40UXa+die0S0xhLZR8UnGc+KU/u0sj1o+c8T89R+0e
 //rY3L04Pv23lYzOa5VYLGyZEdQUmmyYgzlq21NG4zMViISo9ydCvgN2k7bsFtA6eF0Y
 L8CBp/XhSqADjRUK9fcQbLcc/Cctw15oUYqG0feTogSe3i+NyCUpDxTBzgCaacX7ytq2
 +NynHCpY9EkGYcfMADbNc5tHNxI3df5IOR82njEKvHUAG6umQnpKvCAIc34v0X7kZ+Wn
 2NfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329684; x=1702934484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r9l5OJKRIKjrnTI1L+t9VvIOzVTPo5liJg25JIXeLpU=;
 b=RNUJWCFS0nmRSkCn9Dq+PfUZMzRCCNUgwMB1YHJAtchqMpV1kSCS46ZVTqeKZBQNiF
 Gp2JfezAi+yb29wmf8t2LyOpj36daVzEUeK1jb1cRilnNnRNUXV0EK+Dx6PG+bnH9A8P
 /98DnvEG3HcRFdYeiabVreVzvx+qE3bgDo/jfXX0CpAWkAB3kovtPzSe0wAI6GxyifbV
 2d8Qng4BUmOSBp5kOz61TAZbkC62I1ZzcmJrV5FqqzPgJ3oFqaotM1bOMjJ4fkERKidv
 DETkg/PiWxBGiGw/p3c75TyEG3fi4C1gFpYxhW1VIPUU4e8bfEt4SKp5YPFFdlgwiJuf
 nZXg==
X-Gm-Message-State: AOJu0YyKu6hnKnadB2DmbbtuRYFvdZ3QogKBBLP38AlEgWAo6Rnjrn1i
 xG3Dcv+GKpM83ic9kHqxiqHOIg==
X-Google-Smtp-Source: AGHT+IHERZGHbq34ZdZqIRVkgylt5B/nONQUh8B3Nu0uF7C2GwlPlZ/FOolWwrE0SRduVyan7TqYgg==
X-Received: by 2002:a2e:8008:0:b0:2c9:fddd:df50 with SMTP id
 j8-20020a2e8008000000b002c9fddddf50mr1843504ljg.81.1702329684224; 
 Mon, 11 Dec 2023 13:21:24 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 co7-20020a0564020c0700b0054caf3f8b2esm4037367edb.96.2023.12.11.13.21.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:21:23 -0800 (PST)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH 09/24] hw/ppc/spapr_hcall: Remove unused 'exec/exec-all.h'
 included header
Date: Mon, 11 Dec 2023 22:19:46 +0100
Message-ID: <20231211212003.21686-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr_hcall.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 522a2396c7..fcefd1d1c7 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -8,7 +8,6 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
-#include "exec/exec-all.h"
 #include "exec/tb-flush.h"
 #include "helper_regs.h"
 #include "hw/ppc/ppc.h"
-- 
2.41.0


