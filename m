Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ieNbV-0008Dx-ME
	for mharc-qemu-riscv@gnu.org; Mon, 09 Dec 2019 13:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35265)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNbS-00089N-7a
 for qemu-riscv@nongnu.org; Mon, 09 Dec 2019 13:17:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNbR-0007qW-78
 for qemu-riscv@nongnu.org; Mon, 09 Dec 2019 13:17:50 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7465)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNbO-0007jP-Bz; Mon, 09 Dec 2019 13:17:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575915494; x=1607451494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y++U3SzQyadbcJ74+4wiNfrC63NDFW5YR4TGzICI8CY=;
 b=QbJECns0hHmi2gGMdgL3w9BKtj7IxOL84YU+/lj/pJuBaAbvbCtUMrb6
 V4avsLpppleo+cmBSrVeCYVtrZoQCU4fK4JMgST+BpEBBLnB1T2l7mER2
 s7o7rsxJrANcdI6xy5HLkliEtc6Kj0okBNWoZUOBKxwOREPYYzxthj3F3
 qzm8AH34BtwGdfU+YN9bHvIARF2ZbPwo+QpS3Z7X3f8YFK8YBLYCKtK+X
 DD5SfS9Pu9YHU5AJ9rimn4Bnk1252bV1MHh4AqKI1ZImrki2wj1nF4ixQ
 FHAuqgzfsl4FE4Iy/vUV4wljzsLhiNE6WcHD7e2oD3b5J21TuaLLG8LsH w==;
IronPort-SDR: +jGDjSObNBEZ7e5oZWFSkpAvK1uXsLR9bP4QhGRuviMeKyWASl2OBJzGrsDO4JYeIVDJcqniZI
 2yeRIHmov5lq2ogVeTnZpPRUHY/x/JGHVfdcv+oJRlcA7aVDnfQ6H/cXO3sm17ezPn6mdVTYsN
 Q4PLTgDviUyCEhbFiN1utC2ZT32iIhaML6v8cWFuEovPdYXTY0IM17g2w4D0bK9MWhnKe3MVTS
 OB7nLg3bOA0DvmQCq242ISgGLHl+4GUKrJtp2EeKDTOGAUJ9kuZGhlOTpADqU3d629LRDKHJ5h
 85Y=
X-IronPort-AV: E=Sophos;i="5.69,296,1571673600"; d="scan'208";a="226412041"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2019 02:18:14 +0800
IronPort-SDR: 0fyAYcOosKAhaIFhftD0DufLqc5RDGFK8Ma8G1Dd9MG/fWnWZ2HyXdqtuYi/2hzTIIHLoynoNG
 LoxPrLvKIkL3KdTIgX+PXfR/ATTQi98V6uLynP4QxnTiIkgJPGbMrS8C0/gY2OGIcoTGBZaKzd
 ahArdpQ+Fw59GfZIKm2knLs3Ek/99uAb0RHjeONxzSnMsZrn/QQo1t8/4EiUnTg4WGTUgn8LX4
 DwV4yOMZag5OOWS4uzwpZQKT0Mk/HN6zK55pLjZvzKK2rybfiq6Hbj5AlZDdmktaoSrlB+B+Ws
 DsFHQrss2XM51Go4RDa+SvCL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 10:12:24 -0800
IronPort-SDR: jYxmAFSQjtIu4nu/zEEFK+orAfX6ehZ08OGwmzzwY38lueTJX0mR/UOmm/uz+XJu/6L00VNmVJ
 EfHYHkUhqZXdRNw/M41KT6HwMA4s6cASflN1VS58flxnVJeOuId1ZawiYprfxlYq8kiDYyENyX
 IsbJTEEaw3/Tq7aGAqlIYf7Iudsc0ULSLh6za6as4qqNyWOmLRGh4xfRTeY1ZsYlGhmMmNzio5
 qMIyvHu2K5XRHiwB2HHywojSoUex7IUDYd57y2vqB6fXWIE2alHusEdH+mjWqycI8GBl3yYT6E
 YsU=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Dec 2019 10:17:45 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 32/36] target/riscv: Raise the new execptions when 2nd
 stage translation fails
Date: Mon,  9 Dec 2019 10:12:04 -0800
Message-Id: <f8bbda95f454a47bbfac3df8473f523a57aee3bb.1575914822.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1575914822.git.alistair.francis@wdc.com>
References: <cover.1575914822.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.143.124
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
X-List-Received-Date: Mon, 09 Dec 2019 18:17:52 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8667e5ffce..43c6629014 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -589,16 +589,28 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     }
     switch (access_type) {
     case MMU_INST_FETCH:
-        cs->exception_index = page_fault_exceptions ?
-            RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
+        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+            cs->exception_index = RISCV_EXCP_INST_GUEST_PAGE_FAULT;
+        } else {
+            cs->exception_index = page_fault_exceptions ?
+                RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
+        }
         break;
     case MMU_DATA_LOAD:
-        cs->exception_index = page_fault_exceptions ?
-            RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
+        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+            cs->exception_index = RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT;
+        } else {
+            cs->exception_index = page_fault_exceptions ?
+                RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
+        }
         break;
     case MMU_DATA_STORE:
-        cs->exception_index = page_fault_exceptions ?
-            RISCV_EXCP_STORE_PAGE_FAULT : RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
+        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+            cs->exception_index = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
+        } else {
+            cs->exception_index = page_fault_exceptions ?
+                RISCV_EXCP_STORE_PAGE_FAULT : RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
+        }
         break;
     default:
         g_assert_not_reached();
-- 
2.24.0


