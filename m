Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919AA606A31B
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Sard79wd
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLf6k-0002o7-4R; Tue, 27 Oct 2026 07:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf6i-0002nh-5M
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:12:44 -0400
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf6f-0002px-84
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:12:43 -0400
Received: by mail-dy1-x132e.google.com with SMTP id
 5a478bee46e88-36a1947498bso100923eec.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 04:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099560; x=1793704360; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=36oteUhTJFTk0IqSSkD4FAEx6M4KXp6MopAQITFyFSI=;
 b=Sard79wdQa6JK0Ovn6E7ZrYPJ3/wD8uT5Dc5va2fsMqzYPAk6DXG4RZ2+B0aztcuXS
 ZhdkdaZd0vKs7xaAbJiFBN3PV6kGtoDxmhT6ni9sfjE4f230/Fb05IV+LDHYtVZnIDjp
 ppRSUds1nj2hm06Vrk9aJS7HHWyD3lLXXyyn0p0Fpno07GLnKNqbP23lC2eAIxD0HpoS
 R68aM9fesPICoLDZWRJegUUZl1bl4OxH2IAui+HIq+wR6iWgRgTTxmZsOfAAozOG1uqb
 x+GizBa6Ik1Ay7ciLaTHG5HuQm0AYM4EKrNrjGGf97lKe3wVpDx4oIZGc4dNoItp5bjI
 VxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099560; x=1793704360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=36oteUhTJFTk0IqSSkD4FAEx6M4KXp6MopAQITFyFSI=;
 b=UQydRZdYZKy9hhuXzD8KDv+6rv8z6KcrxMgBtjq6phnCEfTJ1QEahBjzJqqhV14Ag9
 SksEjFULrjFSQBFzPuPmWdNVoHRsVA/PZEzS01CeACicXf2sc/t9OERcTNMrdMtkDka6
 xKetjVrpEVe47UIeNXUnX8VxTy7ylE6+wak1cD9UK8q8ce4mOSgHyUNoQ/MvHl04De2V
 ayEkI43QjuNfHqWS9JHHA/lYC7h8z8QX4wbUEqfDApTP1TvttV0GlZjbxn5RJkQ30eCQ
 BOCYtt8lK2R+vL0YSol0oJVVjHuc7xFw9/eqmkspm1+I4wUf9bVKuZRBsmX4EvmwYAd2
 DlfA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzzMqDjFt82NATQpQlNRwLaBmKtBN5K45EP4tiOMkXYjNgJSU+/5i0zIegM8UwJORoq9nNVNk4+WZFI@nongnu.org
X-Gm-Message-State: AFq9FYLCQM+wgF3/J3lYqSQ8irIJ51K37d+2dZGYgC5U59UCG8zKaHld
 tZCcyx1yd5HBUCL2QySlDKpYlxkFzFT3yLmVE0XpNQwam4nWhNmLyFJAcFCtPyFA
X-Gm-Gg: AYBFou23p6A2jW7qHb5xNtOOHGAzzAcLunRfVTv4CImdMhwu6Ukb8Xb6ESCfOIs5vOy
 k7XbcaZWZwFn9bnYBrd9y2Zza+jDeOe4NaCsWhoDJPkVexqUs6/5Ze5AlU3GEjYQJIQfY8fHExq
 wOHVhtg2sE3cjHzDRKtJOBNAUnU6ihpsyENcMRXuIxFMFqeTS6Tfz6rMjCqrIaT4/i3hqOvjJ9c
 /eefNZueVrtt7L7d87IMH5uMmEl124HgAqVnb+tmaNAc8TGqQ+Kjd2mjodox2D/ULzK33J+eCsl
 fJljZbzMjXgzMfhRhnz4AQSNlkz6TXk32frmMqNwB/NVumfEoR9g8BuWoiQe2HnTfge9Ib0/+4X
 3zV9iRU1q8Z9mYXyGHr29JN5NK3a5VbbUzrWedRzaDPaBekyzeOWoXHq6NfNldHfc7P8KBd4APV
 nx8WGBCcEoh2IzCJ7XG8x/Q0SbEyikGltD/xdbK3nABJ7TOtdnGyLUXcRYFdcZwtFKoitIe33g5
 19tcWiv/SP7QmuDoqZHeY/5XqQiluPc+BBor6deqh45QWwBBoSCmTPYngaJcm1QW+cxughnQw+U
 rmVzU9iYR9Uz
X-Received: by 2002:a05:701b:464d:b0:18a:d7db:f76 with SMTP id
 a92af1059eb24-1993fe81371mr12765255c88.36.1793099559585; 
 Tue, 27 Oct 2026 04:12:39 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:12:38 -0700 (PDT)
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
Subject: [PATCH v4 02/17] hw/arm/virt: move virt TypeInfo into its type_init
Date: Tue, 27 Oct 2026 19:12:00 +0800
Message-ID: <20261027111216.392-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

The base virt type and each versioned type are file-scope
constants, so .name has to be a constant expression. Move
them into the type init functions so a later commit can
compute the name: "virt" for a single-target binary, and
"<target_base_name>-virt" for a multi-target binary.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/arm/virt.c | 45 ++++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0d56197dace..ba55d7c90f3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -127,15 +127,15 @@ static void arm_virt_compat_default_set(MachineClass *mc)
             mc->alias = "virt"; \
         } \
     } \
-    static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
-    { \
-        .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
-        .parent = TYPE_VIRT_MACHINE, \
-        .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
-        .is_available = target_base_arm, \
-    }; \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
+        const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
+        { \
+            .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+            .parent = TYPE_VIRT_MACHINE, \
+            .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
+            .is_available = target_base_arm, \
+        }; \
         MACHINE_VER_DELETION(__VA_ARGS__); \
         type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
     } \
@@ -4419,24 +4419,23 @@ static void virt_instance_finalize(Object *obj)
     g_ptr_array_free(vms->smmuv3_devices, TRUE);
 }
 
-static const TypeInfo virt_machine_info = {
-    .name          = TYPE_VIRT_MACHINE,
-    .parent        = TYPE_MACHINE,
-    .abstract      = true,
-    .instance_size = sizeof(VirtMachineState),
-    .class_size    = sizeof(VirtMachineClass),
-    .class_init    = virt_machine_class_init,
-    .instance_init = virt_instance_init,
-    .instance_finalize = virt_instance_finalize,
-    .interfaces = (const InterfaceInfo[]) {
-         { TYPE_HOTPLUG_HANDLER },
-         { }
-    },
-    .is_available = target_base_arm,
-};
-
 static void machvirt_machine_init(void)
 {
+    const TypeInfo virt_machine_info = {
+        .name          = TYPE_VIRT_MACHINE,
+        .parent        = TYPE_MACHINE,
+        .abstract      = true,
+        .instance_size = sizeof(VirtMachineState),
+        .class_size    = sizeof(VirtMachineClass),
+        .class_init    = virt_machine_class_init,
+        .instance_init = virt_instance_init,
+        .instance_finalize = virt_instance_finalize,
+        .interfaces = (const InterfaceInfo[]) {
+             { TYPE_HOTPLUG_HANDLER },
+             { }
+        },
+        .is_available = target_base_arm,
+    };
     type_register_static(&virt_machine_info);
 }
 type_init(machvirt_machine_init);
-- 
2.52.0.windows.1


