Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D507DCAC5B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 09:08:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0z0I-0004R8-9q; Tue, 23 Sep 2025 05:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1v0z0B-0004LJ-0a
 for qemu-riscv@nongnu.org; Tue, 23 Sep 2025 05:08:00 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1v0z01-00005a-4Z
 for qemu-riscv@nongnu.org; Tue, 23 Sep 2025 05:07:57 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2698384978dso45166245ad.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Sep 2025 02:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1758618467; x=1759223267; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vvZnoVopgO+vVIobVK5W/azjACmzwY/8WsAkXBWzMOY=;
 b=nPYLCub83pkFOYgcDMv22CPTOzymanxbNYR3euSE5+IyYiaips9CRJggwnuOIx6I+9
 o67Q27votnxgX2IHURYLMfUFvZ76y4IPHcoHd/7xp1/yJWOORcqZGuaGlGwx9fsJDzK9
 Zik5RL8KoSA1RI5VI4Tju8UgoHPPbBMFGuTsGmVeUIkU/IpZ8YXrcdzpAsAsjWPGvS0s
 0rjwL4p6OrZuuZb7SPFDuVEMiL+dEWDoJtzeQU2fM+BbIOUibtwtPbrDl7NGd7UKfFfY
 e+oqwqZAmte+4D9VyLpOqVS+IiCsyZXs4QieK9bPFkHqF4uHIUIKpjeVXGkHGP/Xob7W
 yxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758618467; x=1759223267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vvZnoVopgO+vVIobVK5W/azjACmzwY/8WsAkXBWzMOY=;
 b=OxVi+eBdoRcAWOpzLkNuQRR8vq4mWnR0jmDBI7npFalXXpx8n8/4jMNPMremaHfG7O
 9kJaUw9vxvsgw1ZEoF3ISXDMwJ/+WKgrNTx6jtYaVm3Tgjgv/34piodrml8nD8n/u6Bb
 cKO7XZKBU2aSa268mUkj5Uy43nFKNp9LYbSdTr7h5B3fv9sWrKVIcoEdOmUIlcFxFlkh
 IBHlgAiRC3HaWZleX6e/4sqmCSVtjgF0Qa5VdEECtiVdE3koT0ijTvhu5+IW3YoWc/pW
 CExIp5dKZUlkL7u798DXGdOvlXl7jLJt44DXWt06h9wvIWyBQmKoTZ7TgPmqVj8yoStj
 e08Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIe6vDE5Ff2ldxasPgZ7wkYqXyTheJk+bIQVVxbnq2kVXeh3nlasVOLTixeFGXfuxevvA78NSn9hfK@nongnu.org
X-Gm-Message-State: AOJu0YwzrPbMvlt9sXQFGGkYf5iOby+6Upw7TQZY2Qi3F9LA18zGVOeo
 VDSCwmXsHkmZopCevPUAzb46mHjD4u4zRj0RC6dvfsALE00yU6AEEER2CTmObUK8KoQ=
X-Gm-Gg: ASbGnctfYiJ3g7SiC9SOvO+iGRCpbLTl5kErXEkG4nTGDPDL6uMSvtn65hZQ3TjuonY
 GFOsW2BGPEy0htj5oV84SZH8OLmduHIF+0Fwiy3qcUXIlJcexSUj0tUXrXTqh0QJ2E4q0BYxDiR
 EbdP0Dyu1MQdUyeffuwrlmK2ylnoB2JO5AZ2U4ZHBG5kbtLJKE8jDMyeXRt0uI7ujaqPOBC44mi
 Lv6sTPZwLEdeDbeKSXCtPnwX6naUlFaUpyp5Gx1jYrKPArqOki+Uk1wTnMBzo+OzERLsisalwwy
 Cgt4tizxFMOsal+dsgDxbMspA66C3zuNlQu3HPtelZx3jBNnRdD/IBtcBiCMMqa7N+d1dOUQ4If
 3vJOa4K1EuTMzRaKyPsJc6vGg6uWDkhXfrkxkEwv4AIyQ0Gj6w9SH081F2H+midYrhzg=
X-Google-Smtp-Source: AGHT+IG+0y2srJ2JYUnN52fG2LoVoYCbwcMfOcRxg+HWUMV0x1Iqgukvc0dqT1IWn4sB9CqDe14KzA==
X-Received: by 2002:a17:903:19f0:b0:26a:ac66:ef3f with SMTP id
 d9443c01a7336-27cc09e378emr21133705ad.8.1758618467437; 
 Tue, 23 Sep 2025 02:07:47 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269800530b7sm157486245ad.18.2025.09.23.02.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 02:07:47 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 2/2] target/riscv: rvv: Modify minimum VLEN according to
 enabled vector extensions
Date: Tue, 23 Sep 2025 17:07:29 +0800
Message-ID: <20250923090729.1887406-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923090729.1887406-1-max.chou@sifive.com>
References: <20250923090729.1887406-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

According to the RISC-V unprivileged specification, the VLEN should be greater
or equal to the ELEN. This commit modifies the minimum VLEN based on the vector
extensions and introduces a check rule for VLEN and ELEN.

  Extension     Minimum VLEN
* V                      128
* Zve64[d|f|x]            64
* Zve32[f|x]              32

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/tcg/tcg-cpu.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a6f60f55ceb..02d99bb0ae9 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -416,12 +416,21 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
 static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
                                  Error **errp)
 {
+    uint32_t min_vlen;
     uint32_t vlen = cfg->vlenb << 3;
 
-    if (vlen > RV_VLEN_MAX || vlen < 128) {
+    if (riscv_has_ext(env, RVV)) {
+        min_vlen = 128;
+    } else if (cfg->ext_zve64x) {
+        min_vlen = 64;
+    } else if (cfg->ext_zve32x) {
+        min_vlen = 32;
+    }
+
+    if (vlen > RV_VLEN_MAX || vlen < min_vlen) {
         error_setg(errp,
                    "Vector extension implementation only supports VLEN "
-                   "in the range [128, %d]", RV_VLEN_MAX);
+                   "in the range [%d, %d]", min_vlen, RV_VLEN_MAX);
         return;
     }
 
@@ -431,6 +440,12 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
                    "in the range [8, 64]");
         return;
     }
+
+    if (vlen < cfg->elen) {
+        error_setg(errp, "Vector extension implementation requires VLEN "
+                         "to be greater than or equal to ELEN");
+        return;
+    }
 }
 
 static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
-- 
2.43.0


