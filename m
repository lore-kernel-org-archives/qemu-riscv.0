Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C446075DEF
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=RopoA85t
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgt1-0002fA-Gm; Wed, 04 Nov 2026 14:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsY-0002GX-3U
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:39 -0500
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsT-0002Ke-To
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:37 -0500
Received: by mail-dy1-x132a.google.com with SMTP id
 5a478bee46e88-36d6e342f98so1155207eec.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821352; x=1794426152; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r0F7wiKG9LD1+Wdy0dzzhVEva/0PrXC8srYHsHCOBis=;
 b=RopoA85t/N+mdBinfSn6RV3eu6+yjGeBq3OIzUAMAu7Q9Tas0zlXEQHoTrln05pvhn
 wqhEe7B5DPei3w9qij4B0ipl7e9ScNC1Sd+F0zus4tMPprBWKS4IlJyHwU4Bvm70qP4+
 Tx3dGVhqNveNjrtTw7n3Z1gGMbUL+Zv1gTkkSk3cy913iXAeexMABKQzu5KskBdh9gbD
 iQ1w2QPK1B2NrhU93sDfsSPbo3AKAq8ObEj0syP/DN00rMF3ymOji+iUXQf05kAkCmHX
 ZhwXw81PdLt58zDeRTGu9UyFzL7O8lwKQFwTv2Ri5MXQ6BHop98w6aYbheAkrBkkV+J9
 mZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821352; x=1794426152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=r0F7wiKG9LD1+Wdy0dzzhVEva/0PrXC8srYHsHCOBis=;
 b=Fy28g/39HnmCudBRhcrrQK/kYhnj31LKGh7BYC2/nUIfDjRpTERuan9MxWw0gf0amm
 DfhGUGfNiCsIMJxO0pwjuKKc+b0FZwOWF3xUkYZbdOVP6eOfMrkY6/L/0nS2SeSxcx05
 /vRk1IbwCqEHOe/wrvyJq8rEARM3XjIVDINur9Tb9QA1issQ4wTR/FCZ9zK7GUwM0eh1
 tXidEpzSq+SF6eQiRjpm77YZxRWQbm5FIyTP4NAICYBKb8MIOx0TfoUvCopxglgPoAlT
 qXB9YTp9HLg/iixN4uU9L3ZAaFStWSWDlM0j3LtQWx7g8MpTbiJdl88HoAW15VLwX04t
 bX2w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzKhUmsDlvtmYjSSlHl02lRqwSpw7LFA/W1JBkAGiXlhg6sd7uz6Nr3t0/GE8oCVA5O+SXTgnLM3N9G@nongnu.org
X-Gm-Message-State: APuU4Z9HLvkz+ht/plic7z9/YgttNZDCCaUfef87D99DPKGmFFIiJjnc
 Lg8KNe1bMxUiBYu+n++tdWc4d0hidHgBoxTnfA3v49ohV1N4A2IXP8i/Hbu//n20Hec=
X-Gm-Gg: AYBFou0GaMCE4PGB+c3s3AHg5E0wHtibWpqZO8fubOEq/kUu1WmRkZ583HBcYX1Hw/A
 AYIx3if7NolVlSrcScz2zMGG5rEz0i+rNIjFhzmp/X2drp/9S04JYGleSmiJCJ0nFACnGDTfbgt
 PorUcpMucTosshyE+POueQT6SlZ4YfBUtx/to1RC0RFVYY/kBKFPZrprodBx7btvngNkYU5632i
 9wp02UmAtpQY1UI6Fcf7VYe76u5mbgL1BMwBE4kwesP7tKJRMONKj6gPXTgHRefNROeUD4uw7OI
 nzaQH4T1HkT2AX+Rhgoqp853A5Ztls+mFu1wWmpYGt+7ONwUgRxfuo/zhI+jQydISPHeQgHNBK4
 hx0GMK7mzV69nAT3RDNjzHEPqM5QuYIblEuEhcFQs59xa/fHQfOs/sImqjEcMLNShTWSPXLEFm6
 AhS8dhuPKWzZLqrUTvoVO0z3NyzPzegyIPpY0s/HPsN9WsTvlT8QmlS2CTgT0Lf7smIFywt+LnB
 6ZdVd4p+q2qNlzShtj8g5FW4TqCy35kIAxhjaiG0DNfshIQjzbFESPB8uH/r05k0dpv+m5UVvn9
 PtSDL4p880aEYhs8lRb3KarVY4B4n/XAOlIaQhUveNrn2OsgkrdgFGn7oLN4vNFMDheVwxUZEQr
 tbmreEsn0qBO2Ibi5BkbjP9PrS2p4
X-Received: by 2002:a05:693c:4152:20b0:36a:1807:75a4 with SMTP id
 5a478bee46e88-36a423cacb4mr28913198eec.20.1793821352192; 
 Wed, 04 Nov 2026 11:42:32 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:42:31 -0800 (PST)
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
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 05/38] target/riscv: Add implied rules for Zvqwdota8i
 extension
Date: Thu,  5 Nov 2026 03:41:20 +0800
Message-ID: <20261104194155.679241-6-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132a;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x132a.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add implied rules to enable the implied extensions of Zvqwdota8i
extension.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 96a1d76c5a2..08b14782451 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2851,6 +2851,15 @@ static RISCVCPUImpliedExtsRule ZVFHMIN_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule ZVQWDOTA8I_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_zvqwdota8i),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32x),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 static RISCVCPUImpliedExtsRule ZVKN_IMPLIED = {
     .ext = CPU_CFG_OFFSET(ext_zvkn),
     .implied_multi_exts = {
@@ -3055,6 +3064,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZVKS_IMPLIED,
     &ZVKSC_IMPLIED,
     &ZVKSG_IMPLIED,
+    &ZVQWDOTA8I_IMPLIED,
     &SHA_IMPLIED,
     &SSCFG_IMPLIED,
     &SUPM_IMPLIED,
-- 
2.56.0


