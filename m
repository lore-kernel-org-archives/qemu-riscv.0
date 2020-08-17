Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7arD-0007eP-CF
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7arB-0007Ye-4O
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:51:05 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7ar9-0004zs-8U
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:51:04 -0400
Received: by mail-pf1-x442.google.com with SMTP id f193so7886515pfa.12
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bh+dNsmGP/qZR/VB/85dqarQceH1VG542/49ilIh4wY=;
 b=eU+JyqH+DebpNBwecsGT7dAyOCLWygVzZrBnk33DZZFhFAxIdtGhriUHpqK/iaREgQ
 QvUXaAHoLGJ9EV3MQtlfaEfbXch/SHHRlYk7E3c20dOeqNmqL2KuDJPGtKed78zr5DF5
 GsEb5X1eqrJbfA4TEbMkxqC3emBhlVVNw48vIAwzH5pjuvODfPa3QiaWmeET9VyS8iYm
 2SDxotvUqSgYfDVtufo27FJN3cAs/RIBp65lJcqR380DRgaUh0WtBbcL2PvX1Qr2g8IX
 R7k6p/uQOCLIkX1o/LgsY3JRiWcEKqxrjaJwrr/VnvNbw4IPV5t8/rnWEyG57Ou4roJH
 9TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bh+dNsmGP/qZR/VB/85dqarQceH1VG542/49ilIh4wY=;
 b=csvOZSGI2i5rf7qBRur3ksMu/dC6sTXU0EqOzTMG2yX5syjP+jJwa/jrgA9BCuJtdE
 bO5tujeSXa+287QWpoTtWFGNuKD5stdrKpkZ+qw2vn+Mt1sORSMyZIl1ZEq7JZ4PqslK
 wOT7BATiwkrPR5+bUjwJ36CIFGhjBG8gn3ITah695+DHXiSwj828Ojgm5wT27veXruot
 nrnJHSiuVRSSQaRuv1CrLnQCJTS4M0QuOcAff+IpQiOgTyCEctMgDlJu4CGCkzQMyQGU
 Sg5Ap5XOlh6k1wLaRDXmfZnDp0bXSxSItXKJF3QzuVrhAN7/gDVjz1+QnWE91/pS/yf+
 eWZQ==
X-Gm-Message-State: AOAM530zgZinTPUgNWPKK1DuQf7uWbrhL3VR2tXDW4kmqrg40t461GoS
 W4k3HdkpFe8v09GjPZxxh5de5A==
X-Google-Smtp-Source: ABdhPJwrBG3k8yB5pokzqfB+5aVpTtgRqUktZOFQ7Mv+Me+pVOTQ7bONqEcodmPYyqz2J/r7iRaiEA==
X-Received: by 2002:a63:f44b:: with SMTP id p11mr5007805pgk.324.1597654261999; 
 Mon, 17 Aug 2020 01:51:01 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:51:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 20/70] target/riscv: rvv-1.0: fix address index overflow bug
 of indexed load/store insns
Date: Mon, 17 Aug 2020 16:49:05 +0800
Message-Id: <20200817084955.28793-21-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x442.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:51:05 -0000

From: Frank Chang <frank.chang@sifive.com>

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 272a65ebb3a..92a2161e373 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -363,10 +363,10 @@ static target_ulong NAME(target_ulong base,            \
     return (base + *((ETYPE *)vs2 + H(idx)));          \
 }
 
-GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
-GEN_VEXT_GET_INDEX_ADDR(idx_h, int16_t, H2)
-GEN_VEXT_GET_INDEX_ADDR(idx_w, int32_t, H4)
-GEN_VEXT_GET_INDEX_ADDR(idx_d, int64_t, H8)
+GEN_VEXT_GET_INDEX_ADDR(idx_b, uint8_t,  H1)
+GEN_VEXT_GET_INDEX_ADDR(idx_h, uint16_t, H2)
+GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
+GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
 
 static inline void
 vext_ldst_index(void *vd, void *v0, target_ulong base,
-- 
2.17.1


