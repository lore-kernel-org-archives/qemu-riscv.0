Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1602ECA0FF0
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:39:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ut4kp-0006ro-89; Mon, 01 Sep 2025 09:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1ut4kH-0006iX-OA
 for qemu-riscv@nongnu.org; Mon, 01 Sep 2025 09:38:58 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1ut4kF-0002wp-Pv
 for qemu-riscv@nongnu.org; Mon, 01 Sep 2025 09:38:53 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2490369145fso25010955ad.2
 for <qemu-riscv@nongnu.org>; Mon, 01 Sep 2025 06:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1756733929; x=1757338729; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mdJ8wwcPHAV4GqLevlt7OBZa8kgoKz5Gyd3+06/T7c4=;
 b=QX1tzWjB6CfCl5mf/0Nw0ZatKHrgYN1OGZoJ7x5/WNWB+0LYJNMlFk5BuWBlEP5S2q
 C2c2IY1a2IyzCjAzac9ZiBIhsviorxogZhFgI1QcYyZV+1YHPLFgk7Lx9PmCxNrDSBjT
 skKmEnpAeycK6vZTIi62rc1mN4CffJayeOMYE1IhzHQSWtuuclX8Vcqobl8at/U9EBZG
 6GA5+l9IICxH25Qk9k6WOXpR5snICWd+ocO5XJmK8wZhx7u0K5BsKS3moxQtrxFEQuJ3
 0hbtj/Px5pClhXZH4t7x526hf0by96r3BJlGI+gv1pjrN2BBmWpUm/tV4hZ+pSbfYe+U
 a7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756733929; x=1757338729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mdJ8wwcPHAV4GqLevlt7OBZa8kgoKz5Gyd3+06/T7c4=;
 b=l5LOoqnWT2vZznFA9y788ock/tnVg/ohIb6t5wzAMus9f4F3qtAad4S3mys03PlZM3
 G6vZNekzndivXVjysY2nIP3fYChiAp0ktvS5ZQFyNVUvTe09ufYrdIVbklcsOlU/FT2S
 m1v/KfraTvuxUqQtyMGY2KuvW1DUCqN0W2jV3WwkkUSrtXoBkxVVxvBqiqYUzcXh4Hkk
 lpMEMuQAuJp2UNZDbMcnlxpAg6GRBGbAe3y0lEYO3MPdxRjw+Vvh90+HWqgeaUG3l6DF
 gm5ztdxLMxdMOtUdBHu9HjIkxWCJKmselN5E8N785WL171GEA9wpSgbAtvg9e8bEFcbU
 ioEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVANxLouuqowMue/UIpVrcj7xs1CKgJ1ScfFCQvTA4LVxMEeYnfrQHQh3cPiHbAdgyZterhXqBi+Kmq@nongnu.org
X-Gm-Message-State: AOJu0YzZ6qDtIT+v9uSKoyCwdtu45zeV+88L5oxkVlAJDEepqi9aw2cy
 ABfcXWGq/mfArZalSnaB9g9ufoMq6P005qHt1TpHEi7/G47giaek3Kjxzim+JxXgoBI=
X-Gm-Gg: ASbGncsYOEjFDoYMx68gKwWnJOCItkiSVsKbS2c2cMEWjEIx7+KxFpTEdBe2vdDvPru
 TI9giRVds8uaDS9heV6BYYlw/N+7k8Sc6Sfr6eOEEBMMziVlmfM9HXkhdb8C8E7r4vTD7kW+SaE
 aESTOMvJIS8ZJfftJ6RUqMG2krwmPlwhO000aZ1DiSKZ1Uh9+xbML9qXatYa4kdNzggzgtc8pZB
 mdsbqtVJP/slL0CjL5L3sDL8PDnzZkjQZvB+uZ5clC6HyQgBnCO/KuqIEKxQHJ4Zb4+Usjfd7Z6
 zPqv/lu5zTn64oii1EbteqRo1Ny0mdtXEsHZp4JAg58PK65s1T73bNLKb/t9V1Modnku7++fkpw
 BdyWfQr1LRWwlyTR4DrDFj+jhGR3JS9qt1uMmSVfpHwgPWFxtr22TzWuruRBN3RbyEIU=
X-Google-Smtp-Source: AGHT+IEetOEkDXNrgniqm/+dy2cOFxxBTIl5actKDnH7MlZILXB3IWQVwZJZtf+qvo8/l5SuGtQ/eg==
X-Received: by 2002:a17:903:1786:b0:24a:f7a1:50c6 with SMTP id
 d9443c01a7336-24af7a1535emr11742735ad.52.1756733929246; 
 Mon, 01 Sep 2025 06:38:49 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24905da3bbfsm103106375ad.70.2025.09.01.06.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 06:38:49 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 1/3] target/riscv: Add Zvqdotq cfg property
Date: Mon,  1 Sep 2025 21:38:13 +0800
Message-ID: <20250901133815.1693077-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901133815.1693077-1-max.chou@sifive.com>
References: <20250901133815.1693077-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62b.google.com
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
index d055ddf4623..95edd02e683 100644
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
index e2d116f0dfb..5da59c22d68 100644
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
index 78fb2791847..7015370ab00 100644
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
2.43.0


