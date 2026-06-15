Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0CFCD98DA
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 20:42:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZE43-0002MT-4p; Mon, 15 Jun 2026 16:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE41-0002Ll-Eg
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:37:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE3z-00026U-Eu
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:37:45 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FIx1Ol3577893
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=axyRQhsjYr5g2gKkY47VgQVhV7ggL5zoX9r
 x13k8NKY=; b=pMrM1nQiswcsbBTH/7A2BDwxd5hg3BeTJJkh9vR6weoj97U7uUe
 R7Zkwxf/c0I2Hk2SGY0fcwvpg140jMLbFPMZTnxOFwAV3Nym71mSIMdBkqK2xaKo
 fEZC5y/Re4Pl7o5cHNeEpSThUDWtADTQEBlzdWiAYJLVOCQU6HRQNG1+SrJTKiT4
 dZWK415g08zJAlI7N5OjADPiAqGHi/+0kHPVoWTZ7o9wdmR1skuiJQIRbqfud5kQ
 FXcbyG596u9Tze47Y/YNsvU6zsb6xt5HuqZIIGuWHoqVMJYaBtzxR8zbgWpfAwX4
 h6s8QSUJHeXPD6O+uZtCfaq01xSX2Nv3DmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete98328g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:37:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9158f07f5eeso621810385a.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781555860; x=1782160660; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=axyRQhsjYr5g2gKkY47VgQVhV7ggL5zoX9rx13k8NKY=;
 b=dd15tuyrrcultllcKyfmSCmHyLaHlnkNKpb9nGi1bAYYto7hZbSqUMjVB2atIB1UBj
 EzIxY/hEaxIKW4VbepjY2J2KY4Yljh9PZ4+oAiw2TWTZ9AktDxB/mTVjKE+J6pU3tAmA
 h0QuEN+C7vYfAtnO8JLKfkhbeyddESnLkldrkrl7fbY497wS7ojqVro9rc8y/kxChQ6H
 IijVpUDwjmNTzBnSlKE3tsISwpHlNsrM6p/YAhm8Gk6QQj8sAhQPNZAvPV23Sdpw4gSk
 Xdxk/H0weIVE/D42DFwGlae295lBdFvfCoAgKLmt9vNtuc2/9h2biChc4JtctPgQdh7X
 husA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781555860; x=1782160660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=axyRQhsjYr5g2gKkY47VgQVhV7ggL5zoX9rx13k8NKY=;
 b=PFq3jZd1FW75F7rU/aC+15a2hJ3Yn5KE+F3qiTM7CGS8PfFDztS/e6YjGwqqpPumwt
 LI2/FLRTmYckDQrfptGM2BbP3qVpL3Y0R2LfEOptSkSapt2ZShmKZ+SCdiproaMrYdMD
 zz+pmyPC7teki/B1pJouQJFmNsvRJ7c/pfXnBJmm87tKCUV7zNS79yV+1bz1K7JidnaJ
 qgYWq8FopOHAyK6JJALT4RwCYkTs0kp61PRE/xSw4Oae1DzNyVGJuT3TYbKNNzPIs/lQ
 qsu/kvKeTZV6zBLLxbfcNA2Kwbjt9zgdV09hZdC282SSeR8ajvkgZtBYAIb1fSKJYT3q
 CxZg==
X-Gm-Message-State: AOJu0YwpTdBT8+4uCwmaqj0M43ygFvmoWArietoJdcI9ymmqfFVo0ccL
 AYEY30jnMUoWrwxBw2OVyU/u7m37VclNo/8o7uJwuStxy52Zmwso4gX6cFxk0CPWOA2SaTFBnhP
 w32ex4hV5V/mI85IwvOqJVg4Z8L/bHpgu2sc9Yf6l+fPzU4XZiPFmolh6Ew==
X-Gm-Gg: Acq92OFv3x4cyEC5bwH+eSPEEgRVkr4+AyaMQPV454pkqvF8E8R6S8QpEqq+8/gesdH
 ZTN/4jYfsypWAflh+Z6RRKm6j2NfHFtEe/P8h+Uo9km28SICr7WNTmp7df0wsYNXSFfj/IkOeyh
 +VcJUj4DAIBqIpnuJhXIlVNilnxzNGVqdSOMDN5Ug6U+fZMvCOdmNgTypqmOGtJrRMyNaD/hYOI
 Wjk/9UD/Brqm+79YDNNSvyWiKOhoxDiTSjILdxOWG2GSyN7VHn6UmNyJ+FlQ7SOW2CnHsLbebEY
 QqG4Kf4Awp0kCLrCcy8fnpZvZT8uV9Nynibb/0d1d8DOfpShCVqUSAk/R5HkJ9/9bheTpfhiud1
 IbgpvS9GDNh2/LnGtCOuw3HDnUCCGSJjk6o7nL83yPED92nBKVwFSwx3VXMQ=
X-Received: by 2002:a05:620a:448c:b0:915:e670:4021 with SMTP id
 af79cd13be357-9161bd3cb48mr2411946085a.45.1781555859664; 
 Mon, 15 Jun 2026 13:37:39 -0700 (PDT)
X-Received: by 2002:a05:620a:448c:b0:915:e670:4021 with SMTP id
 af79cd13be357-9161bd3cb48mr2411941485a.45.1781555859220; 
 Mon, 15 Jun 2026 13:37:39 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f4740fbasm9749906d6.29.2026.06.15.13.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 13:37:38 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH 00/13] hw/riscv: FDT creation helpers
Date: Mon, 15 Jun 2026 17:37:20 -0300
Message-ID: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a306294 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nnGBDgB4qGfNlK-uG0QA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jNCXlpPq-f0D23-60T1Jfgy3P1Av1yf8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIxOCBTYWx0ZWRfXz3Q4r1yPjpv+
 bWzS9XRTehI//FFt8sJ3H2OdBvT1F679lrDg1PhYbFf5o+cVckyo34AakTuX9jbVBE2qYSxdl6g
 LlxZ9lJOTRdCECsaGjsgWGtTBwDahoU=
X-Proofpoint-ORIG-GUID: jNCXlpPq-f0D23-60T1Jfgy3P1Av1yf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIxOCBTYWx0ZWRfXyaAxRCMgaKPf
 dhuK1U3B4uDb3Nd70Vz8AjDhxpoWcZS0uGhlJmvjbxrOI3G2m4fzYROAV+fDy+Wnpo2chCxWk/e
 LM9+34zpeXI3odqQwQyy6kPyWKMU3Pi9r3URYxrLzZIAFCX1//SZS0CNo6fRjG/iXHS9mBzavKv
 KKyS3C7jPXagop0ecLHoIf5DCVjGGWS5PygH7e9Tp7GGC0mamuHgoruJAiDzhZ4GwXAQrFeyiMf
 FkrkJ2zPw2KVvzxgHE43SCJlDNn1CKgJxF7yd1Y4/E8Z006+lLbotNTUWhXKdgqxjSbQ0v7ZsbX
 hR2lms+WYk100xOGyki/FUeybrCp3eUnI1WzvYTBN1axfKWaLFi9EYoYP8kbFqRDN5aM6tYIlDe
 RbsMJBmomCea8ioUKOZ9ofV45oZBIOUkaGW4/zJd37cRBAT3NqgcJVdKMKW5NTo5rKGfENDIz4N
 jWbgmS6FCyaaszulVdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150218
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Salutations,


We have a good amount of code repetition between boards, mostly because
we copied/pasted components from one to the other across the years.  But
now we want to upstream the RISC-V Server Platform, currently at v8 [1],
and this topic came in the review.  This is a work I've been ducking for
2 years now but seems like it's time we do something about it. 

The patches are mostly code moving work with some design decisions
here and there in the new helper file.  When needed I changed board code
first to be compatible with what would be the helper (usually the code
from 'virt', which is more modern) and then I moved stuff to a helper.

The result of this series in the FDTs:

- for 'virt': no changes;
- for 'spike': the /htif node changed places with /soc;
- for 'sifive_u': phandles values for cpu-intc changed because now we're
  generating them (see patch 1).  Aside from that the board now has a
  'cpu-map' subnode with cluster and core IDs;


This is not everything -  I have a shorter follow up FDT  series ready
to go as soon as we get this accepted.  Figured that 13 patches is
enough for one go.


Patches based on alistair/riscv-to-apply.next.


[1] https://lore.kernel.org/qemu-devel/20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com/

Daniel Henrique Barboza (13):
  hw/riscv/sifive_u.c: add a FDT phandle to cpu-intc
  hw/riscv: add fdt-common helper
  hw/riscv/numa: make numa_enabled() public
  hw/riscv: add create_fdt_socket_memory() helper
  hw/riscv/sifive_u.c: add intc_phandles array
  hw/riscv/spike.c: add intc_phandles array
  hw/riscv: add create_fdt_clint() helper
  hw/riscv/sifive_u.c: add cpu-map, cluster and core DTs
  hw/riscv: add fdt_create_cpu_socket_subnode() helper
  hw/riscv: add create_fdt_socket_cpus()
  hw/riscv/spike.c: use create_fdt_socket_cpus()
  hw/riscv/fdt_common.c: create create_fdt_socket_cpu_internal()
  hw/riscv: add create_fdt_socket_cpu_sifive()

 hw/riscv/fdt-common.c         | 202 ++++++++++++++++++++++++++++++++++
 hw/riscv/meson.build          |   1 +
 hw/riscv/numa.c               |  20 ++--
 hw/riscv/sifive_u.c           |  88 ++++-----------
 hw/riscv/spike.c              | 123 ++++-----------------
 hw/riscv/virt.c               | 182 +++++-------------------------
 include/hw/riscv/fdt-common.h |  33 ++++++
 include/hw/riscv/numa.h       |   8 ++
 8 files changed, 322 insertions(+), 335 deletions(-)
 create mode 100644 hw/riscv/fdt-common.c
 create mode 100644 include/hw/riscv/fdt-common.h

-- 
2.43.0


