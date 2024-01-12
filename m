Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A78C47DA6
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 14:04:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOI7C-00041j-Qp; Fri, 12 Jan 2024 09:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOI7A-00040n-PD
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 09:02:28 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOI78-0005r6-S5
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 09:02:28 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d4ca2fd2fbso37190245ad.2
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 06:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705068146; x=1705672946; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=di00vhBKsSZDlg6WkglKu0DdymzljpcChw9HjOV50Tc=;
 b=FiamW92/txqaAkXT9NNKp0zPmJnXwaOStlm9hMefxqHlM8idiDzPGCsJtQK9BT3ikk
 XNY5n3TbXNdHtuRRbrmhVM6crJCJLhYfRwCxqSiYmWgbIg/MmioeS8R+xpYbtA7kPyec
 bEG84TC0XEuFLlJdl2KVLwtln+bnrYtW+lRU2vfPm6/rITE1C9j7ELJMR5pZ5hX5uNvZ
 XfEIfZi0QMJYDLaPFtdcWWmo+x6AkTqnsnWEqFA02TD6R4FsQM9Yp+18e5o5GbPzTjRm
 0dXw1YOhLlMZvTxv6rPz0JUdbToM0bkLMoZbqsc3kNl6vHjSGt2N14wUgpuS6xqED+Is
 jcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705068146; x=1705672946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=di00vhBKsSZDlg6WkglKu0DdymzljpcChw9HjOV50Tc=;
 b=Yq1Rp76F+HU8CYISm1S2jc8w+dma9tgpHBgb0s+ibMS1XvoKRnxsgcI0gj5ly6095x
 3WifQ5o1egWZg1aeolm4tP37aE7QRaXILQezkv8ErIsYbwwJbbpRe0bWl0M11g4ZWTAS
 q9TH6ejr9dF0KbymVu07nKqJ7hqw8nnBHLhuv5V/YHSJu7IYvxw6o3S+l5xBaPOf3Soz
 8zsTILDLxQKemqcxfP1hXJPw/nWPHNvcQFosxhHxtzMIdbbKyITfF/lsT8mxnrV/jSJH
 4RQDiIi2c06EEi6hTTdE6mBeqbMbDJiimFLzxSEoEcb8wbEZpxiEviXT8aPJTB+3INSU
 zhTg==
X-Gm-Message-State: AOJu0YxXiRojwlwfhKm5pfl/Ntdb9I1DM/PkERRLsw0RmP0p8LJorhDF
 EcDJs/mVnvnjEk+oSrt9vzzdn1dT86wqQg==
X-Google-Smtp-Source: AGHT+IEdlDd4qzphxdpeurAd8xoOaMClXCtER240QxTHhLv3MJL1YIxuZr7NEjLAepq9iAM678/8xw==
X-Received: by 2002:a17:902:c3c1:b0:1d5:7a46:920f with SMTP id
 j1-20020a170902c3c100b001d57a46920fmr746086plj.18.1705068145721; 
 Fri, 12 Jan 2024 06:02:25 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a1709028c8500b001cf6453b237sm3116927plo.236.2024.01.12.06.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:02:25 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Vladimir Isaev <vladimir.isaev@syntacore.com>
Subject: [PATCH v5 5/8] target/riscv: remove riscv_cpu_options[]
Date: Fri, 12 Jan 2024 11:01:58 -0300
Message-ID: <20240112140201.127083-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112140201.127083-1-dbarboza@ventanamicro.com>
References: <20240112140201.127083-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62b.google.com
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

The array is empty and can be removed.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
---
 target/riscv/cpu.c         | 5 -----
 target/riscv/cpu.h         | 1 -
 target/riscv/kvm/kvm-cpu.c | 9 ---------
 target/riscv/tcg/tcg-cpu.c | 4 ----
 4 files changed, 19 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ce4fdfaf0e..be5fa13df1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1980,11 +1980,6 @@ static const PropertyInfo prop_cboz_blksize = {
     .set = prop_cboz_blksize_set,
 };
 
-Property riscv_cpu_options[] = {
-
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 /*
  * RVA22U64 defines some 'named features' or 'synthetic extensions'
  * that are cache related: Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2dc28429e6..0ed6879a9b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -790,7 +790,6 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_named_features[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[];
-extern Property riscv_cpu_options[];
 
 typedef struct isa_ext_data {
     const char *name;
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 748a690b73..4dec91740b 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1527,19 +1527,10 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
 static void kvm_cpu_instance_init(CPUState *cs)
 {
     Object *obj = OBJECT(RISCV_CPU(cs));
-    DeviceState *dev = DEVICE(obj);
 
     riscv_init_kvm_registers(obj);
 
     kvm_riscv_add_cpu_user_properties(obj);
-
-    for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
-        /* Check if we have a specific KVM handler for the option */
-        if (object_property_find(obj, prop->name)) {
-            continue;
-        }
-        qdev_property_add_static(dev, prop);
-    }
 }
 
 /*
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index daff0b8f60..ea68182426 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1301,10 +1301,6 @@ static void riscv_cpu_add_user_properties(Object *obj)
     riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
 
     riscv_cpu_add_profiles(obj);
-
-    for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
-        qdev_property_add_static(DEVICE(obj), prop);
-    }
 }
 
 /*
-- 
2.43.0


