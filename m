Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A313C624D3
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 19:56:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2a1S-0002x9-Qt; Fri, 04 Sep 2026 15:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2a1R-0002wg-B9
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 15:56:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2a1P-0007j2-Ps
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 15:56:25 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 684HILtq3585994
 for <qemu-riscv@nongnu.org>; Fri, 4 Sep 2026 19:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=vl6d4L1i+c4
 sykN/zuTBI4TPp/Bc6S5aA+qfuafTrM8=; b=luYsX21+cFWZk6kce4Dgie7CupF
 PFl6D41LUaTJLtVV3km8eQx+O0tWqZ3uV64Asx6nXjhkWxaG36U7JIF+uQisdak3
 Vv/rZSMLT/zoS7kg5OyAWOVMB+gtMsjQRPZ1IAUHMbfivogh5ffPYyduNsdNIf+z
 ytMG3p3R1/vi2xomiPlFcWChLOkzmRM/0vS4NMWFQ53ytUGCGdXN979uXSzJWheS
 kSEcRce11BBqJpp2DZT0SVvrWKUuUgmvVmdnEuLcsYoztR75V3BU2yqkQeGbI6WT
 +nJNIWGHEh8Q8YFhL/AFl447VtUs+7P1tbIBjphynfrJf/UU/UJ4SoW93bg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fkxh4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 19:56:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e62e3459fso225546385a.0
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 12:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788551781; x=1789156581; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vl6d4L1i+c4sykN/zuTBI4TPp/Bc6S5aA+qfuafTrM8=;
 b=RtsnDEwe5tuZwnxGlOtQGL2t3JdmqvnB+Vn7jnVOhwZzvfe183DywUCTPALCoZ7VFG
 9O9YZFnrPmn+wW6dJUAoaPFkQa3lqTND+PyKrFyI2xSKxZ1t/8zkpr9FtupmNk9g2UOk
 7nXB2bhzLTBfvCxwuYQqOAFmKpVfBwS5BvEWTlUCvJE9ivgKWG4zOjjC8qgpB772yV4o
 J4ss3rvxyeQgjGEfqECqUiRejquqcMg9Bqq/RfCWEmHe3Dx0HReqtKapmGpN/rokYvQ5
 kC5hK0Ci13ouWDqwLmORdHaeN8kVwD88cZ0bFnDwzAPxbb4b6IUtKrzIEw594eOY8ga6
 fmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788551781; x=1789156581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vl6d4L1i+c4sykN/zuTBI4TPp/Bc6S5aA+qfuafTrM8=;
 b=fFqtH1VAmp371p2N4IL6XGKCHTHUztB5Jw0BAjziSEjRhE3t81//WnrgOqTgN9zVBp
 aRalf9vLcuu63vZShZeK+H8lHL4bGo28TXoQQsR20c8y/tpD5fbsEHp95dIN9Dc6UnGR
 oHszgJjCWj3qZgIBBTxfWCV9fShP5/FVxXi9+4fVKm/x9gVueMN3pXhJ/C38T2lanyId
 eQGBesQXDwQrMO7P7u2sahwbMz2gpXGhMRHBWbuwUJZs59Rca9vHWx4cWx5zecK2b2Ms
 elrLB2wNaub1Eqv061LwSlUsLOQCGfFpXvLpJWP7UE91kVdm+zNl+EJ63zwHs1e1WW4r
 UsxA==
X-Gm-Message-State: AFuF++kqPqUbOH4aQU83eChy9FwwN7i0Z2Qq1lgS4Glb5u0SwmEKOlzG
 8RgadZVt3DC0aTnvZd6qVM+WpH0cI0UB3TIJI/OEtmHX+qhzGJsk/016jGf/f2THr2o645E8Zul
 oDmHA9JZ2HgJmvB7Z108pExWOiBGpDxfxyFoWAH3BTVgeSShYDN3vd/WRIA==
X-Gm-Gg: AYBFou2YL5RRdb3gO0uoeOIIG+a/BBK+J1v+M8u3IIHDFjaEIZWaVnOeyFdu0YCQzI4
 Un954adQFyDFoKuxyXtalXWOeYedHkmlnHKZvQIwMc2DiGFwdlxwLGrBsWaBU1F/fIHkqN9bqFu
 WoIUqS05W6Um/Gu3U54hNqikCjqTRdmPOoErkN9Pw4EAoTaGBXixIQCJCbT/btsXU5cCdc2IaX5
 1Z9bJvk7qY1t4/PLBcH85F+nPe99969Y3kDrdIGRxAr4STiPjbK5gcz0Di6vd7hiZ2Cqq7P8I4d
 W1L9CAQGXM59isXBVDDD9BLCe9L+nYyTE+MDgP8HbBeF6MYtgX9pU7ELGuKGryfTxSbLhNP61+g
 2RhjJAHwmCo0sJv3RVsqbMDz8gGSaiSIPs1gv
X-Received: by 2002:a05:620a:1a03:b0:934:ab73:ac53 with SMTP id
 af79cd13be357-9398013bb1emr837589885a.0.1788551781362; 
 Fri, 04 Sep 2026 12:56:21 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:934:ab73:ac53 with SMTP id
 af79cd13be357-9398013bb1emr837585785a.0.1788551780838; 
 Fri, 04 Sep 2026 12:56:20 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-910406871b6sm29117736d6.32.2026.09.04.12.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 12:56:20 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v10 1/5] target/riscv/cpu.c: remove 'bare' condition for
 .profile
Date: Fri,  4 Sep 2026 16:56:06 -0300
Message-ID: <20260904195610.964829-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
References: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9b2266 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=FRSEYCzRAAAA:8 a=GhL2bEVCvcqOW28JNKkA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=xVlTc564ipvMDusKsbsT:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-ORIG-GUID: zkPXBSBGY0M3DHva1gQ1WvZUr_kA4sj5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfX94KZqYQgbqaW
 qzGMRlRNAKASAUHfj7TVcgPPJc1VnsKA0s2XY8YG134+n8M59P5iv7G6+rYp9KvKl0m1R0/uaeU
 rikjiCn0S6Nn+f4dWZ+6GiVIdvq3bm4=
X-Proofpoint-GUID: zkPXBSBGY0M3DHva1gQ1WvZUr_kA4sj5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfX0a8vdoCvaZXc
 7wlKIaeselhHqHI5QLXaMc+WDt8L7jJWg0yJw3BrsHAB4fF3bpiNVaUwdLvodk4nowXQhn1v+x9
 +wI3lBLPMaxeZe6H8ICIaBrVu2CHgImiTzhfepSv0Ysb3p09NdZYJZhmejsC2mamHUfbgreu5qx
 LYfnIpQWnt53lOwGV0FZ4EektajpUm3Kl/JA2O+GYZ6EhXi0eu0Fn9+5QNus16DeNXi2X3LjLHU
 3VNV4hOETHkuQ2ZfmdHk8xGVW1QD1Oj0mqJNcbgSJwchccnXBdhy3WBjK0FXY2nIS7R8Zhmoxgz
 N/nlujDwM+gQ+3OPxd95xvPVlVDPA4vfc6YVw25ggIZN6yHO7aUPoLyTBCnbo9T31Qc8B92rMf+
 a8AoQKEMNQcYeiT8SjqAT3QyyII6BKc/qOGMNfOezUsfua4o2aWMqb6l+jlFmgcfqxAzA+94DwC
 jLOUsSIqgNWNp208Pbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040182
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

We want to configure other CPU types to use profiles as an alternative
to adding every profile extension explicitly, i.e. a profile is nothing
more than an extension bundle.

This means that a vendor CPU can set .profile=rva23s64 while having the
same handling as any other vendor CPU. Same thing with all other CPU
types.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
---
 target/riscv/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 652311ddef..185474a8cf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3096,7 +3096,6 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
         mcc->def->bare |= def->bare;
         if (def->profile) {
             assert(profile_extends(def->profile, mcc->def->profile));
-            assert(mcc->def->bare);
             mcc->def->profile = def->profile;
         }
         if (def->misa_mxl_max) {
-- 
2.43.0


