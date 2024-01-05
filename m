Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E149C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:50:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmR1-00026h-7S; Fri, 05 Jan 2024 10:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQ9-000701-4p
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:42 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQ5-0004QJ-IK
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e3a67ca9fso3861635e9.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469656; x=1705074456; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6gZ5WhughGxcVou1a2gSnMeSMbcizgPZgg8bhDFRA4=;
 b=qhcaafY2wK1cDcfgx5MrK949O89dJJEHfaQa9rTTbysHcJivO4WmkmbPTEOpwWr1KW
 bHoD76itI+sdJQQq0quf06rpAZAXn7iIKB6AGPG5kNteKAlt2gTcuZ7j17SXBn0gNPgi
 XC672JaKdTfiLUxN6QN7+uLrDp5XY63k5w+yW1EVQTJzOFtvJOQpOFsy5OSpaiXEsYni
 2wIIjeTvG5gUym1imHNTTxcSvA28AHDMjwn84XNdmZ6ekAGz8855I7D9oRxmYUUoKsg8
 ZzVc7jYbFLh+zQ3PklsjDjbVsEmX1fHTfgvtbwtCreTeIH11At5HFulLf67+WoiTpNZh
 x+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469656; x=1705074456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E6gZ5WhughGxcVou1a2gSnMeSMbcizgPZgg8bhDFRA4=;
 b=bKnaHGH6dsv2P+E0U2P14vZdbtZ704oHcbeTQO129JIhNif5mIgGOtVs3QMHZYjcE/
 4ogLmUlZBTPV6QGshM4MCihVGcYSco52YRckj8laPQA40yx8IRSVjpjPSj9uMGOI2/Oy
 B3AnwbDSz7meCex37Uhq4ggNFKFZp9eRzxttfLIi0LxcbGDNIF5OxKieBPJQlZA/RsR0
 ofLgW3YePUNC/SeHLGiZZiuTJff2Dh1j5DbAPn8UJdRe0Jeewku4/DUil9QoXTSlWP39
 QbfP+W4rcJXfNmwgODQbqr6DHaiwTlNAD8RN46ZSpqV10b4/UlLPdetX6nTPyH8Fn3Qe
 cbqA==
X-Gm-Message-State: AOJu0YwqOPueYKoD2ZyHds3e1cniydYOWEL6AFI4i1Sh8TbdyjyHggZk
 5J5Mq1nXmShgUJ1HGntAdnEaFo8vXWotyg==
X-Google-Smtp-Source: AGHT+IFzrXk92OVa4Hc07WKubLX2pJnxCM7cZFqkIG+NhLFeRoIPs2kbo2iPM/Isgll3aWiz+yLeQw==
X-Received: by 2002:a1c:4b10:0:b0:40d:8810:620c with SMTP id
 y16-20020a1c4b10000000b0040d8810620cmr1318587wma.52.1704469656069; 
 Fri, 05 Jan 2024 07:47:36 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0040d6d755c90sm1933844wmq.42.2024.01.05.07.47.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 41/71] hw: Simplify accesses to the
 CPUState::'start-powered-off' property
Date: Fri,  5 Jan 2024 16:42:34 +0100
Message-ID: <20240105154307.21385-42-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The 'start-powered-off' property has been added to ARM CPUs in
commit 5de164304a ("arm: Allow secondary KVM CPUs to be booted
via PSCI"), then eventually got generalized to all CPUs in commit
c1b701587e ("target/arm: Move start-powered-off property to generic
CPUState"). Since all CPUs have it, no need to check whether it is
available. Updating this property can't fail, so use &error_abort.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20231123143813.42632-5-philmd@linaro.org>
---
 hw/arm/armsse.c  | 6 ++----
 hw/arm/armv7m.c  | 8 ++------
 hw/arm/bcm2836.c | 8 ++------
 hw/mips/cps.c    | 7 +++----
 hw/ppc/e500.c    | 2 +-
 hw/sparc/sun4m.c | 2 +-
 6 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 02b4f6596f..91502d157a 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -1022,10 +1022,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
          * later if necessary.
          */
         if (extract32(info->cpuwait_rst, i, 1)) {
-            if (!object_property_set_bool(cpuobj, "start-powered-off", true,
-                                          errp)) {
-                return;
-            }
+            object_property_set_bool(cpuobj, "start-powered-off", true,
+                                     &error_abort);
         }
         if (!s->cpu_fpu[i]) {
             if (!object_property_set_bool(cpuobj, "vfp", false, errp)) {
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 375a40962f..e39b61bc1a 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -318,12 +318,6 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
-    if (object_property_find(OBJECT(s->cpu), "start-powered-off")) {
-        if (!object_property_set_bool(OBJECT(s->cpu), "start-powered-off",
-                                      s->start_powered_off, errp)) {
-            return;
-        }
-    }
     if (object_property_find(OBJECT(s->cpu), "vfp")) {
         if (!object_property_set_bool(OBJECT(s->cpu), "vfp", s->vfp, errp)) {
             return;
@@ -334,6 +328,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
+    object_property_set_bool(OBJECT(s->cpu), "start-powered-off",
+                             s->start_powered_off, &error_abort);
 
     /*
      * Real M-profile hardware can be configured with a different number of
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 289c30e6b6..b0674a22a6 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -135,12 +135,8 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
                                 bc->peri_base, &error_abort);
 
         /* start powered off if not enabled */
-        if (!object_property_set_bool(OBJECT(&s->cpu[n].core),
-                                      "start-powered-off",
-                                      n >= s->enabled_cpus,
-                                      errp)) {
-            return;
-        }
+        object_property_set_bool(OBJECT(&s->cpu[n].core), "start-powered-off",
+                                 n >= s->enabled_cpus, &error_abort);
 
         if (!qdev_realize(DEVICE(&s->cpu[n].core), NULL, errp)) {
             return;
diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index b6612c1762..4f12e23ab5 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -78,10 +78,9 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
         CPUMIPSState *env = &cpu->env;
 
         /* All VPs are halted on reset. Leave powering up to CPC. */
-        if (!object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
-                                      errp)) {
-            return;
-        }
+        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
+                                 &error_abort);
+
         /* All cores use the same clock tree */
         qdev_connect_clock_in(DEVICE(cpu), "clk-in", s->clock);
 
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 384226296b..566f1200dd 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -955,7 +955,7 @@ void ppce500_init(MachineState *machine)
          * when implementing non-kernel boot.
          */
         object_property_set_bool(OBJECT(cs), "start-powered-off", i != 0,
-                                 &error_fatal);
+                                 &error_abort);
         qdev_realize_and_unref(DEVICE(cs), NULL, &error_fatal);
 
         if (!firstenv) {
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 17bf5f2879..64895aebe3 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -804,7 +804,7 @@ static void cpu_devinit(const char *cpu_type, unsigned int id,
 
     qemu_register_reset(sun4m_cpu_reset, cpu);
     object_property_set_bool(OBJECT(cpu), "start-powered-off", id != 0,
-                             &error_fatal);
+                             &error_abort);
     qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
     cpu_sparc_set_id(env, id);
     *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
-- 
2.41.0


