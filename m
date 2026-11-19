Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DADC606A320
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 12:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3NdkLen;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BJwnP8oX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xU1Sc-00088I-CQ; Thu, 19 Nov 2026 07:41:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xU1Sa-00087r-8x
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 07:41:53 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xU1SY-0005IQ-7u
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 07:41:51 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJCUgpv2315567
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 12:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=NgfX0w4gv0YgyjfMQixIbRMidp2QsPIaJqc
 hsDDXBz8=; b=O3NdkLen802wl1BYVdNBFvbcpH6N59HcjffSUu0FHAcsrGDcRVf
 cfEvaC/aduNvq1zkWy00z2g045p9uv8Nex1veIgZbV4Bccw9wdQoI8h84Jh9FA0D
 OYV3DIaX/u/QiqVaLamDxXOhCy6i8MeNyKQHnrW9Er5VR+q2F/xTYTfaBHGvXeal
 6b6UTzdkXFofOGwRDa9bGgEofM3N2r48MAz2TH6urCdoEeFi3DaW02rotQ+285XN
 Vb2Xcrtna0qbJRhqNyvZAk6Sk+LjrOXE0AaDk7MGpIO6HE5A8mQj5bL2CdIX6F49
 Mvc130gmEoaYOHk1ALSI1Q7VwjMgFwWEbEg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux9hyu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 12:41:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-55c950b47ffso39706471cf.2
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 04:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795092107; x=1795696907; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NgfX0w4gv0YgyjfMQixIbRMidp2QsPIaJqchsDDXBz8=;
 b=BJwnP8oXFGdLUNrEOXec09jBPuR9hCY6RPRhHQHxfJb5HC9T5t60L/C25WE9fK9b5t
 iEASTgaZg73uSeLaBYQhfkne73HnfqjEaFs/SRn0RSN2hy1YM2whQWeox3ELs+XNbXcB
 /Ai4xdYDT3nzLitIkzuHBKMZV06E8YNllvuAcH5y2leh+QEQhXB8DivSVu0C2T6R+Jbl
 h4dRhPFTydeuFNH8caFvQ3JXbpSD2ftce7J1Z/RK44xhr9XV9SHaef3kT9Ms7U8xbKnZ
 C6BYFttEJ4bIl9p4pggYgMj+HAbPNlKcgc9bFnTl54vst/80yY2ooez7Bzb1gZYu3WBs
 bjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795092107; x=1795696907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NgfX0w4gv0YgyjfMQixIbRMidp2QsPIaJqchsDDXBz8=;
 b=VpE61sj+McarJEnJwSOIKeg16/BtUJBXNg6+qMmUhj+05B3kk2LGj2ExUReNLrB0Us
 +pD+rzNlwue3jZH7dWdnsGonVTFQFa4zcFvE8ee6eM7hCLoWlILx6lEpCDrEkhnr58qY
 D2gVCvGiJhBrUHelm6xAKMDAd/EVsCKbbxK8rndUCiW0SCKk8sp7SOobwcQMe+oTGcTo
 IQQwETwWH88XX5xNJpEmYHP+kJlK/pD8X5bETMVLXxDyPkSIEuJBW4kDTs87ascqVoFI
 sG5AbG+sONhv2K19S+dT299SoYwhgIDZLWlJVqhXSApBWrjqZweStLZFaBltfJ+JuWEk
 osfQ==
X-Gm-Message-State: APuU4Z/sg8ivGSJH9ZewFlgbF3Y/bB6UNgZqEr39pr4QLuA7fxRGYiwq
 if4tnoLxUVRKpXQdnXP58tkjq8W53Ru+UZoVJqVl6YzzFlNkL9K86AceIPy/LAoNe6SKaDG9HGF
 fuMns40rvrDppX6gDNic270m0r8KwFEfBvIULFOEGxIABsW1tHT+KbEG6aA==
X-Gm-Gg: AYBFou3+GNq2FqO4SPUKng/lbP+GRXqc1Em0qiXjugMrdjiLBuj6nkf343HEvME/qMa
 f38UIzGRXKBlzTKVNjat2CqBBp9R3IGAOhot/iGzXnOqpoXU95xg/HMl4mzrMcl7ox6Xpdm5+k8
 +tF/ceyAmf0gDARUzJSbMMROMMIWtW4JIdihci196+bTi1reLBaxaz0QkjgG+/u33n8hiqELMgm
 H17fbZg1NF5xvdZ6B39LmdZs75YRaExvC93ccepkJkOafSkV1ZZ8gqOQ/DD6rP8HhF0j2nMX+qB
 1xgMu7n/EoDL5z+7MN5kyIzZlyDWCP8kvIJdc1KGcX7346AE+4pvjZE513bvcSRe3o6n5MJu8ua
 OOiD6wHRzM8DZerOIRJZkne/61WR+eC7A9gkRNDGnGPIFdykcBSwSdr+tsZ+uWKj6PkhgfZEUQM
 oIIL0sNfWN4ZiW
X-Received: by 2002:a05:622a:1f89:b0:55c:a104:ebe2 with SMTP id
 d75a77b69052e-55d5a30880dmr91232931cf.9.1795092107270; 
 Thu, 19 Nov 2026 04:41:47 -0800 (PST)
X-Received: by 2002:a05:622a:1f89:b0:55c:a104:ebe2 with SMTP id
 d75a77b69052e-55d5a30880dmr91232401cf.9.1795092106536; 
 Thu, 19 Nov 2026 04:41:46 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([187.106.240.201])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92114d42d39sm49183276d6.21.2026.11.19.04.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 04:41:45 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v2 0/1] target/riscv: do not write SXL < UXL [GL4821]
Date: Thu, 19 Nov 2026 09:41:40 -0300
Message-ID: <20261119124141.1279663-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iRix1s8egJbTLQfeCyKPvOXS-TMd4SAX
X-Proofpoint-GUID: iRix1s8egJbTLQfeCyKPvOXS-TMd4SAX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MCBTYWx0ZWRfX8WFc5MP55LrV
 Z84JAtHKJiJ4c+weIYQ2HYlq2XfKUArN8GnvoV4sbTeaMOcTA4eOUhmT4mdJpx4+ZiRvFCXPInv
 V1cDDGxzd+a+1QOHL32y5IHNO+iwhyU=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afeee8c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=7SJRNfuEitxYTu7vBacxyQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=n5zDcO8f0wk21VbzwOEA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MCBTYWx0ZWRfX38uezFguB3PW
 r+KF+bRcYYXKYsFES6rkh+SD7pvLJz1rxEzvkxQkszHUKk0ftFXVNjIQoKaD6dCfrMnicCjahhk
 Hf/7VpVA/fIUDpNM3mYj3LsBS+Nt5bfJoiakJ8VuAqVhFuqqub0NgJsTb9s0RSFx06gtEIqet2K
 IX3pYXSH84n/EZlP/212bDd84SKG8s3Qf2ss/lK+F9lIY3MdTAOReBhPg88c3nBaGrLVD4lg3vU
 ojA16K0WW4JftRwllzdl06x9HcPRh1j8ASqmQZR/1VFwOShvhSuZ1iVBO4DBZru2lVTlJXWh5k0
 XQCEQGCpC+1hd8ArPK+JZrnnMO1zLJc/UX2mzM8wMnZ0tSl8LOXZdaMkHr2siyY4OKOvWZ5Q//i
 eGiFkE2m4rGINF23SkI10qaNY6znC17zDgn8mZa9wFs8RRh03i24q6vl4b3p+yTwX1lZ6ltW/W1
 fyFTworrGp3s13xPIgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190050
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Based-on: 20261110232614.83050-1-christianslima@proton.me
("target/riscv: change mstatus bits for read-only if S ou U unsupported")

Hi,

In this v2 there are 2 Sashiko-suggested changes:

- added a "Fixes" tag;

- simplified the 'min_val' calculation when writing SXL.  Sashiko said:

  "- [MEDIUM] In target/riscv/tcg/csr.c (write_mstatus), SXL can be set less
  than UXL if RVU is absent. The min_val for SXL is only derived from UXL
  if RVU is present; otherwise, it defaults to 0. This allows a guest to
  write SXL < UXL, violating the intended fix and the hardware contract.
  The check should ensure min_val is derived from UXL regardless of RVU."

This won't happen in practice since we're basing this patch on a commit
that will forbid UXL writes unless we have RVU, i.e. if there's no RVU
we can assume UXL will be zero.  But, by this same logic, this ternary
is unneeded:

   uint32_t min_val = mask & MSTATUS64_UXL
                      ? get_field(val, MSTATUS64_UXL) : 0;

And we should just use 'get_field(...)' directly instead.  So we're
ended up doing what Sashiko suggested but for other reason.

No other changes made.

Changes in v2:
- added "Fixes" tag;
- removed the ternary when assigning 'min_val' during SXL logic;
- v1 link: https://lore.kernel.org/qemu-devel/20261112163242.509864-1-daniel.barboza@oss.qualcomm.com/


Daniel Henrique Barboza (1):
  target/riscv: do not write SXL < UXL [GL4821]

 target/riscv/tcg/csr.c               | 39 ++++++++++++------
 tests/tcg/riscv64/system/meson.build |  7 ++++
 tests/tcg/riscv64/test-uxl-sxl.S     | 59 ++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+), 13 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-uxl-sxl.S

-- 
2.43.0


