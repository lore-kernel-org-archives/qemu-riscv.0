Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouY8-0001WT-DV
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouY6-0001Sc-VX; Mon, 14 Dec 2020 15:34:26 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:60603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouY5-0007uP-4F; Mon, 14 Dec 2020 15:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978064; x=1639514064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OJ/IIk5KdshSCa6Fmwp0UBqjFWeip0nA/Om1IZzFIUI=;
 b=B9mwA46zzm6V1C8qcu4bHQFf4JvtNIC0KL/ZXqXptbGHYjAeNUOa7lj1
 vF9CO4ZnzcsfvyZLrnx1CqA2vhU54W+bixq5Q6MkLXKORf8kbCl3nwi4C
 Ig5xjJ6+2ld4g9il3Zx5APwB3kA+HnwJ5Ze2dHNzCHzIp8d7CRGrquMU3
 nZsRoBR/RxcphKkvX5TJ8EUSRJ9fnxmNeMGVIE+YC9LXRavSN+98T8aDX
 FBC0rPd94qwyvo7N0z/iQc783vsfVsIdvoxu0sT+hxLIcx/oCXIBYPTGa
 gHmaHkDCsng0AMSc/slx5CgQ/dDsyaK6uEn8kElFoHozOMT3fBHkHljwk g==;
IronPort-SDR: HiefNa03TESE6mH0gbSkpw1Sq5es3uyzFrHHxz82ujy2GT4olVop05SErPAIsObwGuH7cezUBH
 nIez/VU9JS3XopgUYF476DHFMqMfqwByK5UygpP/qlnGFM9S+DauuhfJzxPpictsVy+y8uJx7X
 i9qmKcURruE/CJ6Wbv6Y8fxvxn+jmt274WykNY9Vk8s2qJhvf6GTYPgxbI/IEpoKWBQym+U8/t
 8DqKErTH6pthHEzSy3en/TpYVdjDSSAjiBXahdEwETEfSzO6lm/PHSDXmKHih1u6EAp1P/w+0f
 Rrc=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="159586002"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:23 +0800
IronPort-SDR: g+3KyCuILKElReSwUwG67BqaojDZqkxzo1taU+eweiFRJzyYK6EZ1myW2nYhuebIg1FWW8NoVZ
 Iap39h31YkkYZ6Z4hR+ELm525s1Lht/HVmWhuPqnfKXYexxSUOt9Cfcc6FtLHUIQm1jN83NJ4g
 KeCqkbusv9g3hWtslCffxw6qEjBt3Vpmw8SP0iBBJwZpyU1+pWLbD4GzmPSKV9MvvjXQRCbPyS
 CIzlR49ZqqWnNJvywIN0cY6HYUhbdVZazh6xM23paICsnbjxq2jWfmsBWARrt3ud0HVQO+xITj
 B0ng83aH2BtuC8U0gzMvm7wq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:18:07 -0800
IronPort-SDR: r+R1IJXcs6ESryIQihza4963HT9MMhiP36r50Hy6EL1e8ZwTD1psUmhrC2Oj5+zicLQ8tAKYcP
 nwTvJo7GwkkbZOYhW6pybWLvjCWoWkE0Bjh0RygQDsbme7KZkgIZDV1ZRmpXuYQOGLPlSAWQzQ
 gac6CqxMO6IeATsIIEx6eWHUuiXrseS39TXcF35aINnwKe4ijDxqY1C1QV7qXqpXSqJpcxs5mD
 UJMJFa4er5+WkzK/eMHKt1iMlhN82Icu6jjzv+XfJFeSQkqZKFvdMQ5toS6/J/51YSsVS7ZtrP
 Kqg=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Dec 2020 12:34:24 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 10/15] target/riscv: Add a riscv_cpu_is_32bit() helper
 function
Date: Mon, 14 Dec 2020 12:34:23 -0800
Message-Id: <a63751df8b9262ce91a86c07e6749efc0e391e98.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607967113.git.alistair.francis@wdc.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:27 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
---
 target/riscv/cpu.h | 2 ++
 target/riscv/cpu.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9c064f3094..6339e84819 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -384,6 +384,8 @@ FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
 
+bool riscv_cpu_is_32bit(CPURISCVState *env);
+
 /*
  * A simplification for VLMAX
  * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6a0264fc6b..32a6916b8a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -108,6 +108,15 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
     }
 }
 
+bool riscv_cpu_is_32bit(CPURISCVState *env)
+{
+    if (env->misa & RV64) {
+        return false;
+    }
+
+    return true;
+}
+
 static void set_misa(CPURISCVState *env, target_ulong misa)
 {
     env->misa_mask = env->misa = misa;
-- 
2.29.2


