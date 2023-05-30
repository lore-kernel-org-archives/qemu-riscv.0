Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02682C77B7A
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 19:49:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q45Iv-0006WF-5U; Tue, 30 May 2023 15:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45It-0006Vx-TH
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:46:47 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45Is-0004GP-86
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:46:47 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6af7a84b2bdso3845119a34.2
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 12:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685476005; x=1688068005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v0QgfmmOTQ2l/zD/WXht/LWS0Z7ownvCJ8eez0uwFsI=;
 b=GixwYjuiNoxXAZYmdnS7x+OTU39Bn6VYOzeoDUkelxXfxxxmHJEMA29Y0VIDcALOCy
 PNHliPfhbkXyHj9/Gcz5iYcaXkjGnnVzm7zbit1UTnELepH4A6DsYm4NouRMbzzr2f2H
 FNENap3bYWj+LnXG/fiixJ/tcVKvZ+h8HwwzakEMcWKQ3OdjgcchfBCqQRKkvYNP/sJt
 0RLQ32JzLZ6WW+iuWayYPFSQue7VH7ZlXAEuncvd0nn10VmCklfYBg4roKRV4aJAUdXR
 6VfvLmYSbRIKlban/DppVkRGNo5/ONU293WF1tTNjMzgr8LIPZ0incq3TuHkcF0phCfF
 rr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685476005; x=1688068005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v0QgfmmOTQ2l/zD/WXht/LWS0Z7ownvCJ8eez0uwFsI=;
 b=Lx8Cs0Xwne/MnSmNfyj4e2PeeyW8zErLG3G5RKGFjoZBlpnoB0zmMwGyWAIQ5Og+sm
 Op79R7OspRo8wm25HSzLtth6DMcgszQgTzvKcFxLQBtt2hSpyLT0SdrZ9/Nzo9Z4LI6o
 zMyWcqIJ5I8i9xA9dC0EJZaklGnTEIZ9p4rablxwGNEO1Ky3T6psVzjjWCEkfV1miGY1
 mws1vsk5B+Dn4RQ8maTSAdgFGFvfYz++547wVZ9vrfgWHz1/t7NMhaXlbqiijAW2B6lv
 dyqCF3goYCY41C5kYFN5VWtFXgfhReed6JsHF0Xj6S1TpGxWCo6IVI+hlzm5EY8yGr+2
 0lOg==
X-Gm-Message-State: AC+VfDzih8rwqjubvRq3bZ5+h0ODiLPcTIKXi3JjppZWKNMrcgl2hA1d
 KyLurvtHW3BRnHPq2z7Ldk4Kaw==
X-Google-Smtp-Source: ACHHUZ68gt95iYDqZZtS/8qDTX4CCN4ERpOljBoCOerLM8H0UVIdjmD0z3+kVB4M75vMlnDdx/YhfQ==
X-Received: by 2002:a05:6870:e884:b0:19f:3567:a0b5 with SMTP id
 q4-20020a056870e88400b0019f3567a0b5mr1973103oan.34.1685476005140; 
 Tue, 30 May 2023 12:46:45 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (200-162-225-121.static-corp.ajato.com.br. [200.162.225.121])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056870a48300b0019fa8728b05sm342214oal.39.2023.05.30.12.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:46:44 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 04/16] target/riscv/cpu.c: restrict 'mimpid' value
Date: Tue, 30 May 2023 16:46:11 -0300
Message-Id: <20230530194623.272652-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530194623.272652-1-dbarboza@ventanamicro.com>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Following the same logic used with 'mvendorid' let's also restrict
'mimpid' for named CPUs. Generic CPUs keep setting the value freely.

Note that we're getting rid of the default RISCV_CPU_MARCHID value. The
reason is that this is not a good default since it's dynamic, changing
with with every QEMU version, regardless of whether the actual
implementation of the CPU changed from one QEMU version to the other.
Named CPU should set it to a meaningful value instead and generic CPUs
can set whatever they want.

This is the error thrown for an invalid 'mimpid' value for the veyron-v1
CPU:

$ ./qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,mimpid=2
qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.mimpid=2:
    Unable to change veyron-v1-riscv-cpu mimpid (0x111)

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bcd69bb032..ed3b33343c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -42,7 +42,6 @@
 #define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
                              (QEMU_VERSION_MINOR << 8)  | \
                              (QEMU_VERSION_MICRO))
-#define RISCV_CPU_MIMPID    RISCV_CPU_MARCHID
 
 static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
@@ -1724,7 +1723,6 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
     DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
-    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
 
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
@@ -1835,6 +1833,27 @@ static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
     cpu->cfg.mvendorid = value;
 }
 
+static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint64_t prev_val = cpu->cfg.mimpid;
+    uint64_t value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    if (!dynamic_cpu && prev_val != value) {
+        error_setg(errp, "Unable to change %s mimpid (0x%lx)",
+                   object_get_typename(obj), prev_val);
+        return;
+    }
+
+    cpu->cfg.mimpid = value;
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -1870,6 +1889,10 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
                               cpu_set_mvendorid,
                               NULL, NULL);
 
+    object_class_property_add(c, "mimpid", "uint64", NULL,
+                              cpu_set_mimpid,
+                              NULL, NULL);
+
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-- 
2.40.1


