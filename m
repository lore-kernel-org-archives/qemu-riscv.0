Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gog2o-0004Uv-Bj
	for mharc-qemu-riscv@gnu.org; Tue, 29 Jan 2019 21:56:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gog2m-0004TV-6U
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 21:56:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gog2l-0001rK-C7
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 21:56:04 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34690)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gog2l-0001qy-6J
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 21:56:03 -0500
Received: by mail-pf1-x441.google.com with SMTP id h3so10720595pfg.1
	for <qemu-riscv@nongnu.org>; Tue, 29 Jan 2019 18:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=naju6uViNkteEL21nO3QItaeMjZq7W8u3tQlDF09vg4=;
	b=ggTP4reHaVYpicPvjO4XV09HqxJXtV29gXV4fkM2V0SStLC+5CLm2TTRi4GGxmTH2P
	1zn4WQcxn2Nrz0lWFlQc802Dsi5e6j82R/qgqAVb8hl1HRb95SXih/F6AOeC/o2LCMrr
	IRXSVXCWYFLzQvXBJGs33kwhkXCT8YO4qhiBLUKHzT1WnrQq+o+UGIf5ZSHZ3MeiPXKv
	KtVCfjlMWT+HOwVcWOSNWT/Y7l1Q4WzbbJfQw32/yCn0VXrJN+qSqMCLElvKuGW19vx/
	wwcBMClzYnBm5dO5bRHtsk9zC4S8/Qp531ogT/8oWqMeqY3eDOfX2XM7Rp/Je8KVuLJZ
	JhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=naju6uViNkteEL21nO3QItaeMjZq7W8u3tQlDF09vg4=;
	b=pSC2F/CMUB+Ll+Ux2GG+pO4XeA7ImEFOU0mXsTRWELOsWI0UFpPaGr2rSurFAWZENB
	ug1E1HPS3sGuzCDhHmzcQrDoF4F0VIJRM6AbqFcs2PwQBC/tq0ilyCEJ9y2SReGIXe5k
	p8ejCsFKWAq4t8fTrdPvJBxXN46FwpwhL1ObE7oISbwsi38xVjIQTROGKn5y33AX40Kn
	6yaPCzVImLuiItwHusGZOTqVyxlLa60JJGY2FLUIUJKHQaePV8R1B1Syo251J9LUwpNW
	AFrx5LkIEg8Xn3fW/a03OcPFGxE/CkIx63EN/1g9J83sjBxdM77mTe9I1oq0XmW6MePC
	PDNg==
X-Gm-Message-State: AJcUukc+sF46eGpQWGfxVn+ZyrGz/WiU4j1ODwl8yejB3hTdhua4fFFI
	Vf1prDKmZXmekSWTq3HQwHF9Yg==
X-Google-Smtp-Source: ALg8bN56yAz36u0uVlVCMQ8VgOfXR25q0jDFagCndZqRCJSyl8tAJc5PM/9EI7bh2nmYA8eK6KOU/w==
X-Received: by 2002:a63:fc49:: with SMTP id r9mr25483714pgk.209.1548816962319; 
	Tue, 29 Jan 2019 18:56:02 -0800 (PST)
Received: from rohan.sifive.com ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id a18sm188743pgj.30.2019.01.29.18.56.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 18:56:01 -0800 (PST)
From: Jim Wilson <jimw@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Jim Wilson <jimw@sifive.com>
Date: Tue, 29 Jan 2019 18:55:59 -0800
Message-Id: <20190130025559.12696-1-jimw@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFyWVaZ5tQq4eGaZiPBq7172PB_x3JCqV6c2xo=wSJdgbJakKQ@mail.gmail.com>
References: <CAFyWVaZ5tQq4eGaZiPBq7172PB_x3JCqV6c2xo=wSJdgbJakKQ@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-riscv] [PATCH 3/5 v3] RISC-V: Fixes to CSR_* register macros.
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
X-List-Received-Date: Wed, 30 Jan 2019 02:56:05 -0000

This adds some missing CSR_* register macros, and documents some as being
priv v1.9.1 specific.

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 target/riscv/cpu_bits.h | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5439f47..316d500 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -135,16 +135,22 @@
 /* Legacy Counter Setup (priv v1.9.1) */
 #define CSR_MUCOUNTEREN     0x320
 #define CSR_MSCOUNTEREN     0x321
+#define CSR_MHCOUNTEREN     0x322
 
 /* Machine Trap Handling */
 #define CSR_MSCRATCH        0x340
 #define CSR_MEPC            0x341
 #define CSR_MCAUSE          0x342
-#define CSR_MBADADDR        0x343
+#define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
 
+/* Legacy Machine Trap Handling (priv v1.9.1) */
+#define CSR_MBADADDR        0x343
+
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS         0x100
+#define CSR_SEDELEG         0x102
+#define CSR_SIDELEG         0x103
 #define CSR_SIE             0x104
 #define CSR_STVEC           0x105
 #define CSR_SCOUNTEREN      0x106
@@ -153,9 +159,12 @@
 #define CSR_SSCRATCH        0x140
 #define CSR_SEPC            0x141
 #define CSR_SCAUSE          0x142
-#define CSR_SBADADDR        0x143
+#define CSR_STVAL           0x143
 #define CSR_SIP             0x144
 
+/* Legacy Supervisor Trap Handling (priv v1.9.1) */
+#define CSR_SBADADDR        0x143
+
 /* Supervisor Protection and Translation */
 #define CSR_SPTBR           0x180
 #define CSR_SATP            0x180
@@ -282,6 +291,28 @@
 #define CSR_MHPMCOUNTER30H  0xb9e
 #define CSR_MHPMCOUNTER31H  0xb9f
 
+/* Legacy Hypervisor Trap Setup (priv v1.9.1) */
+#define CSR_HSTATUS         0x200
+#define CSR_HEDELEG         0x202
+#define CSR_HIDELEG         0x203
+#define CSR_HIE             0x204
+#define CSR_HTVEC           0x205
+
+/* Legacy Hypervisor Trap Handling (priv v1.9.1) */
+#define CSR_HSCRATCH        0x240
+#define CSR_HEPC            0x241
+#define CSR_HCAUSE          0x242
+#define CSR_HBADADDR        0x243
+#define CSR_HIP             0x244
+
+/* Legacy Machine Protection and Translation (priv v1.9.1) */
+#define CSR_MBASE           0x380
+#define CSR_MBOUND          0x381
+#define CSR_MIBASE          0x382
+#define CSR_MIBOUND         0x383
+#define CSR_MDBASE          0x384
+#define CSR_MDBOUND         0x385
+
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
-- 
2.7.4


