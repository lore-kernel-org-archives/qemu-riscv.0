Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887D0C3DA41
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 21:42:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHAEZ-0004qY-QO; Wed, 05 Jul 2023 17:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAEY-0004q2-89
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 17:40:22 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAEW-0001dh-CC
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 17:40:21 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1b3da531a56so99208fac.1
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 14:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688593219; x=1691185219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qoye68O0i1yEKW8VfAgtj15Ya8kYL4Awy2Enb7ifSQs=;
 b=AmNPh8JVW0uUayISjKLiHt8w4NypkVPJvn492AtuWqK1PFhXyZDXmDwMxCUj48Kfc1
 cauX1CK3h3Kue6u5gZLHFRMEZVLzjrOAXddmpbRTVaZNiTvEYRrF+EO1HNMo/PL0n1Mk
 WB78nHRgeILLT/1/RQ4XvmMtHzHlk91bT+9eHL242KU03+ohIAykBnQiVeBmrZHHAXDC
 yXAj2NBlY3lIyr9QHIRG5cyNJ9cTuUuCVU8qyE3vC2c0i+c5J0dEvuoL/7qJ7iXqyf/Y
 n0k0Bsjqf0YHgvP9xkkpQ5MH6u8jHUgSD2PZ9KzLfjC6EMjAk5SX1pQ69XO0dx5tuopV
 SRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688593219; x=1691185219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qoye68O0i1yEKW8VfAgtj15Ya8kYL4Awy2Enb7ifSQs=;
 b=lFArJzkIbdN3EVusSNcXOKB9+OxT2goGE7T59TWE0opiIJvQMIABgygiE4yAJqbsFD
 Hc/UJc3b5hI7iNjPDrQJxTFUf9JRMNXTIZm8N8blbzll2hK2MPfjZE3Q0Z66d6uaBRpp
 a02SEmiTNRjesZ5KfHmm42opv7tkr3GYcnlwiizCuFqD40zuyVTbMuES4TNF5dE3Y+1A
 8dLJN1zToFjGo6gEudYG9ew5bXdY4r4yuVTLXcgm0gz73oTKaDcY7cjTSTydDorjjhuQ
 ZihLdlUrV9BnA2qs6Kd3wVRWl6ftP3KYLYeYdHqX6W+cz4CkXkF1geHETTxdmgREP2D/
 0o+Q==
X-Gm-Message-State: ABy/qLbIvFP2GLNmZzAqzHfv90XcFMGqj3VuJB7BhPqQOza50vZK/BJQ
 INfMkKToBh9orfhcOjla4F+qkw==
X-Google-Smtp-Source: APBJJlF9XFirpjIOVtGBsQdZGiPcwYwx7Uw2nxpZP/GInFLlxk6ja8N+L7EIBQXKJRGbVdwQ18MjdQ==
X-Received: by 2002:a05:6870:c152:b0:1b0:59dd:e265 with SMTP id
 g18-20020a056870c15200b001b059dde265mr218887oad.57.1688593219112; 
 Wed, 05 Jul 2023 14:40:19 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a4add01000000b0056665a16536sm70764oou.30.2023.07.05.14.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 14:40:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 05/20] target/riscv/cpu.c: restrict 'marchid' value
Date: Wed,  5 Jul 2023 18:39:40 -0300
Message-ID: <20230705213955.429895-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705213955.429895-1-dbarboza@ventanamicro.com>
References: <20230705213955.429895-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
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

'marchid' shouldn't be set to a different value as previously set for
named CPUs.

For all other CPUs it shouldn't be freely set either - the spec requires
that 'marchid' can't have the MSB (most significant bit) set and every
other bit set to zero, i.e. 0x80000000 is an invalid 'marchid' value for
32 bit CPUs.

As with 'mimpid', setting a default value based on the current QEMU
version is not a good idea because it implies that the CPU
implementation changes from one QEMU version to the other. Named CPUs
should set 'marchid' to a meaningful value instead, and generic CPUs can
set to any valid value.

For the 'veyron-v1' CPU this is the error thrown if 'marchid' is set to
a different val:

$ ./build/qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,marchid=0x80000000
qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.marchid=0x80000000:
    Unable to change veyron-v1-riscv-cpu marchid (0x8000000000010000)

And, for generics CPUs, this is the error when trying to set to an
invalid val:

$ ./build/qemu-system-riscv64 -M virt -nographic -cpu rv64,marchid=0x8000000000000000
qemu-system-riscv64: can't apply global rv64-riscv-cpu.marchid=0x8000000000000000:
    Unable to set marchid with MSB (64) bit set and the remaining bits zero

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 477f8f8f97..9080d021fa 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -39,11 +39,6 @@
 #include "tcg/tcg.h"
 
 /* RISC-V CPU definitions */
-
-#define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
-                             (QEMU_VERSION_MINOR << 8)  | \
-                             (QEMU_VERSION_MICRO))
-
 static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
 struct isa_ext_data {
@@ -1811,8 +1806,6 @@ static void riscv_cpu_add_user_properties(Object *obj)
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
-    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
-
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
@@ -1959,6 +1952,56 @@ static void cpu_get_mimpid(Object *obj, Visitor *v, const char *name,
     visit_type_bool(v, name, &value, errp);
 }
 
+static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint64_t prev_val = cpu->cfg.marchid;
+    uint64_t value, invalid_val;
+    uint32_t mxlen = 0;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    if (!dynamic_cpu && prev_val != value) {
+        error_setg(errp, "Unable to change %s marchid (0x%" PRIu64 ")",
+                   object_get_typename(obj), prev_val);
+        return;
+    }
+
+    switch (riscv_cpu_mxl(&cpu->env)) {
+    case MXL_RV32:
+        mxlen = 32;
+        break;
+    case MXL_RV64:
+    case MXL_RV128:
+        mxlen = 64;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    invalid_val = 1LL << (mxlen - 1);
+
+    if (value == invalid_val) {
+        error_setg(errp, "Unable to set marchid with MSB (%u) bit set "
+                         "and the remaining bits zero", mxlen);
+        return;
+    }
+
+    cpu->cfg.marchid = value;
+}
+
+static void cpu_get_marchid(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    bool value = RISCV_CPU(obj)->cfg.marchid;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -1996,6 +2039,9 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     object_class_property_add(c, "mimpid", "uint64", cpu_get_mimpid,
                               cpu_set_mimpid, NULL, NULL);
 
+    object_class_property_add(c, "marchid", "uint64", cpu_get_marchid,
+                              cpu_set_marchid, NULL, NULL);
+
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-- 
2.41.0


