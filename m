Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F59CD98ED
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 00:01:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZdhm-0002KV-5n; Tue, 16 Jun 2026 20:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZdhL-00022r-6u
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 20:00:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZdhI-000861-An
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 20:00:02 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GLU4du149324
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 23:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=unO92+lnNGm
 VO9KZxwtq4wi6H407p3XqwnUKjG/RMR8=; b=YYZrCHMxwCMy5uw91T6Yoo6cjSn
 bdhvDzt0IhYXDzVpneSb/B7uOTwPfwewrMw8B3VR/+DYo3gYByEuDjLFFhU3Ry2L
 0ZswVY2CC/Y3cTN4lRDCEOiqRUc65gnQgaIFpY6HfH789xm8sLSUA15/e/a4CQq/
 Tase+E31ezmevtLOZGhg/g2Ur5j6dw359d+NoiOBdkTBT0XiBNaNCcFZcWCLmEhk
 omXsQsFWDiFeug6fcH0qUXCSUB+JboiVIbktOSrCA8O9fgxiXpT1fceSx2odfF3/
 rVlsNg0WEfng8oF6v+DbJqNDvpDQgGs6VrAmbmPndYzMStsBzDQyrSM2aew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef20e9y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 23:59:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-915b3587972so486312285a.2
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 16:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781654398; x=1782259198; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=unO92+lnNGmVO9KZxwtq4wi6H407p3XqwnUKjG/RMR8=;
 b=VfqRx9gGGGVdniQQLA1WXTaQv0ykPPDHNWof8RpdPSDnblCupQ5/sAu4AnoHH7KkFw
 4JBF4cVUtqTc5v374a/t8o/S91GK/mrkkpH49gGpW+3SPagjJ35mUb+ZyskIRk7fw8UH
 X+CGvM0/xeCbMU53WKaFcBtQ/WYgDcjnePIWk1aFm937eqnO3WnTvoDFiJAuf/39r9fK
 iyng6F0Kb71qjlA+7KaAMh1mKpfOzhj6MT1f5p25nDsUm9bN3VuqGfmMi4Wp8iVkU7lO
 ZWW2J5rmoHKP3LH4iwLtHR6xpm3kBnlDXGwWd154S4H2/HVnoutZUHxe6dxrk83q75yv
 aLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781654398; x=1782259198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=unO92+lnNGmVO9KZxwtq4wi6H407p3XqwnUKjG/RMR8=;
 b=NeB2Ajv9nXl613O0je+x3pMMYs6T56OBA+/n4ANbRKsLr/1v9mBw95IDK+Jzqnkgla
 KOeLGFvP6wW7jZF3sDlgm92r4I/o9j5sNIMrxVDePdX55Y6Wj5uM940T9UvfcnC4UXEf
 OBmoH+wMFtZ4YP7CJ7E2fK6MdZBYI/pMI+2271MBHfmmoyKyjA+b6SWjieZb/XoNW2P1
 +Ka6Ce+qAM0RXBYJXfvtRLgwqYAXjaeHuL8oR/BTPeusIC+WPvm8j1HWPmkEqGs5m02I
 sS2eEo6jdql1ZXwozHDeP+OLNGYndC4iYifOqF0XxMcqU5rQ+/c/n7Sw2W5mX1bEWnrK
 7UIg==
X-Gm-Message-State: AOJu0Yzzk2izk24/wO5m6qcYji5W7RlNWRIZe8+p0fOUV6UlvhJQbM+M
 CZhtJsXF1ryu9OgfjG91S0GX070Hu+8SswULtpltuz7vp/lzc3Tu4AFYEqKvUdqm+uH9UJLvDqX
 t496AboqV9UO3qngGmyCFwm0b1DmtMZsHQBbH0+PhboYv67LEkqsK6h7hGA==
X-Gm-Gg: Acq92OEKNkQ99VmfHYJ/Q/7clw0hjflKDJ5NvZM0iFqCnIyUeDx0PKWIr+coT3F4obe
 3rfEbNWD6g+7dBNRngDXXMWlVVJjFclXIRqb6u3k2IzsBamMMvE9wJeVcjw+hi8cOM5eHyWvgUf
 GhuWXKjrKv9Vv5/KDhnRZyO8GpuEexvIa9k6qnQALe2CM9feRXMZWz2ts1oppvg6pL0krZkJgqG
 +XraWpFHkGIXUsGyjt0hcyh97Dh/MzgvpGF5gu1nJgTuNvhlcZBPClZ9tmhKKKKivWCqBT7fbgy
 hz63PnDWO00AqO0xr9cujPSdSMcO1COvel1OSGp44NWfUe5c1TOdVNuq+2FKKi2hEtCO57O96fP
 mCA/w1/WpELkkSSho4NZ3ceTbKqPBtcM1BVXVtqKe21M5/7Py3jKZDXA/Xs0=
X-Received: by 2002:a05:620a:19a5:b0:915:f360:e974 with SMTP id
 af79cd13be357-91d8afca51bmr340813185a.13.1781654397749; 
 Tue, 16 Jun 2026 16:59:57 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:915:f360:e974 with SMTP id
 af79cd13be357-91d8afca51bmr340810085a.13.1781654397279; 
 Tue, 16 Jun 2026 16:59:57 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f132178csm50191986d6.7.2026.06.16.16.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 16:59:56 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 5/5] hw/riscv: add create_fdt_plic() helper
Date: Tue, 16 Jun 2026 20:59:39 -0300
Message-ID: <20260616235939.1358663-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
References: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDI0MiBTYWx0ZWRfXzyXX77KJg+tS
 p5ljwLnTd8XGunop+1NxzPvMqKuJctecaUXPCxqY/oGc9ZagPSICc6v93ANYR3M8zvPXvzFg6ED
 oMBIlc3WM3E28UNX9ToCvC3vT4cmbqQ=
X-Proofpoint-ORIG-GUID: kWLajFA0VUK2NcBVqDGbNDGqMpJe6p6E
X-Proofpoint-GUID: kWLajFA0VUK2NcBVqDGbNDGqMpJe6p6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDI0MiBTYWx0ZWRfX2EFK/4O7lMi+
 GA9TOhx+GDRC8paj082hZtF5/BS0q59tQIGAhfonFT7XXvduoV5LNJnNEGxzW12v3TgH7rDNm70
 UPcE7S0FCEiYC8zcpOKKkUBZtZ4Rxa7bfr/1LNSdRauayB4CZnksGlW7knKTxg7wb6B1/QWNqeo
 9lpV1EYSVSclG5AIFlO4UFKpOm9452+N68MXwOL9+mgbWjSobLi8W0+9TK/9aC13pjp7DJqira+
 V9KSoBjuG798eZ039GB3fsXWh0c5jQ8kWx+9JXPGdRDMSft/CfjBGxPLVEf9aaLqgn3LMQ5otVr
 /yM2mEoUV38PKeh5/wiLS+r0lWfoxuQKHLBT6bq//CQlv7aJOfuIlKuwbzMe5J7MdVvrQ7to9Yj
 +99c7Siuy/9mbtc0P+GmmE5d3Rx3XWKm5tBgrQ4FWK0Bq6IJwVr5uGssQG1o4Gez2uvB471Htbe
 iWlLOZckFe2+7EUiR2g==
X-Authority-Analysis: v=2.4 cv=acpRWxot c=1 sm=1 tr=0 ts=6a31e37e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1RCqQv7lTB3P1bPT2QYA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606160242
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Consolidate the common plic FDT code between 'virt' and sifive_u boards
into a single place.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 30 +++++++++++++++++++++
 hw/riscv/sifive_u.c           | 34 +++++++-----------------
 hw/riscv/virt.c               | 49 ++++++++++++-----------------------
 include/hw/riscv/fdt-common.h |  5 ++++
 4 files changed, 61 insertions(+), 57 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index b27ff13bca..e0e31af09b 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -200,3 +200,33 @@ create_fdt_socket_cpu_sifive(void *fdt, char *clust_name,
                                    socket_id, socket_hartid_base,
                                    phandle, intc_phandles, false, false);
 }
+
+void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
+                     uint32_t plic_phandle, uint32_t int_cells,
+                     uint32_t addr_cells, uint32_t *plic_cells,
+                     uint32_t cells_size, uint32_t ndev_sources,
+                     bool numa_enabled, int socket_id)
+{
+    g_autofree char *nodename = NULL;
+    static const char * const plic_compat[2] = {
+        "sifive,plic-1.0.0", "riscv,plic0"
+    };
+
+    nodename = g_strdup_printf("/soc/interrupt-controller@%"HWADDR_PRIx, addr);
+
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", int_cells);
+    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", addr_cells);
+    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
+        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
+    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
+                     plic_cells, cells_size);
+    qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
+                                 2, addr, 2, size);
+    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", ndev_sources);
+    if (numa_enabled) {
+        qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", socket_id);
+    }
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
+}
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7dfc18d3ec..d923f041e0 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -100,14 +100,11 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     MachineState *ms = MACHINE(s);
     void *fdt;
     int cpu;
-    uint32_t *cells;
+    uint32_t *cells, cells_length;
     char *nodename;
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
     uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
     static const char * const ethclk_names[2] = { "pclk", "hclk" };
-    static const char * const plic_compat[2] = {
-        "sifive,plic-1.0.0", "riscv,plic0"
-    };
     g_autofree uint32_t *intc_phandles = g_new0(uint32_t, ms->smp.cpus);
     g_autofree char *clust_name = NULL;
 
@@ -197,7 +194,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     g_free(nodename);
 
     plic_phandle = phandle++;
-    cells =  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
+    cells_length = ms->smp.cpus * 4 - 2;
+    cells =  g_new0(uint32_t, cells_length);
     for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
         /* cpu 0 is the management hart that does not have S-mode */
         if (cpu == 0) {
@@ -210,26 +208,14 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
             cells[cpu * 4 + 1] = cpu_to_be32(IRQ_S_EXT);
         }
     }
-    nodename = g_strdup_printf("/soc/interrupt-controller@%lx",
-        (long)memmap[SIFIVE_U_DEV_PLIC].base);
-    qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells",
-                          SIFIVE_U_PLIC_INT_CELLS);
-    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells",
-                          SIFIVE_U_PLIC_ADDR_CELLS);
-    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
-        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
-    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
-        cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[SIFIVE_U_DEV_PLIC].base,
-        0x0, memmap[SIFIVE_U_DEV_PLIC].size);
-    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev",
-                          SIFIVE_U_PLIC_NUM_SOURCES - 1);
-    qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
+
+    create_fdt_plic(fdt, memmap[SIFIVE_U_DEV_PLIC].base,
+                    memmap[SIFIVE_U_DEV_PLIC].size,
+                    plic_phandle, SIFIVE_U_PLIC_INT_CELLS,
+                    SIFIVE_U_PLIC_ADDR_CELLS, cells,
+                    cells_length * sizeof(uint32_t),
+                    SIFIVE_U_PLIC_NUM_SOURCES - 1, false, 0);
     g_free(cells);
-    g_free(nodename);
 
     gpio_phandle = phandle++;
     nodename = g_strdup_printf("/soc/gpio@%lx",
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index fa464e644f..92c30a6f4c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -326,39 +326,25 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     int cpu;
     g_autofree char *plic_name = NULL;
     g_autofree uint32_t *plic_cells;
-    unsigned long plic_addr;
     MachineState *ms = MACHINE(s);
-    static const char * const plic_compat[2] = {
-        "sifive,plic-1.0.0", "riscv,plic0"
-    };
+    unsigned long plic_addr = s->memmap[VIRT_PLIC].base +
+                              (s->memmap[VIRT_PLIC].size * socket);
+    bool numa_enabled = riscv_numa_enabled(MACHINE(s));
+    uint32_t cells_length;
 
-    plic_phandles[socket] = (*phandle)++;
-    plic_addr = s->memmap[VIRT_PLIC].base +
-                (s->memmap[VIRT_PLIC].size * socket);
     plic_name = g_strdup_printf("/soc/interrupt-controller@%lx", plic_addr);
-    qemu_fdt_add_subnode(ms->fdt, plic_name);
-    qemu_fdt_setprop_cell(ms->fdt, plic_name,
-        "#interrupt-cells", FDT_PLIC_INT_CELLS);
-    qemu_fdt_setprop_cell(ms->fdt, plic_name,
-        "#address-cells", FDT_PLIC_ADDR_CELLS);
-    qemu_fdt_setprop_string_array(ms->fdt, plic_name, "compatible",
-                                  (char **)&plic_compat,
-                                  ARRAY_SIZE(plic_compat));
-    qemu_fdt_setprop(ms->fdt, plic_name, "interrupt-controller", NULL, 0);
 
     if (kvm_enabled()) {
-        plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+        cells_length = s->soc[socket].num_harts * 2;
+        plic_cells = g_new0(uint32_t, cells_length);
 
         for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
             plic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
             plic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
         }
-
-        qemu_fdt_setprop(ms->fdt, plic_name, "interrupts-extended",
-                         plic_cells,
-                         s->soc[socket].num_harts * sizeof(uint32_t) * 2);
    } else {
-        plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
+        cells_length = s->soc[socket].num_harts * 4;
+        plic_cells = g_new0(uint32_t, cells_length);
 
         for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
             plic_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
@@ -366,19 +352,16 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
             plic_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandles[cpu]);
             plic_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
         }
-
-        qemu_fdt_setprop(ms->fdt, plic_name, "interrupts-extended",
-                         plic_cells,
-                         s->soc[socket].num_harts * sizeof(uint32_t) * 4);
     }
 
-    qemu_fdt_setprop_sized_cells(ms->fdt, plic_name, "reg",
-                                 2, plic_addr, 2, s->memmap[VIRT_PLIC].size);
-    qemu_fdt_setprop_cell(ms->fdt, plic_name, "riscv,ndev",
-                          VIRT_IRQCHIP_NUM_SOURCES - 1);
-    riscv_socket_fdt_write_id(ms, plic_name, socket);
-    qemu_fdt_setprop_cell(ms->fdt, plic_name, "phandle",
-        plic_phandles[socket]);
+    plic_phandles[socket] = (*phandle)++;
+
+    create_fdt_plic(ms->fdt, plic_addr, s->memmap[VIRT_PLIC].size,
+                    plic_phandles[socket], FDT_PLIC_INT_CELLS,
+                    FDT_PLIC_ADDR_CELLS, plic_cells,
+                    cells_length * sizeof(uint32_t),
+                    VIRT_IRQCHIP_NUM_SOURCES - 1,
+                    numa_enabled, socket);
 
     if (!socket) {
         platform_bus_add_all_fdt_nodes(ms->fdt, plic_name,
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 2d6b9a5d03..017278b611 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -30,4 +30,9 @@ void create_fdt_socket_cpu_sifive(void *fdt, char *clust_name,
                                   int cpu_id, int socket_id,
                                   int socket_hartid_base, uint32_t *phandle,
                                   uint32_t *intc_phandles);
+void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
+                     uint32_t plic_phandle, uint32_t int_cells,
+                     uint32_t addr_cells, uint32_t *plic_cells,
+                     uint32_t cells_size, uint32_t ndev_sources,
+                     bool numa_enabled, int socket);
 #endif
-- 
2.43.0


