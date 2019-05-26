Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxQ-0003gd-ID
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxH-0003S6-KQ
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgE-0006MB-7s
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:31 -0400
Received: from mail-pl1-f181.google.com ([209.85.214.181]:34753)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhgE-0006Lo-3C
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:30 -0400
Received: by mail-pl1-f181.google.com with SMTP id w7so5638055plz.1
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=BTaUXZm+zZcGuocJwfwd9IYolW9o//6NewFr+61BWes=;
	b=niTOdCWd2e0UmRyEhIF3rP9ovqY9+Li+wV0TnWK2AOC4JuliUekWJFsw92wI0PBU1h
	hcfJsPOuPYjno9z74wxbjvH5gdYNZQ+VP+kw3ctbxfJK6gvJ03iW2ZqONxS6pVXdpHMR
	d6wkJNVZ0LOrPRK0Z/rnL9bQy5W/GJdyPLNSHruZFg7BCL17vMvMp8/OkcwCFQZRRlqs
	a818D1lXp9NvmpeYRrLnTl+hTT1mJenFeKWWJr+yvDYXAY+sAJHvi3O9iN+kuj51YXUB
	8/dj/dSn9oySN/njZ0/OAnC/aEzbWFDZuLoAU1Vr9CuFuiePBlSaIdaooOmPNU3XphxB
	6v1w==
X-Gm-Message-State: APjAAAX6AnO+4jS3gV+oPEq+FGhO4/eLxmrDjaSvQ8dCvfDm5WqrKm2a
	zim7zsh8Qdl8wiwPqQqRt39Zjk5tUng=
X-Google-Smtp-Source: APXvYqzNAIeNn1+g/9+01HJ4cuHxiP4CXSVE8S861SvPlpp8t+oyUaQPeY2NU5QIdeL6VyQOoAM3kQ==
X-Received: by 2002:a17:902:2e81:: with SMTP id
	r1mr101419159plb.0.1558833028528; 
	Sat, 25 May 2019 18:10:28 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	q12sm5694910pjp.17.2019.05.25.18.10.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:27 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:38 -0700
Message-Id: <20190526010948.3923-20-palmer@sifive.com>
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
X-Received-From: 209.85.214.181
Subject: [Qemu-riscv] [PULL 19/29] target/riscv: Mark privilege level 2 as
 reserved
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
X-List-Received-Date: Sun, 26 May 2019 01:28:08 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_bits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7180fccf54f9..945aa8dbb851 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -383,7 +383,7 @@
 /* Privilege modes */
 #define PRV_U 0
 #define PRV_S 1
-#define PRV_H 2
+#define PRV_H 2 /* Reserved */
 #define PRV_M 3
 
 /* RV32 satp CSR field masks */
-- 
2.21.0


