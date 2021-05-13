Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhENB-0002XJ-Jd
	for mharc-qemu-riscv@gnu.org; Thu, 13 May 2021 12:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEN9-0002Um-Pb
 for qemu-riscv@nongnu.org; Thu, 13 May 2021 12:39:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEN7-0000yf-Rz
 for qemu-riscv@nongnu.org; Thu, 13 May 2021 12:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vt0rPlIVTA2zME2ANb52VRIm2f7ixfDlgEfuDufRLOU=;
 b=DifrLKt8WQtXfz///0p/NyK3IzmGMwd/9z0U6hELSw/08Oj76sUIe+lWKXeYFiDUPafayS
 BQ4wU9jnED+z62WnmDaV3aoyKbcLUgbymIscW0+PPkJWlKV+5j5BdpkswxfbKYTRIA6UFt
 yLwf5DUgATF+mg3EcTXW9TY7+ZxmROw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-U0jCiCRxOfug55m2ETCO6w-1; Thu, 13 May 2021 12:39:35 -0400
X-MC-Unique: U0jCiCRxOfug55m2ETCO6w-1
Received: by mail-ed1-f71.google.com with SMTP id
 h16-20020a0564020950b029038cbdae8cbaso3452668edz.6
 for <qemu-riscv@nongnu.org>; Thu, 13 May 2021 09:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vt0rPlIVTA2zME2ANb52VRIm2f7ixfDlgEfuDufRLOU=;
 b=WJAMAmtgKGpCCsD/pd5RKpWwTOWT4bmeqoeInPSPYuciTHaZFip4aUv3u1R/GobyG2
 L/DxtV1zdPerkFGCVIFs9R/Dd+SoOWYFNLNp5xz5CBtvmMk0CotJsFoL2nyD4d8KhFp4
 epdEFww9azODHO1mVHnSrWHBI0XoWp55keSTtZyUiDqoJJF1egmvJCuHHm9jCoCO5/Y4
 /fjDMqMvEXeYCEj0kzAiYHwPC48xsIobXCdsGcsO0WiwMB85+ImGNS5cCAb3h+NbcBVu
 BOIdBHBVUVc8mpgzJ2n60C0jnn5ryPxq1cynTqfg2fWjvi9BHDrV/vu964jUocpcQGF5
 k5VQ==
X-Gm-Message-State: AOAM533uMjMphEtsO/W9ocSJ786eX2Ysli5NWvz1E+MtGk/iqdTRp+LT
 U+FziXxV9L7vjNOEm9KMO9mXJvzcQiXnPF/746Uaj75MlxB6XfYQptbzQaFAp0pL+LBR+aMmO4W
 WVihL5NY5m7p6O7Y=
X-Received: by 2002:a17:906:9246:: with SMTP id
 c6mr45279424ejx.10.1620923974107; 
 Thu, 13 May 2021 09:39:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE1l7ofRjRJFGt9vB7ZIomsyEQvq5BC5uZr95cBlF78n+jfrvZh5DW7F56Oa6yX27iwzRPlQ==
X-Received: by 2002:a17:906:9246:: with SMTP id
 c6mr45279413ejx.10.1620923973899; 
 Thu, 13 May 2021 09:39:33 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r17sm2644904edt.33.2021.05.13.09.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 07/10] hw/riscv/Kconfig: Restrict NUMA to Virt & Spike machines
Date: Thu, 13 May 2021 18:38:55 +0200
Message-Id: <20210513163858.3928976-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
X-List-Received-Date: Thu, 13 May 2021 16:39:40 -0000

Only the Virt and Spike machines use NUMA. Add a RISCV_NUMA Kconfig
symbol and only have these machines select it. Adapt the Meson file
to only built it if required.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/riscv/Kconfig     | 5 +++++
 hw/riscv/meson.build | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index b72a248809e..b22736169c1 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -1,3 +1,6 @@
+config RISCV_NUMA
+    bool
+
 config IBEX
     bool
 
@@ -35,6 +38,7 @@ config RISCV_VIRT
     imply PCI_DEVICES
     imply VIRTIO_VGA
     imply TEST_DEVICES
+    select RISCV_NUMA
     select GOLDFISH_RTC
     select MSI_NONBROKEN
     select PCI
@@ -75,6 +79,7 @@ config SIFIVE_U
 
 config SPIKE
     bool
+    select RISCV_NUMA
     select HTIF
     select MSI_NONBROKEN
     select SIFIVE_CLINT
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index a97454661c0..ab6cae57eae 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -1,6 +1,6 @@
 riscv_ss = ss.source_set()
 riscv_ss.add(files('boot.c'), fdt)
-riscv_ss.add(files('numa.c'))
+riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
 riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
-- 
2.26.3


