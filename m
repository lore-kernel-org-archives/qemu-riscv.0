Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5ZtY-0002eh-7C
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 16:02:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ZtS-0002WJ-Jw; Thu, 06 Jan 2022 16:01:55 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:56448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ZtQ-0002jv-0j; Thu, 06 Jan 2022 16:01:54 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 9778A40434;
 Thu,  6 Jan 2022 22:01:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1641502884;
 bh=eYGXzd3CkqEMK5+a2t7ccfqW8Gji7SYKJSNqFheN8/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MT9eTk31QH94YOhio3Te7s4oX38xJ7fv+jZYyjZwjuGbBQnSkG4Ix3IWkxpNkW/Xg
 nHwMUfVZYEmyKJoznOl8EwFQsslhOUZr3LNkg1ckrDyQOtscf8RNuqbDD5AhjHROjS
 Lz9u9hnnBx/ewsjpxWMXkjlDDBozrW2bdPvVKqC3+eyN3qm9SAiYzM9Rr6rZtn1YCE
 OeUsIVKHk0cVY0pw00hkhlw6GomfqNhrmPWdt7mTerAdCvOZBhEdLNzAuqhB2G+YcR
 3S2Qjtm74r7GocVz91Zr8aexDVbPdE938oKWRgtB2cVAVJGx/x8FdTdghgd2Vy5pYJ
 RtmgndH/NN06w==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 7F3D760074;
 Thu,  6 Jan 2022 22:01:24 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 4B9BE140080;
 Thu,  6 Jan 2022 22:01:24 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, f4bug@amsat.org, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v8 15/18] target/riscv: adding high part of some csrs
Date: Thu,  6 Jan 2022 22:01:05 +0100
Message-Id: <20220106210108.138226-16-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jan 2022 21:01:57 -0000

Adding the high part of a very minimal set of csr.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     | 4 ++++
 target/riscv/machine.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f05f2411ae..f3a52fef32 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -195,6 +195,10 @@ struct CPURISCVState {
     target_ulong hgatp;
     uint64_t htimedelta;
 
+    /* Upper 64-bits of 128-bit CSRs */
+    uint64_t mscratchh;
+    uint64_t sscratchh;
+
     /* Virtual CSRs */
     /*
      * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 8af9caabf5..13b9ab375b 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -179,6 +179,8 @@ static const VMStateDescription vmstate_rv128 = {
     .needed = rv128_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gprh, RISCVCPU, 32),
+        VMSTATE_UINT64(env.mscratchh, RISCVCPU),
+        VMSTATE_UINT64(env.sscratchh, RISCVCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.34.1


