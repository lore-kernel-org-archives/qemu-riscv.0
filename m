Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EA2C05024
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 21:39:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qj4tl-0005Hu-Ve; Wed, 20 Sep 2023 17:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qj4tk-0005H4-7g
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 17:38:16 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qj4ti-0006Yl-KB
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 17:38:15 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6c21b2c6868so208753a34.1
 for <qemu-riscv@nongnu.org>; Wed, 20 Sep 2023 14:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695245893; x=1695850693; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hx2unC6bkbnK4o1a4tu1Rh/59GQGOMC47WGlP68Q50I=;
 b=Ld6q3iKVJPTOKUR9U4tViy3UA2xGMMcOFSiteNVZ6+C9MfN9Cq1YARuR/qI+q5gO2I
 gLf4S736QQh271VgSHb9W17wjuretX3ULNMuZ+TWOMTdGdNJexG1UuRuKxkmtwXgRgyB
 bplwfw6PmT6poPSQoo0cfr28X9QvFdnR3OxiXYQt8lZlQGencWzXyRPxyG0oPL/s1o4y
 S2vpscDNiqLq9eZOHKxOsKlfJyTWdX3rpDBXcz7vvCyJhJLJ59e7e6YM7z8i8UqQQszD
 3ASOp9D2Sn+BhZNaZH5pvdZzrz+hi32I1h+tQmfMDBUw2T5bMGkEsehf4On2mO3ceuTP
 0J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695245893; x=1695850693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hx2unC6bkbnK4o1a4tu1Rh/59GQGOMC47WGlP68Q50I=;
 b=hDCzBePZLQt3ME/3OE5RmYl0X0SQuo2HPFCe4zUd2wgEk/ps67MaZvqt/WQABOjthW
 sxgeOfokxD3ClWGTbaZ9aurj6JLZfT1n9xmA/9n6p5UYX0nQTnHZrRWRvsYFEdpFWvlk
 nfw3Lazq0Xjl9fTHH0OZ1d2kFN+A0pLBr48gTOnZdRq1Gis7VRnsw6WQVj3QSKR0KyYp
 TZcVsyvRimlGknykHGRzk/I+fyY8Hj91o5CkoVksv/fCBC7wMpKwzSU0RVUqJdFRZV4T
 n9PX2FHygo00B2NujGD/dAA4Uj+3wmPPk9XT5wbhPQEgJffhqUnFvsqxA4GsATOnc5ZK
 flFg==
X-Gm-Message-State: AOJu0YxtY14JPd/lBbYd5+Dl5VAbuS2mNJSWsck066KkVzzPchkaVPHg
 imAiLXyunpjMJDe8k6mylfSGzw==
X-Google-Smtp-Source: AGHT+IHAbdJgwxcLYI9WO80PBIBUO00fg5Y2K1CMkoAkcd20AZdC32o/eNuFePPqEzKUlKFzZrpQ4g==
X-Received: by 2002:a05:6830:2059:b0:6bc:bd1a:26d with SMTP id
 f25-20020a056830205900b006bcbd1a026dmr3670368otp.15.1695245893673; 
 Wed, 20 Sep 2023 14:38:13 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 e1-20020a9d7301000000b006b83a36c08bsm64415otk.53.2023.09.20.14.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 14:38:13 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 8/8] target/riscv/riscv-qmp-cmds.c: check CPU accel in
 query-cpu-model-expansion
Date: Wed, 20 Sep 2023 18:37:43 -0300
Message-ID: <20230920213743.716265-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920213743.716265-1-dbarboza@ventanamicro.com>
References: <20230920213743.716265-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
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

Use the recently added API to filter unavailable CPUs for a given
accelerator. At this moment this is the case for a QEMU built with KVM
and TCG support querying a binary running with TCG:

qemu-system-riscv64 -S -M virt,accel=tcg -display none
    -qmp tcp:localhost:1234,server,wait=off

./qemu/scripts/qmp/qmp-shell localhost:1234

(QEMU) query-cpu-model-expansion type=full model={"name":"host"}
{"error": {"class": "GenericError", "desc": "'host' CPU not available with tcg"}}

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/riscv-qmp-cmds.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index 5b2d186c83..2f2dbae7c8 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -31,6 +31,8 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/visitor.h"
 #include "qom/qom-qobject.h"
+#include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "cpu-qom.h"
 #include "cpu.h"
 
@@ -63,6 +65,17 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     return cpu_list;
 }
 
+static void riscv_check_if_cpu_available(RISCVCPU *cpu, Error **errp)
+{
+    if (!riscv_cpu_accelerator_compatible(cpu)) {
+        g_autofree char *name = riscv_cpu_get_name(cpu);
+        const char *accel = kvm_enabled() ? "kvm" : "tcg";
+
+        error_setg(errp, "'%s' CPU not available with %s", name, accel);
+        return;
+    }
+}
+
 static void riscv_obj_add_qdict_prop(Object *obj, QDict *qdict_out,
                                      const char *name)
 {
@@ -161,6 +174,13 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
 
     obj = object_new(object_class_get_name(oc));
 
+    riscv_check_if_cpu_available(RISCV_CPU(obj), &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        object_unref(obj);
+        return NULL;
+    }
+
     if (qdict_in) {
         riscv_cpuobj_validate_qdict_in(obj, model->props, qdict_in,
                                        &local_err);
-- 
2.41.0


