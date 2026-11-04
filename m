Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE853607077A
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=cOuiekl+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtO-0003SW-AG; Wed, 04 Nov 2026 14:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtE-0002tc-AT
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:20 -0500
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtB-0002VX-LO
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:20 -0500
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-36cad25b8b0so1632939eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821396; x=1794426196; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N6SgaFV4LpKPN05QhfqTqgshBHVppExqak4hwdva5dU=;
 b=cOuiekl+rIfr4NvExKXWJ2o+wsMk7CUHc4jOy+zUNh5x0ybtmQc2h4J1s5+/nQTyWr
 wSXjRVUBi4Kglnt0DRr1Rc32XEPE3xtj1o09g/PDd6MEr/dovIlFbq++reiF0IZ6ntPx
 0ylzVRffh4SJgnAAZqK27CxOSML1KB7qj7Ww5ZcfcIG/ieWF9EcSIlbKTwq1o7AoNQ7v
 T+AyP/zcpVV2EZmiasCE7GKsma9oVNfUwMU4DNBxLmVYklADOBd44bEfmkMKrcZhiDjL
 ogNXsxWyb1NNrYUYhk+0GN5ZiAr3q01ekg6UOLxmSUenK10lzcw+Z3Pa5xovHei64/Q7
 SxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821396; x=1794426196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=N6SgaFV4LpKPN05QhfqTqgshBHVppExqak4hwdva5dU=;
 b=UBZqVsbavjSp5epGmcw6pjw/s0rkF3tsCjg4mUHIzL0GXTs83awty3EdoSpgxlmgh7
 avXTOQqihYHwKboVDDpkucZhtUjoBZ5Yq5cpYXy5MiWwPpAli5jDrmyS/tlZBETGzdHP
 cNjZr/1LlMrqjBSRa1OSTb3hN+KHYAM3BENbuE+UatOwhp6bHUa+Jc+KxB+/5ufo6PeO
 Cpk1nNF7q0FE5J4VoZRIXT16YSh8mFlToyFltHMpv3oJlZTvBxJdGr9zjc7c6TqFoCbl
 DYYqWBFtyXa1sikIAIabwScZGQzCKZun0ye8do/lo04o/r1HDq5Yq0LtZRpn0wkUhWiW
 mV7g==
X-Forwarded-Encrypted: i=1;
 AKwUvBw8txsuGKs8zwzT1Mglx27yy4p8hmdXxqBJUqle/z77k9L+OG9HeXcA5iDDI9jELzkpaFZqrAPmipQx@nongnu.org
X-Gm-Message-State: APuU4Z+f8PUDMdzzsiEIrVvicsF8vp+kNN0biEVFQCucYnwccY2bQc9O
 BIE+etknWxHv2pRx4Ans689cEZnUrexgKI8ZrhHDHub5RDSjW3/Siyj5nKyDcUegwNs=
X-Gm-Gg: AYBFou3UxQw+O7uC7maVmi/yXjgeKWjKs8j1KNK2xQta+JSR2Pw5/G/NdwrMCQ+9iDu
 ukhUT4keva8PscICBlU2AuCjGeFqOCQNasd/2QJTiLGWMPI1s0OkXCy+8vqBbux6cEKwRXssgTA
 2VbTT4ENpZFODJIMABpKGJ8Dz1+bdXoj9XGdr+13Vi1I8XUW1xCJnYS6V60JU9pzpj53DhIj0z6
 ebDJhw2QfYE8H1H5fkTZvsNSAoSp7H643W/HFMOCXNFI3e12axdk6/g78bTcWJWEpE2v3oDnbFu
 c+/AljwtIG5zNhm/KTBds+d6FJr7UjbBMp5zXQZGdxvaBVX3H4YPG1+ofsGGSPsOrGe1LSOBfqR
 61FrGLjBq4SyoTeOuAQYxs9awhuNuIA+E3qNtroZdMwqnEWtaCgYIAlCiJBEpR8xLnpvHgvO9Nk
 NwCGL5SJ7ZooujJerreDdE+t2/Q94uuy/KJdl5QSOxPhco/Nv2Y+6Is+IUj37r8B4W6HHE8m6e8
 8PQRRFeATS25oKafMqpEkHIxfdTR8Nfcmp3r/hetFe6TdKkJ72cW9fpskkSErwM0iv/3qJZafSl
 JmbWLLOLsdc6dEnGvFUODYeFICFBZZpNAKRjkA6CAeU9Ecq+JvhV4kJPmfu2tstvqbv8uFeEMCf
 iJKW7Ul6cFQwQnCgewa0d5ZUWBQVmsQ==
X-Received: by 2002:a05:7301:715:b0:369:f41e:d2dd with SMTP id
 5a478bee46e88-36a4241b18amr24774869eec.31.1793821395942; 
 Wed, 04 Nov 2026 11:43:15 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:15 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 20/38] target/riscv: Add implied rules for Zvqwbdota8i
 extension
Date: Thu,  5 Nov 2026 03:41:35 +0800
Message-ID: <20261104194155.679241-21-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1332;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x1332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add implied rules to enable the implied extensions of Zvqwbdota8i
extension recursively.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9271f79d1b6..26d5ac69c75 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2895,6 +2895,15 @@ static RISCVCPUImpliedExtsRule ZVFWDOTA16BF_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule ZVQWBDOTA8I_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_zvqwbdota8i),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32x),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 static RISCVCPUImpliedExtsRule ZVKN_IMPLIED = {
     .ext = CPU_CFG_OFFSET(ext_zvkn),
     .implied_multi_exts = {
@@ -3101,6 +3110,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZVKS_IMPLIED,
     &ZVKSC_IMPLIED,
     &ZVKSG_IMPLIED,
+    &ZVQWBDOTA8I_IMPLIED,
     &ZVQWDOTA16I_IMPLIED,
     &ZVQWDOTA8I_IMPLIED,
     &SHA_IMPLIED,
-- 
2.56.0


