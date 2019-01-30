Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goyDf-0003Xi-3U
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 17:20:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luke.r.nels@gmail.com>) id 1gox1q-0001m6-UP
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 16:04:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luke.r.nels@gmail.com>) id 1gox1q-0004Zr-0j
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 16:04:14 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45096)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <luke.r.nels@gmail.com>)
	id 1gox1p-0004ZO-Rj; Wed, 30 Jan 2019 16:04:13 -0500
Received: by mail-pg1-x542.google.com with SMTP id y4so340595pgc.12;
	Wed, 30 Jan 2019 13:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E5qcTAjj1g0GdrU4NuOSJyU+zBydkKA9EPQSYNz3FdA=;
	b=Z+Qj9CCYprNSfwLT9/bW8KPMh2ZEpTgQc6LPCDorrNICtxvf+CcQ1tgXzetiub5xmo
	h3s+suGutu6NFCTDNj5lRpaANE9WfU+T41zYHgdoZePSpHc/Di6FabWTXp0YeggYsca0
	SXTc0SVkArRtTFdsbI9h2YVwMWhQYchMLmPIwE0iMmiTgVjf54e2Ntj1ZDA02SFtQBci
	6SuyRwQrLug9QBOkYbFAymH9Xn4X59gTYRgsAwtSfSG2Pc0wcl50XU1e20QgFMmazYj9
	8QoNha+3KwS70iUHpqEb8vpjmDIeqZdRRA8xg/XqxMFHZAFMBCJLgslu1LdeUsYO5SHr
	624Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E5qcTAjj1g0GdrU4NuOSJyU+zBydkKA9EPQSYNz3FdA=;
	b=c1XJDHbpfSatLkgudFE9zr8WBYjObsdr/WySUDgDNv82BbBfplDolwR3FCfrSkT0Ox
	9IT2uD2JIO5zic89YaB5WCOpHqut5iXE6p2J6M8Ho30bq5K/SDmtkIv7HTyKEh83QmB6
	SmvQ9bYT2csUEEd7lNL9SI0q2WRseXFUT60EnQ8lLL2SnQf9NLGtZuBy3kWiBzeWSSXq
	oNTZHU47tppq38epY67kX5snGN97rKP1zR4owoIUuRN6yL2GVfD1WfgARzPCszrGW7EO
	XBg9lulPcM2vtyLYrfnNo85NBl/4Efb7CCvnW4cceDQwkaX/AXFCoTH8iokaZG7d+Gp8
	++ng==
X-Gm-Message-State: AJcUukfjjhxBqcuye+NMHEbLxO73qLNattfYgTO3oIyYcEntHedjbI2N
	EG7seDDgJmJ9B1ClBqh4jnIzVAQG
X-Google-Smtp-Source: ALg8bN7tVpmaZpk2RGxycUTMQQGgNEaMe0sQhLDO0oca+DMY6qVcPd4kHQlxBnXGg6P0Skt2pPtkng==
X-Received: by 2002:a62:8949:: with SMTP id v70mr31329104pfd.85.1548882252112; 
	Wed, 30 Jan 2019 13:04:12 -0800 (PST)
Received: from kaby.cs.washington.edu ([2607:4000:200:15:e933:fe08:dfc9:9bd0])
	by smtp.gmail.com with ESMTPSA id
	i5sm4002584pfg.34.2019.01.30.13.04.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 13:04:11 -0800 (PST)
From: Luke Nelson <luke.r.nels@gmail.com>
To: qemu-riscv@nongnu.org
Cc: lukenels@pm.me, Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>, Michael Clark <mjc@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Wed, 30 Jan 2019 13:03:50 -0800
Message-Id: <20190130210350.16757-1-luke.r.nels@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
X-Mailman-Approved-At: Wed, 30 Jan 2019 17:20:29 -0500
Subject: [Qemu-riscv] [PATCH] RISC-V: Fix pmpcfg register indexing
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 21:04:15 -0000

pmpcfg_csr_{read,write} do not correctly handle accesses to PMP
configurations 8 through 15 (CSR pmpcfg2) on RV64.

The current code computes the pmpcfg index using:

  (reg_index * sizeof(target_ulong))

This is incorrect on RV64.  For example, when reg_index is 2 (i.e.,
pmpcfg2), the computed configuration index will be 16-23, which
should be 8-15.

A correct way is to use (reg_index * 4) instead, which works for
both RV32 and RV64.

Cc: Xi Wang <xi.wang@gmail.com>
Signed-off-by: Luke Nelson <luke.r.nels@gmail.com>
---
 target/riscv/pmp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 15a5366616..a1bee56c86 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -311,9 +311,8 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
     }
 
     for (i = 0; i < sizeof(target_ulong); i++) {
-        cfg_val = (val >> 8 * i)  & 0xff;
-        pmp_write_cfg(env, (reg_index * sizeof(target_ulong)) + i,
-            cfg_val);
+        cfg_val = (val >> (i * 8)) & 0xff;
+        pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
     }
 }
 
@@ -328,7 +327,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
     target_ulong val = 0;
 
     for (i = 0; i < sizeof(target_ulong); i++) {
-        val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
+        val = pmp_read_cfg(env, (reg_index * 4) + i);
         cfg_val |= (val << (i * 8));
     }
 
-- 
2.19.1


