Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C08608FF3A
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=UciwVdIx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtV-0003fn-1q; Wed, 04 Nov 2026 14:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtT-0003dv-HO
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:35 -0500
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtR-0002a4-Va
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:35 -0500
Received: by mail-dy1-x132a.google.com with SMTP id
 5a478bee46e88-33bf40b0c8bso2447268eec.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821413; x=1794426213; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SXahEjEZ59pFRWeQJKGqQMg/M7dhg8DontEO/dam/Uo=;
 b=UciwVdIximOQFTATbJTY8wImNcoT80d99cuwvMwwnVb+XUVz93kaGFS2h+TEJcbUv4
 rzQdmj95P1zOtaVXCEIuuCNw7KFFLmvTPjZ3OPtzlyryU+uUa87+EM8RW4BK+DpWxqTH
 OB0Pi3XV5yEfj3NcCWs+dKKfEzjzmYf7EPLQPisuUB5h2/3v9ZtGB5Xx3ezCFwoQIKjk
 oomf3wUSPY8Mu+F4AGFrDbs9vJAj1EYyBw9WogJrE28NATy6WEk1LNZkgAA58+zBkE4D
 ndLB2UzeC7n6MrozZLzTTvpIZcca79esj/PTySYK9gs7ayl2gk/jT4M4DUWYD44RkboP
 j2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821413; x=1794426213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SXahEjEZ59pFRWeQJKGqQMg/M7dhg8DontEO/dam/Uo=;
 b=S2ZlXbfOg5BONlxRqMZH4p5whZTbTkdVN+DBdT5/1JHNOO/3g18sgWo8HITKauj8TP
 33XpClOottaLsUhBYnWr7aphZMO4M8lwdgtf671cP6dAZ6HdBxFAUoCoixCm33O6IbxK
 qif0weLKTBJ0U5t9i4PdgxBGCKhlwaitHrodHrt5mu+ctOBkJ47C349OhysWJYYdgb2u
 Rcp/V1RyGTGcGcnhp4yMK+BEU1bNuPOAJ+NB31q2DrmXn+l3WoxuvWkN47zl9FNq8sOk
 I80imO9c3ygSeFgXUpzOc0rrX9kXajo3oPOqhfiBdgwd9aLcFpZsObq79NyomrXTpQ+u
 vaug==
X-Forwarded-Encrypted: i=1;
 AKwUvBy1HA046XL6bDieh/0oyLsNhFEkdehu8HwfM/6+NUMTcc3IQQVOvuahCUuwklrvP3iBHa9ds3lA87PL@nongnu.org
X-Gm-Message-State: APuU4Z84/8iQ/xuW1jXotY8ZawDBvGGPySdmt5FyGw7evrkZu0d2X5sJ
 ZRjA8tPI23a0SJBczNrWgrXGQ2/07xtYuZn0ye6poX1zqgPYPj5hBbVCY+6vhJ58ENc=
X-Gm-Gg: AYBFou1f4hxwFRlVUn6XrEttNQ8RV/GZ68xMZ63k5APhIbTKGE1jDk0L4XnNs0eFfSA
 1Ji1czfnkP+cElb5WRKlJiYxlPddUXy07PcksYEykXpL9nkO1A1hWPEF5/rEj8hsloeVsS395Zc
 T7sp9lq3xUoZtFxKHpn8m0xuE4VCZZvOn9iNaLJmH3barHlU9WeTGFgW+ISK9lLHiJUPNOe1JgS
 kRfHnQg9iHSe757qfNanaI3MLK6yEA0QsZMwypOuvc9++sYnvC1RRV/aipbJ9yEn6TeXxzpuWCf
 0VZoC9FzVw5doM1JggMKDtP+giK80ONeT787O+0V2acCyfoPwXaUwGyLkrH2Q2KDBviaUbko0U1
 bZC+N3PoRFeCYdp2HeH3mnYIUUSFAh0WmveZMPhdVijvINiO7oBhPb1TJzISOfEvsHKLv755dr/
 Kwzk4ZzK5yBhnRbclDPHUnz3hf5nqM/qRo/i1SgOsSgFd0Xy3SoCcrpCLEAubaQNzrrcz8H0v4q
 +nBxsajG4tLD6Y5X8M4q/iWdcf0SLjokRsyICoCe0a7ORPvx2Ga4TciVlNUbS+aM/1Dh9D43CYA
 ArLNm21CD/ny2sRNKrj917q4DinO/iO+BNU/8wrMJ/iswLoKp9V9e4fAu49fu2Fe+2LSncu/0Gk
 dH/34eNYd+tomT0k99hqueVZUVEnu
X-Received: by 2002:a05:7300:471a:b0:36a:2382:7dab with SMTP id
 5a478bee46e88-36a4232cda7mr23774790eec.6.1793821412509; 
 Wed, 04 Nov 2026 11:43:32 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:32 -0800 (PST)
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
Subject: [RFC PATCH 24/38] target/riscv: Add implied rules for Zvqwbdota16i
 extension
Date: Thu,  5 Nov 2026 03:41:39 +0800
Message-ID: <20261104194155.679241-25-max.chou@sifive.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add implied rules to enable the implied extensions of Zvqwbdota16i
extension recursively.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 99c82b898f0..95bba330e06 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2906,6 +2906,15 @@ static RISCVCPUImpliedExtsRule ZVQWBDOTA8I_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule ZVQWBDOTA16I_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_zvqwbdota16i),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve64x),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 static RISCVCPUImpliedExtsRule ZVKN_IMPLIED = {
     .ext = CPU_CFG_OFFSET(ext_zvkn),
     .implied_multi_exts = {
@@ -3112,6 +3121,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZVKS_IMPLIED,
     &ZVKSC_IMPLIED,
     &ZVKSG_IMPLIED,
+    &ZVQWBDOTA16I_IMPLIED,
     &ZVQWBDOTA8I_IMPLIED,
     &ZVQWDOTA16I_IMPLIED,
     &ZVQWDOTA8I_IMPLIED,
-- 
2.56.0


