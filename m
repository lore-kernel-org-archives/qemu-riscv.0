Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53891C83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:04:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZEXs-0000xT-SK; Tue, 08 Jul 2025 16:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCQl-0003XL-Hn
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 13:49:13 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCQ9-0005Re-O4
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 13:48:22 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso40230265e9.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751996851; x=1752601651; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bEOImi2VO3DZu8PRd+W9Z97+V53/R1U1vvMpOETczLE=;
 b=E1BL0jlb3O0tmbXRYXBb0xKEI+Vn08QiYKUSYTt+Z+IR9GGsu4rzVg6TIz63pJqszm
 s5PMEmQuaqPsYxkQrYYP9ekgtI05Sur6FkgWzkzF4vRZWPn1IynckyruT3masl65N/dD
 hL//WJ2yw6EEA/S2kUiVskZs2t5QkhuM5qPZphiRlCxozV75+FKT2S/1qb6EWukcp7o/
 dj4zVujNxEttAR6Euo6K2YGZSYhN0SDt9OftXmPvBM6Bb1krWhDD2Cfis/PwFQzDGAJ/
 ahSL8uJmp0wZN3lcylrM8BHXy29My9CFJFB6vqrRVHRhN0m6BMJMJzvyE38asgwu47SZ
 zebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751996851; x=1752601651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bEOImi2VO3DZu8PRd+W9Z97+V53/R1U1vvMpOETczLE=;
 b=CWeattFfE7o9Jd3FU05I1EaZEAslMTKuysbZ4t5JdM7WuEd/dsLQqR4pqoLjUiOZhX
 KtuH0REPg4cCkuOLlRyEJT6K/BHE+a8Vs7J42QEH+P0WP7QCAkG/Q+j0lGIdAbgRGdBX
 Fvfuf1AvkTloE9dZIrAzXi3tGfPCCWBAIn53oG89RO1GYst/NhO6pRSrMpXOl9mK2Hue
 aSYrSuGlavYXgqBWtqhBrv6TZ+W3bQ95hcCsbeO18Rj/BcCIZDqzfF+prdrZuKmQAcit
 J8+I9b+3eH4ag7FGZkw5WoMqsPBTRbIG+VlCmuL7ecbJpu6SlrSNEQzy6Y9xh65tcvAB
 HAaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaFtZMfSa6L11TPp2T+W/rrsOzkOP66lHEELgeqF7bRrQ/QDfbGFKMaNi/tnaY0xMBWwMVzGwy9v1Q@nongnu.org
X-Gm-Message-State: AOJu0YzlREP4X6t/AzoechZScDxXU0DkoWPatoxcBOmqr6wjohCJZjpd
 mpzL/XNoqKn/XL++YTz7No7QPmH8WdCvM/Pdj/TCyT1dTqKb1VtmgNtvISgmyJD7FsAiZbaz/dU
 uTxuz
X-Gm-Gg: ASbGncvLSJUh6lRvwUo+x/bB39xgrinAW8Ff4AFxcRbGELJRx01oxZPAe5sCHShqI+q
 WTBWj0v8ftA4m8tFo/OJaz8UrZZGcrlY8V/z8/yVgutUIwAWGWFDRmo0v0SRMeMtziXa+ZflWPs
 I3xI8fezi1lm46MchpWiaHrJv3l++5BGGzSF3EGl+8aXB4+dpYFqHekpWpwASaA7y6xDzu4JKfT
 SC87/eYu9IJmke4WKcQIqecTFMuq3+oOkHNOCIMi5Myu8rnlLdng4lXzBLNaUhDta5b8UXfWjRt
 TD7xyQ7mrY02gudqPEkPw+Ic72BPrrS+Ms7uvaorNFqUCrIt3CdW11GGVklwbjY/T5gdU9F66pS
 GOBcoedL0pa0Nc2dhZoosSL5CyTD3nNiefALj
X-Google-Smtp-Source: AGHT+IG2E4JIlXfdQQvRjce8IXIvZNIOOF5rgjcL1X02SY3IwGdbbfoCXCdaMg6vCkSGBjZ9LVYmXg==
X-Received: by 2002:a05:6000:2c06:b0:3a4:f2ed:217e with SMTP id
 ffacd0b85a97d-3b49702e79emr12971492f8f.42.1751995451388; 
 Tue, 08 Jul 2025 10:24:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b966c0sm13781596f8f.52.2025.07.08.10.23.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 10:24:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH-for-10.1? v7 8/8] hw/virtio: Build various files once
Date: Tue,  8 Jul 2025 19:19:48 +0200
Message-ID: <20250708171949.62500-9-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708171949.62500-1-philmd@linaro.org>
References: <20250708171949.62500-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Now that various VirtIO files don't use target specific
API anymore, we can move them to the system_ss[] source
set to build them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
MST prefers to defer this one to 10.2.

 hw/virtio/virtio-config-io.c |  1 -
 hw/block/meson.build         |  6 ++++--
 hw/virtio/meson.build        | 20 +++++++++++---------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/hw/virtio/virtio-config-io.c b/hw/virtio/virtio-config-io.c
index ad78e0b9bc5..f58d90b6e31 100644
--- a/hw/virtio/virtio-config-io.c
+++ b/hw/virtio/virtio-config-io.c
@@ -11,7 +11,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/virtio/virtio.h"
-#include "cpu.h"
 
 uint32_t virtio_config_readb(VirtIODevice *vdev, uint32_t addr)
 {
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 655704471a5..43ed296cf47 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -13,7 +13,9 @@ system_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80_sfdp.c'))
 system_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
 
-specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
-specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c', 'virtio-blk-common.c'))
+specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
+system_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk-common.c'))
+specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
+system_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('virtio-blk-common.c'))
 
 subdir('dataplane')
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 164f6fd995a..3ea7b3cec83 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -1,6 +1,7 @@
 system_virtio_ss = ss.source_set()
 system_virtio_ss.add(files('virtio-bus.c'))
 system_virtio_ss.add(files('iothread-vq-mapping.c'))
+system_virtio_ss.add(files('virtio-config-io.c'))
 system_virtio_ss.add(when: 'CONFIG_VIRTIO_PCI', if_true: files('virtio-pci.c'))
 system_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virtio-mmio.c'))
 system_virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
@@ -10,11 +11,11 @@ system_virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev.c')
 
 specific_virtio_ss = ss.source_set()
 specific_virtio_ss.add(files('virtio.c'))
-specific_virtio_ss.add(files('virtio-config-io.c', 'virtio-qmp.c'))
+specific_virtio_ss.add(files('virtio-qmp.c'))
 
 if have_vhost
   system_virtio_ss.add(files('vhost.c'))
-  specific_virtio_ss.add(files('vhost-backend.c', 'vhost-iova-tree.c'))
+  system_virtio_ss.add(files('vhost-backend.c', 'vhost-iova-tree.c'))
   if have_vhost_user
     # fixme - this really should be generic
     specific_virtio_ss.add(files('vhost-user.c'))
@@ -43,22 +44,22 @@ if have_vhost
   endif
   if have_vhost_vdpa
     system_virtio_ss.add(files('vhost-vdpa.c'))
-    specific_virtio_ss.add(files('vhost-shadow-virtqueue.c'))
+    system_virtio_ss.add(files('vhost-shadow-virtqueue.c'))
   endif
 else
   system_virtio_ss.add(files('vhost-stub.c'))
 endif
+system_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c'))
+system_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 
 specific_virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
 specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs.c'))
 specific_virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem.c'))
 specific_virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock.c'))
-specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c'))
-specific_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
-specific_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: [files('virtio-nsm.c', 'cbor-helpers.c'), libcbor])
 specific_virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
-specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('vhost-user-scmi.c'))
-specific_virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_SCMI'], if_true: files('vhost-user-scmi-pci.c'))
+system_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: files('virtio-nsm.c'))
+system_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: [files('cbor-helpers.c'), libcbor])
+system_virtio_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('vhost-user-scmi.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
@@ -67,6 +68,7 @@ virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk-
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vhost-user-scsi-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('vhost-user-scmi-pci.c'))
 
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('virtio-input-host-pci.c'))
@@ -85,7 +87,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MD', if_true: files('virtio-md-pci.c'))
 
-specific_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
+system_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 
 system_ss.add_all(when: 'CONFIG_VIRTIO', if_true: system_virtio_ss)
 system_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
-- 
2.49.0


