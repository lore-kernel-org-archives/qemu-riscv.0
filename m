Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53443606A31B
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EwhLAyO3
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLf8A-0005Kt-0z; Tue, 27 Oct 2026 07:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf83-00050f-JI
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:14:07 -0400
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf80-00033D-Id
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:14:06 -0400
Received: by mail-dl1-x1231.google.com with SMTP id
 a92af1059eb24-14394530ec6so4803410c88.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 04:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099643; x=1793704443; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WDcCR4dQxzUHXQ42p7u+Sy2JMMuPbZVHmLDwh+Cj3so=;
 b=EwhLAyO3Pg6fwwBtHKHZW9by2j4qHR7UnIy2iZ2jMJ1dPZ4BzSuDk2dVf9++5IutIp
 Z8Dlk8RQatPlEKkoIO4pMUfLx4a4rAAAjj2sh1g/APFGZ4l/qhjIe9iH6iz/kbzv9nVc
 LHR2vL2wNWgNaLQ3KjaapAff5FSgK4q+XIUy6nnE3vNM7yzdwBQqePdeonl4YpEKiOYQ
 A84wQSxNOMnPH+p8swE/S+mr/iBtVsBnJbHAZUMt/2t9ro1i1YuNQqTRI6o+Tp75XViW
 VLQLUr+NoRSAt0dFTrBwpWIrJRSDYr34RnqbpkgQJ+JVh/TrCfU3hmgBFJ9ezJfc5AWk
 Zy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099643; x=1793704443;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WDcCR4dQxzUHXQ42p7u+Sy2JMMuPbZVHmLDwh+Cj3so=;
 b=bT3EQmx4eqSxYfaHdOe91QqbFCNj8XF5N+wmtT47njMuIUlrTxBFOOJbBnLGN6iwNk
 7ElN+NHKfVooMD4bW5n/PKwknUgc8IPX14lZTeZggKQrZpwtRTpJr2TuOqAIf1YP7129
 xhmrnKbRv6s3RgFti+ud1Xwg5H4gjHAhtWCJZKVj77ZeFY/6fybloWT1TBcZXNKYXzr/
 B5ONRrjLGJDgGGsbe08IExxlioxLMqkwiLT0epXzhL1ZwsQHFiE56IfG0l+GMnfe25Kq
 qwQE5vNKDOYU3eiX48YbX0bQhxMZbJBx37CfjrNeIJf7y1CycTvkWJT1xDOOLH+xXgRF
 /5zg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzmKt7tLfQPmW0IQ+Zr6Yxw0EjnKUd/SGcS4hFLxLpF9j4yr2eqj6Z+X7JT5si7whmo2nJDW5iGaenb@nongnu.org
X-Gm-Message-State: AFq9FYLrjrCKte3cDzzlotc1jRPA33REKeg+W+Dun3q/e835ku+ZeLc2
 2l4+YAIjOV3Sq5Ic03lDazfjxneqRKe7mc7L7ozPjBmWrCLIemyg6b4q
X-Gm-Gg: AYBFou22cw7K8xpwv1p4/HWM0IkBSyGRGmYzDmG2Ad3wLSmpsUd3ms3jjiZ2Z7j2eM1
 QDxJvrtO8o54BiwFDbQqUYBcUxolW/i5ltE7b94/HX79lX5lGFT1dtaErL0SiZJazHvpHMX9Tqw
 +b8ZEtiUBFQY0jZj9Avmp9MuAdGCrcYr0NgEttcpdjPi6WqYaDb7xKLwVFaCCCB4CUmaAkw4Y0d
 7tp7SC4L938gBR1ZuYGFm1TQpwpqUb1fhH0F10Mf+KfMNnF5nYKuBxKU9S1fWcMhJE0K2WQDUlX
 GFS/ufRfXgp6mVNwOQ3NcmMh0O97RjIE/+8TiV8Scwm3d9E8yEpjCn0MgEtUh2k1JW+jPe6S/qu
 52Pi4vlWIUoEMt4/szMuockcoMKNi05TDFNTMG+2QMzxaWii2JyhE7+lfeX4MMnRQyykCIcpk2Q
 QNNLHOtaOhtynmUEphZ8eeFjxBpttyInhxs06ov+HzZkqd5c17A6zquqn/6oOUciEn+ZLv+qCfq
 iIXLwZeahrFTM2sIIOB9D97LoDyZWesn3LZIgr3IIPfHY2qe9Ghvj8vLRH5U+y16ftdacd6/o9O
 xzrtAUXMsADE
X-Received: by 2002:a05:7022:3f04:b0:196:c1ca:3489 with SMTP id
 a92af1059eb24-1991b420bf9mr13342737c88.0.1793099643009; 
 Tue, 27 Oct 2026 04:14:03 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:14:02 -0700 (PDT)
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
Subject: [PATCH v4 15/17] hw/xtensa/virt: use unique QOM name
Date: Tue, 27 Oct 2026 19:12:13 +0800
Message-ID: <20261027111216.392-16-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Register the board as xtensa-virt when target_heterogeneous() is
true, and as virt otherwise. Keep the -M / help / migration name as
virt via machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/xtensa/virt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index 638007f6d32..4ddb6b54739 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/target-info.h"
 #include "qapi/error.h"
 #include "system/reset.h"
 #include "hw/core/boards.h"
@@ -119,6 +120,7 @@ static void xtensa_virt_machine_class_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     mc->desc = "virt machine (" XTENSA_DEFAULT_CPU_MODEL ")";
+    machine_class_set_name(mc, "virt");
     mc->init = xtensa_virt_init;
     mc->max_cpus = 32;
     mc->default_cpu_type = XTENSA_DEFAULT_CPU_TYPE;
@@ -128,7 +130,9 @@ static void xtensa_virt_machine_class_init(ObjectClass *oc, const void *data)
 static void xtensa_virt_machine_register_types(void)
 {
     const TypeInfo xtensa_virt_machine_typeinfo = {
-        .name          = MACHINE_TYPE_NAME("virt"),
+        .name          = target_heterogeneous() ?
+                         MACHINE_TYPE_NAME("xtensa-virt") :
+                         MACHINE_TYPE_NAME("virt"),
         .parent        = TYPE_MACHINE,
         .class_init    = xtensa_virt_machine_class_init,
         .instance_size = sizeof(MachineState),
-- 
2.52.0.windows.1


