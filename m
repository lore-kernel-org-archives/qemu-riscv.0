Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxf-0003yB-GG
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxP-0003Hg-Kz
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhfs-0005oF-PZ
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:10 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41376)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhfs-0005ns-Ja
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:08 -0400
Received: by mail-pg1-f195.google.com with SMTP id z3so2468137pgp.8
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=OmquU5pLX4FdtJeBi0sZUSl7FBDLh8w+FhsdYMBvZRk=;
	b=AEXMAXRiQYJht7nDmzjgATUXPLKw7iiXpmZ7ks49UL+w0tV/vV/vQT6UzYsNHEcKFg
	BGXpoiyoR23WlO47woAj9+NeLfPZsmTpv9l08fPhpPi3aITlV0K+Lgruw7KxFA+4lnp1
	xmKAsoJzbR72G/8TPE7JnNYephYuLuUhqdASpTMmdWmjBrmPFkgdpzWRbfluO2DMp6/r
	s/9ZOFc3OWYWjtEPkOZYz2/Q/SAi1zo4+Fnl/aIgSBMZufsobXKsMywQAdY6T0IAZ3uN
	ZZiHgTuSR37FZI0FNdSaLj+7C+zmrqr+ZrjTnZUOiqvOKW75PqDVK/3Q/AIEIaQI1Azp
	vV9g==
X-Gm-Message-State: APjAAAXXCLh6c93dL7LtNhluBLzpOUpNziDyrr9h7ulXjZJI0UV1I9QE
	MaSm7fP/xIkedJgApAxz58AQtbb3c+4=
X-Google-Smtp-Source: APXvYqzHrhWdg2xAkYl//ofxdVxMzdkhOY6GD2xewYUdhuga8Io9eYYbJNiWn6yClY9Fqh62oaYYpg==
X-Received: by 2002:a17:90a:de0e:: with SMTP id
	m14mr20184255pjv.36.1558833007034; 
	Sat, 25 May 2019 18:10:07 -0700 (PDT)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id n2sm6014719pgp.27.2019.05.25.18.10.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:06 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:24 -0700
Message-Id: <20190526010948.3923-6-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.195
Subject: [Qemu-riscv] [PULL 05/29] target/riscv: Use --static-decode for
 decodetree
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
X-List-Received-Date: Sun, 26 May 2019 01:28:17 -0000

From: Richard Henderson <richard.henderson@linaro.org>

The generated functions are only used within translate.c
and do not need to be global, or declared.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/Makefile.objs | 8 ++++----
 target/riscv/translate.c   | 3 ---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
index 9c6c1093271e..c7a1b063edc2 100644
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
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 928374242e83..b09158117f32 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -558,7 +558,6 @@ static int ex_rvc_register(DisasContext *ctx, int reg)
     return 8 + reg;
 }
 
-bool decode_insn32(DisasContext *ctx, uint32_t insn);
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode_insn32.inc.c"
 
@@ -701,8 +700,6 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
 # endif
 #endif
 
-bool decode_insn16(DisasContext *ctx, uint16_t insn);
-/* auto-generated decoder*/
 #include "decode_insn16.inc.c"
 #include "insn_trans/trans_rvc.inc.c"
 
-- 
2.21.0


