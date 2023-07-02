Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D45FEB64DA
	for <qemu-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 15:56:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFzQp-0005Bv-LM; Sun, 02 Jul 2023 11:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qFzQG-0004Di-Ht
 for qemu-riscv@nongnu.org; Sun, 02 Jul 2023 11:55:36 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qFzQD-0000IV-IW
 for qemu-riscv@nongnu.org; Sun, 02 Jul 2023 11:55:36 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b7f68f1c9eso29767315ad.2
 for <qemu-riscv@nongnu.org>; Sun, 02 Jul 2023 08:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1688313331; x=1690905331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ue2dx04GA0MMTMF2nL8iZsmgnBaXiJ8OB2kvZbsFtIY=;
 b=nr0Mvz9TaG5XxEUQE14iKdWzB1rGBuhqFztL1b/Ssu0v2mkriINXJuTzoD8Eq26D6t
 z8lIjJDSCv/8ITYHN5UZxaod9pSy0CrvJcAvYDg+DPlMYpm49ea2HM7ppZTGPf/E8qCE
 HT8wCs3M4VbudfrLM/NxUjmiywGi3knqlkGvBI4A25pQwZeOY0aWqX7QN4HtFPO3JWkU
 7bCUXa6uFeBFHZssvpCsVbWMA+JLexYzFs5yB8FbfOkTDGRAEakv11UYyjJQKLsJEwkR
 IkqCnt/xocqddeRm62Xmx4V92C3jumlnQ5N8NRdRtVmS/Dg28I+3jnhZfylPszDXL/lP
 +IYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688313331; x=1690905331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ue2dx04GA0MMTMF2nL8iZsmgnBaXiJ8OB2kvZbsFtIY=;
 b=ak9nU1m6QOcqmUTZ1QlF94gmMzfmX1DAC0a533hq9VQlw5srpGQeNRduWVVmmZHOdN
 X9lwZAh+XZa2rNRDSjA4ydDp+5EvxCOtP0AUHnZC2TApd24GmbbqI/oy3xwBItbxfig4
 2nkbO/mKLmEV9DxqBZOQyH7/XKiCfW2O08wYMZsl6ufSLiIhrfcR3R1VhT6oMorjcyuz
 TMFGJcJtj516WzfhcJOnAJMHXRwHqbbjYgDX6vdPTM50XwXkcNVC2JNVGEGDqR8qCReb
 P6hzNA1Hvlq+OvtVBN++Pbfm+ewi+lzdNcWmV4zwCnac7PWw+U0LotIKoWUjRmftZJLD
 8gag==
X-Gm-Message-State: AC+VfDxsvvvOb50IFCYA2SDnkoJ80yZ2YHZchgS6M+M7xfiSwTSzH7A9
 tGSkmBdvgJaZ79777mchg/du1/BauA4MAX58F/AWBBix
X-Google-Smtp-Source: ACHHUZ4JSt57NbLfXAI7CVUzf3qa4Hh5I8M3PBsPsTjma3iFKO3BYQexLJHWDsXiqi0yu/6wykZEFA==
X-Received: by 2002:a05:6a20:511:b0:12c:8871:26dd with SMTP id
 17-20020a056a20051100b0012c887126ddmr8900488pzp.25.1688313331659; 
 Sun, 02 Jul 2023 08:55:31 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 y19-20020aa78553000000b0066f37665a63sm8231969pfn.73.2023.07.02.08.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 08:55:31 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v7 14/15] crypto: Add SM4 constant parameter CK
Date: Sun,  2 Jul 2023 23:53:48 +0800
Message-Id: <20230702155354.2478495-15-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230702155354.2478495-1-max.chou@sifive.com>
References: <20230702155354.2478495-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62a.google.com
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

Adds sm4_ck constant for use in sm4 cryptography across different targets.

Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 crypto/sm4.c         | 10 ++++++++++
 include/crypto/sm4.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/crypto/sm4.c b/crypto/sm4.c
index 9f0cd452c7..2987306cf7 100644
--- a/crypto/sm4.c
+++ b/crypto/sm4.c
@@ -47,3 +47,13 @@ uint8_t const sm4_sbox[] = {
     0x79, 0xee, 0x5f, 0x3e, 0xd7, 0xcb, 0x39, 0x48,
 };
 
+uint32_t const sm4_ck[] = {
+    0x00070e15, 0x1c232a31, 0x383f464d, 0x545b6269,
+    0x70777e85, 0x8c939aa1, 0xa8afb6bd, 0xc4cbd2d9,
+    0xe0e7eef5, 0xfc030a11, 0x181f262d, 0x343b4249,
+    0x50575e65, 0x6c737a81, 0x888f969d, 0xa4abb2b9,
+    0xc0c7ced5, 0xdce3eaf1, 0xf8ff060d, 0x141b2229,
+    0x30373e45, 0x4c535a61, 0x686f767d, 0x848b9299,
+    0xa0a7aeb5, 0xbcc3cad1, 0xd8dfe6ed, 0xf4fb0209,
+    0x10171e25, 0x2c333a41, 0x484f565d, 0x646b7279
+};
diff --git a/include/crypto/sm4.h b/include/crypto/sm4.h
index de8245d8a7..382b26d922 100644
--- a/include/crypto/sm4.h
+++ b/include/crypto/sm4.h
@@ -2,6 +2,7 @@
 #define QEMU_SM4_H
 
 extern const uint8_t sm4_sbox[256];
+extern const uint32_t sm4_ck[32];
 
 static inline uint32_t sm4_subword(uint32_t word)
 {
-- 
2.34.1


