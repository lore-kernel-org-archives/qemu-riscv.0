Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECE5606A31B
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PMfWEsr0
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLf7K-0003Dv-Pl; Tue, 27 Oct 2026 07:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7I-0003CK-JF
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:13:20 -0400
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7G-0002vQ-Ui
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:13:20 -0400
Received: by mail-dl1-x122e.google.com with SMTP id
 a92af1059eb24-1a3c08d6928so1384432c88.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 04:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099597; x=1793704397; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=65RqURJMvc+L/nAMQdvkbZXrbEP0r76RON8s7SLwv20=;
 b=PMfWEsr0ev6OO6V6c5m4gQIipXA5zMSMD6vat3JdrkNzbcVGWFscxk9XHXEfGw6SSJ
 syNrqXBeXjCv6zIvnlyefsALpK3s7L8veoJzH5CTIkNpWi4lKTxbp98SDJRtor2jOG2A
 tAE92OnL8oiIkqPTizUrT5s9OQwu02tTJRG6SiA6thIf6IJfsVoGcbF2azE5tLS3YoKW
 G1l4vbFMau9aJ899B0VsD/1Ex2erjA7VMLoPXaa/SsHi/7IEhN2T7HPYhPfQxeJTaSKx
 9lGrMTFGamfPynwJzGqCJ97qk5i5dsvvMSlrt9bBvhEdbSrcKq4OgpzjXjcqpXqiaoyT
 hHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099597; x=1793704397;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=65RqURJMvc+L/nAMQdvkbZXrbEP0r76RON8s7SLwv20=;
 b=uIjskcTyW5wN3PpksqU1DqrUegQ8n/NOPlDrY3t0MvkyKrQDk9CekSnF+55w4IIAPI
 qDJW71e8I5Dvgyw3ZieGCV1AjSqc1li5SiKtWZDDl4Robo+vCDHbNI0iRBACl94io158
 o1cjdPYR7I4fzzj1M++bv1nEv7c863LUamlyZ8iPsOHbMzgoNgrPoubXPHZB9H5EeBA0
 /kSqCN5nLgcP+irIUZBCDo2PE7wLjqPS6Sv9N6bxhgQOwCzclFT09eRBC1dAgaHV7tNt
 IaK4p/U7miQLVzcCQzm0Oqz8f6OCbjBgoCJ/G1yXCgXmAzArOG1rb5chBgWSgxr1ZwUJ
 F0cA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzVQioQkvP4U5CNzOahyyHIoQTvRECdbbF5afwcm2JsrSeOLtZgY3iwnSRjb7dbzIiCgtbtOnYVendL@nongnu.org
X-Gm-Message-State: AFq9FYIYRL8Qn5ztpMwRJtj8up0Vq5hxg6mtDN7SlmCiVvaTYC0sUXsE
 BYAdkyOx2RrY9iwL+J+9HAadNq9AkFg5OEzWN5R2Y2Rlp6JgxXuXD99E
X-Gm-Gg: AYBFou1RALncAXBLgh4OtCWE7KobcyBszrsbjnBB2fEVJkm6FPveDhasbrONybD+Qbh
 KRc9WL3Xqjtf3ter0dZTh/K1ulnkdNFSd1GvWOpLItJ4WzACe08g97fWkek4kFpv3O4EPhJHAib
 UdSbdjgHdNCzyXk+7GtSS9gNusLMMZOjGJSHIxb6R/SuGrP63nbjMrmwGku4olZsorrS21Qs3aa
 2A1rd/cY+0f7NYcyJMt8IRW1Q9F3kOfFiFT+yeHTglvX70U5iDWVhCHReTB/2HrG3gRlYP7/ahE
 OHYC6DE7OPavZgEpZmSxhpGK62eRtk7ubaWRNIzzY7oOUSqlbhGnIWgTJwdxqcsEruuJzmQ2Kg4
 GH/nXE47MWQi1G99NGX/PcGUE81pLRzWYEA0TnrMdVXpCB+wg3f+MlavtDE6jZPQaNxmeKBA3M2
 kB+kiRzaRdLdYZMGZaGOkPmjCYNxuVtG+ZHm4IFD6t3UruxMbFZNR9UO9uSuHLXsUNR46l1y28n
 C6s1pxG8SMvS6zhXdZzxu3Ln/Yi+VFxaYwquugZt+lGozRvqv70zc7OBruQULXnhG5+1bSz+/1L
 wLOMnSnOVzUui4/tPy9Hgz+D/aWVmIhBmob1oXnZc5ksdlt/jYXyr+BQ1OEcOQ==
X-Received: by 2002:a05:701b:42cd:10b0:190:af51:d56c with SMTP id
 a92af1059eb24-19936d40791mr14230975c88.31.1793099597243; 
 Tue, 27 Oct 2026 04:13:17 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:13:16 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Song Gao <17746591750@163.com>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eric Blake <eblake@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 08/17] machine: allow -M name to differ from QOM type
Date: Tue, 27 Oct 2026 19:12:06 +0800
Message-ID: <20261027111216.392-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- Add machine_class_set_name() so boards can keep a stable -M name
  when the QOM type is uniquified. machine_class_base_init still
  defaults the name to the QOM type without -machine.
- Document that MachineClass::name is the -M name, not the QOM type.
- Sort -M help by MachineClass::name so order matches the printed names
  when QOM types are prefixed (arm-virt-11.1-machine vs virt-11.1).

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine.c        |  6 ++++++
 include/hw/core/boards.h | 12 +++++++++++-
 system/vl.c              |  8 +++-----
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d9ac4b419a3..9c897cddbd6 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1219,6 +1219,12 @@ static void machine_class_init(ObjectClass *oc, const void *data)
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
index d0e4ad98201..db2d0137fc1 100644
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
index 468a9fc247a..0d52c5d0a46 100644
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


