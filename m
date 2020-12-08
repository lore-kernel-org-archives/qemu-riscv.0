Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmluB-0007xR-S1
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlu9-0007tj-Bw; Tue, 08 Dec 2020 17:56:21 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:57375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlu7-0004Bi-Ki; Tue, 08 Dec 2020 17:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468179; x=1639004179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2TG0lw4zTTE9K+65mX3o2BSFxGx4t2P6pw44PD0QoRY=;
 b=BZJ8o2E8iYQ/aHjHM+pxtvsuYhjSlj6nncRp2xTYpo/JD9TUab2CdfgI
 Hh+Jkdu1psdl9WfugB6qUG0+I6VZ7wV6zhUfhN+aDLdLc9Y5uO8Bu7i7k
 2tevKTTIPs2KxygLEBSfG6e1VIUmoUhv716KCCTJNxTDpA26w3fUL16wn
 ycJeuPlhEMzkBw6PxEKBjAoOH1l4d6bj0DwNWlG+1iqE/byAmDufqSjSF
 1dM4FQi+5K8adI81PEd7qegoN61YqYUA6mz5K1xDdM+qLTvKBGqehbOWL
 O/HO69QX5V7ZNWasbHXMR+/Tv6MeN9CRvL5ZxUktgUN+gOt/Dk+fx4F/W A==;
IronPort-SDR: FJyRLAG1+j6m9PKzMnh5YKNewUKayJQV4xcYgWz5VQ164GqN1+Lbutx/JP3FKEScf2Ia2WrcFw
 a5yCraXgJMD4wslCBGYOoEOt43wpPMkJ2BZcBT8mW1dFVy7brzs+BvdgnT1aeP4mr2FzRAsi8T
 vgsOuX49xVANjHsnhMF39rmU2BtrqLLrZp84URmjEdNOscgknGsA4H7Se2aXXdvv2vnrMHBFjP
 EscdYzacHvzzssDJxs5CiDNRTw2fWEAUEuJBRytdzyNe2NjmeARIe78Kculr8+7/nVrVVfRJLU
 mUE=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="159184100"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:17 +0800
IronPort-SDR: e05WHdM6zHwdk984De/zlFAzPKLeRl9TDllM68WPMpL+RLB0HqMw6NR3/MbJye2RFHkxDcTXa8
 3c9XAGFbNWjFlVuzHfC3HWIAusdDNFfJA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:40:18 -0800
IronPort-SDR: SHnP9Ua5rChsOullemTqRdxUJczPC99DDgm8oXPf1U9wq73s9P3a00C7vZh3sjlq6qqW1F4cPy
 r6tZpUzXPhfA==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Dec 2020 14:56:17 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 03/15] riscv: spike: Remove target macro conditionals
Date: Tue,  8 Dec 2020 14:56:17 -0800
Message-Id: <1dfbe037a4b61fc04e820f695b0c10d0adadf65b.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:22 -0000

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


