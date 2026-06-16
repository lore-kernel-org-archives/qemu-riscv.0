Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E84FCD98D2
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 00:01:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZdha-00024b-1P; Tue, 16 Jun 2026 20:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZdhK-00022j-76
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 20:00:08 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZdhG-00084k-Ab
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 20:00:01 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GLTJlG248905
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 23:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=WqDMeKheitM
 gA2PlOARFdVAHfl6rsSJccdZUs0l87dc=; b=HMxJMvgitO7dcr+ZIPKNGv5vjYZ
 CxIL/sX9xNl9YjR7ZHEi+eZn2d70lZT/bN28gaSIcazfYlXdhu0G2tAXlRI9vDJX
 Tp236QJ0pBW+F2zFcsH8k4MzcCpusur4SYzB2s0kP34hOj4LBiH5ffwhBCN/CKLS
 f5ryTTVP9vkn9Qgm7VJGCmdR82i0zpMRzYGfZ+vtCSe1tx0dxOkbKkUN4TxVWzFW
 HgWFgu0kLreTymL6lJhElgrDwmCDHhyT/Rzs2PD2lNi3YeoDwemQHXU3WB3Zy4p3
 lErDF6NbbLwSlY5Rr08bxQYqATrKk75Cl4Rbo+g6OhAM63RcNbKfyJjWwsA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet0dy1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 23:59:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8cebec24b12so101731346d6.3
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 16:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781654393; x=1782259193; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqDMeKheitMgA2PlOARFdVAHfl6rsSJccdZUs0l87dc=;
 b=VnBL/xoZoUUncCtpdTIJ4qvsIif5loH5hcBCnUD79+DYviY7rYqik7Q77qtc0lSPhs
 BilWFALHQvLjwrZ4TG0NPWrhwCIkEIf1n0Yo4YHxXVxNiqo26rTwcyaiJRwjYrzmHmcg
 S8hIX9WDft2DEE9dkkbmGMEIkbsDOkh/O/xQQDBT4AWKRKoOGYEvGGwcXNse4Dwd7dji
 uurxwI24d7LhrRco8H4q283P+/5dWhOYLMTiEi/f+zojujySBslUjkQ5UWlkOmoev4bR
 Vzj0J6W89NjmiyLbuI4cOwiBl8hjIBKf9tgqIX+fOLMLkKCbsScxrh2b5aRdkAdUjg9z
 J39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781654393; x=1782259193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WqDMeKheitMgA2PlOARFdVAHfl6rsSJccdZUs0l87dc=;
 b=GvGi156kQc1xg4NYNrZWeBzb2xSFeglwohoxDfGJLhzHiPyAf2VXNJ7lDKJhm/4ywE
 rjhDk7oj76Mb+lwuSUYCn8YJ/Rp6Oo7FA5ub/7jyYmk0XevR8x9lmG2lQQAeOqXmG3q5
 VFtgp5fOAp79vEF/A2diQlSfKDz/WyXlYjqq/BuUbRclcnqvgjTLn4iFtM2nELxRo1S/
 2Eh8/pvaL2OVwxJ053mgtSlkq+X3vfTEOFf+jla/+XhaloHtht/eSwnSKA5Vc9nceg9f
 4oBLWigADiboVPtUKA308VzGyDYdnqy9UWfzR2RnSDC73ToVXYdSdaSfn2S8qiVrpkNQ
 pO1Q==
X-Gm-Message-State: AOJu0Yxd34DJOCXocpl5LoQFqlcEEGm/MMn4PqpuMoBpV6TqHQFPeCd6
 kcCUk2Tept6J+5HY3NrRM+PTXI2RfWqQr1alxyZlgvf+8NgB16zFEsXc3v2bd2senmNKWaPaPpA
 aAfzGU9uf3PMEZAlyh69jdOkn0Qqpac4/Muy/7Ql3QPUDkPORa69A+Mkg9w==
X-Gm-Gg: AfdE7cm9lxwiGL7e0w6P01eDz+tLcvOq1NgNc78Wy/JICSEh33IlHvdLKEHwFmxOQmn
 rihLNhYQpxN/bxvguTNTpD5yOKxPdrtU1MEPkYhzR7D4dE5h5ZnDNd07GIMHUHJoh5EHF1yFd7I
 TCGioVYF/3dPh+rn+pPTtFxqP6DKw9QFnKR5sFkQPQs0HAIMgYJNuc9tNFtdF6I2NvQrVlEkkrN
 ekYl9rqnbq4TRzXjiaZFDClBud5lx9VKt+qBMuDplaZa8LFpKsir/NPdHspaplO3sNcwIcv49q8
 KtQBZCSbOeRjxkcXXnq3oYFKLeNZ7c40/76VjGUCeOjR4GyTMWIkZZ+Imi9556V/bSpXfiSc+Oi
 dyahol/Ro0DHfQCl6DDFj0c5QwiNRsHH+Ai8EYk12VSdJJX8p40slF27fu3g=
X-Received: by 2002:a05:6214:258d:b0:8ce:e409:22d8 with SMTP id
 6a1803df08f44-8db83519ca5mr23749936d6.28.1781654392568; 
 Tue, 16 Jun 2026 16:59:52 -0700 (PDT)
X-Received: by 2002:a05:6214:258d:b0:8ce:e409:22d8 with SMTP id
 6a1803df08f44-8db83519ca5mr23749636d6.28.1781654392126; 
 Tue, 16 Jun 2026 16:59:52 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f132178csm50191986d6.7.2026.06.16.16.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 16:59:51 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 3/5] hw/riscv/sifive_u: add #address-cells in PLIC FDT
Date: Tue, 16 Jun 2026 20:59:37 -0300
Message-ID: <20260616235939.1358663-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
References: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e23513vvvJ5zfDUcFVisE_Gn-4bKbaUK
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a31e379 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XZ4Qgz962IF3wEqZkZEA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: e23513vvvJ5zfDUcFVisE_Gn-4bKbaUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDI0MiBTYWx0ZWRfX2dr1BAxsCwFD
 5mCOuroIXN/Qjt6Ve/e2mPkGvPog2ofT03mPpUcx8pBHxpwSeMa7xJpZ/jddMoFl454W6otVxnN
 h2HzXxMTOfprtEQEgor6RUP1ileUG/MY/lhw8LkQnD5HDjvA0HFyN4JgkIO3gRsrNkaFznF5kIN
 eubSbGsSZFKbGBd86RC7ZHmS+2Qoqv3PPnVqHjat26h0hPZJMbXpO7w/VRn+wYv8D261Z47YUwK
 M7u4qTerxcrfjfyPDVxDf3SCT5IfBxxxl6ofHaiEIyuqjLuRZxAFYcNoCVbNnF59bZcMrTyFr0m
 aKAm9AFX1QnE7ExDc5e8mLlPgFhvb39OF3zeEAFby0mndnF0xfE/YfU15tP9u3X5fmm3+IJ+TCo
 1nm+uD7VjhythkxwATmOdE3iB2VgdhI8j4Pzklut9sGbIXdQGlWL0ufTvmGH2h00w26V6Y6vr25
 Jz0ISv4jpBSooFnDSNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDI0MiBTYWx0ZWRfX56OhNLn6KcmZ
 9JUbJY8oIcIkNrAvKYo517pXbEwCsjWih21+1p6TC/zOJTFVaZkfzypHeM29rnp1RhLW0QNFntD
 sxtmBpxfWZ/DHScYaLXRBmMWrlylKf4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
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

By Linux FDT docs in [1] the "address-cells" property is mandatory.  Set
it to zero.

While we're at it let's also put this new value and the interrupt-cells
value in macros, like the 'virt' board is doing.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/sifive%2Cplic-1.0.0.txt

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/sifive_u.c         | 5 ++++-
 include/hw/riscv/sifive_u.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b3468254f5..7dfc18d3ec 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -213,7 +213,10 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     nodename = g_strdup_printf("/soc/interrupt-controller@%lx",
         (long)memmap[SIFIVE_U_DEV_PLIC].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
+    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells",
+                          SIFIVE_U_PLIC_INT_CELLS);
+    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells",
+                          SIFIVE_U_PLIC_ADDR_CELLS);
     qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
         (char **)&plic_compat, ARRAY_SIZE(plic_compat));
     qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index e4c9860d50..aed966a62d 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -156,6 +156,8 @@ enum {
 #define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
 #define SIFIVE_U_COMPUTE_CPU_COUNT      4
 
+#define SIFIVE_U_PLIC_ADDR_CELLS   0
+#define SIFIVE_U_PLIC_INT_CELLS    1
 #define SIFIVE_U_PLIC_NUM_SOURCES 54
 #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
 #define SIFIVE_U_PLIC_PRIORITY_BASE 0x00
-- 
2.43.0


