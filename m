Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02B4C43327
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 12:14:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weAsV-000327-9o; Mon, 29 Jun 2026 08:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1weAsA-000272-1B
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 08:13:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1weAs6-0005Mp-8U
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 08:13:57 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65TASuhl2603465
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 12:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=MbGjSXSe/SE
 JVeLI2ltqryQwXs/ej1Lojop1PHAWL2I=; b=KDcxxJuWjELmdLl3Jn6CZ7/CmtW
 1aJjoD1kxP1YKz3T78zrvhmxpg067mz9Cx/R54PZ1XmD46OgJRviiSmhpDAw/nYh
 XdUHzVVJ9be79PsPN3Wc4nSr05lr1qw3SNyp3ltv1ZRE/qNgYyZ63oOOQnIm3M72
 gtkbaFRk7CCK1aJhH4mEVyqV4d0KMYLoi1NBzKkUXG+XG+Lr+mPZlB1jwRlnapbl
 3c1VpLhfgdNmMvZG937NctPNluhrgdExyI8izawhELfS7A9GpBdJwSqMr6j2A0bY
 ZshJRuy/m66QniCldBeeoKP4sdTHnMDNQogOdrn0UuMotwHNWKt3IAU5BvA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq88q24-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 12:13:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38010ab3c0bso773835a91.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 05:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782735228; x=1783340028; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MbGjSXSe/SEJVeLI2ltqryQwXs/ej1Lojop1PHAWL2I=;
 b=DqiSBzoGSMWaDx7wY1fT25BVRU0mIJcOC3zsExpmmzJFwxgseRp2z5IB3sGFoSVwyn
 yWFdAYtmA7yYoQsTkszv+/TGrzzXWwMNuV3tJSPI5f+CGq0i8weSKlf7CjWPXtTemsuV
 qwDoCquIMMu+U5UvrVV89wsesuInbeiqdDaBFNt1oMjTKr5ZTbMhn3OriM0N99KF9uCw
 cJCFzfCPyJCsfQjOBhBtJQwCxpCbJiSc0FcUfnR4jvXqnxuFBa5DbwiM8IHjeHIcV0Qh
 Qne59Zx3nDxnxcLkvUoaDnF2FP2IxU517UgQ8772vqzUFXlxXtuaS9WVlZvkHl5NVQiq
 2wFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782735228; x=1783340028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MbGjSXSe/SEJVeLI2ltqryQwXs/ej1Lojop1PHAWL2I=;
 b=a9DZy73YBaZesWttvHtuNy5SRv9XGyQ8I3ABvuBGFlJk4zU08dHAvCHjGly7Dhs+M7
 EPZ8Szl6nKTB+sn1/NS/kAM++ZEGxpPrxPIdfsN2sfMkZQsNgO3fsUgbjFTwUIV4gG15
 Q8K8OQ593qTWgc9nkqKGrbWzIld0rm5fOAZY1prGPYrgXfK3N/zaf0mhWLlYBIqAushO
 UosessDd0XHRuEStbPuIBo0k9RQ3UcyZ3aZXl9/6Wa+VNoXFWXDusgWZXRqCWQTzaGPI
 ZwQIK3QsUByVL31f3AAuZHsWHrBTAh+P85Gn6KuBmK7J5Qv46BG4jucJgXpz3sVtGdfF
 jeUQ==
X-Gm-Message-State: AOJu0YxeO2kaJe8vmSY0VlU8jD5Dvd7g5JZk9bc0VryzkvJw0yxrSdVZ
 AMYGjWj0dXlQnECDqsIBFhtSIfPHyyqjensLefjH+a7bojxMbuPQrBpaPc10EnCWcViM0u+vjdu
 ffmU1vdjhRfnawRV+EiAUUyLtSQ9Z+nkIbHWYKD97hAnIZIsjteSwe8SkxQ==
X-Gm-Gg: AfdE7cmOxvtuWcAha8pdo+HZJCxnsCcwnY5NqAyz44KmnicURMXkkuldJBOAxOHR+Ts
 E/K5p7KmXJnmFQLep681EdRnBhYsQlPVCe/O/d4Zu7cquuD322ajQiC9NIl2XeOslfjWuGgzN5I
 EX35GeBIp6ZX5dQq5dZYbNs4Pls6uj6LxsInzgyt/7Ru6WZlW/V9H6d20szXPnlRXdF4mkZwz1e
 DsJCL/t85KgX2YwVMXPbbDYWacfyPSPyEl9fsFZhgEvEurt3gnpVUzhVjcJC9Rniek/ZbUzVfTh
 l0UYdWON74Sf7EZ1WbP6jkJedx2ZhRV1vANrN4ZSc3Wycu42zAMM43Lya21o/XL+ItaU/AIt9NC
 2ZbPJzUbEKqCGV0ihrnTtys/3OP4XtgC7C0mHwjeMq6YePg==
X-Received: by 2002:a17:90b:5826:b0:36b:b4a1:2939 with SMTP id
 98e67ed59e1d1-37dfa251534mr14654143a91.15.1782735227936; 
 Mon, 29 Jun 2026 05:13:47 -0700 (PDT)
X-Received: by 2002:a17:90b:5826:b0:36b:b4a1:2939 with SMTP id
 98e67ed59e1d1-37dfa251534mr14654110a91.15.1782735227518; 
 Mon, 29 Jun 2026 05:13:47 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37e1c93272fsm5800179a91.14.2026.06.29.05.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 05:13:47 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Tao Tang <tangtao1634@phytium.com.cn>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/2] hw/riscv/riscv-iommu.c: fault when !PTE_U and no priv
 access
Date: Mon, 29 Jun 2026 09:13:34 -0300
Message-ID: <20260629121334.567587-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629121334.567587-1-daniel.barboza@oss.qualcomm.com>
References: <20260629121334.567587-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: esZgFD9Kp2S1-yTajKejjy37YUS_a4t7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMCBTYWx0ZWRfX7ytnUYfbLYMZ
 RjGvyWNKSYwLtD3BFtdHMU5pYTwEn+XAy7b5FcxF5TMVuHy4UAqO70W91PN+iCz1MUVHC/celzW
 VH5Zd+O6faD69n44G7nAfU1RfqrQL3Q=
X-Proofpoint-ORIG-GUID: esZgFD9Kp2S1-yTajKejjy37YUS_a4t7
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a42617c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=mpH3L83ql8VJAxoKzUcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMCBTYWx0ZWRfX4csARGUtn5aw
 brrlQTVpOVpozEV0YeT9sZFOMKXK76qhNUcnEsx0paQT7g/46wSjWHRd+Mpdx+4PfZf3nuovcIp
 RwIN6QYRkbziWRsu4ebD/KF12gsVIyTmkignqKbpwQlb7obBltBKL44ZAMccJDbvMqPD/hV95Wp
 mKDkTZFsnxgdhQoezL1GHi74bUXevfN6Xy2zw2jCHBW/IBLS9ynVzNXmZ+Lt31ePOYKJAAquVbF
 jOPGkDARLUl0idyZ0Ra9w9rZ1bMn+vgEXTNtJ7EUF0Cd6grkrrg4oIrscYt+/G47llIn0zRHIId
 48tzXUYQEyzPamTCih0jYDr+ibI4IdNMBMlZlYePYjeRZCi6okoibDEJAcaLQpHXMYVU2NOpCJr
 /UBlOM+T/9i/DVOlBnOjTKIBcIvjK5barFlAZ8TKSiZ0o1DOfLewiKM8A7q2N54As0JSZzNVnr+
 KL1m9jCtJdK5Ex7CzBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290100
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

All IOMMU accesses are assumed to be user mode unless told otherwise,
i.e. we have a process_id.  In case we have a non-user mode leaf PTE
(PTE_U isn't set) and we are running in user mode, we need to throw a
fault.

This also reflects on qos-riscv-iommu tests: the tests always run in
user mode so our PTEs must have PTE_U (bit 0x10) set.

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3553
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu.c               | 8 ++++++++
 tests/qtest/libqos/qos-riscv-iommu.h | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 453601d7a5..e6d2ca94bc 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -297,6 +297,7 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
         G_STAGE = 1,
     } pass;
     MemTxResult ret;
+    bool pv = !!ctx->process_id;
 
     satp = get_field(ctx->satp, RISCV_IOMMU_ATP_MODE_FIELD);
     gatp = get_field(ctx->gatp, RISCV_IOMMU_ATP_MODE_FIELD);
@@ -470,6 +471,13 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
             break;                /* Invalid PTE */
         } else if (pte & PTE_RESERVED(false)) {
             break;                /* Reserved PTE bits set */
+        } else if (!(pte & PTE_U) && !pv) {
+            /*
+             * All accesses are assumed to be User mode unless
+             * process_id is valid (pv).  In case we have a
+             * non-user mode PTE and !pv we need to fault.
+             */
+            break;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             base = PPN_PHYS(ppn); /* Inner PTE, continue walking */
         } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
diff --git a/tests/qtest/libqos/qos-riscv-iommu.h b/tests/qtest/libqos/qos-riscv-iommu.h
index 90e69a5d73..c218e9d66d 100644
--- a/tests/qtest/libqos/qos-riscv-iommu.h
+++ b/tests/qtest/libqos/qos-riscv-iommu.h
@@ -54,8 +54,8 @@
  * PTE masks for RISC-V IOMMU page tables.
  * Values match PTE_V, PTE_R, PTE_W, PTE_A, PTE_D in target/riscv/cpu_bits.h
  */
-#define QRIOMMU_NON_LEAF_PTE_MASK   0x001  /* PTE_V */
-#define QRIOMMU_LEAF_PTE_RW_MASK    0x0c7  /* V|R|W|A|D */
+#define QRIOMMU_NON_LEAF_PTE_MASK   0x011  /* PTE_V | PTE_U */
+#define QRIOMMU_LEAF_PTE_RW_MASK    0x0d7  /* V | R | W | A | D | PTE_U */
 #define QRIOMMU_PTE_PPN_MASK        0x003ffffffffffc00ull
 
 /* Address-space base offset for test tables */
-- 
2.43.0


