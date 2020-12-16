Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbS4-0005oM-KX
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:23:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRw-0005kG-1z; Wed, 16 Dec 2020 13:22:56 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRt-0000MW-BV; Wed, 16 Dec 2020 13:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608143449; x=1639679449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QElF5Cl+M14uOP2get+i3gs/AtZ1Ri5bYCtqT6FdM/Q=;
 b=MwPnBLx2NY5sn8CdY6Z/Oz8bRma80P1TWJ0MwIdWU4lRZ5s3JdZAiIWT
 YNjEQYSeTntZxWBqkaMyt1/Aa+YMSzUzUcRyHr4NcHcsNxG6SCZvV9q0V
 zluzYvEAagIw3fhjJhabSDdj62mzJqztRuSl1nZKl5z3BceOcO08T4/v/
 tUQtfD+bYHLdTN2EOMfiP4y7USldRf6UV/T1kJ5++FiyW+YT/qmdBnBKg
 GZWbpSeLwAB+4MxmwoehR0zepJLE1U2dSraMMknY6XVaO5IvSrEp9je65
 c0JN9kwcDC+BGkw4hx7we9u7AIgSbcTIfzr7Bw4T2+nxOF1r6pnnm2Uwc Q==;
IronPort-SDR: dpZS70brWcONIPqkDDGlKCaYrRV/WnB2z4txFqZGnvSxGxc1PdwxQulToJnpwqjN1z3LA9VfVr
 CUMLCt/BY2YGqNvFLlQCFYyU8XJPsq3LOaOcfvrXEjomqtwRWlJ89bEMAEl/pEe/vAlntJSrCN
 pKLjrEwLh8uBK4prZk43QZ//DpguCiLAsUhizackCaqU/nBNmwpMOGnmCLYCbBmBmqV2Jv7qqV
 r9MGphe3jJKq6wiwT2aovLzMfg8/LqswGPe7e2tyCgaeLEHCaMoB/fRBmtYjx0gPVwJeVtmjcS
 bIs=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="259080369"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:30:47 +0800
IronPort-SDR: wQwwER78dFb13Y7EJ+M0lnzyi57wpIRRpQMWA/vadkhWoh+aobYU6vZqJkO0wDiomN4/YVAoKx
 6CQUR5mbMxKCu/qv2kmBQIorzC0CB/L3d1ZLRjGCnh9iv6INfhn6bUCkpJr9Dq4OK7V0GuD0d0
 UMU9pDis5I+Kha9d1t2nEKwBQ35w5rdD32cF7FkIuRjlYx4uasZ7NXMB0YZdLe8bUtnBawnWYi
 gOW2iOWDpWx/lRxqamACNEvOsLTnY7imZWZ6Yg5AKENn6Rpsocyj6nfRvnYTmEDQ4Ve59vKghy
 4vevx1j9Mn8MtXtPT47CzsrI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:06:26 -0800
IronPort-SDR: S8WkY8LPWR25wFilwAn/1Z+gNPh7C8bt6hu5pg31jIkRDkjfaqhfc15lIs/OQbnUFGM3zeLU3L
 yR1vzpobd11VMSHyvq0BVjvFCUj2ejcf9c8nbK51+BO33myxD3z8Mw1EiTpLopChko5ZIjKdbL
 mGL2yLK3fnvIJy0KWiBqRWYyKEgnRX/wZzV5P/Vcvevu6RCSCxMEdzh2cnn5pwsx14hPfAG4ql
 Lx/0EG3tyfxNQdFwDXsYIU4v9Q36PkwEtx2lUnqasWsxUF8/77Ypy71gTs8Ah4oeafo9tLrnyD
 AD4=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Dec 2020 10:22:51 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 10/16] target/riscv: Add a riscv_cpu_is_32bit() helper
 function
Date: Wed, 16 Dec 2020 10:22:51 -0800
Message-Id: <ebd37b237a8cbe457335b948bd57f487b6b31869.1608142916.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Wed, 16 Dec 2020 18:22:56 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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


