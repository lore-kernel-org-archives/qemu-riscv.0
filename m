Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbtE-0008Ce-TW
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsz-0007yH-ML
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsy-0007FJ-70
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:53 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:32897)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsx-0007Ef-Va
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:52 -0400
Received: by mail-pg1-f196.google.com with SMTP id n190so67147pgn.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=s35F55O2Em8wHwXR9VPPU+OtN5AgatRpyAF6CF2QIKI=;
 b=m+4Orh1FkHUgwREvHQdzq9nmO+DENriK0r8y4Y/z1oErLZR5XxglrLLIit01TChrvH
 +VTVEEzB0H4j2NeN8a6JBIu/PSG6zV6ga/0zv1uP8peTlHRXgTDi69dKO1vEWZnPj3uJ
 O6Hzjf+uH9drL6ZspfE6e+Iw+Ks/IzZ6LhJ2fjqCpnm6ohSlX9ZMBIBVvm53SQKcbNje
 ka38oH2MKJxjxdfI63dPwQqwT1A+eeirafEtR92ZXq/TyneiDoApZIVJJndPV0SrsfgP
 kG1vOWpR9DCDE82+yBmPow6kCTS7SAngWrBU/pUKBaRxwpXG4CNQICFGkgx9zavQafz9
 eWDg==
X-Gm-Message-State: APjAAAUe/1FYC6M5sCtNRt/wfXvjRAM/mtZ5BQbm5a0OjOMMJ1Otdwfm
 NYzdRIUnUt5ZnmMMee4753sSFhzHeIk=
X-Google-Smtp-Source: APXvYqzfy1VAvBWF50RP0rDWtfaHd15KCdWTqLI6sI18eWmoectT8vFWQSUyCS2r5ByGoB1WXU/NGw==
X-Received: by 2002:a63:2a46:: with SMTP id q67mr4587738pgq.108.1568820530572; 
 Wed, 18 Sep 2019 08:28:50 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i6sm10705310pfq.20.2019.09.18.08.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:50 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:39 -0700
Message-Id: <20190918145640.17349-48-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.196
Subject: [Qemu-riscv] [PULL 47/48] target/riscv: Use TB_FLAGS_MSTATUS_FS for
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:58 -0000

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


