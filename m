Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C483C02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:21:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thc7z-0004Fh-Au; Mon, 10 Feb 2025 17:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7l-0003Ij-0e
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:19:31 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7h-000335-SN
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:19:28 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38ddfee3ba9so1177940f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 14:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225963; x=1739830763; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kwYzznxoCnH8hzDS7762Hk4iYRDmRQJu5feM84dGztY=;
 b=snZsNAcF52IPppgHB5LkQ3Jykm045ZaQGESjozq/yfIO2jpRyXvNaEu28YUMlht7WZ
 0dHd72mQnom99Rw5imLgwbwN85FqDMRYFnhUu9VMQsaBlWwgOMwyr0EbO0nGny/+3gU7
 843IMn1MwyhoyrzEJEBRFBVMWL5Yb4H3sNfjMtDx2FrRZyw7ZzdRCHwnm5kuxlBfTzmm
 10z5x9Mil+Qse6NAm8THJN8AKQN22cAPReSpUJQW2eVFL76ujxL53GR1Db4toB3qcFkx
 u6oFBiK9Xp2O91tbyPFqlwUPUtq3bRDau5VEv5KRjAYDOVpAJVWHzNMtSiOLLTgsROJ/
 FbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225963; x=1739830763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kwYzznxoCnH8hzDS7762Hk4iYRDmRQJu5feM84dGztY=;
 b=bCDgz6NK1oVeYOO9ysbqiNamnMBzBaCRY4ZCvEczwZSoho6P6M9bRmPc4FordC7Nln
 O44HCxprB9bK7n8vZ8N98ylU/D+ixtw/GLyV/kjl++br4abFhaw3m4ngVDSNax6HjLTU
 Q5trWulZl1GDjnx/tGc44IIm9CT2W1UzUhJemkrRkaVgNMwsbvdvad8yx/jPUAc6e2n1
 M6UeBduiFYTdHCNLTdqpaN9ZjYGh0ELpULqPc9z1ur4Z2svmlmeNMN7Pc7rTSU4Frvl8
 bxQ78D7PKjhvanikf8Z5GvcoobUIqgaThskKveCC8obytKzOIs81XiWj+rxJYvl/tNON
 0VTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdGwhTHrSNfb8bcZUrcWalFhNJUIOGMiZXLdgRh7K1digT+FrY8U83O7+FRK/Q6gS7kpkoC/afGVEk@nongnu.org
X-Gm-Message-State: AOJu0Yz61sTgxHDUwwX3ubmOFThshquW/uY4H44UK00SxCxE0dE2DXSo
 D1AeJUwNPU0oQlFfAfNtpWK1QMaP3xB5I0hx+NsvtHcvb58tF5Gg/gJYPTBIjdc=
X-Gm-Gg: ASbGnct/Su16jaYAbelBZQpZ9i8EO9qZbcLt6uGSGNKUOjc+AkxhIMjDWQFH4yZndgr
 mR/5xoMXLMARjSWEIr2uINGl/gGq0wXhLVxm+1Kfju0JX7DE/thJNSECttE0VsiaEYrWKmN0JGY
 1FwCjLB+Nflug8BcmZMph1g+Q2TyN2qvYYpFG4Jri3cBW537jWhzkpYrewyG4WAEkNsm5UdUp5X
 fg05Wv6w7cO5Dy4Qs7pbOSMiGrFyV+RbSdHGXU69TaksusiVri0bnUy4V/IQfXrxysvT0exGwv7
 qFo4xLN6sUnj9s3sg9CBZ5vsLSwqXnenY54LOCeNx3qgJgL9wPQpSkVOwLbProZ8Ag==
X-Google-Smtp-Source: AGHT+IF2woyAeqb32DWs0puFt3odYfKhFG4a6PhMqbV6FCSol5ZIFLkfilc6VEh2VNVsH5467RaXqQ==
X-Received: by 2002:a5d:64ae:0:b0:38d:d371:e04d with SMTP id
 ffacd0b85a97d-38dd371e50emr8193475f8f.34.1739225963003; 
 Mon, 10 Feb 2025 14:19:23 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd5e3cddasm7271481f8f.22.2025.02.10.14.19.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 14:19:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 10/10] disas: Remove target_words_bigendian() call in
 initialize_debug_target()
Date: Mon, 10 Feb 2025 23:18:30 +0100
Message-ID: <20250210221830.69129-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210221830.69129-1-philmd@linaro.org>
References: <20250210221830.69129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

All CPUClass implementating disas_set_info() must set the
disassemble_info::endian value.

Ensure that by setting %endian to BFD_ENDIAN_UNKNOWN before
calling the CPUClass::disas_set_info() handler, then asserting
%endian is not BFD_ENDIAN_UNKNOWN after the call.

This allows removing the target_words_bigendian() call in disas/.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 disas/disas-common.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/disas/disas-common.c b/disas/disas-common.c
index 57505823cb7..21c2f03430b 100644
--- a/disas/disas-common.c
+++ b/disas/disas-common.c
@@ -7,7 +7,6 @@
 #include "disas/disas.h"
 #include "disas/capstone.h"
 #include "hw/core/cpu.h"
-#include "exec/tswap.h"
 #include "disas-internal.h"
 
 
@@ -61,14 +60,11 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
 
     s->cpu = cpu;
     s->info.print_address_func = print_address;
-    if (target_words_bigendian()) {
-        s->info.endian = BFD_ENDIAN_BIG;
-    } else {
-        s->info.endian =  BFD_ENDIAN_LITTLE;
-    }
+    s->info.endian = BFD_ENDIAN_UNKNOWN;
 
     if (cpu->cc->disas_set_info) {
         cpu->cc->disas_set_info(cpu, &s->info);
+        g_assert(s->info.endian != BFD_ENDIAN_UNKNOWN);
     }
 }
 
-- 
2.47.1


