Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8D0E7E654
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 18:41:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qlCzB-0007J0-I1; Tue, 26 Sep 2023 14:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlCz8-0007IA-BR
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 14:40:39 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlCz4-0006U9-46
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 14:40:37 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c61acd1285so37304915ad.2
 for <qemu-riscv@nongnu.org>; Tue, 26 Sep 2023 11:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695753631; x=1696358431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0XSgeSJnnKLgredxyHN7Vr6x9UEJtXe7wlJUBcuLMY=;
 b=bQ+9Vi/hx+O//lAT6ILXxmVO8dCATHWF6e9698wKkkidB7TtFw+mcBeGa3klrrAvv9
 tY22hTja6W7Bp7k0ECtuP1ZKYzOTOj9ddT9IPG2XlTxzg7p4HcuFZoz/VuNWvw0KcfpQ
 t+3qRV0wVWvk0IV3RfVCrZi9Ff+c7WrAtNZefW7wIADdwZrm7xaV2GcEngb4hwk29IJN
 u4t5pCa0BGYMwfS98bKv/Z9olBMm/dQeYoWNxv2D0vq40k+B2+w7rbR5fcTzuph795oJ
 I+e/46MS6T/2QiRx4J69fzc+h00EMBnQayV/epCrqmyqruFWnqtzJLlWyDpTkxcP39DW
 XNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695753631; x=1696358431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V0XSgeSJnnKLgredxyHN7Vr6x9UEJtXe7wlJUBcuLMY=;
 b=UJI+N1c3Fi8aHfr4AYdnWei2Uhw5Mr8YALd/dTWrAhc05S2q1G8XpSF/SSV0WB9n9t
 V2QBDfD0wdgXUgv7hRIdAlf3S0urPRja+MyAyhtC9ie7c+HM9crlSR2YoH+Vx+sJ/eXc
 IliY1ZTcLhJ9UUamywszKnq1Em1+ziqd/6JdIOP90Itlg03g62Q7Fn3L0OPX7BRWiCtq
 r3j6JgYz253rvuZQK5Eo9NJRU0oaAN+XeU9A9DGGTzASjK4qH/PK10BGxt6Om91YmuAU
 ivtSQZKZ4mHn7/rZK/7QHVV7lxj+6NY24Sx7jVzh2Q96KOjYS3cQ75+6sAd+voXIh4j6
 3HWA==
X-Gm-Message-State: AOJu0YzlSCNjqTg5PBD3D2FySs8bbIWxrEOVmahpDNZ1tDweQtv9ALj+
 o2nWQoMwublUSHMsfsXGD0zsqJ2ziep6pOLSmXk=
X-Google-Smtp-Source: AGHT+IEqbbOIBwMR4yJmT2WFWByf3zDinDhFkx5BLSf09eqHxeNEVS29LNzdFMejGt0RYKG+w6fZ+A==
X-Received: by 2002:a17:902:7d96:b0:1c5:f4c7:b4e4 with SMTP id
 a22-20020a1709027d9600b001c5f4c7b4e4mr8592601plm.39.1695753631681; 
 Tue, 26 Sep 2023 11:40:31 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 a11-20020a170902eccb00b001b9cdf11764sm11268306plh.31.2023.09.26.11.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:40:31 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 2/6] qapi,risc-v: add query-cpu-model-expansion
Date: Tue, 26 Sep 2023 15:40:15 -0300
Message-ID: <20230926184019.166352-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230926184019.166352-1-dbarboza@ventanamicro.com>
References: <20230926184019.166352-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


