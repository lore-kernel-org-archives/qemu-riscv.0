Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAnN0-0006oJ-VY
	for mharc-qemu-riscv@gnu.org; Sun, 31 Mar 2019 23:12:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnMz-0006mm-CH
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnMx-0002qg-La
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:21 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41040)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hAnMv-0002ns-H4
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:19 -0400
Received: by mail-pl1-x642.google.com with SMTP id d1so2045320plj.8
	for <qemu-riscv@nongnu.org>; Sun, 31 Mar 2019 20:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ldf8BOBEYaEPwE6SNRadbgy/cKtsZyA6qEQMWTLJRXo=;
	b=C42HRDUuoHU68BYcw1+t98DCrTpIIf4ZfPz80bb6hCWnjllckksce+rNvKiEYBZN5m
	2O453wURXsQMh6z+ryrHVf/aatu6AWBcX3elTM+zolosMkqZVEapg4+76iJILiN6/vrI
	Z92foNiPo0YfvhoFnNZiqfG6wMXWFTlQiJZfGz18bjxPOev5Pgo/GZR98IKnjpQRkaGI
	SQat+TJGecKfXhgdHm51NPkpfiYK9K79PDhZpngu7bRdun5WsusYUyY9O7qe9wm9NzTQ
	BOgll4d8iEoag1GNlCDIik+KKLJ5xw5JSA6KGwM+Zcy+OET9mszf9u20ZI0IULBWEgTd
	qXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ldf8BOBEYaEPwE6SNRadbgy/cKtsZyA6qEQMWTLJRXo=;
	b=O5iWzxEIc+j/tCbxmzNUwA6BYdGQL6HqllU9kK+AKXu4T0GTmV6LPHbDeaDuCaTGUj
	pSs3OD2F//ljpuofvryFEDtFGQckkiocvsyv+5zrB/shFY07GM4POYm+A2AAtuLju0L1
	q+Pp6ruUNbZYM6FhKpLw2C/1AUtXAATuREfPG8FUa3NenMSny8b56NHPFmsDmQr22WHt
	CnvvvnpD898NBJCuq0DArs49NJKP2hImf0eRbSpHgYbl8DHgM3MOP/ExzOfDnS4R7Bf+
	BPzA0OTWKWTEBSTCYtOlLORmD4RPenE70v/cJ+2+MtkvW9ure7BW538ZIcO2jwwZ4Zno
	3Cew==
X-Gm-Message-State: APjAAAV6HbQrsMd3qYzNaks+wkjNPP2R8chPceckSCEaRBQGTmabrIY9
	QAp6J8EFgpI/MDS9wezagH43sfgPVtvvkA==
X-Google-Smtp-Source: APXvYqytktj8BJrz61ioYBIKw8vv+dLRwGyqH7rphG09oGXZp8iMc4wHhXiKd1rVWLmj69tunIlYIw==
X-Received: by 2002:a17:902:b948:: with SMTP id
	h8mr32760111pls.39.1554088331042; 
	Sun, 31 Mar 2019 20:12:11 -0700 (PDT)
Received: from cloudburst.imgcgcw.net ([147.50.13.10])
	by smtp.gmail.com with ESMTPSA id
	c1sm11843954pfd.114.2019.03.31.20.12.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 20:12:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com,
	palmer@sifive.com, qemu-riscv@nongnu.org
Date: Mon,  1 Apr 2019 10:11:48 +0700
Message-Id: <20190401031155.21293-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190401031155.21293-1-richard.henderson@linaro.org>
References: <20190401031155.21293-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-riscv] [PATCH for-4.1 1/8] target/riscv: Name the argument
 sets for all of insn32 formats
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
X-List-Received-Date: Mon, 01 Apr 2019 03:12:22 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6f3ab7aa52..77f794ed70 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -34,9 +34,13 @@
 %imm_u    12:s20                 !function=ex_shift_12
 
 # Argument sets:
+&empty
 &b    imm rs2 rs1
 &i    imm rs1 rd
+&j    imm rd
 &r    rd rs1 rs2
+&s    imm rs1 rs2
+&u    imm rd
 &shift     shamt rs1 rd
 &atomic    aq rl rs2 rs1 rd
 
@@ -44,9 +48,9 @@
 @r       .......   ..... ..... ... ..... ....... &r                %rs2 %rs1 %rd
 @i       ............    ..... ... ..... ....... &i      imm=%imm_i     %rs1 %rd
 @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
-@s       .......   ..... ..... ... ..... .......         imm=%imm_s %rs2 %rs1
-@u       ....................      ..... .......         imm=%imm_u          %rd
-@j       ....................      ..... .......         imm=%imm_j          %rd
+@s       .......   ..... ..... ... ..... ....... &s      imm=%imm_s %rs2 %rs1
+@u       ....................      ..... ....... &u      imm=%imm_u          %rd
+@j       ....................      ..... ....... &j      imm=%imm_j          %rd
 
 @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
-- 
2.17.1


