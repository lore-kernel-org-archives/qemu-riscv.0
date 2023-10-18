Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA96CCDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 19:58:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtCf7-0003rS-Jv; Wed, 18 Oct 2023 15:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtCf6-0003r0-70
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 15:57:00 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtCf4-0001ck-Eg
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 15:56:59 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-27d2b814912so4327836a91.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 12:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697659017; x=1698263817; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIAf4nnuF3OFMrBHbJCzXvrh0kuUQuGTETn7XZtITBo=;
 b=Th67jkldiGFBX3Kap6mZp/tQQvFmlgm55mDHnndHA27kD19bMzW2oxQ4H00QIJcFzs
 gXqdNz1zHA9j3EOWe5sQvKHeDYiQtbzle3HfE+kBaI+8P4Q/DO6ZmQh+L9wW+1TRuU0E
 AzeMdmRTbd5lRUAeR0oDvyAMyEUk9pPenFlHG87M+loS6vPzLDsYHKyAuig4irMjTEA3
 yNCcrTpM7x1dTAnfWWmCcE7F+yONbOdI8oAJ4PxDgYbgPW6FuJHbJWp7ZTgSe+Sz88v4
 xL0THCBg8FpYA90yT9FrYXLbafMAJWMqCRThWYOpTHg5KIM4LVqRGLb/qAcbS6589Rh1
 1+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697659017; x=1698263817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qIAf4nnuF3OFMrBHbJCzXvrh0kuUQuGTETn7XZtITBo=;
 b=SRDzt8pT4xNjuhQcyD7RzfE1Cr4DlyMuIVaBf1Aqkth4Dlv6l5o+uCz600tL+RQ5RL
 76L7sJIHh6ajN3CK17eYaUX0Xxp0TD0muQ6nv0IV1nDUDSmd0v3HlJ5vVhJajjo02CgO
 +KQBYRqmMJiP68pk26PtHoKhVVfy7RumbE9Weu8VWpNq0mey5Nk/SL6YkwXIOO3NbZoZ
 A0LLDFS3pf3Tj/2VJR8PI4DDo5NYrEm8T+hgpe4CUw6WaENVaizpQG7AWZHmD5AeWTye
 RqzpsmAoAIHEjOawk8CjmFMrASaNUlL6kapb748zHmwUhqeMtwRkzI0P39L45HXiz5IY
 DhVQ==
X-Gm-Message-State: AOJu0Yx/xGIY8VLXcX8vdzgV3iIGYu2oVp/+uR3c7ODAMJk9fkJtYQuY
 7UnBj9mkeAYX1lmdNU3nCRxcEQ==
X-Google-Smtp-Source: AGHT+IEAVWFCGSlUlfvnHl04fdsNYY9p3Pxwjcg6gEf3mmo/ZxrcscWc0arY2CGUz8+0cPJAC6HUfQ==
X-Received: by 2002:a17:90b:230a:b0:27d:4129:ecd9 with SMTP id
 mt10-20020a17090b230a00b0027d4129ecd9mr180202pjb.26.1697659017141; 
 Wed, 18 Oct 2023 12:56:57 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 ku12-20020a17090b218c00b00268b439a0cbsm256359pjb.23.2023.10.18.12.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 12:56:56 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 4/6] target/riscv: handle custom props in
 qmp_query_cpu_model_expansion
Date: Wed, 18 Oct 2023 16:56:36 -0300
Message-ID: <20231018195638.211151-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018195638.211151-1-dbarboza@ventanamicro.com>
References: <20231018195638.211151-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1035.google.com
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

Callers can add 'props' when querying for a cpu model expansion to see
if a given CPU model supports a certain criteria, and what's the
resulting CPU object.

If we have 'props' to handle, gather it in a QDict and use the new
riscv_cpuobj_validate_qdict_in() helper to validate it. This helper will
add the custom properties in the CPU object and validate it using
riscv_cpu_finalize_features(). Users will be aware of validation errors
if any occur, if not a CPU object with 'props' will be returned.

Here's an example with the veyron-v1 vendor CPU. Disabling vendor CPU
extensions is allowed, assuming the final config is valid. Disabling
'smstateen' is a valid expansion:

(QEMU) query-cpu-model-expansion type=full model={"name":"veyron-v1","props":{"smstateen":false}}
{"return": {"model": {"name": "veyron-v1", "props": {"zicond": false, ..., "smstateen": false, ...}

But enabling extensions isn't allowed for vendor CPUs. E.g. enabling 'V'
for the veyron-v1 CPU isn't allowed:

(QEMU) query-cpu-model-expansion type=full model={"name":"veyron-v1","props":{"v":true}}
{"error": {"class": "GenericError", "desc": "'veyron-v1' CPU does not allow enabling extensions"}}

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/riscv-qmp-cmds.c | 65 +++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index 2170562e3a..5b2d186c83 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -27,6 +27,9 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/visitor.h"
 #include "qom/qom-qobject.h"
 #include "cpu-qom.h"
 #include "cpu.h"
@@ -83,14 +86,58 @@ static void riscv_obj_add_multiext_props(Object *obj, QDict *qdict_out,
     }
 }
 
+static void riscv_cpuobj_validate_qdict_in(Object *obj, QObject *props,
+                                           const QDict *qdict_in,
+                                           Error **errp)
+{
+    const QDictEntry *qe;
+    Visitor *visitor;
+    Error *local_err = NULL;
+
+    visitor = qobject_input_visitor_new(props);
+    if (!visit_start_struct(visitor, NULL, NULL, 0, &local_err)) {
+        goto err;
+    }
+
+    for (qe = qdict_first(qdict_in); qe; qe = qdict_next(qdict_in, qe)) {
+        object_property_find_err(obj, qe->key, &local_err);
+        if (local_err) {
+            goto err;
+        }
+
+        object_property_set(obj, qe->key, visitor, &local_err);
+        if (local_err) {
+            goto err;
+        }
+    }
+
+    visit_check_struct(visitor, &local_err);
+    if (local_err) {
+        goto err;
+    }
+
+    riscv_cpu_finalize_features(RISCV_CPU(obj), &local_err);
+    if (local_err) {
+        goto err;
+    }
+
+    visit_end_struct(visitor, NULL);
+
+err:
+    error_propagate(errp, local_err);
+    visit_free(visitor);
+}
+
 CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
                                                      CpuModelInfo *model,
                                                      Error **errp)
 {
     CpuModelExpansionInfo *expansion_info;
+    const QDict *qdict_in = NULL;
     QDict *qdict_out;
     ObjectClass *oc;
     Object *obj;
+    Error *local_err = NULL;
 
     if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
         error_setg(errp, "The requested expansion type is not supported");
@@ -104,8 +151,26 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         return NULL;
     }
 
+    if (model->props) {
+        qdict_in = qobject_to(QDict, model->props);
+        if (!qdict_in) {
+            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
+            return NULL;
+        }
+    }
+
     obj = object_new(object_class_get_name(oc));
 
+    if (qdict_in) {
+        riscv_cpuobj_validate_qdict_in(obj, model->props, qdict_in,
+                                       &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            object_unref(obj);
+            return NULL;
+        }
+    }
+
     expansion_info = g_new0(CpuModelExpansionInfo, 1);
     expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
     expansion_info->model->name = g_strdup(model->name);
-- 
2.41.0


