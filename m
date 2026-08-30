Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F46C61DD9
	for <qemu-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 16:05:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0i0j-000646-8e; Sun, 30 Aug 2026 12:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x0i0h-00062x-HL
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 12:03:55 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x0i0f-0007ib-K6
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 12:03:55 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-8541875f596so1117108b3a.0
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 09:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788105832; x=1788710632; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Z7X8vNXpfbUgmeDzjf4b8uyymeW/AhWIXS9gh5j9L1k=;
 b=VkAxLs97R5bsRlbNWulBp3eqD2giWFx0oVo2d6D6VcZONKdVTFaR2ki/5rsdTtagOa
 HkR9PgslK3MyEF2HKx0+xU+EbdrW5qVE2BGImR9Q4ZyWuuMvOYcE3LrrKzcjAsylVV8Y
 hf92j+ZMPurVg1S0htovXXFMZTGw6TfPb3ow7DvOUzTk1uigu1AqWMT1xnEApgIO6sqN
 KjA85lpCRvg6URyri0QFeBwfWp54CPax6O3FOvhYWBHT4U5gbT78U55+rPN4DKLPI8yI
 P3g8BTY8Zz/FZNs9CLgexeWyNPXfb9H0RW66nMnsAfvi1OH8Jdjtz5HoWHcS6QYmvFTs
 vPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788105832; x=1788710632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Z7X8vNXpfbUgmeDzjf4b8uyymeW/AhWIXS9gh5j9L1k=;
 b=tWCI89EjhihRqCXmo5zIq1Ph+30z854rWjxaaUi82WKd5xNjJTb51dt/AP8x5lyNHE
 bjZb1iK7Xz7AklAwN3xZ7OTdAYMK9ChWh9deVeChDhIN7Y07vmTZRBegSJI/L1uWtWOT
 F+eQJFEQZIv/WGYTr9SEKbDTtE3nvMpXfjgyEJMkGNh+TaA5Hkh1WvjH4/crI4FRCsPr
 vNm9VL7U8VqqcSPeSOqyirN6s1aNMbOz0rXoVIpmizf0NcJ5E9S3eiRrhPczY9uJgFUQ
 OGWpwMycSVBNw5vjLJW79gAIdkltTnTdil3xUdHOg6rBZTwAP0m87HHsPMbpKgJfIBrw
 nmqQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqVZetSsCWW2KOkKEzcqPTqhySt1Rk+tL7Dy1dZgeNbeKxFd4s2jbMQYTVairYSa7CWgJiNtkL9feAR@nongnu.org
X-Gm-Message-State: AFuF++nD72DmDEDAh/jKJeUubD4dhvD/gP5vCA6qHPeu0EQOf9q5aIWb
 Whb3y3C1KbPtngKbfcTD/uuIKagJAzAZIVS7ZaspSf1Mhx4d+3opH5Y566bCJGUc1Fk=
X-Gm-Gg: AR+sD10M3XctyroNPNd+SwYmnuXYnPmh+gircR+iYqPj9k7vXR6C8uK43F+sPwoK+y2
 HclNWu6DUxsTXAmTcvRszVjtWtVb98HIz7c8FergKUl0585QqZHnREcGKmOCuf0twfghRZj+yeu
 dmuTDFYxNdbmjOWUjAuu9wu/itCPHrb7DXJOAyqriGVIWAYMtnZEylcF1Q2o1Lz5Uecx301goGo
 9ZOLfJ8Qa5acmxRNKWdvkOCF2dRkmE8OJXlmF3nvZEMdLVS7Vgg5tI4wSMOo6gW5hk9Rsnrk09w
 1ZX+7NpoSIB534K/59gTwXKHtXP7Nf23lyq5HTDxEUHjrXqNCv5PCHmv0pEzQ4pOdsCBw18jN57
 PCnuyj0LzYyDDfl/Z0ToFeHl7Vi+Rpk/5rUCJLWEbzJp6LTuFe8BgFZ4y0Eut3TFHvah9M1xdjT
 IR5meklHZtPHOE+tBndttloTpwhg+EZDviMVYzSNyexeQUQ8ovFoRmZASpv865mKPZAPMUCYSER
 S4VpPHPCCfiP6J4Jtr2iYtUOZo+vR0Al5GX5Y1CZxhO3IerA/ZncyQ3hOibPUM=
X-Received: by 2002:a05:6a00:f04:b0:84e:89a:b8ec with SMTP id
 d2e1a72fcca58-8562b58e469mr36905267b3a.11.1788105832327; 
 Sun, 30 Aug 2026 09:03:52 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8569ff701d5sm2455900b3a.25.2026.08.30.09.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 09:03:51 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Chou <max.chou@sifive.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 3/6] target/riscv/cpu: Add SiFive custom int8 matmul
 extension implied rules
Date: Mon, 31 Aug 2026 00:03:32 +0800
Message-ID: <20260830160335.3441069-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830160335.3441069-1-max.chou@sifive.com>
References: <20260830160335.3441069-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x435.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Add SiFive custom int8 matmul extension implied rules to enable the
implied extensions of SiFive custom int8 matmul extension recursively.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index af61a1ab48d..4263b7de241 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2902,6 +2902,24 @@ static RISCVCPUImpliedExtsRule ZVFBFA_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule XSFVQMACCDOD_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_xsfvqmaccdod),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32x),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
+static RISCVCPUImpliedExtsRule XSFVQMACCQOQ_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_xsfvqmaccqoq),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32x),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
     &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
     &RVM_IMPLIED, &RVV_IMPLIED, &RVG_IMPLIED,
@@ -2953,6 +2971,8 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &SMCTR_IMPLIED,
     &SSCTR_IMPLIED,
     &SSSTATEEN_IMPLIED,
+    &XSFVQMACCDOD_IMPLIED,
+    &XSFVQMACCQOQ_IMPLIED,
     NULL
 };
 
-- 
2.43.0


