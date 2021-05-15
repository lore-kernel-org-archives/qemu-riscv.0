Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyEH-0008K6-3f
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEE-0008Br-Vj
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyED-00063q-8h
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRNuc1gJMH1hkdyUyCI+kE/vTfEuz1keBAJWrXytcEA=;
 b=Vs8SfRFPdkIz3vwYGyBGi6+kaY0wNBmVKfzEE0tvYhTIkRkc8BKKj5yt1ZZAorI5FTURRE
 xRag/V0YbFEq28HSdWb76fGLTBxfG8iGrrBIH28Ei8ppmikhXg3x8nMBhxtiZAdcK+xrpP
 db01RnmIc5ZYQBIlUOoaMGFIonTRRKo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-KnjzNJyMO5mZnMSAOL7VLA-1; Sat, 15 May 2021 13:37:25 -0400
X-MC-Unique: KnjzNJyMO5mZnMSAOL7VLA-1
Received: by mail-wm1-f71.google.com with SMTP id
 b128-20020a1c1b860000b029015b52bdb65aso1655584wmb.5
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wRNuc1gJMH1hkdyUyCI+kE/vTfEuz1keBAJWrXytcEA=;
 b=C20UysryYo7mds1X7JED09q3S4s0Y0/9ijmzRjfEF6q9uOCjgrO8VibCNmA9ywnhLS
 cZLx17T0L9Q5/yoQ2TgYNdo9GqAJ15GeDibBIs8+zYbXTdPJvf41nzRyYrOTMMq7e9Y5
 6RyuuOpyaLekSCGOpD0g79y8kqZSgQpLjJElPY983FNzQwvw8LdHaF2zuZ3qCKb5R4mI
 EWRqM0ol+sxEXsdFiIvfs4Ek+dUKYXrRsuvl49MLu2GvL4Fc+XBYjzalY3AZKDZ/0QZ7
 YCYPQ78UXyF0MioP7AVp+z0CC+SGwU1ClK5VtiUjrMLOIA0GFNQp2iDdKCRYCNW875Hb
 posg==
X-Gm-Message-State: AOAM532LF2kSrc16VBtemJ9OdlVzIBjoRMa/m9ZMQQT0aUzPzcTxexVy
 /C9FwQ/lVdK9fMsogXbmiWy6ubs00kU27gAc+UHAODf4jPzuSrfSN6FxaMK2kyXLvefYuWB7/pw
 WMLkrApcicEEXUUA=
X-Received: by 2002:a05:600c:4896:: with SMTP id
 j22mr14966965wmp.156.1621100243854; 
 Sat, 15 May 2021 10:37:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz2Ad0xL16eEWXWXC6gvEGKc994vEjz53rI4Fm7kubWnLVp0RG1vMfoeBQ+BzwAG7JYbnrQA==
X-Received: by 2002:a05:600c:4896:: with SMTP id
 j22mr14966953wmp.156.1621100243687; 
 Sat, 15 May 2021 10:37:23 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id a17sm2052985wrt.53.2021.05.15.10.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 01/12] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
Date: Sat, 15 May 2021 19:37:05 +0200
Message-Id: <20210515173716.358295-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 15 May 2021 17:37:31 -0000

Per the kconfig.rst:

  A device should be listed [...] ``imply`` if (depending on
  the QEMU command line) the board may or  may not be started
  without it.

This is the case with the NVDIMM device (it is certainly possible
to start a machine without NVDIMM) , so use the 'imply' weak
reverse dependency to select the symbol.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 default-configs/devices/ppc64-softmmu.mak | 1 -
 hw/arm/Kconfig                            | 1 +
 hw/i386/Kconfig                           | 1 +
 hw/mem/Kconfig                            | 2 --
 hw/ppc/Kconfig                            | 1 +
 5 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/devices/ppc64-softmmu.mak
index ae0841fa3a1..cca52665d90 100644
--- a/default-configs/devices/ppc64-softmmu.mak
+++ b/default-configs/devices/ppc64-softmmu.mak
@@ -8,4 +8,3 @@ CONFIG_POWERNV=y
 
 # For pSeries
 CONFIG_PSERIES=y
-CONFIG_NVDIMM=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b887f6a5b17..67723d9ea6a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM_VIRT
     imply VFIO_PLATFORM
     imply VFIO_XGMAC
     imply TPM_TIS_SYSBUS
+    imply NVDIMM
     select ARM_GIC
     select ACPI
     select ARM_SMMUV3
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 7f91f30877f..66838fa397b 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -23,6 +23,7 @@ config PC
     imply TPM_TIS_ISA
     imply VGA_PCI
     imply VIRTIO_VGA
+    imply NVDIMM
     select FDC
     select I8259
     select I8254
diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
index a0ef2cf648e..8b19fdc49f1 100644
--- a/hw/mem/Kconfig
+++ b/hw/mem/Kconfig
@@ -7,6 +7,4 @@ config MEM_DEVICE
 
 config NVDIMM
     bool
-    default y
-    depends on (PC || PSERIES || ARM_VIRT)
     select MEM_DEVICE
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index e51e0e5e5ac..66e0b15d9ef 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -3,6 +3,7 @@ config PSERIES
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply VIRTIO_VGA
+    imply NVDIMM
     select DIMM
     select PCI
     select SPAPR_VSCSI
-- 
2.26.3


