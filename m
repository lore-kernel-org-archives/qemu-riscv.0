Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgul6-0000I7-Pl
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54539)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgukY-0008GV-Gw
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgukV-0000FB-GM
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:26 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44297)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgukV-0008VE-6d
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:23 -0400
Received: by mail-pf1-f196.google.com with SMTP id t16so3317494pfe.11
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=nCqKF3oInYRXPwJWI7RpGGCzJlHRvb4E4bj4yY7JdO8=;
 b=gEZAF4xs+80gnYbbxbXbIxYllY2hbvrgHXz2yM1Jqa15Lml9yxUqods1wuY/hxMfB7
 WQp+OEwQapCoCoHSTutGUJ4lXeS4NpkAqwJmDNPOU+USTTHSsQwD8TEaPjjEvT4tN77I
 cI7l5gb9mSKYonT2FR3719UIY7dGYi8J+QYj0b0OI6onGNqJjK32nVnBZwZRGeXziNTe
 ng4qVLqDntjxL7sYB/arq5EVWF4pbQSxbAzHsk8u1qTb0Jgh6JA8xoR8UI7tJuDqSO+v
 WXGFWgO6RtOlcJnUlH45/m8jXHXcalK+/Un6wjTFwgJHRK4EwM7slIoeUK4LvmxgTgnt
 Nw/Q==
X-Gm-Message-State: APjAAAUec4ytgg/7SWkmdIy0N++DFR/CssNfvFyZ43OkJH2fFwWbjlju
 WxQ/G36EzlNCj51O6BMq3qZxrA==
X-Google-Smtp-Source: APXvYqzgzJFIpQlqKh088wUJ+eQ8NK73bPGYsVO4ItnZRvBG2zWyfBsDucC6zbo4Jzqk54fO8jWk+g==
X-Received: by 2002:a17:90a:30aa:: with SMTP id
 h39mr14627606pjb.32.1561743185398; 
 Fri, 28 Jun 2019 10:33:05 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id g8sm2783839pfi.8.2019.06.28.10.33.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:04 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:02 -0700
Message-Id: <20190628173227.31925-10-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.196
Subject: [Qemu-riscv] [PULL 09/34] RISC-V: Fix a PMP bug where it succeeds
 even if PMP entry is off
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:32 -0000

From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>

The current implementation returns 1 (PMP check success) if the address is in
range even if the PMP entry is off. This is a bug.

For example, if there is a PMP check in S-Mode which is in range, but its PMP
entry is off, this will succeed, which it should not.

The patch fixes this bug by only checking the PMP permissions if the address is
in range and its corresponding PMP entry it not off. Otherwise, it will keep
the ret = -1 which will be checked and handled correctly at the end of the
function.

Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/pmp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 5944f4cb6607..958c7502a0e0 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -258,11 +258,12 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
         /* fully inside */
         const uint8_t a_field =
             pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
-        if ((s + e) == 2) {
-            if (PMP_AMATCH_OFF == a_field) {
-                return 1;
-            }
 
+        /*
+         * If the PMP entry is not off and the address is in range, do the priv
+         * check
+         */
+        if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
             allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
             if ((mode != PRV_M) || pmp_is_locked(env, i)) {
                 allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
-- 
2.21.0


