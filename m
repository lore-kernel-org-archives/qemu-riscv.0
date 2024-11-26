Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213DED3B984
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 11:24:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFtga-0007HX-PI; Tue, 26 Nov 2024 06:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtfP-00049S-QJ
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:23:39 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtfO-0002uo-1V
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:23:39 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so48156145e9.3
 for <qemu-riscv@nongnu.org>; Tue, 26 Nov 2024 03:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620216; x=1733225016; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KmjwRfDIQiUm8za7VsqVbrrytj9VplHKG4K4/ENa984=;
 b=BOhYvLSdzjt1xhenph6peYqQAZCaFEfgTDDtWJwzRS8p/m5xjIPCKAYrBQvIoc/h9C
 FPSJ4P/JaPdXdSLwTjzygzPr7h8oKKHAvq9ZPH2zbJEmTu9zSyKrAHfZIl8/wWciHG93
 dAo3KTAjE0AdvObLhPSF9XB7FVd0ohOHaA8chV5pyLOTrM5IY4ybwW8LgO2XXuhHc9L/
 YQy72N5VEAfHQlfLsfyIwo1yZId+5twyFUg15U6GXaCqX85BvzCC1yeK98yu3sNPY06R
 59HvK2OtTQOKUqoJSBREoo8nkupH1faqv3rH9vgPcusDID4pMzjQ0Al3YZA6NFp4N8wj
 FBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620216; x=1733225016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KmjwRfDIQiUm8za7VsqVbrrytj9VplHKG4K4/ENa984=;
 b=csQnnU0dmrlHhrweija2ROSBYpxTqlFUrqiIW5dUjY2oiAgC5TxH8HTn5jD+EoLdoI
 p8HmU743YN6eC0mW5vTJr+kVfcKpfCvEYlkxZXosZIelygYCEAYMH9A8CHaWyiweXnVH
 ErwzCymBOYc2nLhbHkrqxyH8MEpv2l3JbOOY2EMiH1XihaqD6MHF9hxUOKomCtyx2SGu
 yVpsqNjNxKLAQF8rXIV7V95qWJIT2t/qHP7Y+sm9EaaBdPC0+Sxf9PddQfqJNWqJ8MjK
 s/rpTKqfVA1bza5hi4lKGNxkB7fuW6tyLjpYKS0pZjHVp4fFN8HLhm1++UU6G65vqO2z
 o9DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjIxJnYK8JYt3tY2A8pzFwQanGDB36JTUszjrXs1np6+IX9xx3gQEeJWax/FFAaFVji1qqM5WAT13X@nongnu.org
X-Gm-Message-State: AOJu0Yx4SwqW52af7c5cmN84jQACG2ioTkJAOMFQDD1SttmMOvRY2h76
 kCLNrXhBEui4iC28nhR+cxFTrptJYvuSjquEOVS/59/RMp1/r876RQF8j/UAClQ=
X-Gm-Gg: ASbGncslmNw6JUAbVjej8vgPpfC0mTA+e+Rg+K7VKE+3TL+cv9YW9EP3Y/SHf2jEanH
 GqUuH/A7kxAc8TUFUrsRZWJXLqU0s5gcSCuTlF79I2l5Cp5Ewd23eEwhAkn7sYR9fRpPyQ6db89
 NqXFi1l9mEJmL4JnPG5KmpgXWNOwI9ZXcHUNP4XFkRz4Ulx5dmXLIcvRnVxpjB6KZ0mB3rwMzev
 edkizCVB0UZ4ewCUm8IeZPetxmTCVb2p1OhEbaUvA/eh1RJU3nt1SHt6F2+Li4r/jFTFZr4
X-Google-Smtp-Source: AGHT+IGNwk5YaoQ3MtMRaeTJJiZlPzdpzODnHSlG5QE/xiL6kyITv2jIVbls5681MCpH5aDCJT12rw==
X-Received: by 2002:a05:600c:3589:b0:434:a4b3:5ebe with SMTP id
 5b1f17b1804b1-434a4b35f4amr28161585e9.24.1732620216243; 
 Tue, 26 Nov 2024 03:23:36 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b01e1188sm231855865e9.1.2024.11.26.03.23.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:23:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 09/13] hw/ppc/spapr: Create host bridge setting
 bar_at_addr_0_refused=false
Date: Tue, 26 Nov 2024 12:22:08 +0100
Message-ID: <20241126112212.64524-10-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Since all sPAPR machines set MachineClass::pci_allow_0_address
(see commit e402463073 "pci: allow 0 address for PCI IO/MEM
regions"), directly create the host bridge passing
bar_at_addr_0_refused=false to pci_register_root_bus().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr.c     | 1 -
 hw/ppc/spapr_pci.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 5c02037c564..8af56bd68a2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4600,7 +4600,6 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     mc->default_display = "std";
     mc->kvm_type = spapr_kvm_type;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SPAPR_PCI_HOST_BRIDGE);
-    mc->pci_allow_0_address = true;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = spapr_get_hotplug_handler;
     hc->pre_plug = spapr_machine_device_pre_plug;
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index e6e8018c1cd..1d12c0b4112 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1886,7 +1886,7 @@ static void spapr_phb_realize(DeviceState *dev, Error **errp)
                                 pci_spapr_set_irq, pci_swizzle_map_irq_fn, sphb,
                                 &sphb->memspace, &sphb->iospace,
                                 PCI_DEVFN(0, 0), PCI_NUM_PINS,
-                                TYPE_PCI_BUS, true);
+                                TYPE_PCI_BUS, false);
 
     /*
      * Despite resembling a vanilla PCI bus in most ways, the PAPR
-- 
2.45.2


