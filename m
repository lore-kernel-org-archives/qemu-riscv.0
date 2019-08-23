Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i1JCS-0001Ff-RL
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 19:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JCO-000187-1B
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 19:42:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JCM-0000JF-LT
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 19:42:27 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:38470)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JCG-0000G3-8N; Fri, 23 Aug 2019 19:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566603741; x=1598139741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vAN1dDLznPPg40l4N7NOvT4m5coY/hzIozIhrKnpjNA=;
 b=nIKmDmavjY5sBIwFNFSo7fyWxxgHbGKpSj3Zj79w2wv86HfFOkIt1D8A
 ZVt5gq3S7mu4dXo3Z9pAS8AqDLZu2/at9X2N1lIxeNMuIGdnfXrZWxZlT
 JXZbvAajtPhmSQNMHPuQW5+D7IWQ6t0KYQsTJk8zgfRlivXaLx5ozl+Wh
 zFnsOD1HtkoU3EhnlweC5IAiP6X9wbabiuRgCgcEqpDZ/KvZZl6Uffbb6
 vNwpdlTwQ0q8kHYD0QOo8MKG5hnshlMv9Gb/sI47ZXkO8jrxmrHW7dfSE
 ris+lfqQupEsE7n863H4wLD5uZk3BQlIRAKuyfC7LUHVdApzZDV7bE/YE g==;
IronPort-SDR: Bem2yzEK2KW99nu8hf0R7/5YcJwiUaHIskjdtZbEQNIGKXEpIrFNsA5XBUwcCfzXnXf1ZqInf6
 KSwcmOSGXDxq/HOpUkqNOe5rvCAWq2ein364/ZeOihKYSi3VcGVVfu7FEASKbZp1qy4yHns9Y1
 jAf4kT/PuQA2Jj4UJH3oM5mPe/+0Ef8DqryRlizdY7COfHVwhagex77Hq/UYSCY5xKcGwY1aJW
 DhHdeNDKmhmIKwgzmP3sieDMGkAgZZNPQ5mJaP+II5uE2cxdMmVhFIs0wqmEgLBs5iEyKH/DGd
 CCE=
X-IronPort-AV: E=Sophos;i="5.64,422,1559491200"; d="scan'208";a="117486899"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Aug 2019 07:42:18 +0800
IronPort-SDR: NbnQSKNJGY636EN5RmNOWEHxHPf7sxNh1hnkhT+4Defr4MtWzAOfj3TVRVvtvr5c0SsaggoYp5
 mw6H+BVoOqDwpgJIuEafZzFSZa+pdMwgwS4aY4ndfEcqrX6sYT4EzN4zECQJVhLmIr0sNbjPHO
 7urtjQlW7EsayGcuauZ/L54gYR9mivfQrEBi/yaAA+EIv/v4ZebSLF0Knu7zXkE+1P85GhO4Hu
 rH+j5DmSM7UwS7/LrXuKYUso+PnAd70GYI5NEEPUSn6Hl//4ON3qVuL//7KKNLtqIbbWcD6YEc
 Bz8fcinuVlABIWpGIeNnEFKX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 16:39:35 -0700
IronPort-SDR: 9gORWUnr0Q9e5zFHcsXb9cIRT7Cl94Cuqd/Gh7bkYaw6utYO4fXT4TsLiHtseUh4oUtVlQdb0W
 m/0v2uzGI/nz5lMedogViKnF1AW0Mw9mDfNBeiak9sC5Jw1NUp6MG5IXLPSePeuAsqoRBIHnhV
 3JOhVbqzh4TtPD608l3v40AHB0Bz3Wa6sgbySS9+cPlFislYERcA5G08EY++9GvAxN/IsIzKrc
 L5eF50LC5aNeH88knC8xBVlhWTEqko9H4MtMLl5a3685W/BFoODopPl4NzG2A2UT9nsRBSi1RE
 QZc=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Aug 2019 16:42:18 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com, alistair.francis@wdc.com, alistair23@gmail.com,
 Atish.Patra@wdc.com, Anup.Patel@wdc.com
Date: Fri, 23 Aug 2019 16:38:36 -0700
Message-Id: <d0a6c68c4af8e3f160cce19fea8bbd9f20aea0be.1566603412.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566603412.git.alistair.francis@wdc.com>
References: <cover.1566603412.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 18/28] target/riscv: Add hfence instructions
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
X-List-Received-Date: Fri, 23 Aug 2019 23:42:30 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode                    | 23 ++++++-----
 .../riscv/insn_trans/trans_privileged.inc.c   | 40 +++++++++++++++++++
 2 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 77f794ed70..cfd9ca6d2b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -63,20 +63,25 @@
 @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
 @r2      .......   ..... ..... ... ..... ....... %rs1 %rd
 
+@hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
+@hfence_bvma ....... ..... .....   ... ..... ....... %rs2 %rs1
+
 @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
 
 
 # *** Privileged Instructions ***
-ecall      000000000000     00000 000 00000 1110011
-ebreak     000000000001     00000 000 00000 1110011
-uret       0000000    00010 00000 000 00000 1110011
-sret       0001000    00010 00000 000 00000 1110011
-hret       0010000    00010 00000 000 00000 1110011
-mret       0011000    00010 00000 000 00000 1110011
-wfi        0001000    00101 00000 000 00000 1110011
-sfence_vma 0001001    ..... ..... 000 00000 1110011 @sfence_vma
-sfence_vm  0001000    00100 ..... 000 00000 1110011 @sfence_vm
+ecall       000000000000     00000 000 00000 1110011
+ebreak      000000000001     00000 000 00000 1110011
+uret        0000000    00010 00000 000 00000 1110011
+sret        0001000    00010 00000 000 00000 1110011
+hret        0010000    00010 00000 000 00000 1110011
+mret        0011000    00010 00000 000 00000 1110011
+wfi         0001000    00101 00000 000 00000 1110011
+hfence_gvma 0110001    ..... ..... 000 00000 1110011 @hfence_gvma
+hfence_bvma 0010001    ..... ..... 000 00000 1110011 @hfence_bvma
+sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
+sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
 
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
index c5e4b3e49a..b9b5a89b52 100644
--- a/target/riscv/insn_trans/trans_privileged.inc.c
+++ b/target/riscv/insn_trans/trans_privileged.inc.c
@@ -108,3 +108,43 @@ static bool trans_sfence_vm(DisasContext *ctx, arg_sfence_vm *a)
 #endif
     return false;
 }
+
+static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
+{
+#ifndef CONFIG_USER_ONLY
+    if (ctx->priv_ver >= PRIV_VERSION_1_10_0 &&
+        has_ext(ctx, RVH)) {
+        /* Hpervisor extensions exist */
+        /*
+         * if (env->priv == PRV_M ||
+         *   (env->priv == PRV_S &&
+         *    !riscv_cpu_virt_enabled(env) &&
+         *    get_field(ctx->mstatus_fs, MSTATUS_TVM))) {
+         */
+            gen_helper_tlb_flush(cpu_env);
+            return true;
+        /* } */
+    }
+#endif
+    return false;
+}
+
+static bool trans_hfence_bvma(DisasContext *ctx, arg_sfence_vma *a)
+{
+#ifndef CONFIG_USER_ONLY
+    if (ctx->priv_ver >= PRIV_VERSION_1_10_0 &&
+        has_ext(ctx, RVH)) {
+        /* Hpervisor extensions exist */
+        /*
+         * if (env->priv == PRV_M ||
+         *   (env->priv == PRV_S &&
+         *    !riscv_cpu_virt_enabled(env) &&
+         *    get_field(ctx->mstatus_fs, MSTATUS_TVM))) {
+         */
+            gen_helper_tlb_flush(cpu_env);
+            return true;
+        /* } */
+    }
+#endif
+    return false;
+}
-- 
2.22.0


