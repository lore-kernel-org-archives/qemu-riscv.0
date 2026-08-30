Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB48C61DE1
	for <qemu-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 16:04:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0i0h-00062z-Kr; Sun, 30 Aug 2026 12:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x0i0g-000624-Cm
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 12:03:54 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x0i0c-0007iR-L0
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 12:03:54 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-8556ec44e9aso2515081b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 09:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788105829; x=1788710629; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wNG2O6yI3cqOSliBCzXTaO4rB4OupX3Tq4hwnPOUltY=;
 b=TnWAb3dEIkMJEXkmlCQzw1qUTFyCEbX4tln0HfZph6gHO7Gjy+Ht1u5bIPU+V9kh1o
 FnwmUNuBOce5CI4zEbMKgrUnYJnEWkevjEq8bCSLcKXSzC1wWV2dgIlh1vphHBT/hmQw
 5xVjURjvLMn+IDBZZCP68sZnLjBbPYHZ43u/zUR1yLqvCUQyjQY9wVyNViG1d93zTvn0
 tyMCDIyPRypP0LugeRvuNMLKv70L7MLI2Z0JDp0ArRS5hN5roqq9N6D8SqUl4yupxWIq
 iTUy9MPHqE/4iHCEie29DyEPNGv5mVs4eI7cmeDoaitLZpxiDGxt2Gt+FUL31Y+NW7vx
 efGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788105829; x=1788710629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wNG2O6yI3cqOSliBCzXTaO4rB4OupX3Tq4hwnPOUltY=;
 b=FieNSAJrXimDF4b0jqcOIi+7+NwBgzkNgKOzVGr4WjCI/p9g3Lii8opaou/qE7Cj+T
 ScTR1QepNRB9zu017vNBKRiZHu1kqyCYxP4A1enSx/IjqhHQa6iLBttwW03AUUW1lsVe
 plLDTDQ7OU7nKV4+6O3fRUOtj11t0Q4z5UyPbyv+bB43ywCt5iVwOatylDBf+/A8U5Xd
 RR7TnNWANkgxnyvCaJ2OI7zeI/P8PPl3h51P8qR1I/1OBMnGiEwwfBIMNutWEEErytr/
 TzIPdFY01u5Ms5jvzanwfKkInYHCJg6LwS3QLPO44ktud2hSslyG42WY5CkBwv6EoBfM
 Shnw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrwxAYFIG32I9eMWiUF7/uU/lvWG5BDszhVmKP9gnOTJRxLuQAvqjA7Oy0BQtq7uYpjjin1eUF7z/qi@nongnu.org
X-Gm-Message-State: AFuF++mZUbKrWne3Ou7olv2G7qscGfGmsCC6Hblw7942PEQfW92OqqvL
 8hfC4uF9rhzHP6qPdUIjt5qGgbUT4gbpdACMZC5xoWVf11PP2tjMIfBuuMYtTqg5Ovc=
X-Gm-Gg: AR+sD118Ro++zWwBlXSqB73hs0jgyWYqgQJ4i0ONv6ekLM0RN55njLW3TAhUoepjF+n
 UxhF+OEXpa8ED4PR25c4qWV6yYXx9KTWx4xFGe0CrU9AtfcUj8XytX2Zbjx5RwJPHG40hmGkkQj
 5CnBr9zBKL94vGRB58K4aXbrW0jDzLqSpPzV5DyugrdcalKMd9wouBHT0htpo4MJr9zn4offRfM
 xtu7pS0Q32cxSNek30kgqOUiGmVvYaZfFd7blQXWDVcWEcld4feBCkwfb6HzHKYmTLMGW9YxNFq
 tSkMzWwuaRmLNLgmMLSCCeALrqXGpFMaXLjTpAnHH7KV9Jtg/3gOx+5zLQsmrzKJjleoAdKxsPF
 z+L86ZjdFimMn/d7wMZdAnMUXJW+MIx/unlSO2qteZ7WaKjT670Mb96rhUXChyIm6Pg1GI967iI
 scVwD8RY4JQoaOJtgP3AYE1gD6ek8TL+fTLoJi/DE/wJ0kLLSgE8lgyLfvtB6bKUjPvkS0/w6Xu
 NJH2D4sDCzr6QnungOLqnQZsDC3cXGO2E/5ga4W1E1xgW4M5gFhbdVTXRjVfI4=
X-Received: by 2002:a05:6a00:3c91:b0:84e:2f2e:8def with SMTP id
 d2e1a72fcca58-85628c72f68mr32617056b3a.6.1788105829296; 
 Sun, 30 Aug 2026 09:03:49 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8569ff701d5sm2455900b3a.25.2026.08.30.09.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 09:03:48 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Chou <max.chou@sifive.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 2/6] target/riscv/cpu: List one implied-ext rule per line
Date: Mon, 31 Aug 2026 00:03:31 +0800
Message-ID: <20260830160335.3441069-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830160335.3441069-1-max.chou@sifive.com>
References: <20260830160335.3441069-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Every entry added to riscv_multi_ext_implied_rules[] currently has to
reflow whatever line it lands on, since entries are packed several
per line. List one rule per line instead so future additions are a
pure append.

Suggested-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 58 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b4e34daf8ec..af61a1ab48d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2909,20 +2909,50 @@ RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
 };
 
 RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
-    &ZCB_IMPLIED, &ZCD_IMPLIED, &ZCE_IMPLIED,
-    &ZCF_IMPLIED, &ZCMP_IMPLIED, &ZCMT_IMPLIED,
-    &ZDINX_IMPLIED, &ZFA_IMPLIED, &ZFBFMIN_IMPLIED,
-    &ZFH_IMPLIED, &ZFHMIN_IMPLIED, &ZFINX_IMPLIED,
-    &ZHINX_IMPLIED, &ZHINXMIN_IMPLIED, &ZICNTR_IMPLIED,
-    &ZIHPM_IMPLIED, &ZK_IMPLIED, &ZKN_IMPLIED,
-    &ZKS_IMPLIED, &ZVBB_IMPLIED, &ZVE32F_IMPLIED,
-    &ZVE32X_IMPLIED, &ZVE64D_IMPLIED, &ZVE64F_IMPLIED, &ZVE64X_IMPLIED,
-    &ZVFBFA_IMPLIED, &ZVFBFMIN_IMPLIED, &ZVFBFWMA_IMPLIED,
-    &ZVFH_IMPLIED, &ZVFHMIN_IMPLIED, &ZVKN_IMPLIED,
-    &ZVKNC_IMPLIED, &ZVKNG_IMPLIED, &ZVKNHB_IMPLIED,
-    &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED, &SHA_IMPLIED,
-    &SSCFG_IMPLIED, &SUPM_IMPLIED, &SSPM_IMPLIED, &SMCTR_IMPLIED,
-    &SSCTR_IMPLIED, &SSSTATEEN_IMPLIED,
+    &ZCB_IMPLIED,
+    &ZCD_IMPLIED,
+    &ZCE_IMPLIED,
+    &ZCF_IMPLIED,
+    &ZCMP_IMPLIED,
+    &ZCMT_IMPLIED,
+    &ZDINX_IMPLIED,
+    &ZFA_IMPLIED,
+    &ZFBFMIN_IMPLIED,
+    &ZFH_IMPLIED,
+    &ZFHMIN_IMPLIED,
+    &ZFINX_IMPLIED,
+    &ZHINX_IMPLIED,
+    &ZHINXMIN_IMPLIED,
+    &ZICNTR_IMPLIED,
+    &ZIHPM_IMPLIED,
+    &ZK_IMPLIED,
+    &ZKN_IMPLIED,
+    &ZKS_IMPLIED,
+    &ZVBB_IMPLIED,
+    &ZVE32F_IMPLIED,
+    &ZVE32X_IMPLIED,
+    &ZVE64D_IMPLIED,
+    &ZVE64F_IMPLIED,
+    &ZVE64X_IMPLIED,
+    &ZVFBFA_IMPLIED,
+    &ZVFBFMIN_IMPLIED,
+    &ZVFBFWMA_IMPLIED,
+    &ZVFH_IMPLIED,
+    &ZVFHMIN_IMPLIED,
+    &ZVKN_IMPLIED,
+    &ZVKNC_IMPLIED,
+    &ZVKNG_IMPLIED,
+    &ZVKNHB_IMPLIED,
+    &ZVKS_IMPLIED,
+    &ZVKSC_IMPLIED,
+    &ZVKSG_IMPLIED,
+    &SHA_IMPLIED,
+    &SSCFG_IMPLIED,
+    &SUPM_IMPLIED,
+    &SSPM_IMPLIED,
+    &SMCTR_IMPLIED,
+    &SSCTR_IMPLIED,
+    &SSSTATEEN_IMPLIED,
     NULL
 };
 
-- 
2.43.0


