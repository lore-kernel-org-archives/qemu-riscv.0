Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6DyZ-0002su-2r
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 08:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1j6DyV-0002p5-Vt
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 08:40:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1j6DyU-0004XI-8X
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 08:40:43 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:33623)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1j6DyP-0004TG-Do; Mon, 24 Feb 2020 08:40:37 -0500
Received: by mail-pj1-x1042.google.com with SMTP id m7so4071350pjs.0;
 Mon, 24 Feb 2020 05:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=0/dsNfBErGQgUb5GnJfxH0GJkQTyrJ4NoW7A4yewg6g=;
 b=ckWq3KdDKS2yx5758nFHTBj5kRJjfm0RIHTxLyNZgtZ7br2uq7KE6fqMe78zMvPDJF
 kJIf7KZbqp9W7ntE0PxgQ6ELC2UyxnXaa8c/y2Jln/7RDabNkUfY1Ejq+iZo7ltoUifE
 DUiBtl07Uy/M54xhQRPGzWTuV/1r15vEujk6cjLLwel4jAxk/DnDBP4Jf8DxRaJvv2Sh
 IcZNnmBW6DneQLOGOlEgKR1b9yOnPD8VUbnxoTMJwBSKUOqea5zRmdH0p8K5Ca5iTRkm
 xmj9y4EhUoGRX5NxszrAkn0PwAFnG6P5rl5DS6L1gcffqKtr7RW+pbFO0h2BLaD+Ux9d
 kfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=0/dsNfBErGQgUb5GnJfxH0GJkQTyrJ4NoW7A4yewg6g=;
 b=eiQEwmpo2fbpTbkcac05v+fxOIYjruG3zS3UtXJghXLMLrul60qKSj0Z8K8XjVuESx
 7m0ptWfeb751YNOX3d+9mG70I3xIXD5vl2AuBD7j4Pt83ptJsoIpNhiDhgxiNl25bo0b
 gxMHxkNszBi0b7644qUbKf+E/1K64ml8S2EFXaf0y5aB7ZhztLV5C0jTNbl7l+yeTnQW
 wo/vXJJ0ouOLOoq//E0teZUiAmRHj1WxlanG+lKARVTa3ys39xqZQFMhNJ93HsS0w/Sv
 vz1TVfDyoBxIuELe4HN6L2dke0Bf0h4q4GSv5elbQbGXX3HYoyCPf3tDB/jRi4Nig8aN
 r7Ng==
X-Gm-Message-State: APjAAAWNi5JRpLAeFKqgkpAeTxgGAZUMSUfOjmOiIQHMRzo3sgTl2kn6
 cwGZFg7ydvxLOWLpN0Cn8Uo=
X-Google-Smtp-Source: APXvYqxEz9iZy1CGRvZjO0zjmzU93w4crU8QeJlQEarnJqlV8qVCZQyA4z15ykynvnZ2aV9ye1T9mg==
X-Received: by 2002:a17:902:b714:: with SMTP id
 d20mr48438255pls.272.1582551636616; 
 Mon, 24 Feb 2020 05:40:36 -0800 (PST)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id p4sm12912258pgh.14.2020.02.24.05.40.35
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 24 Feb 2020 05:40:36 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 3/4] riscv: sifive_u: Update BIOS_FILENAME for 32-bit
Date: Mon, 24 Feb 2020 05:39:43 -0800
Message-Id: <1582551584-20093-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1582551584-20093-1-git-send-email-bmeng.cn@gmail.com>
References: <1582551584-20093-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Feb 2020 13:40:45 -0000

Update BIOS_FILENAME to consider 32-bit bios image file name.

Tested booting Linux v5.5 32-bit image (built from rv32_defconfig
plus CONFIG_SOC_SIFIVE) with the default 32-bit bios image.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v2: None

 hw/riscv/sifive_u.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ca561d3..371133e 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -57,7 +57,11 @@
 
 #include <libfdt.h>
 
-#define BIOS_FILENAME "opensbi-riscv64-sifive_u-fw_jump.bin"
+#if defined(TARGET_RISCV32)
+# define BIOS_FILENAME "opensbi-riscv32-sifive_u-fw_jump.bin"
+#else
+# define BIOS_FILENAME "opensbi-riscv64-sifive_u-fw_jump.bin"
+#endif
 
 static const struct MemmapEntry {
     hwaddr base;
-- 
2.7.4


