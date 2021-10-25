Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mez6M-0006kF-Df
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 08:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez6C-0006Te-Sw; Mon, 25 Oct 2021 08:29:09 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez69-00087J-OH; Mon, 25 Oct 2021 08:29:08 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 58D9F41AEB;
 Mon, 25 Oct 2021 14:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1635164915;
 bh=Jsfdnn9fmQX25DCB9x7cNC8krS3rLPaQfYC9SyINQKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JI3/Pq67YkXXjNpO06ju55niFbaQUezz/YxOJ8F8kz7/v0ezIPu+A/1U3csEaUN3j
 KjIOBHjPI9Ak5E3X58WEqMBPdWkZij1QUKrVxKpwGv9SqQkNvqXrC9CDtpr1y5ngD3
 0bp2JsoTFKCMWUMdcCA/fu/EBhrFwH2KgFIl+xh6zOi5p4+5sfyaMv9zUdc3J2ipIC
 bR910HimSdW35EYmiFREuPYe867CQeRQkxukVAIZBeiw64uKxe7DVW6DkAhAPGgU+6
 eebFFEFCcnWr/98P86cLP+gF1mJzz8RsqVIGKc+46BDXcFk318/jObANlLQrf0FU4v
 ZZMM7aTBskGXw==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 41D2460067;
 Mon, 25 Oct 2021 14:28:35 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 09B8A14005A;
 Mon, 25 Oct 2021 14:28:35 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v4 14/17] target/riscv: adding high part of some csrs
Date: Mon, 25 Oct 2021 14:28:15 +0200
Message-Id: <20211025122818.168890-15-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
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
X-List-Received-Date: Mon, 25 Oct 2021 12:29:12 -0000

Adding the high part of a very minimal set of csr.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h     | 4 ++++
 target/riscv/machine.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 923ef01583..d8093be74d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -194,6 +194,10 @@ struct CPURISCVState {
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
index 78636ec96d..df4e667c59 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -153,6 +153,8 @@ static const VMStateDescription vmstate_rv128 = {
     .needed = rv128_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gprh, RISCVCPU, 32),
+        VMSTATE_UINT64(env.mscratchh, RISCVCPU),
+        VMSTATE_UINT64(env.sscratchh, RISCVCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.33.0


