Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E50606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TA8+EEWU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLf7Z-0003Xq-8W; Tue, 27 Oct 2026 07:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7V-0003TQ-9X
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:13:33 -0400
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7T-0002y6-G9
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:13:32 -0400
Received: by mail-dy1-x1329.google.com with SMTP id
 5a478bee46e88-3645f0f3fcdso7290290eec.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 04:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099610; x=1793704410; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=L55oApzfxuR3Cb3K6G8G98YWism0iXM6tBC3kMOjIJQ=;
 b=TA8+EEWUZK33Lgll4R69uhSpxejOeSrjwZrCqp3ZaSBZjPD+K59oz++36NZM7ABSSQ
 UAnv51tfitWWDMEaiC1x3mjBtma+Q4/5BM5mHPkHUTlX8RcgWdlzSum0uGNmgYK0nOWT
 5jrCWcRAMXlt4SmSXC/uc9icoIQFlEOAGo2Q0RBHyMe1++a+9Qdz0RrL7qDObY13tEGx
 oR1juIb05NJXa+u5Y7vhi+Tejn5pfA77jhGiYuJxh09h91UQTfjJP2DqctpoNvlOPYXp
 tHaO73nMLfKnfEZuxgCqTiN6xmk9kb2JfVq8u2Rclgdr9YP66oEwfukRVthl3od93BvP
 m85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099610; x=1793704410;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=L55oApzfxuR3Cb3K6G8G98YWism0iXM6tBC3kMOjIJQ=;
 b=uLU7cMrJPfiGTUwmP4Xu0fC29BPdmEk/26P1CTOnrSGxuu6hZWflxbCZhQ3cq1C3mX
 hjMIUULovciFjSDSAH3/162epebG8kG+Tb0IWs6Io+m6TYLgaOdNijpr7AUA3ztoIN2R
 KRduPJZ4l/7TDmAKkwkQPwcTfYxEH2gFkhQ0Iy4xfsSQ4iMQ1ccaSVNA4YG62ryHsitQ
 Urxp8p4uMZZaPCN36cTWgVgDW6RIB9zcbPhU4WMrPHGtaXSNKl9YM20GThSyroCahJG8
 XMpFztkEzPx1qGAohGQ0NMDMBq7A4dhBgA7IWlT7CMz+Q7EU8eoTeovjrMdiD3mkCCcx
 TWQA==
X-Forwarded-Encrypted: i=1;
 AKwUvByyV5DhtnKZtRtN8UYZxFRibJuj162krKK7/S+WOfonatj/yCr8grM0vuIpB1W8jKQMFIgA6kkSKPlK@nongnu.org
X-Gm-Message-State: AFq9FYK6bwPWR4e7m85KfytwylBEKRNx6w0XOgNt3V4BHBaJpCDnf4r5
 fDLARUV/0HjkSvNAu+NyzluM5BBW0tbKNyXifIr8V54P8XGUjzSnv8Q8
X-Gm-Gg: AYBFou3SevAL3EJ9xqPPOSpmgNKj8PVi5PFj/E8Qw6ryprXjxzIRL34ug3WmFB8i6ke
 EZ54Fh0eO43dvwe6+R27U6QessCVMamQT6elY/wrO0o0EjJF0r/UtgeZbCi5AaS/t96mbbh5Vqu
 wAF4lqN533Mg7JcbY05GyLLkkC4tu7WOQS1kHHjmaEXEXuELiUe8kIdLgEwqGiMpXU3XEArxsvv
 IL6OeJ5pc2/p9T/x3CU5hhTR4jdnM4gn3AGlOb8B9eg6F1dz3Gzel3XnXv77BXlLOukOzF+RhtZ
 DWSWCcuXsDq9bFUuSIchLeJH9v5fJz+SNaYAwB+I+CSR2JZvVg8215mGloBE5a9TrsAeDDPlG4o
 karVZRBv+Wj9nAgOhLCuxDVqU1i6JPZ5KCPJoQgWWXTx7PsCa27qQ2/bhyTLDWJaurLcc+Ff8TM
 FcYDPnbeu3AqhSocgXtZWZ1mX/Uektmet8k7TAYpqvaKt4sN3tYp5vXPukTzspZpL95IXlfsvy7
 D6CxcpPEuUvdOj/AyseEmIPjFBIXic0J0Naw01TgyFriv7fbwJoyRAtzBMEh0kkaZWZF4wDDYDN
 wvX/11sogK+eWWnTVqdZK1t7s/uvolhRoAbZnRdNxoq/y0NaoBGBCKMPZ3pZeA==
X-Received: by 2002:a05:7022:309:b0:168:e942:4e62 with SMTP id
 a92af1059eb24-19937caa524mr19983920c88.40.1793099609786; 
 Tue, 27 Oct 2026 04:13:29 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:13:29 -0700 (PDT)
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
Subject: [PATCH v4 10/17] hw/arm/virt: use unique QOM name
Date: Tue, 27 Oct 2026 19:12:08 +0800
Message-ID: <20261027111216.392-11-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1329;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1329.google.com
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

Set TYPE_VIRT_MACHINE and the versioned types to arm-virt when
target_heterogeneous() is true, and to virt otherwise. Keep the
-M / help / migration name as virt-* via machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/arm/virt.c         | 12 ++++++++----
 include/hw/arm/virt.h |  5 ++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ba55d7c90f3..3e52c23e81a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -121,23 +121,27 @@ static void arm_virt_compat_default_set(MachineClass *mc)
         MachineClass *mc = MACHINE_CLASS(oc); \
         arm_virt_compat_default_set(mc); \
         MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
-        mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " ARM Virtual Machine"; \
+        mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) \
+                   " ARM Virtual Machine"; \
         MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+        machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
         if (latest) { \
             mc->alias = "virt"; \
         } \
     } \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
-        const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
+        const TypeInfo virt_machine_info = \
         { \
-            .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+            .name = target_heterogeneous() ? \
+                    MACHINE_VER_TYPE_NAME("arm-virt", __VA_ARGS__) : \
+                    MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
             .parent = TYPE_VIRT_MACHINE, \
             .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
             .is_available = target_base_arm, \
         }; \
         MACHINE_VER_DELETION(__VA_ARGS__); \
-        type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
+        type_register_static(&virt_machine_info); \
     } \
     type_init(MACHINE_VER_SYM(register, virt, __VA_ARGS__));
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 22e66d1a113..4152f8173e7 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -32,6 +32,7 @@
 
 #include "exec/hwaddr.h"
 #include "qemu/notify.h"
+#include "qemu/target-info.h"
 #include "hw/core/boards.h"
 #include "hw/acpi/ghes.h"
 #include "hw/arm/boot.h"
@@ -215,7 +216,9 @@ struct VirtMachineState {
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
 
-#define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
+#define TYPE_VIRT_MACHINE (target_heterogeneous() ? \
+                           MACHINE_TYPE_NAME("arm-virt") : \
+                           MACHINE_TYPE_NAME("virt"))
 OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 
 void virt_acpi_setup(VirtMachineState *vms);
-- 
2.52.0.windows.1


