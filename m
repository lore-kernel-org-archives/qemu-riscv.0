Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbRc-0005I2-AD
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRb-0005Gg-BL; Wed, 16 Dec 2020 13:22:35 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRZ-0000KE-Ky; Wed, 16 Dec 2020 13:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608143419; x=1639679419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dIZhUPPnS8fRBpzxHuUtyzyYpCZdc5azvxeYlWE61A8=;
 b=rflf212s7woYt15I8mNqukNq6rcSPVENPEO0d9KUpTeWc65m7K6sV6CX
 ZVZz8j7fVuuddSK3XR6+ZJVKgzGO02vhjdAjsDQjWKqKrSifEE1H4uXbT
 X846amMjF8QrN/cQnCHEcSWmai+qWtD9z3TCgtbbR9f1Bkaurscg/E9+V
 fSgzjejdDz95CSexgeGqCXrt2skKlKXIYyfuCoIkC/EfYhH7ZNva/IQBT
 p8EFsVOylMYIu+czh+nQyULmUl3Dz+GP8fUMAKJPJUPhB/4hv7D1pHtIj
 MWrovShlCHo5apxQKdmxHbfDW3GRdEACRolRYLUVKR5eunJFAXKIT2PWl g==;
IronPort-SDR: 1cYEzhBNKU9CqEslsHMxUueTrIU1hQAZxXi4djfiT58Qqf9+WviUnQwUi4Z1aj6/elvbjQ9yB+
 TDtP3GbMqI8BF7TjDyN/pyv0btEgXWk8kwkcjoxKObP2SZeD/5h1lNoh0W+7alIvcgx/84gD0/
 W7HXHOOlaWAJ0B4ZVH4TDMuLCwxjyrt+ncCidYkrCiGVIAzJsWOip2uo31k6Dyc3WgsDNBFNBM
 LjfbXhqba2SvTtFDINT8AIrHnHosvHwV1+NPlQG9lzz7Ynh1rSJUH+HVrzy4Nlc7068sL3YDVz
 kVo=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="259080343"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:30:18 +0800
IronPort-SDR: bNRcdLuHEruJcXo7aiCGwLJs9Jvy1klWtJUlq6pyXGXfHxT1uEq+w+/qiGPpTZTSqnXlvmP90I
 SVHzDdu/uZzaDnen3rcMB+KsDxAeDGagPSSQ5sgqlMaVevApnTMc4UPyb8pXvsEnKbtFCWOa5K
 2KTYjOROYcsGnUv2comJtUUmyRMKsll86enlAlCvYJYliOBVWEc+3yzKcM2xM+NGsBp1kFIpob
 6rfcyjUjKY90rogpuo8BhTeZ6v7bY0a8ZLAOJhfxQWMvTX5UKnvv0Dm2eutfmOPzQLW2afJabC
 tKXK+b1WGeKt2TAfedoX5Rqp
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:06:07 -0800
IronPort-SDR: T1/4RBbyRaN16ih5DCzX4VeymoHfdurKdDGVDIRNiomHEVaIbcFJJKCi9yo4JGSnIHdOthej/4
 jMpmqMsL//z1BDcEsrYjvjVh2sjIO9/F0boqyrPNHhsTqF+0vCiTZ269RhSgB0n4gSw2TOyW1M
 jeLRnyWDZw68tQ0VII61A1nQQJQ7A973cUMZAz6iM/ieAUPi6eSVBUSREFSh/A+RiEJljqeXIK
 YTA1+6zAvOTciHeOWfDZrMeJ5rf3gHclT0enzBHHkzVvFCWklVLU7I61CNMeAenLXVa+DzFDMD
 HzA=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Dec 2020 10:22:33 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 03/16] riscv: spike: Remove target macro conditionals
Date: Wed, 16 Dec 2020 10:22:32 -0800
Message-Id: <04ac7fba2348c92f296a5e6a9959ac72b77ae4c6.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608142916.git.alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Wed, 16 Dec 2020 18:22:35 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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


