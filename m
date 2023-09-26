Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C33E7D27F
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 19:51:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qlE4O-0003qm-5q; Tue, 26 Sep 2023 15:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlE4M-0003qS-Rd
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 15:50:06 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlE4L-0001WB-4U
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 15:50:06 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1c44c0f9138so69749745ad.2
 for <qemu-riscv@nongnu.org>; Tue, 26 Sep 2023 12:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695757804; x=1696362604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VgBZ++vbfTGATiMDuFz0FQ5o0TY/lQmHz8hELrIqQ4E=;
 b=WI5IjVsyW3BmkYAO7wwK7daV3qVaMR+g8jxQinqWKNjOVxsOrt3e4phJKoGZXnvHlt
 /dgKR64TDgkIEYUoq9ayeuPzcK/uPFye+ORz40/PG2BihPpJuZaY4AreT7ghIgn0he8z
 ewTH4uiyCDczhOrDQfSyjQYS5J0EiB3aaEfI13rEy36bKpFIpmjMlR0rmF1ZV95VZ5wP
 UG81IeRv8dXWWLGmaV9U4YYkJcT3F2o2/NzPgvfbKlC9gQZemNQQ0ce4ZIWZo7xqTIAR
 O+sa0C3BBDTDcKmj98+J2X7phw83idL5Tt6JJxSzxNcDULFtkeCK60Nl9x2oPDJla8fr
 rhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695757804; x=1696362604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VgBZ++vbfTGATiMDuFz0FQ5o0TY/lQmHz8hELrIqQ4E=;
 b=rJYqxspzw+jN87+pEBPpFE3kLc1YtCez1nO2qjxHDWvAxVq+yDtcANkA8PU0NTcfaK
 gtaWayKObhxuByUK1QP9nMLR79LetdPR/cRHxkd+zpVCLHhnCe9tHfZZ0miEkpmI/ewN
 yUPt/llYEP1dQufLwzeHs8ew8Q8xliUUmkq7IStvrxfzT/OkmJIzNOBXTUqh+XK9AMHd
 76MRVaK/SdxNwMDxFkO4QqShD731eJdRZGQRUjYpfO+USjPrqVLGB+0BH5LEJ9YC9Mx/
 EjD6xnf5fIm+duZTzh1ej/BLaorgoyFfNNCC7YLokxG/thaLkvlXwo7Qjh/IkMJ8fYgt
 iDwA==
X-Gm-Message-State: AOJu0Ywtjav9957hXLGzWjjG8vmi9TNHivy5M9EpGZMfqa7OqxwHCSJB
 EV8bIPOuHoPljr7o9yA73A9fINppucZDNvxNbSE=
X-Google-Smtp-Source: AGHT+IFKzCZJlnU/ea7mSt6iZGI3hAb6+EnXRcHGHe3JntCJwCaQvnbyhrzo59Nan3qRwc4QEVWnEQ==
X-Received: by 2002:a17:903:2352:b0:1c3:e130:18f1 with SMTP id
 c18-20020a170903235200b001c3e13018f1mr9485531plh.20.1695757803743; 
 Tue, 26 Sep 2023 12:50:03 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 l6-20020a170902f68600b001c41e1e9ca7sm11386010plg.215.2023.09.26.12.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 12:50:03 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/6] target/riscv/cpu.c: add zihpm extension flag
Date: Tue, 26 Sep 2023 16:49:46 -0300
Message-ID: <20230926194951.183767-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230926194951.183767-1-dbarboza@ventanamicro.com>
References: <20230926194951.183767-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

zihpm is the Hardware Performance Counters extension described in
chapter 12 of the unprivileged spec. It describes support for 29
unprivileged performance counters, hpmcounter3-hpmcounter21.

As with zicntr, QEMU already implements zihpm before it was even an
extension. zihpm is also part of the RVA22 profile, so add it to QEMU
to complement the future future profile implementation.

Default it to 'true' since it was always present in the code. Change the
realize() time validation to disable it in case 'icsr' isn't present and
if there's no hardware counters (cpu->cfg.pmu_num is zero).

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 4 +++-
 target/riscv/cpu_cfg.h     | 1 +
 target/riscv/tcg/tcg-cpu.c | 4 ++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8783a415b1..b3befccf89 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -84,6 +84,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
+    ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_ihpm),
     ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
@@ -1267,10 +1268,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
 
     /*
-     * Always default true - we'll disable it during
+     * Always default true - we'll disable them during
      * realize() if needed.
      */
     MULTI_EXT_CFG_BOOL("zicntr", ext_icntr, true),
+    MULTI_EXT_CFG_BOOL("zihpm", ext_ihpm, true),
 
     MULTI_EXT_CFG_BOOL("zba", ext_zba, true),
     MULTI_EXT_CFG_BOOL("zbb", ext_zbb, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 671b8c7cb8..cf228546da 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -66,6 +66,7 @@ struct RISCVCPUConfig {
     bool ext_icsr;
     bool ext_icbom;
     bool ext_icboz;
+    bool ext_ihpm;
     bool ext_zicond;
     bool ext_zihintntl;
     bool ext_zihintpause;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index ce0fde0f5d..11e34782b9 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -546,6 +546,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_icntr = false;
     }
 
+    if (cpu->cfg.ext_ihpm && (!cpu->cfg.ext_icsr || cpu->cfg.pmu_num == 0)) {
+        cpu->cfg.ext_ihpm = false;
+    }
+
     /*
      * Disable isa extensions based on priv spec after we
      * validated and set everything we need.
-- 
2.41.0


