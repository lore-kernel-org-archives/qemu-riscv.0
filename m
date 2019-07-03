Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiaq7-0006N6-KJ
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51539)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapy-0006De-TE
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapn-0007Tw-C9
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:52 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39113)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapk-0007GS-ML
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:44 -0400
Received: by mail-lf1-f68.google.com with SMTP id p24so1155133lfo.6
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=WFOcqA5bhC2gv8hijUonjP/cUpFUXz32Bb/6MGXuT1U=;
 b=reEXv05ipjGp93xPYCLtVv35VtdrWQjGElCngAxLEW3uU2o4uga1OZhF+3C37/pSAD
 R+AWNVYVBO9vDUAM4XDRkwhak7SRWND7XLsMg43UzKyAJNs5nFvVa/yxrJ0WZ8FRQ7eQ
 EMlhWd/dlqYu4Gz0N65v1oPRG6F0/NUrv1AusiMxh9G4SpWcORcZZUHmY15yH1MFIfyn
 xwFv8oo5Nw0CMnFFFbLaIxOAaNCtq+9ZTfouUUI/1tXp/p7HSmHBcpwKM/fMvfs4/i77
 f8uAICPYhs0ia3jBO9vpLhZ99Dve4m1soasxUVHbwrV6N8kT/p4y3bz4eN1ZucPeVCVU
 jMnQ==
X-Gm-Message-State: APjAAAXWau+K08H9IAklpQJh6D99kx6HWN8sFFB5LKDqxg7gz70gTucV
 c+AfbHEQ0DOfJOnWGmbBr8Nblg==
X-Google-Smtp-Source: APXvYqztazGDlaFYC+WJx4zsTQ8xcsRfbQ7lRYHwt0fqFmw+IWx7nTbOV89DEcb6FFLFA9jmTHgeFg==
X-Received: by 2002:a19:ed0c:: with SMTP id y12mr16804747lfy.191.1562143301493; 
 Wed, 03 Jul 2019 01:41:41 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id w1sm292624lfe.50.2019.07.03.01.41.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:40 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:34 -0700
Message-Id: <20190703084048.6980-19-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.68
Subject: [Qemu-riscv] [PULL 18/32] target/riscv: Require either I or E base
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
X-List-Received-Date: Wed, 03 Jul 2019 08:42:03 -0000

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


