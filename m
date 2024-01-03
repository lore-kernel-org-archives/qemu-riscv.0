Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC60C4707C
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:49:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5Ex-0005cw-2S; Wed, 03 Jan 2024 12:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5Er-0005MX-Iw
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:41:12 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5Ep-0001mn-Lv
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:41:09 -0500
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5ceb02e2a56so780469a12.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704303666; x=1704908466; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=56T0F2BPs0Wr6zApRAMz+ioprbzwkEkciuAtikBAF/0=;
 b=TgoGeM4mVrPE02MOdsFeVnvhnFlvx3/CU6X+FI2IiysqCo94z8g9quivNcxxbQiNEZ
 hK9Cs0S0sHzc6gU0/SO2NkosF6+gPYp91f8o2ugxw3A+vlOZH5ktg8/9r4aWck8C8EFV
 XW0b9pXj4VFhSUswuDYi9a5ePD63K59EC+e8wvKwtnhI8a1HPc2EdK8skELwE4Gs88w6
 XYKoDjmQLoY7+CC/zD9u26S7RgFodNoMYxbHlQ0i29b1+RvV+LIejuD0/el18Bs7srlR
 A0FgglwL88nPMuldyr40KMNCR1ma1tFhNNnIPR3Isy1WZ3jOdaD+C6f7bpuJQyY+6xG2
 wcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303666; x=1704908466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=56T0F2BPs0Wr6zApRAMz+ioprbzwkEkciuAtikBAF/0=;
 b=I1Cy843CVV6+NiJCaoUFeLvbhZewIHpRw+Dhbv4D+hpJCoF4we+AYDFiaA+Q6kylew
 WqVN/aHkya3cYT5aWs4lIrJqlrRsFHGKodT7r6Jm8GgjMqGCjNrDRMWHcaAPciMlNYCp
 jnKZOssJrHDc4hI2nHGg3LCVGUbgcMDHe3soc2s4rSTB8jhA0QOdq+EVcYUi0LGgZdTI
 zE9rBGjEbTQhaausVVSi1amVvU8a2TjhcmeAA7w/g7LhXyq3YXvBwkCWCy9t+PnTRxTD
 gdzLQ2fQA9IE3ihddn+eA7OFZuWfAy+S77DIh+BGzGAkBX01wq7gvy+rmJhiEVG/oA+7
 c3dw==
X-Gm-Message-State: AOJu0YweXOlZD1ovCJwjHiWnaqpYy9ELBtxAln58vvMtOBBK5KKCSule
 0tOa4AlC07ioII8Yr2BP6N+FNx93S4amrw==
X-Google-Smtp-Source: AGHT+IHqvESecQYYKGdl26/ISgcPLgAT68BHBw7XWX9E4seRiTzEPf+jaBJ2TQ4rWyqrRCPBn4vfBA==
X-Received: by 2002:a05:6a20:9717:b0:196:e00:29f8 with SMTP id
 hr23-20020a056a20971700b001960e0029f8mr5824163pzc.32.1704303666036; 
 Wed, 03 Jan 2024 09:41:06 -0800 (PST)
Received: from grind.. ([189.79.21.107]) by smtp.gmail.com with ESMTPSA id
 v3-20020aa78503000000b006d7f1ae421csm24042050pfn.145.2024.01.03.09.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:41:05 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, vladimir.isaev@syntacore.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 13/16] target/riscv: remove riscv_cpu_options[]
Date: Wed,  3 Jan 2024 14:40:10 -0300
Message-ID: <20240103174013.147279-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103174013.147279-1-dbarboza@ventanamicro.com>
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52c.google.com
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
---
 target/riscv/cpu.c         | 5 -----
 target/riscv/cpu.h         | 1 -
 target/riscv/kvm/kvm-cpu.c | 9 ---------
 target/riscv/tcg/tcg-cpu.c | 4 ----
 4 files changed, 19 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e35b73e40..0d0197a8ef 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1894,11 +1894,6 @@ static const PropertyInfo prop_cboz_blksize = {
     .set = prop_cboz_blksize_set,
 };
 
-Property riscv_cpu_options[] = {
-
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 484c32e607..59e23708d1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -773,7 +773,6 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_extensions[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[];
-extern Property riscv_cpu_options[];
 
 typedef struct isa_ext_data {
     const char *name;
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 137a8ab2bb..5800abc9c6 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1443,19 +1443,10 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
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
 
 void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 84064ef7e0..d3eeedc758 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -889,10 +889,6 @@ static void riscv_cpu_add_user_properties(Object *obj)
     riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
 
     riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
-
-    for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
-        qdev_property_add_static(DEVICE(obj), prop);
-    }
 }
 
 /*
-- 
2.43.0


