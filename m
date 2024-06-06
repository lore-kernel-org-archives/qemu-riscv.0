Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4F2C27C54
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 13:50:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sFDV1-0000ma-1P; Thu, 06 Jun 2024 09:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sFDUw-0000l5-3f
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2024 09:49:46 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sFDUu-0008RT-0N
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2024 09:49:45 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-652fd0bb5e6so809045a12.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Jun 2024 06:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717681782; x=1718286582; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c+sRNeLw0Oc3KEegiQO3NZeVXjHYz6zZGIXv3DPKL8k=;
 b=JQcX8ZJHxjsgr9+W84t+dXmvstiM6+VjE1dUdeHxFs7EERKpmgEHgRiFC9FNjhfhTr
 aPzfSzzN3fxPRyBbxnyVFVLTHHvI1B0IsxUFIhfwMX1rGca5E4wAKPTaIG6ooHPcmukL
 QqaPFpgl4aSVnOGS6lQSf/gOtchZ2FRsRSUFn+Fsyo2G3h7gDhB0oRfWYp3FFxa8Uhnb
 OdLjurC7E0WNakMq60p+5s9wZFBja9Mmdr1Lv/HhRl88ieVMiTjqUWFQ5+bbgZ7yr/Sm
 Bh5bNYuNKp/vy6polNg0AE/QaLFW5Wak6T1+Th8SE3Y/3sEIVXJAeIWA3rQUFlTBMDxz
 QgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717681782; x=1718286582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+sRNeLw0Oc3KEegiQO3NZeVXjHYz6zZGIXv3DPKL8k=;
 b=UG6fhC5dSLDN01KNxHJo9P7aFUY3qlmG0UKuWW1bIleDEvU7MRsnMUTKLf/tEi4Zab
 9BjohCkfrptiVDuVI9cXybNkh/ogvjQ53rwVNXThcLpjkilzZugmeVCBhX42wbN8RjUV
 YlRaRMLu7kJvYZtkYPOVK4Rvx4BKsBSmjKJAjxnKzT5DLgg1Nm4R/lb8QRLMOQ3G+qUs
 6jpyXFY2wlZNJaFwS3GjmYlBA0td20BMoAJaV88GKFIbs0RSyldZ30UUgvHMaHCNxVfr
 KRn/NDwSF/fppjBL568KBmGn3fGlROm7j45Fqhpm6Olbv3UYCrGEXCKWUynTt2dOrmaW
 pzYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtczH858JXd7yvCMe+oU6xRSF1ZkXIpgovY6sXmYaet69mNz42ujLbk069CT6sFV6nfWrfYAaXSnDFiHsHcs9f9H/UDYk=
X-Gm-Message-State: AOJu0YxwOq66q2b+0So4KEWCVJAM4jY4oH1GqR3n4I/cDsF2IEyqFkMJ
 /w78MmR7bzmhhkAASGgec87GLqsyoljLtbBVAQygwL2ThLHwl6meN6HEpBzMF5k=
X-Google-Smtp-Source: AGHT+IELhspcQsg36QdpnPxjtGkKYygH2G2XvCBNipdO/WEWZ20vrvIhmhtrAjGRLHzrneYXKQU7gA==
X-Received: by 2002:a05:6a20:f381:b0:1af:fa18:76f0 with SMTP id
 adf61e73a8af0-1b2b7601884mr5566291637.55.1717681782393; 
 Thu, 06 Jun 2024 06:49:42 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-703fd50bc86sm1150919b3a.175.2024.06.06.06.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 06:49:41 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>,
 "Fea . Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v4 1/6] target/riscv: Reuse the conversion function of
 priv_spec
Date: Thu,  6 Jun 2024 21:54:49 +0800
Message-Id: <20240606135454.119186-2-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606135454.119186-1-fea.wang@sifive.com>
References: <20240606135454.119186-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x532.google.com
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

From: Jim Shu <jim.shu@sifive.com>

Public the conversion function of priv_spec in cpu.h, so that tcg-cpu.c
could also use it.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c         |  2 +-
 target/riscv/cpu.h         |  1 +
 target/riscv/tcg/tcg-cpu.c | 13 ++++---------
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 69a08e8c2c..fd0f09c468 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1790,7 +1790,7 @@ static int priv_spec_from_str(const char *priv_spec_str)
     return priv_version;
 }
 
-static const char *priv_spec_to_str(int priv_version)
+const char *priv_spec_to_str(int priv_version)
 {
     switch (priv_version) {
     case PRIV_VERSION_1_10_0:
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6fe0d712b4..b4c9e13774 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -830,4 +830,5 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
 /* Implemented in th_csr.c */
 void th_register_custom_csrs(RISCVCPU *cpu);
 
+const char *priv_spec_to_str(int priv_version);
 #endif /* RISCV_CPU_H */
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index fa8a17cc60..4c6141f947 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -76,16 +76,11 @@ static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
 
 static const char *cpu_priv_ver_to_str(int priv_ver)
 {
-    switch (priv_ver) {
-    case PRIV_VERSION_1_10_0:
-        return "v1.10.0";
-    case PRIV_VERSION_1_11_0:
-        return "v1.11.0";
-    case PRIV_VERSION_1_12_0:
-        return "v1.12.0";
-    }
+    const char *priv_spec_str = priv_spec_to_str(priv_ver);
 
-    g_assert_not_reached();
+    g_assert(priv_spec_str);
+
+    return priv_spec_str;
 }
 
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
-- 
2.34.1


