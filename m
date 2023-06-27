Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27FBEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 17:47:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qECmX-0002rB-Ff; Tue, 27 Jun 2023 13:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECmV-0002jy-UU
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:47:11 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECmU-0005Bs-Bc
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:47:11 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-666eec46206so4307963b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 10:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687888029; x=1690480029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eM7fMUS/bQ7fR32WgG7Yf2+xFexOx9ylKR4feRvm9IU=;
 b=FPf/KvzdgPIgOaCh859Ta1E1qGPb1OL5WhEvDZ/6TkUIvxChZdaXn3ZxY6cldfmBL9
 w2G05+2Xc4Vc7hvQN994QR/OfMxDGJY0QgN6iIuHH5dEQB76kODFfDxC3kMdlLSJrw10
 o8wKaYpcg74rm/jVigO/1DRURlTbxwm8nWrTjVtONpDOxx8EEJjpK5wQlkVTnNIc/tQe
 +go/XEBKfyZnuJ2vv/fNNIRsxa+iUugjr+H/y4nwClootcyYynbWuTJzTFP7qywpWRJU
 gEyupox5CdftVhjrOwPHft7oRDDfkW920FYa5wAaOoUl4tc/tL/EIWIHJ6lJfnqQZaHu
 DokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687888029; x=1690480029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eM7fMUS/bQ7fR32WgG7Yf2+xFexOx9ylKR4feRvm9IU=;
 b=Q2imIkScXcrSb8hRZdAMEpwNCFRP0Zf9eYzaLdm+XvAc1E1O5/Hct1Wilzox29a2fd
 vNUsMu5sIjuftTmWnyKC9MU3JqqkQ/6gVYgQhfHhlbvfvOXeNT55jNjsA2lezqeze01O
 XOP9vs+ATsMhE2J3nX4XxcCkTkJjDhSh3I5vhsY1gKNL0zuISgPgMGL+5evnl7hkc4tw
 w4erv1R7pT8yShAg9cYYAHzlKzxj2f4gQUsm6GyUpse2xCXGuCaj2YTl/XJ9QDatbM/T
 +y9HKg72qHg665WfFO0Bv1uc+EwiaLI1Av/KqCgA30hShPo0wuzjmEBlOhrtgj2TXeWw
 dRGQ==
X-Gm-Message-State: AC+VfDzRXNAjInoSA2RmIhBY6TD2xrQcwqndddAB4F5oNQIsx2qTReQj
 ivF4MSTgrei0Znu5HJ7oN9874A==
X-Google-Smtp-Source: ACHHUZ6tM7blyYwMaCmJ00AE6etXY6xBNbzeranEaF3pk5RDEx5/BN5/g47GGtVA9EpVuYoC898Wdg==
X-Received: by 2002:a05:6a21:6811:b0:118:b2e1:9adb with SMTP id
 wr17-20020a056a21681100b00118b2e19adbmr31533889pzb.61.1687888029013; 
 Tue, 27 Jun 2023 10:47:09 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 i9-20020aa78b49000000b00666e883757fsm5705144pfd.123.2023.06.27.10.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 10:47:08 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v6 14/15] crypto: Add SM4 constant parameter CK
Date: Wed, 28 Jun 2023 01:45:48 +0800
Message-Id: <20230627174551.65498-15-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230627174551.65498-1-max.chou@sifive.com>
References: <20230627174551.65498-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42b.google.com
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
2.31.1


