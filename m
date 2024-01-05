Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37709C47077
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:52:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmQ7-0006vQ-AL; Fri, 05 Jan 2024 10:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPN-0004HD-48
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:46:54 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmP8-0003vP-NZ
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:46:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33748c4f33dso1401398f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469595; x=1705074395; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1hi5jkBMNGBwDBii6AMSMwfhTDlF/mIwoAbJvzijOtI=;
 b=qCQrTSHeb8lhQbAHPNaI2JAkUkJ1CVQkgO/ZBQF5lCeLNDuCcgM9afPxF+/FJ/TBhc
 zMxILoEuhw0Sw6EwTEQAVe/c0ZLzUf6jwnaD2ftjefVezmm8S3EBsHDvA18vn1bEKJ/O
 Kr38nY0Sb9XYsQoe7syHuCY3InuUs2WgWZkZkYtkFyUT4GmBiv6TLN4mQlKVp+/IRyp7
 NWtEHAzcmjI3iX3PdR4vLqsXRA99q0FzH74EGUpqNhRHy5hYK9f/KTJzCGUMzx0syOpQ
 VyL1Jd/AkSnDIcdJ2joyzvcAciLEZW+/LJ9mYJPK8rUTQZ/j4WEzO32HhAuydZmb4Yf8
 wOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469595; x=1705074395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1hi5jkBMNGBwDBii6AMSMwfhTDlF/mIwoAbJvzijOtI=;
 b=Luy3xfuVb7zhnI/pWdORSsgtkUlW38tu75fVQAyKCXxDt7cPWWlT4l98FRRhjGwyXz
 Nm6zCuYmD7ZTqsgoeFCb/Aq6o1SsiAEpR2AVwm++Sb7Lee2coNVLFB9B43XJAaX+uXXR
 2FeS5GdIIO/gijDhFSn5H5R+508pMedOAMJD0RIWcLJYq3curtzr2sy6bPX6ZNbE98Hn
 9Wqt8vLCveCtgswpLB4zq9QR///qG0pRjcYtRAJw590Rrf7idcjfncJeKkDB6SYdy2iL
 Pw5gNtecpOvNLNXchGeJi+0HSo6rcvM04xo681d392um2Ur4UYcFGOqTPAwQ0MKVfu7s
 NSKg==
X-Gm-Message-State: AOJu0YwVGtgN5mjV5S4oC0FR9lzeoqUek042uxBwXBF6BmU+inpkBhIm
 mgs5lSeEBQJYoOB21Ec6N1rI9o2rj7oP0w==
X-Google-Smtp-Source: AGHT+IG9tc/jLgaKDL2Qg6eCM9FJfemxntZKCZaoRWdcSm9eNff6H0Y80zJN+t6b6DZhbrFf3lxssA==
X-Received: by 2002:a5d:4808:0:b0:333:5665:fa86 with SMTP id
 l8-20020a5d4808000000b003335665fa86mr1445590wrq.18.1704469595241; 
 Fri, 05 Jan 2024 07:46:35 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 o14-20020adfeace000000b0033690139ea5sm1617406wrn.44.2024.01.05.07.46.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:46:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PULL 30/71] hw/arm/sbsa-ref: Check CPU type in
 machine_run_board_init()
Date: Fri,  5 Jan 2024 16:42:23 +0100
Message-ID: <20240105154307.21385-31-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Gavin Shan <gshan@redhat.com>

Set mc->valid_cpu_types so that the user specified CPU type can
be validated in machine_run_board_init(). We needn't to do it
by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231204004726.483558-8-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c | 36 ++++++++++--------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f3c9704693..477dca0637 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -145,27 +145,6 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_GWDT_WS0] = 16,
 };
 
-static const char * const valid_cpus[] = {
-    ARM_CPU_TYPE_NAME("cortex-a57"),
-    ARM_CPU_TYPE_NAME("cortex-a72"),
-    ARM_CPU_TYPE_NAME("neoverse-n1"),
-    ARM_CPU_TYPE_NAME("neoverse-v1"),
-    ARM_CPU_TYPE_NAME("neoverse-n2"),
-    ARM_CPU_TYPE_NAME("max"),
-};
-
-static bool cpu_type_valid(const char *cpu)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
-        if (strcmp(cpu, valid_cpus[i]) == 0) {
-            return true;
-        }
-    }
-    return false;
-}
-
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
 {
     uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
@@ -733,11 +712,6 @@ static void sbsa_ref_init(MachineState *machine)
     const CPUArchIdList *possible_cpus;
     int n, sbsa_max_cpus;
 
-    if (!cpu_type_valid(machine->cpu_type)) {
-        error_report("sbsa-ref: CPU type %s not supported", machine->cpu_type);
-        exit(1);
-    }
-
     if (kvm_enabled()) {
         error_report("sbsa-ref: KVM is not supported for this machine");
         exit(1);
@@ -898,10 +872,20 @@ static void sbsa_ref_instance_init(Object *obj)
 static void sbsa_ref_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a57"),
+        ARM_CPU_TYPE_NAME("cortex-a72"),
+        ARM_CPU_TYPE_NAME("neoverse-n1"),
+        ARM_CPU_TYPE_NAME("neoverse-v1"),
+        ARM_CPU_TYPE_NAME("neoverse-n2"),
+        ARM_CPU_TYPE_NAME("max"),
+        NULL,
+    };
 
     mc->init = sbsa_ref_init;
     mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n1");
+    mc->valid_cpu_types = valid_cpu_types;
     mc->max_cpus = 512;
     mc->pci_allow_0_address = true;
     mc->minimum_page_bits = 12;
-- 
2.41.0


