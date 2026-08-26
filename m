Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813A6C61DC4
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 18:43:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzIaQ-0006yx-4d; Wed, 26 Aug 2026 14:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIaN-0006rh-JE
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:42:55 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIaK-00029M-FN
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:42:55 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2d032846c95so18067365ad.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 11:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787769771; x=1788374571; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IukQGcRHMsVbGXSG1mzI1R3dLtKOyYm2L7shctiJxkE=;
 b=joIL65oGCWHBM68YknwbarQ86NWE6PJIuU0usv3GZ34DvI+Lh3RO03h0F//fDJMmq+
 wIJeZTcRYV5n/2ofIyOL8f4/3ZkKE9jC+zkaZPajjUbW0BBjsw5xxB6IYCYwpCUGqpEG
 QZMIzmwduYHcHLwZrUvaurVCFhoTJp/1FyMWYNKEXAdrbk0ePIu8dyE9Mk4jPG5OWkmK
 OZW7SAq2d2APxke/IF9OWMKvyqpc1lLBRBJFHN5V6ZTjoDs45WkxIQFtREHBM1ZEb+7d
 t48/YBYKs1uhGmkwukbiy7Q9PivS+KfASN+k6hkOUyJ7BUQzT4Dyj5oT6nqDevhmF5YF
 Dh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769771; x=1788374571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IukQGcRHMsVbGXSG1mzI1R3dLtKOyYm2L7shctiJxkE=;
 b=lw2x8pJBGMjjLYncQ44W57tlaGnf7mFjJbl0JAQEFOWuLAT7t++E2FVLll82bzatXe
 JgOXbDUkpWRAN1bMaYvZXa3+UYcpHUOO6lhcAt/xj/d5vuooDQYd0K3rt3K/j1yHakCr
 QQh/Vh8S8vu0MXMjwImeK4TMM9dp4EHvqhhGG36wogf5artI1Ks4/4ie2wMAR2cQKH8k
 RZn8yDYclrv81Vj/I2fkfLLHbOqanxdRj1cGUlw3dElD/65RwWBQW5e3SUVSbRTbdUJf
 PvqMsui4jXG0U0bBHPWPkgVkYtE+2rOoypmX0sitAOxmqZJdNNFLgJ0LRK2Yv+wnxJtO
 UdYg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq0AIP10Vwmx0yyFgFCuko5nJ+v1k630SsTGPixPaf9Zw4ZgEEYn5rELQjVJJZOSqSw3vc4wsKIq/qO@nongnu.org
X-Gm-Message-State: AFuF++lCwJy5NFo4vDd5NHSCm8Pfqpum+mi7YgwYNsxJy2maEepdhQr3
 o1sZqKltHAbkWkjdXXvntMJ4IrlFS6ryTv8BXAfxwm9ShVW0j4s/plFz
X-Gm-Gg: AR+sD13Efm5A3ZaYYjanCg7yXGMuILS8O8wCU1VwllXiz6fseki+6knoflMXu7bxf9i
 us3e5RwRKh54EI7Ud67hZaVVf9D2rVveaHLiI9cO0gxHD4CdtO2dNuYvqvLyzMxqKH5wkqdTYJs
 SIe5pOWc1ZASbFDuzHrt+u/TKgZ0TfGZ7grVeWhcqzZsd2Oej8liCIj3GoKkTz6yb8FHfM4Dcb5
 Yq0HKChG4CFm6pW0At32bdkVvRVAkNB5lfjTRyylGE3OuqcRpE+4STOn0YJWBVtZYhDvMU8Sy9H
 rguFkONucCGZlmgWimvVPkTP3/xvpPH0FtKoFTdWic+bqfNLnUZBfi72LaD4z75YHiBH11OUSIm
 tYDvzGmc7mfYhJ7eBihyDjm8n9lfvGtelMqzACHmob8CnluFwrUCJJu0pXxM9tUTcM2Ac3MWweY
 dy6nZ9IZFmbt3uhuGBUaFPHkafmj4iu6Tdheel6Z7nkKdM9JHxhfnpa94QczGeOT0C90PNazYwI
 eWcAMBwQwKJxl+9c3cAJg==
X-Received: by 2002:a05:6a21:a382:b0:3cc:22bb:8911 with SMTP id
 adf61e73a8af0-3cf833389c9mr19772223637.6.1787769770909; 
 Wed, 26 Aug 2026 11:42:50 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3283d60c291sm17681846eec.6.2026.08.26.11.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 11:42:50 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bibo Mao <maobibo@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alexander Bulekov <alxndr@bu.edu>, Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Ani Sinha <anisinha@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 01/13] accel: use a shared TYPE_ACCEL_CPU parent
Date: Thu, 27 Aug 2026 02:42:15 +0800
Message-ID: <20260826184229.1145-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260826184229.1145-1-luoyonggang@gmail.com>
References: <20260826184229.1145-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x62b.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

- TYPE_ACCEL_CPU was "accel-" CPU_RESOLVING_TYPE, so each arch compiled
  a different parent (accel-arm-cpu, accel-riscv-cpu, ...). Common code
  registered only one of those names from target_cpu_type() at
  MODULE_INIT_QOM.
- A combined binary still registers every linked AccelCPU subclass.
  RISC-V tcg-accel-riscv-cpu has parent accel-riscv-cpu even when the
  selected target is ARM, so the old one-parent type_init does not
  cover the other family. Creating the parent in the subclass
  register path would hide that, but it keeps per-arch parents that
  AccelCPUClass does not need.
- AccelCPUClass is arch-independent. The parent only supplies
  class_size and ACCEL_CPU_CLASS(). Make TYPE_ACCEL_CPU the fixed
  abstract type accel-cpu and register it once next to TYPE_ACCEL.
- Leaf names still encode the CPU type so accel_init_cpu_interfaces()
  can look up "<accel>-accel-" CPU_RESOLVING_TYPE (for example
  tcg-accel-arm-cpu). ACCEL_CPU_NAME() keeps that string; it is no
  longer derived from the parent type name.
- Drop register_accel_target_type(). Subclasses keep
  type_register_static() with .parent = TYPE_ACCEL_CPU.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 accel/accel-common.c             | 21 ++++++---------------
 include/accel/accel-cpu-target.h |  3 +--
 include/accel/accel-cpu.h        |  2 ++
 3 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/accel/accel-common.c b/accel/accel-common.c
index 00a400243f0..c4c365f38c7 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -126,21 +126,12 @@ static const TypeInfo accel_types[] = {
         .instance_size  = sizeof(AccelState),
         .abstract       = true,
     },
+    {
+        .name           = TYPE_ACCEL_CPU,
+        .parent         = TYPE_OBJECT,
+        .abstract       = true,
+        .class_size     = sizeof(AccelCPUClass),
+    },
 };
 
 DEFINE_TYPES(accel_types)
-
-static void register_accel_target_type(void)
-{
-    g_autofree char *name = g_strconcat("accel-", target_cpu_type(), NULL);
-    const TypeInfo accel_cpu_type = {
-        .name = name,
-        .parent = TYPE_OBJECT,
-        .abstract = true,
-        .class_size = sizeof(AccelCPUClass),
-    };
-
-    type_register_static(&accel_cpu_type);
-}
-
-type_init(register_accel_target_type);
diff --git a/include/accel/accel-cpu-target.h b/include/accel/accel-cpu-target.h
index 6feb344e29b..cf33ebd79fc 100644
--- a/include/accel/accel-cpu-target.h
+++ b/include/accel/accel-cpu-target.h
@@ -24,8 +24,7 @@
 #include "accel/accel-cpu.h"
 #include "cpu.h"
 
-#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
-#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
+#define ACCEL_CPU_NAME(name) (name "-accel-" CPU_RESOLVING_TYPE)
 DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
 
 #endif /* ACCEL_CPU_H */
diff --git a/include/accel/accel-cpu.h b/include/accel/accel-cpu.h
index 9e7eede7c3c..5cfc2b24223 100644
--- a/include/accel/accel-cpu.h
+++ b/include/accel/accel-cpu.h
@@ -12,6 +12,8 @@
 #include "qom/object.h"
 #include "hw/core/cpu.h"
 
+#define TYPE_ACCEL_CPU "accel-cpu"
+
 typedef struct AccelCPUClass {
     ObjectClass parent_class;
 
-- 
2.52.0.windows.1


