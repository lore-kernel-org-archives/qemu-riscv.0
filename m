Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i1JCP-0001Ac-K9
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 19:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49701)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JCI-00012n-5d
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 19:42:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JCF-0000GG-VW
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 19:42:20 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:30783)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JC8-0000Dt-0g; Fri, 23 Aug 2019 19:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566603774; x=1598139774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ExO6CmSXFUcMYCNVROhGdWjTm1HudMDa7YW2yf4a/Q8=;
 b=iB099DhtaAwGA330D4FLyyCJRdGYlTuIS+1IWrvkIHz2cXS0qjCkwdGA
 acWKYsThN4HpTu2xmtDzrUfl9B4VFggbKH2FK0QkZ/56OZxmoIFFmtfTK
 g3zwgxHAy/+UwFFu5OvFt6W1F/mI26288JQLJjtbrMw4TmK+YdaUbg2h/
 Et9pNKXeHyw0+HiLzYq0UVq8BFX4v87etymqDHk4LM1btqzyeidKKkI0n
 mBLKfqqWouhGYrYnEApR78nELSapqqM5q/ur9dRkM/uAUzOj0rXSZbVy7
 qZw3Hy27aVEO19zU5uNmHmQbycX2JHCFRGrldr2NK4DSeTnVWVhztSrHN A==;
IronPort-SDR: MP1b4MEVAqg2vmxOfpJCeAISTPYLtQT+iqIv3yT8YqVj8nrIZU/l0Xm4p1x3kVW180EI98Dqrv
 HVOTe9DbX0gCMSfsty4NP+iYHoa/CCv/4QkWO9PBKvnj0LLECAk4E0D88HEnr1fwoVffFrbBAT
 o2z8BlFen+/55R+SOH1En8Zhpmeit6fsuzPFx/sO8M7NDu+J3MmUOK0njKFPeedzb69MvVTIrc
 E2DJ01+5Vlvw+5d6uC4E6A45rsM8nKZYd9R/U5OMqSNCD+6mcjgujItZCsvO0f8hLRhhfct6dW
 zY4=
X-IronPort-AV: E=Sophos;i="5.64,422,1559491200"; d="scan'208";a="217013903"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Aug 2019 07:42:50 +0800
IronPort-SDR: HlP922HmFfO/AlVsSrEbdojUyZr12AKJuy6Asp1Gd6YgY1kLjCNUBNl9yXIp3zg2qklgYHPJAF
 ModLJRApLFsGlkQEHcEqrjJQrXvhIa73zeK8mDp4w+W/Rexmu5Bb3Z8W7aGE1zdVtWYVoU+Tg8
 YL+UI65HfRBEUfpFdsbU7qJ6WWACRwIySZsVJgBUgFR/jbCVAfK1mXCPgFLhaDLs41/tsoJc9v
 sFpyx0ETIPTKRX2yTTx+jUrBOdPsqJeO82YUUokm4+E4R8wYb6A87dzyf5IG3ofaOoO/a1LrH1
 xJBSE2lJpK6vaCRpPL6ed/wG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 16:39:26 -0700
IronPort-SDR: 3InY7wHPz+FSqXd0aNwyQbE7Yoej8RrFJTUigQqQ2RC3nFTzlgetjxw/vZhJDF9ScoepPPtNWj
 CSOV/CAWt3kn2O4k8Y0pW56o5VJVSNCoSVvPXLFbWEvJQSU/ZlJzrCuyXS+mp2w6aALXeGc3je
 JYVsPACB82qZIuNXHevDJszPfjmGxG/s9/evt2rsGinrhNDx9zDqQiluH/NkXrddgOTzXW3NAr
 UGgH8ykEBhCEcgvU+6D21JDuz0vf/qqasAJ0W8/c5VQqJ9xdWe96WIO+eoOWvevP8rgJJKFzbi
 8Pk=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Aug 2019 16:42:09 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com, alistair.francis@wdc.com, alistair23@gmail.com,
 Atish.Patra@wdc.com, Anup.Patel@wdc.com
Date: Fri, 23 Aug 2019 16:38:29 -0700
Message-Id: <2b2e042b3c80d4f37cf150853a0a040581feb403.1566603412.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566603412.git.alistair.francis@wdc.com>
References: <cover.1566603412.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 15/28] riscv: plic: Always set sip.SEIP bit
 for HS
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
X-List-Received-Date: Fri, 23 Aug 2019 23:42:25 -0000

When the PLIC generates an interrupt ensure we always set it for the SIP
CSR that corresponds to the HS (V=0) register.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_plic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index 98e4304b66..8309e96f64 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -150,7 +150,17 @@ static void sifive_plic_update(SiFivePLICState *plic)
             riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
             break;
         case PLICMode_S:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
+            if (riscv_cpu_virt_enabled(env)) {
+                if (level) {
+                    atomic_or(&env->mip_novirt, MIP_SEIP);
+                    g_assert(riscv_cpu_virt_enabled(env));
+                } else {
+                    atomic_and(&env->mip_novirt, ~MIP_SEIP);
+                    g_assert(riscv_cpu_virt_enabled(env));
+                }
+            } else {
+                riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
+            }
             break;
         default:
             break;
-- 
2.22.0


