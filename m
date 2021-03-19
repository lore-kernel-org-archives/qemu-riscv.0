Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNL4E-0006eu-Bs
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 15:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=705762e65=atish.patra@wdc.com>)
 id 1lNL4B-0006cs-9W; Fri, 19 Mar 2021 15:45:51 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:41236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=705762e65=atish.patra@wdc.com>)
 id 1lNL49-0004NN-64; Fri, 19 Mar 2021 15:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616183149; x=1647719149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7LFAVlfnluokk96bh0DF+wPigO40D78aBv7cZ5JYhms=;
 b=Feh3BieXY9pSF7IGtP80PBU7XYCssm6i8mYaNxhD+m77+q1m+ivhFKRT
 O7lV18Z4ehQn74WYvuIbFbFZY9y142TP1BN27G9EQm3PItcHw/BfsfPuu
 AYCIDYgJt4WD3RP4DPXYWVvMG2xMnKdIta9er+ar6OheXa3nbsaZeo3Nt
 HaaVzlp/xaSUmLaX5w9DXr2MeDR9csedmmf7SdiwRZguhvoFrRDcxTuMW
 PCIZ5vr2Ikr4rKSzqYBAy57My3+6B1L3Fb+8bwg8SJLVYW6dRNvgj08i6
 rQq9ruhyoDAmEenRVTlTZJm04R8Vc911cwBOd/PfQOW8PFx/ASaniDGup Q==;
IronPort-SDR: OEAUv6CAJa/JfFgxm2p5avIBLA4SNRpw8Lcp+78F3YZWuiQfdXFdqBEiJg8qFUe7OeHv1hXH8X
 GrWIzuLFEHlkKvhJfV6zq+IhRHUVcESeAvTiGAri+k2l3m81JHSWOag9HYN7X1jCn3Yoy8ZI91
 Sf6jS8pOzskLOaVbtQ7Cx98SgAjKOTrmYi/WmR8U9lU3TVyc2WHI9NZHeAT2fbcp+EWb0VT/dM
 ESljTy+3SulPLM3MQwOMkzzpfmSyJ7GR7SJ7t/QoJNBZzgB6nguiQO8tBX0GqWR+noXmfRbW3/
 JfU=
X-IronPort-AV: E=Sophos;i="5.81,262,1610380800"; d="scan'208";a="273319148"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2021 03:45:42 +0800
IronPort-SDR: E4NQOtXcm2OEZDdzOWYF09bMb3leSSvaRzDdHCx44aGOXRUzpXd7Dd8E86v01h+WedkvCSkg68
 YUQ8NZPFRtiyDPnVX5rKYtjaL0iP62nzWwGHMAo2OGTJk7w+knM5MrkT6HCfRo2pDyYlEXubcu
 4X8m/3CisZc6qy1zEX2qYQKmfhK35c8ljNKCrgsG2JIAWf9gYh6JulmwoNYLSI8aU739Axn4B/
 qmwWMGiNHRH22mtKDBzbZNruM5hq73iGIs/4NYQmRpPdOibart5gs9Qz5u8kxj1g2EuxSi71bF
 gLT0IsXlligbPiMTsg9UYmKn
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 12:27:55 -0700
IronPort-SDR: kxCCkn49GBP7d0xFBi9D44tiNviCZny6mqDEm04e9Zy0qyz+nV94pm5t8tmNcua6gJROnVRWJ+
 W/WL4qo54PT+pKuThlMNNan3Ns2QN1o5ygrZ5+QHwj4DYFLO1cId997HuP3rykXuRiCjZMrqKL
 ekMWRVb2KcQu+xiySQycp5LZ3e4DbYnfXMGb3F/m3+DvsKYgOoAREPj2N7FfRc0KLdd9xa9zBJ
 HipJfjbpVz/E9ZjEXisFON3dK3KXCYej4E+Z9x8HBramYDxcR60UE/qqWlRdl85OEBbDw06bev
 QR8=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Mar 2021 12:45:43 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, anup.patel@wdc.com
Subject: [ RFC 2/6] target/riscv: Implement mcountinhibit CSR
Date: Fri, 19 Mar 2021 12:45:30 -0700
Message-Id: <20210319194534.2082397-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319194534.2082397-1-atish.patra@wdc.com>
References: <20210319194534.2082397-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=705762e65=atish.patra@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Fri, 19 Mar 2021 19:45:52 -0000

As per the privilege specification v1.11, mcountinhibit allows to start/stop
a pmu counter selectively.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/cpu.h      |  2 ++
 target/riscv/cpu_bits.h |  4 ++++
 target/riscv/csr.c      | 23 +++++++++++++++++++++++
 target/riscv/machine.c  |  1 +
 4 files changed, 30 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7bee351f3c99..ef2a7fdc3980 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -214,6 +214,8 @@ struct CPURISCVState {
     target_ulong scounteren;
     target_ulong mcounteren;
 
+    target_ulong mcountinhibit;
+
     target_ulong sscratch;
     target_ulong mscratch;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b42dd4f8d8b1..7514d611cd0b 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -283,6 +283,10 @@
 #define CSR_MHPMCOUNTER29   0xb1d
 #define CSR_MHPMCOUNTER30   0xb1e
 #define CSR_MHPMCOUNTER31   0xb1f
+
+/* Machine counter-inhibit register */
+#define CSR_MCOUNTINHIBIT   0x320
+
 #define CSR_MHPMEVENT3      0x323
 #define CSR_MHPMEVENT4      0x324
 #define CSR_MHPMEVENT5      0x325
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 7166f8d710a8..b9d795389532 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -631,6 +631,26 @@ static int write_mtvec(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_mcountinhibit(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    *val = env->mcountinhibit;
+    return 0;
+}
+
+static int write_mcountinhibit(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    env->mcountinhibit = val;
+    return 0;
+}
+
 static int read_mcounteren(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->mcounteren;
@@ -1533,6 +1553,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  any,    read_zero },
     [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  any,    read_zero },
 
+    [CSR_MCOUNTINHIBIT]  = { "mcountinhibi",   any,    read_mcountinhibit,
+                                                       write_mcountinhibit },
+
     [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
     [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
     [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 27fcc770aa4b..cb7ec8a4c656 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -177,6 +177,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mtval, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
-- 
2.25.1


