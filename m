Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E21606A31C
	for <qemu-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFgMa/WX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNCaZ-0003t0-Q5; Sat, 31 Oct 2026 13:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNCaX-0003qV-L8
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 13:09:53 -0400
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNCaW-0001Vp-3R
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 13:09:53 -0400
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-15943c9c005so1247369c88.1
 for <qemu-riscv@nongnu.org>; Sat, 31 Oct 2026 10:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793466590; x=1794071390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yUNIvB3FxzBkZ+ejHoX3nLFFjBvTWomjc/HNnaE4vXI=;
 b=gFgMa/WXzE4oRLlyZEEaUfmh1cTxiUA0lqGLYNaggf69yPknRpkwEcCiZjtv+mYZN8
 WUpx37u864iVFDagKI/yIqar6dkp7N68uge03DWxxyEa5DzN09BxT4mvtgCvVeHJM1Sj
 ajeFT6ftFRvBa4lb/hrlIuNnn7x9BLxhq3xMcr/JCF/ZwgypIssD0QOtJOehlYT1uSuq
 2AYII9jaNA3IGDDtp+RYymHtC7/VeinqNf3c7f8rAOMtqlWgLb7WhOaCu7+jiFmRklMg
 wVugATb/6AvGTgyKrU+XV/A3qbLt+LSoyo+MOq0DHFUkIke0HmyWUg8gvQDKY6ttyotr
 JAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793466590; x=1794071390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yUNIvB3FxzBkZ+ejHoX3nLFFjBvTWomjc/HNnaE4vXI=;
 b=UeuKyOblEs1Yg85TNhYAiDcVMuPil52qCBfIT3B8v+x/PLFI2qLD9tK9b6hE/+s+FR
 SGu28v1rOd+rbDm01f98t0dDLYjmZcCJVMK4rLY5HCUfqzacJh1cAWMqZHSGLUJ1Xi4y
 /Q285kTElTNbFBSAi5e/7IZi6TNhOEk1xbXnq9+VaabCxXQMfyhl5qMSVwaPXQJfhZfS
 0s/HJTRjrok7vA5d8MAx11bfCnikucsF2RAW3fT72eRetpI/XoyxlUuSJCYIfHznEI+w
 qK7Z4DqcQUCURMLpiCNO9gbQmIofO1+V6t+hFfPWr4LOSvrqZYyV0T6rShex996VFqgB
 fe0w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwn7qBGmtYgkFaZ9ASNLe4D61LkP97A8JI7XSeY/wO9K5pLD3VYWA2XZhbxO2d6cn9eFKfvmbD3Lz1R@nongnu.org
X-Gm-Message-State: AFq9FYJoU5q8H8hypYkq2kAxYdEEOtLOXelVIq3NmvO2pxrQhGX+S5SS
 lk0+1bxyP4KUXN7y25fSW0mNo1Ha6Trs4SH580JhayF2ydsKPs9Hgcs1
X-Gm-Gg: AYBFou2/sGSxHzwLOCcsOAp8lsKBRUC/JgOX6ydrpcSe16Lyt+tflUeFmH9GI6uAcAz
 KQwnGp4wKEhA4Okds3txMW3VygMjxZOZeoAF9vilaK3Awa0GN8/9KMNWHIUbX/HwkwKXAO99YX2
 KrxUjdFcnZT7GQDylAL4xGo9uBeCX/vMnsVu58EFmZt2MVo71UeNpkad5Xj4b+jyA//FKP269I5
 FgM6Yr7JF4dAraNHpS55iv1h1UEWT3EfQQ0T4cQi+QQk4sjq/F8Pf9KArzgGhr4TdaWIwKIDCHH
 XPMI1kze7+B2IJRLS0MWxrDczoJkncdxXoNeT9dxhk1t7E/UNvXQYIxqnCrSgF9Oe4U8lWI2F+g
 N4dHIayryvxRmDuCYpCMGs3xJ0BO4Jn6CFpfoYOnfbuI9sFxrGd7sDkjNdNta78bpbzTZp09x2w
 xSwfFtdbHD9hLbTP82pu2iDJ72ZGH8JWYgDQLvKufKinTn/bSUhL9my1rkzyLL1H6OY8KMvSIke
 te2A2liTOw7isHHrpdY+2QTSDImhoB1EGttye8L22JmiPApsRj/Tzjo3UYY3ffcBk6cwQ0Hj1T7
 fKDzGaa9jrPgHows1PsCxVTvdv9xm3k1TvEaS/nLQlqFAxac7g==
X-Received: by 2002:a05:7022:208a:b0:1b0:4272:4282 with SMTP id
 a92af1059eb24-1b042725256mr1322960c88.17.1793466590235; 
 Sat, 31 Oct 2026 10:09:50 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854da78sm23749065c88.6.2026.10.31.10.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:09:49 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>
Subject: [PATCH v3 3/3] Revert "target/riscv/tcg: restrict tcg-accel-riscv-cpu
 to riscv targets"
Date: Sun,  1 Nov 2026 01:09:25 +0800
Message-ID: <20261031170925.789-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261031170925.789-1-luoyonggang@gmail.com>
References: <20261031170925.789-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1230;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is redundant now as all accel-$cpu_type parent is already registered.

This reverts commit ec65e16fd2ba012d57b1bbfcfcd04c31c4111924.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/tcg/tcg-cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 2a7796c382e..1369b7c4ded 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1754,7 +1754,6 @@ static const TypeInfo riscv_tcg_cpu_accel_type_info = {
 
     .parent = TYPE_ACCEL_CPU,
     .class_init = riscv_tcg_cpu_accel_class_init,
-    .is_available = target_base_riscv,
     .abstract = true,
 };
 
-- 
2.55.0.windows.3


