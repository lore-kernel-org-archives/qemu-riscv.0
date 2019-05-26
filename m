Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxH-0003Ua-DG
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxD-0003Hg-Ma
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgL-0006T0-HP
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:38 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:38488)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhgL-0006SP-CN
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:37 -0400
Received: by mail-pl1-f179.google.com with SMTP id f97so5646502plb.5
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=J7lhhgtf0sOTXH1yJE/Uqjkv+hDa7WrYfOdgGU5K6D4=;
	b=Zj67okfO/fSeufhDRzp/uWc2OcTSeB36YuYUFVCXBLQpPY1Y3R7AwtLGwg+1qIDyXc
	8cpubUhumSQqpy2zUcjzpun++71cF1E0/CE4R0DyXBhHvlXDRzsqeIV8vutyYSi03Kbj
	MklmY0KGY7+d/ENFUjov5aOhvJ7bxiwIi6mT1Cmr1Jm2VK34vqXdJAHdxx6L3zrXB1TK
	Qmz2QL2PcUc8JIGQYC5GfvyEJv9yo0XIbQMjqkjbSQDl3fwmvgk10BUvq5OFbwiYDkk+
	NlGATkNtIUZWGRhM9ZzQCeIWZF9qY2heHKeAUW1XiLh2omUEX2KJCKoMGVUmnHczcsTd
	mrXw==
X-Gm-Message-State: APjAAAWs5P+rvrxK95zvl6m83gxEcJdfP91S3Zb24FC0e8s+g/lbm54U
	Qufa52zh27fiM+6Gbz3FAD6mNyC+zA0=
X-Google-Smtp-Source: APXvYqx3aSfewtpSAEOx4sclNnBttL3hHIQSuLNFe9dadntDNBnK9LAGKDhPeKWUHYLb5vtuO1WPaQ==
X-Received: by 2002:a17:902:2d:: with SMTP id
	42mr118552335pla.34.1558833035950; 
	Sat, 25 May 2019 18:10:35 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	g22sm6826305pfo.28.2019.05.25.18.10.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:35 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:44 -0700
Message-Id: <20190526010948.3923-26-palmer@sifive.com>
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
X-Received-From: 209.85.214.179
Subject: [Qemu-riscv] [PULL 25/29] target/riscv: Add the HSTATUS register
 masks
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
X-List-Received-Date: Sun, 26 May 2019 01:28:04 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviwed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_bits.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 52c21699774f..a179137bc1f2 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -382,6 +382,24 @@
 #define SSTATUS_SD SSTATUS64_SD
 #endif
 
+/* hstatus CSR bits */
+#define HSTATUS_SPRV         0x00000001
+#define HSTATUS_STL          0x00000040
+#define HSTATUS_SPV          0x00000080
+#define HSTATUS_SP2P         0x00000100
+#define HSTATUS_SP2V         0x00000200
+#define HSTATUS_VTVM         0x00100000
+#define HSTATUS_VTSR         0x00400000
+
+#define HSTATUS32_WPRI       0xFF8FF87E
+#define HSTATUS64_WPRI       0xFFFFFFFFFF8FF87EULL
+
+#if defined(TARGET_RISCV32)
+#define HSTATUS_WPRI HSTATUS32_WPRI
+#elif defined(TARGET_RISCV64)
+#define HSTATUS_WPRI HSTATUS64_WPRI
+#endif
+
 /* Privilege modes */
 #define PRV_U 0
 #define PRV_S 1
-- 
2.21.0


