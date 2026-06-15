Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBEBCD98DA
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 20:40:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZE4T-0002uO-7X; Mon, 15 Jun 2026 16:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE4Q-0002tB-JO
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:38:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE4P-0002DM-2t
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:38:10 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FJ1UWq1367680
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=GAA61L+XZ0F
 SCpoJ7H3XQj4XJSxu1eEJBcyu69Qdiqc=; b=ZhZPiPsSjfLQg+RRJAzmi9GJv80
 VwhujWR9/X8gZt+4Pax1R52rqKG0UTMrw8p/00kuxcs7xqYUuKl9vag5QK8QOC2u
 vzsU5t2g6miM1V7X369mt91ZKFRon3xwN2Oj1HDyW7M+JxQ/wy5BnCSk7/p6f+JA
 Sx/QUT/7sNHQXQQzYxbgT+ohK1xASeelglZkg/NfaY3AAIKOB07AjNKHFIGgor5b
 5pJlfYKVRXurNILUZJ7q9xd2s3lyfoTUidw2TYbKN31dhTNKYuCJNNDi9UWd+RLb
 YDdQ5/l+/67mwLcS6teoulswnJZ6NAUxAMdifDKFYRlprhllryex/JOkOqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etegutxew-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:38:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-517c65c019bso107795061cf.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 13:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781555886; x=1782160686; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAA61L+XZ0FSCpoJ7H3XQj4XJSxu1eEJBcyu69Qdiqc=;
 b=OhAhuNTtwfUM4HUTY17Dbi+2UfgT8vxDjj4dvQe6IqUFj834Aq/9HsEWFuG8miRBnu
 ozHRJ37ZwKP6ZPutXS0bmrMYWavZ/iB+viOQh8Py2X0W5+5lF9GIOmDr7vPEkIqXfpmd
 X+qA1hF1WNYaRo0co9KgCh5nIiuX+0Ob9Cj869kCEPiIQz2CgJKCpn8Cb7/xFVZGI6BY
 Hg7qdRwCcoGGs4kR0XAonhMDA5Q6jnzn7OzZLPaoI6UBH93qk4QkNYxCV3svWxwbNCrS
 y8d/6kyBJabYqa20oPPJGP0TDgaLCzEIltTc+2+9k8bKsiPYWSY9WDQ4Y5vhq3uz33xo
 KPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781555886; x=1782160686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GAA61L+XZ0FSCpoJ7H3XQj4XJSxu1eEJBcyu69Qdiqc=;
 b=lp6994NQDHmhRqVfG/V+o0HJdOt3KmdFt2tEZVpc2lD0hIyPnfXzJSGdMqbtFewwFG
 t5i2hCjYTyiLBf6388OR22g4X+bVGWZvBYyspKCdzxlOeDPXNrgSReWkdRw0cdazp8wH
 jAglMDEP+Ytk5r88lSjt9E3iMvxg2QmPxDvsFnrTpBbkpaFOru02E98O2QoHVu0zSZ6g
 UZ30FJVnA49T2HNw1y7H75UC/xD7UQcHInsWSNghixssFkBJAAoRskfLh03gWdY5FIA6
 HCc1zvbzYnaC/fhY9tqK/TPgZN516p4C3nr0mqFfaRCYTa/j8wLnXrP710GJvF0jPvXg
 8RIw==
X-Gm-Message-State: AOJu0YyHLAH5ZJiFc5LIf9cXBGiPOGamkWs8PN/WWbw54MSwiMelCXDZ
 9u9hhPZb25f9qGb8bjDvUiq0VKkJDw9b+CdWyyXHy+8V0xHeQmarsFJ8k2d/2gdw++thV6RRIxw
 gNgk3EyVv+uta7hCHLiowiBpWCGKIoFvpVFNYb1lasruyEGXxjDQC18ovmw==
X-Gm-Gg: Acq92OFGTIvr2BblhmsRapZydGKaQoJGAyxXLRBebPyBwJqi7kE0XafGORnKegcqbWu
 Lh3cXFjCfm3TY70Dn/jLajj6pxC7r7cDI+rROQEOwO2p65WiR3ecffZLMS72mnFmigW3fn9/Gim
 V74FFY8R8JrIari6j1vQRx3uZ7l/EdzcQgfVhFa0yJzTXbKmOc4Zj7WsmEwQe8GvGmfcPLYBiu9
 zlKNi9rottCSInN/kD6VroPkn7OtagKllcxoY08/LfQsh3COAU9zvKim7zMYT9vh9dPGqIow4zz
 UE+r7mwvTG0Id5FmuQ8gkYorIGHwN8ylAIG9LBxDXpjNLpRItZDHEy7vqxSQ0PWeF9YEib0MyXT
 AEFKcN6rSzKiqLsquO7tesWJwCwx+iAm4ZGFxThKg9MG5U/MCoHXTpLyzHqA=
X-Received: by 2002:a05:622a:8c7:b0:516:d943:175c with SMTP id
 d75a77b69052e-51953718a35mr197446501cf.56.1781555886332; 
 Mon, 15 Jun 2026 13:38:06 -0700 (PDT)
X-Received: by 2002:a05:622a:8c7:b0:516:d943:175c with SMTP id
 d75a77b69052e-51953718a35mr197446121cf.56.1781555885850; 
 Mon, 15 Jun 2026 13:38:05 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f4740fbasm9749906d6.29.2026.06.15.13.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 13:38:05 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 11/13] hw/riscv/spike.c: use create_fdt_socket_cpus()
Date: Mon, 15 Jun 2026 17:37:31 -0300
Message-ID: <20260615203734.954428-12-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIxOSBTYWx0ZWRfXw0e+zVZ4/EI4
 9CtHBJnQB5tLObFXggPwm3PkXauraI5YgASHer1TwSY5QEtCf7JiDOTCkwBzcV9cq5IaMGTPBRT
 6vqlOJ7kaC8LbetXbA2TcM3Hu1BI8tgaBmsQuqqijXYBRasoOPlozxkJvn6RIURc/FsxlJ56Lmn
 juq6bQYOg6bULDj07ZLeHmPFKz5U8tSkbyDIy/E/8+rCcZWY6Y56Zx3XaHfURVhrPBy5DP1ILAx
 c/cpSDl3TibjrnPh5FrymL7HPGCRnW2wH/XewKBCRG8D8L7uyctKUl2XVc0ROa4IgQvIjWanKeA
 ENFWUFBmF4/w6f9B7zXYuz0ruTQn/sKjgLfNyF1CHdP/9EMNKSeck+5zeP73b0+HheWQtZc2hce
 Vm/Aj5fnmRXsiACl+MJVPil4YhjjDltnKCLc9c8Of4oAvxRBl4k2EHhO2Cv1YXikDFwiWtfWZJ/
 BIdmZoLHOFKrUVxeRnQ==
X-Proofpoint-ORIG-GUID: EBGy0SCly_7IVeNbfkqjYPgv5Jw5CZ7A
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a3062ae cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QnBC-bTUeyzvsoOUzocA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIxOSBTYWx0ZWRfXyFk74qgCe6zW
 291+A/MBvreqG0n9zcCpIskeUSAiquqyrMEeqPIXgtnpiL/YV594KCa/RunZHte/ueMQhlLSl4C
 9aBaEbrvlmMLwPENodQ5vw2UeS6gcwA=
X-Proofpoint-GUID: EBGy0SCly_7IVeNbfkqjYPgv5Jw5CZ7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150219
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use the new FDT helper to create FDTs for the CPU sockets.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/spike.c | 54 +++++++-----------------------------------------
 1 file changed, 7 insertions(+), 47 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index ee8232f734..4e60724c14 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -56,11 +56,9 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     void *fdt;
     int fdt_size;
     unsigned long clint_addr;
-    int cpu, socket;
+    int socket;
     MachineState *ms = MACHINE(s);
-    uint32_t cpu_phandle, phandle = 1;
-    char *clust_name;
-    char *core_name, *cpu_name, *intc_name;
+    uint32_t phandle = 1;
     bool numa_enabled = riscv_numa_enabled(ms);
 
     fdt = ms->fdt = create_board_device_tree("ucbbar,spike-bare,qemu",
@@ -82,48 +80,11 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
                          riscv_socket_mem_offset(ms, socket);
         uint64_t memsize =  riscv_socket_mem_size(ms, socket);
 
-        clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
-        qemu_fdt_add_subnode(fdt, clust_name);
-
-        for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
-            cpu_phandle = phandle++;
-
-            cpu_name = g_strdup_printf("/cpus/cpu@%d",
-                s->soc[socket].hartid_base + cpu);
-            qemu_fdt_add_subnode(fdt, cpu_name);
-            if (is_32_bit) {
-                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv32");
-            } else {
-                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
-            }
-            riscv_isa_write_fdt(&s->soc[socket].harts[cpu], fdt, cpu_name);
-            qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
-            qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
-            qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
-                s->soc[socket].hartid_base + cpu);
-            qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
-            riscv_socket_fdt_write_id(ms, cpu_name, socket);
-            qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle);
-
-            intc_phandles[cpu] = phandle++;
-
-            intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
-            qemu_fdt_add_subnode(fdt, intc_name);
-            qemu_fdt_setprop_cell(fdt, intc_name, "phandle",
-                                  intc_phandles[cpu]);
-            qemu_fdt_setprop_string(fdt, intc_name, "compatible",
-                "riscv,cpu-intc");
-            qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NULL, 0);
-            qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1);
-
-            core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
-            qemu_fdt_add_subnode(fdt, core_name);
-            qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
-
-            g_free(core_name);
-            g_free(intc_name);
-            g_free(cpu_name);
-        }
+        create_fdt_socket_cpus(fdt, (&s->soc[socket])->harts, socket,
+                               s->soc[socket].num_harts,
+                               s->soc[socket].hartid_base,
+                               &phandle, intc_phandles, numa_enabled,
+                               is_32_bit);
 
         create_fdt_socket_memory(fdt, memaddr, memsize, socket,
                                  riscv_numa_enabled(ms));
@@ -133,7 +94,6 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
         create_fdt_socket_clint(fdt, clint_addr, memmap[SPIKE_CLINT].size,
                                 socket, intc_phandles,
                                 s->soc[socket].num_harts, numa_enabled);
-        g_free(clust_name);
     }
 
     riscv_socket_fdt_write_distance_matrix(ms);
-- 
2.43.0


