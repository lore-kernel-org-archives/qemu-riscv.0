Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D89CC6B1F
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:44:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGvWf-0003pT-3h; Wed, 14 Oct 2026 05:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvWc-0003fC-Sq
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:43:54 -0400
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvWZ-0001zE-Pl
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:43:54 -0400
Received: by mail-dy1-x1334.google.com with SMTP id
 5a478bee46e88-30b6dad2382so9048367eec.0
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 02:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791971027; x=1792575827; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=synPi8hnFDON0bf/QeszSpYclzjkqZ5u8lY6d12QrFA=;
 b=qofgqE2dAD1vZmTunii07qV6aGlw+TBpUNOdNFa0gIHzeirFPzVg5UjOgPFLfg0VVe
 2fuKwm+EIep57oJ/wKYSqyZYXr9575RNwfienxveWBl52wFWVITwwgxkhEtNhPPx1TbG
 6v0KL84gsGf3i2wG8O83mYIyA+Aokab3QJ6/4wDHupaUVZT/kNeRsqiGdxrV5ahJaeTg
 AVnV56SeI4GE7/vZmRItykPtZzUBiagvGMKvmqEJcHxSyxNq9J7Fon7sHgemRmPdZJy8
 KTBPvcTmXk6qeFUt/QnAy9mKaEP/nEzVVP5i0PsI5bouLsqSGoIDKbK7QiKJ5zgHkQmg
 VzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791971027; x=1792575827;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=synPi8hnFDON0bf/QeszSpYclzjkqZ5u8lY6d12QrFA=;
 b=DPQ3vZ65BOm8AO8KZgh+qEWc+J9KRz4WIdJNlrK2OX1QDFowcQB5g/eq57u4v5UXC7
 17GANnQkspU8ShbOrfxB82tS2gZYy9S9d2IJDS5UoDYaT3/SJmEqWvqfjay2aqZ2GpMO
 1GsByR+RIhFtPUKoIQ9531BSXZwAkBzgb2E+27G8pgNF6mCsIHxwvA0XzQngneYN2lFd
 O7qn3R04K7CLTfcsBghlIZtcesno+ZhY9NlGx5U4PWlVDmiWafqiojZU+YbS23tZBwU1
 FEqcW7dfQjHv5Og/G5StdB1aCHTaJizJ/o0cf7iIUBh5sC5CiJTESwUOVw513tXJW8N8
 hTNw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxxGY3Q2t2+fSRVhY7wk8N3VWdUO7Ayzq3R2v0LG1h2+D93EUA4f8IZX8FbRWxUcs8z9PTaHyJY+6Ad@nongnu.org
X-Gm-Message-State: AFq9FYJQ/BwbKBdUR6ROoMyuf+WbvcBiFTEzBZhoBqOi+QcyU0lOsdPg
 7x150Hk4GqH4kmed58syK2mqcqnqzU94M0P76D3aMrn2WuHWyE7kAmvM
X-Gm-Gg: AYBFou2wgyBV4UqAI6R4iESnT8lC8qbo03iOBZfwqNK/lgoQfj4rGxYn3Hk8ZS4EM9C
 5KzlVWfsom2lCq+tp02TvGPhbY4qLGE6kVIynCcsUVXaCa69XH4VTCfTJTaOf/ZRHxOzNpa+p9w
 1woF9ma1OdZujg41IFa+Q3z0tenvOs+vTiQYcImwhJ1ounIazsxutUVIdUHxIXeiz9ysZyrHtvt
 PDkwJLyg1s3kHg8GxRujnF5AjENEFD+TDGRfktKOVrmqwtZzRMn+jKDzJCop513gWw2J/iwRrFQ
 G9sM9N70znc11dvZJ2AZ4n78HPdpuKSQMggm3eKabywEg70pojO9zN7tx5vv/CrPJLNMvgXL2fv
 jc3jM7Fxm8bTx7Xum1bfgHouqcRq0hZCvJmfVm1P3M7ICw1vU8mOGAk2X5k0jcmGAbYEf6OE96s
 6/bbwAw3nszdI9sftiPBTA1i/0j8BDnzIg8XZ+L/0ZIJ+GULju13u6KCN/t/DD5Rb841aupwdRn
 4argg2fU1IicUwQTQ==
X-Received: by 2002:a05:7022:3b87:b0:164:7bbe:b609 with SMTP id
 a92af1059eb24-16a611c0785mr24546593c88.38.1791971026715; 
 Wed, 14 Oct 2026 02:43:46 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:43:45 -0700 (PDT)
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
Subject: [PATCH 23/34] hw/loongarch/virt: use unique QOM name
Date: Wed, 14 Oct 2026 17:41:38 +0800
Message-ID: <20261014094224.1976-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1334;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1334.google.com
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

Set TYPE_LOONGARCH_VIRT_MACHINE to MACHINE_TYPE_NAME("loongarch-virt")
so LoongArch virt no longer collides with other virt-machine types in
one process. Keep the -M / help / migration name as virt-* via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/loongarch/virt.c         | 45 ++++++++++++++++++++-----------------
 include/hw/loongarch/virt.h |  5 ++++-
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 9c5371af9de..5ca992a5ac7 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -1543,21 +1543,24 @@ static void virt_class_init(ObjectClass *oc, const void *data)
         MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
         mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " LoongArch Virtual Machine"; \
         MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+        machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
         if (latest) { \
             mc->alias = "virt"; \
             mc->is_default = true; \
         } \
     } \
-    static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
-    { \
-        .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
-        .parent = TYPE_LOONGARCH_VIRT_MACHINE, \
-        .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
-    }; \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
+        const TypeInfo virt_machine_info = \
+        { \
+            .name = target_combined_binary() ? \
+                    MACHINE_VER_TYPE_NAME("loongarch-virt", __VA_ARGS__) : \
+                    MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+            .parent = TYPE_LOONGARCH_VIRT_MACHINE, \
+            .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
+        }; \
         MACHINE_VER_DELETION(__VA_ARGS__); \
-        type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
+        type_register_static(&virt_machine_info); \
     } \
     type_init(MACHINE_VER_SYM(register, virt, __VA_ARGS__));
 
@@ -1579,22 +1582,22 @@ static void virt_instance_finalize(Object *obj)
     g_free(lvms->oem_table_id);
 }
 
-static const TypeInfo virt_machine_info = {
-    .name           = TYPE_LOONGARCH_VIRT_MACHINE,
-    .parent         = TYPE_MACHINE,
-    .abstract       = true,
-    .instance_size  = sizeof(LoongArchVirtMachineState),
-    .class_init     = virt_class_init,
-    .instance_init  = virt_initfn,
-    .instance_finalize = virt_instance_finalize,
-    .interfaces = (InterfaceInfo[]) {
-        { TYPE_HOTPLUG_HANDLER },
-        { }
-    },
-};
-
 static void machvirt_machine_init(void)
 {
+    const TypeInfo virt_machine_info = {
+        .name = TYPE_LOONGARCH_VIRT_MACHINE,
+        .parent = TYPE_MACHINE,
+        .abstract = true,
+        .instance_size = sizeof(LoongArchVirtMachineState),
+        .class_init = virt_class_init,
+        .instance_init = virt_initfn,
+        .instance_finalize = virt_instance_finalize,
+        .interfaces = (InterfaceInfo[]) {
+            { TYPE_HOTPLUG_HANDLER },
+            { }
+        },
+    };
+
     type_register_static(&virt_machine_info);
 }
 
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index d39a9bbf5dd..9a5f6486c0f 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -9,6 +9,7 @@
 #define HW_LOONGARCH_H
 
 #include "hw/core/boards.h"
+#include "qemu/target-info.h"
 #include "qemu/queue.h"
 #include "hw/block/flash.h"
 #include "hw/loongarch/boot.h"
@@ -130,7 +131,9 @@ struct LoongArchVirtMachineState {
     bool highmem_mmio;
 };
 
-#define TYPE_LOONGARCH_VIRT_MACHINE  MACHINE_TYPE_NAME("virt")
+#define TYPE_LOONGARCH_VIRT_MACHINE \
+    (target_combined_binary() ? MACHINE_TYPE_NAME("loongarch-virt") : \
+                                MACHINE_TYPE_NAME("virt"))
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchVirtMachineState, LOONGARCH_VIRT_MACHINE)
 void virt_acpi_setup(LoongArchVirtMachineState *lvms);
 void virt_fdt_setup(LoongArchVirtMachineState *lvms);
-- 
2.55.0.windows.3


