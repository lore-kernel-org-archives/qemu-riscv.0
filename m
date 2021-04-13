Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWLw2-0006me-9A
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 12:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1lWLvv-0006m6-J7
 for qemu-riscv@nongnu.org; Tue, 13 Apr 2021 12:30:37 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1lWLvi-0000ZT-4m
 for qemu-riscv@nongnu.org; Tue, 13 Apr 2021 12:30:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 g18-20020a7bc4d20000b0290116042cfdd8so11076227wmk.4
 for <qemu-riscv@nongnu.org>; Tue, 13 Apr 2021 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dUYJ2tPeIPJctl8N1Uj+3YesxE57g8kklWO4jJ5C3/0=;
 b=ebaiFzo7sQ/0QBJCQaZ8PLnnK82FhR8HL/HDEB6P+3lcjnn2rHTZIAn4bFR8PcASwU
 eZGzl8njfq4LS+TVPyBfOY8I91DZERaBx1IEouVanLO2rLw4GW3RzQmeITM06rdk3cyu
 fGccuhfgD9hRa2Wd+VUXH45Vl1CMMgsrlmmi21noU2c15iCE12lh62lcphUGen/Hg97W
 ATteQsgyEefI1BYowM7L0QtY/kW73Q0SLRaFnYZGvvrrmC1lgR6mRk/D1GAPtuUAhvq6
 iqBlkPsZCuvZSXXtPbKFwF3ggPhiLLKldzsiLedYf747qBZRhAwA10BXFKpRy0vU6L2D
 pQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dUYJ2tPeIPJctl8N1Uj+3YesxE57g8kklWO4jJ5C3/0=;
 b=gyy3RWPzr/patnTIKZNQP5nFmZsbteNfPb7ShKAqjX7lYwMAX2SxBEahW+wk9QtC+6
 gCteWGOxbe0dkdS++9xbzxlVvoPsmNy5Do68FRY2bYVy5clUb3oA/h+1RFgthm+6ZgzB
 rVQuO9by5qknOF/iSUGK0+v/vSUZDCub0t96TDxubkdN8aSiKbq3mUYC6cenB7c6I39l
 ihQWtmgAnmpSk6raubNSQWF/DXdoLrlxZotE4DXC72AKtvpSzD0jPWKW2vX4YaHQ50FV
 9oqa9PQgRx/pYkGK1gXKMozoZx7nptfNEoKBFIr66qqBqJeu2Q7DTK/Rfpo2z7WzvRxA
 jGYA==
X-Gm-Message-State: AOAM5311sR/3QmkLg0/sNj161CbA4LoosW1EgE3m0dnp37kWf6ESuRna
 rKzYqV7aW1TsTFC9X6bwmqFdHFtW8jtcCg==
X-Google-Smtp-Source: ABdhPJxcz85kqDegoJWn4xV/70iejWnniDREiz41ogpFppOtgxMNpIY2BZBMUq56OWsZf6B770iRNg==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr813828wmq.128.1618331419827; 
 Tue, 13 Apr 2021 09:30:19 -0700 (PDT)
Received: from glencoe.iroazh.eu (lfbn-tln-1-134-231.w90-119.abo.wanadoo.fr.
 [90.119.102.231])
 by smtp.gmail.com with ESMTPSA id m26sm2948232wmg.17.2021.04.13.09.30.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Apr 2021 09:30:19 -0700 (PDT)
From: Emmanuel Blot <emmanuel.blot@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: qemu-riscv@nongnu.org,
	Emmanuel Blot <emmanuel.blot@sifive.com>
Subject: [PATCH] target/riscv: fix exception index on instruction access fault
Date: Tue, 13 Apr 2021 18:30:00 +0200
Message-Id: <20210413163000.45307-1-emmanuel.blot@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 13 Apr 2021 16:30:37 -0000

When no MMU is used and the guest code attempts to fetch an instruction
from an invalid memory location, the exception index defaults to a data
load access fault, rather an instruction access fault.
---
 target/riscv/cpu_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef5613..4e107b1bd23 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -691,8 +691,10 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 
     if (access_type == MMU_DATA_STORE) {
         cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
-    } else {
+    } else if (access_type == MMU_DATA_LOAD) {
         cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
+    } else {
+        cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
     }
 
     env->badaddr = addr;
-- 
2.31.1


