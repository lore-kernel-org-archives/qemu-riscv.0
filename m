Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4315CCF9EC
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:08:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDL28-0001DH-1c; Mon, 27 Oct 2025 07:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1s-0000r4-LY
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:04:49 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1Q-0005ey-WC
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:04:48 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b4539dddd99so962805666b.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563034; x=1762167834; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j5vD4GkqTlF8FRvajozZALqJDlWOq07fN98aFxxtZgc=;
 b=X8OEjG6RB6VrNi8530mbItN501+DxzcaAS0G4HGhYy6RwQ8s0wO7Y0QU2f+kFPXmyr
 lu8AvX/vSCrUKItZ7grsUTgyig0Mh07nqLBOFabxqTd6CNp+r1011re3JP+YiXo3XMhR
 nrCmugYe4XXPhUYbQ7ZhYZNCrbNBPDyyCPPyFYI7ms/1yaE0qV+CXhCzdZ1iimkrokLH
 BM+D5RTgT4An7tslO2BJmnIqKJGArkjAnC2UozYOWFja3AEaeu4/vuPQi8FBr9COgqM9
 IHpIfskMjnIGfBZhxb4956Ko4J6rtyex9yxhr24GN3NR+MYGBm0B4MBFJfaEZNO7eH8e
 gt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563034; x=1762167834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5vD4GkqTlF8FRvajozZALqJDlWOq07fN98aFxxtZgc=;
 b=U/qH+1jdro2nOVQ8jlYqeVkdqjC38P3xGwRQiMdOf6NVSA9zH5gbEWs9hCRwpIWMvB
 GYVQahO2G7E0vs68jrUFwgyvqFg89SQ6/olh/YcJEKZs/+5TVLHlzYqqgfq5kM5+4Lul
 YftA54f74CkJFNUjR9CvDlnJSzLKeUj/pPLyn6YxPz5AneGOHaXw+QXXXo/Y8LXyt5ut
 nowV23QqGILOzUe4klEXjhE7iDOQxb1w3FvJ+oVzWHvuVIWZNFaErC6BrlfMa2GD50Xj
 fKXC9CWZVBb0q+pTaX3/CsW8T9+eOWYHNVc6Bh9QBcvWJfSF3m3ITZJ2clO0HoggBnd4
 224Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+Mihw2xIFjI29yX+WDXebZ8QRrBa9zJ5Igpr9v0NuysTN6uOfLyfJpBz1fEB1LM3ShTYJJunqp6kC@nongnu.org
X-Gm-Message-State: AOJu0YzA0mFgepGtCZnrb4dFJ9rg+gBOoVsMNM7lIAMEvMe9rn/e5fST
 qBw9Cs5/anzlvAYEe3fi6YIjGnjTu2iFJn4eq+79t2E2DNY6XTKepjNl9fhTMeBikoE=
X-Gm-Gg: ASbGncuG9eoy0QwDalvZ459ITA9jxy3sC6+ZodUGmhtCDUqmiz97T67mi873aQZlcO6
 wpW+mcWRmlnqedQjQYNhGexdv5dBSZJxWhkbm8H64ggesFcT+JUenVBNCoeATtRkPlN/0Td7m13
 i8rOnY/gXYFhLkZCNcZUb7PKN4ydF1oVjbFxVMMcotKtzPLTKQ2ajyitHKNFcVIrWH7Sm5tGObN
 Rk+Gtk67j/44CYb9DeebLS07oLkcQl+DAu9652uJslE2FaBs7zwH7db2cjAXPxCKtFrpLyQnE/y
 VZ4qYc2CUAeUPk5GpLmirbeHOQy8OOdqI9jB1JkDszsrKUDhibu6FtEtpZy/cncEp7e+nbROVmi
 nMs0WlDN1InqlSvULmz37dawV3lmRpw2RW+JkMhNhuYLmg3+7PHEApiLZG8iJWXCqQvodVQlcpR
 aF+PIXaxQh44w=
X-Google-Smtp-Source: AGHT+IGRoCM8z0OckSwUEsiuPM8tj+gJRpyVjgRDBkyGR5ywxYyqMoWnrS4niHghCRH2WyFRnHheag==
X-Received: by 2002:a17:907:2d9e:b0:b3a:7af8:c4a2 with SMTP id
 a640c23a62f3a-b6d51aefdb1mr1605117466b.10.1761563034209; 
 Mon, 27 Oct 2025 04:03:54 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8541fb2esm728692266b.59.2025.10.27.04.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:54 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EDD2061502;
 Mon, 27 Oct 2025 11:03:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Julian Ganz <neither@nut.email>
Subject: [PATCH 30/35] tests: add test for double-traps on rv64
Date: Mon, 27 Oct 2025 11:03:37 +0000
Message-ID: <20251027110344.2289945-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Julian Ganz <neither@nut.email>

We do have a number of test-case for various architectures exercising
their interrupt/exception logic. However, for the recently introduced
trap API we also want to exercise the logic for double traps on at least
one architecture.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Julian Ganz <neither@nut.email>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/riscv64/Makefile.softmmu-target |  6 ++
 tests/tcg/riscv64/doubletrap.S            | 73 +++++++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 tests/tcg/riscv64/doubletrap.S

diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 3ca595335dd..d9c0036eb4b 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -24,5 +24,11 @@ EXTRA_RUNS += run-test-mepc-masking
 run-test-mepc-masking: test-mepc-masking
 	$(call run-test, $<, $(QEMU) $(QEMU_OPTS)$<)
 
+EXTRA_RUNS += run-plugin-doubletrap
+run-plugin-doubletrap: doubletrap
+	$(call run-test, $<, \
+	  $(QEMU) -plugin ../plugins/libdiscons.so -d plugin -D $<.pout \
+	  $(QEMU_OPTS)$<)
+
 # We don't currently support the multiarch system tests
 undefine MULTIARCH_TESTS
diff --git a/tests/tcg/riscv64/doubletrap.S b/tests/tcg/riscv64/doubletrap.S
new file mode 100644
index 00000000000..b61089c9c1c
--- /dev/null
+++ b/tests/tcg/riscv64/doubletrap.S
@@ -0,0 +1,73 @@
+	.option norvc
+
+	.text
+	.global _start
+_start:
+	# Set up vectored interrupts
+	lla	t0, trap
+	add	t0, t0, 1
+	csrw	mtvec, t0
+
+	# Enable sw interrupts
+	csrrsi	zero, mie, 0x8
+	csrrsi	zero, mstatus, 0x8
+
+	# Engage the double trap: we trigger an machine-level software
+	# interrupt, which will trap to an illegal instruction
+	lui	t1, 0x02000
+	li	t0, 1
+	sw	t0, 0(t1)
+
+	# If we still not went out via the software interrupt route after a
+	# short while, we failed the test.
+	lui	t0, 0x1
+0:
+	addi	t0, t0, -1
+	bnez	t0, 0b
+	j	fail
+
+trap:
+	j	illegal_insn # Exceptions
+	j	fail # Supervisor software interrupt
+	j	fail
+	.insn	i CUSTOM_0, 0, x0, x0, 0 # Machine software interrupt
+	j	fail
+	j	fail # Supervisor timer interrupt
+	j	fail
+	j	fail # Machine timer interrupt
+	j	fail
+	j	fail # Supervisor external interrupt
+	j	fail
+	j	fail # Machine external interrupt
+	j	fail
+	j	fail # Counter overflow interrupt
+	j	fail
+	j	fail
+
+illegal_insn:
+	# Check whether we really got an illegal instruction
+	csrr	t0, mcause
+	li	t1, 2
+	bne	t0, t1, fail
+	li	a0, 0
+	j	_exit
+fail:
+	li	a0, 1
+_exit:
+	lla	a1, semiargs
+	li	t0, 0x20026	# ADP_Stopped_ApplicationExit
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	# TARGET_SYS_EXIT_EXTENDED
+
+	# Semihosting call sequence
+	.balign	16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.data
+	.balign	16
+semiargs:
+	.space	16
-- 
2.47.3


