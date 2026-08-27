Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9BDC5DF9D
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:11:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSOC-0002yF-PZ; Thu, 27 Aug 2026 01:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOB-0002wj-Pz
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:10:59 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOA-00048p-BM
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:10:59 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-cc1cc1b42b5so1275689a12.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807457; x=1788412257; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0gZE6drI4G2uqSpEewl+0fUTFIgcDNV+tI0N/a53trk=;
 b=WGIDxJwsFYm0VbnaBrtURmXXKDg6ZHTmxNVfvZ63FUlzGr1IX8keGQ1Zh1GnzhSIYh
 Yt8bpP0NqUJJOJIW5p79R0gp7SohLXNCI6OS9PXOOgYjSpHwwDaqTetPz2/SInweZU63
 5IfJ8ZmJ7ZiLLZikku1e/ac7d1ljlKZLtyRs0LvjENUgMA72yQiWRWBwudHLODX/Hecx
 SbYu8TPEkaQdIb+R9AQe7HNuVb98fK9JKbpBHWWP2rE8JKFIIaKq6mgk4H8WkUzR2HNB
 h5oQFWeuzG+KidEOytj/Sz5TAMPiTSWkrkrvXnf16xaMyqxatEYd+QoU+qlubaEw2z+n
 LrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807457; x=1788412257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0gZE6drI4G2uqSpEewl+0fUTFIgcDNV+tI0N/a53trk=;
 b=E9PMYLvBY0zMQZortSlhgAWQ79nMf1KOuSx3gy0+6NGSdHj4pDrQHH/xbJyUE+JHIS
 kae2CwpT2t/kBNWtYlN1dLTkMHQOogfCwedFLXhhomfk7+E0yaFXTKs+N7YyJC2J1XDk
 Db5OETuC/SWN+JWjXqEQgM0TAfYgi5LwVJU3KIlroV3DCz3buRtrd99VWhnZJOF6StdL
 WK8OuGJE/sF4rlKE+nOiEwavCR3vvyvU+ZgnX1T1nhC6RwKrmypdIUGmznRFaLFgHVy7
 w/wKi9smiLHpV8sCOLXGq0ULGcDIv9EXr8aGT785sQ2L7u2ptx5ZLDZEtmMM7cx1uOix
 0p+g==
X-Forwarded-Encrypted: i=1;
 AHgh+Roy+A1r+RGKmamzCoPKCkfI+BAiIUCSreztDAPlXlDKDO1RFOkgi5JBJXIQVugAuVNi2NVmCZAI84on@nongnu.org
X-Gm-Message-State: AFuF++kzTwFiShvsld1tyUXNLye3WFJFsXaVSZ5355LhYYKYvRjTt/du
 wVnZXYBVoenRzvHJwNVrWBGl1+7cNHWSQ9xKI/s/O7XJtKwhmFsSl4na
X-Gm-Gg: AR+sD12FcxwUn+ixQgrm5v6dPpueLCSWq8T8tyiN8bAJoJy+bUj0jB0ixRcha9Gbox9
 nIngx1m99rXx/36c2DS2sbbv5vL7TO4mz/DCjdzEFdLFx8sOb/Ct/zWrjLL7DWekoeBTA4kDUVN
 HpONMrQ75I7nNHXSwnlBQxzs4jId366eTVwooC8hlw+c1RWF0bRzOhBxnn2cgsWqMsclrA7R0p/
 ESxB6tXxsb6QFqI+mDmQiay6hRijTAPoAx8sQ0/8+tlzYG9/0KU8yAg9NQhjdNYjZeh0U8RbGPu
 pUCmCPyrrOZrpBdIdeG/bqaHat8k5+20HeeFfEPjRLBjrbTW/uJIQCMIgyae8TeogKIABDX4RUo
 +0BLe923sKubRlj72rv0Fc6m0a9XTmqE/ST+xeEjVcwhbhsddnfHR8dQScEyWi6dK5RApZ1xgXQ
 faWSoiOIwdhbc6ZOY61jlAjp5585BVkTdUlyz21dKvkxCFc5Yedtez9+K7Jq6F9IpaWAvJJzs07
 EjTtSRaR623AXvQDz8VKEVgX1LkvMXd3xUEukHk/WCSEpobhnuubciFpJ0cuAc59f7Har8ECZlM
 O18mQqOVNOOBCi+DH+27
X-Received: by 2002:a17:90b:2792:b0:395:4290:46e0 with SMTP id
 98e67ed59e1d1-3966d20cd6fmr25206321a91.5.1787807456662; 
 Wed, 26 Aug 2026 22:10:56 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:10:55 -0700 (PDT)
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
Subject: [PATCH 07/12] tests/tcg/riscv64: Enable memory record and replay test
Date: Thu, 27 Aug 2026 14:39:46 +0930
Message-ID: <20260827050953.67184-8-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x531.google.com
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

Run the memory test under icount record and replay, copied from aarch64.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/tcg/riscv64/Makefile.softmmu-target | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 82e8fe2664b0..3f2a8ed16142 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -75,3 +75,22 @@ EXTRA_RUNS += $(MULTIARCH_RUNS)
 
 # Default is zicclsm=true, so misaligned accesses must work
 memory: private CFLAGS += -DCHECK_UNALIGNED=1
+
+# Simple Record/Replay Test
+.PHONY: memory-record
+run-memory-record: memory-record memory
+	$(call run-test, $<, \
+	  $(QEMU) -monitor none \
+		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
+		  -icount shift=5$(COMMA)rr=record$(COMMA)rrfile=record.bin \
+		  $(QEMU_OPTS) memory)
+
+.PHONY: memory-replay
+run-memory-replay: memory-replay run-memory-record
+	$(call run-test, $<, \
+	  $(QEMU) -monitor none \
+		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
+		  -icount shift=5$(COMMA)rr=replay$(COMMA)rrfile=record.bin \
+		  $(QEMU_OPTS) memory)
+
+EXTRA_RUNS += run-memory-replay
-- 
2.47.3


