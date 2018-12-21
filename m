Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNHU-0001jf-2w
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:04:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHP-0001gd-Kj
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHO-0004G3-9L
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:03 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:44989)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNHN-00047H-Ps
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:01 -0500
Received: by mail-qk1-x72b.google.com with SMTP id n12so3336737qkh.11
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=6p7JyG3RH0lXqirJxx0bPeJBobxdYh1L5CqZ7x4vX6o=;
	b=i5VRlBJXxsxNZX8ofxaIH9l0PPfVsIyemjtcRHurEggdU1upO3T75vMEMMQaS3aq57
	P+u/PEaBJu6uYxklxO7snsysI3RvHBNULRMHWp7sA/HwqIIaWcyRNFx0QuAf+ZjloY3r
	BHpyAuqFtYxu4dIDzK5wtBAAXDke+y1Dlz1YmsDDkoj3dg1iD45zCwWJRGBMV+NNkyiY
	nkBnk3twCBY7Qq37LjwOc9XW/JaLQP9ysY1C98FDIdSDWYUuWDjkiREv20vwgaqwDWdO
	m2u5hBuWUZbn8Ai9tpmEHYif87CoIZlJGOB2fpllx2Z1co4o4lab1TrE0Z/GWMOfE+ya
	9Phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=6p7JyG3RH0lXqirJxx0bPeJBobxdYh1L5CqZ7x4vX6o=;
	b=nek7EyxN96Uu7lVZH4anLvwj/IAAsUCBEQBJPjsHPgF7XeSWiTMyzIjltco6eCC3x2
	x1rmi18szLGTVyuG87MoVTg6t0pAlATCnP+ufeKREA1fDd+DXK4Euf42zl2jcYgU/9R7
	Bu0LM93JAq9u4Ni1P92ELPmq5LpdY0iFEF19cAAcXkQ3sFEr47uXRJVB4y2OOFz4Agt1
	H4a/koEvjM3q7TZJw2CPrLVQeiVTottzQCyD6feYVQjNJgh86IejN6/d4KUzgmZdy6fR
	1f1t/kzqWcndoT8NaMGcl5N+teYIGI5Ll8qDpBYcpi8+1hT2Ta+L7hsl2AQgxZE+NlQD
	qQqw==
X-Gm-Message-State: AJcUukd/9QAMTf2JQfBEZpxt5CcCIOINVJC9A/Bk+5a/T42UcVtQ8hHW
	GxsRSw0Oq6Rney5bi43V0eLlpQ==
X-Google-Smtp-Source: ALg8bN5E6/wcHqKSJTWLLgX85358q0sOVtwP/4yG41Zp/vwnghwX/2+D4xGm2LFBUtO55W8yA4UtOg==
X-Received: by 2002:a37:96c2:: with SMTP id y185mr2692248qkd.239.1545408225952;
	Fri, 21 Dec 2018 08:03:45 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id n3sm6635062qtc.81.2018.12.21.08.03.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:45 -0800 (PST)
Date: Fri, 21 Dec 2018 08:03:00 -0800
Message-Id: <20181221160307.14819-8-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181221160307.14819-1-palmer@sifive.com>
References: <20181221160307.14819-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Michael Clark <mjc@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::72b
Subject: [Qemu-riscv] [PULL 07/14] RISC-V: Add hartid and \n to interrupt
 logging
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
X-List-Received-Date: Fri, 21 Dec 2018 16:04:04 -0000

From: Michael Clark <mjc@sifive.com>

Add carriage return that was erroneously removed
when converting to qemu_log. Change hard coded
core number to the actual hartid.

Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_helper.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 86f9f4730c88..0234c2d52886 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -445,11 +445,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     if (RISCV_DEBUG_INTERRUPT) {
         int log_cause = cs->exception_index & RISCV_EXCP_INT_MASK;
         if (cs->exception_index & RISCV_EXCP_INT_FLAG) {
-            qemu_log_mask(LOG_TRACE, "core   0: trap %s, epc 0x" TARGET_FMT_lx,
-                riscv_intr_names[log_cause], env->pc);
+            qemu_log_mask(LOG_TRACE, "core "
+                TARGET_FMT_ld ": trap %s, epc 0x" TARGET_FMT_lx "\n",
+                env->mhartid, riscv_intr_names[log_cause], env->pc);
         } else {
-            qemu_log_mask(LOG_TRACE, "core   0: intr %s, epc 0x" TARGET_FMT_lx,
-                riscv_excp_names[log_cause], env->pc);
+            qemu_log_mask(LOG_TRACE, "core "
+                TARGET_FMT_ld ": intr %s, epc 0x" TARGET_FMT_lx "\n",
+                env->mhartid, riscv_excp_names[log_cause], env->pc);
         }
     }
 
@@ -511,8 +513,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
         if (hasbadaddr) {
             if (RISCV_DEBUG_INTERRUPT) {
-                qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld
-                    ": badaddr 0x" TARGET_FMT_lx, env->mhartid, env->badaddr);
+                qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": badaddr 0x"
+                    TARGET_FMT_lx "\n", env->mhartid, env->badaddr);
             }
             env->sbadaddr = env->badaddr;
         } else {
@@ -536,8 +538,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
         if (hasbadaddr) {
             if (RISCV_DEBUG_INTERRUPT) {
-                qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld
-                    ": badaddr 0x" TARGET_FMT_lx, env->mhartid, env->badaddr);
+                qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": badaddr 0x"
+                    TARGET_FMT_lx "\n", env->mhartid, env->badaddr);
             }
             env->mbadaddr = env->badaddr;
         } else {
-- 
2.18.1


