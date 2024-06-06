Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0DFC27C54
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 13:50:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sFDV3-0000nz-0j; Thu, 06 Jun 2024 09:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sFDUz-0000mB-Vi
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2024 09:49:50 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sFDUx-0008St-2H
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2024 09:49:48 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-702492172e3so853388b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Jun 2024 06:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717681785; x=1718286585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sq/U//JFw8G2FNWn5RrT6F2lqiqRwhS1p5ImKv+14uw=;
 b=mYBL5mAkKk5PW59NzUcN5DdBhy3tZIfYWC0sC5UOe7UEN86yHnI6FtE37EQeS1nGqf
 3OtFd1IyCcicyZYlxWHN7eh7VxwQnRGK8e8ITZ9F49ahw9/daqK/1+2ILko9LAfMy1Z7
 /NzF/GmR2fEjvih3NaHVEpEjyq/qFZPvJ66dWYcH0Kd/lVImEre8z75BbXlGFwn83guC
 QBa0tiXtwiMjT93iXEMHJE/u9qqNqJOvZzgrSDqGLJekY/6WUBN81DO0KKCcmzKvfUUU
 gaXtrvGXgIdM3oGw/ISAnhydLEHm7oH8sx+WJlx2kdmN5oHMIug++CiDm9HB9Joc7sWR
 z9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717681785; x=1718286585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sq/U//JFw8G2FNWn5RrT6F2lqiqRwhS1p5ImKv+14uw=;
 b=g9SAx+cUkcHlkDGafJ8sHPnZt3RX1LeXJ3mZ+CBhaeIMql2UT1pP4pqUA0mavG4kCY
 t7WYSgd+PtmSbPtL0O/RGsRsLDwawyQkUQsZfasCzu1CUTzx3fd++0mI8LkMr124mWBq
 wA4huE0ARngPQGqsILiUvDoiTuPWfJYg0zhU2NaK4LYjQ3YZt2YpoQm5c6kYSunPJUBm
 Y3r7RmKoCWwsclui0JS/Sz1FUWHXbKJ6uKeTccNMijDwUUOhreu0d2GH3jsgJQ55dprE
 TENrKqV7NrwNWZLNHqs0jrdmBMr9rQAWe4WcftTGEGyz+Z0f+01X7UnOxPJplyGqEV5B
 UJOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNDI+9X94jDF5P6mou7ykOOHa4Z5Z0ag8eARoGELKl4dxHw42DQuIcgTUdMgPTQEIOSEW8+5gRTq226wmq9KRQbiem4Xo=
X-Gm-Message-State: AOJu0YwY6rQ92cHNiyQL8va7lFHefxP/+6Jrva4puxwggrSyioHeOTom
 hMr5eH3GErnaeoW4tLVqYsEqZqmJiU/TT+9DssscOULrOiJP+iVaOCK8OT/iw3Y=
X-Google-Smtp-Source: AGHT+IFauj0AgeHxujLXj00B/FWW1KHaX4OiKmSXYSD7uP9Wj6iTsdhGEz6iF+9eCkFf+3QGB4sDGQ==
X-Received: by 2002:a05:6a00:1795:b0:6ea:74d4:a01c with SMTP id
 d2e1a72fcca58-703e598df5emr6496001b3a.14.1717681785522; 
 Thu, 06 Jun 2024 06:49:45 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-703fd50bc86sm1150919b3a.175.2024.06.06.06.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 06:49:45 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v4 2/6] target/riscv: Define macros and variables for ss1p13
Date: Thu,  6 Jun 2024 21:54:50 +0800
Message-Id: <20240606135454.119186-3-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606135454.119186-1-fea.wang@sifive.com>
References: <20240606135454.119186-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=fea.wang@sifive.com; helo=mail-pf1-x432.google.com
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

Add macros and variables for RISC-V privilege 1.13 support.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liwei1518@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     | 4 +++-
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b4c9e13774..90b8f1b08f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -96,12 +96,14 @@ extern RISCVCPUProfile *riscv_profiles[];
 #define PRIV_VER_1_10_0_STR "v1.10.0"
 #define PRIV_VER_1_11_0_STR "v1.11.0"
 #define PRIV_VER_1_12_0_STR "v1.12.0"
+#define PRIV_VER_1_13_0_STR "v1.13.0"
 enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
     PRIV_VERSION_1_12_0,
+    PRIV_VERSION_1_13_0,
 
-    PRIV_VERSION_LATEST = PRIV_VERSION_1_12_0,
+    PRIV_VERSION_LATEST = PRIV_VERSION_1_13_0,
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index e1e4f32698..fb7eebde52 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -136,6 +136,7 @@ struct RISCVCPUConfig {
      * TCG always implement/can't be user disabled,
      * based on spec version.
      */
+    bool has_priv_1_13;
     bool has_priv_1_12;
     bool has_priv_1_11;
 
-- 
2.34.1


