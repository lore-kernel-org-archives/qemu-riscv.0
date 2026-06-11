Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF65ACD98CC
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 12:34:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXec4-0000km-FN; Thu, 11 Jun 2026 08:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXec3-0000kW-G8
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 08:34:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXec1-0003E3-Qf
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 08:34:23 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BCT9v2598028
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 12:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=hNnNky3HjZN9UjJRdWniFH
 KAKKdtx66eIN/zcfAkIJo=; b=bFb/VvNydMqK1MukHrOfn20Mq/LnpuUHKHa2Dv
 ZjO386K9XHmujY/p6lUHsZ2cM5v5e3ge1RsE/uWx3l1+bsoV6WJe7eyzhs2n/uDu
 K9WVvafiI+EVY6vbQb7KRnAW1rXf5M5REBL4V4gXVEqDsNv/8Gy8bk4+1yOnnxmM
 4LJQwD9BzIk3KhzFpRWsgjPnExElC62sQh3Ykzson4v2SIp649Xqb7OgqXCh8sMc
 D6vDLA97ZcKPumeuEiRFnbKRdSwNReBa3EYvnkzkOgRf859M/tdIrMlGDznBlkJY
 lfecd/pKNU+96RdZXWm5pjA6w1p326lj8PNxtHvFLT9SPqLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71kg4u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 12:34:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-915d1d4fc5aso831079585a.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 05:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781181260; x=1781786060; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hNnNky3HjZN9UjJRdWniFHKAKKdtx66eIN/zcfAkIJo=;
 b=O5kpUF6VwADUzW0umHcYtTfyVKUVVM6ZBINtsg5i3K8LSiwdrf95ZxRz4vAZhlt/65
 XZ+aoI6wavdXsMoWFIekEp740v0EoRIY07drsW191yaLjxHAttPSBHrntP75Qf3hJkyN
 n3DSv0w3su2hlK9+XybY4Ib8FXHswjD4ifRsFwZjFjxdqZHN6kwAdvT4+lmKP9v4jUgv
 vY9sMwi/Twqclmd22N9EAAxI+TmVUd9jRLobCn9OF3mpjAapEsPvxk/KgOTQCbsjNVSl
 JGHE70zLSXhiXgDFPsNLQIdo3oa6I42Hv1NSMoNdyuNDPDac4CRu2zqDR+4v3smxWLgF
 89DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781181260; x=1781786060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hNnNky3HjZN9UjJRdWniFHKAKKdtx66eIN/zcfAkIJo=;
 b=iyApHxmp1vuH9zz69s9Pp3orpRzzoGwB5QYVtqqY9L9B1c1289TeDpRktFI1xF4gLb
 SZJpUfGmiyoJSxmhqbpJKj5f/KkSYruI+ML7RCgRMJq4FbAwY3qHJgSas48V/HVXgk3b
 aqb6Iea5GEkZMi1cEEuvAn7qwRIDIYopMjoiLkvgNddoRH4S8apgNVYBgPvuaqfdOvd1
 t96NQVi2Agxbdhm2oE0Z8/yO4YtkCzeXI9iFPQhPHa7CQgnO02q4yoAYX4Nd9KuQDzwo
 sA38VPSo/T8i4bhbL0SdkDc/Qa/nsjlmgn216FvCHpaA+5UwjyjCcPDssZR7T1jbBZSj
 eR3A==
X-Gm-Message-State: AOJu0Yyl8lEIW2Jor2llZ0A/JfhcL9DGfjelnJBkmDEpvQhrBlXxphq2
 ZsBB7QJMyDtoA34XXHru48qsNbyUaSEEAmfHT7vAovNJetJybb41hBdUxCLqPX/7p3h9HSpgvBw
 6I30eZexsh1XBfNIsJ6DyDerRnhWjoiNnVWcETr/Q1BGAB02ARvQvsCqZDg==
X-Gm-Gg: Acq92OED2z0CzAAvehw1legMarNHFVufVFmE/B4e9pByEpnYy2rmDUdGuOc9DyA/axq
 e+yP5h6BTTS2WOef6Qha9h2rj/BxSbpDyStulAJx+19JbkPuxQ39xYjVHdZe9ueCX3Kn95e2MJC
 xiosifv/Db9RdbzCRYGjgb6slhQqEUQADJsZIqpocCsZY8qwjCxV8fUg/2EukXa50JUPDjjQVVh
 E/VIf5Q8M8cGc3cftiM+LV1O3h31kYJRd1+1NOiLP0PeQPEpsi6icPhtSQ10T7fci7db+PXgTn3
 NyMSXJditSspLpM7lgEjJPttrjVmlf9T29iXtBH33Ho4OAoCKQ4XMexTzM9wouKNfT6lAPN0X1e
 icVMlxQdBNBU46/aB29ie7kYIuLo/XLNfmvitz9LN3ztB8ZTz/rlKZP4mFs4+6ly+616gTrJ+MI
 2H0S0uqOCOj/c+Nq6UQQ==
X-Received: by 2002:a05:620a:3909:b0:915:cf88:1e46 with SMTP id
 af79cd13be357-9160ae27848mr368226085a.43.1781181259740; 
 Thu, 11 Jun 2026 05:34:19 -0700 (PDT)
X-Received: by 2002:a05:620a:3909:b0:915:cf88:1e46 with SMTP id
 af79cd13be357-9160ae27848mr368217985a.43.1781181259071; 
 Thu, 11 Jun 2026 05:34:19 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (201-26-7-9.dsl.telesp.net.br.
 [201.26.7.9]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9160acd7904sm181042185a.21.2026.06.11.05.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 05:34:18 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v3 0/3] target/riscv: parametrize debug trigger number
Date: Thu, 11 Jun 2026 09:34:09 -0300
Message-ID: <20260611123412.2135600-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KydRAHXNXYnCIxb9p3nHchTAA7UnokuO
X-Proofpoint-GUID: KydRAHXNXYnCIxb9p3nHchTAA7UnokuO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX7wwiyKXCRcB/
 ZjcQsQOJQsQkmR4s4yIdxdDPmp/EQQjkzL2N/YGf3FRVC/39ULTb4GaHbTsWH+R+Y9LL3M3hRJL
 OU3x6gpgDAufb0R3PkwYBunW2ORtS0quTfvYxfCTAMi4TWIrW8tf3i67YFyoYsZYw2s9w9UmoAm
 squFipCXPjVtiPhK0iGTHgO2abNrnGlqcNCicgGAJ11sDJL0qtBTEbPvOi8lMzWNipcn/828BEu
 I6Wt41WNO5rqFg6BXQ4IuZdosCmyTYKXyU78e6ycoW1xmcY7IfhhZ0KI9OiZhle92vspURQ69Vy
 chRHdeMcZwHVR9+1YC2qaeW0FT1ZONIOXTgstwBg0AxQ/6qrPwjhucAaJjkBusBPeSFRMPMEaMC
 cEkwmGSWLMCI7AVRfZQFzZvGqJnZRwGddv41ZzmM87rOom6Qf1wM1iWeyJkv8AaQL4sY04FjSx7
 ivzUvWrh2jg4GsaGm+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfXxBzJhNqn8Sin
 J2Xigq7tCQnkn1/7l102rnqTwJNGY51vANFyNj/b1BfAqYUPyXw/t6jy1lxH+H557YGlBVMEXy4
 gyk3tfUNTms3/iShw7JRPhTizmo5V8s=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2aab4c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MITIYaLR+oYcSln1dApPwg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AdzE5SDVa_Qk8pGJHZIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110125
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

Hi,

In this new version we're adding Phil's comments in v2, in particular
the need for an unrealize() callback to free the stuff we're now
allocating.

Patches based on alistair/riscv-to-apply.next.

Changes from v2:
- patch 1 (new):
  - add RISC-V CPU unrealize callback
- patch 2 (former 1):
  - free allocated debug trigger arrays during unrealize()
  - change version_id and minimum_version from vmstate_debug
- patch 3 (former 2):
  - do not touch vmstate_debug version_id/minimum_version_id 
  - added Phil's R-b
- v2 link: https://lore.kernel.org/qemu-devel/20260610205457.1868701-1-daniel.barboza@oss.qualcomm.com/


Daniel Henrique Barboza (3):
  target/riscv/cpu: add CPU unrealize callback
  target/riscv: dynamic alloc of debug trigger arrays
  target/riscv: add 'num-triggers' debug property

 target/riscv/cpu.c     | 26 ++++++++++++++++++++++++
 target/riscv/cpu.h     | 39 ++++++++++++++++++++++++++++-------
 target/riscv/csr.c     |  2 +-
 target/riscv/debug.c   | 46 ++++++++++++++++++++++++++++++++++--------
 target/riscv/debug.h   |  1 +
 target/riscv/machine.c | 16 ++++++++++-----
 6 files changed, 109 insertions(+), 21 deletions(-)

-- 
2.43.0


