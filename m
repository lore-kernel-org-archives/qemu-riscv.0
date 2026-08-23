Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F86C5DF97
	for <qemu-riscv@archiver.kernel.org>; Sun, 23 Aug 2026 15:19:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wy9yH-0000gO-F1; Sun, 23 Aug 2026 11:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wy9on-000876-6O
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 11:09:05 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wy9ok-0000BR-Ml
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 11:09:04 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-cbb8b54fcf8so2558833a12.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787497741; x=1788102541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2w24/He90NoBe47Qt4gKRHsg9pnShD2f9kKavJ0MfiM=;
 b=HeYuM3gyRJ0X/srsCfrOXyXYPpJDdzMEOu+O+Id2ir6OJHihHO8rMXfiKw+2yV41oU
 dbumt34LzD4QdSyl8K6nQSimsROoUUWuutaUyo7joWyUL2Yd1RPXP1oRcWaY9P+Ikz+N
 vvCbXEkY4MD+Cf01fYxdyIU+cx04weMvvU+e7kvrbguGtqrCtqIIMpjjICaWVdCZE/XY
 TAcbc4YU0doAV4kqTqg48xI/AdONkDPk2O5+NxdwbkECDw2lGJD/YwwjkmEwPdWAayzA
 rAKnv1RQIsKa+Xd5lpnW17cahzkNO+kfO5ISe6F0/S2azkXsvMi7QUgVEVTU27BO1H3F
 ZO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787497741; x=1788102541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2w24/He90NoBe47Qt4gKRHsg9pnShD2f9kKavJ0MfiM=;
 b=Y25derXfJkevYMqtYG8Yu0gfpSRA+nac6f6Yc1oGodNWPaeodQRJAtOLpR+GfKQBoh
 z/5tu/0un4P9UV0WVxKGdUI0p7M+vKlulBfZ6DWtB91zBH5Rnp/7XK5Np/XXRbiZmhRL
 0/na/zYg5wRNRaAQDqs7aW/02ZsGKjvjqq0zv0GPiLMaTRxChrQUuKzekbhq6KZSqLIs
 FnD59T7M4J8CHqTyYWkcH5RqSFIq+JcwPbzaVBteyh6rpUvyD7zzgO9MwyYPvQPLyj4i
 uuu38glZWmYfsL/RpvGC27n8bjQTqVnII+07QliWLIKaOUFqpiyXm+jL7/0+FSeP/sC3
 tlCg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoxLKD76bRz1Eqk6dQ4s88AbOCh8C9DgvUW9rZIzr0xh+YGlQsghFCd6M4whHw1t+Giw/lNeyPsRKh0@nongnu.org
X-Gm-Message-State: AFuF++mZiTF9UXulL3YtaNzU660CM9j+voyGdYd489spCt9DolbCHd0T
 0b6Ekx9Ivxbq+4mxShIvVJUt4Hfvoj8YklzGPdVgiR+IUjhbNDXxUGQp
X-Gm-Gg: AR+sD12eGGow1Tg366z/UFRdUdmpC/CWX0/mQaIKW1W5GDKzGqfsepacZqEjQRI+2+M
 5rh94umqY0Ymj8Aeh38cIVKHSTQtpEPaD0anulVibzyxwVVGIEsm9JpKuXzw9l1NkjgypYgVb7W
 ZphCkVjJaSDV6FFDpmElfUXIrUo8UaIEgQjN94A8lvkkDuBeSZWa1vBS0TSIRTPFcb6yGvfbWYz
 zYPME2zgX1UhI/p9JOd3CXPHvoTqtawmKUsi2mHyFEEC6dkaSsb9iZlY4LQMEX+jpqKDD1aX03E
 3/eNnQKFRvsDVemUQtH7uN0iQKeuZsb78mtPP6Raq7rnaI+agf8RgKZnrUBatsbyXn4SbQMJ1Dr
 pDhn7YAMmLxb1xOwvXISJQTOvenGK/fsPcQKFErqAqvEO7QVLkOfvSrw/A+ula/7T/MNsmlh7wf
 nRLu5uXEJ4GwMEU4JbZgFEvwmz4l3Yx6OqkovMAL4LFfhWX6KGITJ+hljFopXiUGvv0BzMLmAQT
 VuLKpxvvYyGunfK/T6+Xw==
X-Received: by 2002:a17:90b:4a89:b0:390:8361:a532 with SMTP id
 98e67ed59e1d1-395c33bd6d1mr34692178a91.7.1787497740547; 
 Sun, 23 Aug 2026 08:09:00 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1418619d6ecsm16024511c88.14.2026.08.23.08.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 08:08:59 -0700 (PDT)
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
Subject: [PATCH 08/12] target/riscv: seed cfg.big_endian from TargetInfo
Date: Sun, 23 Aug 2026 23:07:26 +0800
Message-ID: <20260823150731.896-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260823150731.896-1-luoyonggang@gmail.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x535.google.com
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

GDB register packets use target_big_endian() only (gdb_get_reg16/32/64).
RISC-V gdbstub already goes through those helpers, so future GDB
big-endian support does not need a second endian source in the CPU
gdbstub. It needs TargetInfo and the hart to agree.

Hart endian is cpu->cfg.big_endian, copied into mstatus MBE/SBE/UBE at
reset. The CPU property still defaults to little-endian, so a
big-endian TargetInfo would make GDB swap as BE while the hart stayed
LE.

- Initialize cfg.big_endian from target_big_endian() in cpu init so a
  big-endian TargetInfo also sets the hart.
- Fail realize when -cpu big-endian= disagrees with that selection.
  GDB cannot follow a per-CPU override, so a split would silently
  corrupt register byte order.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5a82e6563bf..0681bec0bef 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -29,6 +29,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/error-report.h"
+#include "qemu/target-info.h"
 #include "qemu/timer.h"
 #include "hw/core/qdev-properties.h"
 #include "hw/core/qdev-prop-internal.h"
@@ -1226,6 +1227,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
+    if (cpu->cfg.big_endian != target_big_endian()) {
+        error_setg(errp,
+                   "CPU big-endian=%s does not match selected target endian",
+                   cpu->cfg.big_endian ? "on" : "off");
+        return;
+    }
+
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1407,6 +1415,8 @@ static void riscv_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
 
+    cpu->cfg.big_endian = target_big_endian();
+
     env->misa_mxl = mcc->def->misa_mxl_max;
 
 #ifndef CONFIG_USER_ONLY
-- 
2.52.0.windows.1


