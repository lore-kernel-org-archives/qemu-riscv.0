Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwoMF-0003Rq-4D
	for mharc-qemu-riscv@gnu.org; Mon, 13 Dec 2021 11:39:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoM6-0003EC-D2; Mon, 13 Dec 2021 11:39:16 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:46720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoM3-0003b8-7N; Mon, 13 Dec 2021 11:39:14 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id C641E40373;
 Mon, 13 Dec 2021 17:38:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1639413522;
 bh=Pk2eYL+pDYgb0Fua4vwWucYfQT24NKLl9QCmUfiyof4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V1kQim8il0/5SMRr4Nqb57ePa7tiKYc7oCnoZmcA+Hj5+rG/FYAJBz+fgndNjPvpf
 x1iDpL5MPjskbEHLhkcEKwIHPkR4W/TQIPSuxPIyms4zJp3DXB6a9MtsJadnV/1La4
 Q0AgBMTho3c0GSKfHUO8RT7byuB/KiQ+TjUYSmND2JpAsJOsEIVCNZWyPflyzGsUWg
 BIt+cQlfdNhbZDAQrZKAWiGQFiS8mc9Bug4RC1FXS3vd0Z4pjWgDIauPcceH0nok0W
 MG0x3a3yfNTTVjeauWHmDWpQlJ5uCz93b3d17jbzEA1XiltPi4tPQ6cgZwDWWk3wZI
 iidDmYt1IOh7g==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id AEC7E60070;
 Mon, 13 Dec 2021 17:38:42 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 8214D140080;
 Mon, 13 Dec 2021 17:38:42 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v7 15/18] target/riscv: adding high part of some csrs
Date: Mon, 13 Dec 2021 17:38:31 +0100
Message-Id: <20211213163834.170504-16-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 13 Dec 2021 16:39:18 -0000

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
index 603ae04837..a7c2e5c93e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -193,6 +193,10 @@ struct CPURISCVState {
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


