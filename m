Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6EUC-0007nr-0D
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:08:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EU9-0006q2-UT
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:08:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGR-0004wn-2O
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:43 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33563)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGQ-0004ta-Sv
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:43 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i19so13635516pfd.0
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=QcxvdakiQj5lK5VVWsfIac1Zx0Ous2/elL9w3BueZa0=;
	b=d0Anop4FxbUP+9kmd8shctN4Rbqj6xzlZlRgCpus4FKEWzilrh+549dwGT/WK78JSg
	7NeB2NB9n3Uu55ZK7yRRPpkifkXQRPNzGeC71XGDJ1M8MLIIdndsahr8/IKwjNA/vo14
	cdYj6KA8hvrGEnB7v6uJHnk3ECDwF5MVbNy73etdUMikjVtptXXjMbFeCGcgvU5TcXEC
	ASkMKCDaaNAPCZxpnxYST0mlAW8ZY4DsPKT9hJRTi0A7ARRAkuxwZ7QBj1LEoiN0hx32
	uIam6XkBnNs+e43f5D2KDAJfIneVt8PNlnYxJTVbhUSTfvl450W4WJkpdlcXQJQwYtgx
	kruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=QcxvdakiQj5lK5VVWsfIac1Zx0Ous2/elL9w3BueZa0=;
	b=FvOKi6vFaPicXkkm2OSleuR87dL3gc3+7IThaPoEwLjOT8fa6zduazgltDeIdmmmxC
	rf4sjN5r+eTmelesyvFk45L/wRDkf/oKVQJe8MkWJ4zJFJD2nNubtMi+w3akcTxQ2ez7
	NbSufeePPVHM9D9n2aGsCdellYHGrDTNOZwL9/92jqW+KeJQ+em4j5mlwL1tjDzx4Can
	iEkFtyi7LQQgdcVv7lXiHhkmChpSlzK+yIkMr2isaOv964wOT8jG5Q0INEDPeo1e+F43
	O4uRK9hR9raXoG7tkdgMMCo0YuTSP+1bcjYU1OeYsdPs04yDKBsQJvwiuKDs8Y/sA/Zz
	97fQ==
X-Gm-Message-State: APjAAAUjVrGMBhMOtmKwfx0sgcOyKCePltyzWo+u0ycP6ExDm6PCNUOk
	hmTJMh1ADjY8yqizTcTu+K1C8kdtMW2yBkcO
X-Google-Smtp-Source: APXvYqzMtCLAds+Hos6ncWcg5gIFuEgjDCGGsbOgpHyQIIBU8pQowFbygkXx3/zBlvmDCxiJPgLqiw==
X-Received: by 2002:a63:704c:: with SMTP id a12mr1688249pgn.394.1553000081673; 
	Tue, 19 Mar 2019 05:54:41 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	h3sm17330932pgv.38.2019.03.19.05.54.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:40 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:54 -0700
Message-Id: <20190319124803.13826-11-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Alistair Francis <alistair.francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42a
Subject: [Qemu-riscv] [PULL 10/19] elf: Add RISC-V PSABI ELF header defines
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
X-List-Received-Date: Tue, 19 Mar 2019 13:08:54 -0000

From: Michael Clark <mjc@sifive.com>

Refer to the RISC-V PSABI specification for details:

- https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md

Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 include/elf.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index b35347eee767..ea7708a4ea9a 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1393,6 +1393,16 @@ typedef struct {
 #define R_RISCV_SET16         55
 #define R_RISCV_SET32         56
 
+/* RISC-V ELF Flags.  */
+#define EF_RISCV_RVC              0x0001
+#define EF_RISCV_FLOAT_ABI        0x0006
+#define EF_RISCV_FLOAT_ABI_SOFT   0x0000
+#define EF_RISCV_FLOAT_ABI_SINGLE 0x0002
+#define EF_RISCV_FLOAT_ABI_DOUBLE 0x0004
+#define EF_RISCV_FLOAT_ABI_QUAD   0x0006
+#define EF_RISCV_RVE              0x0008
+#define EF_RISCV_TSO              0x0010
+
 typedef struct elf32_rel {
   Elf32_Addr	r_offset;
   Elf32_Word	r_info;
-- 
2.19.2


