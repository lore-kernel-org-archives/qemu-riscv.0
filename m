Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0BF606A31B
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 02:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vl9cUB4E
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xP9sW-0006RM-48; Thu, 05 Nov 2026 21:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP9sH-0006BD-VN
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 21:40:21 -0500
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP9sB-0005yQ-TU
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 21:40:14 -0500
Received: by mail-dl1-x1235.google.com with SMTP id
 a92af1059eb24-15ea896ddc8so459565c88.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 18:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793932800; x=1794537600; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gq/d0KwPPYo52ABxaaA//hWxeVPvL++rdqpTw0UqREs=;
 b=Vl9cUB4EpG8B1J1qjuaoyH0tIV2jkuFle2SFmEWy5Zv17uWdGdow/Z/G3SY7nJlw8G
 Rce7DJcawTiP4sT/aU3Px5ZtsLO6M6ez6v7Yo0zzmUUARAvHCItGZYi9LyYBBJ/lGyOs
 CIu2a1n9vV3/B3bdzG9dcKODLIJOIzGWaaB4tDqpZKAzpGibRUbWwoKVO5JAanw7KPoL
 2UJDc7XZKel6Oe275LpakJQOejgxsSoaqmzgdhdCxqsokUUd/rqWiRhEfeab9KN+LIO1
 SPPXQYwOBloFzGT/CmCPpKvTodxb6etBJnmkbWMGPR3IXbvHyFSmr8wG22QQV9TX5xws
 tcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793932800; x=1794537600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gq/d0KwPPYo52ABxaaA//hWxeVPvL++rdqpTw0UqREs=;
 b=weLWzxiPZEGrQv7LJU34Zfsv4h4fEKreO9drvpXpbTwLvMUZ2UDvfRhpC/7IIjudZR
 OFWBXS/8OyUOH5Xq0A9P10Pf/9hy4aN4bFV1JwUXyjTS66dquYvlF+pAdyDNdRcNmirb
 JxAnbPI/QrN6lGcw8AfWbwwCvmEYPj06jweZgpbRwjZCdCQNr9UQDeuBrWmo2FjOIq58
 tR3V5WtFJOiJGpifiMynEFFc9fVko8f3iA2WuixyQcDQdkqf0ZQAL9zgQhtETpTMTFBB
 AhJFHeGvaAXBpL+pggAPeK1umg9zwU5H5C2B2URYXxBHyEEW+uvjg35ZbY0lSbLwMjg4
 ZmCQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByAr3pVS7OLkONJMVVmf1Mhfh1mR47l+04/XuzYjHxBO+zIArLWczy5Gagh3h3XSDr5CjPRvBnlHOxY@nongnu.org
X-Gm-Message-State: APuU4Z+1nuoBW3oHpufu6DNyvHi+fGBcgkGPJOxuYDWhaRzy0/49D73+
 WBC70053lKXv6STSAyoUlavT2hrbMYTfQD2Egmo2tQ6FB+RncBwQxyyC
X-Gm-Gg: AYBFou0Vgqjiq4QDfoU+F0rgSddifdHc/eyrCNMm7PnHfDm9wYjnw1dmUedB4U2fuq0
 FyrsC0cZ4ZI+eZtfVIUUFT9pH1NupejmD8XKP3x0STHaGxdGM5u4iKln4gs5avwzAq9pPQI2wEd
 Gy2HcyaIzMcM5H/xBLJSqjmmobXF9b01EoIfJfISDD/jz0mAatnwVDA52K2nB2YntK5kqivfFgS
 JBlRSw83awMSf1ng29vVhxkggRSP2tY7Vha+kH3TJ5pO3m4YF6T94kvNyHTLBUK8WNCQ0nUT8LO
 sPtovQTx7GTbVCSKNblHZy4Cm1tX/S87eI5nRZ0dW79AwS7qkaYHMy73oUnele3t+/+ZxTF7GJw
 a1JqyEgOnZ8D1ETpowT7tDgOg39yPCl4WD5fzlh9+Gc1zblVxNLH0ovmDDyVql5LpANOmM/QZrc
 Ub/+Sc1FDHlP/Ij+LtSgb5atBZuAmN4jCLiDBsrzqL/NPX/OvLWBaw3POZwhIzOjhzhf/eC+2Rq
 TbMtBVpD9jXrHkOmhoyO8E+xKag5QYE75ERTvnV0//JYV4ucgdZ1UvY/s2OjXQMGPvX2k/A1wia
 4Uj7VpolmiiHdi7R0dSCyvFjIh/Eu5cZoU0J4aD8qeaDXEb1
X-Received: by 2002:a05:7022:3c08:b0:14a:8cff:fbb8 with SMTP id
 a92af1059eb24-1b25d31d662mr902654c88.28.1793932799300; 
 Thu, 05 Nov 2026 18:39:59 -0800 (PST)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1b25e4efa6fsm1108318c88.20.2026.11.05.18.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 18:39:58 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v5 2/3] Revert "target/riscv/kvm: restrict kvm-accel-riscv-cpu
 to riscv targets"
Date: Fri,  6 Nov 2026 10:39:34 +0800
Message-ID: <20261106023936.772-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261106023936.772-1-luoyonggang@gmail.com>
References: <20261106023936.772-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1235;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/kvm/kvm-cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 5beb602338..aa28098e10 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -27,7 +27,6 @@
 #include "qapi/qapi-builtin-type-infos.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
-#include "qemu/target-info.h"
 #include "qapi/visitor.h"
 #include "system/system.h"
 #include "system/kvm.h"
@@ -2241,7 +2240,6 @@ static const TypeInfo kvm_cpu_accel_type_info = {
 
     .parent = TYPE_ACCEL_CPU,
     .class_init = kvm_cpu_accel_class_init,
-    .is_available = target_base_riscv,
     .abstract = true,
 };
 static void kvm_cpu_accel_register_types(void)
-- 
2.55.0.windows.3


