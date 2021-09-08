Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNpcE-0000ip-3b
	for mharc-qemu-riscv@gnu.org; Wed, 08 Sep 2021 00:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=87817de26=alistair.francis@opensource.wdc.com>)
 id 1mNpcC-0000fY-Ik
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 00:55:16 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:17723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=87817de26=alistair.francis@opensource.wdc.com>)
 id 1mNpc9-0004Jv-Pe
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 00:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631076913; x=1662612913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LpOad2nvuMiQqd52ek+2sI6Tr0RTCGKCgSGSgHgcKLs=;
 b=obtphJipt+ZCif+/6oKA9PSbllXunjSOitDizhnL5I6kYMxSYx4ym5sU
 c7wa+TYQGIlJj/qQiH6dwUnON1En5/5EvwvpEQfZmzfqixkhsH9pBA3db
 bn6XiHNsiAQyDy/GNuUkMW2OOQYOp2KBOzcO0jnezT9I8QvRWprCXU4tz
 VlwV1Y4uH1uSEkQKFzOrOQdzMhkWex2dv4MK5AkqBhATLV6rhDLjByA7R
 dJtUWB5KqPBe3pLBT9wGlQ9G+pEkM8SZkGOViMO82HaTgXaY6h3e2Q/SO
 6kYGdnFHNtUF+uHtoIVZUuZ8mmWX8P0TgNFr4g2EfTReM4xL5s6V9OIn4 Q==;
X-IronPort-AV: E=Sophos;i="5.85,276,1624291200"; d="scan'208";a="283234112"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Sep 2021 12:55:09 +0800
IronPort-SDR: TcoHbjdFuDndwVkuPAT3eialMtHgZbuGWZmiuVSnvhc5gSiAVmBuo8N2PTBUvLbxygXCdRnhB1
 FDUgdcZa/BtQs7x4S3I4V4BvCERlfiBNmBsEeHrCbGhYpZiMeg/UTGaoXa5G9sZr6ILkhbO5d0
 g98b6tQVauOnHjw6+omANLCvAGSDNLS6A5uRxtNOapMRndx5NvvzkdAcF63nlUA979dYnWxv0x
 OTHj/ciLzgCjUVPW9iPQPznDflySEmqNrWhgNZ2Vvt+apI/ECdb4hAn9h/w8FVdJrkbbhZ79fw
 psoiSQx1BBIn5J/DXQejtgsK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 21:30:07 -0700
IronPort-SDR: KH7wGYE8QqhSPMXeC8ZeTM/5DizZPUG+4GVe2uTrD+NELGGrcpey47EbDSE7uvQnkHagf8e7jL
 k6i+ra3r/vmroFBBathAGdEO9eAWzZAB1V17HxQ47+f3ZV6WUSKxp3pzVGR9YWWf1XpyQEkcYN
 hVXsSRT1gBQGsh98dfIXmRMcBgxoZ2M3wV/IeGuMptPm51kwOl88djwKQUvCdLSkaLNqJHTHWW
 ZDw9cC4rsMZ+ceKghmy9B168hxuZ6DDTKgkTOuE7CMfyMLRSHG1pT8KxRHQr6cxLMhKhnKxOCg
 AMc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 21:55:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H48vd0J5Pz1Rvld
 for <qemu-riscv@nongnu.org>; Tue,  7 Sep 2021 21:55:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631076908; x=1633668909; bh=LpOad2nvuMiQqd52ek
 +2sI6Tr0RTCGKCgSGSgHgcKLs=; b=oo4zmYH38Z8SJahEc0R2N4K8fuaSdXk1/+
 mLXadFSU2IENfQVOTcru0ZUtTWUxpw/wnDq4JBKEZbaRNEaHjxtwY6zCsnXFcYyp
 3GuZQcydGIjaeLzVW3E2ZFFnOYmbxHawcdk89WC88BfXswy4IruUNbt5B7GbEMXH
 s4rS/69E0xA1j9BGZMMqEQ3a5Vx/XLXZ12E1OITSqB2Wf3WyO793ACmZ556YyaYz
 bquzSWaXASTWCJdjBesBxgYVjjLQKbVYbUJX42i2WwOW+rBkFu1BaUquHHMGdYWs
 N5UKeZrR7lnTisVb7OkdmzKmYUDnl8bBhy2U2K6UwCTiFtegpw0g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id hMigmLNWDxXB for <qemu-riscv@nongnu.org>;
 Tue,  7 Sep 2021 21:55:08 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.20])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H48vX0p9qz1RvlR;
 Tue,  7 Sep 2021 21:55:03 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 3/3] target/riscv: Set mtval and stval support
Date: Wed,  8 Sep 2021 14:54:57 +1000
Message-Id: <be4c59ab0a3468f1962671e7cf5a947c151d31d9.1631076834.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631076834.git.alistair.francis@wdc.com>
References: <cover.1631076834.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=87817de26=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 08 Sep 2021 04:55:17 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 target/riscv/cpu.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d11db1f031..5b0bbf2fca 100644
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
index 1a2b03d579..537f2af341 100644
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
+    DEFINE_PROP_BOOL("tval-inst", RISCVCPU, cfg.mtval_inst, true),
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
     DEFINE_PROP_END_OF_LIST(),
 };
--=20
2.31.1


