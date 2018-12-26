Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrb-0004bb-Mr
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:20:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrZ-0004Y3-GA
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrX-0007zv-G3
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:57 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:35217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCrX-0007lE-6J
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:55 -0500
Received: by mail-qk1-x72f.google.com with SMTP id w204so9627612qka.2
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=6p7JyG3RH0lXqirJxx0bPeJBobxdYh1L5CqZ7x4vX6o=;
	b=kyb0Qz8V8wY086i8TVQOMrraM7uoNay3CSgQ/n6vVIYGGXXea+aVTCXHeUcIJ2zh1W
	rNzYRHizG8Gi5RDJM/xnQ78gByn4sUowSEXGeqOcFJF/9uspytkLDPv1s8dgtFdq2GTS
	eQZ8U5Y3JU/nQC3Katj0V9+y2PnPNC7AVE6k4g42OpklzbJb7d7jzV1QU/XhqNCx8FGU
	CsG/2G7jLscCRfv/6I9MFDiHQjdQ/9A+XdhDSshqj8AT+/jJfb1eHx8duQ+GTiINcw5I
	+x7Job7PeAOSEx+uLBu0A4ykmF0CkZLjWTfwihPELch7XPntEuvU1uHsKLb2YX0ICnax
	Petw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=6p7JyG3RH0lXqirJxx0bPeJBobxdYh1L5CqZ7x4vX6o=;
	b=FDR7oP2lamUWu5PN/yLAWYsCUpwAVPYz4yZTmLkV3a/HzUNxZBJN5U/YCsAAgMh950
	Gu3Rs09KwttTX6SpPQy6AzoH6gK1LfU+ysUrb2/11t5lJ0nl3+wuHNbaIjsWcpVCw2sP
	s+sxyM8NXqoXUNEVFuGvvRYIlRuJIijB8dTQDMbWMu7zV1V6Mc/N1UT8D7L14g/09kbt
	pJAmzFBd10GNYAxwRHY7pdrdMP7J7X5FwdUCcYr4SFzsWdaAC0rD3DaGBxuhT8/GKb+/
	R47UpfXpSjP3tm40EO0IP5lZENOSNwzBwosS7VfvowPTvlp1DlN6dBuRhE7xBvA94FT5
	lOZQ==
X-Gm-Message-State: AJcUukd7g+p9RPRk/FvK8RMkKbHdwsqOKJtrVZLbZ33IYxgeLvlhx3nd
	mdShZOFswWmbhyFKwiJEh5vajwW2qdM=
X-Google-Smtp-Source: ALg8bN7bTmlNmmT3SNyw9dsL1scCPDR2BKlRbj10fAUfd0WKUGy2dJ7XtLrqprHdA/1HafZO+kVvyQ==
X-Received: by 2002:a37:cf02:: with SMTP id e2mr18435463qkj.38.1545844826382; 
	Wed, 26 Dec 2018 09:20:26 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	b75sm22195967qkh.4.2018.12.26.09.20.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:25 -0800 (PST)
Date: Wed, 26 Dec 2018 09:19:58 -0800
Message-Id: <20181226172005.26990-8-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181226172005.26990-1-palmer@sifive.com>
References: <20181226172005.26990-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::72f
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
X-List-Received-Date: Wed, 26 Dec 2018 17:20:58 -0000

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


