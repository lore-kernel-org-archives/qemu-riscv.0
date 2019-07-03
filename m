Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiapW-0005qv-Kt
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51269)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapU-0005kU-1s
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapS-0006fA-OE
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:27 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45426)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapS-0006d9-HS
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:26 -0400
Received: by mail-lf1-f65.google.com with SMTP id u10so1135530lfm.12
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=nCqKF3oInYRXPwJWI7RpGGCzJlHRvb4E4bj4yY7JdO8=;
 b=rjdJnnacjnyqWkoBXoY03shB5+vhMzJPjufGSEhLRjrZ5NNK7VgYATFMyGG++u716N
 zBxRfZvkkp1SA4p9AItkTQYqMOZqPTjx85Qs+2BrYBTUuO6RjGH3W5mgyWl6gyoffBVH
 fw4hizK2PqmGPRDMvKLFtgSW+6hnhUHO1H9uHmm4QaEwIb67UIYODfoAaQpyebXooIvY
 RwVJNSKziTnLvcbASyhiRoNXYI742snlPbyO4NlSzdKKamoa01yrxyBbLHBezX/l4R72
 K/u9DM7y20rQ8+ye/2ugQwhsBeD61Eo9U9oDOfUmIGVyOok9A4RaCE+wxgzg1ca/G6p5
 5FoQ==
X-Gm-Message-State: APjAAAUVHl6YgeFLGpz/RFsYRu9X0ok77xM9JXqu5xjm0olONCm3tTIe
 xxagWgtXJCkokpN0KnnwUDQVqA==
X-Google-Smtp-Source: APXvYqyRU+zxSbZ41d5AKVMigjLA1PkS/hfi3yA30k/5GJhvpUBBAVNbkLahl9xbuY42wTrnpEJuKQ==
X-Received: by 2002:a19:9111:: with SMTP id t17mr3361466lfd.113.1562143285062; 
 Wed, 03 Jul 2019 01:41:25 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id w8sm291009lfq.62.2019.07.03.01.41.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:24 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:25 -0700
Message-Id: <20190703084048.6980-10-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
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
X-Received-From: 209.85.167.65
Subject: [Qemu-riscv] [PULL 09/32] RISC-V: Fix a PMP bug where it succeeds
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:29 -0000

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


