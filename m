Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6309CDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 19:58:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtCf2-0003pn-NX; Wed, 18 Oct 2023 15:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtCf0-0003pR-Nn
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 15:56:54 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtCey-0001c2-HJ
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 15:56:54 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c9d7a98abbso50375705ad.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 12:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697659011; x=1698263811; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=omkN3GoJPCyp9S7HvmY3Un4l534NY4W4OA1YH82yeVE=;
 b=XLQOLgqB1UBjPo1WbHliynYyMjTkDYy/QX74vDxnNm91JW+AhlxRRckRQYIriOIEDR
 V8FTeRn/yvZ1Om/wnF6jVGXbV8Nqp3xJz/RNPGq3R8wQGgc4jk5q+wBI9pAXZ6nbtzD/
 u0tAyFWZ7pfEWqeENdMbNZ/xAAYSLEWWkch/K0jtiC9uaS5ceOEY21xmZAc+yKryUrC6
 aLT+gEaJN6L4jSq0DYxuowQNAQiUZkrTvRncGwmGrKR9xCic/dXFb625Aj9Zw8hqQk+G
 U8lENKs7kvgcRU1uUlN1AxwSA3VooeZooII9qTJ+Qg7yT0uRGXa8n0O6ycgZFFB8vKYt
 C3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697659011; x=1698263811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omkN3GoJPCyp9S7HvmY3Un4l534NY4W4OA1YH82yeVE=;
 b=sv39UE69RTm/FpgTXk3s0J1QiWPRPnRy9tjuEsQlK/o+BetntXj/WymVWMt/66rD4L
 Q4vgK10a5hokz7xtYot62QVEpobegyqyzfqR6eAPPhKDlgTXe1lsTuJL4/SeudU8yytC
 zVOJdZ0ohuBVkaZnKVwFskFwvdaz/l0DxPNuVuv1BTqbNoYf0ed1yLTvM0Ly2ixcRbL6
 9Db6lQFXGylznDSSg1r5GpTKK1Q2XdcdjQ26d8VNE4m3k2r/H9JhexhUucDi7aj9LrWr
 tnSdrQXiQIaUjzJDwPczrdCS3o+xZItvbDFsvvwS+ZKxDAjaZiBzg8wSwMQ0J6edDwp5
 pCng==
X-Gm-Message-State: AOJu0Yw5LWCcMWNeBBipKNhyH/PsjL9xQfwssMr5yPENSeoxVtfqWj/O
 +ck3AZrGKtsLzX9oWMoZfuOp8Q==
X-Google-Smtp-Source: AGHT+IH1401w1hK9CgotOUuflFcKdZIc24LFbK/8mdl2mukkCZm2IaRf/AYN8l3d9EQEdp84740VXg==
X-Received: by 2002:a17:90a:4008:b0:27d:2054:27b1 with SMTP id
 u8-20020a17090a400800b0027d205427b1mr182206pjc.32.1697659011025; 
 Wed, 18 Oct 2023 12:56:51 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 ku12-20020a17090b218c00b00268b439a0cbsm256359pjb.23.2023.10.18.12.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 12:56:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 2/6] qapi,risc-v: add query-cpu-model-expansion
Date: Wed, 18 Oct 2023 16:56:34 -0300
Message-ID: <20231018195638.211151-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018195638.211151-1-dbarboza@ventanamicro.com>
References: <20231018195638.211151-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62b.google.com
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

This API is used to inspect the characteristics of a given CPU model. It
also allows users to validate a CPU model with a certain configuration,
e.g. if "-cpu X,a=3Dtrue,b=3Dfalse" is a valid setup for a given QEMU
binary. We'll start implementing the first part. The second requires
more changes in RISC-V CPU boot flow.

The implementation is inspired by the existing ARM
query-cpu-model-expansion impl in target/arm/arm-qmp-cmds.c. We'll
create a RISCVCPU object with the required model, fetch its existing
properties, add a couple of relevant boolean options (pmp and mmu) and
display it to users.

Here's an usage example:

./build/qemu-system-riscv64 -S -M virt -display none \
  -qmp  tcp:localhost:1234,server,wait=3Doff

./scripts/qmp/qmp-shell localhost:1234
Welcome to the QMP low-level shell!
Connected to QEMU 8.1.50

(QEMU)  query-cpu-model-expansion type=3Dfull model=3D{"name":"rv64"}
{"return": {"model": {"name": "rv64", "props": {"zicond": false, "x-zvfh": =
false, "mmu": true, "x-zvfbfwma": false, "x-zvfbfmin": false, "xtheadbs": f=
alse, "xtheadbb": false, "xtheadba": false, "xtheadmemidx": false, "smstate=
en": false, "zfinx": false, "Zve64f": false, "Zve32f": false, "x-zvfhmin": =
false, "xventanacondops": false, "xtheadcondmov": false, "svpbmt": false, "=
zbs": true, "zbc": true, "zbb": true, "zba": true, "zicboz": true, "xtheadm=
ac": false, "Zfh": false, "Zfa": true, "zbkx": false, "zbkc": false, "zbkb"=
: false, "Zve64d": false, "x-zfbfmin": false, "zk": false, "x-epmp": false,=
 "xtheadmempair": false, "zkt": false, "zks": false, "zkr": false, "zkn": f=
alse, "Zfhmin": false, "zksh": false, "zknh": false, "zkne": false, "zknd":=
 false, "zhinx": false, "Zicsr": true, "sscofpmf": false, "Zihintntl": true=
, "sstc": true, "xtheadcmo": false, "x-zvbb": false, "zksed": false, "x-zvk=
ned": false, "xtheadsync": false, "x-zvkg": false, "zhinxmin": false, "svad=
u": true, "xtheadfmv": false, "x-zvksed": false, "svnapot": false, "pmp": t=
rue, "x-zvknhb": false, "x-zvknha": false, "xtheadfmemidx": false, "x-zvksh=
": false, "zdinx": false, "zicbom": true, "Zihintpause": true, "svinval": f=
alse, "zcf": false, "zce": false, "zcd": false, "zcb": false, "zca": false,=
 "x-ssaia": false, "x-smaia": false, "zmmul": false, "x-zvbc": false, "Zife=
ncei": true, "zcmt": false, "zcmp": false, "Zawrs": true}}}}

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 qapi/machine-target.json      |  6 ++-
 target/riscv/riscv-qmp-cmds.c | 75 +++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index f0a6b72414..e5630e73aa 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -228,7 +228,8 @@
   'data': { 'model': 'CpuModelInfo' },
   'if': { 'any': [ 'TARGET_S390X',
                    'TARGET_I386',
-                   'TARGET_ARM' ] } }
+                   'TARGET_ARM',
+                   'TARGET_RISCV' ] } }
=20
 ##
 # @query-cpu-model-expansion:
@@ -273,7 +274,8 @@
   'returns': 'CpuModelExpansionInfo',
   'if': { 'any': [ 'TARGET_S390X',
                    'TARGET_I386',
-                   'TARGET_ARM' ] } }
+                   'TARGET_ARM',
+                   'TARGET_RISCV' ] } }
=20
 ##
 # @CpuDefinitionInfo:
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index 5ecff1afb3..2170562e3a 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -24,8 +24,12 @@
=20
 #include "qemu/osdep.h"
=20
+#include "qapi/error.h"
 #include "qapi/qapi-commands-machine-target.h"
+#include "qapi/qmp/qdict.h"
+#include "qom/qom-qobject.h"
 #include "cpu-qom.h"
+#include "cpu.h"
=20
 static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
 {
@@ -55,3 +59,74 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error *=
*errp)
=20
     return cpu_list;
 }
+
+static void riscv_obj_add_qdict_prop(Object *obj, QDict *qdict_out,
+                                     const char *name)
+{
+    ObjectProperty *prop =3D object_property_find(obj, name);
+
+    if (prop) {
+        QObject *value;
+
+        assert(prop->get);
+        value =3D object_property_get_qobject(obj, name, &error_abort);
+
+        qdict_put_obj(qdict_out, name, value);
+    }
+}
+
+static void riscv_obj_add_multiext_props(Object *obj, QDict *qdict_out,
+                                         const RISCVCPUMultiExtConfig *arr)
+{
+    for (int i =3D 0; arr[i].name !=3D NULL; i++) {
+        riscv_obj_add_qdict_prop(obj, qdict_out, arr[i].name);
+    }
+}
+
+CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType=
 type,
+                                                     CpuModelInfo *model,
+                                                     Error **errp)
+{
+    CpuModelExpansionInfo *expansion_info;
+    QDict *qdict_out;
+    ObjectClass *oc;
+    Object *obj;
+
+    if (type !=3D CPU_MODEL_EXPANSION_TYPE_FULL) {
+        error_setg(errp, "The requested expansion type is not supported");
+        return NULL;
+    }
+
+    oc =3D cpu_class_by_name(TYPE_RISCV_CPU, model->name);
+    if (!oc) {
+        error_setg(errp, "The CPU type '%s' is not a known RISC-V CPU type=
",
+                   model->name);
+        return NULL;
+    }
+
+    obj =3D object_new(object_class_get_name(oc));
+
+    expansion_info =3D g_new0(CpuModelExpansionInfo, 1);
+    expansion_info->model =3D g_malloc0(sizeof(*expansion_info->model));
+    expansion_info->model->name =3D g_strdup(model->name);
+
+    qdict_out =3D qdict_new();
+
+    riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_extensions);
+    riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_experimental_ex=
ts);
+    riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_vendor_exts);
+
+    /* Add our CPU boolean options too */
+    riscv_obj_add_qdict_prop(obj, qdict_out, "mmu");
+    riscv_obj_add_qdict_prop(obj, qdict_out, "pmp");
+
+    if (!qdict_size(qdict_out)) {
+        qobject_unref(qdict_out);
+    } else {
+        expansion_info->model->props =3D QOBJECT(qdict_out);
+    }
+
+    object_unref(obj);
+
+    return expansion_info;
+}
--=20
2.41.0


