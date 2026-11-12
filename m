Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD395606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7/Kiw35;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HfqKvLH1
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRUIs-0004W1-1S; Thu, 12 Nov 2026 07:53:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRUIp-0004UI-Ix
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 07:53:19 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRUIn-0000xJ-Rl
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 07:53:19 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AC7oVg32818494
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Zau7GHircVSCPQ+4KmecXSucJj622hCmEeS
 EjRFpPpo=; b=Z7/Kiw35k17Mysioo5Urv+suWDumi9vf7Yvzmv2SXhT+EvTfzKI
 42lf+Hp0Xpr/Foaq4oHW405b1yWuLVOqnP0AT6LeQ1112LCCFQ2YqLbW1e1POwyd
 HipfqxHuatIvY6MGumofFeVg0oRFa6I6prvRpq4lD+FXTZu9p+8lk+uuYgaGcjNx
 FtrGlQVBLt3cNr0FxT+FaT7xTYzjIu+L6uTqlFBXXlD6GOQXjTQhOcEnCABLzqBN
 OMpPbVS73B8CKV3l5JZdskkBo/FgkHLm/OLLEj/Jh13Z8wRswY5OjfLeubxsQyBo
 BmEP+ySTbhxbh8E8t/QqqO0uTKrGBvmStjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e192au-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:53:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93e49a1d3b1so1013526085a.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 04:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794487996; x=1795092796; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Zau7GHircVSCPQ+4KmecXSucJj622hCmEeSEjRFpPpo=;
 b=HfqKvLH1PKwsnRHEjqG5MPpvn7aTmfbOxh87Hk4gHKI+xc2C/gQPPUAvPYWdXipWrc
 vVQ3yD+cZIfYlYvCcBEFNV9D27aSfXnxDqrHz/bs0mAddNqf0G4BPpxicYSW/2sBL7CI
 9/Fq+85cU3CJ//a42EEREuw9b0tHfgFCEJZOnuQGNADgnFF/n+d7DhGmJBY3VW7Hb0ik
 1DVN9LIHgq/1gvyZagFEj2WYYQPl1lzHX0MqKfwXEOSqESHzQ+uJuepQEKdzJeSfD5Gj
 KiPFPJI9clPL9wLhVgUNTurtPX/AfhAEUnDIfLtTmCNyLiDuzi11LNgRk1THhMB/BbOC
 JvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794487996; x=1795092796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Zau7GHircVSCPQ+4KmecXSucJj622hCmEeSEjRFpPpo=;
 b=VCDrJ+XNyMUR5QaV8XKbNmIpNd6n2IiS0d/ymYli8M88l0lMr+80cgH8+5LiOl/whs
 iwe69kLUDdJiOs9cExnt9UtmuoblNom6/GngsW4U/YlyiJPQTJHYc257HvFBuqA6tax5
 6EeNzkr0cFNYAji/7fMSO0xToJSHqQdjMvewv8HtP9eoWPP52sEZ+yyx2fCIxChdur9C
 L4SBSWs0PQa4m4N0i0fCfs8uxFVCTlOCjFZrrPf40zhVbkwG1BB0awA7JAr8vADu4t3n
 3lzS/6xq7s9Mxfw+hjaVsWaSp2/Sbw9/aCxYUQpIN+w7BA80Wia0rJmk9Zwb49H5bx6S
 LPDA==
X-Gm-Message-State: APuU4Z9wzm9NDV+8C1AXHuyQhO7401VLHOIYBDvvu57oYVYNQtIn/kgP
 O13vn+BvCkZ9L7GObtIvqdbMk8Uf/4jBIn7PjUQBVJowErptmVJNSEXhf42wROFMEbIzi9VkPqM
 ATp559w8eDHVWrlP++kb+q4OLINPocthbYLwcu0zx4z52Zc3Dl14Oc94V2g==
X-Gm-Gg: AYBFou2WQRf9UcqMjWzGSlId2/V5NN+dvb6a2xR8h7oLKt2SeJzFMCgk8HnckcjBaeb
 G+KAoSU4OSahMqQWEiPZFNEn1XDlfFJ93BL4m1wexuWeU/Fv1GfqJo3Gac0DuqKXck5fS3bDKK/
 u/B+gAwyV4j7+jF9W6I0ln3kpglVFsHwwW1rkA4OMcahiEIiM68PcJ31HmN91aXTnbt87+V4Vcl
 zsVPppRC9kLQK9ccDleOLsECbJGHb4AiQfHlRIkClzPLDtmlSJlbHS/4iiaJEm1hkBzTbwOzi/k
 yFmyRPAfGc0upL4HeIQ8e4oGuG+SxEduOSt2M1vfKbX3m3G3+8/zkAmiHKYAXRA0kQOShDu0cpU
 Dr9NAId0CCc51kjuiSZDByPNYAwqd3cvdPx6qMu+8NG0JfQqdCxUauKsOjxbdIFtGBDicTE+VK4
 s6TrzVJKCj1/Z3+pBBBJtMduKXRt7YapBN2UMFk9vOp1dn
X-Received: by 2002:a05:620a:17a3:b0:945:fe1c:82bf with SMTP id
 af79cd13be357-947b0083af7mr904163885a.61.1794487995754; 
 Thu, 12 Nov 2026 04:53:15 -0800 (PST)
X-Received: by 2002:a05:620a:17a3:b0:945:fe1c:82bf with SMTP id
 af79cd13be357-947b0083af7mr904161385a.61.1794487995326; 
 Thu, 12 Nov 2026 04:53:15 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08de826asm92994755e9.0.2026.11.12.04.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 04:53:13 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v2 0/1] target/riscv: avoid amocas.* x0 clobbering [GL3526]
Date: Thu, 12 Nov 2026 09:53:06 -0300
Message-ID: <20261112125307.485690-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX4V+EBFgRYlG7
 JivVSSKxW3BARtAI79zJ6mKD9wkObNSgkhrWpe0b3olwqDYCVIjD1wgG5tEZ3Tj++33w7ZwT6ot
 ZXsnY2tzn3s9uGq6y4UuPnqSIQ8xOYRHY2Plv1emQCwnmc6oHYTsmZbYGb8yb1V68V/Uoev4XFY
 GNBfE0aWcV/DuoeuNbrj/txNkHnpuVS1VGtofLZOKs1TrpAVQrRda/s8LrlOllqewbvlBwKh4c3
 23TWVPYN5HXqIJfzvE+EJ7w9K4qqA4WtUVHCSAXtvfv/L3LYgImcC6KakKomF6iKI/9X6bW3py/
 SUG1BxWA+EzEqUZ5sizxeln3tk1Q7KAi+naMTuAWw31FfpbScA/UrOJsOcoGbPIvev7FnmCMsVy
 Q9NTy+XOGC4thNal2gQBe4UlwfylzJzueja78JVdS17kL5IbPz0R1ZsFgTKeQU5ARMku2zxXCNZ
 ldJgUq2EWLGa4J4GEsA==
X-Proofpoint-GUID: 4H1U3jMnUn7FD3UzS5K17BVGGqaK0iOx
X-Proofpoint-ORIG-GUID: 4H1U3jMnUn7FD3UzS5K17BVGGqaK0iOx
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5b6bc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5YhHKsphd0Gvzk42CI0A:9 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX7jbwgPSELRgW
 8k7EdDPX38Mate9ril1t0DJzqzSodOiGQ363df4h5zQsCkTTUjKfSlE9IQxz74u+yhW92kqXnMB
 3FFq0l4ZLYFpipUOL7An3KlEdH1AyWk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051
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

Hi,

In this version we removed the 'exe_name' from the meson.build entry.

No other changes made.

Changes in v2:
- remove 'exe_name' from test-amocas-x0.S entry
- v1 link: https://lore.kernel.org/qemu-devel/20261111205043.327652-1-daniel.barboza@oss.qualcomm.com/

Daniel Henrique Barboza (1):
  target/riscv: avoid amocas.* x0 clobbering [GL3526]

 .../riscv/tcg/insn_trans/trans_rvzacas.c.inc  | 15 ++++--
 target/riscv/tcg/translate.c                  |  5 +-
 tests/tcg/riscv64/system/meson.build          |  7 +++
 tests/tcg/riscv64/test-amocas-x0.S            | 49 +++++++++++++++++++
 4 files changed, 69 insertions(+), 7 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-amocas-x0.S

-- 
2.43.0


