Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F01C43602
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:10:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiII-0002FB-7M; Fri, 03 Jul 2026 14:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHk-0001cK-84
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHd-0002Gj-3K
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:43 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663HiUBj545604
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gmpzB82DGE/aV8td0WaB+C5BqZ48rvErCbJFfP3xpEU=; b=jq2kjoYyCXT/nlw1
 HXf46B8lgT9I1eLuchr8JYRAV6+liqy8O3C3wHxw5ehnlHxBUpSjVQWNeI/P/p/i
 CmS6S9p0yQqMktRaLsRiQvs5PG4dYKdA+0PBkDg426mZwxlknE2kpduXZJhPFm/O
 yyFsdG1ki0FwFkGF3+XrWFBdgj7Nb+Oea5grbn1olo+y1unBnd4JmTP33XpKY9wU
 2IVNysPxQHQENsMkiiPMbRQsXWBRYInJvLm8Hvutlt2SWyiCGemoUtNICjRqQQup
 Cp45KIj+9ZbaqQ6l4zpls844kwTVCtp5hDHGIGGF1JyeKl1+fJ2BJcV+ZoFFOHJB
 MGOHYQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btee8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8dae6572676so5984126d6.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783101984; x=1783706784; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gmpzB82DGE/aV8td0WaB+C5BqZ48rvErCbJFfP3xpEU=;
 b=SG3FyDKPEr8kjyiVltEBljsmjAmfUJ3PwjdbirhpJrsDxMODDUwlsCwxObnB3eu/dj
 uT933U7455+J7obSE7a9CRynJzP8DY9UM1F5K/4qhXVdBqon3mhZCNvUaJ1xOldMIzD8
 Y/BxiU2W87d5Zliqmq5pgx4ig87lUuOvKLQrwr5xTzSK5y3IYWJAQj+zKCXjjhE3jfsq
 q0h9sesU1rFJIGCh86Qc93TLQhhhUnV0k3rsFAO1mQPyvtnAv2gySdPamR7Rbds2rMT9
 r767dYonoxANspApDr3XAHs/bbvHurE9UJNtHa/645ajnyYEJrG4kUoemh98Ab4YPWn8
 tjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783101984; x=1783706784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gmpzB82DGE/aV8td0WaB+C5BqZ48rvErCbJFfP3xpEU=;
 b=rzEloofpdEBmSJyusDiJR3qUQG5I8XajlVY6KZfoFqjxlVh4gcWK4Ipnu3voCZgp9t
 YifQVNMreqIqy7fEr/L+IsygTq0A43SLUGxThWF23UNtDaEXSRZKdZYkSgBeFBwQLZ0C
 K6njV9aso4LfwgFR4xns4eWrywFtY7ziCq3WROMNtoz79mgawgrptnwwdkjem2KUv260
 sWp7lN+Crbr9RS8VLcg8E+Ese9zwM46+T3tiQJGVeEtqxh6Qyaq+PA2csla+FajoYPhU
 K43b+RqAPqDyhSFWKD87FUHsAHyEuxgb30lDNCDCB71GtNp6Pygh3Uod7In5RWMBR02y
 HSvw==
X-Gm-Message-State: AOJu0Yx/Mo/roDhLTCTry8NjA/SI0F5OMuUkV8Cf7N7mGgO3TwrB6ohF
 PoGaPkfvNnYshYADnAZsZX+75K67RsT+VxDj40JdiJXbh9PL4uuh46mTd5eYZq2r4kl4+vnYRba
 5l5NARLONC91qp+8I03cLPAT9PHlknKjF1MHzDzKyjWVU+SnW6n82iU6xHA==
X-Gm-Gg: AfdE7clxWqiJZlaurJ9OtRUaWQXf3iiRrjQhRGEd9qcHzvqvFuseT0A/CKx54gNvFhK
 OX00sOmsXk/ZHYTa22VNzv8qyywb4K4DOyMLVA5F11TbQR50EN3RmrQCMy5MeGvn5m/f+UdoxJR
 zZQYdm6irLOL5FIT1WWFBu0iw6pRfcy/vdSX7sq9QU1SiRlG5IxJFBjWzwUlVXO+vfgeCU0ghMb
 247rVQ1ZQRXCKReYL0sePbYsUFEII8T8JL5KaPWkj46ROAl+JeBvfyVbS+CZQzn6Pb9KUlSzZO9
 DtcGMboCwtpCvPQFhmn5Svpl62upN+LFWE3eVaA1OnfBUNNZJlMDIwCkpqUlgFeGRSwT8/a6b3o
 YwEMDU+xpAehoKb4Do5olducRmo5cwBxVKrTBrqfYMGqOHg==
X-Received: by 2002:ac8:7c42:0:b0:516:ea30:8756 with SMTP id
 d75a77b69052e-51c4c2c3d9dmr8489801cf.36.1783101984105; 
 Fri, 03 Jul 2026 11:06:24 -0700 (PDT)
X-Received: by 2002:ac8:7c42:0:b0:516:ea30:8756 with SMTP id
 d75a77b69052e-51c4c2c3d9dmr8489191cf.36.1783101983629; 
 Fri, 03 Jul 2026 11:06:23 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:22 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 14/24] target/riscv: move riscv_cpu_claim_interrupts to
 cpu.c
Date: Fri,  3 Jul 2026 15:05:26 -0300
Message-ID: <20260703180538.3346781-15-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX81/vOqEF6l7s
 tY8ZaJ0zwonhtlOReEOwxbUgIjbUAJEmRrorUQNFqKFfx1NYquHfgJ0GQ9uIWOnh4X2bQw8NJn+
 X7OaLYalwKUeLpkpP7+grPiD4Qum2qlrF2EQoPCU5B+rwqAI/hX1LpjOTjWAs9OEfct5Z/bObGy
 qflYS9SQhvYDv+LGKsiyTO6Cn1zBWrBTuFyIjq6llVA9CplxGVkOKet/XfG9HA4ktDeL+4LJWop
 8csuyLM3GaHz4aojg3Df4nAdcb3O0U3C/WwF0cvpqwi/Wa6SkZ5EFpAHW/KBxddwmWiv/xxIuKo
 7KWQyGDUr02/MWrPCZbnwmMIz7uG4Vv2ZavfXDwiRxHuZVlf4Rm+/Qj35+kPacHcwZeR6LOhNkv
 kcMP/kfEWfCul5A4kEP1MQlMfAswRtEjGtSKklxuH+zpovcGizzwi6Wz1dyIXNRa70vGEol7klz
 1iLXR+E2By/nVXzulJw==
X-Proofpoint-ORIG-GUID: h8aH1Dh9t3DNEAYQCwKzI_2ituHx1fXs
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47fa21 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=P7v9EdgfUgEVytVI3b0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfXxkO9Nb5VGZou
 8/xC228eVwtnpQtH2a7JegdpVRi8rearRS8iOuSejEEnzsfpLIiy8n6yYKf53lDH9vipVrlCArX
 sijxf7DgwZOG06AGxjETXXuE8TmiNng=
X-Proofpoint-GUID: h8aH1Dh9t3DNEAYQCwKzI_2ituHx1fXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030181
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The function is used by hw/intc/ files that KVM cares about like
riscv_aplic.c.  Move it to cpu.c to be accessible for --disable-tcg
builds.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c            | 14 ++++++++++++++
 target/riscv/tcg/cpu_helper.c | 11 -----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fe24751379..2741047769 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -573,6 +573,20 @@ target_ulong riscv_new_csr_seed(target_ulong new_value,
     return rval;
 }
 
+#ifndef CONFIG_USER_ONLY
+/* Used by lots of folks in hw/intc */
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
+{
+    CPURISCVState *env = &cpu->env;
+    if (env->miclaim & interrupts) {
+        return -1;
+    } else {
+        env->miclaim |= interrupts;
+        return 0;
+    }
+}
+#endif
+
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 250bb20481..aded995a7f 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -572,17 +572,6 @@ void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
     }
 }
 
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
-{
-    CPURISCVState *env = &cpu->env;
-    if (env->miclaim & interrupts) {
-        return -1;
-    } else {
-        env->miclaim |= interrupts;
-        return 0;
-    }
-}
-
 void riscv_cpu_interrupt(CPURISCVState *env)
 {
     uint64_t gein, vsgein = 0, vstip = 0, irqf = 0;
-- 
2.43.0


