Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLw3v-0003Us-AT
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 19:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw3u-0003Tj-HZ
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 19:24:02 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:10519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw3s-00044h-Pt
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 19:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630625040; x=1662161040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fX+D9NkC99giVZdE2Z7T5c65nGBj+I1+KnYy8YTXeO0=;
 b=Yi0QX7cSRrXSELVzdz+GWgZqzZxCi9s7D3wf4gy2Ml8Jt2e8OGPgMEYj
 gJ9yBHVuruUWfeRWmydBaxnkCC4a72EPA7t/mimyqSf1aehtXxHDNZuDM
 YgHrLEe2KZVg2KpneWjx9ohm+4ejX1jEBQKJG+ooXfsJXCc3KKa6/kDCa
 flbC4pUBox4DUn8af8vIXWWI4UQwKr4mXp05jqImMN5zTLZ225jpZ6KBH
 Cc+tfqiYrkSHTVOmodvEOufsWRLItnHIwE35Bn+7WE1helgelYtTm4N3C
 SC5IjTUrp5TCccvRI8fllrJt23nwNIHPP1hOMJs5mAZinLdDlIVJElKqH w==;
X-IronPort-AV: E=Sophos;i="5.85,263,1624291200"; d="scan'208";a="179087158"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2021 07:23:58 +0800
IronPort-SDR: twWv7GFFBOmsN/CKKNMt3y6nRnng2AUSziA7DPemzwNCr+k9dm5/5MdQGyn12+RNGKO9juGQz1
 UHNTne8UfsnjHgfmTwTkvmCdxVK8N9mXJcQ7koUfXx1ZMCKzo1CtGJzSJNUL7mTP0nGO1zKB34
 rnCa9wSC57JBbVpNPz7DS7KRO4Myrt6l4i2ajkAnLse1LIRqjrv61GTqF2XDLmyjWjLq6RuDVX
 DABNOMneHyydnLwuN7UkbQtIhU0Df30nfPcRixB4SoMdaNNDNFqKBoBr6SKCUA1WAMOVA15kVr
 ifMynn9GUrditE4Z7amTxg27
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:00:44 -0700
IronPort-SDR: wkXF0WGZeQRdPxcHGQ8kxsIy7VPOJYzPs2ElJgCetFFkw5sf1Z5KKiTIU+p/LBm/IBvn2dKjs7
 8Seo7atYdKbwi+kxKdseIv+yV+tqI2H64rFWPGVZXY4lSRiZlhT0w0FCOrROyeuKqa2D2uSqmQ
 lvwIR+FPglQXFumnqLCxpvQHAxQeUxH9hzfCZ6abKYU2J8SyhSIJuukvHXuRJkQaFunq9WH+Ew
 kHd6+OvegaP3pk5WqqO/M8LWoNm11xAleyc92IJ1/lnmWaNzQ5nL/dffummSc/49n/81x6ZvTX
 rv8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:23:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H0xnp6RF8z1RvlQ
 for <qemu-riscv@nongnu.org>; Thu,  2 Sep 2021 16:23:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630625038; x=1633217039; bh=fX+D9NkC99giVZdE2Z
 7T5c65nGBj+I1+KnYy8YTXeO0=; b=k+2/NpwBSHeEPRttmzSUXqID0HfWo6S+uR
 qfuCc3OHUvKHtkWBtA8y3KB/Jen9k26a1lVrIHXOm20ZSfd64Bzm2WeUgmr5V6gQ
 jaQmd6Wg0aQlBmizCYC9PoKRlMHGPni8NRqQPjmS3HGvYYruCM0w99OTWCuruasO
 MdrvWEG/DPrOzEz6d6AxUajp/zEdqlNwUHPOXmsd/IyzIEvvS6gMhIlHbrkzv9HX
 paC2s5OX+wiUQlbEZ9HC00Si5NvoVdJY2VFsZMU84LuBVIW41WVNGrmpdKDjaQvk
 Nb640oFgomvhgaHo4R2nrDMnaOoUueAf4599ehpM/Kl0xDU69Klg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 90IoTJ5KCqit for <qemu-riscv@nongnu.org>;
 Thu,  2 Sep 2021 16:23:58 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.17])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H0xnk4ZG7z1RvlP;
 Thu,  2 Sep 2021 16:23:54 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 2/2] target/riscv: Set mtval and stval support
Date: Fri,  3 Sep 2021 09:23:48 +1000
Message-Id: <968ed1af9002f5f9f42f9efe8a5db5a1ed830a09.1630624983.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630624983.git.alistair.francis@wdc.com>
References: <cover.1630624983.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=8724dbd3c=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 02 Sep 2021 23:24:02 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 target/riscv/cpu.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6d41a16ae3..64ebb593fb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -309,6 +309,7 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         bool epmp;
+        bool mtval_inst;
         uint64_t resetvec;
     } cfg;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1a2b03d579..8b77526c79 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -437,6 +437,10 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
         }
     }
=20
+    if (cpu->cfg.mtval_inst) {
+        set_feature(env, RISCV_FEATURE_MTVAL_INST);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
=20
     /* If only XLEN is set for misa, then set misa from properties */
@@ -600,7 +604,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
-
+    DEFINE_PROP_BOOL("mtval_inst", RISCVCPU, cfg.mtval_inst, true),
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
     DEFINE_PROP_END_OF_LIST(),
 };
--=20
2.31.1


