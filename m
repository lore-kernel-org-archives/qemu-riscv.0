Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D3EEB64DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:09:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZE9-0006jq-KP; Tue, 20 Jun 2023 07:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZE0-0006Wd-Fi
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:41 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDx-0004Tn-NB
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:40 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9891c73e0fbso143612866b.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259316; x=1689851316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
 b=kmaRhTunpRHqu1Dxjhr36m8NW55YJQUI6E24JzAolRKCJ35LpPhQf30r99LGvF8UCQ
 mNcm17XOmsbPi32rbeNhCgieHOp/mgosexsP2OCzlxXU6xVPO3MYdAKiVPF09flgVnW8
 /jyEQbc7KkxudMIOEkMwb0oiUb5E0kxvCXHd/yl0oKdE6USR5STpdBtrSlE+zHI/kjV5
 WG5XQ7AJENxMmQNlGbd+Fgpxkxg9ZupJb40+WkHLNbgCnKuirfI/uRrKYkFPJPeVXVwE
 YHA1ppKN/4WBZQVUHgRrDtP21N8cIlkr5UADvnTJYxC8nm3F6Wzb3bsQmvXyvuGDG7Sn
 fS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259316; x=1689851316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
 b=aXxLfdXuCNfG+e4KnIrDRRY9FilawjvvSJyUmJmmKZoi7mEEtbRCjVi0jEmiylCQt3
 pZmxeHzelC3uNQYpOOp5SndW1KYv+Zc+hdlYubx3vmPsGzmYFEZ+H5qSExrSkKj/4uUr
 X/S9sNBZc42N+IU4OndztUYiJ2gCUNPdiPRhodjJl0AnenoMcXAV1tmxN/hUdygYXynj
 jStsEnIWsGX+8arEGVcyA5UFI4fO+GneBVDgGEOoMOCcr6sC5v5+AGljgGy3VzECtZNP
 qRF/Z+wHIyw0ocwgN/y1kJUHuZ3hkzPFyK2zC+wtCr03VuAMK8mBpkkkWy2QLl3lE+7G
 uSiw==
X-Gm-Message-State: AC+VfDyLJBiJug3/Ja5swGHvNGty0hy3otv/3aTfdJGz8njBwsqLB0Xb
 ZFVX7PwKX88zj2wP6WjGrS5ozKubvs/dW2J96EU9Y/+D
X-Google-Smtp-Source: ACHHUZ5/uQPWNCCe1MELXLZNDZy8WtefV2qMXioVObsWzfQ9XvwZPQTwyq3wpqkPRdLuyz1VuNuDXw==
X-Received: by 2002:a17:907:3ea4:b0:978:8979:c66c with SMTP id
 hs36-20020a1709073ea400b009788979c66cmr17803113ejc.18.1687259316435; 
 Tue, 20 Jun 2023 04:08:36 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 27/37] target/i386: Use aesdec_ISB_ISR_IMC_AK
Date: Tue, 20 Jun 2023 13:07:48 +0200
Message-Id: <20230620110758.787479-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62f.google.com
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


