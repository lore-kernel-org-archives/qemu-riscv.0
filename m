Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNL4L-0006oq-Ps
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 15:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=705762e65=atish.patra@wdc.com>)
 id 1lNL4H-0006gC-44; Fri, 19 Mar 2021 15:45:58 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:41239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=705762e65=atish.patra@wdc.com>)
 id 1lNL4D-0004R4-7O; Fri, 19 Mar 2021 15:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616183153; x=1647719153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OusL5Xq3lC16FrXHeRHXQTKogSDaF/nRWu6zTxeknPU=;
 b=A5LqtmSV7YIai8hBXahMd4NLXIDifQFyooS8nRvTtKHqNVmMWyh97UgR
 AGoD0B7Kdcpkdvy4tnbHrHIwTqr4fGmfuUZ+0b/3thhxB4i9da/ppbBlF
 NRXHTcbHp5RiMOgLZ4L5UzdE+RF9Ubn2yV9dt9mcC+ZRv6dwTRvFBiWxn
 e9E5V3R+WjsXuwLgthQdWPShdKRpI7XgFLpydmjoPXdBIv6K/W6MPfeHY
 0hvUq1VxfXcw0uFnuoEldWjTcGFfwjTJzd9RbBbFZzr4bGsuUGi+GJFsD
 /RazIRsYnbd4e3pzgxgINic4lLEDINSaZdszi0Nrjm7ImASjJ9LxK2s/6 w==;
IronPort-SDR: VPrnoPdKLkISLntFwWT/d/NH7BwFI9dLvujGWsPJX1TMt3HW465scB9zyh2Av6u+9ZNCiPzr+J
 806l3cIF3AtCxOwebD3JeqdHR5XcmvfoEylFZrQ0AGosCFZrAyv24lnAcjSmAJPu/Yp/cLS69y
 qKN58FQNkv8h96ennUTuCrZ23WeOaKuMZ2yWXXhy6SYihd3XpPDOegtvZupqf9UeuhmS5U8705
 GWq0CSvPSwfAR7gawngBjAO81mlJz6ybpAK+jXvSSkfpNKoepDem1nGBJO4CMs/yUTPI+pUEAz
 AG8=
X-IronPort-AV: E=Sophos;i="5.81,262,1610380800"; d="scan'208";a="273319153"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2021 03:45:43 +0800
IronPort-SDR: hQ8KO/oo8Ql10Q0cv2gvtFEzzpeN4t18fAZiquo1AHTg36ZeWOJo0Rf7oNNkZUyoYXTk+eeNns
 sftByK55pkFBfiAT9dKyuBLdL7438/mN4QnSyrVgqWwlQ4AskSnc3RYzyHdwsCFMVU7Gegolru
 WKh6+6RoEwQcIqsE8RlnzP4xL//NVtneXKT5erCVpIGnnXZIm9JythfryOTPy2x1y6VHBnL81k
 yHQ3qxVMk0ilW1lggN13rJrgy8jl4c+WVk1G8f9z+t6H9txTyHS/dsuVt3ZIOReIZbtf+lSuum
 EA1o7e0ULkGru8wO42qUJXo7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 12:27:56 -0700
IronPort-SDR: W9hjd2AutVxU9lmpO9HFJTomnJU9cuDgZoFzyuf4V7PLj/738ajflCjbreqOL35qGfbtSVNrA9
 JYyBRFbNWdyEUyeRLAJr6dZ/g2Jj6rksNgTUcdxiydMktUylYobdVBnZbAFr/anFo7NiwF70yc
 jlaMoPqTWkAWrRUqHliGyqbdeBX/8Fvk/85JVjmPVTSngBrQBw8W3I98DfzSX/PW+SJ9Dt5WUE
 Bb7eafroAiUp+3yVOICbHhlZajvZtX1BCf7nXWOohBYwFTPc1Xz0foJnDsKtoLkmVkTZ22Wo4p
 5cQ=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Mar 2021 12:45:44 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, anup.patel@wdc.com
Subject: [ RFC 6/6] hw/riscv: virt: DEBUG PATCH to test PMU
Date: Fri, 19 Mar 2021 12:45:34 -0700
Message-Id: <20210319194534.2082397-7-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319194534.2082397-1-atish.patra@wdc.com>
References: <20210319194534.2082397-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=705762e65=atish.patra@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Fri, 19 Mar 2021 19:45:58 -0000

** DO NOT MERGE IT **

This is just a test patch to test various kinds of PMU events. The counters
don't actually increment as virt machine doesn't support any of the PMU
events. However, it helps to test the OpenSBI/Kernel implementation.

Please ignore this patch while merging it.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 hw/riscv/virt.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 84570ad6425b..59d8325bf2a1 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -194,7 +194,9 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     char *name, *clint_name, *plic_name, *clust_name, *pmu_name;
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
-    uint32_t pmu_event_ctr_map[6] = {};
+    uint32_t pmu_event_map[6] = {};
+    uint32_t pmu_event_ctr_map[12] = {};
+    uint32_t pmu_raw_event_ctr_map[6] = {};
 
     if (mc->dtb) {
         fdt = s->fdt = load_device_tree(mc->dtb, &s->fdt_size);
@@ -288,18 +290,46 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
 
         rc = fdt_path_offset(fdt, "/pmu");
         if (rc == -FDT_ERR_NOTFOUND) {
+                pmu_event_map[0] = cpu_to_be32(0x00000009);
+                pmu_event_map[1] = cpu_to_be32(0x00000000);
+                pmu_event_map[2] = cpu_to_be32(0x00000200);
+                pmu_event_map[3] = cpu_to_be32(0x00010000);
+                pmu_event_map[4] = cpu_to_be32(0x00000100);
+                pmu_event_map[5] = cpu_to_be32(0x00000002);
                 pmu_name = g_strdup_printf("/pmu");
                 qemu_fdt_add_subnode(fdt, pmu_name);
                 qemu_fdt_setprop_string(fdt, pmu_name, "compatible",
                                         "riscv,pmu");
+                qemu_fdt_setprop(fdt, pmu_name, "opensbi,event-to-mhpmevent",
+                                 pmu_event_map, sizeof(pmu_event_map));
+
                 pmu_event_ctr_map[0] = cpu_to_be32(0x00000001);
                 pmu_event_ctr_map[1] = cpu_to_be32(0x00000001);
                 pmu_event_ctr_map[2] = cpu_to_be32(0x00000001);
                 pmu_event_ctr_map[3] = cpu_to_be32(0x00000002);
                 pmu_event_ctr_map[4] = cpu_to_be32(0x00000002);
                 pmu_event_ctr_map[5] = cpu_to_be32(0x00000004);
+
+                pmu_event_ctr_map[6] = cpu_to_be32(0x00000003);
+                pmu_event_ctr_map[7] = cpu_to_be32(0x0000000A);
+                pmu_event_ctr_map[8] = cpu_to_be32(0x00000FF8);
+                pmu_event_ctr_map[9] = cpu_to_be32(0x00010000);
+                pmu_event_ctr_map[10] = cpu_to_be32(0x001C000);
+                pmu_event_ctr_map[11] = cpu_to_be32(0x00001F0);
+
                 qemu_fdt_setprop(fdt, pmu_name, "opensbi,event-to-counters",
-                                 pmu_event_ctr_map, sizeof(pmu_event_ctr_map));
+                             pmu_event_ctr_map, sizeof(pmu_event_ctr_map));
+
+                pmu_raw_event_ctr_map[0] = cpu_to_be32(0x00000000);
+                pmu_raw_event_ctr_map[1] = cpu_to_be32(0x00000002);
+                pmu_raw_event_ctr_map[2] = cpu_to_be32(0x00000F00);
+                pmu_raw_event_ctr_map[3] = cpu_to_be32(0x00000000);
+                pmu_raw_event_ctr_map[4] = cpu_to_be32(0x00000003);
+                pmu_raw_event_ctr_map[5] = cpu_to_be32(0x000000F0);
+                qemu_fdt_setprop(fdt, pmu_name, "opensbi,raw-event-to-counters",
+                                 pmu_raw_event_ctr_map,
+                                 sizeof(pmu_raw_event_ctr_map));
+
                 g_free(pmu_name);
         }
         addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(mc, socket);
-- 
2.25.1


