Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1B8C982D2
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 00:09:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7M83-0006cg-L9; Thu, 17 Sep 2026 20:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7M81-0006cJ-My
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:06:58 -0400
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7M80-0004rY-2i
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:06:57 -0400
Received: by mail-pz2-x10.google.com with SMTP id
 d2e1a72fcca58-8693af0d7c4so214397b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789690014; x=1790294814; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qhnt2dJkpAm5GGzTe4QbVNjnCDc43sqrIBCwyZpio2Y=;
 b=lBWvr1Nu8rtsaBvfJryI5Cak1knOPQm+5tecJHcRtcjhsQljc7l+vcPE6hcq7ZpZSK
 j/mC16lj/cLQSp+MRy55Py96EPods82LlTAhZCVMTa3hoyV4fpIAA+1HH8HNkWptT5Lj
 eNnFxJD6YoDHrUEdNYtHkKh6210EmaV0atEUHO1//o4NKX7Wokvf4f8kaqjvN08ANlcY
 1hn3y/+rjUgTjQiiOKce8jREtepNHEK+1dvxLgOPtxJPASKWOeqCU5IRZVVngaLa5sDE
 0GgO2n59Cln4/LsT+LdmLdxevHIYDJDkODa0hCcWKW6ZixoAYcKBo4wvVCDYW8miD4Op
 kv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789690014; x=1790294814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qhnt2dJkpAm5GGzTe4QbVNjnCDc43sqrIBCwyZpio2Y=;
 b=dIGd0H8eeoF/prGj4lTxF5S5WJuoS3djGV5CqwKuOtibyB4IdP6CdwWhhneV9d5vTM
 QIHQOPsvR3FdnaEXYzkgPJvpQnbuHjBlGkgSgd9FCabU6IEd/5iI7jwe+l6N4N3huyuK
 JHBm+VGOuTalSHE2vriuLAKz/RLMw5zaQG5/JUmol/SpRyhS1DsHX8mPAIV8Cun6rHTK
 gDgzGbtgJDQZkv5h6L3XKCqKLFSFjZ6NppcOnqOpH4L/XUgOhd4meGzoeXOGtqqmZtLW
 ECTxNnUojO8HarUXvR3NVjTodiRYTTHQMnXFLoaxQmjk/CFGC1UFVcrT2GVu9fXWVxIc
 jE+g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxj4zmv4/UsylKC4VhQkqhIDFcg0mQX0bE+2nEtJqpqGoE0hmiRRNuY7TfE6vSimlN2KSKBePSnyYO7@nongnu.org
X-Gm-Message-State: AFuF++l2kIvFYJdtloMXlW904t+te9vP/SWAyerIYBN28L4ydFo6IFxL
 VM0dBA8d2KrOXR0aQKGOoIyXaS0iW+s68uAUp0fpWU9rGHCYyG8H5wiH
X-Gm-Gg: AYBFou0YbpRIsNM3VIVAOo5JvowpfQtu4iL1DG9cqtt/L4piczTJksvMhfs7gH1w9+K
 7/aN6lbLTSD5YxuKaKiTvdnzfYYy0hZoGHkqUwjMzLhVYdX+qlvORoBICzupClPrdaUdwtKhX2u
 FUppTkS9xxo82bPq98gXtP9kQ2uK1eYPthQGCPgRJHmgLpt39DnZc4gg5o1+0zacmYok4e+DwPP
 PA6nUL8D6LlWkvNpQWtRteTATnXvfzMsDcDcrDwKU/Ya/uyaV7vlAku2SliqXwtKgMTbsyH8822
 jfHdT9T9fsS0y1E6LLH14UjNQT1ssAs3PUU+IgQ+cU8MdnuxZJLHmDyXK8Bm47y9mr0OO6NfAQv
 Xd2KeRJQsdzIEl1PuhfpgERT7d1mh2A0tZcooGzV4c++zj4cmQOCo5F2RFF/XJx9zhjdvEYmT9e
 A+oOpjOfo4eRDTc/lo5gMrwe59+uanEdTxoELcT9twv1D0dDzGijTnIuL/5d9zRBP8Q7DSgGrtx
 kKKZW5Yl0OnULB1BWhnDGSe5KU5xJe9
X-Received: by 2002:a05:6a21:596:b0:3d1:deec:9265 with SMTP id
 adf61e73a8af0-3dd8c3f2321mr1152234637.6.1789690014513; 
 Thu, 17 Sep 2026 17:06:54 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33bf5b1d335sm20328212eec.28.2026.09.17.17.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:06:53 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <17746591750@163.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 1/8] machine: allow -M name to differ from QOM type
Date: Fri, 18 Sep 2026 08:06:32 +0800
Message-ID: <20260918000640.1001-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918000640.1001-1-luoyonggang@gmail.com>
References: <20260918000640.1001-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-pz2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

- Add machine_class_set_name() so boards can keep a stable -M name
  when the QOM type is uniquified. machine_class_base_init still
  defaults the name to the QOM type without -machine.
- Document that MachineClass::name is the -M name, not the QOM type.
- Sort -M help by MachineClass::name so order matches the printed names
  when QOM types are prefixed (arm-virt-11.1-machine vs virt-11.1).

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/core/machine.c        |  6 ++++++
 include/hw/core/boards.h | 12 +++++++++++-
 system/vl.c              |  8 +++-----
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8939ae16666..3cca243c3cb 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1215,6 +1215,12 @@ static void machine_class_init(ObjectClass *oc, const void *data)
         "Memory size configuration");
 }
 
+void machine_class_set_name(MachineClass *mc, const char *name)
+{
+    g_free(mc->name);
+    mc->name = g_strdup(name);
+}
+
 static void machine_class_base_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
diff --git a/include/hw/core/boards.h b/include/hw/core/boards.h
index dba465efc2c..d397ffb3c2c 100644
--- a/include/hw/core/boards.h
+++ b/include/hw/core/boards.h
@@ -36,6 +36,16 @@ const char *machine_default_cpu_type(const MachineState *ms);
  * @mc: Machine class
  */
 const char *machine_class_default_cpu_type(MachineClass *mc);
+/**
+ * machine_class_set_name: Set the -M name when it differs from the QOM type
+ * @mc: Machine class
+ * @name: Name used by -M lookup, help, and migration
+ *
+ * machine_class_base_init sets MachineClass::name from the QOM type with
+ * the -machine suffix removed. Call this from board class_init when the
+ * CLI name must stay stable after the QOM type is uniquified.
+ */
+void machine_class_set_name(MachineClass *mc, const char *name);
 
 void machine_add_audiodev_property(MachineClass *mc);
 void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp);
@@ -269,7 +279,7 @@ struct MachineClass {
     /*< public >*/
 
     const char *family; /* NULL iff @name identifies a standalone machtype */
-    char *name;
+    char *name; /* -M name; default is QOM type without -machine */
     const char *alias;
     const char *desc;
     const char *deprecation_reason;
diff --git a/system/vl.c b/system/vl.c
index 9bd7664b85c..456b3a8e10d 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1538,10 +1538,9 @@ static gint machine_class_cmp(gconstpointer a, gconstpointer b, gpointer d)
     if (mc1->family == NULL) {
         if (mc2->family == NULL) {
             /* Compare standalone machine types against each other; they sort
-             * in increasing order.
+             * in increasing order by the name shown in -M help.
              */
-            return strcmp(object_class_get_name(OBJECT_CLASS(mc1)),
-                          object_class_get_name(OBJECT_CLASS(mc2)));
+            return strcmp(mc1->name, mc2->name);
         }
 
         /* Standalone machine types sort after families. */
@@ -1560,8 +1559,7 @@ static gint machine_class_cmp(gconstpointer a, gconstpointer b, gpointer d)
     }
 
     /* Within the same family, machine types sort in decreasing order. */
-    return strcmp(object_class_get_name(OBJECT_CLASS(mc2)),
-                  object_class_get_name(OBJECT_CLASS(mc1)));
+    return strcmp(mc2->name, mc1->name);
 }
 
 static void machine_help_func(const QDict *qdict)
-- 
2.52.0.windows.1


