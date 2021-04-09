Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUqA8-0000uz-Vu
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 08:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9y-0000np-6R; Fri, 09 Apr 2021 08:22:51 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9t-00010N-AF; Fri, 09 Apr 2021 08:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617970965; x=1649506965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MaZjC7FTVAJ4nz8xz4oIR7br1hWd7l3UKYGeioVXxKY=;
 b=A/NwjuCl2gQMYGV0WcQFkzSZ3r6rBlx6io/wqXAzLAFK+tl7x00K2nm/
 NATLVOSgnI6xu9bK+A5QUWbHvSvKpJhjir6bb9YwdcVf53JaQ7fwKdmvr
 ibbMw3wkUJ71NI2sEughlgBPehcPqLz4IKWD9sTq9aPpnF2o7UMr78YBN
 XzGPEVdQs9upj+T5EnZh5rd7KTEFsahFKOkmnNhH7g6MrE4CK7CxOu2jM
 XN8xheJm3XY23gYIIfN23sc4R3u4+9bXmGUie0UOw/WOCbbpMoltZ0vnU
 GN+enGLm5zVfgkZr78f+zn4AGU5XBz3KlnGOwNJMHD3LVj0AX9Cxjr3jl A==;
IronPort-SDR: 17yiU/6rSbYbLhg22KAOoXlhnSGwiEYc/Eyj7DH231zT/SXyVCNyhaA1mtD91jJhLsWyzlV2W4
 fAJRL8mDVrpNnLkrvIGb9YOdZsJcQBOfXS8xpNZq/geW+bkMT4HwCxxeqReMU+RkDoBffS3GL7
 IHfGvfc5NGfFokjAPH4NICpTMUPvBYGoit2muI17yWyrUdArfp/Et6bT1zz+D09XCMIeSTD2jW
 tyNALyR59gbE+yYPMpXasR81CFWCyAEKUfJg1QfnoAywKGCTOwM56mVtrGnHgoWLWxpm/kyq1A
 3HM=
X-IronPort-AV: E=Sophos;i="5.82,209,1613404800"; d="scan'208";a="275175992"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2021 20:22:43 +0800
IronPort-SDR: 7eNlGqUHal00/asoyAyf3IhKtVwhFLzJwbpTsn5Fc/kXQeuXSrpAjUSJtYhJhcFXwigaW0hFxO
 fzMA5y/p3Ozr1w5wFPuaebV3MCpXrb0+vTcsxtIWnAxXUmoMiHj+0v/1tjmwOV84KerSgufAqK
 SKfg1DwfEXmZ6ulpxDQ1J2+v84gKFbe5wA9zC6BErdo5hz+jAcS4nLNcs/kkomGUY0SWRx+Luc
 SBhE8Qw+lZYjCSr78NfHHCMFBTJsp64ZSkW7DQwbcrYTzhePE9EIF3Xjp1TNSy/vE6GgHPM0EC
 qjJmMVifbo65DrqD6uo10j+E
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 05:03:53 -0700
IronPort-SDR: 8D62nr0HOO3ZLF/X/5L+gypC9DPbdIx5mCJTgEzdpUATj+1ir85r7BR5PIcXTlDfhDg8XmTCgV
 rtOmv3nqbind7i2e+lKL+zxbbBgILm5jp5kmtHFrDcGkyC8H5/I1S1Xj14iMb93LVjZ09MpsXJ
 OPjs3Cbs/6hMPm/GiCEf5YdaZIAXCzisDg/MP91EOmvWwqXCWsZ902AxcMtf+lC0TltKfw+hJu
 jTnFOgMtortD7DKDO55GrWeZjMHTW1mid/Y08mQyXGdD2+dQ4LqFv1w/arJ3V/ppS79ON1/2w+
 0oQ=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.98])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Apr 2021 05:22:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 6/8] target/riscv: Add a config option for ePMP
Date: Fri,  9 Apr 2021 08:20:40 -0400
Message-Id: <eb98bac637e2ac2a22332bb5b364f57a0fc3f318.1617970729.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617970729.git.alistair.francis@wdc.com>
References: <cover.1617970729.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=726c96411=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Fri, 09 Apr 2021 12:22:57 -0000

From: Hou Weiying <weiying_hou@outlook.com>

Add a config option to enable experimental support for ePMP. This
is disabled by default and can be enabled with 'x-epmp=true'.

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Message-Id: <SG2PR02MB263458D195A60A57C05EBE9993450@SG2PR02MB2634.apcprd02.prod.outlook.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h |  1 +
 target/riscv/cpu.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 83b315e0b2..add734bbbd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -304,6 +304,7 @@ struct RISCVCPU {
         uint16_t elen;
         bool mmu;
         bool pmp;
+        bool epmp;
         uint64_t resetvec;
     } cfg;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e530df9385..66787d019c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -412,6 +412,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     if (cpu->cfg.pmp) {
         set_feature(env, RISCV_FEATURE_PMP);
+
+        /*
+         * Enhanced PMP should only be available
+         * on harts with PMP support
+         */
+        if (cpu->cfg.epmp) {
+            set_feature(env, RISCV_FEATURE_EPMP);
+        }
     }
 
     set_resetvec(env, cpu->cfg.resetvec);
@@ -554,6 +562,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.31.0


