Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB180C88E72
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:45:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7G9w-0002Xv-9G; Thu, 17 Sep 2026 13:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x7G9p-0002T1-Nu
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 13:44:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x7G9j-0001b5-Uf
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 13:44:23 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68HH5Y7o3437471
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=YMwRPIQjBc9
 B0H7Gcd70sCpPVswh2gpmygYWKfnkzJw=; b=Msw3FWtyOlpDV+9NMKlljUjfrst
 ZHcR39EfoBLzbSa8BFCsJVvh5r/cy0ZY+Ips1R7Lf1nV8hPcBL9qxaDfb0FnnNyb
 81Q+bz2hmTuSi8OucusCraRKBK4yrB9ceWsl1wA1YLknvoiFLvj6MT6Lsx/U05Kg
 GsyuIbEaroblhpWcdg4BGaDWnd/YdZ9ZBZt9lzPDz4OQNxTP/WxO7Sp2cRa1GuP9
 yq3rfr2BbCG6/lz04RfV4ERmEvMjQTSMGYTFlf18ihXtqj2+JTsgRi5eAbTsde4v
 dnODO59ggDqdQFxbAc540nOZA0PIRice/lWEtMTRpoZceXOCctUwcsUigtg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6jbn7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:44:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-9124b265371so19423206d6.0
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 10:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789667053; x=1790271853; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YMwRPIQjBc9B0H7Gcd70sCpPVswh2gpmygYWKfnkzJw=;
 b=bypIvyiV+xv0Goh8GdaHg1BfUL9A8/udnZkK87yY/wUBqfa3BokbbKPDpv+b8rhJGr
 K1BPwXgpiUd8qjQ/4FVPEUEF4d42fE8NeYhQcqCfWW8aTGFpRGORLnNkAucMFQ5s6SkK
 iVRIgqNDfkdifST1ITRuLKsAebGDd+IxLjfiOAGLL5g7G8dvEFblcFR64A370ESyEpy/
 UdgPny4+lBfM3hf9CWsLhI1BVfsX4L1fS1cv2oZ0Ajiz3ov70MQMX5YVNfKvqO+FcQU7
 JX+al7LQk4eZWaz85y3L/Lij0WbpHbx2WGj0iazK9vyhv/yLrBgJTLCXh74mW4RrTPhK
 9aBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789667053; x=1790271853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YMwRPIQjBc9B0H7Gcd70sCpPVswh2gpmygYWKfnkzJw=;
 b=ZrKuyHYgqltqMN+FW56MjAsbVBelaX9gNc3ZQ70NBE3kcvGKtD7BDLPO1gAwRtJe4n
 BljPbkK1cCHiAn64dBYOmEfXLobWVylKKq3e042arQx9+zPpPxq0WNwCH1UTlu9h5leD
 rdkJGuoNWYMixpA86c6dKC66xLa0qYzqn+brH2EAfGO0R0q6R5tIRlp/jZeqhArd18sH
 JfhJqb/ATbgnUWL6Fck33U4Rc1Wra4YvyCqcSEhuVqeAl2YwOFJCkGUM2YiUci5bQUBc
 dXpXpClTVEcVama5fRR5R02oGl3M/tTzImn7g6rUJly1fLLa7npv0N2VThqxO6yoTIEZ
 1eqQ==
X-Gm-Message-State: AFuF++mtAOO0L52BXA0Idw0G9lka+T1E7ImZt/Nk71+jlH/xbU3tbBC/
 iHCLRsZpMGfiHDr0KuYMswdE0m6O1sEqjMlLHZ1uX8rFS8bLizRndGeLmHJ/nDpyli4Q3/U8nAV
 mmOoA28jBwc+U0KTrhpVVS4EDehN252lR3gLyKso0DmsYVgAFVaXOYPNfxA==
X-Gm-Gg: AYBFou0KT2ca24gGv+/8kPqHG0/Z89gDceNkAb1jWbcETiDYkwauOr1cZ4INsIVSj/3
 E5isKu5D3GxaxlAqb0rrNfpCZUS5wC3DLdMHQeq3yDexO0ZvN2wl4du/ojs/y+J+plKpltKsTdr
 eIoZ2x1WN1v0Ye87/hFQ6t4cAy5o/cGS36dt7lOBYeVfS1QKp6VVsgG/oD9bfklLrWnrlidMhW/
 /zsKxy1R28s9BB6F/chTHohquYyECRK/WfnVGADjpXFwiowPkN5MzP2THpBdLyDz+GNFxDQmyws
 TfIy5XxiLVJw16Dn4lL64n6wotViKJajvcbkJZG/OHECINzVclymhCPWmAOyIdVTUwV/lqpIwOU
 Hwz+AOJXM6oqnrd5BcDYYLfn2cxb8OsI9o30uFKw=
X-Received: by 2002:a05:6214:19eb:b0:90c:d6fc:e284 with SMTP id
 6a1803df08f44-9123d79d2e2mr157563136d6.17.1789667052676; 
 Thu, 17 Sep 2026 10:44:12 -0700 (PDT)
X-Received: by 2002:a05:6214:19eb:b0:90c:d6fc:e284 with SMTP id
 6a1803df08f44-9123d79d2e2mr157562616d6.17.1789667052300; 
 Thu, 17 Sep 2026 10:44:12 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.170])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91252c56d73sm3118136d6.13.2026.09.17.10.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 10:44:11 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v12 1/5] target/riscv/cpu.c: remove 'bare' condition for
 .profile
Date: Thu, 17 Sep 2026 14:44:00 -0300
Message-ID: <20260917174405.3471736-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917174405.3471736-1-daniel.barboza@oss.qualcomm.com>
References: <20260917174405.3471736-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 20RSKwgssKzlv8PqJvCfFhge9GNaiztz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI1MyBTYWx0ZWRfX50M684QptTDG
 mzz9kY1+BPTJ1FT5OnvcHWBXxgl4fHcYEExBGsA/BYlAZE0udaXwpnapAteCbIr63i/KFK6kLlH
 BcqeWLO5v+kvbGm2sL8iIT1MmNLbBr2PmPi2o5a9/4sYK8yEIX2u2MRS2GOze9SDLeXXvWtpa4J
 7gFl2bRmMqRMJNikmluSbtUvTbl35GFNjb3KnohBJcFnqmrs8SYyCmbEVFNMvHcCqrGvCd5YWzq
 lHl9qqP4p+I/ONFlvryUEvr/ObhdC7ZFTXrRxZVLVjYAn9tgPlwtMyJYzCsPiMj0xVv1i5RLi9A
 tXB1S9uefsWy1qslgV3elUiZCyS008Hzo0kTDcYsGlW/DFIjaO4UjeXfDpg3tat9bIWt0J4SM2O
 2vbxZkwacZRiZEe/pwd1lNYF4N4esYqiYfoV7BxTtquDse/1Ef4Dw1zMER3dT+NkbGg+ZyYUkX2
 7pV/fDW/g8JUvtI3rqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI1MyBTYWx0ZWRfX3Pc+OdxyC4T1
 I+4M+VlfHbU6GcTdUL4C09/LKFquhJsHebrVDH5SVpb+4mA+0vzltVWfglcitsyIDvduSKUpC0C
 1KY91UcOQ4QJBc/n0Y7BppUjwwU/TUs=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aac26ef cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=arNgJ3JLhM/z8Vk/iMOFgQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=FRSEYCzRAAAA:8 a=GhL2bEVCvcqOW28JNKkA:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=xVlTc564ipvMDusKsbsT:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-ORIG-GUID: 20RSKwgssKzlv8PqJvCfFhge9GNaiztz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170253
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
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 target/riscv/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0fe9762022..41e52431ed 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3104,7 +3104,6 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
         mcc->def->bare |= def->bare;
         if (def->profile) {
             assert(profile_extends(def->profile, mcc->def->profile));
-            assert(mcc->def->bare);
             mcc->def->profile = def->profile;
         }
         if (def->misa_mxl_max) {
-- 
2.43.0


