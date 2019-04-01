Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAnN3-0006qu-Gh
	for mharc-qemu-riscv@gnu.org; Sun, 31 Mar 2019 23:12:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnN0-0006nc-8Z
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnMz-0002r9-A1
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:22 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43247)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hAnMv-0002p3-HG
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:19 -0400
Received: by mail-pg1-x542.google.com with SMTP id z9so3979860pgu.10
	for <qemu-riscv@nongnu.org>; Sun, 31 Mar 2019 20:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dpFu0UtJn3h4iEnuE21ntkTj1sL+0aSszxtNnRJ8slY=;
	b=cuvFpT6dCZz+T+10qlpByshL2+NDRl94HsNxeEyC20fAX1tH5dXkxflFqc0waLOfNa
	JCgKXbvPc1BZzJQufk13MwVRwsOkbWUo/+ShzyVRA8NR3GG1Uc5tZqKQ2EH4US63QR+2
	ZqqFwu+DLNpQI2qYUm3Jkw2SJGO4VYn8Bo7HjimL+96MU3FOtP8d9CXTtnIyEnoQfvej
	3/IePFcUbfLImhDldIhPHBZu3Boqku2SQmglLyY/LUCpizZSIWV7zghrZFhFHHehQy3Q
	1o2gCKh5/xnsPFk1v5rJnj3yb63ok+XHzaqsGkN54Z0aEFCLKITytK8OT86up4x1H8vc
	vsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dpFu0UtJn3h4iEnuE21ntkTj1sL+0aSszxtNnRJ8slY=;
	b=MmoMDulqlcC06VL5ZTRobLFNn6rSPbf4d2cYlGKC1sygCs1d4OvMn8Hv2nYHlLR3Dh
	ocD4yZxFreG75dXCY6W4do2kIUO9AhwuF/UNz+lrDDmD9zWa97fS+iGHNE4OyV60oVuu
	tBwziLNqUsg7ywALyH/yh5vs9WJvR2R7pgJU7JZDiSJ7u15eqGtav2xjWCmghImQ1xWU
	29fnztsSod/+JQRxEJrpF3Ij0RcFiP8nuBPYL18bm9nshw79lY3YhR9Ba5MbbTrKb0VT
	VKgiCIbe4mnGBSryainQEP7XdsvuFcj+XCSwuOML1mlWp2FWa4MVsSHvyTrxiB8h0PGk
	PT6g==
X-Gm-Message-State: APjAAAXy9nPVG4Jg//GrCiDmPrn7us+GnzbFQb+TjiQQDNPq0yiKVroC
	+1Mxlj0IFMIjtEftTMLuEgeMnQ==
X-Google-Smtp-Source: APXvYqzD8BbRLotGQp7cDFgS0PD/h6ZMEzhdLgbjgpvgiD13ssBwPt71ngvQhZBdjRA1RfqlIsU63w==
X-Received: by 2002:a62:b612:: with SMTP id j18mr89117pff.124.1554088334102;
	Sun, 31 Mar 2019 20:12:14 -0700 (PDT)
Received: from cloudburst.imgcgcw.net ([147.50.13.10])
	by smtp.gmail.com with ESMTPSA id
	c1sm11843954pfd.114.2019.03.31.20.12.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 20:12:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com,
	palmer@sifive.com, qemu-riscv@nongnu.org
Date: Mon,  1 Apr 2019 10:11:49 +0700
Message-Id: <20190401031155.21293-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190401031155.21293-1-richard.henderson@linaro.org>
References: <20190401031155.21293-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PATCH for-4.1 2/8] target/riscv: Use --static-decode
 for decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2019 03:12:23 -0000

The generated functions are only used within translate.c
and do not need to be global, or declared.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c   | 2 --
 target/riscv/Makefile.objs | 8 ++++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index dd763647ea..7ebd590486 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -538,7 +538,6 @@ static int ex_rvc_register(int reg)
     return 8 + reg;
 }
 
-bool decode_insn32(DisasContext *ctx, uint32_t insn);
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode_insn32.inc.c"
 
@@ -667,7 +666,6 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
 #include "insn_trans/trans_rvd.inc.c"
 #include "insn_trans/trans_privileged.inc.c"
 
-bool decode_insn16(DisasContext *ctx, uint16_t insn);
 /* auto-generated decoder*/
 #include "decode_insn16.inc.c"
 #include "insn_trans/trans_rvc.inc.c"
diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
index 9c6c109327..c7a1b063ed 100644
--- a/target/riscv/Makefile.objs
+++ b/target/riscv/Makefile.objs
@@ -7,14 +7,14 @@ decode32-$(TARGET_RISCV64) += $(SRC_PATH)/target/riscv/insn32-64.decode
 
 target/riscv/decode_insn32.inc.c: $(decode32-y) $(DECODETREE)
 	$(call quiet-command, \
-	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn32 $(decode32-y), \
-	  "GEN", $(TARGET_DIR)$@)
+	  $(PYTHON) $(DECODETREE) -o $@ --static-decode decode_insn32 \
+          $(decode32-y), "GEN", $(TARGET_DIR)$@)
 
 target/riscv/decode_insn16.inc.c: \
   $(SRC_PATH)/target/riscv/insn16.decode $(DECODETREE)
 	$(call quiet-command, \
-	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn16 --insnwidth 16 $<, \
-	  "GEN", $(TARGET_DIR)$@)
+	  $(PYTHON) $(DECODETREE) -o $@ --static-decode decode_insn16 \
+          --insnwidth 16 $<, "GEN", $(TARGET_DIR)$@)
 
 target/riscv/translate.o: target/riscv/decode_insn32.inc.c \
 	target/riscv/decode_insn16.inc.c
-- 
2.17.1


