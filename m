Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1AEC4167D
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 14:11:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r00KI-0005YL-GB; Mon, 06 Nov 2023 09:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1qzxZk-0002TI-0l
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:15:29 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1qzxZi-00073g-2H
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:15:23 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1cc68c1fac2so39651595ad.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1699269320; x=1699874120; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uRnDSQzaHmLdQycfNSQLpH4vuNFJ/S13XFN9b+1P9BI=;
 b=BONnBvTNiojEDHowACad/Fykj3NrMOgv8HQMUH+ntgTycE2oOer1ghkep+5tBrZDSe
 tKh75kTZOdWu/AG1d+XV84gFy2GXgrnTxkAIf2YRxiuPVhennUabZbIY1L9gwkcSwM3W
 C3HumBOgQ4w87N7beneIoJxkk5kv/fDZImaPKHvd4P1mjOAvkdMtzLLK+q0d/5w2SWQc
 pV2KU5qg/EOsBJzDY7Uu/mCVQjI3sa2qqdJu+PhFdkgMX0osMGEjQvnkhUjRcijtUG0J
 4qkklOSZeEoA0ZkUeVE5sQ8vEm1vkKxqaab0NbPQGvDeXg093BY3Z6AQVvHbwn/6DIoT
 dJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699269320; x=1699874120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uRnDSQzaHmLdQycfNSQLpH4vuNFJ/S13XFN9b+1P9BI=;
 b=AKl1H6l4wdfnDblDoHXO4HprelX3pVeyYsPBjVKd5ahAx+v/97S+HKr+D7Sc0/vzTA
 WLAkm8WEOsanzBzW5AX2UaUFyd5iMAuUdq/ZNZJiUzWCpIyedlcavyrmDaEW4A1vqSE5
 Nb4apcP/EE1SjTBQxr6opTm440cCBTUfQjyXo1q7xVYhTSal/5R/7+AOS8YoFmXHi7si
 3Ca+oJD95nLWgEQSrBpwQB4sWxrQ/GRLmy2Ql+LTQqM2J9fjbsR7uRr/G/qyWvVcDfxg
 wtqqaMPKXoARcwu6Tu+L0qFynntiWqC/sGooLBT6ihsbU2tk7PEFiAoeUksEOCiSROLv
 CZsQ==
X-Gm-Message-State: AOJu0YwX1XXYzhZUnDtUU47i5t0i1tJ80xv0P1g7eIOqNazta+KPiW+V
 Ok9pwKBODDvCWCqRhziQf0j/OplDe62hHxPzbTiXzA==
X-Google-Smtp-Source: AGHT+IFW3lNze4IS2+Q4FkgA1UKTZf6IwUYos7vmeewsbBL0Zg4ZmQcJYAHkXs3bx8Opo3kVhrkkHw==
X-Received: by 2002:a17:903:78d:b0:1cc:520a:54c with SMTP id
 kn13-20020a170903078d00b001cc520a054cmr16745854plb.56.1699269319608; 
 Mon, 06 Nov 2023 03:15:19 -0800 (PST)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 iy9-20020a170903130900b001c60a2b5c61sm5691375plb.134.2023.11.06.03.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 03:15:18 -0800 (PST)
From: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
To: alistair.francis@wdc.com, palmer@dabbelt.com, frank.chang@sifive.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
Subject: [PATCH] target/riscv: don't enable Zfa by default
Date: Mon,  6 Nov 2023 19:14:40 +0800
Message-ID: <20231106111440.59995-1-jerry.zhangjian@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=jerry.zhangjian@sifive.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 06 Nov 2023 09:11:37 -0500
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

- Zfa requires F, we should not assume all CPUs have F extension
  support.

Signed-off-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac4a6c7eec..c9f11509c8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1247,7 +1247,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
     MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
     MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
-    MULTI_EXT_CFG_BOOL("zfa", ext_zfa, true),
+    MULTI_EXT_CFG_BOOL("zfa", ext_zfa, false),
     MULTI_EXT_CFG_BOOL("zfh", ext_zfh, false),
     MULTI_EXT_CFG_BOOL("zfhmin", ext_zfhmin, false),
     MULTI_EXT_CFG_BOOL("zve32f", ext_zve32f, false),
-- 
2.42.0


