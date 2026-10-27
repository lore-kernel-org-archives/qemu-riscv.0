Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B597606A31F
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lou9VysK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLf7k-000496-AF; Tue, 27 Oct 2026 07:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7j-000448-1m
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:13:47 -0400
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7h-0002ze-Cn
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:13:46 -0400
Received: by mail-dl1-x1234.google.com with SMTP id
 a92af1059eb24-18cdcfc05ffso4904506c88.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 04:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099624; x=1793704424; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zFuPJ4Lh2s2UUaRsaZOIoszYRr4vBXVOwxsipYqgcZQ=;
 b=Lou9VysKcYLIYaWn55Hi1PFX8F8Oysq9j5mHb9rzPI3a0S/ubK6WqxXaDJiq0kR1Z1
 KXTcOFJBjwnDc/6Q7uHAWiPliBFFBpXQ9EXNTXQF1/KCOYhv791/TF8opU3FCbyXUt1E
 p+OwxULJV5c37Vs9VzLZwugfjgY5b2URyymy9lo+tiRQPCVflT0NIy5XUarZX6tIFKUg
 1yPNcYjssZP2jg94IziJn6t1zEFx/lB3dH/rTQSTuXljUNizOWS/0vVCd+C5vnRTqPRc
 xr5j72qApDVsGnwdc+XWZz4RrUaU6XL9DBnX+ICaRNj7Yq9K1VtCiB98V011AVjonHWQ
 fmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099624; x=1793704424;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zFuPJ4Lh2s2UUaRsaZOIoszYRr4vBXVOwxsipYqgcZQ=;
 b=Xv3QwrS0bvD8UVNzONICdVSh7fhNAoefl70U+1cREsEkM3NbN0AFzkxexEGsp4j64r
 ppQACsbcGtfbqLVknFh+YVBJY8FHF1lBcA/a+4orNZSQYuk0+Jius/rP9HNY3BIK8fQa
 jt4QfWUOfJl655AT7uJxIJdwy8Bw05BeV1JEQKoLJUYPG+PbljGBnu8fpo/X7xItd97p
 kM2uJg50vXgAmR1lGj2j92ohFFs++k4UbP08GdP0qGNmDN5RSYElubMyLlVi3O16UY2Y
 1eD2NlZnpZYj3G8RQOqSwk4ELSGmBvXbYBcBZKO96azoeD4V3kJwW0MLwFrwZaC3aDUN
 Ashw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx+0aPl3gxAjuQYJ0gdBuzPk1Zl//Y9Zf9dV+o21QwgoTUtJ2yQGPu+K4Dvb4IYQn/zIXv9ZQ3RtSFC@nongnu.org
X-Gm-Message-State: AFq9FYJ2eg3YDbhXkfr7/kMa/VUL2IivF+5HHiRLMVl3jKolijmxJUsu
 8lgDfT0oBCwTL3Xb9a92UTcWUbKWBzc/Xlw/cWVHWuESAsMN2zxJ7Hqu
X-Gm-Gg: AYBFou0K9CIbmlrgeaGttllBblRDeyHc8pHxCLWOTc5lW3R1gUMRrnSd8gOS9ANPCYD
 UMvuyZpkYqI1B6ATW1Z3DB6acLuOsPl3uvnmq8AGclIw3NBPEEDY+cpgnldtw+abvLvQPZ6iOZH
 JapE292upZfE7XQXBoJZ6tkjNnxWNr5sKxFCe0b+i+u5SPSP4XQPiAsk9N6YnZOSl5QebqusWi5
 pr0uXeTqVmTLYGKHI4JQYZHM3uNZOISxHMw1d17zmKaBJwLFyQgALrclIRu/stkWmdSpO27rNzD
 0cSpCJBrj8G+jIDNkxPdikg7+BEykCsP6tkVixJR/K6+WnW+bBU3HPFk6QzepLlc6Peor9Pedcc
 2/O9zX0pNMl6aRaW07Co1B16gjyKOUpd7sRJ+CEr6MgpJlbCcV0gy0Q05p/UCgF7g2ny3wNy6ns
 SC8FNDZljMoVvLWW2twRSP6YGqqvRjMJohUuVRQwK6EzGNI0FAtDTvnZ25/UvzyjaRKhDlmHuIB
 m4dcZGXQ6YtVqkX+RmoMCpV3kNBUEgIGkUBIAwp/otro7j553GnjJITEiLw96GcCch/+X2ZQmPt
 +5jOoOR5uA+/
X-Received: by 2002:a05:701b:451c:20b0:1a1:8bac:c1c1 with SMTP id
 a92af1059eb24-1a18bacc218mr6054813c88.15.1793099623592; 
 Tue, 27 Oct 2026 04:13:43 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:13:42 -0700 (PDT)
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
Subject: [PATCH v4 12/17] hw/hexagon/virt: use unique QOM name
Date: Tue, 27 Oct 2026 19:12:10 +0800
Message-ID: <20261027111216.392-13-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1234;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1234.google.com
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

Set TYPE_HEXAGON_VIRT_MACHINE to hexagon-virt when
target_heterogeneous() is true, and to virt otherwise. Keep the
-M / help / migration name as virt via machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/hexagon/virt.c         | 1 +
 include/hw/hexagon/virt.h | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/hexagon/virt.c b/hw/hexagon/virt.c
index 4823b1d8ac4..7c2fd9cb61a 100644
--- a/hw/hexagon/virt.c
+++ b/hw/hexagon/virt.c
@@ -360,6 +360,7 @@ static void virt_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Hexagon Virtual Machine";
+    machine_class_set_name(mc, "virt");
     mc->init = virt_init;
     mc->default_cpu_type = HEXAGON_CPU_TYPE_NAME("v68");
     mc->default_ram_size = 4 * GiB;
diff --git a/include/hw/hexagon/virt.h b/include/hw/hexagon/virt.h
index 4ca2f1ef859..2383b54ae56 100644
--- a/include/hw/hexagon/virt.h
+++ b/include/hw/hexagon/virt.h
@@ -9,6 +9,7 @@
 #define HW_HEXAGONVIRT_H
 
 #include "hw/hexagon/hexagon.h"
+#include "qemu/target-info.h"
 #include "target/hexagon/cpu.h"
 
 #define VIRTIO_DEV_COUNT 8
@@ -26,7 +27,9 @@ struct HexagonVirtMachineState {
 
 void hexagon_load_fdt(const struct HexagonVirtMachineState *vms);
 
-#define TYPE_HEXAGON_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_HEXAGON_VIRT_MACHINE \
+    (target_heterogeneous() ? MACHINE_TYPE_NAME("hexagon-virt") : \
+                              MACHINE_TYPE_NAME("virt"))
 OBJECT_DECLARE_SIMPLE_TYPE(HexagonVirtMachineState, HEXAGON_VIRT_MACHINE)
 
 #endif /* HW_HEXAGONVIRT_H */
-- 
2.52.0.windows.1


