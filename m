Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxY-0003pH-O0
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxL-0003Yx-Bl
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhg9-0006CC-Qv
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:26 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38108)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhg7-0005x7-Qz
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:25 -0400
Received: by mail-pg1-f194.google.com with SMTP id v11so7092121pgl.5
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=4bBhQ9kganCVq1dJ403sszl/Wog9yBvWM1+fvLLlsdk=;
	b=E30S5/+cxfCBh174r+B39eyM1BMKW7yDH+a7FpUswNs8iUtxdQChlJTj2ifxRX9L6C
	ywRD5eS5rD7LyGv/v4FfvqveHeTH7/HBgV4i3xkKM4uwj3xDPYxUwlzc56dkjMMU3kBt
	kcXdixEjndCuWDujkKwj4UvVxQf6SY4fxR1PriPhHtV/5GDnUJAkYwRHcE/GCcwfff52
	81vpiUiTLlth0n76ItBc/0eddyZMDT+lmofrF1kanPAgzgOa4il1J/xFjrQJIx/vppyQ
	LDIcTfuhQiOXWNzCcEwCano2v+iKzbAMBoxubndZkh3l/oECjtGGO2sguM5Vn0t1v/Na
	sCXQ==
X-Gm-Message-State: APjAAAXx0Fa7Zfi9zoO2bXCVPk1vFbtAc9A2/DHCQX64h4j++32Ion7e
	TOAWTzHCTdS0kR8UlooVjAgmZhv2tpM=
X-Google-Smtp-Source: APXvYqw3hrIqaAxl/xFRvZtZK5blDbpQajvTtKP42Ce8xxtOnknCcqzuOZ2CPvAg04Nt7X0cH836mw==
X-Received: by 2002:a65:6255:: with SMTP id
	q21mr105163733pgv.211.1558833019583; 
	Sat, 25 May 2019 18:10:19 -0700 (PDT)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id t10sm7999147pfe.2.2019.05.25.18.10.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:18 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:32 -0700
Message-Id: <20190526010948.3923-14-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.194
Subject: [Qemu-riscv] [PULL 13/29] linux-user/riscv: Add the CPU type as a
 comment
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
X-List-Received-Date: Sun, 26 May 2019 01:28:12 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 linux-user/riscv/target_elf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/riscv/target_elf.h b/linux-user/riscv/target_elf.h
index a6716a6aac23..9dd65652ee45 100644
--- a/linux-user/riscv/target_elf.h
+++ b/linux-user/riscv/target_elf.h
@@ -9,6 +9,7 @@
 #define RISCV_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
+    /* TYPE_RISCV_CPU_ANY */
     return "any";
 }
 #endif
-- 
2.21.0


