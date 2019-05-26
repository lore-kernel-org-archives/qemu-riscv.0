Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxL-0003aq-Nb
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxI-0003S6-Kb
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgB-0006Gb-L4
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:28 -0400
Received: from mail-pg1-f172.google.com ([209.85.215.172]:40298)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhgB-0006Fy-F6
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:27 -0400
Received: by mail-pg1-f172.google.com with SMTP id d30so7081005pgm.7
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=DrfuOvljxEFhT82DbF62j50YM7gx233MXTyQHjUvuWU=;
	b=bYcKpfdz4cCMrAvu902vYdXiOegX7F2lxhmDh67P3Vt3ac8lwg0/S63mIotfUy9zJ0
	H1EesSEZmAVvQuQEcPbIuPbrHo8G+izdZ5dB330sIgTR6UPgrPdWgnGOSMjwQsj8XA7M
	5T+RhE/5Qn8i0soFEgI2czaWEFC9K/aI/Vm/j5Go0VpUrjf4cARQJpMGdiahC6DrCaig
	IBjc0UdzdsWgIocKI6GXU43s3jKDYTSP0ps+TMjuoHL106cSZ6AmL2ysUEjknNfbKwd8
	5HQHBpnw76rIF8G7ZED5m575RldAihAO8OcO3f+UD0/c1z8155K3fRp2lS5vmuO9Gedh
	fPeg==
X-Gm-Message-State: APjAAAVSQLisCLrX4oldUvrTN3pOuhJr7Kbx6z0GbrF9vTbuzHSSA2/9
	0IxHeoaQSz/vCyVWzu2xUlbKvAfNN1E=
X-Google-Smtp-Source: APXvYqzN1jgLu30vHNwmopJC3v+QatjUhO/sKIwGI8cYsP3STg7KukDdBX/2IegoNab4ZQs811a/xw==
X-Received: by 2002:a65:6295:: with SMTP id f21mr14955958pgv.416.1558833025924;
	Sat, 25 May 2019 18:10:25 -0700 (PDT)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id y7sm8353520pge.89.2019.05.25.18.10.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:24 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:36 -0700
Message-Id: <20190526010948.3923-18-palmer@sifive.com>
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
X-Received-From: 209.85.215.172
Subject: [Qemu-riscv] [PULL 17/29] target/riscv: Deprecate the generic no
 MMU CPUs
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
X-List-Received-Date: Sun, 26 May 2019 01:28:09 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

These can now be specified via the command line so we no longer need
these.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 qemu-deprecated.texi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index fbdde3d1b4af..9dca81f461e3 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -147,6 +147,12 @@ four CPUs are: ``rv32gcsu-v1.9.1``, ``rv32gcsu-v1.10.0``, ``rv64gcsu-v1.9.1`` an
 ``rv64gcsu-v1.10.0``. Instead the version can be specified via the CPU ``priv_spec``
 option when using the ``rv32`` or ``rv64`` CPUs.
 
+@subsection RISC-V ISA CPUs (since 4.1)
+
+The RISC-V no MMU cpus have been depcreated. The two CPUs: ``rv32imacu-nommu`` and
+``rv64imacu-nommu`` should no longer be used. Instead the MMU status can be specified
+via the CPU ``mmu`` option when using the ``rv32`` or ``rv64`` CPUs.
+
 @section System emulator devices
 
 @subsection bluetooth (since 3.1)
-- 
2.21.0


