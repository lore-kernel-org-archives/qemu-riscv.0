Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iO91c-00063Q-CV
	for mharc-qemu-riscv@gnu.org; Fri, 25 Oct 2019 19:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50203)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=194c68654=alistair.francis@wdc.com>)
 id 1iO91Z-0005v3-0H
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 19:29:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=194c68654=alistair.francis@wdc.com>)
 id 1iO91X-0004lj-Qr
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 19:29:40 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:36814)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=194c68654=alistair.francis@wdc.com>)
 id 1iO91V-0004Yx-9K; Fri, 25 Oct 2019 19:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572046177; x=1603582177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AhPwn0DIe1Bw+jGVJsxFYh4GSQcU4tWNGO2Y1sD5mM4=;
 b=GWRv4d7Wpftu7DlNYE/SychHYjsGBNjabxGQ09pXSRPFYGkJd5k4+57y
 QdqFEo4SOrF8vOs0YjmiYV3Skthcym55wJ3QMhA0ihcBBoPL25FrnYd25
 alhVn/aYf79/9mTp13nnkc7dAGz1V49eebGZRpHGBWrZE6KJ6D5l49qzx
 yiMURC5RhIY2Lqjy7hax3xCWyhdnE6RS1JqUPedoMB9tAUQW/0M/WpntL
 beYNtQ4kncN62EKcOeAFLiBVjqpYIW3rr8zGACjKBcngy1PPm2Y7V3DvP
 /jWb5wsefbK842pQnWllfAbq/TqVH/mP1R8caaWs1hzoTBJw9OWuYEIZr A==;
IronPort-SDR: FZ5Vt+O+El/FBb42gIuQwT0k4NIu5VizCLEDOXoh7vGZ4X+QpVilcaRP7ETtsD2niitSXtnJtl
 SSMRaE9BGYe02NHynaoSW70ytuCmjxd+aU8cyxuvTCdSJ+aj/aKuC4XUtNTLQ018OK/Sv8p2Ow
 FXBqmnJlhyDU+4ZxS72oB7zOQFaQJPQ8wSlrLT9+NPaxpWIa+W6n1O+sx3uiCrRYLoIHb6C7Im
 Hxp2uItKoBST2hs6GnulE/PLZNjPbsBAEOJeZxYQsmBVq6Es1h2sl4qwTy74ZaCKTi/YVU199z
 D+g=
X-IronPort-AV: E=Sophos;i="5.68,230,1569254400"; d="scan'208";a="122956710"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2019 07:29:37 +0800
IronPort-SDR: AO39iiKaxFascB3sdk6AXpsJarKCLSjDNy/zRLT4AJDHJWHVpOfevmMfEW1qfi21io9bebM7Ru
 FF65KDI2zSGKmIPXX/iKzvWj6OAvKUCky+D7tITgzz0EV49OlWPSzRkXDo7As/OMLOq1aN9kWz
 1AuuhW7BeZg+xWpVjbF1Y9tFnfWbF/nKUSBpYEAXqvO4H1X08ml3Fq3Jc2GwGwSB3tc1p1tFLn
 HUvk4YHPP/NfIs4P5oNvzZmoQ2WywOfWpQQOuvwvmDZxSEEQIW9S9vIeKG586O5Zsuk7RzsHgX
 oyrQ9Z6bKsLi2geL+SQqiYQV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 16:25:08 -0700
IronPort-SDR: sym3R79PoIsMVp4UEqPTgyHajBLWD1uKcUYJZkdRBj31AFoY19XdacPCny4WCz/QXYqGt1F444
 KuYbKZ1bJ+Xbu2WvGroIDtZ+SDDhSAFhyXbJOpzXzGNsafrfCCcsOdQniB4fykN+50o8yYWeHY
 /XWipvN6GkrQMFjrN7/Odw6mwvZSuHzGx0rZbG0UT2lNxBmBcHNPtOGgwEb8N9z+8oxFr7oPJg
 VYti8uh3kdfe/Y/JY7xIAsiX/BmjOJGRKFbaWQSl0MJLrPN+HXe55mkVvjkTAtDGPE0ZaBpWDv
 Hz0=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2019 16:29:37 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v2 27/27] target/riscv: Allow enabling the Hypervisor extension
Date: Fri, 25 Oct 2019 16:24:41 -0700
Message-Id: <49eef14a789367ec9eccc0660574516a20f2dbd8.1572045716.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1572045716.git.alistair.francis@wdc.com>
References: <cover.1572045716.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.154.45
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
X-List-Received-Date: Fri, 25 Oct 2019 23:29:42 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 03622825f3..6d02e61e8a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -446,6 +446,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_u) {
             target_misa |= RVU;
         }
+        if (cpu->cfg.ext_h) {
+            target_misa |= RVH;
+        }
 
         set_misa(env, RVXLEN | target_misa);
     }
@@ -492,6 +495,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b8b731df43..ed1f139369 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -258,6 +258,7 @@ typedef struct RISCVCPU {
         bool ext_c;
         bool ext_s;
         bool ext_u;
+        bool ext_h;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
-- 
2.23.0


