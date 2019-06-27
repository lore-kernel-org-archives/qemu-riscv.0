Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWI0-0003Y8-M1
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33017)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHW-0003A9-PL
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHU-0008WV-GP
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:50 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35027)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHT-0006jJ-Ev
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:47 -0400
Received: by mail-pf1-f193.google.com with SMTP id d126so1409753pfd.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=nCqKF3oInYRXPwJWI7RpGGCzJlHRvb4E4bj4yY7JdO8=;
 b=N/PnGevXBexTuHRsmV/qyHaV+Ip6dnj08QCEBWcS80LrRR5COZq79LCbc3H6YGgxSq
 jkdMNybpu7YCDCQncpGQ3C126u8+C60hWACa/MIIBAUEJy6FvWSRYaezl75YZi4A+/ut
 2vOxjAbhM0N74ZjEp5P7mWrMCwTA9JP9SQ2nMcs2myybSG23y+wjP7sMiPMlL9F6cexL
 ptaVDSQjuf2ZhJt33rWVHQnfzk2nKB6t8RI5eyo5b9W8spO0/l+COuMSlYtv6kyRgnER
 nO98uUWrvlf6oW1Jkzz2DdagsgDmCIb5TYyh/AKYFBGi+tzbqWC/yagXwlQK6u+W7zwy
 wPsQ==
X-Gm-Message-State: APjAAAUenJWP8Y5VOyJK9t61pV7BjkZMxYFJIWn3iRqeAM/o3Y01SX1w
 UMOtoQdZby8BIVUzn+kD+MvUhzeB3TfvCQ==
X-Google-Smtp-Source: APXvYqxQicao0ppWeUilfhR+0a2GeGzhgPiD9dF6hP9iUcRv+KdNY+sceD6OEu6ncermiJcsuH5SEw==
X-Received: by 2002:a63:2ad5:: with SMTP id q204mr4370120pgq.140.1561649024131; 
 Thu, 27 Jun 2019 08:23:44 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id y23sm5311422pfo.106.2019.06.27.08.23.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:43 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:46 -0700
Message-Id: <20190627152011.18686-10-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.193
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
X-List-Received-Date: Thu, 27 Jun 2019 15:25:58 -0000

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


