Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1689C02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:24:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFAX-0000MU-Tb; Tue, 21 Jan 2025 09:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAW-0000LG-Ov
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:23:52 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAU-0002xV-5j
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:23:52 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43618283d48so40996295e9.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469428; x=1738074228; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UG0trGBZa/zHcAjVBtljvnuPb8rCcRdqGnikIpWwT/E=;
 b=tPpVNRT9Sz25zVayH8cmdU+l4I6O2mNyYgnqUIL6SuscPBIsJijtPDMEaSwv2GgHML
 0Cyo00LkAt+/ZbtvMgsxV4dELVvWDLVHqHJ6fJ14mKyyrCQcwRCqczIu88ZttWYysXFp
 uioiJLxxWU0539vz71Il3kolY6SCHZ5sGGf3e014BC7bBPUrwezcCA4UBJPMK/SFm0M2
 mQeHwhxURc31g9fwd76Sv429j49LABl1T+ux2yThdDVsCqJDvATemD4Uvq8W1vLDWYjk
 ub2Y2c5axkSSYST0Kt4hadt+2aGmi2oHTORWD2PQOymwZMTdtMUlGF9lnqZRJxoZzmhV
 LxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469428; x=1738074228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UG0trGBZa/zHcAjVBtljvnuPb8rCcRdqGnikIpWwT/E=;
 b=fwFlZ28xqmto0QaRdMisqmCiUUyNW6b43mkDbddpy6+i1z8MmaeJdnT8UdImUeRO+m
 qBjGIdlAmi5gO0da9K/8yw6QFjBXAUSZqdvpCTN47kOO3+Dve/GHse450S43hf7qqyz3
 glCHEQjL6pjdeGcGeMO0LlCC6okPWBpulBEaHeEatfBaEdXXjRvmS48mRArOpo6cpWNN
 FcTc2FWGuULJR9Um8dv74pc7pVHjuQBLqjEC55tKQ3ptxsd9VfswkzmFjYNfyEZAD7B5
 6bWp6Ktcm5fvKd2m7bi5+OzbURTyOCmDLop+J+R+TCeluUvgjg7tohDd0keReJRACKwP
 sDwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCViAsrvOJToeNBUWWp2geN4a0+uVm8WeHYtRQaFF70/J55ufO/o5NyJCerVrVUFIsruzvH03xQ7U79B@nongnu.org
X-Gm-Message-State: AOJu0Yx1N9AshPW0tFZ4x5fhiLBQXlh36ePnBUnyDMmMyetpWTKx8DIB
 WwUGFKf23MPMQLAA3tH0tGbSXWYVv0eU5zYih66vZ9q6Tc0Xo0WUSHs67blFV9c=
X-Gm-Gg: ASbGncvSpl6E3t8iphh3i+Dn6Zyv0YudcPnastnSWg4rOKTfNQR3BUwCYDtQRBkPN/y
 zSRmgUV07N9clvkWKI82q//D6BmP4xcc1mS2xDKxFEBNAdr4U4NqQbGipmTRqGUdarhCKuRJQDP
 cwG2Iazdbyt6oceE83cvNKghCYj4s+6AIf6PR3K29m1BKhjogeo6otUp8sgrIKMNPdYZw21cJf3
 oz0jdeQN4YUhqoqa+p0liAboif4wU5hfKE7cCPmeBWBivYRlPnitOkm5VMhX6fJSpUemw3Y3TN0
 XmRZb8QgX6d5KwU3NdCbX9KnViaAVOHnNxJ+piUTtUHv
X-Google-Smtp-Source: AGHT+IGjuV68zkjMzC56OZPOHSd4ONXCv+cHsFdMxckEbUNUtN6Rb1XshAzelw3fkl/lkUre+ozVBA==
X-Received: by 2002:a05:600c:3d05:b0:434:f767:68ea with SMTP id
 5b1f17b1804b1-438b0dc9532mr10630425e9.5.1737469428481; 
 Tue, 21 Jan 2025 06:23:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389041fec5sm184309165e9.19.2025.01.21.06.23.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:23:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/28] target/hexagon: Ensure not being build on system
 emulation
Date: Tue, 21 Jan 2025 15:23:14 +0100
Message-ID: <20250121142341.17001-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Currently only user emulation is supported.
Assert no target code is built for system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hexagon/cpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 79e60d4bfa1..f78c8f9c2a0 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -26,6 +26,10 @@
 #include "mmvec/mmvec.h"
 #include "hw/registerfields.h"
 
+#ifndef CONFIG_USER_ONLY
+#error "Hexagon does not support system emulation"
+#endif
+
 #define NUM_PREGS 4
 #define TOTAL_PER_THREAD_REGS 64
 
-- 
2.47.1


