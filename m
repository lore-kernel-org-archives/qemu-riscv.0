Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C598CCC6B1A
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:47:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGvWn-00049s-CC; Wed, 14 Oct 2026 05:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvWh-00040X-No
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:44:00 -0400
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvWf-000214-OH
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:43:59 -0400
Received: by mail-dl1-x1231.google.com with SMTP id
 a92af1059eb24-15dd124bbe7so7361621c88.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 02:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791971036; x=1792575836; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xH4HXArnI0iYFFjnxwL4/aBpDHYrDt+E6XMLGPgH69E=;
 b=bHxl9hxcGa40Q5aa/L5gGWORPveqbIClSD21ueN2Vvr8FVyMlF3VtBCsd62k+xurhM
 pG6ejelfkiXoqdCWcVZrWpsc78C/8uerij6vZkvYDTr2o9tQxGXLodhpenphQf5Vn7gg
 VZBD6BqgXOGTxHKfwMuScqmT3i4cn908Fv7jWNrUUSRTdFa7YMo8ICJuyvFeiVllS6FL
 rbLjByOvTiod5Zys9mGsRhi1g8MJXJULvPICGPjak5w7D6hdzp/fJbb5XvxJF1s2WRqP
 FXk67uVR4UNi9fFkP1xefa7nMXWdqcmsp9b3Knzcv5lB1Hi3eajgGU2vwTWG+ONFMdSP
 WVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791971036; x=1792575836;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xH4HXArnI0iYFFjnxwL4/aBpDHYrDt+E6XMLGPgH69E=;
 b=trzKrVree0ha6r0ujmAB//YqQf18vDScpEJ9g5EOi17XWDsi3XuOMj2lIHYYim6epI
 YiGJcMawow1bziNXmcTQYZ5o8i0e8zg2Q3IXjiCMoDoFTXtcG9mLqHPdbKTksoOchVbT
 WVNL5zGLjD8oPPPA4a/ld/k4aMty6dQNdn3lcpsWwwMBSOoLrTIVPiTGbZhmvhYyOs+H
 ZOiHLKfBj3oo/WeLDzvwpEkCxhMhMeu2aGwM5c+jCdkzcN3eGfooKecDH83jfuiZV6Ff
 qR4Q81wer7tNDRxXfhqoe1fjEA8hxlCt1sWmZZpZZkmGNjiG5UuAnXGS0xvqEoSjaWi6
 M2Yg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxxWs3/M+rPyw5TVpopgTYwCrTKI1xGOrDUUUGe+fR2ONvdVFso1pbGQJ1mEuW7oLYG+VrKaak0/lAv@nongnu.org
X-Gm-Message-State: AFq9FYLbBG45uov0jF01Bow8biH/pmgURO2fx5FTDVdsLSNDYIMLUGot
 nMw4kzrI6lew2joyaR3ZiRde6l8s4DNBf3uLtwKtHiTjyrxLvwcQreJC
X-Gm-Gg: AYBFou3nzdAr+bkh0dsu9B9QgIg7We7KZ60yqb2NySzTUqWgYqoFt09hi7YK9Yih04z
 M+Ok2ZAN1MEguMklSFAbdkiRZH7MZOL0ovpzpJTqoTqX1Hz0sAryYQg4X4rS39Y9JcG6SHISAhM
 g2/yt0owt8YxlCRLn6lp9pVRR/dW6gB+li2PGYD9dQNFu7ioFhMSgCjQKBi50UqKoGvY2ZkQNJO
 5OO9gS0b7nzPOp5cmlZKHghDv+ySbWxUhYpz5iANj9XDMjnhZAF4uhV21Qq8HqoYhh9zgc2P8lh
 Bg/707k4bMzlvZPnK7D+QdQqGwBpiBgajtTYYOWGUAKiUzp6mpfGjUSVEMk+YtJuIyj3WnjRVwP
 8n58Wu+URE36jUNqb2zWpyQRKE4ifJhkztJswVMBzCM8PgQKs3uxxitSgGdmJ1mwj9t7fBMG1GW
 O6aN/q/w+A3gSZJ+JBtcZwEOPFXPRDmthVZF8bDCP3oOYPIQXOR62HOICMORKw4tf33D0aJESIh
 PFH5tO+6jAaRWcdjg==
X-Received: by 2002:a05:7022:e884:b0:17e:6de6:6a1a with SMTP id
 a92af1059eb24-17e6de66ab6mr1572535c88.8.1791971036191; 
 Wed, 14 Oct 2026 02:43:56 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:43:55 -0700 (PDT)
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
Subject: [PATCH 24/34] hw/m68k/virt: use unique QOM name
Date: Wed, 14 Oct 2026 17:41:39 +0800
Message-ID: <20261014094224.1976-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1231;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1231.google.com
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

Set the parent and versioned QOM types to m68k-virt so M68K virt no
longer collides with other virt-machine types in one process. Keep
the -M / help / migration name as virt-* via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/m68k/virt.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index e52546e4fab..6f141488752 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/target-info.h"
 #include "qemu/units.h"
 #include "qemu/guest-random.h"
 #include "exec/target_page.h"
@@ -322,16 +323,19 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     mc->default_ram_id = "m68k_virt.ram";
 }
 
-static const TypeInfo virt_machine_info = {
-    .name         = MACHINE_TYPE_NAME("virt"),
-    .parent       = TYPE_MACHINE,
-    .abstract     = true,
-    .class_init   = virt_machine_class_init,
-    .is_available = target_m68k,
-};
+#define TYPE_M68K_VIRT_MACHINE \
+    (target_combined_binary() ? MACHINE_TYPE_NAME("m68k-virt") : \
+                                MACHINE_TYPE_NAME("virt"))
 
 static void virt_machine_register_types(void)
 {
+    const TypeInfo virt_machine_info = {
+        .name = TYPE_M68K_VIRT_MACHINE,
+        .parent = TYPE_MACHINE,
+        .abstract = true,
+        .class_init = virt_machine_class_init,
+        .is_available = target_m68k,
+    };
     type_register_static(&virt_machine_info);
 }
 
@@ -346,21 +350,24 @@ type_init(virt_machine_register_types)
         MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
         mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " M68K Virtual Machine"; \
         MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+        machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
         if (latest) { \
             mc->alias = "virt"; \
         } \
     } \
-    static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
-    { \
-        .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
-        .parent = MACHINE_TYPE_NAME("virt"), \
-        .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
-        .is_available = target_m68k, \
-    }; \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
+        const TypeInfo virt_machine_info = \
+        { \
+            .name = target_combined_binary() ? \
+                    MACHINE_VER_TYPE_NAME("m68k-virt", __VA_ARGS__) : \
+                    MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+            .parent = TYPE_M68K_VIRT_MACHINE, \
+            .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
+            .is_available = target_m68k, \
+        }; \
         MACHINE_VER_DELETION(__VA_ARGS__); \
-        type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
+        type_register_static(&virt_machine_info); \
     } \
     type_init(MACHINE_VER_SYM(register, virt, __VA_ARGS__));
 
-- 
2.55.0.windows.3


