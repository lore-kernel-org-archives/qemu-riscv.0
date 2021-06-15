Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lt4n3-0002zX-PK
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jun 2021 04:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lt4n2-0002wz-8O; Tue, 15 Jun 2021 04:51:20 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lt4mz-0005OI-3B; Tue, 15 Jun 2021 04:51:19 -0400
Received: by mail-ed1-x52b.google.com with SMTP id t3so50064573edc.7;
 Tue, 15 Jun 2021 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gaBpsTdKFZFfUwHu9bb16LiUxdAaTiYwcr5Fg3tN33w=;
 b=Ays64WZ+Fgbo8xIpp/Rn4IFAqoKOJuYNndMw5i/KkMW6lSxu0G0WdRxpLKr9dlDRJY
 qvoZU+O2Vd5MQkmv+lIgcZbr7gMgjJB0kjEhTgP0WU7Ev4Nflgp90F/WVT41z7ck96Ej
 QM7QdHPI/V+f4xH0d7/nTobrim18tTgqOEUTZPNAIQi7pVC7EMWts4nTvKvSGSPPmDMB
 0g8D59plFhEuyCg78qAm9MxZlZxh+MoXBngADhpry5smb/rzg4RsnYFRjVRuepoFrl27
 /+yC6/Nz/+J3Agb4Q9B4SFkS/NSOXwaoKUSMYW5irBHGnlE7SBCDW4XVCbk4S+7IM/Y6
 9VMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gaBpsTdKFZFfUwHu9bb16LiUxdAaTiYwcr5Fg3tN33w=;
 b=Xmk00Sgrr8ugjMHIs26kyRMW3xFb/OotBsbI8NwETGGQtuaVYnCKbPyn5sPJW34NOY
 NQcY66pWX/uJtUeyp4mHWpsxelTEfn/qa8zQ9D1coSzAOwU15NAUNSf+JMRaK25trs/D
 tzCMvlNwBFYGgrjvv5vR5NwV8B/7ZmoEXvPVd571lExQ5DJPCklLPhFRL/6w5MW4cMTm
 QCsGpN0WFh9sUwojJRlhXcTHVNuEDlr7zaMLdgLJzJYZR9zorjFx8vRQblUCKA01ACBx
 OwutnFXaS9H3JCSxF8BR6FcPn7n/jl58AZpp86FMaRR0wFYPwU/kLs+LybIWVElSYKdm
 Hrdw==
X-Gm-Message-State: AOAM533HMJHwEElAFGP+Ym9POcojmHLB/dFd/WoaPn4V54/A8KrvWKLD
 dPzPjj71pu1gA7dJ8LpUliA=
X-Google-Smtp-Source: ABdhPJzb+umS9o7LugGNCwZDKuK0HR+wNuVefKDfskCnK5pUOFhItC80XLuFZo0rx6XiH2Pg4vAsxw==
X-Received: by 2002:a50:8fc3:: with SMTP id y61mr21193574edy.107.1623747075153; 
 Tue, 15 Jun 2021 01:51:15 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id h2sm11609318edr.50.2021.06.15.01.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 01:51:14 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>
Subject: [PATCH] target/riscv: gdbstub: Fix dynamic CSR XML generation
Date: Tue, 15 Jun 2021 16:51:33 +0800
Message-Id: <20210615085133.389887-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 15 Jun 2021 08:51:20 -0000

From: Bin Meng <bin.meng@windriver.com>

Since commit 605def6eeee5 ("target/riscv: Use the RISCVException enum for CSR operations")
the CSR predicate() function was changed to return RISCV_EXCP_NONE
instead of 0 for a valid CSR, but it forgot to update the dynamic
CSR XML generation codes in gdbstub.

Fixes: 605def6eeee5 ("target/riscv: Use the RISCVException enum for CSR operations")
Reported-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
---

 target/riscv/gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index ca78682cf4..a7a9c0b1fe 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -170,7 +170,7 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
 
     for (i = 0; i < CSR_TABLE_SIZE; i++) {
         predicate = csr_ops[i].predicate;
-        if (predicate && !predicate(env, i)) {
+        if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
             if (csr_ops[i].name) {
                 g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
             } else {
-- 
2.25.1


