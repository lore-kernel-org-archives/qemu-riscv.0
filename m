Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irc00-00066w-RU
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jan 2020 01:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shihpo.hung@sifive.com>) id 1irbzx-000640-3w
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 01:17:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shihpo.hung@sifive.com>) id 1irbzw-0003XV-2u
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 01:17:49 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:34007)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shihpo.hung@sifive.com>)
 id 1irbzv-0003X1-UC
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 01:17:48 -0500
Received: by mail-pj1-x1041.google.com with SMTP id s94so1700026pjc.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2020 22:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Jx3r2seKwSeUadPVhjH4OOR8DMwWWFpbD6d3Ui5d1O8=;
 b=Iy6Wlf8FywDmtcjxTWf0Q1wvPc/Miuzbi2uWt3BzSrgtQWcGESmCLvGAglCiN2qN98
 9/ZWl02NeLoRXGURZ9ysiTXOyj/NYq4EuePi6qF4leEOtMi8rwErIrpz390+3WPhvoje
 bEoqdvJ2Xux1CBZrBw1DnQXFJ6OiZtWc29Krn8RyAPTUa6axQowYWqcLty+btNPap4ad
 cTyFdHkwRGcwIIzbDvSH/XXY/1U6P5OfLM40FOloJm3+PMDzVM4sxs4k1s86Qx2jIdGf
 oRMnykzfLQRdl16aFOnXe1s243fujiCPU6nkG4AlF/qIsNuLzzVLhUjCaFrpkh79xPnq
 jCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Jx3r2seKwSeUadPVhjH4OOR8DMwWWFpbD6d3Ui5d1O8=;
 b=gtFOKGp9esC03w1MF6/a0PLQOcZ+8ca+bh9OQdXn/Xs/m23Hw+DAi9wYP5SizJ5mb6
 PUHvaEOAfZy/1I6tI3qMK17+4MsRv4pmV+K+UXUZ/8VJ4Cb7HDZBg5j9Nr4pTmGrdFnj
 yB2Q0F4+dkxS1xH3S/I4aWVrkJJSfr8cuaurACuzt8r7BS5pCfNXPyX/bu+mviT2RGmF
 va/o0xiKvjismt+aWK5Xqgyt4JHBBr57iPeNO90fodKSRrLgX8i+J1LZLSV0PWSt3ek8
 TUt3ObPjMcTad5wN4nxqw8e7zt8wzamzpOY7zaBAhpWj+mvecHYQ2YJ/hqTHAI9ExFBR
 wUUg==
X-Gm-Message-State: APjAAAVAA3xqoF6ORmYp4RZkMioWP9ZdWNMVku6/NkGOS7mfHX5MGZ3d
 +jZ+FVlAfZDZVS6Dhuw2Uc+ZQeAm5tA1JA==
X-Google-Smtp-Source: APXvYqzrCCLc5US08o/zjGzN1k1QnbEN+ADAX5uJfoWSEM5Y8AvoExONDVL82wqaP4iwY2Twitnmkw==
X-Received: by 2002:a17:90a:d995:: with SMTP id
 d21mr34127974pjv.118.1579069066564; 
 Tue, 14 Jan 2020 22:17:46 -0800 (PST)
Received: from gamma04.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id w123sm20633601pfb.167.2020.01.14.22.17.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 14 Jan 2020 22:17:45 -0800 (PST)
From: shihpo.hung@sifive.com
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 ShihPo Hung <shihpo.hung@sifive.com>
Subject: [PATCH v3 1/3] target/riscv: Fix tb->flags FS status
Date: Tue, 14 Jan 2020 22:17:31 -0800
Message-Id: <1579069053-22190-1-git-send-email-shihpo.hung@sifive.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-List-Received-Date: Wed, 15 Jan 2020 06:17:50 -0000

It was found that running libquantum on riscv-linux qemu produced an
incorrect result. After investigation, FP registers are not saved
during context switch due to incorrect mstatus.FS.

In current implementation tb->flags merges all non-disabled state to
dirty. This means the code in mark_fs_dirty in translate.c that
handles initial and clean states is unreachable.

This patch fixes it and is successfully tested with:
  libquantum

Thanks to Richard for pointing out the actual bug.

v3: remove the redundant condition
v2: root cause FS problem

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e59343e..de0a8d8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -293,10 +293,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 #ifdef CONFIG_USER_ONLY
     *flags = TB_FLAGS_MSTATUS_FS;
 #else
-    *flags = cpu_mmu_index(env, 0);
-    if (riscv_cpu_fp_enabled(env)) {
-        *flags |= TB_FLAGS_MSTATUS_FS;
-    }
+    *flags = cpu_mmu_index(env, 0) | (env->mstatus & MSTATUS_FS);
 #endif
 }
 
-- 
2.7.4


