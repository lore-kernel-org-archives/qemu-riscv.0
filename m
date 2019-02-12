Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gthAN-0005OI-FG
	for mharc-qemu-riscv@gnu.org; Tue, 12 Feb 2019 18:08:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gthAM-0005NR-0j
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 18:08:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gthAL-0002sR-BU
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 18:08:38 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38141)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gthAL-0002qT-3s
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 18:08:37 -0500
Received: by mail-pf1-x441.google.com with SMTP id q1so187707pfi.5
	for <qemu-riscv@nongnu.org>; Tue, 12 Feb 2019 15:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xf4bRx6j/bwpTEm7Vgnjf3FbAauofrWR7TzR9TjFWbc=;
	b=nWJMQvMoMMhFiLO8um+ZR41iNDdeD2y+K+gVK5/GC7ETupfSlmmkVXylY9uMVuylLi
	+1vktUlpyEVhJqzU/3tE9CmcSJ07H5AvEFGlJcWvyTddYowxxFj/NuGQO2Yb9VETa1fo
	xzItB/wiZ49zrxkfL8oSiByNwlI5dlrcnxD5PiIin/MRCmUNav9CQPm6B1Xo9arPD36q
	LDYQ0S4Ideuogzi+TNt6kRV+3aTha4+q+OMH3gKxshTDJPfYyrl5UP8X+PpRM77sYbok
	S/idJmEd4osJRanDykfcVfQpEEeMYfFYDMUtPySLJEyFGZMtOqH5PXKPtkGFrl6Hk80F
	bBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xf4bRx6j/bwpTEm7Vgnjf3FbAauofrWR7TzR9TjFWbc=;
	b=KYNxbhHKvCZnKJLeYIamP8w7aKhLGqOIqD2fbtgJQvoRVbqRqUI+/kdQnOnzGhvyye
	0Tst4/RuKtaPuxUL5R8pzu56zYQhyjFflkh5KyQrzG6JgzKju9FOHkmli/Fmtv9UZcaE
	YaurAmGCZc+R9XOXdm2RkR2v1sVrE4at/WyBfWG72r2JS9iZgMrxA3fFrF6mChftcujh
	aepxwFxrPaTaJM3SQCcVNtsf4gEjuZj4RR3264/93GFjj3JOCOlwdkye4H5KNoOAl/Yc
	sNUgvm+rsbTa89EgGGamlsMLAHwDN7DcRRfuuOGIu60izDc04G6/PmO8m1ah3zvSqtuj
	rf5g==
X-Gm-Message-State: AHQUAubHr+NuCfakazHXEgefv4QFHUtch9MwUOgTRjQ3k0tmSTERtwHg
	r0j4I5JccOtYEOdctbUrGacvTVJmI80=
X-Google-Smtp-Source: AHgI3IahJCO5Na1/yw6g4yOpyE06a/qwU3uet80YiAPIN24gBqGej9uavvpqZFCmhvC3FcHWQAUfeg==
X-Received: by 2002:a62:3603:: with SMTP id d3mr6571713pfa.146.1550012914586; 
	Tue, 12 Feb 2019 15:08:34 -0800 (PST)
Received: from rohan.sifive.com ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id
	y134sm4266708pfb.175.2019.02.12.15.08.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 15:08:34 -0800 (PST)
From: Jim Wilson <jimw@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Jim Wilson <jimw@sifive.com>
Date: Tue, 12 Feb 2019 15:08:30 -0800
Message-Id: <20190212230830.9160-1-jimw@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFyWVabfDYU+2+iDYOeFMBL4+hVFL5q=fSR7Pb=VX1af5xsTNg@mail.gmail.com>
References: <CAFyWVabfDYU+2+iDYOeFMBL4+hVFL5q=fSR7Pb=VX1af5xsTNg@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-riscv] [PATCH v4 3/5] RISC-V: Fixes to CSR_* register macros.
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
X-List-Received-Date: Tue, 12 Feb 2019 23:08:38 -0000

This adds some missing CSR_* register macros, and documents some as being
priv v1.9.1 specific.

Signed-off-by: Jim Wilson <jimw@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


