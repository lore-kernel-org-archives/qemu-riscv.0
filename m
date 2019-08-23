Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i1BRA-00021a-LT
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 11:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1BR7-0001ur-HR
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 11:25:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1BR6-0000Et-EE
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 11:25:09 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33705)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1BR4-0000DR-7o; Fri, 23 Aug 2019 11:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566573907; x=1598109907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ksFRuDOVK+nvrJfNMPopN/I2U8vPsOLgk90V/grIQdA=;
 b=jmIVx29166JGKXRTpBmqBkacoyEqk94unEbIuEFGqOckEw/OQkb+0Fnb
 HuVpG0hZJdKhxKCJr7/xiar8L5+gjcF6o23K2Hxjb0WuHmUi3SpMwPj72
 G+/Y3yqoKGQhtYiEVhDBP+Rd3gIOKkflkIm0nSg5Jsf8kq4PR4WydMK4p
 1VyZ323gST/1m8bnx3/KKWfvx0SVg/2rkAbP8SapPWKUkdsnuJq8ARb/Z
 sCG8ODO2wojgKm6hLjyhrGYawnBo7xAzwm/O+XbS+Mn+GI3MRsX4Z/zlI
 bp7RmIaoWcXBX/Bi0WgVehgTe/eIyOSrpqpeHiqLpJq+yepkvKkWn1OFD w==;
IronPort-SDR: 1VGsWPsKJg7shpFrbmJuaB00TtA/wMpcQGxWj6SuL35+er3Rl2CJNdHHHEFbZBMkD0nEh6/LUY
 7O5UGJDjHoIs4C7f9Y4NJMcbTF2GaWiPmpLq4yf8VIIszNuGiQUrhJltvWsQ3w0/WK+QEGHFo3
 b5XELoadt+dXoGwgKB0A0wpJd+4VdSeUnIE/o0FdSQ4ltYcm4xCD4rXuil0Am3qIpesMtQnKXc
 pC64Tfx7RzU1SDz/1O3AS6ER1YgtmMY8k/zGQ+3thtLJoNAwDbka01HbOh0MmF3jh7F8hI/CfN
 JlY=
X-IronPort-AV: E=Sophos;i="5.64,421,1559491200"; d="scan'208";a="116527778"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Aug 2019 23:25:05 +0800
IronPort-SDR: Sp3q9CQ9++mUtzUDmnKnCbYKpJQzUFXDndxFCIaZgAdof5ROSW5tIWIjXl7AA/3CCxJOtYOWoj
 7DxzjwknaYuqMQDCmQjLB9ZzYxGwZvzkG0oCLU4lSqKHnNDVi7MboQX5EnGADQjGjbSXfOyrc+
 fQWymlAL32+OThriF7fuCCgyPnKlECUZnFFZMo1D/9AA3O/S+vZqffR8sWrFKTExeYMjUmxKsb
 L1BhS/8Ybm6U9oogj+DaaNUusotWRfyTIj6kcXPfBbVessVk1fxaE3pHWonLrJ6X4//CGwjhQM
 Lty8Z+QcuG6QlVu1vYY+VEEk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 08:22:23 -0700
IronPort-SDR: r8mUkXi/N67n/I5pkxTK9YVjoQ7lYovu32DTi9+iFfwyaWBjzyan8ln+u0FzHihDD0mN/V/Hcf
 I7P70KDOYcuEVGKJN39SNFvIaRAqKNssTgKu+Au9Od5Y+pGviq/4CyiSKwqRpyqyjcYUkUUtUd
 xGDPlxwZRu/3eDZbxVgFEut12LEkR9pabH/bP9kn/KJ6eb2rcjIUn1+8EShIRYBgSlzjb+C/3E
 3IRoH6ld1LQpa+LUwNRhTxsBw2ujixyLyrixjhiiMvO5rqykUNuhBDpKyqL8FYzoVV/DCqI79u
 yUo=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Aug 2019 08:25:05 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com, alistair.francis@wdc.com, alistair23@gmail.com,
 bmeng.cn@gmail.com
Date: Fri, 23 Aug 2019 08:21:25 -0700
Message-Id: <066a2c520c38b0c175c052d6a3385d5661764833.1566573576.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566573576.git.alistair.francis@wdc.com>
References: <cover.1566573576.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v4 7/7] target/riscv: Use TB_FLAGS_MSTATUS_FS
 for floating point
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
X-List-Received-Date: Fri, 23 Aug 2019 15:25:11 -0000

Use the TB_FLAGS_MSTATUS_FS macro when enabling floating point in the tb
flags.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index eb7b5b0af3..0347be453b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -301,7 +301,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 #else
     *flags = cpu_mmu_index(env, 0);
     if (riscv_cpu_fp_enabled(env)) {
-        *flags |= env->mstatus & MSTATUS_FS;
+        *flags |= TB_FLAGS_MSTATUS_FS;
     }
 #endif
 }
-- 
2.22.0


