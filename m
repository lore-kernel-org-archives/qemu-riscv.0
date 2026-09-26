Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7A2C98318
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 08:17:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xANa9-0008Dc-8p; Sat, 26 Sep 2026 04:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANa7-0008Cq-SB
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 04:16:27 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANa5-0006oQ-AD
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 04:16:27 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-33e46a156f4so871428eec.0
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 01:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790410584; x=1791015384; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dGcjkcxYt8eZEjWK6mpDvnDtPiferHjEtlr90RuU0eI=;
 b=GhY45SZTYPb0XGwu4MkKSEpJ6U16TBOjaJQeZx9N64CL20BoEpJ2x7330p4pP1SuyR
 kRFve7hnbZoW14xM8Ex3iVc/Cg22invFc1xgvrS5LAixlWsJmHlu0SqUSyZVRIRWoHHC
 gvAigC1Q4OnRbMHLH10I3pJJgSl/Old7O2yDZw5rnbNfadTndOy5TUw0rGjx6pkye3HQ
 m8mtpl3P4GXLSPcJ+A8UyLjUBwYC3M0Rd3XeoPxAzIyXkSaGvhg8DLtfEUI2mudpv3ny
 Pi/2TjdLYZHv3Ur7h4RKjUVNy1EIpqOKrf7d8FHknKbbUop/bvDEopM0YgjkJrE9AoqD
 5OrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790410584; x=1791015384;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dGcjkcxYt8eZEjWK6mpDvnDtPiferHjEtlr90RuU0eI=;
 b=0eUM8seXXHWHfd6vw1Hti2TbuMZZeiBlX0MmhYyCrApsk+WGbIQ7tB5fSj+rQ9N847
 FSzpsRKa8Pk8WHKZZySqtNZXZvPpx/EpCIVJes6f3jqQ5fjU4aCA+HscL2su8MY2VXKb
 sWTGpZWh4JOXn3J2ZRsL4/QfJFUnYaSwVzWThB4IKqlytdpxK3wi9/fwxm9wVevd4Yhf
 UnqKTmHOI1Xr8BCOJvofpj6NTQwAY34pJkFumFLGanQF2npXwAp/j+n+5bkLD+MLE0QT
 +hODUmN/eY8U7moFQDkuV9Iyo0Mm53vDFWU1zdBTaISuCnyRW7kcjH/swj2D+JCsT63u
 glXg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxbXPsiSLGfDc2NzswHOGTJc2Tw3kaa5P/t+j4H1ZyCLqjDuulfMschRFJqmBCzXhGMXHjmK1ktKBqR@nongnu.org
X-Gm-Message-State: AFuF++nTYQYReB5pO0M0ctCNibPUS6M1bH/t7v1KcL2aC1oG4HI434aW
 pwqUR2aCfuD2qahs+sFS46WoxZLucI/cN27i54WoErm+DNtiiQkQjSxV
X-Gm-Gg: AYBFou0AF4SiyPYERJTTzZst3gKqHBFDWdTVnC/zDfpLJQ8rPux+hmX12McsFfqUFVV
 vSPpdtv7mMS/2QjMPl+WE1Qot2KSKb/lCqJJA1ArpEyjCWHWdP4kOIUs7SVUCoVKWLLzJem2SnP
 YOkDNAlNT0rz/i9JAGCkgBVot3VHu6BUC0NZOtlS4wzhrrBlhGMf/uvkNrg1U05o5BIDr9M2nDw
 K2ESVAHWUFP/SukZl6vfuTNDwWfrYk3kV6RXus9S/KKCj6dP7Qczz/sAQ2ojNWgOIU+46JFPNoB
 DzJH8NL+7l6I3xg1gp8i4fI+rxwNuaRmq9U/6cScMiHux2h7Nob4OGUzMYYjBM/3e3vbpvVk2ks
 6e42O8cMgsEYlitGXVK02c+TEwZUTDASyqGJDSWzoekOxafurGn6zcCRYg32CZwe+te+aAXQ44S
 qRNy0+B7NADvuRUDCsbLvwAp16bDKE0p7ql6JutVWf8mRN8g2YRZFDbj0IEFLZ7JZ4TP8vZNUZJ
 GyE5ZrvB9OsnHnfgJCwuYQp62FbRlpI
X-Received: by 2002:a05:7301:f10:b0:33b:c69b:7074 with SMTP id
 5a478bee46e88-342700be120mr2169607eec.4.1790410583789; 
 Sat, 26 Sep 2026 01:16:23 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34144f4eb9esm11970568eec.19.2026.09.26.01.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 01:16:22 -0700 (PDT)
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
Subject: [PATCH v3 04/10] hw/or1k/virt: use unique QOM name
Date: Sat, 26 Sep 2026 16:15:44 +0800
Message-ID: <20260926081551.29-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926081551.29-1-luoyonggang@gmail.com>
References: <20260926081551.29-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
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

Set TYPE_VIRT_MACHINE to MACHINE_TYPE_NAME("or1k-virt") so OpenRISC
virt no longer collides with other virt-machine types in one process.
Keep the -M / help / migration name as virt via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/or1k/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/or1k/virt.c b/hw/or1k/virt.c
index 2ff5c084a2b..35884252379 100644
--- a/hw/or1k/virt.c
+++ b/hw/or1k/virt.c
@@ -34,7 +34,7 @@
 #define VIRT_CPUS_MAX 4
 #define VIRT_CLK_MHZ 20000000
 
-#define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("or1k-virt")
 #define VIRT_MACHINE(obj) \
     OBJECT_CHECK(OR1KVirtState, (obj), TYPE_VIRT_MACHINE)
 
@@ -548,6 +548,7 @@ static void openrisc_virt_machine_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "or1k virtual machine";
+    machine_class_set_name(mc, "virt");
     mc->init = openrisc_virt_init;
     mc->max_cpus = VIRT_CPUS_MAX;
     mc->is_default = false;
-- 
2.52.0.windows.1


