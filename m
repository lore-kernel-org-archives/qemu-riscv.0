Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64A1CA1011
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 14:04:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uto5A-00030S-Oe; Wed, 03 Sep 2025 10:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uto58-0002yd-Mv
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 10:03:26 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uto55-0005sC-LA
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 10:03:26 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-24c9a399346so4674795ad.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Sep 2025 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1756908202; x=1757513002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wUrao0n4nWdP54HC/h+jX0z4mz8Yg3JgSDps2JrXvY=;
 b=MEWx/sNdAuQkw2AlyUCJ6AbxOd+fiGr2HmmU25Qc8YS77GRnz/syQHMIzUUx0bO4/V
 KWf6Ke+9glzih/aYj1y59NOUsDc7yMdYuG0ocpoVC5n4lGvnQqtssBXG5TKzOmBXeLQn
 np84Ivzs+H2HtfBUZ9mioOjMQxOdttVguX/EA2t6Anw0M6FaXGDxVPW+t20rH0amGJGM
 YHm5lt/N5PCI2/ewkC/l/eMVg05ovw7RoFgJuMbt9aP93pGMsDm5e+Z9lzcgwZIo+NtP
 ZMEktVu013eepn3kQyOEFTDB0UarZAyf4OTwFCjR6blF4D1cQehSbQF1t9pdGabU6UHJ
 zOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756908202; x=1757513002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wUrao0n4nWdP54HC/h+jX0z4mz8Yg3JgSDps2JrXvY=;
 b=SNYI9Wsevx4Me8JBVAeg4ukdLng4dnZkiSA/bPW/VxOr7JDENWVEm0HzpGFYf8BaIV
 3NEWA7LCbiw/qbUeK51jIE8HNKdRF6u4JgrNOa3X0aAO/2MVZxzeS2Aw97Ktrm5wg5zs
 TAQAchMVqG8E910c/RTJq4UWr/yHGfHkDuGA0sXDtHsYXbU5NVefTTExPdIZfgTD+frU
 6GlUpU0bHbVTdPRByTCAeO2tbvbSBVyCaXqH1+fa1fftgedxJC+4cuNHTNg8aU13AuYa
 O8uaBi7kxSP8vH3bHJvE52A8sY7xnVHNd5eMNinQOFaMib5IQWdgVf83I2Sc7acFQ+oG
 2V/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK+3nft8oDhzbsEBoEGX0n9HcSAavhBoNu/0uQyWAQXIKCbeKBRO4xfQz0F7nTNhPeJSpZ7g9g/EJt@nongnu.org
X-Gm-Message-State: AOJu0YwD1XnL7S9aMUZikwiypbbDgHi2lRR27515lvfKPOmIKHAgy6nB
 WnzD+143VO0urLcvV/CP9MywjwRj8RPtbPPpivFuksEAsuUqzhMzWGhRASO2uiK6tDw=
X-Gm-Gg: ASbGncshnExkbHHNa5kQ5GeoAoujGGvUunet+ULoDj+jFP6ae+cOXucct4g76++lTLk
 kByF6r0gWh0jaljJbFVMwUMHDnN2ugbyhzCdKZuhsD3EA+sx7VbRZ6OdwFG1Rkolg7C5Xbv91SF
 C5jMpXe9np8B8uX4yARf2t1EBVnG4EyVFULXXiWIn8/PvDTQ4HQ+kgDbd7vYr3F5oheRJVBtzaL
 tOHmWD1KuXeo4sbvpFcpB82fxX9ln534nd24ncDGCMtzbg3hqqM5EvUUmp6BsQx87GgAJwXfsWc
 I81gqPoA3LxeuedEFGI00hH66x3uTMV/x37i5szH52WNyEhzPrbnnFs/yhOm4Bv8j7+woL4n9DP
 /XkH4IKodu1F0p0unLqqrGg2bD4qDemeMtoxUzbb9DlcUcn2Od7WpaYsqDlxdtck5DKdc+U8X9w
 igMA==
X-Google-Smtp-Source: AGHT+IG2ZyhNpB9r1FV1B6QZe87M11ZRE4OFc1ZE3leV7TaynZ7SalPzrHzB+Gf9cqpDNaHCXPzqqA==
X-Received: by 2002:a17:902:d4d2:b0:245:f7b9:3895 with SMTP id
 d9443c01a7336-249448f8ccemr234753635ad.12.1756908199904; 
 Wed, 03 Sep 2025 07:03:19 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24b14e1b097sm50720545ad.21.2025.09.03.07.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 07:03:19 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v3 1/3] target/riscv: Add Zvqdotq cfg property
Date: Wed,  3 Sep 2025 22:03:06 +0800
Message-ID: <20250903140308.1705751-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903140308.1705751-1-max.chou@sifive.com>
References: <20250903140308.1705751-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x636.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The Zvqdotq extension is the vector dot-product extension of RISC-V.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                | 1 +
 target/riscv/cpu_cfg_fields.h.inc | 1 +
 target/riscv/tcg/tcg-cpu.c        | 5 +++++
 3 files changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d055ddf462..95edd02e68 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -187,6 +187,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
     ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
+    ISA_EXT_DATA_ENTRY(zvqdotq, PRIV_VERSION_1_12_0, ext_zvqdotq),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(sdtrig, PRIV_VERSION_1_12_0, debug),
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index e2d116f0df..5da59c22d6 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -100,6 +100,7 @@ BOOL_FIELD(ext_zvfbfmin)
 BOOL_FIELD(ext_zvfbfwma)
 BOOL_FIELD(ext_zvfh)
 BOOL_FIELD(ext_zvfhmin)
+BOOL_FIELD(ext_zvqdotq)
 BOOL_FIELD(ext_smaia)
 BOOL_FIELD(ext_ssaia)
 BOOL_FIELD(ext_smctr)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 78fb279184..7015370ab0 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -767,6 +767,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvqdotq && !cpu->cfg.ext_zve32x) {
+        error_setg(errp, "Zvqdotq extension requires V or Zve* extensions");
+        return;
+    }
+
     if ((cpu->cfg.ext_zvbc || cpu->cfg.ext_zvknhb) && !cpu->cfg.ext_zve64x) {
         error_setg(
             errp,
-- 
2.39.3


