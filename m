Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004A2C79FB7
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:49:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4Jbc-0002gE-Tt; Wed, 09 Sep 2026 10:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4Jbb-0002fc-GM
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 10:48:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4JbY-00077Q-Rr
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 10:48:55 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689BU3Ce2171596
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 14:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=BNZq8f6haN7eZR2vxXJRo8tSko0cEM1Glc6
 eWHTwJnI=; b=gfKXxhpc5NKEEjLBL51RdBFj9/Z63kTJb93C4sQ1Dx9RMmlctsr
 xmIyPmBvyLDsZxa0y5UzjtYUz5q/jzQSIYvEYV/Pz2g4HGTm5cKiEQ9SqVL3Ubzw
 gSvxSBv34bEjAEkglqFdadlhqRsgZg1UA3/FhWFKhyBz4azR9b4PpHiaDDJfcDYl
 fkVAxeWK8e8mhesD6uzUhHDIMzz7hsmSxBxankeme8ZUWUnutIyrmm/MH5kh4xdA
 LJhgv2RaYIT+Wn/MyBm8+arXcW1JZBMBHRzUnbgyGL/Cq9y0rBptVEZ/+02/EkRF
 rfs8mv0SZWYoNUbbDv77mXAozxC6/BpUEeQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rgh1h3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 14:48:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-9104ba8bf51so102337006d6.3
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 07:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788965331; x=1789570131; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BNZq8f6haN7eZR2vxXJRo8tSko0cEM1Glc6eWHTwJnI=;
 b=Huq4//ka2RMKfaJl2EXnGL02bfA/VVeM6ryDotAKJt3+jtNivl3nzRJ62XFFEJ6xlO
 44qef+OsmbFRm1N+jkweEK4M0tqyuI2YEH2ZozBZOcCTPtlu5WBIb1XRmw+oTLc1BIbM
 P2Gt3LqrNKNHkYHdgbsb5You68MoVfzYeOgHXKfPWNkJWLdm6oga2tzZjpSMysN65D36
 onQkrZo4MAbCZvgkYNoUYxZjIMHSPaxIshi2j6n2Adg8ZR1V+iubFoxsaCvtzzJwmutj
 EjQaDCheDrQXYoh3b7lyIeTaloUGSVh81rsxOXr8SbS/3RCZciD3TZqHce4HVQQ1z5iw
 jBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788965331; x=1789570131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BNZq8f6haN7eZR2vxXJRo8tSko0cEM1Glc6eWHTwJnI=;
 b=mqPnTc9tpWLtjGlk8b22jXyyh5H2tTijksvo1BRoH+mlaHXXdeWeCXoo+9FeSUnLtm
 NhmnxOyFUPmgMYs52YQzukKGZpCsfDOBU3ANJSLMtiIUEvehal1RA9Jc5YnB6lzOQASd
 +wG7wX98bBzjKZMMLiWfuGwIIDprqB+KVQPDxXv3GqJHUI4zTA261gSB0xD+4veYkjqL
 RFjcRz2IkoSIM5mG0Rc4zA6bYCAk26Ou3X2TjBgA6d4cUxWh8GSAVq/qq4nElxAm7IPS
 8muQfjBkTeiuXBu+kwgD4Sk6R/Wm49Ef4Bo3Az21rFTN8cGro53MQlKT6+ie2zSR9PpJ
 NScQ==
X-Gm-Message-State: AFuF++lWkTW5ux4vp8hFmi65HA0pD42DT2VStDMEEn3MqQWIY7jAe00i
 R/wYqsavNDV7dJkQhawjFtBsZyzGpaGvYdjMu38a6+k4Z5vOs+wPL9H9A5kzOlKJ+//64F0C1yG
 W4r+Jn9dpqloIsNxgRo5W/0nvDeOJF3x9JJwblInHDcHXQtfkvdtwqiS+yQ==
X-Gm-Gg: AYBFou1PoWhY3V47WMLmX4ieO+JcfSXCP61odMldNb9qMFD53rhljTAElC2Lk1ZmsMn
 puzXgo/Fd4BdcGfAx+LQD/NiBWrfizcsR0DDOhLfznBQMcEwd0war2Ycr6/gxSmMfncUIIIWFyb
 V08Pki16tzczDWUNaSs2EUB93ESFiXstEZ4IBGXy1YCJZ32PuYtN4C53UY6d4X8ptdVePl/2fGF
 UGfwsqJQsCqnmQqlhtwzU/+8NY2jQEruipKSh9jWCNQtQ2SX1A9cql1WaHkpkNjmjVdnDI0V6bO
 ZJlsOQoBneTjRnVDv6h3qtn0eTA3A6DmeMuN9w0GraqvQt/aofYL0ZNdUlaK0WBPM2PWnZgk2fU
 fqB48Zh6/UXPEzzMnMkWnr+rnkMNRAzEVpklD
X-Received: by 2002:a05:6214:3f84:b0:90c:e3b5:85da with SMTP id
 6a1803df08f44-910ba02ce24mr27635636d6.0.1788965331166; 
 Wed, 09 Sep 2026 07:48:51 -0700 (PDT)
X-Received: by 2002:a05:6214:3f84:b0:90c:e3b5:85da with SMTP id
 6a1803df08f44-910ba02ce24mr27627106d6.0.1788965325879; 
 Wed, 09 Sep 2026 07:48:45 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-910464bf898sm125678886d6.7.2026.09.09.07.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 07:48:45 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v9 0/7] riscv: add initial sdext support
Date: Wed,  9 Sep 2026 11:48:33 -0300
Message-ID: <20260909144841.1766921-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX1UZ4ne1ofukL
 o29o5RgNghOMy+5laTD85Tf6OP4011zJrXQiX2KMROR6H4tdq4cVnlpMgXRUUGg60Wtnkn5S5es
 9XcUucOIFVRTlk6yEcfNnIhuiRJH2lg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX9jIpWmGbnfmb
 pWGOZz05CkPjGoYuSGwLWUe7KIXPh7QAo28FwKNeFMuO7bbMVVZ85nTK7yKUGmBCeVrJP/ahHxD
 Y4etENkTw7YfMpA6Jm99ESfF5A3hAjuz2ZBSQlinmH/BSIegBeE6p/JYnKB/NcLOwzfvi39cdCh
 yqUlx4h3DZZLQvYlTYImBBBJZRz1TFhEj4OuDXjgphAlxGng/GTmnKKD529i/hsdpnC00IhiI8m
 JZfC2/M6e+YgfJNSY6WncuF0XwyBYQ94syo+jzI+fLxtBGFNblXEw/WQLFPtR8fbxtzXnCpoboi
 w5Clgw5KPW5WUNC/Is9LBAGLx+Hmt1AnzGWUNu+7F84U7A/gigHbtMUa2Sak/U2DyNL6xNB1Efq
 5BuDH/7GACXH09RDdZNcAK2ZDHS8+wExCPcHz77QuqRuSy+42vd/G9xxq5J0B0gpEiPexjGCWmt
 tnoevsy2HxZhbJfqfQw==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa171d3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1X1KHL8RLlM2lqwBaMMA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ZARXlhTAPR7NZCz3JGXdSDD1Eu9-GCiN
X-Proofpoint-ORIG-GUID: ZARXlhTAPR7NZCz3JGXdSDD1Eu9-GCiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165
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

Hi there!

In this new version I changed patch 7 to use the new meson tcg tests
framework.

No other changes made.  Patches based on master.

Changes from v8:
- patch 7:
  - use the new meson infrastructure for test-sdext-sigill.S
- v8 link: https://lore.kernel.org/qemu-devel/20260907114615.1609913-1-daniel.barboza@oss.qualcomm.com/

Chao Liu (6):
  target/riscv: add sdext debug CSRs state
  target/riscv: add sdext Debug Mode helpers
  target/riscv: add dret instruction
  target/riscv: add sdext enter Debug Mode on ebreak
  target/riscv: add sdext single-step support
  target/riscv: add sdtrig trigger action=debug mode

Daniel Henrique Barboza (1):
  tests/tcg/riscv64: add sdext "not on Debug mode" sigill tests

 include/exec/translation-block.h              |   4 +-
 target/riscv/cpu.c                            |   7 +
 target/riscv/cpu.h                            |   9 ++
 target/riscv/cpu_bits.h                       |  33 +++++
 target/riscv/cpu_cfg_fields.h.inc             |   1 +
 target/riscv/helper.h                         |   3 +
 target/riscv/insn32.decode                    |   1 +
 target/riscv/machine.c                        |  20 +++
 target/riscv/tcg/cpu_helper.c                 |  91 +++++++++++++
 target/riscv/tcg/csr.c                        | 126 ++++++++++++++++++
 target/riscv/tcg/debug.c                      |  59 +++++++-
 .../tcg/insn_trans/trans_privileged.c.inc     |  24 ++++
 target/riscv/tcg/op_helper.c                  |  70 ++++++++++
 target/riscv/tcg/tcg-cpu.c                    |  19 +++
 target/riscv/tcg/translate.c                  |  15 ++-
 tests/tcg/riscv64/system/meson.build          |   8 ++
 tests/tcg/riscv64/test-sdext-sigill.S         |  83 ++++++++++++
 17 files changed, 567 insertions(+), 6 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-sdext-sigill.S

-- 
2.43.0


