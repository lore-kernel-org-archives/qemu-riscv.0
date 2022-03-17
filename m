Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUjTb-0001yP-Td
	for mharc-qemu-riscv@gnu.org; Thu, 17 Mar 2022 02:19:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=068022f98=alistair.francis@opensource.wdc.com>)
 id 1nUjTT-0001uy-NY
 for qemu-riscv@nongnu.org; Thu, 17 Mar 2022 02:19:05 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:4019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=068022f98=alistair.francis@opensource.wdc.com>)
 id 1nUjTQ-0004NK-Eg
 for qemu-riscv@nongnu.org; Thu, 17 Mar 2022 02:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1647497940; x=1679033940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4pVy4cMDvJLZlBVkqO1ZhAwyyQmBDYFTwYbtvfQclis=;
 b=jotMan5frG7nYDS0R5z0rCNkJpdDbh+B/bWgshBXKt8Hc/bvwmXAZvaI
 Bg1ZzPqdlV0o3p7n/CWfRNyuCl5kbU9eP+4IpG/oeE+/FGOroSg28SWSm
 IxKMMMqOILxWfu3fOof3+S6hYWnsZzKF9CLPmVL63S6zDV3JjHTIYlxAs
 yTx/eC8SFjRGI/nrJ7gnIEiweqWAYX6I5pddemOa2g/3KulV7P59SV92A
 dDCeuhyzSTQvkd5x//k9GDRWNfPWlKpFlyI51XrZlNJsFi6d0Qp1px94P
 5kCy+93mCmM/pJENFfaFM0SnUr3nd1OtOKXVZ7G5oKrTRktIy3yiob23t A==;
X-IronPort-AV: E=Sophos;i="5.90,188,1643644800"; d="scan'208";a="200422240"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Mar 2022 14:18:29 +0800
IronPort-SDR: DZwlFAch7MEozquSFtSgJSh1BGP52051FGWIWG9ibbsPErpDoRLq14gDcG0wvhuP2axqMlx5xK
 A59zWFtJ+Z+v4MH02zlvi80bdUVcGp7/FGsw8QjKNPg+sQpL23dPs/DWYJzytQRuMMDfOZHDLK
 SDYuYwC3fx3O26Fh5QScw36Iy2siNZFf8c1eDt4DMR5T3hABTwtYhlq8yu/XImHof39NLONucM
 vHgLF9Mx3eJOAUnLM+Ah42eFbSxyVAP1s2G5rzXuttuPFYAYELF8Jlbnjiziii1hZexjRJUSH0
 MyUvdDlMcfrfAPF42ZnEZnvf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 22:49:36 -0700
IronPort-SDR: 88+AywxTgturq3z6BeKnwqr8YMULQz1/zqSGIsFMh4OhvOSbL0Gvp/ddHdAOhRTg5zacwsg+Fd
 08eeaXL3zHXcXei+35lc/u5Xo030iiyAxSv6xLN/EOkwzEjcVV3tIdBAzfJV94sJdwJSYIO8U+
 RRjlC2ft/+wENeyx+OeXgVeoX+A4waZ54p+Ej/cVgiDovFwa6YU8QPoIuOAOWlOkjLFp6xqvoT
 rhWXkcGHEAwDaAEya9ihpPMXceJQcWXZsgr2Ry4S2JheiPHR2F664WN3wV0Ne3e6oSKWj9GTwk
 8+Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 23:18:31 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KJxm65x4cz1SVp1
 for <qemu-riscv@nongnu.org>; Wed, 16 Mar 2022 23:18:30 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1647497910; x=1650089911; bh=4pVy4cMDvJLZlBVkqO
 1ZhAwyyQmBDYFTwYbtvfQclis=; b=Xtx6E0UnWKRCfcaH4V93SoP7aje0VBIh4g
 xn2EHueJ916qwdiRoFquFMGLHGcjxYulKZnKbCWXDE18B+dGF31dP8B9UhFSopGK
 yGFEORIofQMAuuyn07KSepjgiAujsEcLkl/2FDnMMIXy+wZbTeSxtT0piQdQ/Ad7
 OJwBJexW7MCX7c6Wz85UVJzdhgPbODnmTvyFfFHibsAC8LLzRtAO27FY8qCwrZvA
 sbdW72Mh0vUIteB4vxWua+hMXBMvrolD6xIHHS52RiEdnqEJhfhWI4qwf4yCcM0+
 OznpWDZJm14qJrzvF1z78oBQQ8YkbE+XvCjTYwUFqgVBiscDXSUg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ZdzdbzyeG9S2 for <qemu-riscv@nongnu.org>;
 Wed, 16 Mar 2022 23:18:30 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.107])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KJxm25J9Lz1Rvlx;
 Wed, 16 Mar 2022 23:18:26 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com,
 alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 1/2] target/riscv: cpu: Fixup indentation
Date: Thu, 17 Mar 2022 16:18:16 +1000
Message-Id: <20220317061817.3856850-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317061817.3856850-1-alistair.francis@opensource.wdc.com>
References: <20220317061817.3856850-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=068022f98=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2022 06:19:05 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..41b757995d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -567,18 +567,18 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
                        "I and E extensions are incompatible");
-                       return;
-       }
+            return;
+        }
=20
         if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
             error_setg(errp,
                        "Either I or E extension must be set");
-                       return;
-       }
+            return;
+        }
=20
-       if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
-                               cpu->cfg.ext_a & cpu->cfg.ext_f &
-                               cpu->cfg.ext_d)) {
+        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
+                                cpu->cfg.ext_a & cpu->cfg.ext_f &
+                                cpu->cfg.ext_d)) {
             warn_report("Setting G will also set IMAFD");
             cpu->cfg.ext_i =3D true;
             cpu->cfg.ext_m =3D true;
@@ -709,11 +709,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq=
, int level)
         case IRQ_S_EXT:
         case IRQ_VS_EXT:
         case IRQ_M_EXT:
-             if (kvm_enabled()) {
+            if (kvm_enabled()) {
                 kvm_riscv_set_irq(cpu, irq, level);
-             } else {
+            } else {
                 riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level))=
;
-             }
+            }
              break;
         default:
             g_assert_not_reached();
--=20
2.35.1


