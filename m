Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3602CCAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:21:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3yQs-0001hr-LO; Wed, 01 Oct 2025 11:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQS-0001LM-Sj
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:07:28 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPT-0000jJ-05
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:07:27 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e37d10f3eso58327995e9.0
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331183; x=1759935983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nc6SQepOSDp1G+psOpOSnrtdkGiVl2Kbj8pqbfBoIpY=;
 b=s5dSnb8UWNtcOThaJUxe3jdEhQvkwpIyoF+vzWr+5Jr3y/VYDcssEVNnjwtanCb71z
 YpkCzeKdZ52lbYNLRUqJWBOo727wrVWCjWrWs7dm4tj52um/Up8kyPahffWTJYyE2WMY
 La99FQ9g2rRYq9NSZthr+BM2DGV37vlPgIk56nwo23RNpaDEwPI6mnZAx7y2f3QKkscu
 qgmP5VVsXcBOBy1hQg+0ug3+aU9nS7aQVbE+Nd6xErjFrm0cFJUfARneOIc+8v8uW9yg
 yCkWT6aBJTjH0yGW3OBTqyUirVTZhQlUnxquxetS/h+s/HcmHw9hCTgrkzuhFqXYxPrV
 BcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331183; x=1759935983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nc6SQepOSDp1G+psOpOSnrtdkGiVl2Kbj8pqbfBoIpY=;
 b=HZdNMEepz6sQ0Z2IVH2N6mofDLF564nGAX11/73ppwXrOaO0lqNXsVP6R4Bj8i8KKz
 5yfoi3mnW1CDc+UXIog9EPGlCAwe2LNk3/SwRALVOaKsVRnY7BXoQdmWyl46grcjGK2f
 QhYNudZynhVmU9mt21Xg6xoIgGOckSZ904g/Rw8hORD+7w8QMjQocrgjO18QZkTGQKOo
 R878xS8u4a3ZMMCp9VRWKB0zG3vxTCfTFBa2Lc29rNQxueRQ7scUJ3zsHgJIjxoGdPcQ
 CX/bUnsPtBEULzkgDqS7g2xnGNieTJYZNxU/8tmMQXVFBFS0OE4IYZpTKcujuaHVLNeY
 9ttA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV36FbltZ7M5M6gr+aP/hVT6aGwQ+H+1ELFvoX+Rom63UrPOYSLxbPURzo3dDiag5696MNdtJoIDSF@nongnu.org
X-Gm-Message-State: AOJu0YxvBpBgVs5QuManwKai3wKyMD5z9MJhWbsGe0nhsVf3Fxpnh7Jy
 5CGx1DDPQA+cNctwbwcUuVq0sr6MnWuCqg+3F/dyLoXjfaAvXrcpjXTu7xlqCXUzve8=
X-Gm-Gg: ASbGncvobTJ8R707ROIKrtQK9uG6Nb3KcGRecSaiKZBF53sKGfzdoXXSiYSPahc1myE
 FEO/5zbLRBASHby5fe61trFEW4s0zILj92f6F0DJjT9U+bGavP7hPcaMxWtyU/2X6WjUjD9C5KX
 0I162mAr1RyGeopC1RFTzAYp0wo/Ip6VFeE7e3h3x94absqSizbefUeKWY0yQ8eCsYfaSJj2TSn
 W57XTK+t5ypwM2G7bIdsYkoFmoBtv8lcMogMufhg5YaX0zTDBuXBm8ruKp1z4Y7myjgG7wYtxij
 OXnmItJ7GhZJ22/oDAKcwH5nqjqpYYPmRrTgwbYE1ekjL3ZBGoAOvNbnidX9+ciIyJunPE0AId6
 aWiJFEwc2kH8VzcpIRO8iiMzjbj1I6qhgzPbjpUosxfIc3Envv+1OZHe/F64CM8HbgXMPZG/ugE
 yTm6P0U1EB2Zt5T3SfOqI+A0j5H/CwYA4=
X-Google-Smtp-Source: AGHT+IFGCxjXkYObmgYE3TV0nQAqOaCRAkG/1uUAE+ySA25/F2Ub5rpLDFciJ0EKWdJFqLTENDrzMA==
X-Received: by 2002:a05:600c:83c7:b0:46e:27fb:17f0 with SMTP id
 5b1f17b1804b1-46e612195bcmr33245775e9.9.1759331182898; 
 Wed, 01 Oct 2025 08:06:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b46acsm42233765e9.20.2025.10.01.08.06.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/22] target/alpha: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:15 +0200
Message-ID: <20251001150529.14122-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 096eac34458..8819f0b6cb5 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -175,6 +175,7 @@ static int get_physical_address(CPUAlphaState *env, target_ulong addr,
     target_ulong pt, index;
     int prot = 0;
     int ret = MM_K_ACV;
+    AddressSpace *as;
 
     /* Handle physical accesses.  */
     if (mmu_idx == MMU_PHYS_IDX) {
@@ -211,6 +212,7 @@ static int get_physical_address(CPUAlphaState *env, target_ulong addr,
 
     /* Interpret the page table exactly like PALcode does.  */
 
+    as = cpu_get_address_space(cs, 0);
     pt = env->ptbr;
 
     /* TODO: rather than using ldq_phys() to read the page table we should
@@ -223,7 +225,7 @@ static int get_physical_address(CPUAlphaState *env, target_ulong addr,
 
     /* L1 page table read.  */
     index = (addr >> (TARGET_PAGE_BITS + 20)) & 0x3ff;
-    L1pte = ldq_phys(cs->as, pt + index*8);
+    L1pte = ldq_phys(as, pt + index*8);
 
     if (unlikely((L1pte & PTE_VALID) == 0)) {
         ret = MM_K_TNV;
@@ -236,7 +238,7 @@ static int get_physical_address(CPUAlphaState *env, target_ulong addr,
 
     /* L2 page table read.  */
     index = (addr >> (TARGET_PAGE_BITS + 10)) & 0x3ff;
-    L2pte = ldq_phys(cs->as, pt + index*8);
+    L2pte = ldq_phys(as, pt + index*8);
 
     if (unlikely((L2pte & PTE_VALID) == 0)) {
         ret = MM_K_TNV;
@@ -249,7 +251,7 @@ static int get_physical_address(CPUAlphaState *env, target_ulong addr,
 
     /* L3 page table read.  */
     index = (addr >> TARGET_PAGE_BITS) & 0x3ff;
-    L3pte = ldq_phys(cs->as, pt + index*8);
+    L3pte = ldq_phys(as, pt + index*8);
 
     phys = L3pte >> 32 << TARGET_PAGE_BITS;
     if (unlikely((L3pte & PTE_VALID) == 0)) {
-- 
2.51.0


