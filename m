Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C47CA0FF2
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 13:03:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utn7z-0005Mv-3A; Wed, 03 Sep 2025 09:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1utn7o-0005I3-2r
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 09:02:15 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1utn7l-0000XC-9H
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 09:02:07 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b49c1c130c9so4428081a12.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Sep 2025 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1756904523; x=1757509323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7yO8ADA0pol4cy8ipnt6jQ+4uDi0a2eWjgPSJWFAag=;
 b=W5dWaqwDzxLLEm8YFZUgX18zgumHcVzfB4UNa6kADQGdX7/byX3paik4yJCUajF8y3
 7vw/EhyLoe79ZZM5cFn/f+c5/jNy2y27gadA+jglULlaf9YK3+BjmJT5p7FlcTxgim6R
 06n39OvQmKuYUiwGEfmF0KLSu17JrCE6id4fzwsOjObcruSSsuO1uQs/hJLfEdmhQnur
 Pn76JF7SJLlSz8h6f105MNyksZ1MWCfW8omRh6lFVuWuuoHu0MwNOha4aJu0vA/SF2HW
 3tClMUCrC028iobjojQhIfsntj3LLkSgGxTCVszIF+GqKVQhzISKEvm4WSHCUH7499oA
 rSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756904523; x=1757509323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q7yO8ADA0pol4cy8ipnt6jQ+4uDi0a2eWjgPSJWFAag=;
 b=civLiTKbR2PpAvLilg6RW5Dv2hy6SQqmywoR2Bm14O9+JV0D7uOWga/Si5d4pP3WUg
 jcrPJj0ei8TnhCjJ0GUfkbkN2mkkGhnUB0pdGstYSRmvsmiP9TPEYk7/RMEaapwRN/Dq
 Pxh6o/bi2pshBF2ZXhx3X63YCpfEEoyIS/l9bLO1q1sljn6vsEM1eRMaC0c9zDE/H9j9
 +WQCJvewoyzvQ//hbAw/8iXGNDl2Ji4M1QMbSCU6WVw+uVfxVJrQ5oo52c+kCD3YPGh5
 xedLzd+mCpNl5QouzsieWrXb6IbJAzo28JUBDAtDdvAinhzZaJ+/kf+A9Y2qfSvqlQwk
 lSkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlfNZDM2qU5E/d6MYxXq/SdhgrAmLxGHHOvvBBq4m0f0sYuoQISv0rmDPXcXipPldR0eVOuMjx/+HX@nongnu.org
X-Gm-Message-State: AOJu0YwR/aJ85JtQfXXwy6LWcQg1dJyy3GkSTEOT4zbS8bHSgppxDWDt
 Q2JLcMa5C1kwmWecD3ivh8ASwqr9SrWdQ6lruPK4sc3AQOnwjTwbZTF/IQ8j5bV+Vpk=
X-Gm-Gg: ASbGncv1iylUZbzat2CtWkudy0ZtZ272Bg/w00Td8gP2JoRFtnCI/NApOplief4NhTB
 MHa73dtqLiwT8u/xtZgm9mVCGwH+R5KMUQGpkMULnLI4I2riVHo1E9eCAJ543+rS8zUd+gkVNAr
 W5ojxwZJk/OjTVLU46ttUn7R25F7rV0gq6vmWjXQyaeAUKKa/RWeJOGLvAVdWd2wPZ3KdXsj6C0
 TGiyJfl+q60gw2nSBgwMZSwfbCKAhDEhVWHX5VA+RrLee8fTdbmDNwo3IjeylrvQaEAKvzZ2qfI
 LGnX4o4W34ESG51eoDj5w7ekyKxmqvtKJioNdJHke4I8HcB7RKHzLbDR+Up+U+Yr3kCK0cSX523
 QA7ZSDZxNFxWxALgc6YKbnwfeKyCG7pZBm6x1OWsZVJRzNEq1WRJuT7geMsUlExYpOOU=
X-Google-Smtp-Source: AGHT+IGgfRSMell+/W3XLFCDDR80gZvnWvEbUrMOkY74hJ14lx4kYrnVxKGZ0YBfuAwyGNt9sJIxwQ==
X-Received: by 2002:a17:902:ef52:b0:248:8d0a:b4c4 with SMTP id
 d9443c01a7336-24944b523d9mr205320645ad.47.1756904521068; 
 Wed, 03 Sep 2025 06:02:01 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329e23858ecsm5472278a91.14.2025.09.03.06.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 06:02:00 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v2 3/3] target/riscv: Expose Zvqdotq extension as a cpu
 property
Date: Wed,  3 Sep 2025 21:01:25 +0800
Message-ID: <20250903130125.1701363-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903130125.1701363-1-max.chou@sifive.com>
References: <20250903130125.1701363-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x534.google.com
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

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 95edd02e68..ed486113ba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1373,6 +1373,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
 /* These are experimental so mark with 'x-' */
 const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-svukte", ext_svukte, false),
+    MULTI_EXT_CFG_BOOL("x-zvqdotq", ext_zvqdotq, false),
 
     { },
 };
-- 
2.39.3


