Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTko-0003GI-Gj
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkn-0003Cx-72
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:21 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkj-0002wa-96
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:20 -0500
Received: by mail-pf1-x435.google.com with SMTP id j12so5302512pfj.12
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1B1lAs1ENLSRJlGwFy7I/FZXh4BfFPp2mlxsIvpc5lU=;
 b=e3BoeLHzwEQQVA/N2e32vplMSXy+3E26dos3JUkmr5rTObjx34seL85eoy7i4Ntvv0
 3Lpf0BNnIxqqrBwA74WnbUWL04WlFNXUz7fRt5sqz3ByiJSrxEWmdcL0hsMGGLgqH00+
 KkwAfi+GB87+6NgmZE+ep82ZybzWw8rgA00UlO7xlBLcgePFTNkVP5f027r6m4uOsi4Q
 8cjOwZmaJyg5dyK4GFS7fAVAAlmgpLap8qxNeaRfFOBiAFDpsilJJBZptWWU/CXUotHS
 vw4uqJEdDw4QI4W72vKhNMt/HbibITwrYy7ClvCB3ogRuCNsriOCKIwIwK7T7ZVnruvi
 hrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1B1lAs1ENLSRJlGwFy7I/FZXh4BfFPp2mlxsIvpc5lU=;
 b=UYIybjCVLs9ttKsEnrnp76eyhAAb8uUOwTwcdM4Ndx0Jj0wVPTAZ8pxcS5KsX9af6R
 ByHV+C3hHDqbhxmgol3xJz+TcG/RPgh6s13K22lWko+ocHxkKaR8vJvzOELE6zJMfHrZ
 FywSnjOf8bw+ploJAWuzhd5wRcuFxwpsEiDTAvbVAxKpvIYSnaV5Qr6iqQze6S/OFbH1
 p1fum92NhsDFOWyvGcvp7pXvJslnauolo/uqNwU2oHKI92en+ZSxuVR6ExdJtqgimDPd
 PvUlb9qcaUcvPuG6ZQTIV/fXclKhOvS9L48NsrqI8E61fViF4VOrsdLX+Z3sSiOf39Ye
 1Yuw==
X-Gm-Message-State: AOAM5321YVGCeHNv+dkeKaQYvXFtZlCV9XsYsLZ7rtJuvjCjYjulcPXn
 EkQ1gT8OvRMmoXyuDRXJG4Jyvg==
X-Google-Smtp-Source: ABdhPJy6Tp3Cj/4mlo3wm2x+ISkbN0YF5n2wSIpkkeuhPtfgYQ1bOikSOC3wbFECO3quwcz2BV1JMw==
X-Received: by 2002:a63:ab4f:: with SMTP id k15mr1019919pgp.280.1614309916107; 
 Thu, 25 Feb 2021 19:25:16 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:15 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 64/75] target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
Date: Fri, 26 Feb 2021 11:18:48 +0800
Message-Id: <20210226031902.23656-65-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Feb 2021 03:25:21 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>

--

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h                      | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 367b182735f..ad2497229db 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -103,7 +103,7 @@ typedef struct CPURISCVState CPURISCVState;
 
 #include "pmp.h"
 
-#define RV_VLEN_MAX 256
+#define RV_VLEN_MAX 1024
 
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6f5c48db0e6..1f6cd7f97c6 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -613,8 +613,8 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     base = tcg_temp_new();
 
     /*
-     * As simd_desc supports at most 256 bytes, and in this implementation,
-     * the max vector group length is 2048 bytes. So split it into two parts.
+     * As simd_desc supports at most 2048 bytes, and in this implementation,
+     * the max vector group length is 4096 bytes. So split it into two parts.
      *
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8d389af4b78..16331939b64 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -129,7 +129,7 @@ static uint32_t vext_wd(uint32_t desc)
 static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
 {
     /*
-     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
+     * As simd_desc support at most 2048 bytes, the max vlen is 1024 bits.
      * so vlen in bytes (vlenb) is encoded as maxsz.
      */
     uint32_t vlenb = simd_maxsz(desc);
-- 
2.17.1


