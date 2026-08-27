Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29851C5DF9D
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:13:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSOs-0004ZC-2G; Thu, 27 Aug 2026 01:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOg-0004IM-2C
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:11:31 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOd-0004FY-Fz
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:11:29 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-ca7c1176317so1570738a12.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807486; x=1788412286; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JSgAqHr1NOvqwxx08subUkX/lMIs5ZKn3UbhmDEC214=;
 b=NvvKn5L451EcW4L8TxNKXt8wOex5MBmOWhSX6b3BFl3q7b/HjxBgnCc4CaHklM9tJ0
 byCZSB4KXyGvZDArdHEZCRRuX8gx6nwBon4U0xSpITagDg9naM0lVvZABTORBBINL456
 rMahcfWEnVqnRCXS+Q1oiV+3OilQoOuunY/JKmWPtvCwEVhwadvQmLtdvs0yUPribTdS
 +oavZzU/E7ycJ6JfEL3OdeM/EB5+S4FJnEqs5pANChunETvmhpY/JKVZAzhzVPvGTdn+
 N8GJbCym5JZ2DkFSnP1v9OsoQO8KcjxEEtd1I+BPmejbhKr2hhNfyICtu5g6xTkjXtBe
 VHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807486; x=1788412286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JSgAqHr1NOvqwxx08subUkX/lMIs5ZKn3UbhmDEC214=;
 b=EyZcTKeUXv//Rv6vbfa+xJZ24voPP22Xpz0s45CW7HQ0w2VkgVmy9mArCz/BaKzI/K
 absxoRd7urDzRpeFk1DrvK2wlFJvSN9qL0VdppQ+cbH8IlWYg7/OSpkQjrayepBk1H/9
 kHbQE5BFZ+vc0Z75Y971T2xG7daw1/g4vQv9JLBUPovKm7epayaUB3fX3NsVFX7RiQe9
 yxtO1Kubt4uotlaxKI3dmvqcr97ei7g/8suP/Oyt1/sZqfxkSv69PI0+sd2CgwOke3YY
 WqVKZ48wG6GoGWHGtAQAI5WtPV+f4PPfJoX0ZM3uK2J/bjbxxANekwvaWqhOtWjhP2mq
 QNBQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpNjffhnQSDPWlVUj72yZ3f03wb4bj8na3i5QEYVlyUiex/Z64kx2klJQIyHIuKUTXZ2e8Qd2n4gWMb@nongnu.org
X-Gm-Message-State: AFuF++lICXRcjLDhgvokkajNuoemfgopbRHM8oy+egalxo9z762485+f
 hyLYWIbJ46yo9Zn7aF1IDzEUv6CCUWAblcSTN/OJkRxaAaIM2iaSssrp
X-Gm-Gg: AR+sD12zbIs3p0N/7Vlsv6hlMEKz1gB5yUeg5lBnFdg0rPc75KfZeS1ff2FQuxK62RR
 cEfCLYdBcsjW4KJW3+uAyfpeTEN3BebrBVHosfZ0kD5Gr6F78eGoOwqNc4ZtMRCIaUjVj4XBTvO
 oI6XGsQCpkz5njkKajdupzZ0E+In7yHfu3ry+GG8FmCV17JPbIiWTTj0RDFe6UfCqsrL2+BERZg
 Amg38nBqey083dVQLgw4HVoB9tSGKdGwMxUJy88lBrSP7E7B1voG067nEayZUWjeAc6RFjcDG/8
 R4qFsuhPy4FfiQBV6IDxUwJO9MobPhEueevOgrjoDycBd+HK3y1RYHnRxvCQcQHt5y0Cf+sxPSS
 FLiHGk0PE17UCXDb/AZDvjLHOH5CxKd/CyWLuS+IqNO7GUWg7LTmW69/1evTptIMGBRw3ICi4z/
 aonf75B9UzLwBw+p47TRZYV2YCWWUZfvrdms1Z8YaJB7iACjXgH2GO/hZcrRSQ0zL/85g6ZFy9j
 HAFz3VA8hakC3Ie8b6qcY2K0bcoB9zZUEcGMyZZDHFXHQyF0ZXF9S46NKTbhw1VTFKrRlON1R5z
 3oIzkuY+Qrn18IZtywEb
X-Received: by 2002:a17:90b:586d:b0:396:4cbf:45bc with SMTP id
 98e67ed59e1d1-3966d491c45mr26485905a91.16.1787807485965; 
 Wed, 26 Aug 2026 22:11:25 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:11:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 12/12] tests/tcg: Check vector memory tests contain vector ops
Date: Thu, 27 Aug 2026 14:39:51 +0930
Message-ID: <20260827050953.67184-13-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Disassemble the tests and count the SVE or RVV memory access. Delete the
binary when the check fails otherwise a subsequent run will not run the
check and silently succeed.

    CHECK   memory-rvv contains 7 vector loads and 7 stores

    CHECK   memory-sve contains 20 vector loads and 17 stores

This is a coarse check and could be improved by checking specific
functions, and using something more precise than an opcode grep.
However, it would have caught the bug fixed in "tests/tcg/multiarch: Fix
vectorisation of memory test", which makes it worthwhile.

Skipped when no cross objdump was found.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/tcg/Makefile.target                 | 8 ++++++++
 tests/tcg/aarch64/Makefile.softmmu-target | 1 +
 tests/tcg/riscv64/Makefile.softmmu-target | 1 +
 3 files changed, 10 insertions(+)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index d4dd0fec650d..a5b694d2f21c 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -79,6 +79,14 @@ conditional-diff-out = 							\
 		$(call diff-out,$1,$2), 				\
 		$(call skip-test,"$1 check","no reference"))
 
+# Check an ELF for vector load ($1) and store ($2) patterns.
+# Deleted on failure so the check runs again on the next make.
+check-vectorised = $(if $(OBJDUMP), \
+	$(call quiet-command, \
+	    ld=$$($(OBJDUMP) -d $@ | grep -cE '[[:space:]]$1'); \
+	    st=$$($(OBJDUMP) -d $@ | grep -cE '[[:space:]]$2'); \
+	    printf "  %-7s %s\n" CHECK "$@ contains $$ld vector loads and $$st stores"; \
+	    test "$$ld" -gt 0 && test "$$st" -gt 0 || { rm -f $@; exit 1; }))
 
 # Tests we are building
 TESTS=
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 196a2afa50ee..99ad1a2799d7 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -50,6 +50,7 @@ memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
 memory-sve: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) boot.o
+	$(call check-vectorised,ld1[bhwds],st1[bhwd])
 
 memory-sve: private CFLAGS+=-DCHECK_UNALIGNED=1 -march=armv8.1-a+sve -O3
 
diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 301a6e6e5700..5262007e39a5 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -79,6 +79,7 @@ memory: private CFLAGS += -DCHECK_UNALIGNED=1
 memory-rvv: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
 	$(call quiet-command, \
 	 $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) $(CRT_OBJS), CC, $@)
+	$(call check-vectorised,vle,vse[0-9])
 memory-rvv: private CFLAGS += -DCHECK_UNALIGNED=1 -march=rv64gcv -O3
 run-memory-rvv: QEMU_CPU = rv64,v=true
 
-- 
2.47.3


