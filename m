Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE03C98308
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 21:58:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x98TY-0004J3-Pv; Tue, 22 Sep 2026 17:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98TW-00049J-MS
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 17:56:30 -0400
Received: from mail-dl2-x0e.google.com ([2607:f8b0:4864:38::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98TV-0000zg-2b
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 17:56:30 -0400
Received: by mail-dl2-x0e.google.com with SMTP id
 a92af1059eb24-144ecebb6cbso140588c88.3
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 14:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790114188; x=1790718988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2QNZBjooEwaWCMUyoLrrVewBfsIr1xO0E5E0pjxZJzw=;
 b=FBPwzqq6SE7e3gTxtLzDeY3ajqzfPLDJz+OA5sOoNM1DiwT1vKs3abp3qeccc+f50B
 UhTNBjZZxIrpgoWdFKqWrPvbA8P5AKFl3Mhl/yclN7q3j/plU4NkFpoQPJ7OwSsXAgrA
 WfTUKB0q0ku1t9ozroCFChQNsR9F4BUSZk1Yl4jqVygbJM2dBcuMdWm8ukmKHld2jaA0
 ajj9iSAgqVmQG+fRhkDYN4SvyeKvLkCSBfpS9wltHgcD2MlqsLx1jhfD/4kYOIMwijnK
 rf2qCeJ4RqbWQlTqXh018N/BbXx9UN+yWxJeM7r32gGR34TOv5tG9pi+4y67Ww9RcQYy
 gqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790114188; x=1790718988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2QNZBjooEwaWCMUyoLrrVewBfsIr1xO0E5E0pjxZJzw=;
 b=e+lq4v5vHr+R4MDI3zzsyHeab2A6+RsoUDp0N6l36x4ZNtS5NmyyCkZLI1nZgaLSvr
 dY4jDk9upJvSRntMSwgeelMl9vShHg7+ysvmzb6NEtqviVATRVCfWMfN1S4jhI/3/bj3
 lqtuOc+Ya1+UDo53x/2odjE+5pnSVn5PLhLDMfNFyzmgw+0TWfmLRz5CxGn/EJyIRSKj
 hIK/s9RNzbxPDUGwZlfzWiZ4JLCOqfIw2+k3ttD0YDUTvQz8VGU2IF/nVWUyiQa4LMM0
 b8HPvwnEZU3iRmSihkQXGQfG96Lj4DQaOhs47gpshAWIZCmhsou5wun2DaQGIqkkOK15
 D26w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzMNnXRm0BXC6grp9iVJQT1/ahomMifsk1sdsR5KNvh+d5sU7Rdzy5zcRQE/cUik/PmYz4IFs8wNAKh@nongnu.org
X-Gm-Message-State: AFuF++nv7HeMCuKkBu5USwfUE2hzWjT6+IsDoJFC8KdKNezhnev1YFVj
 8hX8a4Dhg7CjcwWHE0c7fAJi+Mm3FPkbevUKp+ZfGN2tDvkyLCAtmzBK
X-Gm-Gg: AYBFou2Ff9fK5apIBNeWMj6vEfmRQ8tZA7lpRGcF01i0GjvSIbvzt8QiIV1gctqtE12
 Zqz6MDNNXx5DImSb/6F2JsnU4OoPftUdWu4Ny8FnrF/p9VZJAta+h+g38WOCO0fmX5gydwkUoSu
 jYs926SMO6HM36xb3CTQqMQL3T0AyRnOxY6BJg6J8vF1A+Cb5qCtyU9WkO2Vkx5E5aRSUWoGEMt
 9eSKUXxsQGYa4i659mFZ6E+eLg8q36DutidiqNKL/Sv7LygIBpscF3Q3zpQPEeca2zkagv15PO3
 naajDCj2RHIf2sX4tKZNupCbAa/KHsXGU1sAZVHGfwId9RdtbPKZwdPHof6oSauhV6KZqkBfdp0
 OhVGal/tUlJ+VmODRXmJKYbQwfKvSOSER7towk3MAP4GjEqQPjrarmmmjIMrq+CH7DWowaajek+
 ljwSUpbqBJEyA+oTODsHhQokDQpHttJM2WVNVhaPnjru4MzF5/aIvhizTTk0w4ElSLy7obJimAh
 l+DXyuM6fygMfGSW6O4b7jfkgqqxYw=
X-Received: by 2002:a05:701b:4591:20b0:144:fa79:174 with SMTP id
 a92af1059eb24-144fa79031emr374010c88.44.1790114187484; 
 Tue, 22 Sep 2026 14:56:27 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144f949e60dsm1001153c88.2.2026.09.22.14.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 14:56:26 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Song Gao <17746591750@163.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 7/9] hw/m68k/virt: use unique QOM name
Date: Wed, 23 Sep 2026 05:55:30 +0800
Message-ID: <20260922215533.641-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260922215533.641-1-luoyonggang@gmail.com>
References: <20260922215533.641-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 hw/m68k/virt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 274970978ff..1faa178bdfc 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -323,7 +323,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
 }
 
 static const TypeInfo virt_machine_info = {
-    .name       = MACHINE_TYPE_NAME("virt"),
+    .name       = MACHINE_TYPE_NAME("m68k-virt"),
     .parent     = TYPE_MACHINE,
     .abstract   = true,
     .class_init = virt_machine_class_init,
@@ -345,14 +345,15 @@ type_init(virt_machine_register_types)
         MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
         mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " M68K Virtual Machine"; \
         MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+        machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
         if (latest) { \
             mc->alias = "virt"; \
         } \
     } \
     static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
     { \
-        .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
-        .parent = MACHINE_TYPE_NAME("virt"), \
+        .name = MACHINE_VER_TYPE_NAME("m68k-virt", __VA_ARGS__), \
+        .parent = MACHINE_TYPE_NAME("m68k-virt"), \
         .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
     }; \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
-- 
2.52.0.windows.1


