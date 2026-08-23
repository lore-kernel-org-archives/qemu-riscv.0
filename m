Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67BDC5DF97
	for <qemu-riscv@archiver.kernel.org>; Sun, 23 Aug 2026 15:19:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wy9xy-0008C7-Kx; Sun, 23 Aug 2026 11:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wy9oK-0007YW-Ad
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 11:08:36 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wy9oG-0008Su-K7
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 11:08:35 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-c9aea40d799so1542710a12.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 08:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787497711; x=1788102511; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B4JrSdi8k8XQNQ8Elee+OQ20buAqlY2zey3O4M4RxH0=;
 b=XHDehT/+aZGSkgAIwXSw0j5dm1lP3ByZxZoJPW60HDr8dksiiiOkEEdox5fQfk4EwS
 XcnbP3nxe4J4l99R+D/rn02U105fiCkuZVRa+ijpEWjtR8+Kqb/znS0i42pbfbynB2Yu
 J6kw4PqsIxRyineRUK1dVz1l5CUTtKIsir5oyaLWEhNlRBz+ITkODWPQqJaSgZGXEb6l
 n1/nXu0POvJIHo3mQQc6JSHTzko/dlWnNhm7bF8uxQsIQsHimhqFF95B7AfsGCVon7WB
 g4/LuejG21t4wKevyNMX46yMwo0qS7RvOnbJVRhnKMDutH0Kxg6PgsqsEd9XdQwZ62Wm
 fkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787497711; x=1788102511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=B4JrSdi8k8XQNQ8Elee+OQ20buAqlY2zey3O4M4RxH0=;
 b=BPnqZPkupsoihQwTRVGMCajtUniVClPUc/PhT9LD+J4ccRLIl4XwQGy08HgVeTaYfg
 KxOik/t+CdZMAqczBre98sxvQvdNzU+FJACDaRh4FjoE0pv5RSjnXvopuPzDH6h8+VDk
 YaIc8b93Na6Lm3bQqYxvqLWPgdicAAl6jCvY7bs4fmDzAKay7gLlSBshFqUiKFX2O3J+
 kXlViReUP7Fq+sgojvHeDhRJkZ8fxEW0FfdH7wNUd14Q2l2eWVO5lSUVUg2zRq9htF18
 5lul5swZ2uXg6dLh9lWbpHF2z3LcsRX9wHOdCL/gnNoy4rtwC0lG8n6+WVyufplRC93D
 x+hg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrmymm0Ret4oXoYUWjRCRU7yfgo+bpbU7D+kSteTldRwoW4hSeNMKJ1ABb3sUJh5TFrVRbJ/c8MZcbK@nongnu.org
X-Gm-Message-State: AFuF++neIPh0/YFZONObW00Bnkwth4YO/HAN/6fc/5c2KP+neo5QP83J
 LFNYJGSOyhARfW2ier4tCoGH/uU9BLyGHpdr2hc0bnZb79wjClvaXDjw
X-Gm-Gg: AR+sD12MoACwRfWGfsnoR4LddsK/GW8PLHjDGOHCfVGmJwBk7AL3izOgVWYNDFb6puS
 9VS8IHA00Ui7iTQuk5a3OeZTl85enEsUG2sQ8tmAJJMezqoeKiPJjUlWkY4EyT+RV6lQyGkoxf1
 F30wO9vf6u6Gk/lWeng6A03MbX+Ka2Xmp+52TILNTv08ktW2SL0ihLId+QWWIvcWb9T7MWr50tC
 Y2wUfvYiYuJZm+gX9QJuIJjTLynuedIRsG5qoLcfJ8gChJqYs29XoPrzc4xfzlgQEgoFdPdoVIa
 H9uto8Nivfx2h7CW/3Ujbcayzjbc0Tgp3LyNPHtUfv4r7eLolS6el1P86pEG+RJ8pt+EduEGMdh
 4t3wD3ZHVKQBm4ZgUtApjWc68oDao8VQsmZyA8dNBL3mE0jl/vy+GFOog0QxTfp5ChDtqtBG45+
 bhwXh0rc3CR1NFOsWHEmAUNCqsqWar+57K2Q4sGC2WgMHwMYaI03nw9fPArgB/sESIJxOix1ZW/
 +46qWod0NBX0H/dPh+m3Q==
X-Received: by 2002:a17:90b:4fc8:b0:38f:efed:5445 with SMTP id
 98e67ed59e1d1-395c3573cecmr36286511a91.4.1787497711217; 
 Sun, 23 Aug 2026 08:08:31 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1418619d6ecsm16024511c88.14.2026.08.23.08.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 08:08:29 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Sunil V L <sunilvl@ventanamicro.com>,
 qemu-riscv@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
Subject: [PATCH 05/12] hw/riscv/virt: prefix ACPI helpers with riscv_virt_
Date: Sun, 23 Aug 2026 23:07:23 +0800
Message-ID: <20260823150731.896-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260823150731.896-1-luoyonggang@gmail.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 23 Aug 2026 11:18:31 -0400
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

- virt_acpi_setup and virt_is_acpi_enabled collide with ARM virt when
  both architectures are linked into one qemu-system binary.
- Rename the RISC-V helpers to riscv_virt_acpi_setup and
  riscv_virt_is_acpi_enabled. Leave file-local virt_acpi_build* names
  unchanged.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/riscv/virt-acpi-build.c | 2 +-
 hw/riscv/virt.c            | 6 +++---
 include/hw/riscv/virt.h    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 59c454f4f94..832261391d5 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -1017,7 +1017,7 @@ static const VMStateDescription vmstate_virt_acpi_build = {
     },
 };
 
-void virt_acpi_setup(RISCVVirtState *s)
+void riscv_virt_acpi_setup(RISCVVirtState *s)
 {
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1b672b2169d..16edad64f60 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1293,8 +1293,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
 
     virt_build_smbios(s);
 
-    if (virt_is_acpi_enabled(s)) {
-        virt_acpi_setup(s);
+    if (riscv_virt_is_acpi_enabled(s)) {
+        riscv_virt_acpi_setup(s);
     }
 }
 
@@ -1652,7 +1652,7 @@ static void virt_set_iommu_sys(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &s->iommu_sys, errp);
 }
 
-bool virt_is_acpi_enabled(RISCVVirtState *s)
+bool riscv_virt_is_acpi_enabled(RISCVVirtState *s)
 {
     return s->acpi != ON_OFF_AUTO_OFF;
 }
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 5559783aebb..38ad8b0097e 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -133,9 +133,9 @@ enum {
 #define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
                                  1 + FDT_APLIC_INT_CELLS)
 
-bool virt_is_acpi_enabled(RISCVVirtState *s);
+bool riscv_virt_is_acpi_enabled(RISCVVirtState *s);
 bool virt_is_iommu_sys_enabled(RISCVVirtState *s);
-void virt_acpi_setup(RISCVVirtState *vms);
+void riscv_virt_acpi_setup(RISCVVirtState *vms);
 
 /*
  * The virt machine physical address space used by some of the devices
-- 
2.52.0.windows.1


