Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A81606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDEOOsGp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLf72-00030J-MA; Tue, 27 Oct 2026 07:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf6z-0002yI-R9
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:13:01 -0400
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf6y-0002sC-8x
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:13:01 -0400
Received: by mail-dl1-x1231.google.com with SMTP id
 a92af1059eb24-14394530ec6so4801963c88.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 04:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099579; x=1793704379; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/3SGS8X+t8HUgxydHksGLLUEFv78DWEwDvhaYo9qUS4=;
 b=gDEOOsGpmVJsTRhgYEswi35Cwzvf1UeX/VpjzTprLzYTwo1zUm1xhkLx1rm2Rp2gMq
 G9TcUV1CxP1F3ROc9So83rm16d1NF7qGQ8QltCmYlFQksm1fzIkYeZyYMlHpvAlmF0jK
 f2n7dAOstNFKUv2u5WQjWuQejoKZKbW6pVbdrImnOfVlLJma53aX2LKhExQrLIGe/aNb
 /L7cHMEnQBKqN+9WOmCXLZxUKJBj75L/yqi8FENS4aMtPaN/VbNILlVLb0wTy6v/rHvs
 AifbNeRTw5kvZE0Wc//Pwm0zBKu+9pRe31PRL7AyDTJIAAQNnmzZHBI4i6/kbRuLcD8m
 8+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099579; x=1793704379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/3SGS8X+t8HUgxydHksGLLUEFv78DWEwDvhaYo9qUS4=;
 b=o/CYo6L0eQbAbGTcKmSEGXgg/dmUI/EA2MfY34cw1H8xDZuHgzDmV5ez3uEtEwldil
 q51+vN7KaAfDtOGBA6v1CMx4F9tw7/7CYC1o0AZnhz795I2UOzK+Y1PJsCVLH/uFGw+E
 Sb4EY4wWlZG+KQJqfIufmihiX3K6UsSPfrxXjIAqS5RrukOAsgcpIWcV+ny6JldqeDnV
 VtrEKsb3V9xvjcMyT573aLRvAZr/o1+LLzp3QAZTc91SoVMR49zwL4EPND0yWuLkYUfV
 8y9B4ecRB0hOZGgLue2T8U+fkNaD2izcpI/EW+L6d9efGb8WGhBN7ZExM3gwt20siMwh
 MmDg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2fql6U3JsgRBJI3QantqRUE0A1QUcM1YH3Zo+9ZhMSji1nlceVEo58XKfjG4pm42seeL2H8klRVkq@nongnu.org
X-Gm-Message-State: AFq9FYLvbZWNdbOLPYvVrR5yAQIZvG+5vxzGPBIeUG4jkHdowSYVuoyM
 W4IUd5l/e5t5A7OxSsyrK5RiTdCwJ5BeJEHrnTBxPoD3A5UKzdWE/dvb
X-Gm-Gg: AYBFou3sK9Yt2agK0EtU/A0SuQHj4aLE20smi0dPEICjqzdh2D4MS3FGMX1HjwpRh6/
 A+YElxRHNsfcbpK1LgxPy27ZTfLJaU9Hv0IiBe6gy3w+5Kn5ziJPGRg5B/yqNTA9VxCxPHemtJr
 gaVg6MfsF8E5qoZWkfysIPabnkCJGT2p73pt82IW6z14wUlDncpsLHL2qUxKclaE6NZUecTLgPX
 39xntVOSIpG0HWyl2OQ9mvmWAt69H8tG8SNY3z9vltGTynUqWijYuO0qIZkD6JQQ1jKVlL84iev
 UC49HpV59iVmPAtM6jeKsBHWNPLj64gF71e2Znf7NPRxCh0gS8v4CMm1migb+bN+hiR9cQcExsn
 hUJRgHmPvI7idbiFM8LLfizFcBslzgqHrmoZF0nhv3cmdo41g17Xkf+kGOJMwuAU0TrMaRGAPsn
 FQKDbZGsTvqpOq7mMdcVuW643UQA7EjD4ZXHYqRHkEI+o6PWUN6uezsI236NWaESWITlnD+3WMg
 lOxL0FK6/HOnZlCE7U+P7xqmN6TbSYquW83rZPYWRmAox2i9bI+8TG1o5ibaoXYYez9tPMoGpOl
 hPrG/E8F78jDlWdOwosYbJUOCFZWNaRJdw==
X-Received: by 2002:a05:701b:4549:20b0:144:fdf0:9d91 with SMTP id
 a92af1059eb24-1993552f1d4mr13029185c88.24.1793099578543; 
 Tue, 27 Oct 2026 04:12:58 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:12:57 -0700 (PDT)
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
Subject: [PATCH v4 05/17] hw/loongarch/virt: move virt TypeInfo into its
 type_init
Date: Tue, 27 Oct 2026 19:12:03 +0800
Message-ID: <20261027111216.392-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

The base virt type and each versioned type are file-scope
constants, so .name has to be a constant expression. Move
them into the type init functions so a later commit can
compute the name: "virt" for a single-target binary, and
"<target_base_name>-virt" for a multi-target binary.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/loongarch/virt.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 9c5371af9de..83badfbdfb5 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -1548,14 +1548,14 @@ static void virt_class_init(ObjectClass *oc, const void *data)
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
+        const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
+        { \
+            .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+            .parent = TYPE_LOONGARCH_VIRT_MACHINE, \
+            .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
+        }; \
         MACHINE_VER_DELETION(__VA_ARGS__); \
         type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
     } \
@@ -1579,22 +1579,21 @@ static void virt_instance_finalize(Object *obj)
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
+        .name           = TYPE_LOONGARCH_VIRT_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .abstract       = true,
+        .instance_size  = sizeof(LoongArchVirtMachineState),
+        .class_init     = virt_class_init,
+        .instance_init  = virt_initfn,
+        .instance_finalize = virt_instance_finalize,
+        .interfaces = (InterfaceInfo[]) {
+            { TYPE_HOTPLUG_HANDLER },
+            { }
+        },
+    };
     type_register_static(&virt_machine_info);
 }
 
-- 
2.52.0.windows.1


