Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouXp-0000lg-9l
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXn-0000jN-OL; Mon, 14 Dec 2020 15:34:07 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:42384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXl-0007rn-Pq; Mon, 14 Dec 2020 15:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978046; x=1639514046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2TG0lw4zTTE9K+65mX3o2BSFxGx4t2P6pw44PD0QoRY=;
 b=Ls0ffJINFs4mDkcQk7SP3gqjnIC5MVJashTcCNEOOIHTLkTcZXCkYayd
 Vv5L5Ei2iVdxpqUalUT0AiNeqMh4L0TAvnQPMHOuEuiftMuR/+HI2pqJD
 eeMo1h6Fa13mmRuPyKTdFu/PEMDO3Nc+t6nEfXImSvMXZPiRnB5K65zyN
 Zq4RteFd4i6dy5GJuVLymnUf76GF5cr7eZ7PEGxv/A+p6Bn5p+ClsKbmX
 17WzpvhlhiI7dUW+ihEDCC4Ad2wv3f06mW95ZSl9CxfQU/LRYWNcG/g+G
 HttzomOb/i01dlfRAXhDiWZSXCUay7zta43kALq13UbC4bO33Yc3SK0ru Q==;
IronPort-SDR: /iRqPOKceRA8AuGWQ7omYeKDrkmJhQAh6cLn4566LeiRIg3DAjKtWsrYjFg65Tl0Tq/4zUwXSv
 reE4+VOWsoKCMbf4Jq5W/VUi/stM551VXmtBO5T5011/n9h5pQBE/LfsTpbe2dsnq3W0OsnHR8
 sHERBDB3xn7TWZamP8mQH39AejUqBrnaSMUo3dEoqgAWCviWyX60mCTRpnlpBgx2n1PwPgFRWC
 6LMm78dEl1LBEwrPek09mZ8MtSyk3GRI3Xa3dfaP2A0dSXSlFMotK1vq3e5OxrU5vJi8Xj698C
 8kk=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="156338105"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:05 +0800
IronPort-SDR: 3TPL6pfZXeuQmPh38eHJENhJczXpnOZKld5vk6VWUGpOP5SfdOlcqTqWldQVj5d/DRmUGae7p8
 96t3AIR5wbx2eproXT+rvkdDQACGftcBflizdTDwHkNiwtVqLz6BeWNgdQYW69rLWdUhqYZ+lB
 jIjHYfADJ2P3saLPuOI9eeTfk2UptmH54E51GEZytRzwS58FDfsP2Tzye3B10BWRUSswbEA3Wg
 8vq6NF6B7rgPuqqDQjUAyKspOwDpD+Cc80hhJMhiLaM1uvFPb6/S6BvZTbWCcGjbYJtpfz1rNZ
 KEP7rebz7rGj1JgYfPshaRJn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:17:48 -0800
IronPort-SDR: OorjMNRskJIA6tzYYOKBj9dxvjSG2/MSrjvzXKBUVMGnY0ZKd62KxsSByKFC6QODivqARHGGgo
 4kq0qYcZ0PY+rptyEpQEGqBKUl8JLhhijea3KpJUIOH6eKXl22rjmg4U/PdP6wr5OhPpt6yRKZ
 9Y1Rf4l5RkI/elgtMd3C4qyW+oMtJCDJiKtnoob3OIA0vZ7wEOu3j0UTYvXKCdtCwXY3n0mUDE
 sWgZuX0vd7mD52qLAf25kuTAcluNm5EGGHdQlsAjxMDh7Sav3LhAU2BTMHxdkOvPqng4hnRYzv
 Tvg=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Dec 2020 12:34:04 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 03/15] riscv: spike: Remove target macro conditionals
Date: Mon, 14 Dec 2020 12:34:04 -0800
Message-Id: <ea39b9fcd798731c15db1358589ce759fe877969.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607967113.git.alistair.francis@wdc.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:08 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
---
 include/hw/riscv/spike.h | 6 ------
 hw/riscv/spike.c         | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
index cddeca2e77..cdd1a13011 100644
--- a/include/hw/riscv/spike.h
+++ b/include/hw/riscv/spike.h
@@ -47,10 +47,4 @@ enum {
     SPIKE_DRAM
 };
 
-#if defined(TARGET_RISCV32)
-#define SPIKE_V1_10_0_CPU TYPE_RISCV_CPU_BASE32
-#elif defined(TARGET_RISCV64)
-#define SPIKE_V1_10_0_CPU TYPE_RISCV_CPU_BASE64
-#endif
-
 #endif
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index facac6e7d2..29f07f47b1 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -317,7 +317,7 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->init = spike_board_init;
     mc->max_cpus = SPIKE_CPUS_MAX;
     mc->is_default = true;
-    mc->default_cpu_type = SPIKE_V1_10_0_CPU;
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
-- 
2.29.2


