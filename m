Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6EUD-0007rj-VQ
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:08:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EUB-00078U-4o
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:08:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGN-0004qO-Mq
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:40 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43027)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGN-0004ob-GI
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:39 -0400
Received: by mail-pf1-x42c.google.com with SMTP id c8so6970160pfd.10
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=Mu7wvyze5Ur99TJLqlB4TuubbF/gonAiFXqj1nUTHG8=;
	b=L7IB1pWnzng+qqiikOcnLgBqI03fwexAOy3ljM1wvXHR2509HGZGv2PDTX163GvdFr
	S0E05VPnkB7WGKnrrDLVwzWtbw+kzDNwFLVRuLh3iCNaI5MLISwHe2qFRoh/0Hk37xPQ
	Fq93juFUSXE1U1YyEhRuITowcVDQITdMsILTtySItGJWmlwF8L17Bu1Qq7GNnlL4JMNx
	bza49pkmniJkFm2dttuOrfyysaFGVzpNE8fK6JC8U92lmXNFKxoA+FUpUmCXXa2GJlbj
	CVWtcqRCGUCS5+mpy+c4LeDvxRpMykILHFZ38Rd9+VkPDANsXmMWjYhfVXFoXW8tVqzf
	D6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=Mu7wvyze5Ur99TJLqlB4TuubbF/gonAiFXqj1nUTHG8=;
	b=Jc7Kz+e6qv9qeJ3aPyw0tdcAznpWPToXZdfp7UiSqfBnjlgKHGCsfv0/QLSdpECX5O
	UqB2PCQvWJg+53lF70cW5+KqVQKifY4EaOWJUrNMiZat6trN/oY9Se4uh/QfRLIHOYVd
	LqSOM6G4iLVdtbnWF+yzo9hnflPXDzMLIC5XYIOgCTjjWtMC2EZTHFVfmm9K6Z18R5X4
	GTexKRmUulJgc2qoVjreF2Pzd+D7OCzVl0//GeW+LoLU5xVgoX4V2pA7lT5kVE3OfGu4
	o/3t69aERFxkxZEz/+HYXmEn2w2etADn/jfa10TKVidOgSaiLMlYUxoHAXT8ny/UqsRM
	bC5g==
X-Gm-Message-State: APjAAAVGOE0rR5B1zYgM4N6QUEphtF69eqXaq1yDAlvZYq0w3qT3HffV
	ZrNQaWWcPcEgsSyyt6ZZgbrKNBtbdS4ELlAg
X-Google-Smtp-Source: APXvYqxCTdGgM0STgEI2ajBGyVFWVzOKD+cfXAbxsV+0sSR+u50aX7cMUI7EeOmRN42KZxrTscveCg==
X-Received: by 2002:a17:902:b609:: with SMTP id
	b9mr1941353pls.134.1553000078245; 
	Tue, 19 Mar 2019 05:54:38 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	w67sm13427153pfw.173.2019.03.19.05.54.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:37 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:53 -0700
Message-Id: <20190319124803.13826-10-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42c
Subject: [Qemu-riscv] [PULL 09/19] RISC-V: Remove unnecessary disassembler
 constraints
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
X-List-Received-Date: Tue, 19 Mar 2019 13:08:56 -0000

From: Michael Clark <mjc@sifive.com>

Remove machine generated constraints that are not
referenced by the pseudo-instruction constraints.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 disas/riscv.c | 138 --------------------------------------------------
 1 file changed, 138 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 7fd1019623ee..27546dd7902c 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -87,33 +87,10 @@ typedef enum {
 
 typedef enum {
     rvc_end,
-    rvc_simm_6,
-    rvc_imm_6,
-    rvc_imm_7,
-    rvc_imm_8,
-    rvc_imm_9,
-    rvc_imm_10,
-    rvc_imm_12,
-    rvc_imm_18,
-    rvc_imm_nz,
-    rvc_imm_x2,
-    rvc_imm_x4,
-    rvc_imm_x8,
-    rvc_imm_x16,
-    rvc_rd_b3,
-    rvc_rs1_b3,
-    rvc_rs2_b3,
-    rvc_rd_eq_rs1,
     rvc_rd_eq_ra,
-    rvc_rd_eq_sp,
     rvc_rd_eq_x0,
-    rvc_rs1_eq_sp,
     rvc_rs1_eq_x0,
     rvc_rs2_eq_x0,
-    rvc_rd_ne_x0_x2,
-    rvc_rd_ne_x0,
-    rvc_rs1_ne_x0,
-    rvc_rs2_ne_x0,
     rvc_rs2_eq_rs1,
     rvc_rs1_eq_ra,
     rvc_imm_eq_zero,
@@ -2522,111 +2499,16 @@ static bool check_constraints(rv_decode *dec, const rvc_constraint *c)
     uint8_t rd = dec->rd, rs1 = dec->rs1, rs2 = dec->rs2;
     while (*c != rvc_end) {
         switch (*c) {
-        case rvc_simm_6:
-            if (!(imm >= -32 && imm < 32)) {
-                return false;
-            }
-            break;
-        case rvc_imm_6:
-            if (!(imm <= 63)) {
-                return false;
-            }
-            break;
-        case rvc_imm_7:
-            if (!(imm <= 127)) {
-                return false;
-            }
-            break;
-        case rvc_imm_8:
-            if (!(imm <= 255)) {
-                return false;
-            }
-            break;
-        case rvc_imm_9:
-            if (!(imm <= 511)) {
-                return false;
-            }
-            break;
-        case rvc_imm_10:
-            if (!(imm <= 1023)) {
-                return false;
-            }
-            break;
-        case rvc_imm_12:
-            if (!(imm <= 4095)) {
-                return false;
-            }
-            break;
-        case rvc_imm_18:
-            if (!(imm <= 262143)) {
-                return false;
-            }
-            break;
-        case rvc_imm_nz:
-            if (!(imm != 0)) {
-                return false;
-            }
-            break;
-        case rvc_imm_x2:
-            if (!((imm & 0b1) == 0)) {
-                return false;
-            }
-            break;
-        case rvc_imm_x4:
-            if (!((imm & 0b11) == 0)) {
-                return false;
-            }
-            break;
-        case rvc_imm_x8:
-            if (!((imm & 0b111) == 0)) {
-                return false;
-            }
-            break;
-        case rvc_imm_x16:
-            if (!((imm & 0b1111) == 0)) {
-                return false;
-            }
-            break;
-        case rvc_rd_b3:
-            if (!(rd  >= 8 && rd  <= 15)) {
-                return false;
-            }
-            break;
-        case rvc_rs1_b3:
-            if (!(rs1 >= 8 && rs1 <= 15)) {
-                return false;
-            }
-            break;
-        case rvc_rs2_b3:
-            if (!(rs2 >= 8 && rs2 <= 15)) {
-                return false;
-            }
-            break;
-        case rvc_rd_eq_rs1:
-            if (!(rd == rs1)) {
-                return false;
-            }
-            break;
         case rvc_rd_eq_ra:
             if (!(rd == 1)) {
                 return false;
             }
             break;
-        case rvc_rd_eq_sp:
-            if (!(rd == 2)) {
-                return false;
-            }
-            break;
         case rvc_rd_eq_x0:
             if (!(rd == 0)) {
                 return false;
             }
             break;
-        case rvc_rs1_eq_sp:
-            if (!(rs1 == 2)) {
-                return false;
-            }
-            break;
         case rvc_rs1_eq_x0:
             if (!(rs1 == 0)) {
                 return false;
@@ -2637,26 +2519,6 @@ static bool check_constraints(rv_decode *dec, const rvc_constraint *c)
                 return false;
             }
             break;
-        case rvc_rd_ne_x0_x2:
-            if (!(rd != 0 && rd != 2)) {
-                return false;
-            }
-            break;
-        case rvc_rd_ne_x0:
-            if (!(rd != 0)) {
-                return false;
-            }
-            break;
-        case rvc_rs1_ne_x0:
-            if (!(rs1 != 0)) {
-                return false;
-            }
-            break;
-        case rvc_rs2_ne_x0:
-            if (!(rs2 != 0)) {
-                return false;
-            }
-            break;
         case rvc_rs2_eq_rs1:
             if (!(rs2 == rs1)) {
                 return false;
-- 
2.19.2


