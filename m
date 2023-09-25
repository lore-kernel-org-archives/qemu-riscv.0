Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F76BCE7AB1
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 18:00:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkpqI-0000nG-Fh; Mon, 25 Sep 2023 13:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkpqH-0000mb-28
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:57 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkpq4-0002D4-KF
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:56 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-277336b8717so1868904a91.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 10:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695664663; x=1696269463; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LFmj37VtPhwmOBy897ThcZlVlGy4D5lwpNW6ScnFALE=;
 b=RkiTx4AqmIEhfCz7dm9pSPXdE11P94luf6IP0h7ueA1DXKBkzwEHQfMbQdpSyKVgKz
 6McwyZ5HxDB0bXXGv9WfiXZ+4jdpDdWub7Y+D/hZE/key4bSigaSouimArUwqE+NerED
 WWGomL2tTZIWT8CvneVTWlnc/ZHAuEVShVZCQaOYNeuAI+wuQvTwxGnNWzYb3A6PizlI
 kepPTMFq+V+EgLD/af09LhKmcHPILOQ7aCNwcXYQg5/HfisV/L72h5IM3N06d2FtuR8w
 iWyEflT5cwrPeuo7//NFg8AQv6JcgWlOoU93qGOMquem4N63h4uZdqlCUSUNw79Lqmtt
 NUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695664663; x=1696269463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LFmj37VtPhwmOBy897ThcZlVlGy4D5lwpNW6ScnFALE=;
 b=FiCb4/9F2q8W7sA8tM7dHkZdvARlc/aTQ5oax713pnxAJiWj2q+QQrkn6ifO/Jpcc7
 aWP071sK/KB37+f5XIvSem8Y7e1lOaE64K+LCpwIggBoRBFySiDoyPI9yeyc1jwW1G0W
 Wu/AZu7mpb8KdF9BxBocSTzT3Tv1cBRTK6ekJ1EKGjw0ThYLVVHwF/Du7cGSH18IqwN6
 4jJPD12o3C+GpkBlQlyOlHT/LlYj14+qTsBl9K8MUACW+ZqrDi/ZJ3x+dOO1ArCzgThu
 6S4A53ayUVw8PW3c79FHQ0iaLn6RnIkqK5vm/KCnnMejI3I4jmvGBEwGSTkbAGmkHRWQ
 Javg==
X-Gm-Message-State: AOJu0YyLTT78XxrbPx/IP+9xfbjYBwatv+CkYEwaQdxO6UCTR1d3ktVv
 FXn5EQ9pSrZSCx/q7udODpk4qmK7plazPgPthZI=
X-Google-Smtp-Source: AGHT+IGqQHgJ7qWTODKF7WmWKwesNpQxwbqxDCVYPHpUk71GKI9XsiQGlUnn8+OYzgHlNPOyKugkEQ==
X-Received: by 2002:a17:90a:f109:b0:274:c637:4b97 with SMTP id
 cc9-20020a17090af10900b00274c6374b97mr5237841pjb.16.1695664663423; 
 Mon, 25 Sep 2023 10:57:43 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 i3-20020a17090a65c300b00262ca945cecsm3312722pjs.54.2023.09.25.10.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 10:57:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 09/19] target/riscv: make riscv_add_satp_mode_properties()
 public
Date: Mon, 25 Sep 2023 14:56:59 -0300
Message-ID: <20230925175709.35696-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925175709.35696-1-dbarboza@ventanamicro.com>
References: <20230925175709.35696-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This function is used for both accelerators. Make it public, and call it
from kvm_riscv_cpu_add_kvm_properties(). This will make it easier to
split KVM specific code for the KVM accelerator class in the next patch.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 5 ++---
 target/riscv/cpu.h | 1 +
 target/riscv/kvm.c | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0dc9b3201d..50be127f36 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1115,7 +1115,7 @@ static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
     satp_map->init |= 1 << satp;
 }
 
-static void riscv_add_satp_mode_properties(Object *obj)
+void riscv_add_satp_mode_properties(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
 
@@ -1589,12 +1589,11 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
 static void riscv_cpu_add_user_properties(Object *obj)
 {
 #ifndef CONFIG_USER_ONLY
-    riscv_add_satp_mode_properties(obj);
-
     if (kvm_enabled()) {
         kvm_riscv_cpu_add_kvm_properties(obj);
         return;
     }
+    riscv_add_satp_mode_properties(obj);
 #endif
 
     riscv_cpu_add_misa_properties(obj);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9dc4113812..cb13464ba6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -726,6 +726,7 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
 extern Property riscv_cpu_options[];
 
 void riscv_cpu_add_misa_properties(Object *cpu_obj);
+void riscv_add_satp_mode_properties(Object *obj);
 
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index e682a70311..e5e957121f 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -1323,6 +1323,7 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
     DeviceState *dev = DEVICE(obj);
 
     riscv_init_user_properties(obj);
+    riscv_add_satp_mode_properties(obj);
     riscv_cpu_add_misa_properties(obj);
 
     riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
-- 
2.41.0


