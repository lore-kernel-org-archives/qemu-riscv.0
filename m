Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E9BC56208
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 13:39:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wryIe-0002iu-Pn; Thu, 06 Aug 2026 09:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vvisaev@gmail.com>) id 1wryId-0002iT-5j
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 09:38:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vvisaev@gmail.com>) id 1wryIb-0005zv-I0
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 09:38:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-47fdd674e17so1420848f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786023496; x=1786628296; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ucI+7FLfJDqBwa9PDtU7PU10APxqI5TAvUdZP+nYAQg=;
 b=P+mAoXQbSeGlQ0YJHz3ov+DhvjYxmSOuPXF/xBmPGJpGKocsAp5oXYxLfT+Ics0K8t
 GyHP+rYzWurrEuNq7VMvq/R7V1yOAWXDK12Dnv6xUNldbwQ9PQmInEI5DED0hqMipFLK
 77ixpsc1IF/6JASyfiNMm4xWW73r+63csAj+vOgjlDkDaJjcnnlejsgxU48Um1XH4twd
 L6p5O8T7a7dtWAx1PfYXY/O5N2fZP+oxZpZd3qbbvQt8RlnbAILLrlsLuKnZLkQct2vo
 +Vr1ybXuLtpwAOgYL+zzUXJ4uxUZUX9YHUQQGiQTkG63271stmRciK+taY3yzxL9CN4w
 LLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786023496; x=1786628296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ucI+7FLfJDqBwa9PDtU7PU10APxqI5TAvUdZP+nYAQg=;
 b=EjJRVthWJQZ4Mp/5t7xZEGHnIxLomnJoPnK/pEGa+AKw1ixuskdNTGtVfGo5BysCpT
 xjKJKXUItx03EX4NK5EnYDZ3/bGsRzeAxlNZyvZWudpd0j+Ejs3gFcZbXz4ePu+ouDrO
 Y9Ng0L6IaqoDia2lfZDDKNvDSqe6KIV54RaYqur3zUiD2PcAI+kR34CewkdpEwz41d4e
 c8xR22j2Jl1a0whsTNoPVBszs4HPdourQMCAFbAlHCNGONKAx0hFkxs21SOOdVsEc4Ru
 d1FcQIRkZ7JFRSU0K+NU5zgja+kQjif6DjpU5hEQIBAhEcwOYf6M8+p58jJ/iyLuyd8t
 MLjg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrYHYgpluS8ZhQRl5QXz8mlA9RByhaSMTAHhTerpk+byE/CJm9JesCHN9o5iSkAN1nktSQvlHJNSX1n@nongnu.org
X-Gm-Message-State: AOJu0YyBFSi9KL5wqXKGpkEe+XOO/RV9Q/1seCD4ZzIgiYR68q5dEgEh
 lsNLhffV17ynq19i9CS9C9KdpmWS5k2rKfU9lkQ/Wige4jFufANcA7s4
X-Gm-Gg: AR+sD10BF4KPhRYIuN4sQepPbt45QkXpSsh8c4P02xh+WcZr64kI/PZhqzsPhpOg3ou
 m1TU+kkIwlU0MOfGlaQu3ZpboVSzeOvlv9k1Ix8OooxFKXxSbBW/3fGm+JrNFBgKd0KRHbztW1X
 SIn6mhcWqBkqZRiJLOIH9nGmKMqX5Dl460QgA2WMgb5I5ZiEcXcxr1Za5+dP1VZhCTuJimedRgf
 NQOMLTLj5uDY0PsfLfPrla2c8D+dg7rVJbwuAnZ4ep5AZTPF1QoOaNU/aEYOxC/nlu1UAu1TE2r
 q8c35NY38cLIOihHO5euBCltT0AqQ3c61Je+JLKk1BbHOjcfAYnP8ylLqFaMYhBhfKw06uDLtDX
 d3SrWzvhqx+5WV6ZotcnY3B8qZL96Sw7TsNYUomGTx8PW6vbSEYulIZasrFFD0aA/Iz1kPKMwgs
 Uyi5Tjf+O+FUwuv7axL69M7t0tdpYWNAKx5aIkGSgQcWY=
X-Received: by 2002:a05:6000:4796:b0:47f:86af:8fdd with SMTP id
 ffacd0b85a97d-47fec4e73b3mr18818584f8f.3.1786023496029; 
 Thu, 06 Aug 2026 06:38:16 -0700 (PDT)
Received: from X1 ([178.66.48.90]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ff79a7f07sm6837422f8f.8.2026.08.06.06.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 06:38:15 -0700 (PDT)
From: Vladimir Isaev <vvisaev@gmail.com>
To: qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, qemu-riscv@nongnu.org,
 Vladimir Isaev <vvisaev@gmail.com>
Subject: [PATCH 2/2] tests/tcg/riscv64: add misa write test
Date: Thu,  6 Aug 2026 16:37:47 +0300
Message-ID: <20260806133755.45924-2-vvisaev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806133755.45924-1-vvisaev@gmail.com>
References: <20260806133755.45924-1-vvisaev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=vvisaev@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Add test to check that writing misa before compact instruction doesn't
drop any bits.

Signed-off-by: Vladimir Isaev <vvisaev@gmail.com>
---
 tests/tcg/riscv64/Makefile.softmmu-target |  4 ++
 tests/tcg/riscv64/test-misa-w.S           | 46 +++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-misa-w.S

diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 82be8a2c91..e7d052909f 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -41,5 +41,9 @@ comma:= ,
 run-test-crc32: test-crc32
 	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)xlrbr=true $(QEMU_OPTS)$<)
 
+EXTRA_RUNS += run-test-misa-w
+run-test-misa-w: test-misa-w
+	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)x-misa-w=true$(comma)c=true $(QEMU_OPTS)$<)
+
 # We don't currently support the multiarch system tests
 undefine MULTIARCH_TESTS
diff --git a/tests/tcg/riscv64/test-misa-w.S b/tests/tcg/riscv64/test-misa-w.S
new file mode 100644
index 0000000000..22cba98b8c
--- /dev/null
+++ b/tests/tcg/riscv64/test-misa-w.S
@@ -0,0 +1,46 @@
+#define MISA_C (1<<2)
+
+	.text
+	.globl _start
+	.balign 4
+_start:
+	.option norvc
+	lla t0, trap
+	csrw mtvec, t0
+
+	# Fail if misa after write is not the same as before
+	csrr t0, misa
+	.option rvc
+	c.nop
+	csrw misa, t0
+	c.nop
+	csrr t1, misa
+	bne t0, t1, fail
+
+	li a0, 0
+	j  _exit
+
+
+	.balign 4
+	.option norvc
+trap:
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
2.55.0


