Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788FD606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jfn6TTjR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLf7s-0004Wv-Te; Tue, 27 Oct 2026 07:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7r-0004PW-31
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:13:55 -0400
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7o-00030g-DS
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:13:54 -0400
Received: by mail-dy1-x132e.google.com with SMTP id
 5a478bee46e88-35d0be18c71so1053269eec.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 04:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099631; x=1793704431; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=btLk+S0aD8e45UQK67teiRaxfy02k4IhOuVdPTMsEiE=;
 b=jfn6TTjRSHDNUFL6XMjU6G6lAhRa5t5o4jgez1eTZRhWdMSVcm0l0fmYkCQ3J0fFoF
 fRyLv//84caN3ONjGJrgSuJgbnork6RbVlhOVqV/5kabWXvlcJ/E9FN+JQQa90xugNWs
 g31mQTFJ+uTgzRM0t8yDm4dSfQIKApizCBFUKXL0KZWKkVIOG6WE9hn0EEeDOxcaIZ/K
 9q+xWQQqj+4aTdDthQPOE0BgVz+wi5hrkQGH3RqdIDHAznRnqPSpD+kDt4GYnOQ717Jo
 5Xa8f9VlukJJfYlIIynkt/2EaICnLmryFbENAA4OjtPgX5xElOsMOy1SgCR9LXdzbqRW
 YZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099631; x=1793704431;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=btLk+S0aD8e45UQK67teiRaxfy02k4IhOuVdPTMsEiE=;
 b=OhGHEJ3gp6dXFfOcmjBy21iLVkCkFZVlq/eLg65o+ZN0ojRdOzHpMbE/rqCNkq7C2a
 zNh0qX4f21ZCj7ktRTpsOOU3Cx7v8TCVffxoHFQTJ9C/wsd+PFW8yYQuJlTLgSjc1Mjk
 6SLitqz/OSoK3FSgpQCfUVlFOtnakdY0LkuyYIO5U7JaT129VolEBLxUk4KCSC+un8Nb
 Y9c+0DsbxG8GHBjd0V3IvVHOha7FFoMNWOmVtlibTmFyniw75FHtwhh8K5A8RIAmBX3i
 UnGt+OWdGJOBQN2WEInXm9WOHH0sAnOLqGbMo6/BUuVj/Kp65fqvyviOdHhfzRvfqPUj
 YSoQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxhpon6iM3xjm9My9+KqFTio2vTeRrxoGitxTk6obmxdBj2nFCS0GqrDbaTsZ+HbL+xL9QXKmoNZmRT@nongnu.org
X-Gm-Message-State: AFq9FYIKkcBB/v7YbRJlYORMj+jTHapnqJnWT2olXhPjJTMEoJUuBTql
 mcOvmeZ89H1nmx2MCzRDkZ9Fwdcjfr5ShIlHGgkM0Y9fDhKhOqwOqNtX
X-Gm-Gg: AYBFou26gxx6pZZA5Gir3TXXzfCYIO2afpL3FMR0yKRJQwKjVpJL+r8dLFufQTrPIFa
 K7DTbcdBOJzkYD6U43YZ1trIXLHcCz+yI1GfCjkT9Nj7EY3r3MhceOiS35lJ4RaMdJ1WfUXGpaw
 QkHTsmX5lyZ55/TVE7633LjNeLsa7q2hajqepUv/zKWcMMF5iEIClQdotooiyEclfJGswcaeSJ9
 MthxyiHpe2yyQeRbhNnxxqV3u+gsbNHmbSSofa5qPBLUiU2k3TGq3U21zyAGINOdgdIvWo5O7LZ
 jmXLKJdM2/7WzC5j1IrEhtqHwqxoBjLTnVeXwDbpW9pPKghhwQzHes+ndkb4OCOw7e4PYpqiRv3
 H9XzseCcr7IHONEml2TcFg2g4PgYD4j51LyhNGEVHb/bOucqT7xX/ISujqqjVxxNIjZzQa4rmEI
 0jg+afFS8KbQ65dSipbl64dj1ErsL/7A204NonorpVyaYsyqjz81pbn6gsBgRloVOQonkgsRnbs
 19utRgOIPNyNbveMht8F4oY34BSPzKQf/R/9h8m7prSVmFm06rkR3/DlfmYLMNWnZFsUX2BOdy/
 0CDe7PO3DStzoCy6qcNGXYS/hzqIwT++ng==
X-Received: by 2002:a05:7022:102:b0:196:7590:8bed with SMTP id
 a92af1059eb24-1a3c3240338mr5063470c88.2.1793099630674; 
 Tue, 27 Oct 2026 04:13:50 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:13:49 -0700 (PDT)
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
Subject: [PATCH v4 13/17] hw/loongarch/virt: use unique QOM name
Date: Tue, 27 Oct 2026 19:12:11 +0800
Message-ID: <20261027111216.392-14-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Set TYPE_LOONGARCH_VIRT_MACHINE and the versioned types to
loongarch-virt when target_heterogeneous() is true, and to virt
otherwise. Keep the -M / help / migration name as virt-* via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/loongarch/virt.c         | 9 ++++++---
 include/hw/loongarch/virt.h | 5 ++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 83badfbdfb5..be4e519ec50 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -1543,6 +1543,7 @@ static void virt_class_init(ObjectClass *oc, const void *data)
         MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
         mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " LoongArch Virtual Machine"; \
         MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+        machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
         if (latest) { \
             mc->alias = "virt"; \
             mc->is_default = true; \
@@ -1550,14 +1551,16 @@ static void virt_class_init(ObjectClass *oc, const void *data)
     } \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
-        const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
+        const TypeInfo virt_machine_info = \
         { \
-            .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+            .name = target_heterogeneous() ? \
+                    MACHINE_VER_TYPE_NAME("loongarch-virt", __VA_ARGS__) : \
+                    MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
             .parent = TYPE_LOONGARCH_VIRT_MACHINE, \
             .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
         }; \
         MACHINE_VER_DELETION(__VA_ARGS__); \
-        type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
+        type_register_static(&virt_machine_info); \
     } \
     type_init(MACHINE_VER_SYM(register, virt, __VA_ARGS__));
 
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index d39a9bbf5dd..92b09e7ac8f 100644
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
+    (target_heterogeneous() ? MACHINE_TYPE_NAME("loongarch-virt") : \
+                              MACHINE_TYPE_NAME("virt"))
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchVirtMachineState, LOONGARCH_VIRT_MACHINE)
 void virt_acpi_setup(LoongArchVirtMachineState *lvms);
 void virt_fdt_setup(LoongArchVirtMachineState *lvms);
-- 
2.52.0.windows.1


