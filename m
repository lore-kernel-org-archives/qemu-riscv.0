Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87550CC6B1D
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:43:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGvVq-0002pT-F9; Wed, 14 Oct 2026 05:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvVm-0002p1-SR
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:43:02 -0400
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvVj-0001j9-7G
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:43:02 -0400
Received: by mail-dl1-x122d.google.com with SMTP id
 a92af1059eb24-14394530ec6so2727907c88.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 02:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970977; x=1792575777; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zt4O6cH6itGslpdvLTM70yWl9Kh39depuXm/4+mt0R8=;
 b=NHrZtzHIs8RnobGPf0lzbyBkdd7kdrnqgT1MtydC/Wbk6pmYcc37R52uHJc1H+OGlx
 v7W1Q6GUuJxN+eGaGP5Jao8igP4HMZcyY+YiNzfklUlBGkO19PBhVbYaJud6EISAatuk
 zHkVmHcVJD/Mislf82d/UR7HnPjPDrvTRDc3ga0Uj8SNHT2jiB+S4J2MiQx5ICEF6mu5
 1Z7pc3ApiAElCoZzPCHEAMV++6WEcVm5VBY2i9PILhB/DN2h77a7dohRHc2EL7wp5DeW
 520wk1yDhmbnxMKiW73cCWrbwXaZJqc+Xqrrbb9DhF3zZ03VZzPu7qA2DsdIY96VfCTv
 QJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970977; x=1792575777;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zt4O6cH6itGslpdvLTM70yWl9Kh39depuXm/4+mt0R8=;
 b=TbWaSB65sLEPlQEV3RhTFpxW4vaHZE2/4K+KZ+1+1E3KNy5RXuSHEYGNdz6UsPEoqp
 jiIGQ+Eadc8LgQs1eO1pJRl01/gI+VpTp4zevHjaZtQ3F6WHJpriekl3QlZdK7ORlTpX
 Fz+UnSuLwHBp3PKsPxJe2fp4zcgBaZzJkjX7i+d5IaMDHRlpm8bEKvNrSDyBstnbmfcp
 pQxZGI5z0TzPmFyXUtQrtjAbfRS50Lo/7LTKwhRUQh2UjJ5+jtYgNb/QnZ6eaI6CEyKG
 9AXuUg8mO6jbH5/lGFNaQ4lWFLiqb0DNuhKM+gU4oWH01CWE3EKvrZ/3+VX2zXMAbQ+p
 nH7w==
X-Forwarded-Encrypted: i=1;
 AKwUvBy/sJ4J/ipT7d0s/ZwbRQpceCB6gS7KfGOVHAWqNHyTLOf3v/CNROkQJLQvpYFdZPOg/8ltOQUpJbw3@nongnu.org
X-Gm-Message-State: AFq9FYLOhsj7gJ3og9wV0I4jtkfs/dn5UvvUVpLRCsSCvwCND1/Nqf7U
 QjINvdKHk1kpeMp6VWZxaysZgs4GjbMlMibC9Um6uHC56UXSCR0ZeOG1
X-Gm-Gg: AYBFou2O1m/7dycsUnitM9SzdWyquY8s+DDV7Y0s3XipyQdxygagb4xm6p1U8LtBGGv
 9aClRVICbEvV69Z59bKFqk+vnBN2uvWdftAeixvJdIRu6Bqg5AVzi+IbUxccYmk4LEz+VKbe0px
 zbyJ8EGZzgj7nmzc25LNG1IjYPhzjGkOEPEDE1+hQsznmizsnKx5i/0ZYlkkcOumKliG+6XTuFZ
 KNayf0598dxASTGyJasnr7QQKhnegRswNLXYmAyqyiWTVTzGkBjz9eziuMBwppvUIZ5+hBk9ned
 /+S/RhNJtJgjJUwXGBG7w0Ae+3MbT/MwDV56nLqr7R342fbipnG/u+w9cZRtc6kOr6YG7ur6xIv
 4B2zI08Ddm3oNIg0vJ46dx41W1rx6zEgLvnwzrUOE6GnGJvTBfmDm3TWpAn9VZRpuXRthVYausV
 jOCv1ChursRqVv8VduGCU4B65gjlqch5eqPYo+dkdQ3ldAokOnH/fK+lewypqiLO/2n4rG5qC8U
 w4q78Ctx4V2Z3ecYQ==
X-Received: by 2002:a05:701b:2705:b0:168:3243:c937 with SMTP id
 a92af1059eb24-16a5fc9167bmr20167003c88.16.1791970976589; 
 Wed, 14 Oct 2026 02:42:56 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:42:55 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Eric Blake <eblake@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Fabiano Rosas <farosas@suse.de>,
 Song Gao <17746591750@163.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 18/34] machine: allow -M name to differ from QOM type
Date: Wed, 14 Oct 2026 17:41:33 +0800
Message-ID: <20261014094224.1976-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122d.google.com
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine.c        |  6 ++++++
 include/hw/core/boards.h | 12 +++++++++++-
 system/vl.c              |  8 +++-----
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 5c6f3cb0f68..bcf15079cb9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1222,6 +1222,12 @@ static void machine_class_init(ObjectClass *oc, const void *data)
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
index d7713c45836..6e5c8dac2d1 100644
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
@@ -274,7 +284,7 @@ struct MachineClass {
     /*< public >*/
 
     const char *family; /* NULL iff @name identifies a standalone machtype */
-    char *name;
+    char *name; /* -M name; default is QOM type without -machine */
     const char *alias;
     const char *desc;
     const char *deprecation_reason;
diff --git a/system/vl.c b/system/vl.c
index a7684abdd3a..e2bd65ebd40 100644
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
2.55.0.windows.3


