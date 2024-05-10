Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C416BC25B10
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 May 2024 06:53:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s5K8M-0001cj-PK; Fri, 10 May 2024 02:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s5K8L-0001ca-H3
 for qemu-riscv@nongnu.org; Fri, 10 May 2024 02:53:33 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s5K8J-0004ni-RM
 for qemu-riscv@nongnu.org; Fri, 10 May 2024 02:53:33 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1ee12baa01cso14046855ad.0
 for <qemu-riscv@nongnu.org>; Thu, 09 May 2024 23:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715324010; x=1715928810; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rYDRJr2Sli1gOcjJSn4QR8SIHpM0aP0XTZg/I/oH8oI=;
 b=BwIXbt4fMqyCs8e/jb7ZtPGKJdGxiqPqr5LP8g1LYWMRQg6MoHByB4Mg8DbUciBWe8
 6JK3jC8Hb3DuE7bAKR/+QHtjdCLe0Sg8mCI7yBHCzHk7UTp5JOVo+E+byfA7oi/J2leP
 wboUgybLhJIWbncVfxcLWZVqdRKr+l9uSwErJBT+dm+XzpEbS2tg0AFpfuJDe6DZIAul
 Qmc8ezRLzmBpQnt5KSfHHAu+OKYwt5KbEJo38Ehaa/mz56U8ve0XXOZ1bMP3XjRfLPEL
 InGdwAor7AZbJqjUsG+3TnSvnmFppJocqm2q8/j/l1pmxkqvvv+n559XHuWUIzVz2i8K
 6MRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715324010; x=1715928810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rYDRJr2Sli1gOcjJSn4QR8SIHpM0aP0XTZg/I/oH8oI=;
 b=O4WaD00KmlO3TARi6UbVcc04tLXKPjItkygYb81TJVLcbwTMOgkmFi6aRgW1iXisAh
 d2w8nqaIUMZjYTI7DTG2ilt/xLut5XZWhLYsEJdUQzcrvsu5VftyFNSmVGExXdhJ0wQl
 KwP+Mp3xml1kAd9otz7AV6FoWN3fPIKBC16lFU6d5z0Y9z+6sOg+gS2N06lwTZsNeQm1
 Xq8KtIoRNfVYz/Q6g2WKLnPC/xlg3WR8CulMF79214RyfVrgrDmpWlNJ2OlqNhomXPAt
 N+QfiKYRS1UH8eNVlYVBuq0Jt6+jdDD3nt3S7cb9EgijY9Pt+j+zQTfBEHlmYjMtAp4p
 EWqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt9T6zgD4sI0S/81fBUYXknQd5iKkLFzLQHYpPAm/OKtCHJB8c+f0Zc4kqKPhowEhmSUC573krIt7JyPB3BJ8nZMNRk04=
X-Gm-Message-State: AOJu0YzJ7bDJuRhTgJdW6hrgo521cIVbvsI62N/CrchCZOTllzIMqCMg
 7y1odCQ3BgOs2Ozbyw8AwiWlOK/NARfZcF66iwgxiChQKARD8RXYK1Kf6+6GR1A=
X-Google-Smtp-Source: AGHT+IFqSvcyZDzNEa8Xwql2/wnMqC8tb8/gVujYDB6CGU+TT1+FPPqwfdtPBMkX5M36O7kCeBCxxw==
X-Received: by 2002:a17:903:124b:b0:1ea:d979:d778 with SMTP id
 d9443c01a7336-1ef43c0fd92mr19470505ad.5.1715324010471; 
 Thu, 09 May 2024 23:53:30 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf31a7asm25579175ad.140.2024.05.09.23.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 23:53:30 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>, "Fea . Wang" <fea.wang@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH 1/5] target/riscv: Reuse the conversion function of priv_spec
 and string
Date: Fri, 10 May 2024 14:58:51 +0800
Message-Id: <20240510065856.2436870-2-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510065856.2436870-1-fea.wang@sifive.com>
References: <20240510065856.2436870-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x632.google.com
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

From: Jim Shu <jim.shu@sifive.com>

Public the conversion function of priv_spec and string in cpu.h, so that
tcg-cpu.c could also use it.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c         |  4 ++--
 target/riscv/cpu.h         |  3 +++
 target/riscv/tcg/tcg-cpu.c | 13 +++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a74f0eb29c..b6b48e5620 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1769,7 +1769,7 @@ static const PropertyInfo prop_pmp = {
     .set = prop_pmp_set,
 };
 
-static int priv_spec_from_str(const char *priv_spec_str)
+int priv_spec_from_str(const char *priv_spec_str)
 {
     int priv_version = -1;
 
@@ -1784,7 +1784,7 @@ static int priv_spec_from_str(const char *priv_spec_str)
     return priv_version;
 }
 
-static const char *priv_spec_to_str(int priv_version)
+const char *priv_spec_to_str(int priv_version)
 {
     switch (priv_version) {
     case PRIV_VERSION_1_10_0:
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e0dd1828b5..7696102697 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -829,4 +829,7 @@ target_ulong riscv_new_csr_seed(target_ulong new_value,
 uint8_t satp_mode_max_from_map(uint32_t map);
 const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
 
+const char *priv_spec_to_str(int priv_version);
+int priv_spec_from_str(const char *priv_spec_str);
+
 #endif /* RISCV_CPU_H */
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 4ebebebe09..faa8de9b83 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -76,16 +76,13 @@ static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
 
 static const char *cpu_priv_ver_to_str(int priv_ver)
 {
-    switch (priv_ver) {
-    case PRIV_VERSION_1_10_0:
-        return "v1.10.0";
-    case PRIV_VERSION_1_11_0:
-        return "v1.11.0";
-    case PRIV_VERSION_1_12_0:
-        return "v1.12.0";
+    const char *priv_spec_str = priv_spec_to_str(priv_ver);
+
+    if (priv_spec_str == NULL) {
+        g_assert_not_reached();
     }
 
-    g_assert_not_reached();
+    return priv_spec_str;
 }
 
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
-- 
2.34.1


