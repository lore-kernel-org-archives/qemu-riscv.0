Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BB6C79F82
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 18:43:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2Ysk-0007ey-G5; Fri, 04 Sep 2026 14:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgamblin@baylibre.com>)
 id 1x2Ysa-0007bU-4g
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 14:43:14 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tgamblin@baylibre.com>)
 id 1x2YsY-0007FF-Ed
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 14:43:11 -0400
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-93906e8a5feso137289985a.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 11:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1788547388; x=1789152188; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=E+pG4qBbSeUEKSM2bhtmJlr1wyo0TQnVA/1AeBtIvkg=;
 b=OBQUKcq6vSncp62sYOnMSESylDYMLRWssNrkliOCDP7SqxBUUGrbWiHA7D2/qbJJDz
 VsDRD6YM1iSPuCqI/1RkUcK5viwHMSauO0XpMyVyrTYIxS/cXH3Pw8gOQcZVpnyibuaI
 QlHHy1AEj4SQZcH62a4a+T2banLTyDKOKmHt8DNX1qHvZRHTKeOLWLjaL+8OcX3SyOBV
 6z38sOCwFN87J0ewb1fnu8aKLGRUzYFjP1AJLWcvlOc8dQvzbRIVmyw9CGCerK+zAizB
 87VwMpE5Fper9nnWMz9nran7JtXi3EUwD+eQzLw7MFPuCG77minGt6QKRhgoJ63/dT2r
 aCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788547388; x=1789152188;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=E+pG4qBbSeUEKSM2bhtmJlr1wyo0TQnVA/1AeBtIvkg=;
 b=pODzeMFMBCm5U+RzREVLEMxzjUyEKYZ3yY/hc6BnZscMdqNOGJvTZJaNxoyBHXDvPy
 dvXWMK+2QrUAOwHa6PpH8xi9McJY8JqdvuDCIV/So9bCyuvtPrUZS9AzrCFRYqrcllm6
 poLpMAqiienZdssTqstcMLomda9zEUuyWmzS7l9ctBwQXHmR3QaCgLPXL+uDh1SpNTJz
 DlzeoMQVdmpWc7cEU8sjD0/78LmrAdNaL0Q1wlr6apWmZZwpFlpyD13DTEXDdGf3hbiG
 iXDOF1WEELSqDICYnIbi+0zgD820aFX1rJoc9gnlL6kGAvhy3KM9Rto3wi9uLw0HXNQe
 +y2Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxdudFVNl7mCRdHOYBFciQx5ZHL8ZyxybWFii4E5CtAsvB4tQfRRNpTTYrIjt1HHx2K0nNM4G7II0fp@nongnu.org
X-Gm-Message-State: AFuF++lXcN52+d7kDimaYZh9pR1INi/Hf5qqM4nW91pL/TaM4x+4YtL/
 cBOlOjcL70P4WfzerqGbrcI5LU/wypmrcV3M/9zGSEkkn1hPvsd73Vk6YwiFgYYQ3DM=
X-Gm-Gg: AYBFou3C4ayqQfx9vIdKiE+zZVT7KdSgPGDFa+avV8maIMI69Iyskf2jD6Hp6ss2IcK
 HjTlMH6nqqjy1JCJQfxMbnEfRadVThGp5/lNTKLxDo6g6Ysnoz0YDJunrhCs5Jw4n2tNeijFOTu
 I/tdVQK8n9UyX3hV7i3a4Um6z8k2QRDzEpoow3eMUidMqKJQhU0Ud0De9d/DZHegbt9UJKnuJ9m
 QmuVnokuy7BYccLDfkyObAdl+TTByeuQWVj8sw3EnWWP10ltmuZuzV/OePwhusMCYOtf399TMgf
 FDlb7wAoZ35zx/L6b4ARryIeLMVe401FmTLZTlrTe9IE4W0vio3NyBbU4wp9OAPLtxH2sULMdpC
 5D3GAIsYjSeu/hjb6fhzM8rk/fDPS2scqwtK9WDjw56lyjhpWz5w0bMBvO55dV8d/daokX/yGcH
 J0pQZLTOp3htQDN3NVCTVxCfCVGZCtf8DCA04feRHT9up5sNFW03Su4Utkz1nd0EWKOfXTVYoM
X-Received: by 2002:a05:620a:8423:b0:938:fc91:91ce with SMTP id
 af79cd13be357-9398036365cmr630114185a.20.1788547388181; 
 Fri, 04 Sep 2026 11:43:08 -0700 (PDT)
Received: from [192.168.40.230] ([2001:1970:3847:e000:1977:be2f:4a71:2892])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9397fb36129sm277111985a.19.2026.09.04.11.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 11:43:07 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Fri, 04 Sep 2026 14:43:04 -0400
Subject: [PATCH v2 1/2] target/riscv: extract check_sfence_vma() from
 helper_tlb_flush()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-riscv_tlb_page_flush-v2-1-defec3f29312@baylibre.com>
References: <20260904-riscv_tlb_page_flush-v2-0-defec3f29312@baylibre.com>
In-Reply-To: <20260904-riscv_tlb_page_flush-v2-0-defec3f29312@baylibre.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=tgamblin@baylibre.com; helo=mail-qk1-x72f.google.com
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

Create a new function to encapsulate the privilege/hypervisor checks
performed inside helper_tlb_flush(). The idea is to pass GETPC() as an
argument directly to it inside the helper_tlb_flush() function. We'll
use this function in the following patch for helper_tlb_flush_page().

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 target/riscv/tcg/op_helper.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index 3e94005d2b..7f63f3ada5 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -588,21 +588,25 @@ void helper_wrs_nto(CPURISCVState *env)
     }
 }
 
-void helper_tlb_flush(CPURISCVState *env)
+static void check_sfence_vma(CPURISCVState *env, uintptr_t ra)
 {
-    CPUState *cs = env_cpu(env);
     if (!env->virt_enabled &&
         (env->priv == PRV_U ||
          (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)))) {
-        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     } else if (env->virt_enabled &&
                (env->priv == PRV_U || get_field(env->hstatus, HSTATUS_VTVM))) {
-        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
-    } else {
-        tlb_flush(cs);
+        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
     }
 }
 
+void helper_tlb_flush(CPURISCVState *env)
+{
+    CPUState *cs = env_cpu(env);
+    check_sfence_vma(env, GETPC());
+    tlb_flush(cs);
+}
+
 void helper_tlb_flush_all(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);

-- 
2.55.0


