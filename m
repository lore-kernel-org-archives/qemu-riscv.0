Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B13C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:12:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wetmv-0002Z2-RT; Wed, 01 Jul 2026 08:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wetmu-0002Ye-PM
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 08:11:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wetmt-0002gS-8g
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 08:11:32 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 661A9h4B723400
 for <qemu-riscv@nongnu.org>; Wed, 1 Jul 2026 12:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=TmZW5SJh2F/
 t/sfvHlgMnV9qSmk9XIS1voG0p3KZfWk=; b=fZxVmum6gopoEbXWsdl8RW3N/UU
 14oLWUqZ4WeV63aFqF9WweYIFI06426gjLdlPnRiqEJgfXZvQtRrhZ1BET4HYcB9
 HVsABbxku/ibU3kJOu8VRRDmgwUmcF9sbCGl79qXVwgtTd86mrYhnz9gfDINJezx
 Voh8L3QfYAazjgIDLDvV6ilCXBfBzhrpCFAC+uv9YX5E9AOiF9mI/yynch6vB+J7
 J0PKp0YdmseRiuiIjO8RM+oKN+9iCGZsoo7TFrJA5E6rlGouq3FCPdNWUi8SrHBk
 4/ptOC68cF8Li6OEyp85RySvYdE1bioJktNuVb8DYk2lM6ryjzoIloa5EEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwbxyt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 12:11:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8f1e4e0eac1so7894556d6.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 05:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782907890; x=1783512690; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TmZW5SJh2F/t/sfvHlgMnV9qSmk9XIS1voG0p3KZfWk=;
 b=XDtOCrEcvwizlO94ClaCjQLE7PCDkShw4kk9p5LYX289olxvFJRsyOf9uKveejHpGM
 3j0PTOBE+ow2cV8Q94grf8dFy5iZ02pCXZclevWUq1xLfDyDGbfhK/XJkvkMj+yUx48o
 KdY7djgXAUnjCTzCUcf7MbPgFj0WmbORHFqeYh25rJOy7X0qqn8y+mzL0i49xRyQLyUr
 cGvZQIaeTHbgolKL9h99/Hs0LRHBgqnO4vTNcpHzTr13K5oJ3ipxcaJftjddNvK7YBp+
 BadFd6tgtrf0fjKCoTBlY/tfGDaUoUwWs98O4kLRd/bJsaSQNJsVUhfnBX1qbluqZbTt
 JcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782907890; x=1783512690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TmZW5SJh2F/t/sfvHlgMnV9qSmk9XIS1voG0p3KZfWk=;
 b=C2uHa3GfUfX9qqwVwtwtKGAGSmwiz5JJnMgnDu9m2OttX605kMh1Y9cBGcmP0wvxYX
 2brJNiI4M7xgAFt+fYRL+iMyp+mCudriElvl6z3U/iobA+N0JKaI+F0Jlw82j9JUsHgk
 HrZVTpAFx6sMZ2eqlvwPZkwjQkKMnk+nICi1vRc/f2P7VR53XIDVc1rUlTqMqNCXccVR
 JIznEoNXbhkUybCPxCmHSxgRAAKi86SEonH7QWkFX4pUwMWDAFFULWv+1+XRx4FdVUdE
 no7DDPRmbnsePrOpCdy8yKWCJvCu7zLwWZ4e2YtpZcwzXR9LV2kby0m+NBU04LWQ5aqH
 3x8Q==
X-Gm-Message-State: AOJu0YyRc4QGH8+Mn8tXnGspF8QUnp/65zflNlLq0FvrL2E0IvXEENuq
 kiqScT4fzjtyBvjKUjpiECVocjZo4LvDW9kOlwTdkhXRRFsN/0NFknNtZ0pDpTTsTWReNAQO2IY
 ZK+4r/sxcMyXiZqtym/z5+RRPWxwlhyBXZi+NI4lts8+H7vLT9dOblxpD/g==
X-Gm-Gg: AfdE7cln1Zym8kxiEtGF94SCzF8sVDMb1oKn5dJfyCBmUYCFIKNwd/b2g6BmhlNn+2R
 wwef68B1B58ZE+UkwnmOTDrkYypyf/nRn6Cu/6XMfc8PCkXcUgEAy2eCFWmsUwOb6oQVdqR2EYQ
 sAL4sl9OlTMK9VthEnpGmHvf5MhlLwga9UU0pIN9rmqvt2HO8Qa5LU8FjJ3IzI2orwKUbpSNINF
 S6P2Ye5FOqsWw/kTuIFYQeUNHJSuwFuyS1xmLbdL8bFmuqAWlkrZdjjUhCjumOygFDdf3FAv+GM
 9mtlPjqcDN8S+tzJn1flkm/alEfxliSWOJMm9lASxzrpj2GpZWn6+2cAEhyEo9kPMza2Z43PCuG
 DWgnleG1Gzph4npc/t4mVbktNxDBlkON/M7aChlnaJ0KuqQ==
X-Received: by 2002:a05:6214:5f0c:b0:8e8:199b:aad0 with SMTP id
 6a1803df08f44-8f3c65caf61mr18037366d6.7.1782907889671; 
 Wed, 01 Jul 2026 05:11:29 -0700 (PDT)
X-Received: by 2002:a05:6214:5f0c:b0:8e8:199b:aad0 with SMTP id
 6a1803df08f44-8f3c65caf61mr18036806d6.7.1782907889163; 
 Wed, 01 Jul 2026 05:11:29 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8f3611df020sm19794706d6.30.2026.07.01.05.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 05:11:28 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, nutty.liu@hotmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 3/3] hw/riscv/riscv-iommu.c: fault for non-user PTE in
 G_STAGE
Date: Wed,  1 Jul 2026 09:11:11 -0300
Message-ID: <20260701121111.537654-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701121111.537654-1-daniel.barboza@oss.qualcomm.com>
References: <20260701121111.537654-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 18dL3HqeCj3LMn1G3m79goSWkGBsKVMb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyOCBTYWx0ZWRfXzLw1Nkpf1Obk
 cvjMAbqr8cXXtNAlyYg/ACHUiWXThG+YFymcWxJhQu7azC3hIPNzARYFFktHOlNgPPHz3OBKt2Q
 hhzDa3bKykBSX/7ag1JKVtWE4inn9ZI=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a4503f2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=5RwxYKaxI1MLRJtyegQA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 18dL3HqeCj3LMn1G3m79goSWkGBsKVMb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyOCBTYWx0ZWRfXyuytqb0ATwuk
 QAxLkqcSF019mdGYu667u1bbbm4DsRT29050vugd/iasQ8yATGFUFe7Iw/Qbts49I8msNwdR+kH
 ixAwfblw75o3Yv6X/xua2MBjrJiYtxCuRmngrCGTj1pyweDveCuJjZYS8WdfycasrqzpuLKr98D
 EJJ22DL6G3JfG1CWq7QI458e8JcinS0ib5YHHv88Pn/TwVpRmUmUlDn87U5wp0FGet1HcSoka/j
 OU3spsYz0mtrEz+ku+SrgaXoQZ/daWhBdRopbVP0tG9Ezk0O5YIcILs5fqgbnwyGgR0XGQeqKbe
 l+p5xtem3nH3YYLgXkD8WYyEHGaR1hZXUwiNntUfCL9IsR4zEOcvwKYl9bDjjX795d9XFKIZn1x
 wjO2iXo3n6FjNGN9MO7IVu7kMf9e3Glz1+fT3GWB6YT1IBs4FBH7yMJO40upqDNX9w3qRDy1ys0
 uI8jFD7X/aMm7ko1HGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010128
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

riscv-iommu spec 1.0 says:

"When checking the U bit in a second-stage PTE, the transaction
 is treated as not requesting supervisor privilege."

We need to *always* fault in case we're on G_STAGE and PTE_U is cleared
since we can't be on supervisor mode at this point.

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3555
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 3b165348ca..29eec3133e 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -494,6 +494,16 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
             break;                /* Access bit not set */
         } else if ((iotlb->perm & IOMMU_WO) && !ade && !(pte & PTE_D)) {
             break;                /* Dirty bit not set */
+        } else if (pass == G_STAGE && !(pte & PTE_U)) {
+            /*
+             * riscv-iommu spec 1.0: "When checking the U bit in a
+             * second-stage PTE, the transaction is treated as
+             * not requesting supervisor privilege."
+             *
+             * I.e. we need to fault if this is a non-user PTE since
+             * we are always in user mode at this point.
+             */
+            break;
         } else {
             /* Leaf PTE, translation completed. */
             sc[pass].step = sc[pass].levels;
-- 
2.43.0


