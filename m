Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nU0rF-0004Oy-Qr
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 02:40:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=066bbe4b2=alistair.francis@opensource.wdc.com>)
 id 1nU0r9-0004MX-7R
 for qemu-riscv@nongnu.org; Tue, 15 Mar 2022 02:40:34 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:18518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=066bbe4b2=alistair.francis@opensource.wdc.com>)
 id 1nU0r7-0008F1-2c
 for qemu-riscv@nongnu.org; Tue, 15 Mar 2022 02:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1647326430; x=1678862430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+E1qD2QSY6CJKqpndhQML7d+praVidtrikxaw0zJfUE=;
 b=j56UzslFuAK6MtIeQBJ7maSzfTcwjgAwk9jO74SZiWomfn6vGPN0NHau
 rR12PcIGM2k1Dg3TmC4oVQqKQ8jIQF/AwEVmf4kVgIu98T9VuyDrknp1+
 aLVCc5ym6N2MPlL1n0hbkZWVFi3F/acqL0WK9UvgAdNIjp+UlAD9+I4fS
 9X9QzeLN6+H3qkspxtMLnPE/OlwhB7QzVSy81o3pFwKJpmvB5QQ1avSi0
 q8DU6yFteNDazSWTjxyKqOqukKUWjmIkaFwkBYjEMZWuA+5Cirh/jRIqX
 8t72YQGnHXaSirvPhtGOuCSUFPyge32hbXm7LD1RglbtHMKYmhsZ5q3JI A==;
X-IronPort-AV: E=Sophos;i="5.90,182,1643644800"; d="scan'208";a="196320408"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2022 14:40:23 +0800
IronPort-SDR: XI7jDY2aCamObzgAtsXo1JotyXyYf7bblBxje2dK+YRRjYURMYU/BTv0GGnmClLVXiMZoRLE1c
 XCae2OTJ0LozHfRnjFlUBWRsrHpWEhzbbFmXalslkMsp9bK4nUv2+YGV+gVTn4TgRMj01CDIrG
 /qGO5KIJk564NqjvOzsKVOWQoG13Yc3iwdf1nwj7cql/yXKYAwcu8nboumC+5cBPStvTUs+jPR
 PHXC1rliYUrMLY12wiywf0x2UXJo57LT8WtJ4kk5gSuuRa2kWSBv6zBLjtCIubhVGERbwvJzOU
 U5s2ADSKBGGhmTbb0P0E7DDk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 23:12:28 -0700
IronPort-SDR: CLO+pvQLyQaVPv2Sxh6rnOdjVpjU3EZvtp9gxr+HA5JtIcqu6I7j7v6acrTJqy1VqnkmMwIlGB
 kJ2Rn5S/AKY8GH8pZAUuWfrlvZVZEs/tOKekwuFhNYawxLROERPu7Jvlj3UHmPqlsNOKpgs4E8
 We7nrPG9YdMyz/8FE+lIqxR/gYekbjDLywzDL7e+k+3jfv3h84WJ4jIv0AiDk4L3MtwU/r3Nv6
 JbK7OKYFpTSxnVI88ShSYlKO39UpM83EGnp01hXsD17jgwxGc+KBRU7RyIaCMljmIPFtky37ha
 nsY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 23:40:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KHkLF6bHxz1SVp3
 for <qemu-riscv@nongnu.org>; Mon, 14 Mar 2022 23:40:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1647326421; x=1649918422; bh=+E1qD2QSY6CJKqpndh
 QML7d+praVidtrikxaw0zJfUE=; b=iwPCo48cXJPo3XkE/SNzxsWaXaN2YGERAo
 7at21QHc7bhi+0AfN1m+KpELeeVo9NJbg7WG+S2L7P214l9nfh3pMBVesxosUPcp
 atG72IndQk66dBSVDXp19ACTJ06FulngKbzJmSBQtaSQ0QdWm7Sza+hz0RNNlGQH
 9q5Ei27CGNgDlVTKoM6v+VBrRbqWoOOqD0h+IuDLuTKHP7zICPFlGlYEyJVHbSZm
 Y1ppe4aouJ08Sh1vYIDnbHb79fh92lEVHmjru6DE3RVQrRki8E9OPLJ/1Hfl39xR
 YzIcWmT/qMHspxGw03xNgkmvQH0BplzI+og9uewEmvAb+9b44dGA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id idAwLuijj4Pr for <qemu-riscv@nongnu.org>;
 Mon, 14 Mar 2022 23:40:21 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.107])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KHkLB2TdBz1Rvlx;
 Mon, 14 Mar 2022 23:40:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/2] target/riscv: Allow software access to MIP SEIP
Date: Tue, 15 Mar 2022 16:40:07 +1000
Message-Id: <20220315064007.3600746-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315064007.3600746-1-alistair.francis@opensource.wdc.com>
References: <20220315064007.3600746-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=066bbe4b2=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Tue, 15 Mar 2022 06:40:35 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The RISC-V specification states that:
  "Supervisor-level external interrupts are made pending based on the
  logical-OR of the software-writable SEIP bit and the signal from the
  external interrupt controller."

We currently only allow either the interrupt controller or software to
set the bit, which is incorrect.

This patch removes the miclaim mask when writing MIP to allow M-mode
software to inject interrupts, even with an interrupt controller.

We then also need to keep track of which source is setting MIP_SEIP. The
final value is a OR of both, so we add two bools and use that to keep
track of the current state. This way either source can change without
loosing the correct value.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/904
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  8 ++++++++
 target/riscv/cpu.c | 10 +++++++++-
 target/riscv/csr.c |  8 ++++++--
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c069fe85fa..05d40f8dbd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -173,6 +173,14 @@ struct CPUArchState {
     uint64_t mstatus;
=20
     uint64_t mip;
+    /*
+     * MIP contains the software writable version of SEIP ORed with the
+     * external interrupt value. The MIP register is always up-to-date.
+     * To keep track of the current source, we also save booleans of the=
 values
+     * here.
+     */
+    bool external_seip;
+    bool software_seip;
=20
     uint64_t miclaim;
=20
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a4120c7fb4..0bd19e16a2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -706,7 +706,6 @@ static void riscv_cpu_set_irq(void *opaque, int irq, =
int level)
         case IRQ_VS_TIMER:
         case IRQ_M_TIMER:
         case IRQ_U_EXT:
-        case IRQ_S_EXT:
         case IRQ_VS_EXT:
         case IRQ_M_EXT:
             if (kvm_enabled()) {
@@ -715,6 +714,15 @@ static void riscv_cpu_set_irq(void *opaque, int irq,=
 int level)
                 riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level))=
;
             }
              break;
+        case IRQ_S_EXT:
+            if (kvm_enabled()) {
+                kvm_riscv_set_irq(cpu, irq, level);
+            } else {
+                env->external_seip =3D level;
+                riscv_cpu_update_mip(cpu, 1 << irq,
+                                     BOOL_TO_MASK(level | env->software_=
seip));
+            }
+            break;
         default:
             g_assert_not_reached();
         }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0606cd0ea8..48e78cf91e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1403,10 +1403,14 @@ static RISCVException rmw_mip64(CPURISCVState *en=
v, int csrno,
                                 uint64_t new_val, uint64_t wr_mask)
 {
     RISCVCPU *cpu =3D env_archcpu(env);
-    /* Allow software control of delegable interrupts not claimed by har=
dware */
-    uint64_t old_mip, mask =3D wr_mask & delegable_ints & ~env->miclaim;
+    uint64_t old_mip, mask =3D wr_mask & delegable_ints;
     uint32_t gin;
=20
+    if (mask & MIP_SEIP) {
+        env->software_seip =3D new_val & MIP_SEIP;
+    }
+    new_val |=3D env->external_seip << IRQ_S_EXT;
+
     if (mask) {
         old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_val & mask));
     } else {
--=20
2.35.1


