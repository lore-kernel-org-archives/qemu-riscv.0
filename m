Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C29606A331
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MCfvBK74;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VA1HAV9S
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRXjK-000581-J8; Thu, 12 Nov 2026 11:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRXjI-000578-7g
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 11:32:52 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRXjG-0006av-Kx
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 11:32:51 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACGRU7n1768268
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 16:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=eHchTlOpvEGilHRBT2RCXvbzDNckow6ODZD
 EEJPFLtU=; b=MCfvBK74GZcqUZ2zgbjGlSYd2wDiOMHwJKwS+w3zR5IwamFYyNt
 LiUFJEq6xXYjkh/caWWVUOFe+VIf0vu4Xej0Os1NyI4UAURBKeG1KU8IPLf0wUX6
 QCbk1+3xaRuuQ+4t1OqLKRarKsRC4lPHnnp9R9QBG1J0uzye5zjyLZjHqc9hOU11
 B7Mwjvjm6+ef430flxz8aBlMIbOYgOhZghofzEj8z+oKvdCKajsSPViRmao+OrQd
 N1xyzMhHstZvbfacbgaGCrteyxn7loQc5fidgr/2SOa1aDWKbvmwEywNiWXqKAI3
 7tlxauTeJ7WbQoGfTFIdeUxbYUQroPmXNhQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ag0uu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 16:32:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91f0b2c29eeso45490986d6.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 08:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794501168; x=1795105968; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=eHchTlOpvEGilHRBT2RCXvbzDNckow6ODZDEEJPFLtU=;
 b=VA1HAV9SO8YKHj9q+CKToygkjlOjtsGttdCZGDHy/Gqil9GHqVmLUI1+ecTSy2W74h
 NHcvTWpxIBcx9Mb8p9jG+VD8egIGRScDh1PurP2QhLa02YK4w0VskXN1S56Lu7+NhR9N
 gbfguL6O1T2shj9HzykSe0ucoV1Lze1GSPiT2DvijATELnJDrVAMzL71MG0BXNOPscsv
 gphWXNF0cVSH4456OueZy65uJmWJY/pUXBpBS9RfW/VDTSnou05Es+G6jPRCAtqXhklO
 pKuNxm2B+5l3CSymgXXn4U3RpNaRJh8GRU0AKxiougX28AiPd/qsVMU9mYnUGUF+uMw8
 ZWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794501168; x=1795105968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eHchTlOpvEGilHRBT2RCXvbzDNckow6ODZDEEJPFLtU=;
 b=G737G0Ltv4P52ET6YqQSkYmu7P74/EIoh6Eu5sI2Yzk7ALQk4Q1wChU5X9R7EuF6Ft
 6uEdNn2FlpOWXUiAxqJepyoVdPWV6YrcIACtjm1SeLIaZGA/M7v0TE+Wk0bNOJvFKxTp
 c6a8ErRZuOJI6Bi0ZEwqsL+Dx7Z7xjx+VcEmHC5alKipDSz06ZqkVjdVgxB1o3APGqux
 h5lv8ale5v7ap2kuiXzFS6Q+Pxmlnn9H3X/abecL07NH9tCYXko+eb5LudGPPDFrz7ZK
 jOjz99z+l59oUwoWyS0Ia905fiAUxYO/20v7QYv7m5WicRqqXlXaBuZ0CSPppAKOrAx2
 w3hQ==
X-Gm-Message-State: APuU4Z8Aw+4AM3zyzYMNdTzDjSuLOXcZoz/rGqs6/hCDJsI8HlS7ATln
 UnpKi9qSF6Z9EiA8sjJfNFVISGYvh1mrBWkvtslvDsn4KpMDcstdgV0NLllCak8x2J6Ui0wWVjk
 oU00kYkqjAYnaD9PMCYypOgfzRndF4nnLHCz+RISuCNCxLy4rga1rFF5RVg==
X-Gm-Gg: AYBFou0p6YwTF6LNAiUQVkM7HfQnNRSquxgAAAPdPKdGeDjbqNU+1o1oPRKyFemD6ux
 SdjGPGeRD32i3yRZCT9lve3Xg0N5oOl8k3HW5GO+RnsS1kSmD2nPkKoqQy+1RWxHyusUu7bwhJo
 4mKBbXrdPeM4nxV50AG/7vX8gTtzey5KX3Guycmj+Q+LPYwvKY2edsvy4O9MEmQ2926gAqiEV4y
 nDLWvX6y+FagaVTOqZaURRqkjoBvRQ7aas7FodX/kgpfHeQBNHXHNHfO6FN1r8Zn/OtXfT76trE
 BeksEYjplsnM7Q3RGMub17zV6U1pAYR0AbWWlCHcuX2bP1OwaRssNKSaQbB21ebCCnCE+WjLOpb
 mVxnRTBPfsUncYAro+y6TtoLRjwkYH2ENuNQjsGzB78tsOgzCfLavY3VRgltcMOMn6wAHPv+9Kl
 64wl9tirmXw6RU7BDV6zImwio7JHzMNRADSCsiWLKpTt3j
X-Received: by 2002:a05:6214:da1:b0:91f:1d91:7a14 with SMTP id
 6a1803df08f44-91f1d917b9cmr25954936d6.53.1794501167845; 
 Thu, 12 Nov 2026 08:32:47 -0800 (PST)
X-Received: by 2002:a05:6214:da1:b0:91f:1d91:7a14 with SMTP id
 6a1803df08f44-91f1d917b9cmr25954306d6.53.1794501167215; 
 Thu, 12 Nov 2026 08:32:47 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef04b01c8sm74698256d6.10.2026.11.12.08.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 08:32:45 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH 0/1] target/riscv: do not write SXL < UXL [GL4821]
Date: Thu, 12 Nov 2026 13:32:41 -0300
Message-ID: <20261112163242.509864-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NSBTYWx0ZWRfX9n7ovrxFy7+y
 l3VX7xYY2MQcQHoqB9WwuAaRCaUgIXALWlU0zUrWYCIHI5T9E8gH0b9l/woS8d7jN6M4J/6j8U2
 DCkNYxCPB2eXlyNBG8EFnMNOTpicyc0=
X-Proofpoint-GUID: QaEH8aS_Tgb8AGDlyjc3_JBjTMlHS6m9
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af5ea30 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=wEfSWgzwnHx19n6eIhcA:9
 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NSBTYWx0ZWRfX9rq2JSCUYua1
 lo+mcxfaIaBpzgninSiFK50tdYH5L+SeTmVYAfp98n+ko2dzapzfTImtE48rreGP4tvYWaHAWCE
 5AXk8Xyi8yge12TkTv6+gPIPCdp9UfUwtGZjAy3SjEoI10yzBO7tD/RY6XcehRAbfu3UR+zOUHh
 2NJJ4qjFQbIOopiEt4GQSirIE2oOU50Tw3Hn7SFiG0uT1jgrVAWx7IrBzXzrBvnLfQ3UCWO9Ycb
 De4CDflmIt2u45nbbGTQJaSevUNb85J0pUuIRhxzjhc1eSIveVYImf0Q/Zodp2LFibXo76sUH70
 s/K2SAKlgnCnAvo/pkJcBZpkbyY5FXTxiddW/N2jt7QKB6o9e5rszT8iKCG+mj2It7KQ7aYf725
 G8zmfZyuxGPDceLVDYHumS5YuFD00paur2hy/i6I98z4YPH126AfdIrxOfipbTZXwKIaxk8KbFs
 1INgYPPq2YIQw4QkiLw==
X-Proofpoint-ORIG-GUID: QaEH8aS_Tgb8AGDlyjc3_JBjTMlHS6m9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120065
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

Based-on: 20261110232614.83050-1-christianslima@proton.me
("target/riscv: change mstatus bits for read-only if S ou U unsupported")

Hi,

This patch fixes a Gitlab issue where we're writing a SXL val smaller
than UXL in mstatus, which turns out to be a spec violation.

The patch is based on the following patch from Christian:

"[PATCH v2] target/riscv: change mstatus bits for read-only if S ou U
unsupported"

Christian ended up sending a fix in the same code region and I decided
to avoid the conflict by making this fix dependent on his.  In case his
fix is delay I can re-send this based on another commit.



Daniel Henrique Barboza (1):
  target/riscv: do not write SXL < UXL [GL4821]

 target/riscv/tcg/csr.c               | 40 +++++++++++++------
 tests/tcg/riscv64/system/meson.build |  7 ++++
 tests/tcg/riscv64/test-uxl-sxl.S     | 59 ++++++++++++++++++++++++++++
 3 files changed, 93 insertions(+), 13 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-uxl-sxl.S

-- 
2.43.0


