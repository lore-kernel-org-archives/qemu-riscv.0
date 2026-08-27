Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F2EC61DC4
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:12:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSO1-0002gg-Eg; Thu, 27 Aug 2026 01:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSO0-0002gO-Ev
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:10:48 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNy-00046F-GX
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:10:48 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-cc1c8d4a959so1082760a12.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807445; x=1788412245; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Joidts5BLCkEz7fojZ/OWB99swVN9xOZwsIzW5vlcdM=;
 b=msYNNOGlTMe/8hQMjLdXCH1rIM2VnKZnjZAcyoMd4LmrWiijaX3ICBFqMJlv9cwgTe
 VYgKzvwHOZ2Eeq7Jf9er2wBfr025xKS53qOY/QEBMJpa8DiNodxRIKDGk0XY01JqNdL6
 czVK88TXpMM0nTCjZgTfMOwT2ZbbTbAKaBt/28vemppIqkaFe6y8mg+HN/5763lZJueb
 7RG9WRFUevLfrZycAfvD8OoglruczJktTaIE6hdu4G+QSOrnoftz4DsFnHtKLSffuVMJ
 EEYZ7qvecBZ5+LXdj8am/rwevSbL7p/mlkgiRhO08tjkgM4Tbi7sVF7yVa3Sxu8daNWT
 sE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807445; x=1788412245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Joidts5BLCkEz7fojZ/OWB99swVN9xOZwsIzW5vlcdM=;
 b=H/sHWgoWxw0K0r+G/TcBYPLpSj+00i3g4mN5OFBokobyGzaKxn+JSWQKeeMCNCwd+Y
 zkdhbyhjPs4i9AHUMQ7yonPwmklSzVvd7f//PMUimvMp0wOrZALtHEVLCf8xIG8V+uyt
 0cWdP69HXN/FG23Z4ELLbqIBF1o9im3qDU3ozddMqacX0fZ4l3g9utNgj0RakWVhNR+D
 kLgf1S2UKcqr28Gp6iqvr8xhovBIjjdODJwlRboAHQIfFk4+jWquEsfdHq1LvZS+b2Xx
 UbsUzLWo4+vlyrFdGYrYztPU9l+05rlZ3kfK9k4ngEvjCIcpNNH9S/rqEwjNHsc8mUsL
 fAEw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqm2/fFTeZDbTs2l5pcsaxX5plGL6Cu1S15t5kfBrWI9T/WxHIbKvztu/u5Ck8Xav9RB0NRMS2y61hb@nongnu.org
X-Gm-Message-State: AFuF++kfVaSHCTlVK7J0J5kNBv/Lp9Mns1KebKGQTTGqQrGr2U30rA3B
 aI4ximYsb5f81+7mND1Z8RXrSjN5P14TLU6i7sYiL4wf5bzJvi9weFsV
X-Gm-Gg: AR+sD12AUji4boIocYFB5xzq6x7RA6I7qwheqokHvld3xOB1EvVWds5RTBm0SRlxWDY
 4ImNvw4jf/+lFk0jKlbrEVaMHAvx5Pid7KCB7VyaRKbDg066BTHjvD5fV6t9i6FaaCTT/ADBmZg
 EzYHiFgda/F2k9oj0GLgS5df68zx/O+eWTBP1jFs91d3pB+X/RcOCEqOSMx8iXiQs8GoxtqhXRM
 O6KgltF01rirgIU7s0nURgCaQnqx5uzsmH8EDUekkY47pvucTaswuEoUQHZieudgacdu/uL+JwG
 YM163qUkGKrLiJ2Pcf6D9cPdL3TlFecKLHw41OmBm27PDivld6xGYTnozOqx4Uand0dd3Qqlp3b
 h5cn5sfGcmkaLCNb7qO59YrkhLEHl8jycOivYqhMb0Qz1Gadn0k7gng3RJWRSYkLNW7AVtSHHER
 ZuMMlHXYb+Ju9N69tBRvU4IJakZffrXQ2p0mB3ifiWrcj+U3Tl4M/Cbulb87+Fr/HIfziYUAEFB
 Jpzu+ueTgVlVwEY+3T1fUkguHtHWHDQp8XOh29VvXsifuBRPVgKq0xdWNzBc/N4AR8rNqFZaFrv
 GYm6pkgjeZ5FLXSiTlzv
X-Received: by 2002:a17:90b:1dce:b0:366:10f1:3d91 with SMTP id
 98e67ed59e1d1-3966d13eb80mr25058039a91.1.1787807445036; 
 Wed, 26 Aug 2026 22:10:45 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:10:44 -0700 (PDT)
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
Subject: [PATCH 05/12] tests/tcg/riscv64: Rework rules for semihost tests
Date: Thu, 27 Aug 2026 14:39:44 +0930
Message-ID: <20260827050953.67184-6-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x536.google.com
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

Rework the makefile so the semihost tests can share run rules, with
individual tests overwriting QEMU_CPU or providing more options via
QEMU_EXTRA.

The program output now comes from the test framework's output chardev
instead of stdout, but there is no functional change as none of the
tests use semihosting putc.

Add quiet-command to the compile and link rules so builds print
CC/LD lines like the run rules.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/tcg/riscv64/Makefile.softmmu-target | 94 +++++++++++------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 562ac9b0e0fb..f2850a194084 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -9,67 +9,67 @@ LINK_SCRIPT = $(TEST_SRC)/semihost.ld
 LDFLAGS = -T $(LINK_SCRIPT)
 CFLAGS += -g -Og
 
+# Used by riscv64 tcg tests and shared 'multiarch' tests
+QEMU_CPU = rv64
+QEMU_BASE_MACHINE = -M virt -cpu $(QEMU_CPU) -display none -bios none
+QEMU_BASE_ARGS = -semihosting-config enable=on,chardev=output
+QEMU_OPTS += $(QEMU_BASE_MACHINE) $(QEMU_EXTRA) $(QEMU_BASE_ARGS) -kernel
+
+# These tests provide _start and use semihosting directly.
+# -kernel entry point is the lowest loaded address, not the ELF entry
+# point, so _start must remain first in .text.
+RISCV64_TESTS = issue1060 test-mepc-masking test-minstret-ecall \
+	doubletrap interruptedmemory test-crc32 \
+	test-zicclsm test-zicclsm-off test-misa-w
+
+# -Wl,--noexecstack to avoid linker warnings for .S files
 %.o: %.S
-	$(CC) $(CFLAGS) $< -Wa,--noexecstack -c -o $@
-%: %.o $(LINK_SCRIPT)
-	$(LD) $(LDFLAGS) $< -o $@
+	$(call quiet-command, \
+	  $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -Wa$(COMMA)--noexecstack -c -o $@, CC, $@)
 
-QEMU_OPTS += -M virt -display none -bios none -semihosting -kernel
+%.o: %.c
+	$(call quiet-command, \
+	  $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -c -o $@, CC, $@)
 
-EXTRA_RUNS += run-issue1060
-run-issue1060: issue1060
-	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<)
+$(RISCV64_TESTS): %: %.o $(LINK_SCRIPT)
+	$(call quiet-command, $(LD) -T $(LINK_SCRIPT) $< -o $@, LD, $@)
 
-EXTRA_RUNS += run-test-mepc-masking
-run-test-mepc-masking: test-mepc-masking
-	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<)
+TESTS += issue1060 test-mepc-masking test-minstret-ecall test-crc32 \
+	 test-misa-w test-zicclsm test-zicclsm-off
 
-EXTRA_RUNS += run-test-minstret-ecall
-run-test-minstret-ecall: test-minstret-ecall
-	$(call run-test, $<, $(QEMU) -icount shift=1 $(QEMU_OPTS) $<)
+# Tests can provide a custom kernel command line here
+run-test-minstret-ecall: QEMU_EXTRA = -icount shift=1
+run-test-crc32: QEMU_CPU = rv64,xlrbr=true
+run-test-misa-w: QEMU_CPU = rv64,x-misa-w=true,c=true,v=true
+run-test-zicclsm: QEMU_CPU = rv64,v=true,zfh=true,zicclsm=true
+run-test-zicclsm-off: QEMU_CPU = rv64,v=true,zfh=true,zicclsm=false
+
+# Zicclsm: misaligned load/store support. Assemble one source twice: the
+# default build expects every misaligned access to succeed (zicclsm=true),
+# the -DZICCLSM_DISABLED build expects every one to trap (zicclsm=false).
+test-zicclsm.o test-zicclsm-off.o: CFLAGS += -march=rv64gcv_zfh
+test-zicclsm-off.o: CFLAGS += -DZICCLSM_DISABLED
+test-zicclsm-off.o: test-zicclsm.S
+	$(call quiet-command, \
+	  $(CC) $(CFLAGS) $< -Wa$(COMMA)--noexecstack -c -o $@, CC, $@)
 
 EXTRA_RUNS += run-plugin-doubletrap
 run-plugin-doubletrap: doubletrap
 	$(call run-test, $<, \
-	  $(QEMU) -plugin ../plugins/libdiscons.so -d plugin -D $<.pout \
-	  $(QEMU_OPTS) $<)
+	  $(QEMU) -monitor none -display none \
+		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
+		  -plugin ../plugins/libdiscons.so -d plugin -D $<.pout \
+		  $(QEMU_OPTS) $<)
 
 EXTRA_RUNS += run-plugin-interruptedmemory
 run-plugin-interruptedmemory: interruptedmemory
 	$(call run-test, $<, \
-	  $(QEMU) -plugin ../plugins/libdiscons.so -d plugin -D $<.pout \
-	  $(QEMU_OPTS) $<)
-
-EXTRA_RUNS += run-test-crc32
-comma:= ,
-run-test-crc32: test-crc32
-	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)xlrbr=true $(QEMU_OPTS) $<)
-
-# Zicclsm: misaligned load/store support. Assemble one source twice: the
-# default build expects every misaligned access to succeed (zicclsm=true),
-# the -DZICCLSM_DISABLED build expects every one to trap (zicclsm=false).
-ZICCLSM_MARCH = -march=rv64gcv_zfh
-CLEANFILES += test-zicclsm test-zicclsm-off
-
-test-zicclsm: test-zicclsm.S $(LINK_SCRIPT)
-	$(CC) $(CFLAGS) $(ZICCLSM_MARCH) $< -Wa,--noexecstack -c -o test-zicclsm.o
-	$(LD) $(LDFLAGS) test-zicclsm.o -o $@
-
-test-zicclsm-off: test-zicclsm.S $(LINK_SCRIPT)
-	$(CC) $(CFLAGS) $(ZICCLSM_MARCH) -DZICCLSM_DISABLED $< -Wa,--noexecstack -c -o test-zicclsm-off.o
-	$(LD) $(LDFLAGS) test-zicclsm-off.o -o $@
-
-EXTRA_RUNS += run-test-zicclsm
-run-test-zicclsm: test-zicclsm
-	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)v=true$(comma)zfh=true$(comma)zicclsm=true $(QEMU_OPTS) $<)
-
-EXTRA_RUNS += run-test-zicclsm-off
-run-test-zicclsm-off: test-zicclsm-off
-	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)v=true$(comma)zfh=true$(comma)zicclsm=false $(QEMU_OPTS) $<)
+	  $(QEMU) -monitor none -display none \
+		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
+		  -plugin ../plugins/libdiscons.so -d plugin -D $<.pout \
+		  $(QEMU_OPTS) $<)
 
-EXTRA_RUNS += run-test-misa-w
-run-test-misa-w: test-misa-w
-	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)x-misa-w=true$(comma)c=true$(comma)v=true $(QEMU_OPTS)$<)
+CLEANFILES += interruptedmemory doubletrap
 
 # We don't currently support the multiarch system tests
 undefine MULTIARCH_TESTS
-- 
2.47.3


