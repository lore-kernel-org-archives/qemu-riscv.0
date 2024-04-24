Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6828C07E8E
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 09:48:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rzZDn-00086Z-Ny; Wed, 24 Apr 2024 05:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rzZDm-000855-4t
 for qemu-riscv@nongnu.org; Wed, 24 Apr 2024 05:47:22 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rzZDk-0006Jy-Ih
 for qemu-riscv@nongnu.org; Wed, 24 Apr 2024 05:47:21 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1e3f6f03594so50334775ad.0
 for <qemu-riscv@nongnu.org>; Wed, 24 Apr 2024 02:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1713952039; x=1714556839; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+r1ThFSNKDGi1j4wtDaUMcGW640caYeTO8afX4z41sE=;
 b=H52EtmYUJZT7g9gJhFDMw0iMlvBKW+VNZRQ9uc2JRU83Req/Jhmc0pcxh0pjk4BZma
 SGGEXIZtweS+a832I65Dq13649sYBMOCnH0thMdc/qieMa5VWEuc66IbwXZOa8WhnGKi
 za5/dvRBbJzDU4xxgwzRRn89ubEYr1w724+GMerzobJSnCxs27txrNyT9h2ld167tn3f
 Vo3gZkqUdqxlBQ/x39Oy/pa6Xi/Ybc4AMFkO62w89waZOiQ4udMLygQjO0kC+pttX4dB
 /eaY9Cir3PtDtasintva1vwRkcsQXsZEmGhOdShkHx968ERbxpIL1/P7o1APXXgMRXeI
 izwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713952039; x=1714556839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+r1ThFSNKDGi1j4wtDaUMcGW640caYeTO8afX4z41sE=;
 b=TeJkeDtJFVH1tiLbZPorrybPvGYauM2NdHtLIXUUEGyYeoJvG4H9isgrLnQ0/umu+D
 ahmaHTqeBXsxm+NbjrQeZ8MEFav6DQPE3zKRUFf4NMZkzYfQc1DzbPkmIjTigycJUxi3
 L3SeOUIADGrQ3i4OL8Py/cc3ICbYyTUOy62zgNzv/gY6GK4SFYjkmPPELwhQueTF8Lvp
 Y/NmOW3t8Zvp2Ja1Q8Pn+MxQdNdGSzsXKsEBR17TuljGIkiwU/ikG2bIuXf8UTTZo3dg
 O/I/kGVgRnm/bf+d5I+5PyAdmmi88dAEj22djqxPHLMCilj8RSVXqrqko3tQ7+xXwkgc
 33oA==
X-Gm-Message-State: AOJu0YwOiyFRo5vs5QcEPyAtk6E2cTry19NLXAvg/fifbwWJ78eZgcID
 glAvrO/y901oeu7WzCvGkMtBeZjCDMSzSqzxJrnvAUOh+Y2725ZeK6aextZi7MQ=
X-Google-Smtp-Source: AGHT+IFZ8p5A7ABwNV2ORCtu8CoKN4zkW8wH3dwJ6J72aDif+MpmoucR2BbhxgIQ5sRcHHOtyrpzzQ==
X-Received: by 2002:a17:903:245:b0:1e4:6938:6fbd with SMTP id
 j5-20020a170903024500b001e469386fbdmr2095438plh.7.1713952039272; 
 Wed, 24 Apr 2024 02:47:19 -0700 (PDT)
Received: from grind.. ([191.255.35.121]) by smtp.gmail.com with ESMTPSA id
 y24-20020a1709027c9800b001e0d62e077esm11513389pll.247.2024.04.24.02.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 02:47:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 thuth@redhat.com, alex.bennee@linaro.org, philmd@linaro.org,
 mjt@tls.msk.ru, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/2] checkpatch.pl: forbid strerrorname_np()
Date: Wed, 24 Apr 2024 06:47:00 -0300
Message-ID: <20240424094700.453356-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424094700.453356-1-dbarboza@ventanamicro.com>
References: <20240424094700.453356-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
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

Commit d424db2354 removed an instance of strerrorname_np() because it
was breaking building with musl libc. A recent RISC-V patch ended up
re-introducing it again by accident.

Put this function in the baddies list in checkpatch.pl to avoid this
situation again. This is what it will look like next time:

 $ ./scripts/checkpatch.pl 0001-temp-test.patch
 ERROR: use strerror() instead of strerrorname_np()
 #22: FILE: target/riscv/kvm/kvm-cpu.c:1058:
 +                         strerrorname_np(errno));

 total: 1 errors, 0 warnings, 10 lines checked

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 scripts/checkpatch.pl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7026895074..be0982246d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3056,6 +3056,10 @@ sub process {
 		}
 	}
 
+	if ($line =~ /\bstrerrorname_np\(/) {
+		ERROR("use strerror() instead of strerrorname_np()\n" . $herecurr);
+	}
+
 # check for non-portable libc calls that have portable alternatives in QEMU
 		if ($line =~ /\bffs\(/) {
 			ERROR("use ctz32() instead of ffs()\n" . $herecurr);
-- 
2.44.0


