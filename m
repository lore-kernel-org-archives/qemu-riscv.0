Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75D8C98318
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 08:19:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xANaa-0008IP-La; Sat, 26 Sep 2026 04:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANaI-0008F9-Q3
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 04:16:38 -0400
Received: from mail-dy2-x23.google.com ([2607:f8b0:4864:36::23])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANaH-0006pq-7Q
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 04:16:38 -0400
Received: by mail-dy2-x23.google.com with SMTP id
 5a478bee46e88-33c11ef641aso1909441eec.1
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 01:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790410596; x=1791015396; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uknfbO5NFvPlVcETkBxAAqtNVMFuW55TRzcH0VjTpx4=;
 b=NdhfriUrXOWfGeT/Y+jAEINDB4JUjcd3Sc6QgrGFXfUMtILJCyWhp8/Ml6CAgpfOs3
 lQU8/udXu+VXYpzoNgNYAACpHmw6jP2aCAQOE+ZdH0+tbRvLN1ts1ScmvUU/jz7NYBbz
 anlY7UgTnPpjPO82scz5soeD3g/R4TjsVwtVw8XIHSPHddkyFGWQpcGCpBTsR1FvIiZK
 nB9OtpHFbpVxRVDy+06UqjhCRp0h9vwfDPTsV9KhUMdmpD7m1FoU8igZXpqqYsindUqv
 8ai0140vDHvsDyL6b+9ss1h6Ih7G4NVTi4csLp/Y1FuVdKTPryaseG/GzyFjD7am0GWu
 F1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790410596; x=1791015396;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uknfbO5NFvPlVcETkBxAAqtNVMFuW55TRzcH0VjTpx4=;
 b=v/yovPcui4+xdCXSuM/3SuwdISuNmGEBKV437gBXNQntJqfc7GsHObWhHAKct9G7MZ
 SexuNa16TwKM97oX/YT9I1AIvgZE/3Rp4UE+PQIPmjBTO2VrN6etFaTndFxnKeowEiYj
 BVpy57GAWpW7SgJnuVOKhK27Q7946WccRfGvw5LKgZD0a11+5ebg2wVDT9oRHtzF3q8F
 fYCqL0D3KdqTTmxepIfw/6eBKxy/YAZwpWephu038uA5UKbXUHIyTPodyvalQfDsok3D
 GtZ40dU5uYIwhjTbQDwJohI6Si7MUIyBUVR9CtKpXAxO9fNkMJHSN0yUYl4V6GSJEVEU
 yLig==
X-Forwarded-Encrypted: i=1;
 AKwUvBzH1nkNBYkONFCcLFyfDbv42ofJ+DqEFmEGQJt6wRKfc0SpB5FbyUeDIdzRCMOJGek8zRwAxJacl64m@nongnu.org
X-Gm-Message-State: AFuF++mUAM0BIUOg2BkLFMrt9ElVeeKRr73MBExTQ3RPdwM9sSdugEjp
 TjTfbp723HzCr1bj+hI4obSXYYg938qeTUygX7+GfIqHD3R3EG7cjUl6
X-Gm-Gg: AYBFou0z62jQu6RhWKGDY7Z0m6BQLySEWe2KzdC6MnUnBuude8IxiovANpLAe1QoMyo
 mskyhwRL0fCqJSR/xJOERP7QatWT36iB4Obezrv7/EtUdDi2a+fs5licCd9QVfa87tyPma1+YE8
 TbqEd1jhGe0rIy5Yc3rs3yqRu55XNK27UKcqCUO7G96mtKjAgSCY8et/9UzVjLGEkvjm7dtMviX
 PBkDyD/Tka1t2cs1z+EkYFgeSVexdf4rj4t2PENmNEkAJa9wqrKdEgBfTw4JXfpJgCgghXsRft/
 gJm9eIZ/VZy1Ct7Iom/y7UUEmWHcI5qqSg3TaYm+mICvf4yYOluK2cYOMit2tVBBCVUYJzBw0MR
 dvxj2qVZTgHDC2+zatVqyuHoajubi3/mbeq831Nr5BKtVLNvodsjy0bk0RgF0jch8AvUV0tgyuM
 NbQqCww3B5TxJSXXm8J0nUngDI0Pg35zHcUi1usce2CLfk1zhRz8v8IJBV0UwIRE4xycHFjIQXU
 Nsi/1gCdbDnwSrkY8zyOolnfC5E1QDE
X-Received: by 2002:a05:7300:c394:b0:33b:fae8:bbd6 with SMTP id
 5a478bee46e88-3426febb742mr2517958eec.2.1790410595291; 
 Sat, 26 Sep 2026 01:16:35 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34144f4eb9esm11970568eec.19.2026.09.26.01.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 01:16:34 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Song Gao <17746591750@163.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 06/10] hw/loongarch/virt: use unique QOM name
Date: Sat, 26 Sep 2026 16:15:46 +0800
Message-ID: <20260926081551.29-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926081551.29-1-luoyonggang@gmail.com>
References: <20260926081551.29-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::23;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x23.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 hw/loongarch/virt.c         | 3 ++-
 include/hw/loongarch/virt.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 9c5371af9de..2b003443eb0 100644
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
@@ -1550,7 +1551,7 @@ static void virt_class_init(ObjectClass *oc, const void *data)
     } \
     static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
     { \
-        .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+        .name = MACHINE_VER_TYPE_NAME("loongarch-virt", __VA_ARGS__), \
         .parent = TYPE_LOONGARCH_VIRT_MACHINE, \
         .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
     }; \
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index d39a9bbf5dd..09529de48bd 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -130,7 +130,7 @@ struct LoongArchVirtMachineState {
     bool highmem_mmio;
 };
 
-#define TYPE_LOONGARCH_VIRT_MACHINE  MACHINE_TYPE_NAME("virt")
+#define TYPE_LOONGARCH_VIRT_MACHINE  MACHINE_TYPE_NAME("loongarch-virt")
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchVirtMachineState, LOONGARCH_VIRT_MACHINE)
 void virt_acpi_setup(LoongArchVirtMachineState *lvms);
 void virt_fdt_setup(LoongArchVirtMachineState *lvms);
-- 
2.52.0.windows.1


