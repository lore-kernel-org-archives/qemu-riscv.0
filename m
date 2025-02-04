Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024D4C02193
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 18:12:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfNMj-0005ys-KN; Tue, 04 Feb 2025 13:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNLZ-0004Ws-JP
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:08:31 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNLW-0007EF-CM
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:08:29 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so70146675e9.0
 for <qemu-riscv@nongnu.org>; Tue, 04 Feb 2025 10:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738692503; x=1739297303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bMSMAcw63WhCEzylD0QLkcsjYvnfbTQfvq7nklxvlvM=;
 b=p0QNvU83H3p+tcrSSgTyNs8LWmSz7YGir1NpF76mAZEeiveNhrTGoepDUwtYNuHNMC
 Q/TIOWYYIn1EMjITv0mW6YvPzFaoukS0h4/Z4Bg2NOPnobRNZFSlo483wEegT6l1/ovJ
 jR+l5S7wm42k7Ym7Z/ex2bkRH9huWPeT0dIXJ0YJCv+lW3Mc23WhOYJVxwUlP/GjnXen
 b42Dh3kM0w64gzV1THOkKT6xil9cQSuLRCP5SxwallUfIebuqB6aFkGPb6uN8haDtVxS
 TfcY+gc3WEOL9Q5AUt1dwUeTmBsNNxbsHpQASRa6dgs8KpzeTWRnBzG7rMYUkBOxFTAo
 CUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692503; x=1739297303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMSMAcw63WhCEzylD0QLkcsjYvnfbTQfvq7nklxvlvM=;
 b=HtpCNxKYAMc6mUzKWclhrtbmcXzRTO4wHHDVkHbPU7jqHdzSe5mYql/JQIl1DOMKGF
 ZX13uZuNR5FxqNXE34uOaiZR0kWuP4tIh00gG8N3JDovD0Ywhv0GrcwZk1/pDtSjdfdi
 KW7fZkBBQV8x/vfDG4jvTxKwPv6EOqjewmCj7sPzfv6erlN3wvxgaNpNlg23FD3G3zPH
 yeIHWakh1HTjuqD/s51XDxPHU37ri0VjTvF8wqcoOj+J3j4yb3AsEAtx6GjB2IFkQUlu
 J68ZzSHb3jEKky2cetmNj6WdwqJDs505AmfuZpy5o3Au/OiKDnit6GHxgPCY/+eX4YC/
 ebqw==
X-Gm-Message-State: AOJu0YzkAHfwAXeNQ0O+xZUHBaTG6RoGA93ekVtwX6s4okrgSQoAB17e
 r9NrY4hDkLoS2N59Gu8YfLCBiCKgAi2/z3XSvTGubpBpS6WpTdTTaJfyQzHOZnM=
X-Gm-Gg: ASbGncuv5ZzQNmy/WlSJQlLWbyzWIA6XY3QYLt9bx7ogER/mbt5J2Q6yMlM2PI56+Vn
 29CzDIJnclHL4K6gAOI0wNedI8s5RBkJ0LLwyHqCh0EHnzWr75X78/BXQ0crnRDVFRkZfKCvyV7
 /xgC2sGzL9GbD2MDX+YxG6/R/jdHyOKp+iqpbGrn3wKl39vhQsqa9QCbwl/OVU3w7WPVumu8lrm
 1E+YNULWw69igVGWpNla9EYtjfbqTEnFL39kxLptdnKTlYts0vDn8MDY8O1cfjVuLnbF4eXMItU
 3W193RK3IXsgZyCkmvbw+Aa4IoZgeh3DTOb4HxcibwKNHR607o5PRDyEKvQMph0DNA==
X-Google-Smtp-Source: AGHT+IHZdTZ+OJnBuP6c5qmk4fpnU8spBmVfG0X3H38kNS7QE9ROuw2kFwrPQZBsdjtzUL/9gJpE2Q==
X-Received: by 2002:a05:600c:3b94:b0:434:ff45:cbbe with SMTP id
 5b1f17b1804b1-438dc3cba35mr284144205e9.18.1738692503020; 
 Tue, 04 Feb 2025 10:08:23 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439069290c7sm23368375e9.0.2025.02.04.10.08.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 10:08:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 7/8] hw/riscv: Remove all invalid uses of
 auto_create_sdcard=true
Date: Tue,  4 Feb 2025 19:07:45 +0100
Message-ID: <20250204180746.58357-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204180746.58357-1-philmd@linaro.org>
References: <20250204180746.58357-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

MachineClass::auto_create_sdcard is only useful to automatically
create a SD card, attach a IF_SD block drive to it and plug the
card onto a SD bus. None of the RISCV machines modified by this
commit try to use the IF_SD interface.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/opentitan.c | 1 -
 hw/riscv/shakti_c.c  | 1 -
 hw/riscv/sifive_e.c  | 1 -
 hw/riscv/spike.c     | 1 -
 hw/riscv/virt.c      | 1 -
 5 files changed, 5 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index d78a96c5354..b9e56235d87 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -121,7 +121,6 @@ static void opentitan_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = TYPE_RISCV_CPU_IBEX;
     mc->default_ram_id = "riscv.lowrisc.ibex.ram";
     mc->default_ram_size = ibex_memmap[IBEX_DEV_RAM].size;
-    mc->auto_create_sdcard = true;
 }
 
 static void lowrisc_ibex_soc_init(Object *obj)
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index efe814b5868..e2242b97d0c 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -84,7 +84,6 @@ static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
     mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
     mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "riscv.shakti.c.ram";
-    mc->auto_create_sdcard = true;
 }
 
 static const TypeInfo shakti_c_machine_type_info = {
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 164eb3ab83b..73d3b74281c 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -153,7 +153,6 @@ static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SIFIVE_E_CPU;
     mc->default_ram_id = "riscv.sifive.e.ram";
     mc->default_ram_size = sifive_e_memmap[SIFIVE_E_DEV_DTIM].size;
-    mc->auto_create_sdcard = true;
 
     object_class_property_add_bool(oc, "revb", sifive_e_machine_get_revb,
                                    sifive_e_machine_set_revb);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1ea35937e15..74a20016f14 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -358,7 +358,6 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     /* platform instead of architectural choice */
     mc->cpu_cluster_has_numa_boundary = true;
     mc->default_ram_id = "riscv.spike.ram";
-    mc->auto_create_sdcard = true;
     object_class_property_add_str(oc, "signature", NULL, spike_set_signature);
     object_class_property_set_description(oc, "signature",
                                           "File to write ACT test signature");
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2aa420f6e55..241389d72f8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1918,7 +1918,6 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
-    mc->auto_create_sdcard = true;
     mc->pci_allow_0_address = true;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
-- 
2.47.1


