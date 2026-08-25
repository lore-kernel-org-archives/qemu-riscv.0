Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BE5C61DCA
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 21:25:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyycg-0003Vs-T8; Tue, 25 Aug 2026 17:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyyce-0003UV-Mi
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:23:56 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyycb-0002Go-Ua
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:23:56 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67PL9cUq3675790
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=2xwFh4IjNi5
 ZPP2cvlmytxr2GRgCFO2TpO0YhBlo5+c=; b=c1VwDv0FknXPwOBMOTnlgfTv1Q7
 8KBUx76l2T6MLiMfrphBbe+hYzMwMIMOLMiaP8oi9vay7rFWUnKrJBMrqB/5qrcw
 84zIs8pdA1vwPNTOkA1sPjtBfuXj9skTeOxWJ/pE3M+e9X/dcDu7Cuk/HRDIqhfy
 ngYYllVHAo3pyOd4o0ddFXq8RxViiqSlyemWpwK2+uqWvY1n1XRnnBU/nT4sKLFj
 xaNAx3vo6/FUorbNSeVXUVHwCHkCZ6XuvonvbhtieGOBTsV34PT0tKHcCrIomurS
 WqgEXLR2egw7zPq6UyvJWo88xzI3zQqYsGRv7jmAuC5JviytVQ8VpoekQBg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxgtj4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:23:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8eac2620cb0so3473816d6.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 14:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787693031; x=1788297831; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2xwFh4IjNi5ZPP2cvlmytxr2GRgCFO2TpO0YhBlo5+c=;
 b=ZDc162GuCOGIDSpQ/FdFuMaI6K7/0wfsRv4/usCdkdTWt/2QXEmTClJzndCxaxSxJQ
 PoNkqY4Bfo1RRzDa7Hn5tbW1r5egxGXGzBvcsrNyGz5hWiE+PzRHkUsxaWqYOKTRbCMC
 yR8umKlwqO9Kk2qng+PyiwwzHrSazpX08iSGTa8VOdGet29+zPnHYpthzInS4u0WUGht
 M9sHGbOOVx3tH82/8h4snNvictJru/b3M0+BH49ydKAHVwrRBaLesgb2wOdW7bYl2nEK
 gShLB/jYGULAHBJ4j0bNiDdyfiEJ3yq7obNvl0NkVlPB5AOyuDOoRZvSArlaA4d4e91U
 RO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693031; x=1788297831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2xwFh4IjNi5ZPP2cvlmytxr2GRgCFO2TpO0YhBlo5+c=;
 b=fRRgahLjEQg1nJOZZSXiVTzwC7Pn0nING09pKNj7yYKDz4kUmiMrKxP9jw5ZZK6nzU
 L329XI+QsNpA7ToOQK+fy8sYkiUa8phFFcrYMeIoNgJYTMbve/plFW/LADkMxaWdSArk
 /lLcyZvS1z8kMdBeTd8BIuCx5uW4h2+BlmAT/49GDgFol7Iz+bB0zxmrbVB5y4lIIwKS
 sv8fa7Mt8nKvHWLmeu1NglAQiGV5E4OT5rG/Odh7R8gf72uvzz0+OUQyv37gP/tctfwC
 ov2kavY21MBa7CzlDpSf/g51rw5LhZfFmPeClv/VdnCTcIWsXFB11XRgRK4Ewnk1kFBy
 hARw==
X-Gm-Message-State: AFuF++k0o8TNgF7f7txmI8ZT3H4w44sgkQ+oVgdPRm0PTyDNTohSM63g
 brMQwhCkeVs3AQArY5ttt7LsKUC/mCngVif2DLxVmGUjPbmSI1nKY0IyTapddy31Xz/wEH4hYHv
 heItcDyzBAHozpQjtcSfypqahTPgDzahlFwIpCoou8Dmv2p68fsTexS1oWA==
X-Gm-Gg: AR+sD11xt5pSiI6aF2ogMBFCv20XUpE5gHocY13jkNsiNgla+T/uZKkktiZ86wHHC4G
 15QAmnMVYSn1jrJt11b9LdNIhyLw/HMqXmYT9iain9PzQ7tgo+tWcioQCJwAqoOKBKg0Szz0EUs
 B5/I/fs8E9MrGDxAp8ydjV8Nns33h93U+z3TIJBkefufnXGR709Bz3+mb66Xb7UJ2qLXsngIyVy
 9TPneJhyRiYAHxO4Duc6A/leFN86pSzxETcYCUjIECf5JRDxOvHAuiAxi68KnGSENQ1Ta80vupW
 PD2bMjlXU+Fmd0/PSUkEBP9atda0zML9QoSCsb9ZV456Cai9o6RC34C/NGKcI8vmO0P/RBewfX+
 LrLIHeev8d3mt1TWQaChJ9i41tvtBzNYLoFjl8Q==
X-Received: by 2002:a05:6214:5691:b0:90a:6c34:f8aa with SMTP id
 6a1803df08f44-90cc7929cb2mr21387116d6.27.1787693031520; 
 Tue, 25 Aug 2026 14:23:51 -0700 (PDT)
X-Received: by 2002:a05:6214:5691:b0:90a:6c34:f8aa with SMTP id
 6a1803df08f44-90cc7929cb2mr21381946d6.27.1787693026275; 
 Tue, 25 Aug 2026 14:23:46 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cc65299f0sm8646386d6.41.2026.08.25.14.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 14:23:45 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 01/13] hw/riscv/fdt-common, virt.c: add create_fdt_flash()
Date: Tue, 25 Aug 2026 18:23:13 -0300
Message-ID: <20260825212326.1907-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
References: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8e07e8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=agbqTSZeYTzrP7BmR6QA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 9FdZ1L8SKewXWX0TPLmzVxAnhHWXypAH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfX2FTmvNtBLOaw
 pxNkQkniEVywIqAXoeMfa/FSROrDOgVBLMQhh6UVjIGGYy954qfcMkUhL8hHc/sWG+/hJLfPu72
 QePZa7Kj3LidoYV43C9LfhTLhqmV/pf3GykWjKzoFtvSSfLAlz1ApYWT5yvgpfQG3nhTmSoiKOJ
 m1ZcUbbrdOkdG2CiknngURlH0/2i8bcquPWDTkaYc+32OPhpVlibZmeTz8pF5QxHfU6xiAATF28
 ikXL1fCUkOdXioQ9rhSyTUafXU/M6gMjBqb5InK082xxjbVrLWAI1mKFGgl3u28zP8/2DMpEeJG
 a6+6dt8Be0P9NlBPKeIcCqCPhTa8Szt/TNe7IuFgvEgYxWWs0Fbwfi3dpaJ4zF2ZapG/meZXGPG
 TvexP+c+5WhEyqVGWf5b5OTJ+yWycL5HDW/lpgpQ/b2fu+ZmoHWFRkOmSVWbDN6ONPhV1ceb8Mf
 CnYF6WcP00FqLolyiaQ==
X-Proofpoint-GUID: 9FdZ1L8SKewXWX0TPLmzVxAnhHWXypAH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfX7jCTgVFzZfcm
 7o/mFvLYbM6XK6x76mBHT/LhK50XdMsCSHaQDqHqXxj/vMA8pqQjqxWCNPBhK/FK+sZyACYKDzM
 a89p9+0Zfzdz8XQYS4V2Aif9UOV0gBo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250182
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

Add a common helper to create a cfi-flash compatible flash subnode.

This change only affects the existing 'virt' board for now but it will
be used by the future 'riscv-server-ref' board in the future.

No FDT changes intended.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 12 ++++++++++++
 hw/riscv/virt.c               | 18 ++----------------
 include/hw/riscv/fdt-common.h |  1 +
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index aa143a618b..e74423a225 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -282,3 +282,15 @@ void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name)
    qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
                     fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
 }
+
+void create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize)
+{
+    g_autofree char *name = g_strdup_printf("/flash@%" PRIx64, flashbase);
+
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                 2, flashbase, 2, flashsize,
+                                 2, flashbase + flashsize, 2, flashsize);
+    qemu_fdt_setprop_cell(fdt, name, "bank-width", 4);
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d58656f70d..33a121abd9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -865,21 +865,6 @@ static void create_fdt_rtc(RISCVVirtState *s,
     }
 }
 
-static void create_fdt_flash(RISCVVirtState *s)
-{
-    MachineState *ms = MACHINE(s);
-    hwaddr flashsize = s->memmap[VIRT_FLASH].size / 2;
-    hwaddr flashbase = s->memmap[VIRT_FLASH].base;
-    g_autofree char *name = g_strdup_printf("/flash@%" PRIx64, flashbase);
-
-    qemu_fdt_add_subnode(ms->fdt, name);
-    qemu_fdt_setprop_string(ms->fdt, name, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-                                 2, flashbase, 2, flashsize,
-                                 2, flashbase + flashsize, 2, flashsize);
-    qemu_fdt_setprop_cell(ms->fdt, name, "bank-width", 4);
-}
-
 static void create_fdt_fw_cfg(RISCVVirtState *s)
 {
     MachineState *ms = MACHINE(s);
@@ -1040,7 +1025,8 @@ static void create_fdt(RISCVVirtState *s)
 
     qemu_fdt_add_subnode(ms->fdt, "/aliases");
 
-    create_fdt_flash(s);
+    create_fdt_flash(ms->fdt, s->memmap[VIRT_FLASH].base,
+                     s->memmap[VIRT_FLASH].size / 2);
     create_fdt_fw_cfg(s);
     create_fdt_pmu(s);
 }
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 1729a6abc6..6e438e0278 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -36,4 +36,5 @@ void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
                      uint32_t cells_size, uint32_t ndev_sources,
                      bool numa_enabled, int socket);
 void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
+void create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize);
 #endif
-- 
2.43.0


