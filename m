Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1krsr8-0006Hx-Kk
	for mharc-qemu-riscv@gnu.org; Tue, 22 Dec 2020 20:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61943049f=atish.patra@wdc.com>)
 id 1krsqy-0006Fz-IN; Tue, 22 Dec 2020 20:22:15 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:36646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61943049f=atish.patra@wdc.com>)
 id 1krsqu-0005Zd-A2; Tue, 22 Dec 2020 20:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608686528; x=1640222528;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E/VGK8b2YDZcqPNBX8/IqKOXpvt2J1CAIiyJJ938XLY=;
 b=fmkSwsaPn+Ybiy944I4p5Lmm/BNhqRDRCbAORnwGCxuzw7En6FO74div
 o4+P8r9CIAM1/eSv60907+xhs6hRAi5Uv6J6+T7wS17G694VkvSC6xNRc
 lFQ27BWSE/IcjujVcNOi7VBn68CuCSI8AggN1w2yGMwmrQRpzlgAr8aQi
 qswi4V1De0ncRQvDlZqp+uFqBChMh/5oMc9i3NNQ3Uhjomc9s9oxF6YsP
 dmKLz46xvK9R8wEH1fAoHKVp2GNqBOfykxB59j3Kb7dFhmJGPK474lajc
 EeyMNCVuZn1zC0avSYbmIPuvBY6JVkBeCA7Wg4wvzwDDI9ARux50txXpO A==;
IronPort-SDR: pMd+/xZ1HoEFBsL67EP6PYTBAm8SvbMb+9KFP9f5Kh22cJ0JsFcYsFx1xPlUyj+K2hggja64qD
 7MpnKKlsnvPOVXB6ntxBT0By2ck2ispLyrU273XLzqYC9Cx8XM40P7j8majbqfOpudRq1JNLs+
 OV7Hlvv5hymD58xKgN78eVJGYfA+BScdmS9ZjupatBz/YL3sSoThBnnu2TMNUcC758aCyOYtoD
 ABD34kWRIVTwHvGJBO9oXC0si6o17f4r5gfC1COmo3fb8sG3JkH45EZ9lD9KcoFMf3wbPw45TG
 ISw=
X-IronPort-AV: E=Sophos;i="5.78,440,1599494400"; d="scan'208";a="266055894"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Dec 2020 09:22:04 +0800
IronPort-SDR: hAxZmZO82LeXYdWIopcob205qe4J6YhHsOUSAhjKqjOyDA3X+QrIZj3aQweLLcGhvMg5zaSJI/
 SO4OGyEEBa88/6P0OPHr+utpkCRoSZZ7G99zAFX/acz0+UD/Zm+ApHNJ/RW8qxoMvja2BXmDj9
 cTVByhgqgksPaDxIJgjuxlWHwcyXYWaYfhhcBDxixQFj87Z2QdSAwL1FfN4D6NJc2Tj3ykULay
 IX7w+sW7JABCp/SAiCdA8xix8L48NWL5+nXhn8hkyXURUosnZGPrW2jDlM8EucSysfimuT1ZPO
 YPUSkwyobk2nElGmNBBGWcoU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 17:07:14 -0800
IronPort-SDR: 2xEY8m3S7LporWD6+2QU5nxKKb5CJ4RRD2UTAgikesMVvZRVwQe6fVTFuE8vPyv87UjmCeaST8
 IWE7oPOmtEMYyKrOkh4xC/dzc6p0khz1kU/IFE8rdlL1byZsCVCH4dBC0MN0Kc9nq/+flFSlhl
 fwZOwU4uxNwvtjfsSBJcbya5NwVAVsNyJDyW5K/LvDuAx1ULthXwnsb/jba47CYzFBBBs0oVMC
 elrNXL06AZ05OXwDf8POGUj/WHYHXcPzhxwuPko6W8FcOrOw4TIB2dR4bOjvsRa9od+PoTmg68
 GoM=
WDCIronportException: Internal
Received: from usa003310.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.100])
 by uls-op-cesaip02.wdc.com with ESMTP; 22 Dec 2020 17:22:04 -0800
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH] target/riscv/pmp: Raise exception if no PMP entry is
 configured
Date: Tue, 22 Dec 2020 17:21:58 -0800
Message-Id: <20201223012158.4146439-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=61943049f=atish.patra@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 23 Dec 2020 01:22:19 -0000

As per the privilege specification, any access from S/U mode should fail
if no pmp region is configured.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/op_helper.c | 5 +++++
 target/riscv/pmp.c       | 4 ++--
 target/riscv/pmp.h       | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index d55def76cffd..1eddcb94de7e 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -150,6 +150,11 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
 
     uint64_t mstatus = env->mstatus;
     target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
+
+    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
     target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV);
     mstatus = set_field(mstatus, MSTATUS_MIE,
                         get_field(mstatus, MSTATUS_MPIE));
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 2eda8e1e2f07..fbc4073fb359 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -74,7 +74,7 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
 /*
  * Count the number of active rules.
  */
-static inline uint32_t pmp_get_num_rules(CPURISCVState *env)
+inline uint32_t pmp_get_num_rules(CPURISCVState *env)
 {
      return env->pmp_state.num_rules;
 }
@@ -237,7 +237,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 
     /* Short cut if no rules */
     if (0 == pmp_get_num_rules(env)) {
-        return true;
+        return (env->priv == PRV_M) ? true : false;
     }
 
     if (size == 0) {
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index 6c6b4c9befe8..c8d5ef4a694e 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -64,5 +64,6 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
                          target_ulong *tlb_size);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
+uint32_t pmp_get_num_rules(CPURISCVState *env);
 
 #endif
-- 
2.25.1


