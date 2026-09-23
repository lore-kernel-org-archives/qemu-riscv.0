Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC71C98311
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:35:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9Mzx-0003lo-9V; Wed, 23 Sep 2026 09:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mv4-00037i-JK
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:22:00 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mv2-0007d6-Ed
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:21:53 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-33bfb26865fso752660eec.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169710; x=1790774510; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RGdh00utr6Q+OpO6+8fa0s0hS8SKHylDK/Tx/Y6cmu0=;
 b=cDDfpBCySBH32oiRMbbc3wET7+qAmSUbgRgPbREKfLnwc8Zx+7WVgGLof5BQPPrZxI
 eU98aNmX3P9/z5jzjdUjnfMB60sSF2uu1Wb4jmf0xj+7zPNuVdKKqspWUc+JSvIDvk7n
 dDlZHS8+M/3PLQNkysmhzIB0QL/dODTpTWZJdNgV1OQ2hrBaq/mvYR90hcSKPQK6vGV+
 YcQsaQVj+V3o6z8TdOlxBj8M0GGDZjvocOA50pZA/X0XVA89hHcVrCvX/SKVzZflQQCf
 BuG8y1akNEzv4pHoJAJz52vSR4ESpsNwTlj9ij/W4FWKI/EGG2s+GeecRznq2642U1XX
 GlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169710; x=1790774510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RGdh00utr6Q+OpO6+8fa0s0hS8SKHylDK/Tx/Y6cmu0=;
 b=OqokAd6+N2dQ5xlcDvmJ2x+RiC2oXpi/uBCq+ay80o4zOkghCgU45zX4sPXVtTOonv
 CT6uHk42r4TYGYfF/9d5Vso/2GlbPHoz3ZC/9Y/pk7b/QLRUZT5VsH0RJqx6vUC+q1RR
 HeDauaKMf7Ggw8EEsNW9oyTq8MasqCgzPcUDoTr69vwy6QtdCsCQu0j+0q4+IhwHm6Xq
 2kwg0v3G+V8wzvUJ5O+mtuD/6IkwetfWgj0bn6tZ50rAkP/eBZ2OBFMYiZcPiNnYKXDt
 72Sb1X8o+g9Oc2f6tLtXRon3931aJoGUUZvEYN4m6ZpHYArWWnjI9REM1pcPzzKsg9Ux
 UYOw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxaHDslHvc+mqWLY9m6/iwBQxO7uCmOYBOIGc8RcBkuf8jCeaozq8+IQDnyv58B5onp0/EDaBY6IoIb@nongnu.org
X-Gm-Message-State: AFuF++m7wVQ5leO0BS5bahiDROQlXYt171yrpDVcqrDUuc7NWKhFQXKY
 H6G5et34t1IY8IWf3FFV/rbixZyk+ZybDp8X2h/kxKiqpTbBv2eCeeXC
X-Gm-Gg: AYBFou1jJT9y9Nr2P6ko56OVteRXHAml2Dptvsmk3Vl4f5ZpVNG7y/Qu6sluU0DOuBC
 w/0J5B5xia43q9oHCKmsUxUfp1QvLFG0CbjNfmahuHN7Vfv9Gvy49Vd+/jng23LQQYtCG0AY9oR
 CdmJj8oC2eJjO/4M3rYscZynfq+zZDzePw0o0fdIyHQfsZaebU0/k+5AbTlNr0y5eM7EsXn93BR
 1C8s9IeCSl1adhDaym8hfG2jt0QspHA+OQJvRxtfWgjxPWhvikN+jt/zLshOzvE2aRDi30/fCH6
 RTbBAsGlR8/VzSXbg4HHLnR3JiMxxqOM59Zg7ZOZ5aUZ9NY8tRbH2Q9sEPd4D3pqtKFpqtBhMoJ
 I7T5wor+r3p3cYt+z95Zgu8PAKFAp2aF5tgqRmhkNCxw6/9E4i7hZPNCbAuk+LFwd3iS/sm5Fur
 GgMI2QgS/MUQ58fzcygAutmDl79olWN/l4G1qRODSSN80bcUQKT+GWRNOP8sDXRUnjoq9v736i3
 mOFfIka9RmVlmWkd/1QcrD+LCgkpnA=
X-Received: by 2002:a05:693c:88d4:10b0:33b:dcbc:6046 with SMTP id
 5a478bee46e88-33e8bc70ee6mr2596067eec.7.1790169709341; 
 Wed, 23 Sep 2026 06:21:49 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:48 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 029/114] hw/intc: send IMSIC MSI via kvm_irqchip_send_msi()
Date: Wed, 23 Sep 2026 21:15:03 +0800
Message-ID: <20260923131635.1894-30-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

- Drop the CONFIG_KVM ioctl path and call kvm_irqchip_send_msi() when
  KVM and an in-kernel irqchip are enabled.
---
 hw/intc/riscv_imsic.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index 30fb60cc312..033b7813060 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -311,19 +311,15 @@ static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
         goto err;
     }
 
-#if defined(CONFIG_KVM)
-    if (kvm_irqchip_in_kernel()) {
-        struct kvm_msi msi;
-
-        msi.address_lo = extract64(imsic->mmio.addr + addr, 0, 32);
-        msi.address_hi = extract64(imsic->mmio.addr + addr, 32, 32);
-        msi.data = le32_to_cpu(value);
-
-        kvm_vm_ioctl(kvm_state, KVM_SIGNAL_MSI, &msi);
+    if (kvm_enabled() && kvm_irqchip_in_kernel()) {
+        MSIMessage msg = {
+            .address = imsic->mmio.addr + addr,
+            .data = (uint32_t)value,
+        };
 
+        kvm_irqchip_send_msi(kvm_state, msg);
         return;
     }
-#endif
 
     /* Writes only supported for MSI little-endian registers */
     page = addr >> IMSIC_MMIO_PAGE_SHIFT;
-- 
2.52.0.windows.1


