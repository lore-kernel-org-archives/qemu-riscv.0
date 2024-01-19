Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A31C47DAF
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:22:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQmwP-0004ne-91; Fri, 19 Jan 2024 06:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rQmwL-0004lh-Bq
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:21:37 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rQmwI-0008U1-CB
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:21:36 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e86a9fbd9so6648005e9.1
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705663293; x=1706268093;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=meHfwEYbS6E+e0h+odVZXRTQRV6tLtgSbMqCs98rgEc=;
 b=hoaYMOOHSf+FRYLLFspgWf/I9Y3QhrKKCIC0yzaWnIsjEscBldw3GnzwvgKXkkCQ/G
 g66rAeH+dth2kIgMwSINaZgECHwHgU0H3/pXHh8zvDYGrxsjhxrZr1UbzbTKVeJwnnS6
 nMlTsihqCSGE0W84EpvILc2w07EEePB83wdCClYCNgKnxLFSy4O9WfEUINwfM6edpuGv
 VkdgBlrqeJ6U6iFTyTuimkJuIMUDvW19qT90rpgOkhgcrOUlTImaDhgj8kKLJMfnfxQH
 jEiWjuF/VL2JIYkQ3oyF2Cr1yBEI7QTFp5FcSJypDLrM8DU2IzNEcDB/fsa8Gb3Zz5fq
 e4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705663293; x=1706268093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=meHfwEYbS6E+e0h+odVZXRTQRV6tLtgSbMqCs98rgEc=;
 b=qmIEbYx1pjRi4UvsrsKdqy2C69iDBpfQ+II5yFzlRjIwr0KAZFNJIO4gJfn+ZAjWaU
 fxrq7SwsfG8uGEwM1p9BS6eYOVMu12ei3J7F7HOxub5+6jcNiu9lPbJqUGYCQxiN5gNh
 e5Evary/iWlG0MfGEhEM7DdFTXRRjvL79Yb5+6P19MgvrKsSP3em8rnwSeLHS1VcKBuS
 getWtuHzk3pzMYiDOrxnKS786OfS9LS3PgYf9o2BxIpsz+MIz+pmgmyvzffYhGvH0Mp3
 qrU7Bbuf9TdDfWczOf7Rx9PdbyytU9SuqAeVeNxGo2eskVOPl34UvXhxgvpht3dZKxN6
 F7Zw==
X-Gm-Message-State: AOJu0YwJ+tnmyg4HXfkcTV7HfzMh/K9h8Rej6Q7VZAlxLj97y2N7TRx3
 MNogbgBkZ0tG032Yx2RTiovb3lm6cXoygqVy+ivd2ynFCYN+Pn/09Ft0mfVNKqI=
X-Google-Smtp-Source: AGHT+IHfBCcuhIeSt6bmy9hebd77oXZYfwD5PCJc29IZ4wut0VWkKuB8OFi8MQ4+ivK+Dvw1SkJFRQ==
X-Received: by 2002:a05:600c:2205:b0:40e:8bb2:6bdc with SMTP id
 z5-20020a05600c220500b0040e8bb26bdcmr1449697wml.87.1705663292856; 
 Fri, 19 Jan 2024 03:21:32 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c4f1600b0040d6b91efd9sm32428067wmq.44.2024.01.19.03.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 03:21:31 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v2 1/2] target/riscv: Add Zaamo and Zalrsc extensions
Date: Fri, 19 Jan 2024 11:21:28 +0000
Message-ID: <20240119112129.20067-2-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119112129.20067-1-rbradford@rivosinc.com>
References: <20240119112129.20067-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

These extensions represent the atomic operations from A (Zaamo) and the
Load-Reserved/Store-Conditional operations from A (Zalrsc)

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c     | 5 +++++
 target/riscv/cpu_cfg.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8d3ec74a1c..604baf53c8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -103,7 +103,9 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_zihpm),
     ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
+    ISA_EXT_DATA_ENTRY(zaamo, PRIV_VERSION_1_12_0, ext_zaamo),
     ISA_EXT_DATA_ENTRY(zacas, PRIV_VERSION_1_12_0, ext_zacas),
+    ISA_EXT_DATA_ENTRY(zalrsc, PRIV_VERSION_1_12_0, ext_zalrsc),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
     ISA_EXT_DATA_ENTRY(zfbfmin, PRIV_VERSION_1_12_0, ext_zfbfmin),
@@ -1491,6 +1493,9 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
     MULTI_EXT_CFG_BOOL("x-ssaia", ext_ssaia, false),
 
+    MULTI_EXT_CFG_BOOL("x-zaamo", ext_zaamo, false),
+    MULTI_EXT_CFG_BOOL("x-zalrsc", ext_zalrsc, false),
+
     MULTI_EXT_CFG_BOOL("x-zvfh", ext_zvfh, false),
     MULTI_EXT_CFG_BOOL("x-zvfhmin", ext_zvfhmin, false),
 
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index fea14c275f..cc4c30244c 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -78,7 +78,9 @@ struct RISCVCPUConfig {
     bool ext_svnapot;
     bool ext_svpbmt;
     bool ext_zdinx;
+    bool ext_zaamo;
     bool ext_zacas;
+    bool ext_zalrsc;
     bool ext_zawrs;
     bool ext_zfa;
     bool ext_zfbfmin;
-- 
2.43.0


