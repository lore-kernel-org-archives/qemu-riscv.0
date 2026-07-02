Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0733C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:55:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHqO-0003AO-0A; Thu, 02 Jul 2026 09:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHqH-0002vr-Nq
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHqF-0008Fg-Jg
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:36 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662DcWlu564702
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=nY1z6Bbeb6j
 aM44Jexap81Fs++lqMCjWMArhNgDWzas=; b=YtziHT6x/D+5XaNcJI/w9dhb88d
 nQS7yVjViTL64xjLIsBB3JJZAvrpu9/JTYbbmlta5meTgdHqQZLgdYn8qRqEL26a
 zSUckVwW4jBWWb5IRj+gEDf1izvSoTg1Z44Ifc3MNVXzJYKBtQTDokZOEy7FWUYm
 1Sc5xuxv0NSd1t08a9AwK/l0eOKFc8tmctB3lkodwAuh+jJaHi+IHGEoaCnUXdbR
 icvkPGn5w1b7eOZO8Yymk8cunZV8YzlLHyRpHWqY0ODG8V8Hkk6v8eRSAiYMpo+3
 szDC2GMLV0tdM8im/vmaPe7uH43/7osIMt5tNVLoKxiNyC+5g9nPqe0qvbQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2501wu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:52:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-73760a7cd83so1871052137.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000344; x=1783605144; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nY1z6Bbeb6jaM44Jexap81Fs++lqMCjWMArhNgDWzas=;
 b=RyJ+ZIsa8PzkhcIgGT8bWAL7uBnB3wztmTzga8VwvjXktcpFZF5NQRTc33wDsAIDn1
 3WBVbyS8HPUvJGnmH7IIeKs3MPyG1QxJsvtlMZRhXgNgKdxK9CCuORUeGc3ugj91cXkR
 /PG6fob6KrJH7lxNm3/3NycKgcfusxMERU0OGXxHx9QPk/VeVO6yrZbv5C2Pliki2xjT
 HJ5SmSv6nkjMV/RI0MQ0uqkUNE5Ed2H0PY5eem4rC2BFVTnK6+mo5V7250BCxZBmVEpq
 X+gskeSTb6cnFI3iRcXKB1uYHN8iHLaMvgAM3pkXm+8XaImXa+1cHVDo4QITo/kaejGe
 VKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000344; x=1783605144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nY1z6Bbeb6jaM44Jexap81Fs++lqMCjWMArhNgDWzas=;
 b=PNlwscpYniVENO9LU20nOkIOWREuhffhURkMVpYST706sWjkgUl8sSd5TJZfUMw7cF
 EBwrgNt2M9hbNpDVG/VkUvjRhxZJ6QQnMJfIFUTRA7q4iMF57Z0tXdfnOUkR2ByLmRAu
 QdD/AbDxK7phPJpTUCqZofHVJEObIP6ZQ1b3nO7GKdMUGqrgrjHjqXfJbyQElR0pwtpL
 EcSYasNLEnMMmvtSZeEOUo0f4YlA1+GyiAnbTPAcXgtKjLXM40TjUCtNzuZfIOteW8en
 TUw9wWW2Yh2pkSjLkKgpH655b3Ip52ygVJc6ymJcW0nw8BiDV928l8oTnwdNV9jpPNZh
 8Kug==
X-Gm-Message-State: AOJu0Yyb+17h6ls0e0E9OAlcBFbR5hTBsWvz7Itml2Hqxn4QsJeBRt8R
 KXFQhyh3TeSDgXF2Lbs+FMXs7NRezzgqdltES+3sVUrk+WTSIMhHfapjGgBiZsQ663EIukSZMuh
 Ja06OyJVRwxuMBhX6/eoCMZaH8OqpfE8elWhv56CgPWjBhvpUSiusL8MWkw==
X-Gm-Gg: AfdE7ckyL68ph9Vc0EZN4AHvV6Yohzri6QgENyAlCWe2n1BY88O48/k7THiFKBq8yCC
 WnmOvfjkhV4/8Sur2+b4GH8Av1c2R8uiF0wOrk2YqIeqy0AtEDlU9znFFhlJpRuL8r9Xu5nL3Fy
 S5kpPJXL1CCir49lXqCHGZeEre76IshPz6Zz0+Hf2EiyC4GWuuN4irN3SRCq/yx1806ja6+tvf/
 IW2sxQ5Hvxai85JSp374oPiw4xPH1uHfIbb6SbLvYXF9ouqIy3t8FXeDOb8zFhReggp8EJtETlH
 iuh4e75MS48TLAEg3QDwMNj7BioAeDcwo5I+lZnX068VAIl8zafhHGGemRJfihXlA5CXjaC+/Nb
 tH/8sLqkywLQCT9qhTgFEzZKs7x+hfMZqm2lweEWr6BRDEg==
X-Received: by 2002:a05:6102:41a0:b0:737:80f0:7885 with SMTP id
 ada2fe7eead31-73daa34b043mr2772682137.28.1783000343882; 
 Thu, 02 Jul 2026 06:52:23 -0700 (PDT)
X-Received: by 2002:a05:6102:41a0:b0:737:80f0:7885 with SMTP id
 ada2fe7eead31-73daa34b043mr2772639137.28.1783000342894; 
 Thu, 02 Jul 2026 06:52:22 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:52:22 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 19/24] target/riscv/gdbstub.c: isolate TCG only checks
Date: Thu,  2 Jul 2026 10:51:21 -0300
Message-ID: <20260702135128.1188021-20-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a466d18 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=m8F5ZJ-s4jyFCOPQnU8A:9 a=gYDTvv6II1OnSo0itH1n:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: KVRikFDYMmgynyt5O4cUtCGlZbc-PoR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX3VC529WD6XZZ
 2Qilv4ox9vqlzCvNBTZbQfT/tFYp7C0PMnUk22U6yDhcC8yGD9jqy12XMg2nVxPvFndMXWj7kGy
 HWV7iL51FLkreMUR/UOSi6LeWxtMb5bQzDtuwyFpyktn8T9iUdxWz8dQ4ovbzzI9taf4Y546KyY
 iOAV7O20Xrj+OQX5fnhXTg6a1GxG5NhNZd6TD1kBC1g7bzHNiNSnDNhlUik0+69FAQPugyoTrG3
 RD24V5NIDzxRlVBrylRs5GLkXwl1vn0JQpT+OZyPIwkRU1egHVwB0FliVYdFusz987IB3CyGpcH
 Z8lU4yINdqFSpaSGUyVPAXtbUsI/uq7d2fZOBTAKUBRJfpNmGGzDxeWHTJCH+jYWT6vJIUm7MhM
 KNtgZH4iD54IV6W8KTOlkzyP2iQ42RMRx5l8d2UumD2Wf6L/joxSuTdh4af1c5EdcnB1tnVfkQW
 bCfHOJ2Ycw0rzPGdrvA==
X-Proofpoint-GUID: KVRikFDYMmgynyt5O4cUtCGlZbc-PoR-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfXzQnWe/KRtBak
 oGAUia8BgmOp5PM3xodUNxSBx+n35MYm4lW8Mkhz/hMhm7cCH6QbABjplzA18YkcBOmpc+9ZfnB
 /NTjOrZj1f0CoRuMJb+b916Lv6yVkS8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020144
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The following functions are TCG only and are broken, if they were ever
usable in the first place, with KVM:

- riscv_gdb_(get|se)t_csr
- riscv_gdb_(get|set)_virtual
- riscv_gen_dynamic_csr_feature

Gate everything with TCG enabled to at least get them out of the way to
enable --disable-tcg.

As a note for the future: other archs have distincts gdbstub files for
each accelerator.  There's a strong case for RISC-V to do the same.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/gdbstub.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index f0a5e0d86f..9abbf5bcdf 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -164,6 +164,7 @@ static int riscv_gdb_set_vector(CPUState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
+#ifdef CONFIG_TCG
 static int riscv_gdb_get_csr(CPUState *cs, GByteArray *buf, int n)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -294,6 +295,7 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
 
     return &cpu->dyn_csr_feature;
 }
+#endif /* CONFIG_TCG */
 
 static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
 {
@@ -336,7 +338,6 @@ static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
-    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     if (env->misa_ext & RVD) {
@@ -351,6 +352,10 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  riscv_gdb_set_vector,
                                  ricsv_gen_dynamic_vector_feature(cs, cs->gdb_num_regs));
     }
+
+#ifdef CONFIG_TCG
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
+
     switch (mcc->def->misa_mxl_max) {
     case MXL_RV32:
         gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
@@ -371,4 +376,5 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
         gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
                                  riscv_gen_dynamic_csr_feature(cs, cs->gdb_num_regs));
     }
+#endif
 }
-- 
2.43.0


