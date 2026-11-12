Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138A6606A321
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 13:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOeCwYVb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVL4qv8c
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRUiG-0006JB-9G; Thu, 12 Nov 2026 08:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRUiC-0006EE-IU
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 08:19:32 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRUiA-00075F-GC
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 08:19:32 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACBnDXb441529
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 13:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=FJuPyRewKARtbvXHeQvye801NwPP0zClBTk
 qanBUoWo=; b=jOeCwYVbbJ8/oSsUPFMrUIc8VFY7y5W3WEuEVCfhqgB4ivj1M/H
 OJEf9Y3DVu7oGQMYE+6lWlJKl9Qz8o6taYzBTwxGhOEXRMmi1Xp6BjtboOwa5+uU
 Hk3UetiYUMOIt7d2arNwslFzYsL5U3coTa1HMjxATzVGPJLRXUJz8sT1kzKX0ajB
 C65+tkm6Ws82fCAtEmJBuGL1+RdH1DF51+EaCBcbMoLaVQmFqAceNMH4K0xRsCGK
 QoCy4UTaGyZUgLdUGB5+vgIeSH6wPRpPHzdF1iTW9+XHIWZrjKnpB+e8o2q11WEl
 3SAs/E06dRKtsUmDEmWGnOk8JbKmhe0DBEg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc1k9m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 13:19:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91f12cc95a0so20602616d6.3
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 05:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794489567; x=1795094367; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FJuPyRewKARtbvXHeQvye801NwPP0zClBTkqanBUoWo=;
 b=fVL4qv8c1L0+j47FmD0s4UT80gNiTQP3NgWWTdYxtjAfNT5QZp6B+q7QD3VPWC0GYN
 HaxbToNxbeUqUFQ8Mg3eF+lUZatdnCBHOIyeQEpZGjwe/JnTyYTDT11+hVkH57E/9Spt
 GbLXS+A5LCJhxeSeWFdeBfq/zBkbZCTVNC1EZ0SPphZ+IqszfCsUCJY3UJEZWUbdJIf7
 TXb2RgSJKqwca5aJ71mu5hd1wSk3i2eYM/ZgNfE3IDZIE1YS5MyYR0YJxE0B77m7HFxa
 VcCdhopWV2emorF+hw1i5XT6+LI9KrHBBYFkCAFDznWJhwOe4qFF1FBDvzySR8kBYKLW
 83Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794489567; x=1795094367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FJuPyRewKARtbvXHeQvye801NwPP0zClBTkqanBUoWo=;
 b=ybDk9irCsuAK+iEK+N6m/59tMeQdmVkv3tnUh6FQGH5btM9FTdp+qweet8WFPRJtbB
 jjJh/F1KyixgH4f2cLMv6HHDNFjcuuiOtXFmaN/9RdT0lfvbAczXlq6PR2Epq6ogF10D
 B5piE0TDG3kg5CBZzQlvDU65H1+CyFZ6AFlyTK8gXLXmlzZ1756o2alxAkBTX59zSfOn
 983Ktsw31mEdZfFG0YWcWfM8zmcnpBay3+wZ64iDvrtxqkmqxvGZYQATyIUGxWb48fnd
 j6914PEh8zoZWGqIFtUBPwVb8GxCfiIoekOM7VrS5nj4njYjMrauoxPC3A5zDcf4wmxE
 W3Vg==
X-Gm-Message-State: APuU4Z8FOTnujynRqzyYATOttUsMs/bUANdCerrehuqOEP2OvT3W3fZW
 JTBUFOdujjsrQohZxeTBC77PCYz0b/r1cO5ry5oUxl4/y+PLZkAsgEjIUhHd4zOHo5i4DgDVU3W
 9rdFdms6FWSxURzaaqxV8NRo9Som8VE8c6T39ytGPGyc4q4/PsE6mIWl+CWJgCdrZkQ==
X-Gm-Gg: AYBFou0J50dArgJWBBHd+zQ1rpEgjVJuLMoHBG04p3Xu0P+XAIlI4xWKugwFT0cSXmD
 fiDft2j+5i1sZOoc9QG1vA841jNXzTMogVen2SUEauua0zC2/EjWUEuPrk00LFFmwy2U/O+cNtI
 /MOdUaBbEOap6vbQQjkndO+NbRSV0mUlgfZHz0rlScQK9MQZaKH2AbiltOhquRF98aldVpA2W9d
 qiFbI7uCLNPwHjPtMl/lkBo7SUeJSomjOiqWClvlijKbpwynFHtN0C5c9Cunb90sa0My7Ak2CAe
 qiS2YRwtcqxEmfyN/ZtZaHii8hwRctPx2NoF+Wbd5Q6Gz/uWhCIJhp+6ImxJjqVpBjk3PLbz2Re
 73J+Hnu/lMc5X+B583lNXCW5VaeQJQvcw7TZXu02rNr3A78VnKjreDrUWFAzpllxgcqPKw6ccIi
 ckbRBbFxh3Uz40aAwPSgp5rBMV+fjNyAf+i8uP30AUkH8a
X-Received: by 2002:a05:6214:5684:b0:91c:bba5:ecda with SMTP id
 6a1803df08f44-91f03fffce4mr93954806d6.25.1794489567408; 
 Thu, 12 Nov 2026 05:19:27 -0800 (PST)
X-Received: by 2002:a05:6214:5684:b0:91c:bba5:ecda with SMTP id
 6a1803df08f44-91f03fffce4mr93954266d6.25.1794489566780; 
 Thu, 12 Nov 2026 05:19:26 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f02efe5ddsm46350186d6.19.2026.11.12.05.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 05:19:25 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v2 0/1] target/riscv/tcg/csr: filter bits when r/w HVIP(H)
 [GL3133]
Date: Thu, 12 Nov 2026 10:19:19 -0300
Message-ID: <20261112131920.485933-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PDY9EJcPJ29Pl_SClrNkIivUphDVBYW-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfXztV7tNiwT46u
 m+TxTg50xA+WrYLo1LCXBxqqwwg9fak95pPwEE6M5dFhvRkyQQDs4s7EbMtGj5znzLwy3tyhexs
 WmGLY6b2VLxG3jFHZWOjgEWk01WjFM0=
X-Proofpoint-GUID: PDY9EJcPJ29Pl_SClrNkIivUphDVBYW-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfXwKqcc30uqNmm
 YJF1dSevZK+irLn5FO+b5MYGtiThNb6PrRJMQSD9shmscvNv2/IxZCf8MEXWGjJiz3/LTUVpy3a
 8KcMUmfw+kDXCoaYaFK9tvxQYTI47DgCehQGL1vh5b5oJawUXDK+OVFtL3mJHpd5+K2mySEZOfN
 JSGZ/J2dyPcgz+ytRzHbB9grguAxVL1+dmDEJsGWHXQY6zreQH4PacnxHVbC+pFSE0Fb9yWNuWS
 KLCGhr1aTIQtoc5T3ZS4BkhxDfQlBGl1fgDSS7F3fVGYat/NZWpywU4hWkotMZsTavbQPoRD6Co
 1H7U/kV06U4btVS7hAl2GgKv1/8tBvAbR1x3rj5a0LfUGWlWPIl3XlgQWlN0s/SP8kNaf63zJhJ
 dAZH/SWyqgJQkx/5MmVMrKNKZt4nXyw835HjSknenDtUAi9oIh2pYeyTimWhsjDidj3PFnuv4+r
 Hsyuq0QXqmAmtb7Qcvg==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5bce0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HWObzVld2rp96nF285MA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120052
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

In this version we have adjustments suggested by Sashiko and one small
meson.build change done after feeback on another patch.  All changes are
superficial and do not affect the core logic.


Changes in v2:
- fix extra whitespace between sha and opening parenthesis (Sashiko)
- fix Gitlab bug number in test-hvip-read.S (3313 -> 3133) (Sashiko)
- remove 'exe_name' field from meson.build test entry
- v1 link: https://lore.kernel.org/qemu-devel/20261111133833.258917-1-daniel.barboza@oss.qualcomm.com/ 


Daniel Henrique Barboza (1):
  target/riscv/tcg/csr: filter bits when r/w HVIP(H) [GL3133]

 target/riscv/tcg/csr.c               |  8 ++++++
 tests/tcg/riscv64/system/meson.build |  8 ++++++
 tests/tcg/riscv64/test-hvip-read.S   | 41 ++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-hvip-read.S

-- 
2.43.0


