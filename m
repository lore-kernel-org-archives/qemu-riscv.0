Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C29DC43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 17:05:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wd9zw-0007ys-U1; Fri, 26 Jun 2026 13:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wd9zv-0007yS-3u
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 13:05:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wd9zs-0004M0-ID
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 13:05:46 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QFiiM11746094
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 17:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=rHkaSinKw9rxeEQlSeJVjrJHgx/3ODwms0D
 HUpJfUlg=; b=DVYYGu/5RsHShfw33f9z+as2EGMxlPwNvkVAEeaXNm7tkSzt+ez
 KYQdEcmVIikZ5xFaeqkgDz/ov6hVzdSEdnoA4i38fHyMsEJefcrkl9XjCc5QkJJa
 SrOIVmPL8WUHJ0LwZFNu6Ljgn6QCPiqvjNGIEBbAl10mMQ2Q0C4DrXvrz+XztpUb
 nm7o6VPZ/kXW76sA53WdeOU7V5mgcmJpiRw1CuFO/uFjcfyZNAgWqlbvKxq1+uWp
 fTTsHHBWztP3NgSNpbCRmYadBV2KZpSKVvrMvjapwezVWYVCisuS4YATEup8MGii
 F5ph1m+NPXPEwTiJpyxrppag8Z+Qm1zkjWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fctbc9a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 17:05:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51a85c9a3e0so9347571cf.3
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 10:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782493541; x=1783098341; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rHkaSinKw9rxeEQlSeJVjrJHgx/3ODwms0DHUpJfUlg=;
 b=j1N2Ep+aM4EKE3dC6IS90vN33RWj0vZmj3XXcKCNr3feGrn9cL167Q7Y3HtmEInn82
 5Ti0bOqjkhqjstkkCsiv+vLMQspXyaw2VGOfsqeYpVsL716U3VvVbeqH0zWws7r/b1TN
 dh0sKDSd3Q3L9DRCVu6aXXvzC0QviM8lfcliAUJ0yXqYhJKwO0t2307OB65qN+ZuNAmK
 TEeuUC++C+Fc4aOWqS1/Qitc2avwxYTNHGFo1xbpc22iEhoV1BF+WLFKm91Hn1ueSrVS
 +ljujsGvAEkV5lz1rTaWjhO32KAcp2n3f5M/E/kZPvy8cZJE9ykSh5MVSuAzI0SsuQuv
 pA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782493541; x=1783098341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rHkaSinKw9rxeEQlSeJVjrJHgx/3ODwms0DHUpJfUlg=;
 b=tVtQ9LZiPjujy+ADoCvum6RWFJcX/3yYEt8Mi80I+gbzWBMvTp4M2jpp9nm9FtWlsF
 Q85KwWJ3xaQbactzAcKVEZ1lGrxb89chr2PF15d1wfpAa1beyAiI4mm0Kn3VWh1HGLcl
 CJQ92eHj3UYY9mq2NRBUq0dt05L4GFiQQfKTaTlVDVgyIGgz/cCPJF6eQXVTLDe1NXTd
 yRcSnOLL+BqxJODlFcMJGlr0COkE5OOGHA63qYiJ4QxDZ08/tpiDe1XXzdwdNW0ET3ma
 cl/WiF1RJ3OOoAiknXgV1JbEF3/2hUECjTolId1Rf6xxrv1r4CBnW3hSraH5LqjN54Eh
 ewOA==
X-Gm-Message-State: AOJu0Yw58ts8S2fH0wPYZ/MU5V7soWaL8aUuEFFg9mLmdJKrYwHTk5Pa
 zW3Dpxzu+fxfHngUIqfzeI9xup/vpPFLYA5kP4jIsBxp31Zl08n69eUt3HZeW1NnCx8wB7OwZcB
 2XClYk6UNqGGYNXEunHGyLDa0McDAVejBZ9+qd+ahgRkwu1X+RBsWVAsbcg==
X-Gm-Gg: AfdE7ck4mLWnrWGfrbmAbKc1IbauZeKxDT5CUWr02em38O4H7yF/mCyW+bIRo/zWlKm
 8xztbTOq+AU3VJPRaPjlHwnCooYsI/0wOKv1LRegBLfve/SXXIBEq4JRoWqdyOhce4yPqPkoNCm
 Ee66idqPUAzblQ5qy+lIwKRke25gNsHxukfBfPinB6cFlzD80fckTzNIXW+GhWOJ9XtfI3z14hE
 L/+/fvOPMTvYSUL4q3xvx7xwZaaJo0+McmFgPCXC7K1zfhGttY37/GT4uj3sZPHMhau0aZdY5q4
 V6FSiIJK6YfrjyS8UMf4o89n0OxylH9Thio17W/MAxhRJlqRnT10qIriDgNgTwB+FYEY8noqOdL
 xpiUHtxzxlrtSzq/nh4Pq7T+UT9HlmmVwIIVNi3fKV/EBZw==
X-Received: by 2002:a05:622a:4112:b0:517:5beb:9b17 with SMTP id
 d75a77b69052e-51a7277c822mr123098251cf.1.1782493541220; 
 Fri, 26 Jun 2026 10:05:41 -0700 (PDT)
X-Received: by 2002:a05:622a:4112:b0:517:5beb:9b17 with SMTP id
 d75a77b69052e-51a7277c822mr123097121cf.1.1782493540449; 
 Fri, 26 Jun 2026 10:05:40 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51a51ae9505sm111133901cf.26.2026.06.26.10.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 10:05:39 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/riscv/riscv-iommu: set cmd_ill IOFENCE.C rsvp bits are set
Date: Fri, 26 Jun 2026 14:05:33 -0300
Message-ID: <20260626170533.3562484-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SNifdFmCDa-nYexFitM3v0olFkkWTNcU
X-Proofpoint-ORIG-GUID: SNifdFmCDa-nYexFitM3v0olFkkWTNcU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE0MiBTYWx0ZWRfXx0GxZzUinTnV
 wnIe5Rrj/YYyKnIrJI06gIXAWKZ10iQGzXZJ/0JvVg+RmbZ+ArvJit8MdOYpTtAKgw8Zi7AL7m8
 jTifHh2MdVqguE71Dmr5qFAPvNL6zqDFQ7I42klu4Cgm7335BdgzPiCcA63yA+GSXQB01qISSYY
 so3jTuONBeEFv74+fnajfPacX9bn7/FbXJ5zzcOiE2qMbP4cFyX8bX28msG83CYiJrfqCtx3iEE
 FY8Z54TmaijJonxFX76YGeo5m8yHw9gK/a5Uzole/Std2pSmd8eF3u46z7L2jd287LrzAXRP2LS
 E6l3ZmppyMdkJBiVyn6So/oIlw+/wuPFPpxgvJ5VO1wf5Q2noCSOooFF0oc8+I9buGamwXo5HFH
 qYmnkcOYjXcQUDCCvPPaQ3tYLZI0fMMt/UAwg8ftr7ZISDmGNTlhvRLYf2j+/wFYTpylE4gdZPj
 lNsMeDelT/SpZFBpoag==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3eb165 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=LCFUk0-MNyTV7KBWhY8A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE0MiBTYWx0ZWRfX+r1eFwjkHPJN
 k0c07hcgta+jBAaRb6tX0FCkgRrdzJOcDTpCzE8qpJ44p1L8Y6sBPq04Vcr4AafzK8Ff3JJrqXB
 dXqlBdfpyNsRlv8OwlivhCyZFeXByew=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260142
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

We're not setting RISCV_IOMMU_CQCSR_CMD_ILL if a reserved bit happens to
be set in an IOFENCE.C command.

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3575
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu-bits.h | 1 +
 hw/riscv/riscv-iommu.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
index a938fd3eb4..60256ad9b8 100644
--- a/hw/riscv/riscv-iommu-bits.h
+++ b/hw/riscv/riscv-iommu-bits.h
@@ -344,6 +344,7 @@ struct riscv_iommu_command {
 #define RISCV_IOMMU_CMD_IOFENCE_OPCODE          2
 #define RISCV_IOMMU_CMD_IOFENCE_FUNC_C          0
 #define RISCV_IOMMU_CMD_IOFENCE_AV      BIT_ULL(10)
+#define RISCV_IOMMU_CMD_IOFENCE_RESERVED GENMASK_ULL(31, 14)
 #define RISCV_IOMMU_CMD_IOFENCE_DATA    GENMASK_ULL(63, 32)
 
 #define RISCV_IOMMU_CMD_IODIR_OPCODE            3
diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index c9687e01a8..d47abf9eb3 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -1876,6 +1876,10 @@ static void riscv_iommu_process_cq_tail(RISCVIOMMUState *s)
         switch (cmd_opcode) {
         case RISCV_IOMMU_CMD(RISCV_IOMMU_CMD_IOFENCE_FUNC_C,
                              RISCV_IOMMU_CMD_IOFENCE_OPCODE):
+            if (cmd.dword0 & RISCV_IOMMU_CMD_IOFENCE_RESERVED) {
+                goto cmd_ill;
+            }
+
             res = riscv_iommu_iofence(s,
                 cmd.dword0 & RISCV_IOMMU_CMD_IOFENCE_AV, cmd.dword1 << 2,
                 get_field(cmd.dword0, RISCV_IOMMU_CMD_IOFENCE_DATA));
-- 
2.43.0


