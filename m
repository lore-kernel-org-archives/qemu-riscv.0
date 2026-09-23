Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F79EC9830C
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:34:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9Mzw-0003iF-OC; Wed, 23 Sep 2026 09:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Muw-000316-NJ
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:21:52 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Muu-0007bO-6T
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:21:46 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-142dd04edb5so1438926c88.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169702; x=1790774502; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BQcT2TCunpJ4XJOGDsLRORw+wafc2yMdlkK9/vuTXoQ=;
 b=hovb+UG123yJ0iFy8hYjDlL42a9rfNrNMpr4VKTPi2epP/sZ2RkJcV2DasIOh2Lpxj
 fELlPhSL2hI50esjfO3GnkZMsFolxNUv2sIBe/4aJpWLrQ6HtuzkvGD+kXOvSfYoX4nl
 pP5b7d+iEJwXysHl6tCkxmj+UBdyUzN5nf5gYfDB6ffZz/cR8gK6kbOCGUUGMlCI/00p
 TL8XBYNBjK4hzVcXRsGw57ldrMdmRCQVZJgPUEn+xPiNcnYTgcj2XEzqyAaDiPyB93vC
 YPOdaXs9hqN15lAlzrYpLJd9a9jeyTqpaZ2zHj/dPVu0fkiHPTmBX5hEvj5fycw2XZsF
 0kuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169702; x=1790774502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BQcT2TCunpJ4XJOGDsLRORw+wafc2yMdlkK9/vuTXoQ=;
 b=vHUsfGIc1TROySFlwY3+WIpsebakGenZpuFxsmBbQdQyixuif3cN5oV0aCnDzdCoj8
 U+NEw+ZpIvZH7k5YiNg6PKwcGWMpqc1YQdCQV7MPYmX5BkkXoWqzCd6k7enVvUM/+Hl5
 eg4NWt0+Ut7fezbUUgFgUQn3e12+b1/PWhcn1+Gk+bioa7lSaKdbDucQDFGKo5c+bXwW
 uNXs9W24D4bCKp5v/+3+D4Dj9lKZs64eqnv1h36kOM6VidoAd69DtnzadpwZqGxa44Pk
 zQEI+MP6sfyI4F3XXt68srZVncW3kJKH4sJUILJsAIQiDaIs0Ygp+/wLDOjSrw43t9Fp
 +U5Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBy7Blrse2LVeiuubZIzk5EjTjoPKjdIDrarSTzfr974qHEkJmN549c44hRt0K8JTSWWPfRmULZX94oJ@nongnu.org
X-Gm-Message-State: AFuF++nYRVnByXPny2iZidFvUjBcrRVRKhRVx5ZpAfBZuqPGVgg9PsyR
 omBfsXKj8l5IzOjHpL5rCdISo7O8fIghmjsgHtpwmzRPVjKUtVwNLo7I
X-Gm-Gg: AYBFou24Ec10uDKTtsTwLwS+2Z39mOaibkKgNeV1owORCdZqe/APr0fbQTCvUmHgl7Y
 lMWO2wXuMbY1L639xpYpDRrucr4rES5v1vuaDatbxh8A9KpR+C7zDCaGO6SbN1vxjN3BEHn3A40
 gkBCoFzy+lP8I+dWCKztKMckcCoRRGc+plYkDQuqtQ342/tE7rIfsXsR+5SogunAnyHAF6IVKza
 FbSR4KmiFKx/jKLnEbfu1EYQunTVbd6RsYPTSGssR6H8DnKexhI/PZ84vFCYBgKCenVfKJJDSQt
 VbBdqj1MHTUZU4pFPgj7M+5ahl66p4GmXV8BwBxVs4JdSZ5GNrfeJmSMczc7DCNBRrLrHOsYdxm
 lUOkS5rGiHA9BJZ3ayaOPhZeDbjHN/RUx/MIeTIvgstx9BxLTBTM7O9RuZAzJWYcI2L2aYI1/Tg
 ER0EaxWJ0xrFFUmCNUxwDS033wD5kMREhlBYi/55NqcuQyGdNQ5VeQtmRnvrYuAly6QS3YWr3Uz
 0Xe2PsPo9bSf5yVUBUZktyM/EFS/P2GisjZT2GNngE=
X-Received: by 2002:a05:701b:4551:10b0:144:fd7c:84f4 with SMTP id
 a92af1059eb24-144fd7c8641mr1564469c88.5.1790169700288; 
 Wed, 23 Sep 2026 06:21:40 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:39 -0700 (PDT)
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
Subject: [PATCH v3 028/114] hw/intc: use kvm_enabled() in APLIC AIA helpers
Date: Wed, 23 Sep 2026 21:15:02 +0800
Message-ID: <20260923131635.1894-29-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

- Replace CONFIG_KVM ifdefs in riscv_use_emulated_aplic and
  riscv_aplic_set_kvm_msicfgaddr with kvm_enabled().
---
 hw/intc/riscv_aplic.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index d8e25bfda14..03a0852b8b8 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -167,7 +167,10 @@ bool riscv_is_kvm_aia_aplic_imsic(bool msimode)
 
 bool riscv_use_emulated_aplic(bool msimode)
 {
-#ifdef CONFIG_KVM
+    if (!kvm_enabled()) {
+        return true;
+    }
+
     if (tcg_enabled()) {
         return true;
     }
@@ -177,21 +180,20 @@ bool riscv_use_emulated_aplic(bool msimode)
     }
 
     return kvm_kernel_irqchip_split();
-#else
-    return true;
-#endif
 }
 
 void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr)
 {
-#ifdef CONFIG_KVM
+    if (!kvm_enabled()) {
+        return;
+    }
+
     if (riscv_use_emulated_aplic(aplic->msimode)) {
         addr >>= APLIC_xMSICFGADDR_PPN_SHIFT;
         aplic->kvm_msicfgaddr = extract64(addr, 0, 32);
         aplic->kvm_msicfgaddrH = extract64(addr, 32, 32) &
                                  APLIC_MMSICFGADDRH_VALID_MASK;
     }
-#endif
 }
 
 /*
-- 
2.52.0.windows.1


