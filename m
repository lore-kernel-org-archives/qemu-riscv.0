Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxS-0003j7-09
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxF-0003Hg-RL
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgI-0006Qn-Fe
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:35 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35156)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhgI-0006QS-Ar
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:34 -0400
Received: by mail-pg1-f194.google.com with SMTP id t1so7095809pgc.2
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=ePYfUi0rWjHzSUZxVonvvQDM/bFMIG9WKPecvkNdal0=;
	b=ckozYqDJbLadgYZDe8WnvYknqt8+l2CB4FfgaK8teAXMXnziGwe7KYzjuoTEOiqMcp
	h1q2EWfHYVnKN2WlAsYlG0UZRDLp/OaMc28fc3pT9DKKj4LggZifu7+LZhV5gKSUrjGc
	LySrexgUOd08vej72yuokj1n3QA2vm4uaPOCzLrigsW6uzPxoSTaMz5tBDfSzr+Pkimq
	DYIisglOoIcMQAtekQkS9vRDrILDgsXFpXsOfMuOBuo2J0s3AQxuiwEdU5oKdGFReq30
	1iCUJqS9U0fOBAiyqtQNtkIjARq/FrtDU+hFqPti+OZgtbdQ+sOVjWsTmA8txAt5pVmH
	+hwA==
X-Gm-Message-State: APjAAAVEGExY8fGJRMDE5ITDjrWrIW24zBVyGYeJ5+ixV48pnaXtsoCF
	7S2u/x1+TF/JY3x9QaMrAGOAnrix2TY=
X-Google-Smtp-Source: APXvYqyqbPYdR0ZcoUIlnyxv9Pik8Q6hTB82K++7HBNqvvUPdBQWvVEuYxz96XVCA47ZUCz/qziRzQ==
X-Received: by 2002:a62:304:: with SMTP id 4mr107211110pfd.186.1558833032608; 
	Sat, 25 May 2019 18:10:32 -0700 (PDT)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id 25sm6410198pfp.76.2019.05.25.18.10.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:32 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:41 -0700
Message-Id: <20190526010948.3923-23-palmer@sifive.com>
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
Subject: [Qemu-riscv] [PULL 22/29] target/riscv: Add the MPV and MTL mstatus
 bits
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
X-List-Received-Date: Sun, 26 May 2019 01:28:06 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_bits.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 945aa8dbb851..fe7164754b19 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -316,14 +316,11 @@
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
-#define MSTATUS_HIE         0x00000004
 #define MSTATUS_MIE         0x00000008
 #define MSTATUS_UPIE        0x00000010
 #define MSTATUS_SPIE        0x00000020
-#define MSTATUS_HPIE        0x00000040
 #define MSTATUS_MPIE        0x00000080
 #define MSTATUS_SPP         0x00000100
-#define MSTATUS_HPP         0x00000600
 #define MSTATUS_MPP         0x00001800
 #define MSTATUS_FS          0x00006000
 #define MSTATUS_XS          0x00018000
@@ -335,6 +332,8 @@
 #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
 #define MSTATUS_TW          0x20000000 /* since: priv-1.10 */
 #define MSTATUS_TSR         0x40000000 /* since: priv-1.10 */
+#define MSTATUS_MTL         0x4000000000ULL
+#define MSTATUS_MPV         0x8000000000ULL
 
 #define MSTATUS64_UXL       0x0000000300000000ULL
 #define MSTATUS64_SXL       0x0000000C00000000ULL
-- 
2.21.0


