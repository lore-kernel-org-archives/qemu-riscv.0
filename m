Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8jGt-0005SJ-1O
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 06:25:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8jGq-0005O7-Nv
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 06:25:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8jGn-0003DP-JR
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 06:25:26 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41985)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h8jGm-0003AD-RO
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 06:25:25 -0400
Received: by mail-pl1-x631.google.com with SMTP id cv12so1421935plb.9
	for <qemu-riscv@nongnu.org>; Tue, 26 Mar 2019 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=HklHhmDM59MkOjdXsKTPylfecA3c+4SUX5wYNfledhw=;
	b=Y7KCWrVNswOotVHn3+/MVpZQNn2AYy7NUq/kj10wM2wNzl5qZaocHb+4kdqn4hC+R8
	NWTM+iBgluM4pGfIZM4TzKUGWeTAYhIizyJ7UA+tgyJNoui4kZ7oGsoCCXFK9dIAtYrG
	mxmywywedQUOhFEfErsn8PRldooEfez0IvK1wLGs4vYLdZkHQVxiS01IImB7hdIE/OZ2
	1TqydKFacTYoLVIZ01esWkmq79z8yEM7Wj6OHOKo68pSxfYyvqIC+/Qf3M40n6N5YnCQ
	cHkhLPT1dQbMm55nUn698xipvf2ai0Xel1Y6YxwJPn6n6EVZ8gw+gKZ5+QEBTLfZHFSC
	dQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=HklHhmDM59MkOjdXsKTPylfecA3c+4SUX5wYNfledhw=;
	b=O3Fqwv/RP1F0awMQc6oRntyKyuxUEUsrfNA2aAuDb6QdYzlvgBWmuJRUUMHQPUpEp4
	8M9ayIL1iBFVUTLK37hyTTjVUR8h1oIzlKV6xuMClFZ7IW8JLFEtDl8r3EAzP2NDrbf0
	sNSvtMFIYZPH0vYoRT24t2PetfWOvAQRQNMro4L4wJuFKzXrsl4O9Pp/OWe853DMf1rQ
	ibkgOfqLJbJ2bJuckozZL3qsGkIDE2F9xROY/3lQzsCXzHbRPbwuT22x3kEnfzVL1eT/
	b9AFbjIgH/aT3jImVMOep1lyKULnwMG4CVAvYGxd1w8a+UDK/CdoU0E+iDeL0U21G8jt
	Tt0w==
X-Gm-Message-State: APjAAAX/krRKRA84KodWOkwUgTyAdnWVXSzkcUyKHwDKhMOlgfsD+HiT
	bI56zeVlbq3GanpCoodhQrwLcA==
X-Google-Smtp-Source: APXvYqwQ23CZgEQ4o5gyPpVhLXbJs7lYKYJPYyEqFKA1tWyhPwaaBOpgPbLSb/2RmOcgLdJUTzwmrQ==
X-Received: by 2002:a17:902:9043:: with SMTP id
	w3mr30034748plz.101.1553595923810; 
	Tue, 26 Mar 2019 03:25:23 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1270-b809-36ef-31ed-7980.dynamic-ip6.hinet.net.
	[2001:b011:7001:1270:b809:36ef:31ed:7980])
	by smtp.gmail.com with ESMTPSA id
	w123sm28017809pfw.72.2019.03.26.03.25.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Mar 2019 03:25:23 -0700 (PDT)
Date: Tue, 26 Mar 2019 03:25:15 -0700
Message-Id: <20190326102515.7071-2-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190326102515.7071-1-palmer@sifive.com>
References: <20190326102515.7071-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Kito Cheng <kito.cheng@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::631
Subject: [Qemu-riscv] [PULL] target/riscv: Fix wrong expanding for c.fswsp
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
X-List-Received-Date: Tue, 26 Mar 2019 10:25:29 -0000

From: Kito Cheng <kito.cheng@gmail.com>

base register is no rs1 not rs2 for fsw.

Signed-off-by: Kito Cheng <kito.cheng@gmail.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn_trans/trans_rvc.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
index 5819f53f900e..ebcd977b2f94 100644
--- a/target/riscv/insn_trans/trans_rvc.inc.c
+++ b/target/riscv/insn_trans/trans_rvc.inc.c
@@ -337,7 +337,7 @@ static bool trans_c_fswsp_sdsp(DisasContext *ctx, arg_c_fswsp_sdsp *a)
 {
 #ifdef TARGET_RISCV32
     /* C.FSWSP */
-    arg_fsw a_fsw = { .rs1 = a->rs2, .rs2 = 2, .imm = a->uimm_fswsp };
+    arg_fsw a_fsw = { .rs1 = 2, .rs2 = a->rs2, .imm = a->uimm_fswsp };
     return trans_fsw(ctx, &a_fsw);
 #else
     /* C.SDSP */
-- 
2.19.2


