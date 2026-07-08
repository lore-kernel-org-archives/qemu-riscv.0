Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C722AC43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 16:20:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1whUzb-00014j-9M; Wed, 08 Jul 2026 12:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1whUzZ-00014F-H1
 for qemu-riscv@nongnu.org; Wed, 08 Jul 2026 12:19:21 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1whUzX-0006yh-Ty
 for qemu-riscv@nongnu.org; Wed, 08 Jul 2026 12:19:21 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2cca0c5799eso7798385ad.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Jul 2026 09:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783527558; x=1784132358; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=562gT512wWfhkRLNgMwPwc9/wP2/605Q6dgoo/Dp1wo=;
 b=g+WnTvLao2rnEwwKrL5Dx/xGkpAE3k0T81IewyO45IK73CpG6ZC78FynXDEUch18ef
 XJo65/De2BgfbxTT6By+tdMiT1hwcyh89nXS4iWn+Ners2mzltBavsgjfSm9T7ih8GV2
 S6oQfU8Vu8bNFh53Uq1WylfxRw9nsSnmZ5z0kmMaDZdBP9+WFMVH96PZnDIMEzBuCZXH
 NWTnT30fOdpwAKbLi8LGakvI7NcbYd4N63usmhaIIzk6xSGMMqcdJac/npRrIrF2K192
 XJxzKE6iAK1YKDEyGJ/+PWvvommNGLgLLR+crOGqCfrgL7QxkUU/EQlhRzVDBHQIIirS
 kpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783527558; x=1784132358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=562gT512wWfhkRLNgMwPwc9/wP2/605Q6dgoo/Dp1wo=;
 b=Cswf8ntnoTTx+mqB9c9MIoBQMcSui7/pLapO5Ec5s0PuouU9Sf8ERvfobzeyxIF9UY
 IIITPnmRxrFNAJC9kbsi9ME5xZB4sJKD6g2dftFroPAUexmq7DonHboUU7z0PQfP68Ul
 apqcvy4CEduxwPukCQXnVTGB85Oxm1jZwL2T31ntkudTHsz7Foe91MhKrEvYBYLoa/5d
 rJThG1tjmIZkKZEb6/YGcmROd9AInB2OmDQxT43s+f+Gh1ox4NR5hIJSmGEQll9Y9M5i
 V//KKJtl4GVcIDhnPw1x5Vpu8Yjdac/qb/h+QSbZ7LxwDkWY4VmPekkscTPd0A1MaX0a
 wU6g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrVdFb2ZVPBfQlFOgT+h8e7+42YvQhUS7P+mREmBuAGG8e0CERGEYbhr2hoI0NPat9wLUDXExhZ30KR@nongnu.org
X-Gm-Message-State: AOJu0Yxjoe6lE6uyMzqzJ9WNGS0Qka5ERJvycuS9zoLgxplHNPQwMXet
 TiZbp9LmcIdMwjK/03R/98SVni65uARu5Os8lBUBu9LQdIJqOc8u0qLJNg5YsxIAJWQ=
X-Gm-Gg: AfdE7ck7lldhctOExVfqjUhLeLGWQPeommRL7XaS/8/DXiPtQ2J+p0E+v/EYr6PfVx3
 M7Uef9lVjaOuAGx4pwZjDUpC2u58SyktZKfiNw7U33XXE3zdUOjuCoA/hG7PbYHRlV0hm8xtkwM
 J1nXxBmu8DGcHrXlj695GcZe17XBPPW7spzcsbeWcxOa1VoFsxEa7K13eB6RZIpQMN0RLLHv63S
 GlsOXSMq+eWQ6g0tqdA/3tK0SAbKLsW+VptvKPGNFVoVK0voSuFljUV7XJtfbfBhn2FryM+LnST
 mQbZQ1M9RaklU+LQFStWB4vcueCmKiDx4ve2Lr8pry8pHQDtV+GAoxDOO++BbuViqAYMAAtj7aG
 VTMwyTFV0ydc3axct08txvTmCHXEGcBjh4bCpmxVya8rEnPRIU+CYJ2fGrlGxhq4k2d+s2WWRKA
 TLGFx3/PLlOmvp5NT/E8WE9O1pR4m+E7Y9p2GMWCirdK5Yn8pR8xPlFaqUIByQX5iFVhRTtBMN1
 eF65dzFlP+a+F0m
X-Received: by 2002:a17:903:11c7:b0:2c9:b48c:fdde with SMTP id
 d9443c01a7336-2ccea45abeemr35104855ad.26.1783527558477; 
 Wed, 08 Jul 2026 09:19:18 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bdb56fsm30789265ad.15.2026.07.08.09.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 09:19:18 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 4/9] target/riscv: Add implied rules for Zvfofp8min
 extension
Date: Thu,  9 Jul 2026 00:18:54 +0800
Message-ID: <20260708161859.1124848-5-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708161859.1124848-1-max.chou@sifive.com>
References: <20260708161859.1124848-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add implied rules to enable the implied extensions of Zvfofp8min
extension recursively.

Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 38c580a22a..8cd1a5e056 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2668,6 +2668,15 @@ static RISCVCPUImpliedExtsRule ZVFHMIN_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule ZVFOFP8MIN_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_zvfofp8min),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32f),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 static RISCVCPUImpliedExtsRule ZVKN_IMPLIED = {
     .ext = CPU_CFG_OFFSET(ext_zvkn),
     .implied_multi_exts = {
@@ -2826,7 +2835,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZKS_IMPLIED, &ZVBB_IMPLIED, &ZVE32F_IMPLIED,
     &ZVE32X_IMPLIED, &ZVE64D_IMPLIED, &ZVE64F_IMPLIED, &ZVE64X_IMPLIED,
     &ZVFBFA_IMPLIED, &ZVFBFMIN_IMPLIED, &ZVFBFWMA_IMPLIED,
-    &ZVFH_IMPLIED, &ZVFHMIN_IMPLIED, &ZVKN_IMPLIED,
+    &ZVFH_IMPLIED, &ZVFHMIN_IMPLIED, &ZVFOFP8MIN_IMPLIED, &ZVKN_IMPLIED,
     &ZVKNC_IMPLIED, &ZVKNG_IMPLIED, &ZVKNHB_IMPLIED,
     &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED, &SHA_IMPLIED,
     &SSCFG_IMPLIED, &SUPM_IMPLIED, &SSPM_IMPLIED, &SMCTR_IMPLIED,
-- 
2.55.0


