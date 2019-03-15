Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4mTA-0002Xa-0Z
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 09:01:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chihmin.chao@sifive.com>) id 1h4mT5-0002TT-DM
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chihmin.chao@sifive.com>) id 1h4mRI-0007mj-KP
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 08:59:57 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43193)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
	id 1h4mRH-0007km-NJ
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 08:59:56 -0400
Received: by mail-pg1-x52a.google.com with SMTP id l11so6417170pgq.10
	for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2019 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PIws0PkmsF4RC1TSl16G4ceM81JUpFdzAIEJmY/3Pl8=;
	b=BELIrwaXG6gT1teCCSyzyoJqidnDnRkCxmtNzR9Pg9Ce/Xr/rCZEfRjtHDqPFVIbgA
	MMun/3CThpdu7yTaoJ/ER/NnrlhZfDbqUyfevA4p6G2X789uflnxzMxAmRPw1ENCjTG8
	iv7Gg/fjWIZ7FM/6TlIM+nN+hKjRFEBKtwBoY6/QZqP9ovXDT41fh5ZnKDagdP+0ogsj
	hx49S40N6jfEUZoZkaxKf+URalQQtawkvv3pTHhMrUOAh6Khf4ZAtSCrGVrFvPofM9wc
	QYBDKiB/arjkepfSjTJJ5btRL/IxWFVGz9SeOBJVJ63I+Nj8WIx+vluctJbsM0T2s9sF
	snjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PIws0PkmsF4RC1TSl16G4ceM81JUpFdzAIEJmY/3Pl8=;
	b=KU5HbakS7BIp/gIWNlfcBT8NQzd/Rt/QFpuRGftZTVv4U5GnzrpyA7xYIC42lFvG9r
	tTXQuck789t9ultOIzaNzM9nHBd9TECCPYKzWqzY/KzUQoQD/tpElAssYyx+NRgWvRPd
	nj6oC/Apx01vjuKQORad0SJOoTFA/PQV6ZMVUp77iwhukokEnTE4NZrbI2U1anH03T2l
	Wl5ipu7gzQfr5pQ8AcQ88oNv55KtRnfEQq07wlQO1A/oiXWqXmVEmjHSOKIvt+BR9Dls
	Ax0rAWI/pRz+RAv8GBeFiFLnIDuWwGI59bI7+vIenXMus8SlpFwu83cuye9lTiQiFpO0
	Rogw==
X-Gm-Message-State: APjAAAWrke4xO3iEol1fsWNtVEGvUN9aa1BAaRPy/KXy+VedXGMyMS5l
	kjjq7WJPUGGwPTZ6ifvbnerPlUjm/scIKg==
X-Google-Smtp-Source: APXvYqzfamd94F8WhlYLaJItilYF6OuZck6WBxEfdbvGDoasgTBcHMXkSdUlVQljjUpDCdgmTDUmRA==
X-Received: by 2002:a17:902:2e01:: with SMTP id
	q1mr3461900plb.253.1552645666462; 
	Fri, 15 Mar 2019 03:27:46 -0700 (PDT)
Received: from gamma06.internal.sifive.com ([64.62.193.194])
	by smtp.gmail.com with ESMTPSA id
	f15sm2225401pfa.11.2019.03.15.03.27.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Mar 2019 03:27:45 -0700 (PDT)
From: Chih-Min Chao <chihmin.chao@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jim Wilson <jimw@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Fri, 15 Mar 2019 03:26:57 -0700
Message-Id: <1552645619-18244-4-git-send-email-chihmin.chao@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552645619-18244-1-git-send-email-chihmin.chao@sifive.com>
References: <1552645619-18244-1-git-send-email-chihmin.chao@sifive.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52a
Subject: [Qemu-riscv] [PATCH v5 3/5] RISC-V: Fixes to CSR_* register macros.
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
X-List-Received-Date: Fri, 15 Mar 2019 13:01:50 -0000

From: Jim Wilson <jimw@sifive.com>

This adds some missing CSR_* register macros, and documents some as being
priv v1.9.1 specific.

Signed-off-by: Jim Wilson <jimw@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20190212230830.9160-1-jimw@sifive.com>
---
 target/riscv/cpu_bits.h | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7afcb24..7180fcc 100644
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


