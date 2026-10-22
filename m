Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA8606A31A
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 18:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GH1A8KFr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JNnIHZuz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJxOb-0004iq-LN; Thu, 22 Oct 2026 14:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJxOZ-0004dH-Nn
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 14:20:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJxOX-0000PH-Vm
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 14:20:07 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MHt2Jo359249
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 18:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=DWNS+QnaLQ/llNOq4BB3aU+o9fobtMGcO3j
 83fkBwv8=; b=GH1A8KFrOCogN0Y033xi/2wFdt6b2rftaKsjJQ4DihqmT+idcNM
 N9RaVtkuE7aiw8foHGUD7IS+rj1LsFIGjmPNm3SN0/ThFWZITtSdHwLem1j1hOCW
 fO47hJIeQJydD1+rTTspTG1S/DZZRrrLg1vL8xSGAiYdqBEL5DnUuTT3slfY/t60
 xZO9fzbJ4ir9WeGb5oXWb2Uw14qd65YQE0vr+FKLkSwBKBolojq/zzrbWcGu0GjM
 fnNNzPQjZSA+yO4m03+9kzhVydgmD2qkl0cNDZEdBEna7i736qIssskB73T328I+
 mWQwq0l1J+wcHDIaLm2/vAQTOMH5QlNfpdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw0gg5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 18:20:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93ce7a85f04so14524485a.0
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 11:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792693203; x=1793298003; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DWNS+QnaLQ/llNOq4BB3aU+o9fobtMGcO3j83fkBwv8=;
 b=JNnIHZuzenYYJOSyTqX6MIm0CQcXcj1eisB/dR4u5JDhMAKIFdIx8CS735KRMglP6h
 LFBlVSI/EHsU14ztaGvfK268ge2t8cOnxrpqGQJvxTsglAxf8INAl7OydvetgOWmAAA3
 i2C6tyj1WcA0qdaN/kPORmr61xJ+b278Y6j0Hwy+HQ8iY0r1KcMPnuXJyPi15xXxkvjS
 q0hHNB4aKl/oQyvfUhztEq6MhEXWn0DqzhSIj/TRlcqVuhl4ZrWRDFSnSuExd/INKwhW
 mPEi6c3F2u9p+V4RTuWJRQSZhmInnmEkSx6RvswfVSwEm3/oD5AxmMf7SB+nKgencfKe
 8lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792693203; x=1793298003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DWNS+QnaLQ/llNOq4BB3aU+o9fobtMGcO3j83fkBwv8=;
 b=bq/8w0isc/nh8XurXvZw7OBGM/BkaNWu9g/B41u8lfMuf8tmoYsZ5dyIm7ji/pzhmx
 bCm8N3BMuRReZDrJJfbHHPfdmPYcPBwzNcADPep3EAKeGaubkSz6vZCE8YTfGLdsSbGB
 CldJnxamQ0IVwbMwRUSL5rJ0CbQz/yqH7NvbV8HQGv9M4WzdICv3YcKV8WdUVHRnyc9y
 wAeHOAps4RRyobMRqPhlI3omD6lw56bd2T/UpB5iKmRfR6/eRCTX8qXCBLKbb5BT2OEa
 VY8MTPC0NeRED5VkkqZuF5OjZWq0aZCX4zZHLZmA0mPxjNDV4YwQtqukr8fN7+/h5ZDm
 rsWg==
X-Gm-Message-State: AFq9FYIdhTzYe1PuDsHKK/pSOJ0nNQ/XWSdoOVGVNg8s8arybup1IzOQ
 Y/AA8imawNdWN9tMuZ+HHn+kpi0/ZziROPwIzrekrypCrG3EZ3S061R+lksykR2y2nsTiE9Yiwk
 ajnxeJnAT+3owtsQri0j+4M/8A/aiEE8FChC9eFJ6RQ2C1diWMSdHb73Ktg==
X-Gm-Gg: AYBFou2yqQbc6CxCtDnpsUJWP/rOa6AoiOPhlZzRs/Q2lU/raON6XXXAEsY2NYjEPPz
 bv+6QAljBWtFppRM7ibhxYVJvTEEZPLnOzlp+J/PEtrXPVk0Szo+nSo+nB8gYBghv1+uyY2lvsO
 v+2H0Hz0m21/Ej27eDie0cteppTFSdDKzSS6y0XyILzMT7asGgClOkL+/DT1oyvjwSQHQa9Rq8D
 lZJr/aqg1eygPxnRJYaaoYJukI4ddwaCWDqCs/0BI2lZqQjMHREuZ3KgjYjQIDZBr2UrLjuwF4Q
 X/h32iIdj9T8Tyv4mdxSTmkN9HJAYxzVq9+RZGFr4ITtPgJpH6HN7hWtoKAPLjY5PrhALRuR/mI
 VuhZeB386g/qwva4dXB2wzx0uTS+2Z59mkC6cBg==
X-Received: by 2002:a05:620a:6c09:b0:93e:5861:34df with SMTP id
 af79cd13be357-93f6f7ba4bamr51732985a.47.1792693202953; 
 Thu, 22 Oct 2026 11:20:02 -0700 (PDT)
X-Received: by 2002:a05:620a:6c09:b0:93e:5861:34df with SMTP id
 af79cd13be357-93f6f7ba4bamr51729385a.47.1792693202478; 
 Thu, 22 Oct 2026 11:20:02 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.125.162])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c370061e7sm3617416d6.8.2026.10.22.11.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 11:20:01 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH] include/hw/intc/riscv_imsic.h: remove unused macro
Date: Thu, 22 Oct 2026 15:19:57 -0300
Message-ID: <20261022181957.21760-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: X_W59LGvQDvHWVLonAWqTP-BNHMTwqeq
X-Proofpoint-ORIG-GUID: X_W59LGvQDvHWVLonAWqTP-BNHMTwqeq
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6ada53d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=AgQEunjic7gIBKSbIeB6Ag==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Gqw6Gra3IEblmeP_dQUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3MyBTYWx0ZWRfX6+wzngHVl+s3
 bXtb+9tSgLRSgmNF5CNvKOdWMGcOFGlX//L66S4cHX8dIZLIMQ6lahK2UbN8Bvd8hje2PJY3UzP
 2ALII5U05O+UOwqHsd3QgaY8cHB7I08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3MyBTYWx0ZWRfX6tzcirHrlrwR
 FHu2mgaAgDKUg5QyU8wfe4gf1EyqdzHjI3PqlbVvVCdHA22oADRbBXZeqiFY04jmKCwRu1WsJoq
 fNLmc90HkScVxT6y0+Q3TDted7g/x9fl/EDC4nyjclOIvSOc0GF/YbROZg9e5sB7uhwPwQ02COX
 FLM7ir5rk2i8rd6Weo92K64efbKqNv5wpJ54Z2E0YdOSnwg61KchfwN4c+Xkco1J7hoZIW2SDCd
 FRJX45DBC4bs/asYYT8VTnk34GUS2O5f+n64GbFrFCBKALHi1KJK4Aab/OsBHyr8ETda1Wo6JVR
 0YkQ5qGNnSDAqoNDUvvLPnY/ZRpi2dqycX4+TK/TS8p1UJaDtvFvCG8NZ5e5QjsBA2wU8u8uPMk
 pZmv6+rlXnCcuBm8sbY6030RXC+t7q536J3OpTY/rCtzkgyf9NRS//EMw9tWwVQMG5VOJXW/WKg
 EiUfTIdcgBFtQ2u67Fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220073
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Found while reading IMSIC code.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 include/hw/intc/riscv_imsic.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/intc/riscv_imsic.h b/include/hw/intc/riscv_imsic.h
index 0a1df1c2f8..c744836657 100644
--- a/include/hw/intc/riscv_imsic.h
+++ b/include/hw/intc/riscv_imsic.h
@@ -31,7 +31,6 @@ DECLARE_INSTANCE_CHECKER(RISCVIMSICState, RISCV_IMSIC, TYPE_RISCV_IMSIC)
 #define IMSIC_MMIO_PAGE_SZ             (1UL << IMSIC_MMIO_PAGE_SHIFT)
 #define IMSIC_MMIO_SIZE(__num_pages)   ((__num_pages) * IMSIC_MMIO_PAGE_SZ)
 
-#define IMSIC_MMIO_HART_GUEST_MAX_BTIS 6
 #define IMSIC_MMIO_GROUP_MIN_SHIFT     24
 
 #define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
-- 
2.43.0


