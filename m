Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C979EB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 17:04:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJGl3-0004ix-DS; Tue, 11 Jul 2023 13:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qJGk0-0004Ar-G7
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 13:01:35 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qJGjy-0001O2-Ta
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 13:01:32 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-263121cd04eso2987852a91.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 10:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689094889; x=1691686889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ow2HOo+QMXtjkHJz2qvxXFVHS1pwzVfj+KbMmuWjec=;
 b=lkUA0QZX2LUY1EnwmGldHcb8Xj82NfEHTUZCrimz2cV4rUH8X5jzgKgJhTb2TaOiJw
 Rnhux+JhND3gAAHk119bHGaagy2iOyfPMdlzNV/0xajdWTreYrI4Q+Y2MM1eoffw7WsW
 NYsoCbraBqL1rNYZOVmYyNcEvqI+TMX2RUxV/toBVLuPmoeaSG2DyTaEWUlzR93vAZoZ
 D8X/s1vBlTyVlbY8zVy1GXjk7/Sz7mlZQuwwbVKi/Ax7dJHHX7krc9IHjfc3VrnG04wb
 xlt2HAr9Sn80L00uX7WBBtPYFs3Cd47oEiRxkC3ne0eL0Z94Yej4QLi0ccXOGdQ07Y4e
 ktLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689094889; x=1691686889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ow2HOo+QMXtjkHJz2qvxXFVHS1pwzVfj+KbMmuWjec=;
 b=GANiSm7/cn2SOORtK4ZBcI7NGFoC4wXrJ68iFgmVwxH/XS4RCNJ32VpsG2G91j+zrX
 L+ElX+0tfUoc07xRlxwcbksxfUdlNHdnUYm/8dUcEB7BP787FljqIdeJkMdKsfBJocYZ
 F1DckGg0UJnqpNLs7zhFCcs5kH+2kozhVm5dAdu7kaEouHxikQ25eH5ypSeQ1efk/Ic1
 ATcaNKYbeEuK38FYfLHNU/g9/t8ETT4+bnZ0PcYzgWZHCTJgd6jwtH2fXFAbzme7PwGn
 Z8v5aYpPg0obq+9qaCwHJt4xJir4bJBivJ5pB2tbbn2SKLd5lDjhZjPdBcjA2TPy6vZu
 qO0A==
X-Gm-Message-State: ABy/qLbn0wTsSbAhdK1fh37WeSajLbOV0Nv4h1RaojvgwUKln+TgUge2
 g6O86lw6/Rm9JFJvD7+a4OT0gA==
X-Google-Smtp-Source: APBJJlFPc9RZ2TYV7HakHdd7aDeKbmldEi4SPCJhNYNylAijIKu4YqFkx3JCOtlkNZOHAhK4iAIgKQ==
X-Received: by 2002:a17:90b:292:b0:263:528:144a with SMTP id
 az18-20020a17090b029200b002630528144amr14185814pjb.28.1689094889692; 
 Tue, 11 Jul 2023 10:01:29 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 gw10-20020a17090b0a4a00b00262fc84b931sm8381793pjb.44.2023.07.11.10.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 10:01:29 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, alistair23@gmail.com,
 Max Chou <max.chou@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v8 14/15] crypto: Add SM4 constant parameter CK
Date: Wed, 12 Jul 2023 00:59:13 +0800
Message-Id: <20230711165917.2629866-15-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711165917.2629866-1-max.chou@sifive.com>
References: <20230711165917.2629866-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1032.google.com
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

Adds sm4_ck constant for use in sm4 cryptography across different targets.

Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 crypto/sm4.c         | 10 ++++++++++
 include/crypto/sm4.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/crypto/sm4.c b/crypto/sm4.c
index 9f0cd452c78..2987306cf7a 100644
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
index de8245d8a71..382b26d9224 100644
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


