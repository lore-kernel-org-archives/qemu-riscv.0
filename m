Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgul8-0000M9-H3
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54793)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hguko-0008NE-AZ
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgukh-0000Rx-Hy
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:38 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36680)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hguke-0000Nd-Dh
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:34 -0400
Received: by mail-pg1-f193.google.com with SMTP id c13so2890749pgg.3
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=WFOcqA5bhC2gv8hijUonjP/cUpFUXz32Bb/6MGXuT1U=;
 b=i5N5ZKgizJtdgWIEWyq/YAKGMxueVS6z21gFW3TpbR9EKbJq7viqwUM3YW3v3DAGkU
 gsUie9gRtlYIdUhPzqmhAEiQeZJxu7IwRNKuzkUekk3noVef/oxqg6nDJ88xbEb8aUQH
 9CVb01x+typkJFYS1DekG33N1gRQ/ixRnl20qTP03Ru5AG9EerBd9ElFoqw8n671O4td
 UeDjFg2NLa6d1GrYiNS9ZQ0xO+S6nclF72GK+6b3BPvGdAuSVtwnCRUc275n7gvP3h5u
 X1a1Pe9WrJobJmBCu94z45lpMXDFzEme/G+hpXpwREiP5W/JBlU4/moPkD6VJWTDmRvL
 7Z6g==
X-Gm-Message-State: APjAAAXeuK0FKQsbmAEwZmVynNZc9u+H2PW5i2bt7+4LrLmskE8ZEFTt
 XxwfarwQYenI7I5De9rpq/YHOw==
X-Google-Smtp-Source: APXvYqxZXcgQvYEmTU1tDWqSLAtLWxpU3JuDD0WS3iMyaSz63FTWLhL2MjZCmoruXx8hy7bbNJTCZQ==
X-Received: by 2002:a63:1316:: with SMTP id i22mr10815249pgl.274.1561743210410; 
 Fri, 28 Jun 2019 10:33:30 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id y10sm3105961pfm.66.2019.06.28.10.33.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:29 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:11 -0700
Message-Id: <20190628173227.31925-19-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:44 -0000

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


