Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6EUS-00082v-4j
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:09:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EUO-0007c9-Ad
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:09:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EG9-0004RA-UL
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:27 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37205)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EG7-0004MV-QH
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:25 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q206so13790870pgq.4
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=mDABQh5nPnuneoo2aLHbYuztoBF4pAv1E0JxPWEt/PU=;
	b=UUUqzYwkggA5BN2yEcv2Y782RQOJCHLb6Z81k3TM9hHXvp/NzrP/lE8Q2VV8JpRZ1d
	0loS1NibsJB/wshcBq+jcjwkk4eOXSIC5eyCDbEzuhGiVrRv4MLMr/5tp+11lhnTUQwn
	dS6QjWNWk7UPj1v1eiPuo7NlMQnCl2ue+7Uxd7OaoTfHBHywznV+prDUomFEtWCnOFUa
	WOz+MTPb/dZiswfsg9Tgs/xGr8GHNYXlrDebuqRv6bHY3Tvi5dBqhNSi5ZUnqeYpDvfX
	nzQffoX7oR64oG9o7Qvp34Q8GQE4wKTWqYct+CzFay/+ti3OcjPe9VpAwfxCCyrbMjzM
	QrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=mDABQh5nPnuneoo2aLHbYuztoBF4pAv1E0JxPWEt/PU=;
	b=tM95CnKAdA/SDhliQrKSHhdCjtxIKGTKdVPampnvp1BaIGhTKBVNPeqtTYvzDCuYk3
	VDLMjq/PyWs13REHC4H6u0N6L4ahz1lchU4Unlu7BkHoW2Bfepj/62bTn1fUkVArwc3i
	tydxYsfuXwW6qXnp6HlHGNLTRy99EBcC4nOrx6aYZhTL710xbsIySCGZOvVWzcitdvqH
	QlG5yuifP+A0+48BkTTur4pfcVYqh+Em1xzNLr3sqI4gNpYuBWWknkypJSINK5N1uKw/
	cBsY3C9kufWmSjmsInEVQH4RIQPfRpnsJrdPlMtCAiqMDDZuRa11CaX5lop6PPO6O7hw
	W4ug==
X-Gm-Message-State: APjAAAUBWvanA22gAO+NVERTpxDEmD8Wv6+gFLdGH3SOFKLdqP0PXkcE
	LkY5ocGcMANzusBBFRBtnbOc9rH3DqQXwuLm
X-Google-Smtp-Source: APXvYqz58DpB0wcBqvXMfmKnxKTGTf9HBbk9l38nZNxFEQfbe7vbPvw592Vu79yHSOEOkQAgUsSezw==
X-Received: by 2002:a62:1249:: with SMTP id a70mr1824917pfj.160.1553000060257; 
	Tue, 19 Mar 2019 05:54:20 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	i126sm21663185pfc.101.2019.03.19.05.54.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:19 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:47 -0700
Message-Id: <20190319124803.13826-4-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Jim Wilson <jimw@sifive.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52d
Subject: [Qemu-riscv] [PULL 03/19] RISC-V: Fixes to CSR_* register macros.
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
X-List-Received-Date: Tue, 19 Mar 2019 13:09:09 -0000

From: Jim Wilson <jimw@sifive.com>

This adds some missing CSR_* register macros, and documents some as being
priv v1.9.1 specific.

Signed-off-by: Jim Wilson <jimw@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20190212230830.9160-1-jimw@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_bits.h | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7afcb2468d80..7180fccf54f9 100644
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
2.19.2


