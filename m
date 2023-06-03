Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2201C7EE2A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:38:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H7c-0002Jk-TE; Fri, 02 Jun 2023 22:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6d-0000bz-1x
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:35:03 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Q-0004s8-2v
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:35:02 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2566f66190dso2373450a91.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759688; x=1688351688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jW/LkFvDYs7wuWSeKP7O4G0IgkgaVuXTO9qaWXdUTaM=;
 b=hnPFh4f+AWxBJf5sbiE7g8pqu1YrrALaXeTJJCgO4St7e6bMBIWNOHxZUk97tx2Qj9
 /dwDaOxRJdEKwwVA8MUBdz0TNFlFMP4b9wsZJpraNGTqO44pczDLLXawC3LlGP73+Hst
 mcJipySYYmPK9m2GQ/OUMeGJKtrmuMJIewlUg5YrSCS1s+HninI5yMAyjW+3WldrwIaZ
 iH+Ww38QCpGOGlxwnVVeQnwzuLSLXMamJyuSGkYjOhZuNYsFtNhXOEsoAqdsNMy89CDb
 HXDyDgDVglMZlJatc+hC1LgVaJaOtbf6xwix+7ARTsyrYX+ZXyU1MCapzXBy6GWiAJpW
 t/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759688; x=1688351688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jW/LkFvDYs7wuWSeKP7O4G0IgkgaVuXTO9qaWXdUTaM=;
 b=MRtGedhHuwzZZpNsM5N2zDTViYbe1Z2tlI+2I3vOJAUb3tD9VIK1HN/BVGn6mDa6F8
 DIiA8SdRKIdDh1brnWs/SZMy0hGY80lO7sbbNNe7X9WX2bJ1ltXoEd0pXYG1GsTlo1Vw
 wnQJBR4Ufzspvafwxyow5rwgczf5zeAfn6bXzP8vDOwWGSuSCgs0h5JXu/2IJaW/QIR6
 IwrfioTf/mGPycj6yK3IQKP5YUxlNrUI7lIsqTwAvVx/tN+OWjta55Mw88duaURN1KTD
 /h5P0OirJnnjtNhCYkX/8ha4UFV4p/+LUtyR8+MJMYgXMtA5BH1GqSdT09GbHENXGLC6
 AnkQ==
X-Gm-Message-State: AC+VfDzHVR/UKI1CM191i+MounphxCiMGVrhCA4w2ZSvQgx48Ac5C2W+
 gbjAmNcA9byMLgG9LB3YO/AHRw==
X-Google-Smtp-Source: ACHHUZ68DEKYRLeblRCSawuJDl/wKRCbCuA3o4wxiR1CDCeIeidKUdR7MICjqBdvdJehFB5FMJi6cQ==
X-Received: by 2002:a17:90b:4c51:b0:258:6e0d:26e3 with SMTP id
 np17-20020a17090b4c5100b002586e0d26e3mr1337673pjb.48.1685759688708; 
 Fri, 02 Jun 2023 19:34:48 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 23/35] target/ppc: Use aesenc_SB_SR_MC_AK
Date: Fri,  2 Jun 2023 19:34:14 -0700
Message-Id: <20230603023426.1064431-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This implements the VCIPHER instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 444beb1779..c7f8b39e9a 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2933,17 +2933,11 @@ void helper_vsbox(ppc_avr_t *r, ppc_avr_t *a)
 
 void helper_vcipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
 
-    VECTOR_FOR_INORDER_I(i, u32) {
-        result.VsrW(i) = b->VsrW(i) ^
-            (AES_Te0[a->VsrB(AES_shifts[4 * i + 0])] ^
-             AES_Te1[a->VsrB(AES_shifts[4 * i + 1])] ^
-             AES_Te2[a->VsrB(AES_shifts[4 * i + 2])] ^
-             AES_Te3[a->VsrB(AES_shifts[4 * i + 3])]);
-    }
-    *r = result;
+    aesenc_SB_SR_MC_AK(ad, st, rk, true);
 }
 
 void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1


