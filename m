Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcKKF-0003TP-2X
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 00:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcKKC-0003R9-Rt
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 00:32:37 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:36164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcKKB-0007XY-2C
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 00:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634531554; x=1666067554;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k9+jJycySsg7FyDvzL/BjLcA82DkwIf3DJ2Mq2Bl/Jw=;
 b=jHw/fblU7f6YdN1866JMIQqiaj3MDsPOgjGdQVSo7b+jIdZsmYSZA0uG
 YemnX6X9790RSayRLSZOL9tb8UhOvBbHZU6sk0cU1lFnglLUV2mZuE2cU
 GIs/gVjH8qbVsI2LfILkUkS6+D2Sincb32IkOYv3X/VexlEYqaUK0GItc
 QS9vzsM0kkrr29JDxGryK+48XI8Hb8rhv/2CWBaZRPUt06p6OBN64SXvU
 Ij4B8UOcVxuU91DQXWdapEwBHGVCkBgtP/5+lKy9wc5EaJiGqtIthIG7E
 glxTV0w2LVdOO60ATqZ+c+yQ04ehNO1HAaVF7BvkXdNjMLs7pMk6aXfwx g==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="187922694"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 12:32:27 +0800
IronPort-SDR: 4LWLeAASx8rCmqeh8AqcxqA1AiQHcvpVs8gC6uSKjuFsQnq9iA8CEb7f5z9eUf1wJbarj8kxbz
 dVeXZyuiPm5o2RK+ZyITt5evTyyStQvFoYhcLXysXSmVMrCAitl7IJNh2xg75XW1xXG+YKd54H
 0ufobbOG08KFRGzMhLLmJJ0+i90YfSSEZS3Z38d8Mkyx0eQB4FTOyqQiJNaIyl1pdvp7KL4yrU
 vnXVPMrDKlixlOcx0TaP6l4grHk8nbkMcbJI6YwlI3Y87t+yI5M62IbwLGRQFoGpkAnhD7o3a4
 9jkEcpe/ipZO0cYzc2vD0E37
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 21:06:35 -0700
IronPort-SDR: 3nhVwS8FSIJtNSA33yNkXOQ9Ta7HBoEupv4mTtMCQHxScV0RBJz/3g00yZ5WEDoDV7cpLMDkQZ
 CxyJ2empCA0bV4PIBCDZREhunxwi7yXnTUbo0beGA9GTfc+LKn2efmLdikAInUsIiGMra/g+je
 J1zSle3gUU1feYzOLX0mUVmEPB7tuaXEiIRRtNlpYx/GMBPceaEgAmeqtbFT+dPY803F3sp/Ab
 xDpMAixMI9D/5qqUCxbPQco030RHh0vKWVL3hQviQanI5s4Y8vZfSytMhNRjurwI27wzkwBsZS
 lPY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 21:32:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXkVz6hFQz1RvlM
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 21:32:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634531547; x=1637123548; bh=k9+jJycySsg7FyDvzL
 /BjLcA82DkwIf3DJ2Mq2Bl/Jw=; b=VfNgz/BA3/tZXEmvLMtQZQrNndW35tRHg0
 Z+IoWzrNfp3PAQN6fNrrX172R6FgrUl5pIAheRGtPQNau+wYUDGsD3+MJt/ZmUgC
 DKGgmXi2RrB5D1uJ/P9BepDkvGEVbtHs8rkDw/kIA8FJkmL+XXbHDUw5y/MGlxVj
 HgcKFYs5IjtXIFD9Bkf+jwKnITCvl1qB1WBRK2R0JwpIKPJLhK6iSGCvo6ZY6TN3
 G6G9EPnQph/qEAZ7NTU+V1l916xVPW4+CI6KTCpn5wffS+rY+e0ya7q5oQ7bV1jP
 YlV/6J19Btj57GPsoTHo2yD8J0Mz6AgFURKJ7/8SJggyCVdAY5zA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id G5nDPKiQtcyu for <qemu-riscv@nongnu.org>;
 Sun, 17 Oct 2021 21:32:27 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXkVt3Qn5z1RvlJ;
 Sun, 17 Oct 2021 21:32:21 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 2/2] target/riscv: Organise the CPU properties
Date: Mon, 18 Oct 2021 14:32:15 +1000
Message-Id: <b6598570f60c5ee7f402be56d837bb44b289cc4d.1634531504.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
References: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 18 Oct 2021 04:32:37 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1d69d1887e..837bea3272 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -581,6 +581,7 @@ static void riscv_cpu_init(Object *obj)
 }
=20
 static Property riscv_cpu_properties[] =3D {
+    /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),
@@ -591,22 +592,24 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
-    /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
+    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
+    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+
+    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+
+    /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
-    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
-    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
-    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
-    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
-    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
=20
--=20
2.31.1


