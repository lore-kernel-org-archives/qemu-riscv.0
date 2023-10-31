Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D298C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 20:41:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxvWZ-0005H2-Kz; Tue, 31 Oct 2023 16:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxvWX-0005Fh-JH
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 16:39:41 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxvWV-0007Td-UH
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 16:39:41 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5a86b6391e9so60317477b3.0
 for <qemu-riscv@nongnu.org>; Tue, 31 Oct 2023 13:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698784779; x=1699389579; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9vkQpTeB3ayrchqiqPL77Nx2STXCsE/ldIKYWZcyJE=;
 b=JlDyGzgSwU1XyuBLRGl1vJrwLQP9TKPb1pyk20gKxnr3sZbdJmBQ0vs+WmQKReGrWI
 RAVtsrxHeJ4ze1nnlt58aOxQ8aj7sNqXb2paNjXnW73aOzKRuouDQakVKdsgtVY3x4UX
 Feya39/P9NdALEHewBEnRa/tE7dlHhiljdw++DWhX1BA0q2DVUqWfpr4tYx8wMe6jhSH
 yJyBGmPNAfdsszvnnDPD+8kJbNTbKAWp6KtWTOngaKzLXcWXvzANYQVUZvzqcEZO12AT
 w6lxg9QKhebeT9rssmDGnc2yPl3DWV4cM1i3xc+9CQJB8EObY+JCwawJyV0vCsxvU9x0
 wcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698784779; x=1699389579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9vkQpTeB3ayrchqiqPL77Nx2STXCsE/ldIKYWZcyJE=;
 b=ZlJuYcMa3EGQjfe3v1u3+KpgdHn85DV4aHY2T9G76qUL3RH97xAY4iaMEwvX+adnDf
 vxRSgz9BnhB5cz3KBpUNuDb6u4NoaFtteSv8ivfPoetmom5aM4wUJOClJGvT9p/0IMxS
 TAMak2zAYRz8KbzAM2rvvpACKQLb0h0vmpetXY6fXHx6mV+HUbwNa9aCx/RrE89yzgMM
 g/qmc2NlgTp8hwDbj9bYGcu5JSiXS1PEFVaxHBVApHjyJOTlnRNc/Xbu9sLuCsStSaUC
 6ZV3syt6/4oS5fuG1lRh0V7kxmQp88U4nv2sQ3dnmEGbtNsP0U4aJqDzuWiqN8hY/Fln
 DXjA==
X-Gm-Message-State: AOJu0YwDEJcKRFM4HltnI/pVy8TrknG/fPFkjf5E0aQlQK+iMI6uygvj
 GfgMlkH71XOUtpEVg7XJdySwopwJU0ivj+91znI=
X-Google-Smtp-Source: AGHT+IGPwu4QcYxyXUoK7wFAB0v1lRtK9r83QS5IQztM7F+vBY/vs1IqILj+26xYJPz5UckS67lipQ==
X-Received: by 2002:a81:b71f:0:b0:591:8d06:e4e8 with SMTP id
 v31-20020a81b71f000000b005918d06e4e8mr14744781ywh.38.1698784778814; 
 Tue, 31 Oct 2023 13:39:38 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 k1-20020a81ff01000000b005add997ae53sm1272802ywn.81.2023.10.31.13.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 13:39:38 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 06/16] riscv-qmp-cmds.c: expose named features in
 cpu_model_expansion
Date: Tue, 31 Oct 2023 17:39:06 -0300
Message-ID: <20231031203916.197332-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031203916.197332-1-dbarboza@ventanamicro.com>
References: <20231031203916.197332-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1136.google.com
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

Named features (zic64b the sole example at this moment) aren't expose to
users, thus we need another way to expose them.

Go through each named feature, get its boolean value, do the needed
conversions (bool to qbool, qbool to QObject) and add it to output dict.

Another adjustment is needed: named features are evaluated during
finalize(), so riscv_cpu_finalize_features() needs to be mandatory
regardless of whether we have an input dict or not. Otherwise zic64b
will always return 'false', which is incorrect: the default values of
cache blocksizes ([cbom/cbop/cboz]_blocksize) are set to 64, satisfying
the conditions for zic64b.

Here's an API usage example after this patch:

 $ ./build/qemu-system-riscv64 -S -M virt -display none
    -qmp tcp:localhost:1234,server,wait=off

 $ ./scripts/qmp/qmp-shell localhost:1234
Welcome to the QMP low-level shell!
Connected to QEMU 8.1.50

(QEMU) query-cpu-model-expansion type=full model={"name":"rv64"}
{"return": {"model":
    {"name": "rv64", "props": {... "zic64b": true, ...}}}}

zic64b is set to 'true', as expected, since all cache sizes are 64
bytes by default.

If we change one of the cache blocksizes, zic64b is returned as 'false':

(QEMU) query-cpu-model-expansion type=full model={"name":"rv64","props":{"cbom_blocksize":128}}
{"return": {"model":
    {"name": "rv64", "props": {... "zic64b": false, ...}}}}

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/riscv-qmp-cmds.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index 2f2dbae7c8..5ada279776 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -26,6 +26,7 @@
 
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine-target.h"
+#include "qapi/qmp/qbool.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qobject-input-visitor.h"
@@ -99,6 +100,22 @@ static void riscv_obj_add_multiext_props(Object *obj, QDict *qdict_out,
     }
 }
 
+static void riscv_obj_add_named_feats_qdict(Object *obj, QDict *qdict_out)
+{
+    const RISCVCPUMultiExtConfig *named_cfg;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    QObject *value;
+    bool flag_val;
+
+    for (int i = 0; riscv_cpu_named_features[i].name != NULL; i++) {
+        named_cfg = &riscv_cpu_named_features[i];
+        flag_val = isa_ext_is_enabled(cpu, named_cfg->offset);
+        value = QOBJECT(qbool_from_bool(flag_val));
+
+        qdict_put_obj(qdict_out, named_cfg->name, value);
+    }
+}
+
 static void riscv_cpuobj_validate_qdict_in(Object *obj, QObject *props,
                                            const QDict *qdict_in,
                                            Error **errp)
@@ -129,11 +146,6 @@ static void riscv_cpuobj_validate_qdict_in(Object *obj, QObject *props,
         goto err;
     }
 
-    riscv_cpu_finalize_features(RISCV_CPU(obj), &local_err);
-    if (local_err) {
-        goto err;
-    }
-
     visit_end_struct(visitor, NULL);
 
 err:
@@ -191,6 +203,13 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         }
     }
 
+    riscv_cpu_finalize_features(RISCV_CPU(obj), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        object_unref(obj);
+        return NULL;
+    }
+
     expansion_info = g_new0(CpuModelExpansionInfo, 1);
     expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
     expansion_info->model->name = g_strdup(model->name);
@@ -200,6 +219,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_extensions);
     riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_experimental_exts);
     riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_vendor_exts);
+    riscv_obj_add_named_feats_qdict(obj, qdict_out);
 
     /* Add our CPU boolean options too */
     riscv_obj_add_qdict_prop(obj, qdict_out, "mmu");
-- 
2.41.0


