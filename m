Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHm-0003Lz-TQ
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32975)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHU-00037k-JJ
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHT-0008UQ-6Y
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:48 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39135)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHQ-0006zr-28
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:44 -0400
Received: by mail-pl1-f194.google.com with SMTP id b7so1484676pls.6
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=WFOcqA5bhC2gv8hijUonjP/cUpFUXz32Bb/6MGXuT1U=;
 b=rQrGgeuqahp+b/Dj8xVaSWm7Qw0siuAf5yjqjcXY1KU7NSSv+tdDcoVRdzFhMQ7Iqe
 Evykwotj+wNqQY0/MR7p9rJ4RxJ5/Jq9r0tzSEnua1vKuDpUP00q5RGsRA7enyU9MQQq
 J3Qa8anEBRwsXNKuVNIXMFGyh4AfyeXrhto/jHln+LTXcqoPZM04fydoSW2Y+VwsHOpc
 kZu0S9WPx4+ovLHrQ9BCMr+43LFEp1Ywn7RvhUGNYMiok1H4ks8AUp3RAX8ONrtomz8v
 H7fwAKLh5UuNmx8FBlORahmnPDHU2HMZ+BuyzNfzXzTTULgcnBZW73koU1jyDTfIc7Gf
 mQyw==
X-Gm-Message-State: APjAAAWm+wzSQjrTZ9VQv6BZ/xc6IjuMRuBM2xLyIIjc14U+BA6FJ5Fe
 IBcDixZltIw4W02u8nrsK8SmR9spA/K1WA==
X-Google-Smtp-Source: APXvYqxG+ii9erYoAAqHdSYPSfz4oS3lxy4uCURenbKkx2GKib/HRzewyohSuqz9t37LPiWGQUwmlw==
X-Received: by 2002:a17:902:f204:: with SMTP id
 gn4mr5376927plb.3.1561649046472; 
 Thu, 27 Jun 2019 08:24:06 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id p6sm2648446pgs.77.2019.06.27.08.24.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:24:06 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:55 -0700
Message-Id: <20190627152011.18686-19-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.194
Subject: [Qemu-riscv] [PULL 18/34] target/riscv: Require either I or E base
 extension
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
X-List-Received-Date: Thu, 27 Jun 2019 15:25:50 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ba1325f43533..1689ffecf85f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -373,6 +373,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                        return;
        }
 
+        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+            error_setg(errp,
+                       "Either I or E extension must be set");
+                       return;
+       }
+
        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
                                cpu->cfg.ext_a & cpu->cfg.ext_f &
                                cpu->cfg.ext_d)) {
-- 
2.21.0


