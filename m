Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F02EC43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHq6-0002oa-CD; Thu, 02 Jul 2026 09:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHq4-0002mQ-NE
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:24 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHq2-0008Ex-SZ
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:24 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0YxB417130
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=XbPNXFloQM3
 dUvPD21224Iu0dG812ZdobBoG6oZrg1g=; b=fTCdW9h+vlzFjotbIcLfFQPzsNj
 sKIiTPqB44PXTSh7kt1dMcWNRGdmbvgTGN1uzc54TjulSq+E5YiuvkE7H+v8FgSk
 Qk5p9tkwSgo7UUImsmvyITo3D1kUqZ+rZnrp/9/+7j2RoX6VMEPIpWeCufEoYNcn
 kBUp/qbhlhIZHMV/4Z2iPav4j4pHmORr9dwwEuf7u89k/plhqAlHi/rtA1cxY3Fo
 mlDSJtRW+oqCrjmueA7fs3XkYCcGCdAKKqoExZleUO92yGJVQEJ6NR4kFN8hMF4x
 KMPSujJUZv35yiDj4Am5OqELFgxA2GPnn2Mey4/7lN11kmp9EvOjueb3vcA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bh1hd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:52:21 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-737f1f1e1bbso614114137.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000340; x=1783605140; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbPNXFloQM3dUvPD21224Iu0dG812ZdobBoG6oZrg1g=;
 b=JOQj+43KleqxT0lW1XX0o/D85cexK6pURo4+5VtsnKi1FotdfCTZ5nuyOlaoBVCIDl
 4tKro4KCNz/DGqG/p3gvgGH9To/kjQCAHrz0lN/+1ubwWdv0ZfcDQUCFuJ0CHS1dyTyK
 UJi4rVlzcJZK2eQaau4SKOFVPHmG3dHM9fBMBAEpirhlE95Uo6Og36C419LImEnmdROT
 WnFl9azcXnaQaW9ZRf5WpdoVVb030AxmirAoMGGYNX5I+jk+KpzvxaN9eCVFliAftURz
 3VZH46vvMduYAUSjf7cGuF5rQgaVRYgHLgav4NBRL3KPh5u54QD0PLDwA0/MKV6+3A9C
 EYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000340; x=1783605140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XbPNXFloQM3dUvPD21224Iu0dG812ZdobBoG6oZrg1g=;
 b=HJ1gEdCELLe5fJS3txS4qkrllHkQWZbK1bs+oLXHF+GyaRsWtXm818xvH1VKPHJepi
 DctcXfs0OsvJX+xm3qKnX4Cgyb4gZoH6oa+PJBOxx8TVSpZ5AKMwkVZAa5a6puZDSKit
 0d9us7YZTopMDjPpA6X5A0w6vqrpSOIUjbNywhkAD4x0tHNBAuriKcbKb5FpiUg62OeB
 NYBPH14qW7mR0a02ughMTZ8r7IzDTiHNHwGUhuTj7h5bvvcw9KVmHnRzInt4kMAWlN+2
 z+xu74hyADoox8FNoISgJjKpif0T5v95XL+UKNAIeVGVaIKNIUSf6Zuk8oh3PgZupM6x
 ygdQ==
X-Gm-Message-State: AOJu0YweINmRoB7+HVCslEVtYXFtMg1CQIvetjeFf+w+tYcIMAL/e1CR
 UosI+U8+y5X1QbObDjOyO3DptZpRPq+IrVcqKLJAKhx2BMH08IKssL8sHzrVxLMO6awLE2NUtXZ
 fkP2kzPlOELSgu9Pl19+LMDTdg0tQne0Me4eZXXT6XvI8tBoMcxFH6U9mAKPlb+yiAA==
X-Gm-Gg: AfdE7cl6V8LKHKkt0u50B6gxeQIVMUqD7ArP3l5oA+g4rb14G5ET8UgDTS2oZCBjrhm
 a952U1k+MMj6iFNMh/9gPUlbQacrVotIcM0daGdq2xDLcLIYPbFHwnRS7LAfLzi0/r6G8y9J0uX
 dQRvxq4roPLjlTvQ1GDV6bjmCZsTEBM0gP81gWLevfbwOWEKmXu9CGJaieZnF/+9oQFMYZco7yV
 bU6ZFCyqM4Z//v9qeDRs9okIyzRDe0ck55tE/UtA7/Lhsb2VZViz5+PMH2XoQJGPpY9lN6VN4FX
 juql4I6GoFbWWJS718ZFPJcVxnk0qrUqAuAguXoMiu/PUWvvT5nC3DZmIoygAR8HEgf37H+O6zM
 w7lxNeRiUBe9pltsRw9qJgpghTtDYSR7Un21JCgBy5a1AIA==
X-Received: by 2002:a05:6102:5a8a:b0:738:9c79:7506 with SMTP id
 ada2fe7eead31-73da7f097f4mr2264260137.7.1783000340594; 
 Thu, 02 Jul 2026 06:52:20 -0700 (PDT)
X-Received: by 2002:a05:6102:5a8a:b0:738:9c79:7506 with SMTP id
 ada2fe7eead31-73da7f097f4mr2264244137.7.1783000340185; 
 Thu, 02 Jul 2026 06:52:20 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:52:19 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 18/24] hw/riscv/riscv_hart.c isolate tcg only bits
Date: Thu,  2 Jul 2026 10:51:20 -0300
Message-ID: <20260702135128.1188021-19-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gn_lb6BsIcKvuLs2ms96rMgu6roiQggU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfXzIuln7AV5IRR
 jKiQwQY/dhe34cHoFC5nM2G2pHNCOPe6Q7UgKd1qPF8uT7X8XiJix3P5QHU0ox6bSuMZ4so7P9v
 +fLqBMLIUrmBjHUCOIDKFbifXEEuV80=
X-Proofpoint-GUID: gn_lb6BsIcKvuLs2ms96rMgu6roiQggU
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a466d15 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=0nQI16K_ZF54athspwIA:9 a=-aSRE8QhW-JAV6biHavz:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX6knCz0qxwhDK
 Z6LRAFFbi2eZ2Ymwt4snbCjCKC8Db+bGWaw/YKh0lp/Tc9BdXsP7ncl7pmvR6pAXFZkSs8iPFHk
 AKj61o1rhDawR9H3e+BWbbgBoLstW0dYLt8dMrR7djE7ZxSZqVF3XTTOUAvKavkM6uwdo5VpwY0
 YqcWkL8fowoBw6zd8ME3vR6j9QGABqOxZ/ParECAkJMOmjqBI98WrfTequFC3ERk8nepZNRUZ+e
 7XJISuYVe/VyegmBBJOY+NWqBA3Crg+J2C6eC6qFEysf5dXpy5oX9bBaRVaS+maBcmvbVOtmNGt
 at1DF+eVOB81lqDgSpFrQ7a5QgLK5fXY9qL0ha1/B0w8X9dBDKKVM3ApTcFSYUhr9ucqmz0Hy9a
 MP/PwBCm+QMFPEK4+ec7dbQ7azZQs5qI/NaYl0lXfj+77AULCWzEaWYb30arvtzLxIr+QuNt+J3
 VMPJeR+2xR3oqo0xnDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020144
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

riscv_cpu_register_csr_qtest_callback(), vcsr_call() and
csr_qtest_callback() are all TCG only and are not available in
--disable-tcg builds.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/riscv_hart.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index d1c7188369..747754be61 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -61,7 +61,7 @@ static void riscv_harts_cpu_reset(void *opaque)
     cpu_reset(CPU(cpu));
 }
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static void csr_call(char *cmd, uint64_t cpu_num, int csrno, uint64_t *val)
 {
     RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(cpu_num));
@@ -151,8 +151,10 @@ static void riscv_harts_realize(DeviceState *dev, Error **errp)
 
     s->harts = g_new0(RISCVCPU, s->num_harts);
 
-#ifndef CONFIG_USER_ONLY
-    riscv_cpu_register_csr_qtest_callback();
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
+    if (qtest_enabled()) {
+        riscv_cpu_register_csr_qtest_callback();
+    }
 #endif
 
     for (n = 0; n < s->num_harts; n++) {
-- 
2.43.0


