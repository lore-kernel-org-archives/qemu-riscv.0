Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35845EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:10:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGGS3-0003Tr-7Y; Mon, 03 Jul 2023 06:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRZ-0002xC-GK
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:05 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRI-0005u3-Hd
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:05 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-314313f127fso1700693f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378747; x=1690970747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
 b=VvIsKEyqLpv7mL5+/kHjPzHS0Rkh1Yfwk40Ta0J9qyXijv8RRccLzrNDmvnwJDpOri
 Qdi+ograIyCToOFco4uxD8loUFju4u+GeNRwMGyc9DbSqqDzg2Wj1kGJ2Xb3rTSztobj
 7mOhs5SdqGETydpBiiMX7PsatWJ7JQNbqiSl51/80WwZiDOlojCFnCcYXt/Z/Qk91DcB
 PxDtj1aHeQMtduLFS5vdVMis/C3e+89hOPvhzmNfyv5sIVvrqxU3GwPefBLfQkXKvl0M
 d/Zqmppj7qDNLTABY8jvy/bKa26EhKaQ7Cq5MiwXmEF0tZsytUtgGY2uLmOt+ua5bK2/
 qenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378747; x=1690970747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
 b=FvfVHnJTpsGJFwHE0BfMjpdFOR1C0DR1RJ7EFHFtt03T2rz+qQbXJNvPxTd/+dRTzk
 aDCCEMW+dH07rntaeapGhc8RcVo4NI7W1zfff6DSYvEiT8EvIP/WPtKhRfqqfhhQp+kH
 BhU0eoCwLZyRlmnJ8zM2UsCqjwZ1ADs8QzMTKypQ0nlH8hiYKUf4XfJbeNXO+1Bx29jP
 Xe2j1qeu2AW98eEMXLg9r5SSYeBuBlUAkowMHsTmsqgjLWXthr+bCZCZsb+9w71rFlzD
 /ebXQpkLgZYhFNFSpqvYpazUkX94EHR0kfLjFOaM4JrY7bcMs6D5JBLQuKWZyhVRoRMc
 YEaw==
X-Gm-Message-State: ABy/qLYH3pu8OJTtf51GRSD+LeqIckwyMaL2mReX5Zy42q7BE2X2kuzb
 tFAe0vtstb1qCPLp60dZCfG07g==
X-Google-Smtp-Source: APBJJlEW+zTHqpMUQEHX6cKNuM4MGV5f3qaRE/iUUPOANL6FWwbdiY58DV2VojxAA2clMUsqvo6c7Q==
X-Received: by 2002:a5d:63ca:0:b0:314:2594:7b9f with SMTP id
 c10-20020a5d63ca000000b0031425947b9fmr7327835wrw.11.1688378747179; 
 Mon, 03 Jul 2023 03:05:47 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 23/37] target/i386: Use aesdec_ISB_ISR_IMC_AK
Date: Mon,  3 Jul 2023 12:05:06 +0200
Message-Id: <20230703100520.68224-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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

This implements the AESDEC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 93a4e0cf16..a0e425733f 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2162,16 +2162,12 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
 
 void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0 ; i < 2 << SHIFT ; i++) {
-        int j = i & 3;
-        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4 * j + 0])] ^
-                                    AES_Td1[st.B(AES_ishifts[4 * j + 1])] ^
-                                    AES_Td2[st.B(AES_ishifts[4 * j + 2])] ^
-                                    AES_Td3[st.B(AES_ishifts[4 * j + 3])]);
+        aesdec_ISB_ISR_IMC_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1


