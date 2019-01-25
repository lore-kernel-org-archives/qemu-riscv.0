Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn9rA-0006wf-2X
	for mharc-qemu-riscv@gnu.org; Fri, 25 Jan 2019 17:21:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gn9r8-0006wI-7H
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:21:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gn9r2-0001EF-GE
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:21:42 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42611)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gn9qy-0001AQ-L2
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:21:37 -0500
Received: by mail-pl1-x641.google.com with SMTP id y1so5165476plp.9
	for <qemu-riscv@nongnu.org>; Fri, 25 Jan 2019 14:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=1CoMbp73UuffZba1TOHnL6qV9rcmsSpU5Lu5Vn5z66Q=;
	b=ZxvryXODiPcKmAYHIi037/7+QIsCdZGZX4uHedMQwy4dCcQo3fUvH9b/qcNaZhmdl1
	DmWQxH4cQnAl4pVWNfY6PmMsL3GzRYQKrLfyqft819DrTvntx9QSArbVTSYUBUyiSANO
	SJ7QymdEXuPR3c3Cue9j+73x2QJGzbaziSIAVmQ1CR4rijr9ejh2+33L+OyETSFoYjJv
	gk3Vx0gPGizWYHc6p/wz7Uu9beALzv3/HhKo5o8tjnhLrZk86bqPngtBnj4YagD2IxND
	TuJAboGovi24W6jUL8EVUQySsR4bhMsaJo8a7hk8vjhMK7TGVZFxuHbR2spAAK0W5Add
	vLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=1CoMbp73UuffZba1TOHnL6qV9rcmsSpU5Lu5Vn5z66Q=;
	b=NR0B0qFlpDEp+8Hhs4XfRiyMGVkLFCXVXtQy0VjiLKnHiwBkLQFiORQkzE5/GmCAYQ
	qk2yqufFq0EismjVsJaHGxSRhDgHrXXfax4b9isHPtb8dEfIdjnzAAjWWOWOB/4yylBF
	uf2z/j6NCIYU4qP3qFxqtTtLrYaxL/ut3PEGVB88pIIzTWBnSzzNm8wOglNqPrp6z0fz
	VRcs7kQBgLvzDIympQrDQvQZzfp/Vz40CyxAZ7bjbQgTb7kGEF38QUKDswXc8K3S3CMA
	GPCBBxap1q7jk71ZfitlWVQZWJHRx16Zq3boWR+g2wqEBNqWnF7q3uUVPkHEMdzLXOMu
	d3wQ==
X-Gm-Message-State: AJcUukcy27qdq0T5xkaD2XlfObN0hoK5xLcS4yEJrPaL95dgvjf85P20
	5IPELL4ChNSN/I1jAALD0q3xHA==
X-Google-Smtp-Source: ALg8bN7b1GgLRvcIdo+OSepmsBpx4ndufUvPSImRerR2/6BC3nW+YvtdRrqi5Un3T3Dn2D4zbD+xEQ==
X-Received: by 2002:a17:902:2aa8:: with SMTP id
	j37mr12249112plb.226.1548454891425; 
	Fri, 25 Jan 2019 14:21:31 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	h69sm32911670pge.4.2019.01.25.14.21.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 14:21:30 -0800 (PST)
Date: Fri, 25 Jan 2019 14:21:13 -0800
Message-Id: <20190125222113.31183-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-riscv] [PATCH] MAINTAINERS: Remove Michael Clark as a RISC-V
 Maintainer
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
X-List-Received-Date: Fri, 25 Jan 2019 22:21:47 -0000

Michael is no longer employed by SiFive and does not want to continue
maintianing the RISC-V port.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index af339b86db76..47cb3c14298e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -259,7 +259,6 @@ F: include/hw/ppc/
 F: disas/ppc.c
 
 RISC-V
-M: Michael Clark <mjc@sifive.com>
 M: Palmer Dabbelt <palmer@sifive.com>
 M: Alistair Francis <Alistair.Francis@wdc.com>
 M: Sagar Karandikar <sagark@eecs.berkeley.edu>
-- 
2.18.1


