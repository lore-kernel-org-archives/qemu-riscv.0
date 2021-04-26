Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lb71S-0000UQ-VQ
	for mharc-qemu-riscv@gnu.org; Mon, 26 Apr 2021 15:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71R-0000Qo-KC
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:35:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71L-0000AH-2Q
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoXlpYDNcisrlAbO/UUpY9wHK6QDGT6jB/1qXMxl4wc=;
 b=Cf+x5OLmmPk+sAvYARbKbUDKkpczKIUUyxn+fB9NULDtikuHGk0+hs/HsbnoVB7AQ57PIl
 k3xyvw7QePwjKGMS6CMLfThxx+fdZZX/ggs8CV+YYZVCdKEI+/SkkqAuUGhW004oL4C8oe
 RUjc5v29rf/OoFWRh88mUfDUWDttRHY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-e-A6mIFONdalSYIN3Vl5_A-1; Mon, 26 Apr 2021 15:35:48 -0400
X-MC-Unique: e-A6mIFONdalSYIN3Vl5_A-1
Received: by mail-wr1-f70.google.com with SMTP id
 89-20020adf83e20000b029010c35eb9917so1576417wre.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Apr 2021 12:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uoXlpYDNcisrlAbO/UUpY9wHK6QDGT6jB/1qXMxl4wc=;
 b=MQw+gozA/QeXmXA6D/3oIxSaZkAPTpwyNXs6p5n7Pw+U8bPYnpfHtE5+YC0+PO31J1
 3xOBLcu2X2JwXmFcoN5zlWjxtJF7YaYX1s2w6pIIrf+jpEcJMSgf7qWvqrRziNUdpFxx
 9YAQip9RNIYshnLC54ti8X3QXYW6G4jmhDW6xeG8skAkhNpxBUz2ML+jSxep2mrGkbik
 b+LOjRb64oOudl5i2bNBdY4cPjHHVOr53DTJvEn07RNWrfIoYL+uuhprlAaEV5EN4Zlk
 taCWSRtwLprWxPrPyWF3hX3ApJNmCH/l/J6aFH3vwlmn6+0taZzmJgl/d2pRUstnAIo4
 ZmKA==
X-Gm-Message-State: AOAM532lBLa56BOGNFnSTYXz6LIwx9zR5Rr7rUx8Q9exXt3TNPh1y2L0
 0UniVGOe7Sdi9f3GWuZnypv0+e4Gw1rX0ubH12oukNEOCiqwMm2ewbiQMijUxQ2koDWf9szbA4t
 QvA09RePMsz/vovQ=
X-Received: by 2002:a05:6000:12ca:: with SMTP id
 l10mr18376201wrx.145.1619465746787; 
 Mon, 26 Apr 2021 12:35:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI96ZTANWZjfJONUkNwrqi8hhrvWBdNhqFQRXfNfB3PusmpCZuLW8R0wrQdeXofl0jkM5HaQ==
X-Received: by 2002:a05:6000:12ca:: with SMTP id
 l10mr18376193wrx.145.1619465746673; 
 Mon, 26 Apr 2021 12:35:46 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id k188sm484762wmf.18.2021.04.26.12.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 5/7] hw: Have machines Kconfig-select FW_CFG
Date: Mon, 26 Apr 2021 21:35:18 +0200
Message-Id: <20210426193520.4115528-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426193520.4115528-1-philmd@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Apr 2021 19:35:58 -0000

Beside the loongson3-virt machine (MIPS), the following machines
also use the fw_cfg device:

- ARM: virt & sbsa-ref
- HPPA: generic machine
- X86: ACPI based (pc & microvm)
- PPC64: various
- SPARC: sun4m & sun4u

Add their FW_CFG Kconfig dependency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig     | 2 ++
 hw/hppa/Kconfig    | 1 +
 hw/i386/Kconfig    | 2 ++
 hw/ppc/Kconfig     | 1 +
 hw/sparc/Kconfig   | 1 +
 hw/sparc64/Kconfig | 1 +
 6 files changed, 8 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8c37cf00da7..3b2641e39dc 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -8,6 +8,7 @@ config ARM_VIRT
     imply TPM_TIS_SYSBUS
     select ARM_GIC
     select ACPI
+    select FW_CFG
     select ARM_SMMUV3
     select GPIO_KEY
     select FW_CFG_DMA
@@ -216,6 +217,7 @@ config SBSA_REF
     select PL061 # GPIO
     select USB_EHCI_SYSBUS
     select WDT_SBSA
+    select FW_CFG
 
 config SABRELITE
     bool
diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
index 22948db0256..45f40e09224 100644
--- a/hw/hppa/Kconfig
+++ b/hw/hppa/Kconfig
@@ -14,3 +14,4 @@ config DINO
     select LASIPS2
     select PARALLEL
     select ARTIST
+    select FW_CFG
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 7f91f30877f..9e4039a2dce 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -52,6 +52,7 @@ config PC_ACPI
     select SMBUS_EEPROM
     select PFLASH_CFI01
     depends on ACPI_SMBUS
+    select FW_CFG
 
 config I440FX
     bool
@@ -106,6 +107,7 @@ config MICROVM
     select ACPI_HW_REDUCED
     select PCI_EXPRESS_GENERIC_BRIDGE
     select USB_XHCI_SYSBUS
+    select FW_CFG
 
 config X86_IOMMU
     bool
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index d11dc30509d..a7ba8283bf1 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -131,6 +131,7 @@ config VIRTEX
 # Only used by 64-bit targets
 config FW_CFG_PPC
     bool
+    select FW_CFG
 
 config FDT_PPC
     bool
diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig
index 8dcb10086fd..267bf45fa21 100644
--- a/hw/sparc/Kconfig
+++ b/hw/sparc/Kconfig
@@ -15,6 +15,7 @@ config SUN4M
     select STP2000
     select CHRP_NVRAM
     select OR_IRQ
+    select FW_CFG
 
 config LEON3
     bool
diff --git a/hw/sparc64/Kconfig b/hw/sparc64/Kconfig
index 980a201bb73..c17b34b9d5b 100644
--- a/hw/sparc64/Kconfig
+++ b/hw/sparc64/Kconfig
@@ -13,6 +13,7 @@ config SUN4U
     select PCKBD
     select SIMBA
     select CHRP_NVRAM
+    select FW_CFG
 
 config NIAGARA
     bool
-- 
2.26.3


