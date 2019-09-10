Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwh-0000PV-5X
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58049)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwc-0000JR-Pj
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwb-00070Q-QT
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:42 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36927)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwb-000703-LQ
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id i1so22867191wro.4
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=s35F55O2Em8wHwXR9VPPU+OtN5AgatRpyAF6CF2QIKI=;
 b=imInMBqddla6332emR2uIs1VTBu6ObDwZqMxYswSxbFM9T5+cIQ5ZoWlg/aKjloc/d
 qCeUFVG+5H0MlDwf45TKPPVqZ38pM9H2SFxgkAnjtjmKRzqDpFnNHMorinEFYUdj/GNS
 QAuFw0abhdkj9oHguhM/JvBL2EbZrb9QDYWUFBh9TRCcIIW9ys20yVZrdGdVK9A0LVsr
 SPfNMHR0rdk94PInLY2knE0wWumkZabM+xcEgYdN/Gn4aEuTcuLjH/vC+BiPOq5bAJ1L
 zFbSd9828Eef5NikXsyLp/G0BZaf8bQ7sk6dwDLgESTHCUOlB/PmpXUT0k9DAdqQBnpY
 PoUQ==
X-Gm-Message-State: APjAAAWwN9aLurWLJynRl+tJVaJ2Tgu9CR4hkgYknTEDS4Izgo9FUVtP
 KZY+EM0LoHK32jTa9agPverJzo+43c+BAQ==
X-Google-Smtp-Source: APXvYqwyOpdU76q4QGF+CrWLpTrOoNjXAE1IWJiIFUYnKWxPwdhUc8Zd55cKfkmSQ3JHuYqcDmTlzg==
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr1855594wrs.191.1568190340232; 
 Wed, 11 Sep 2019 01:25:40 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id o22sm37968406wra.96.2019.09.11.01.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:39 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:05:13 -0700
Message-Id: <20190910190513.21160-48-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: [Qemu-riscv] [PULL 47/47] target/riscv: Use TB_FLAGS_MSTATUS_FS for
 floating point
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:45 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Use the TB_FLAGS_MSTATUS_FS macro when enabling floating point in the tb
flags.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 16efe8c860..124ed33ee4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -301,7 +301,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 #else
     *flags = cpu_mmu_index(env, 0);
     if (riscv_cpu_fp_enabled(env)) {
-        *flags |= env->mstatus & MSTATUS_FS;
+        *flags |= TB_FLAGS_MSTATUS_FS;
     }
 #endif
 }
-- 
2.21.0


