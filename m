Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAsw-000684-OE
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsu-00063j-Pp
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:17:56 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAst-0005G3-5c
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:17:56 -0400
Received: by mail-pf1-x430.google.com with SMTP id t11so851140pfq.11
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ty5URjUyAzHgdvndBCovXPI97TuuSa9GCoER6PMKuQs=;
 b=lExAHq0aTH0YZZuiGS2ib8iSpBxaQN4xik9afcTn7nz+J4qYclGYPdSCo3f3nLEM6G
 O6KiUua8cx9qKShUnM3lanh1gqGd7j/Z7uHqkX2RaFl5sSLSJXmmuELDdwctVEbfLvjO
 uPB2wH2zkfyIpkbpPS2vjdXoePNgiUJk/zOiunVhiqx/6SWwsAWkrTa63nMdeQBgsVkw
 hqJg+NoJH7vf31jMu1rimpBi/7OWkgjC6Z5zZvnt+BAPcNBJo7gLmgphh+AlG1k2+YKW
 TVWflS0Ifp6igU6QGtWOIsWATeKOzd/UG3dr7lHSrpDHgoHDqtZeQtMLldh7fj842i2N
 uKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ty5URjUyAzHgdvndBCovXPI97TuuSa9GCoER6PMKuQs=;
 b=r/l7mVgkiDCw8rrxqXz5CnK6f6k9MiVevi20qcU66t3D5sXbmcesLcFYrXRDBKiK45
 arQUczYQz12FdpgfCNHTlaVPAu7J5NEx/a/x3ooImGewNtvin2DMFypxBHLVFsGFEQPs
 0zsw6o/0ZEA83qYtO0jqUFqmGws1gElSU5urNpQk0ajP85XlNb2glldPACVMWtFcTSN3
 8NtX3gCAHN7e8dMkrLm2AIP81EFR3o+1+tG465qkzZ9zMnzQ1cjHwJXtd/pPXNUt7qHJ
 X00dH3Y8jobwKTgNQLwvk9VF896WiBIgnypIwtd0zWkjEXXMP/guZAuGbifbEiJQYw7Z
 pbZw==
X-Gm-Message-State: AOAM533hy97Bn2aPOofKzl1xlqI2yQAdjApKn8276XUUOVhRoLan2Jlr
 15Q0vXfU1yLKBm7U45Pjo7PRQA==
X-Google-Smtp-Source: ABdhPJwcNVgrl5aP2pbP2KG/FbS8es//wK6NMKXmTuLjXzsfGrdG699Ako1q5bsoYYMZKZsME65+yQ==
X-Received: by 2002:a63:7c56:: with SMTP id l22mr25289808pgn.127.1595409473878; 
 Wed, 22 Jul 2020 02:17:53 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:17:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 06/76] target/riscv: fix vill bit index in vtype register
Date: Wed, 22 Jul 2020 17:15:29 +0800
Message-Id: <20200722091641.8834-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jul 2020 09:17:57 -0000

From: Frank Chang <frank.chang@sifive.com>

vill bit is at vtype[XLEN-1].

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 378f6e82bf..27ce075e50 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -98,7 +98,7 @@ FIELD(VTYPE, VLMUL, 0, 2)
 FIELD(VTYPE, VSEW, 2, 3)
 FIELD(VTYPE, VEDIV, 5, 2)
 FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
-FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 2, 1)
+FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
 struct CPURISCVState {
     target_ulong gpr[32];
-- 
2.17.1


