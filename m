Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPcKy-0006VK-Jn
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 18:55:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPcKw-0006Tt-Ok
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 18:55:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPcKs-00058V-Uf
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 18:55:14 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39679)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPcKr-000534-Ue
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 18:55:10 -0500
Received: by mail-pl1-x644.google.com with SMTP id 101so1381457pld.6
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 15:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=4iSRvPM8dKMqrH4YIML7OSJukHcyyPVpd3K+oQbT77I=;
	b=RgZGZWrPgqFNf3jXM1wyjVkSu+4vivkjMbSURjkh8izYiCYkxLQVxsgfO84YO4tpUx
	YaEkCrV/jpoWAqlmNbKarw8IocbIOfW23nPZp9SDeenc2qOLav2mjpf87rQS3uvlottV
	qbLsvNPnvGsJsulsH6FM2olWHGXOJbm31UQJA4H8itdgesbIa17VPhmxfa5T1T1Qi3Nd
	/3XHmoELP3qOV2sU8mhmtL2fhmIzv7up/rhDiJi2r1bf2GYmC7x3EaqwOVOMqZItsJhX
	sQ2Xgpy+SkpB741TiAeRI+CxkFz0TaXZtmKEtOuBGHkZXP4Z38O5kaFz+qmjc6HhptaL
	Wcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=4iSRvPM8dKMqrH4YIML7OSJukHcyyPVpd3K+oQbT77I=;
	b=g9YZjo7l1Z40jfF+NuMDDK1Fat7j4/x+V1Qj2xgNVJZYMgItV/knfqZc28r4zycH+/
	8plP4TcKHnVuAznqKyOQripglo4R9R7JMB8vzZ1H7B0qPcLk/lsHA0ux05Karnu6kqey
	nO2oYYdqFuDYIQBcOHtlYIrBnsUrYBOETDhehxk3ZsvC3cZ4RsDmTNUtKpimdZmevs3A
	335DGhjUVY/wECQVmwtcDCo24Zkq9PKTqT27MlB8qzKxftqcn3vACd9fGZwuCRGrl61o
	mW/RL1k0WuiWr8OFBMkZeFGInBOwt+U4PW+7EjomveMexsQbZgVXdFXZCZ6HkABYXRgv
	1dLg==
X-Gm-Message-State: AGRZ1gL0NIIr6U+Pgs+buLUw7T2mRLv9P+f1ocsQxdaNMWXe8N9zyKzf
	yfW9DKIv+e0fRvWerC4LWPOpaw==
X-Google-Smtp-Source: AFSGD/X5Am6sc2j72fNNWofsDLTIxczobayF34o5L37IMHntzTwC0S0y0WBQXWuPSHdKVDhvjIJY5A==
X-Received: by 2002:a63:c051:: with SMTP id z17mr7725141pgi.20.1542844501582; 
	Wed, 21 Nov 2018 15:55:01 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	134sm59203127pgb.78.2018.11.21.15.55.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 15:55:00 -0800 (PST)
Date: Wed, 21 Nov 2018 15:46:51 -0800
Message-Id: <20181121234651.24596-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181121234651.24596-1-palmer@sifive.com>
References: <20181121234651.24596-1-palmer@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-riscv] [PATCH for-3.1 2/2] MAINTAINERS: Mark RISC-V as
 Supported
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

There's three of us that are paid to work on this.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e89adc81d5d5..d5ec5e74f328 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -250,7 +250,7 @@ M: Alistair Francis <Alistair.Francis@wdc.com>
 M: Sagar Karandikar <sagark@eecs.berkeley.edu>
 M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
 L: qemu-riscv@nongnu.org
-S: Maintained
+S: Supported
 F: target/riscv/
 F: hw/riscv/
 F: include/hw/riscv/
-- 
2.18.1


