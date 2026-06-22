Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE50CDB466
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:35:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkNR-0000T8-8X; Mon, 22 Jun 2026 15:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNP-0000Ry-2u
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNN-0001oV-J8
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:10 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFX1F41370013
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=N33YsxfUbNn
 Q1BMGZTsmV+t73YG+r/2wROA5bZF0Fpc=; b=hEhAB2wE+U7J9h+5Jl3jHCZQGcQ
 T7LBRDAFIQMUoNThjabN5+kY/QjAn/8wvaQCEunU/J5mXvYggSycvdz0tPSEbi3H
 yOF/86oOufzM/57bj8fkMqhICxyrCdiMwZp3sZMCylo06tLIqXSKsecGI9CPCH6n
 YZWbdC3iNyrVhvqSI9gz/XgYfIbztUloZtVuCK/Fp3A5bpoOCDgBaqI3LGK6tuV0
 L8ds5QrGbWHXpf9a9jjytxVPe+b6HTtNvJwtNbaFKgabmE0dMiUWSmxuLyz6un1r
 6Tjb/BXc3oHXZq86tV6PwVQsFlesNI38Z0DIrbbPqhZN8/tSAUJI0VLGXsg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1u2a5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8e04976c35eso46246086d6.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156728; x=1782761528; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N33YsxfUbNnQ1BMGZTsmV+t73YG+r/2wROA5bZF0Fpc=;
 b=YTbGMFdlScBxVlzAkWchGYdgSkzXNBo8VtgvM7qbgHqVsxOkADg6SZMHrX3YJgO521
 b5tAzhIaHkvffGIHcbF/Slo7/IS07i7Q4QBNkTNHBJmVWFNUwlJBjD88L6yqRiNQKSg7
 fQCM20DjyPQ9C5AzxbUppRtdPZVB66yPPT/iO29Ssyd5hy+7an8X1tzL6RNBTqQcKkoH
 srGUm2Fedf1lLinA4SnsfZVY836GOHnnB6qyQRtIZ4D3U7epox28ZFMPw2zOP1zTpL8x
 B6KKzL1m0N6h5NifR0QyfPguTsIWf7N6cqyw0svf8OcWshEImOxWzQGWCCF0VI8E8mmN
 uNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156728; x=1782761528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N33YsxfUbNnQ1BMGZTsmV+t73YG+r/2wROA5bZF0Fpc=;
 b=k9rKOjnnClXA/4ORyWATFH09ZiJtrXn05w8xxvOCW6xqf1M5MCrAlLG+JI/pMpXQh6
 pYHSDfrFtQFeUzBPBMk21Oh6rndz9pTQoJvECsV4zXc9qObLkjPACJgLRPsHkdbEhncc
 pYbgT1gXGHtH3D0L8COpTCzz0NglY5YfDdbmuAt7bNf6yB+pz5lllfSiPlsPogy7+2/7
 r+Hj0VxTq2ap2jwkdg21fCWmIVLyRboI70UL3gPXmrgg8G2XoqAFqCHrrBdKO5wV88kK
 iphA9lIz/m4T3FzTDVJA6HDFcIvnHD7TJ8PUQAZ4g240gIc5ZZXZtruNR3azA7TgRzbr
 jl3w==
X-Gm-Message-State: AOJu0Ywlww1WD+1PKVjH26mOcl4W9a++hx0b5RfTJSviyN0sYrsEMxPg
 HbHawy5VlEdRWSSEYXgjKwCwb5SdHrOvocB04rOr4eWERaGIIfH4C/t80ZRDUSnObBPnVkuKIQE
 G2wm1Ri08JUSb2Nhep0r58GO9HbN4U61KrQleIjIl6qM/v1swCcmI7uqttQ==
X-Gm-Gg: AfdE7clkroun9Hl5BpYcF7j+eKSv3VdT5SlbNFTAtgC70CNAB35HoVN9ufixpGPaeFM
 94Y0TNrPPHuhesk63ZVSdUSklR+QXdnOPz/EByR85FakB9r0w+fIlDTJ51P3szKVAU/DUcUnteQ
 X4G5bIoU5T+6kd9A1zXzuD33AXjT1/X7BZ2WLxrLt9fm3bn8Bdol8+ORtk+JS2x3TbjESWYFv0O
 1Qh5QQpJukFOGyTvJ/QXH7Xa+CscNh5eD5v7bi5N+7BwfeH6dcsrCodU5tXRHstSTS+9TQJ7erN
 gZhLnQlomfdX5NjkMmGAcDc9+VYTRhqEBJc5XjJeXDz105WBKOZPLUboy+BmEGNx7/XOi8bkZdF
 ygoib5iCSDmpgRyE1ANw3iNf+c5if2JfyyrWhhm2UOgc74g==
X-Received: by 2002:a05:620a:4445:b0:915:77d0:2ceb with SMTP id
 af79cd13be357-921cd9036e6mr1755077385a.0.1782156727758; 
 Mon, 22 Jun 2026 12:32:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4445:b0:915:77d0:2ceb with SMTP id
 af79cd13be357-921cd9036e6mr1755072385a.0.1782156727222; 
 Mon, 22 Jun 2026 12:32:07 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:06 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 05/24] target/riscv: make some riscv_sysemu_ops TCG only
Date: Mon, 22 Jun 2026 16:31:21 -0300
Message-ID: <20260622193141.1449724-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IUMuH59FWwVx9m3gG6BCkI8iI6H1twrw
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a398db8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fajYm1E7_uVK9srsrG8A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfXzG7KCOjCr0qx
 htUHOse54pIUHiHTWXJWmnr2tJuzRJfbEKr5+W21UHsv5kpnKrU6RudRUYz6Nvrhst+UdZ5olbb
 QNr+/Wx0sSu/EVgyO8ljuqaNVlgFH6s=
X-Proofpoint-ORIG-GUID: IUMuH59FWwVx9m3gG6BCkI8iI6H1twrw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX6wVBPNOQDMJv
 Dm6Ls1P1kC2QMkBP2IU43i5DVg0kteoiRDMtWxnQdhZSVUNpdl+3xcLG9GbXr26C0d0jdQ8SKPv
 2NE3cicB10SVf5/LR5i5FnRQHq7siULyRfMTHsBPdCNLsWmYUEjgScsnwgv7FjBLBIMsdskVs2G
 L5ZLnHe1LiMcON4Lte956HG0w34FC3kfLSlBEmVZ9OYPBrvrVwKqPJ2NrdERLuM9XXQ0ZsEGpvd
 iC0xRCWozjLNq8h039jde6LvZawQhqdjFgkB1b6cGimetcBNTVdVPn4apx/9t0zGsaq/ex+ZBrc
 tGCrOuubL0fkYCaLU5J5+wT7LHtP3SHbzF6v8MAw7d8ArbNPySfm4qfJ1eGasyAvV7pOfttoOds
 x67SGpSVxSd20pgE08D4fMrQDQZp4B2hloWb06eEbiUX9nH3Ro4wpj4nk3tbC62pJJ9+a/rsaFK
 wqnAjymI7hkM6zqKHCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220189
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

monitor_get_register and phys_add_debug are TCG only.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c     | 6 ++++--
 target/riscv/monitor.c | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4e96bbeb60..0a7e6f6ed0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2669,11 +2669,13 @@ static int64_t riscv_get_arch_id(CPUState *cs)
 
 static const struct SysemuCPUOps riscv_sysemu_ops = {
     .has_work = riscv_cpu_has_work,
-    .get_phys_addr_debug = riscv_cpu_get_phys_addr_debug,
     .write_elf64_note = riscv_cpu_write_elf64_note,
     .write_elf32_note = riscv_cpu_write_elf32_note,
-    .monitor_get_register = riscv_monitor_get_register_legacy,
     .legacy_vmsd = &vmstate_riscv_cpu,
+#ifdef CONFIG_TCG
+    .get_phys_addr_debug = riscv_cpu_get_phys_addr_debug,
+    .monitor_get_register = riscv_monitor_get_register_legacy,
+#endif
 };
 #endif
 
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 3e89dcaf7c..7aacd1d89c 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -245,6 +245,7 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
     mem_info_svxx(mon, env);
 }
 
+#ifdef CONFIG_TCG
 static bool reg_is_ulong_integer(CPURISCVState *env, const char *name,
                                  target_ulong *val, bool is_gprh)
 {
@@ -379,3 +380,4 @@ int riscv_monitor_get_register_legacy(CPUState *cs, const char *name,
 
     return -EINVAL;
 }
+#endif
-- 
2.43.0


