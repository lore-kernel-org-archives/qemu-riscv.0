Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPcKz-0006W7-N6
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 18:55:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPcKw-0006Tu-Qq
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 18:55:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPcKs-00058a-Uy
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 18:55:14 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPcKr-00052D-Ug
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 18:55:10 -0500
Received: by mail-pl1-x642.google.com with SMTP id a14so7658973plm.12
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 15:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=A4PQBGJeX1dTAo8wA2JtLTJ4UrBAtZHKEGcduJEKVKU=;
	b=ML/fUimvl2PwZ98vq3n0012U2NJAjxPIb4ulmzi0Rz+L14dJqn0qx98t2dLNnRq9EH
	DWU9BAxyaZkBj5K9trlFmI+rOShVmUMfULoTP0JHyhdfUggE3vPAsX3oFdBcwPVqvGqk
	r534sJHcHVGU/tFleMFCPQl4UpCnGWIoPl0Rd/ys3HiVqP+ZGKHEEfnaD5nOc3Cl0sjz
	1h6vUkWz27jE0dDd0IrH6HnlN1zuMg1Y9gj/ZJLS76/W25lna7F34CkxDChYClwQheQ1
	WQQUWbGzauisagNt/Du88xq7B7NIYTB4nfP30D3lHhpcBd0EsYY+Mm/zzxd+Ay55C4Ya
	4yxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=A4PQBGJeX1dTAo8wA2JtLTJ4UrBAtZHKEGcduJEKVKU=;
	b=U5vw8qfXyKa2gKTIkU07CpATO913P8I6XlI43pZqrvQmLMsdHu2T0EDjY3EtInf4dQ
	9iRd8bd9rXD0Wi8nrEjfjkBkG9QGxluceam75L7FyYn3xoiCYDMbq3xaNuZauEtCwBno
	tRnjP7EX/yfRYd0b7DsH1t2LdmTtJj2e8Tv2UbmaVE4xZon8CZNp+XPrb52v/n3M04xE
	W5OWPJQcN/VAr9kRONLGcrcenlEtCN74IlJ7virdFKa1hlEIk4qH2Sg1Ml8pbm8Rf0EQ
	aCq+QSPwmuKFr8rH1RujuGPWx+qriB4sW7bdOPURM1cmspPxXD9V+hk+eH1cDl2SiKAf
	M9rg==
X-Gm-Message-State: AA+aEWa3CUJ5DJ4InHEtPI4AHmA3c1TK7OwbEhP8lSpXc9FZwOATdWbW
	M37nMvrSc0Q9iljFygWxI5lyQQ==
X-Google-Smtp-Source: AFSGD/W1fuapwaaYr8wSd6ZNcK+L9ZSRq67gXObZgdGC5+zRIiGvPWaTFRSqESwDJQGur2ID89SC1Q==
X-Received: by 2002:a17:902:12c:: with SMTP id
	41-v6mr5868278plb.28.1542844499733; 
	Wed, 21 Nov 2018 15:54:59 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	m20sm48042799pgb.56.2018.11.21.15.54.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 15:54:58 -0800 (PST)
Date: Wed, 21 Nov 2018 15:46:50 -0800
Message-Id: <20181121234651.24596-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-riscv] [PATCH for-3.1 1/2] MAINTAINERS: Any file with "riscv"
 in the name is a RISC-V file
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
X-List-Received-Date: Wed, 21 Nov 2018 23:55:15 -0000

There was a recent thread about unmaintained files in QEMU where it was
noted that a few RISC-V related files had slipped through the patterns
in our MAINTAINERS file entry.  This patch adds some more aggressive
pattern matching in an attempt to rectify this situation.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1032406c5607..e89adc81d5d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -255,6 +255,8 @@ F: target/riscv/
 F: hw/riscv/
 F: include/hw/riscv/
 F: disas/riscv.c
+K: riscv
+N: riscv
 
 S390
 M: Richard Henderson <rth@twiddle.net>
-- 
2.18.1


