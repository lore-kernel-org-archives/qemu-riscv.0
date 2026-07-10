Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A6FC43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 20:57:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIGX-0003g3-9d; Fri, 10 Jul 2026 16:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFN-000217-EO
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:59 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIF7-0000y1-Dw
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:57 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-84874b52eabso1574809b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716877; x=1784321677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GnP83ngqbzOCaEyHZuWHVT2DEUxtaEIT/kVQUZ1VwBM=;
 b=bNibhBOuXmppnR68sD7trHHPZhV4j5AQA7Kzb1A4Kdqa36+ioA052goYRxRpYKa4z0
 nTDqPU18wNEc555riEoiORe/2eXBPi+48ptIwdmTA78WzDTMy7QGlRCiiAwFiHCkZ1+V
 E9t1WbRZF5Q1uZfdTKrhGuwaKWCfGUMp+YUxFODC+gYXFX3Dxp4URnfVOLfT7YsQNJK9
 HPPk7sVaFOIW9SGHe9iHJWL4ov6vl4DTVfKzAsUjhA4nzoNKAOOt2OjJ8+Wm3FxdXz99
 nqG3rd6KV9pBDHUYDAAQf1NAWc/AlXp8ZELb+bX5sP2XJn0facaxZYIFlPq9wi92oCnf
 hcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716877; x=1784321677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GnP83ngqbzOCaEyHZuWHVT2DEUxtaEIT/kVQUZ1VwBM=;
 b=Rcd4EWxYHg4dixIeaXmCge/89pKtAW18O1jQBXCtFrkOA5xvRjGEvyyUpIce36rj1m
 w+Nf5NJxbOmBqQ+Dmr0bza9GcDFnvPl6vbYKzxYCVy/lbbN5kxLL4ynnRS/SWEkoKiCD
 6AgIuB5pwSAgjN010MC6Ekf0gy7GvERSV9oEvnhjbY0vap+Xj9uy3iFJRD5VIGWeyjYS
 iR/2+tcQ92i+pNSbQ2e69HNqmt+wpYO/tXdHvgL62RIM2JGoIQllMJzXNKAfcyRRYihs
 toDvR/Xt5b4xXu0hGxOZQAYyXuEeDJaz81dqbd0zvUTN8KRyqrl0QlIIGRiTCI2CVBsS
 SzfQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrKrdDQjUVtYo9af7PN9HNl2NaQft9G7GqhFGXvzF4EoXB5FqZL3QF0XgWG/JWhCF5rvBMsyVuIYw91@nongnu.org
X-Gm-Message-State: AOJu0Yzwo8UEERBIEvFuwtQI38gPjg3D/OChcJiteg7O1aoJ9Zb8fbDT
 PU9SBTBWdomxAgt/nn0V25f3dugdt0eR/iFG/8/46KK0oBaJeMihRSmQRYV7MrtW0JwjzZ6N0LT
 6ayN0
X-Gm-Gg: AfdE7cmyuuo1H/2wxmh5/wVbOFcWOf0ePrJIYyk5S3yTuX4tI1bASH56e5OAR888LtV
 iVAQ24lYOFgC4Oavf6CNI2YvkpeE5s9jQqf5kh2aEcZ3tlIwgVtRMu9WqlTXcMZCPqC7VZwLOQy
 KXGv9pSwYDG0BS24UI4sJC9GDg/EeQ1QUVqSNE+ig0nrargjcGx6hw26NhjUsB5UTuP+zigwGWB
 rJ/GktkvR60600WPyBC0Ek0nInvEbZexePzpBraWK8hYlndmyGe4SwG32OrPWZVCEbkmwQeAaNT
 9HPL6mYd6Shn6twKE34NqQRGIk8ylxMcLPshpIkjgwunGCliChZYKPudnEfzkBV6Ymbd9aeGGkV
 p3ROMZF0pQAq4tmOdgBBAtQEOQRkJsyJsaZSjIuqqHTQ4NeiZHg/T6RznAwb6h4Wn90cIOIxblt
 VTKH2LLyWML3Qvuaukeg==
X-Received: by 2002:a05:6a00:b50:b0:848:80ec:5d2 with SMTP id
 d2e1a72fcca58-84889738aa8mr513964b3a.51.1783716877471; 
 Fri, 10 Jul 2026 13:54:37 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 32/51] target/ppc: Simplify ppc_cpu_debug_check_breakpoint
Date: Fri, 10 Jul 2026 13:53:42 -0700
Message-ID: <20260710205401.836304-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

We don't need to check PPC_ISA207S, because that's already
done starting with register_book3s_207_dbg_sprs().
Replace target_ulong with uint64_t, as we're under TARGET_PPC64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/tcg-excp_helper.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_helper.c
index 56ca66e7b5..99ffe4a820 100644
--- a/target/ppc/tcg-excp_helper.c
+++ b/target/ppc/tcg-excp_helper.c
@@ -330,23 +330,19 @@ bool ppc_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
 {
 #if defined(TARGET_PPC64)
     CPUPPCState *env = cpu_env(cs);
+    uint64_t priv = env->spr[SPR_CIABR] & PPC_BITMASK(62, 63);
 
-    if (env->insns_flags2 & PPC2_ISA207S) {
-        target_ulong priv;
-
-        priv = env->spr[SPR_CIABR] & PPC_BITMASK(62, 63);
-        switch (priv) {
-        case 0x1: /* problem */
-            return env->msr & ((target_ulong)1 << MSR_PR);
-        case 0x2: /* supervisor */
-            return (!(env->msr & ((target_ulong)1 << MSR_PR)) &&
-                    !(env->msr & ((target_ulong)1 << MSR_HV)));
-        case 0x3: /* hypervisor */
-            return (!(env->msr & ((target_ulong)1 << MSR_PR)) &&
-                     (env->msr & ((target_ulong)1 << MSR_HV)));
-        default:
-            g_assert_not_reached();
-        }
+    switch (priv) {
+    case 0x1: /* problem */
+        return env->msr & (1ull << MSR_PR);
+    case 0x2: /* supervisor */
+        return (!(env->msr & (1ull << MSR_PR)) &&
+                !(env->msr & (1ull << MSR_HV)));
+    case 0x3: /* hypervisor */
+        return (!(env->msr & (1ull << MSR_PR)) &&
+                 (env->msr & (1ull << MSR_HV)));
+    default:
+        g_assert_not_reached();
     }
 #endif
 
-- 
2.43.0


