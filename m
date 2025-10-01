Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1354CCAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:23:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3yQT-0001MF-D3; Wed, 01 Oct 2025 11:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQJ-0001BI-5a
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:07:20 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPF-0000hK-AA
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:07:17 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e4ad36541so50722505e9.0
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331168; x=1759935968; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9kbDI6gt6dPazB+RCzdsNUL1mFGQ3AIw1PjA8Z/NCU=;
 b=fT0WXwIltjUw1UfAaiCfOfEc6RtWK4HmJNrbxxbTPhOIeq6yKrhdA18zvh7UUGeOXt
 wtbf8pOCXhDMME4fILwtV6CGyTCe82xtgA3CE+v40Q3gKBYq5PMgqq0w3L36L0Z+y7DL
 BzC6BVg1QuwuCm0SGD3JbRD4JSc0e/irFuVZoVizJ2X3LVjGX+ss+E+xVGQ0ngycUhiO
 A/Ct3ZBCIfyTA/Q5ZVC2Bp4g1GT+ax/3JxXF2ZbBDG7ruh4HGOUi/ezzNYjwWjInaTcw
 ZgIMX479Dr02Z/E++/SZAAcREWseZEVrbKg9OMIGLsc6prsYm0JcFXAdwsPgFUWPrbgn
 N4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331168; x=1759935968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9kbDI6gt6dPazB+RCzdsNUL1mFGQ3AIw1PjA8Z/NCU=;
 b=q42Fp+aYwz/cA0knS9cQDisFDfa2Vweq+Hotdlh+qO0NFIGq//BPtUbPdz1Edt2TE8
 45MFRLYssI+RtWhVPvlwrbalLP1PE9cPZAPPaABGjAgwdtcVDPzQZcylJ2boM1rCLMrZ
 qHonsSNjBFNMqjkT/mvpwBjW+FUScgzqdEDRRYZ1F65BLLsmv7wqSAlK6irOkdm20XPR
 4tqJOl5plXn3LANrTAFEPRV2KL3zU8TwgZA/gu6pWT33GEAWgqs4qOQSL3CRmBkYWjf8
 df/m8XLKHozlo848WoOxY8E0/LclLIcTHeabqOVFl0fm5iTS83JMTFpyoKLdgJtriEAf
 H4ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLWvzAuiPzbGZNR0Y0xGhPKKDBn43qLfkTfAWcLeK5lgx6p8d38KkF+Qyd1aCouhzD6smT5S9l0iw0@nongnu.org
X-Gm-Message-State: AOJu0YxbtPcAqZIUWJSjzogCgbCrOnivi9iKUNzSvJkb8dZUBHnrU5Y+
 qi7DRcdorbe5ifE6eZZ96I8Qm0v/BoaAZNlwdVaZeIQksdn4221C/8wxY+NtCi65Zts=
X-Gm-Gg: ASbGncvSQ04VKpSfEeqvA8TFEbWnqbjv/UaxgRfBp1g7sFo44fm6gtTObOhObN7kYNl
 KezKWCNjvPS8bneuAqxHpUNYg3JajoZfhWM/rn6x99fa8RU4+gxFRnsQjGneO6hZ4suo42DGrvm
 e4gzx8VABUxBg+qLMY7wYG25DAmnyqXdcjuVuvx6Y2sN76xizu6gHtuKxY6zqJUNFQVAWb7SUkG
 aaztWkNocSCq39yDVcSeSDW3dVQRcAaurxizt0658jfiuMQwdlfMlSQ0gshw5eauuU+TVNvtVYU
 3U+mhWIb/b7b23u7gy6xunzy1USlfh44kZdfxTtiRT2gKTvbUhzInKh/7WSxq6YCNrC3K/H1/YG
 Hc4eOK+bQMogF3CRDw8BdLLIpyAH27Z1/T3PYyc8NhRUvNItF/jY7aw4N2726k0LDd3cp23t4Kl
 ZnDofyGXCPgCBCNma99vy1
X-Google-Smtp-Source: AGHT+IFG7MuDuZJFDFbAIRDXd/Qu078WvgZ2+fJk49zovMAfy5ixIcVr4nN1V3C3tTz01soo0R8NEQ==
X-Received: by 2002:a05:6000:1889:b0:3f7:b7ac:f3aa with SMTP id
 ffacd0b85a97d-4255780b83bmr2820427f8f.29.1759331167788; 
 Wed, 01 Oct 2025 08:06:07 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc82f2ff6sm27282833f8f.56.2025.10.01.08.06.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 07/22] target/xtensa: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:12 +0200
Message-ID: <20251001150529.14122-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 target/xtensa/mmu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/xtensa/mmu_helper.c b/target/xtensa/mmu_helper.c
index 71330fc84b9..9c868ec3cde 100644
--- a/target/xtensa/mmu_helper.c
+++ b/target/xtensa/mmu_helper.c
@@ -889,9 +889,10 @@ static bool get_pte(CPUXtensaState *env, uint32_t vaddr, uint32_t *pte)
     }
 
     if (ret == 0) {
+        AddressSpace *as = cpu_get_address_space(cs, 0);
         MemTxResult result;
 
-        *pte = address_space_ldl(cs->as, paddr, MEMTXATTRS_UNSPECIFIED,
+        *pte = address_space_ldl(as, paddr, MEMTXATTRS_UNSPECIFIED,
                                  &result);
         if (result != MEMTX_OK) {
             qemu_log_mask(CPU_LOG_MMU,
-- 
2.51.0


