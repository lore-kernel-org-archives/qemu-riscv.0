Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B420ACD4F26
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:11:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcB9j-0007wG-QL; Tue, 23 Jun 2026 20:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9U-0007ZR-OK
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9T-0003IX-7A
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:36 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NK0wFH1177644
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 trZN2ypWOA+WyJb3G4pISP3mPY2cH6T3didQHTIz/bA=; b=cr5RnGF0HNKo0RMa
 dw8AFlsyQu73Suuo4GIbJQOJ8N3HifzEren0TMtX38cCMLRfZBrlCXXVmxvIW4rJ
 1EndXU1Hq9mwBkT3NmSb4XvRuZ3GIPP9l5WVxNQ5H9hK7derqg9m7DRZnfP2xSXQ
 yJ62ivWoLpFD5n1nA7nfpX8ioEwDczbNmtt3JEaAl+Kc22AOzJ3fSNscjU/7kc41
 U/r/KiN7zKQNtkbJNMUBCTKHjzvDYhjQ94vsP70TLYERHbDiD1LM3CiKG8ErXPbg
 Fp5h+bd0lZdV4rb+CkNb9Now7KQZclPTQisJ35LCfgfltbYso0AsPoNmnZw1i0Z9
 kV/obw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe6bd9y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8db3d8c8c0bso12659156d6.2
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259644; x=1782864444; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=trZN2ypWOA+WyJb3G4pISP3mPY2cH6T3didQHTIz/bA=;
 b=MwmbZjmi/KJP87UFpNZw/2UL6Q9Er0JeCcOfCHnscSdkn+4z7Z+m6NSjyvCKfUUGO3
 jBEGGKOo5sLii4+uislMxGZOGcUZJrTadrCw7Le6CNVabCdiFiO82bpIOZ2Kj1jN2Jx1
 ndhfpMkSW2ozJd+nCjhi7ibbsyvOMShZw4oCmjLgNHM1LsTxFwue6s9m6oJTCN1/a9Nj
 +TALX8BusJ3/R4r9PZd/yMY17NCxVNyvVBGo0cPxd7XWi1tBGbxzeq6KlgV5NQATS5i5
 IgbA4Ct94ETXN3CXSlMJwczP3T2907jEDe9z/VBkw3tLaTeUaC4oMPNRJmNBr54P/5ag
 x6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259644; x=1782864444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=trZN2ypWOA+WyJb3G4pISP3mPY2cH6T3didQHTIz/bA=;
 b=cy3s5ZJDZxEwzvy1eHtdnevt764q7GN8PqWPd2LDsSj8xilUrJYvWjTrvnGoxdla7n
 pckjvKjVaqEhNq/IRftR9QgpNOm+DgGUiTOd+ZYLasuUZT00ryYYY6iT3q9NMN/umV2N
 sMfqBGFYgPQ82a+bfYsyy3e7kwBEvYgVUkYK1tbJ0CJV/gbhDfNUHcurh+FWr687/19A
 rZNUoVmilWlVL6iEyBYWYzvaCqN1G9PRMcs3yXS/ObSPqHUwELr+ORTjLFc05lrRTYzg
 KDZ4zErfLx4YJ7Wqwx95nL3YbSx0BJummPpRQftaOHwi7oeihuLI5BCOUJpxqJhw3B1k
 1VwQ==
X-Gm-Message-State: AOJu0Yw/4oU9UQbSF0NEL18dtPBprY60j0fUsHc6cbGCHWLu37a4OAu1
 AkoAxbQ7kFR6zN03zmJs7i40SHb4fWUC4sQQD4i0tUBolB+2Zm9BDAknp7Bt80wjgvxeOYYBlo/
 UW/aPY5Rc8kHC1vsJ4GnjXkq+dIqi0tTRrHh97TLden0CUFAX3j/qUCtpdg==
X-Gm-Gg: AfdE7cmfU/CyfVUb04vZZUZMzHc8ZatMuLRv3gwLZgA9OrPzunk65LjXCMax4h26Ebw
 tNKXK7fdx+LvkRRUux16V3fXIPUYV7oSwGh8eGQDIm/jrQjmUtIOv/fr9OsrjQN0dSB0zhGQPyX
 M2EHMvPnyv5239OiQpyz/AIWsT8CansfpmUGBkRuBNZB1y2/ww4x++a+F263BVrP8r9weqUEC9H
 yTzPEdJbxsZqtXjQ05JMFrDHl1PNB21R8SNOt72QFu7O70j3DBM4mBpz46TfWC9Btd8LvqKAVgi
 3XJqzLhEp2LrYX+V/IqHzwFEDNtad7MOhbQy8DwQdZH2YYEX+sq1Vem7Ehi2MhbFBaGH6wM3hMl
 nhLSbdxkf5HfGP20v47xf7GQeMSwjAHz0IKSHLnOlFzAN1w==
X-Received: by 2002:a05:6214:55c8:b0:8c9:c38a:20e1 with SMTP id
 6a1803df08f44-8e52df964b4mr21214486d6.10.1782259643574; 
 Tue, 23 Jun 2026 17:07:23 -0700 (PDT)
X-Received: by 2002:a05:6214:55c8:b0:8c9:c38a:20e1 with SMTP id
 6a1803df08f44-8e52df964b4mr21213776d6.10.1782259642964; 
 Tue, 23 Jun 2026 17:07:22 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:07:21 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 14/24] target/riscv: move riscv_cpu_claim_interrupts to
 cpu.c
Date: Tue, 23 Jun 2026 21:06:21 -0300
Message-ID: <20260624000632.2149359-15-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ftrmnZBAblnqP2DxRdWmAOl6MHsXZLgP
X-Proofpoint-ORIG-GUID: ftrmnZBAblnqP2DxRdWmAOl6MHsXZLgP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfXzeDtc/fgj4TM
 sDFQJqeriPlAxvowosPB1JbANFl7wbKaL2Axgo8Ta1VqMRXldIhM4IZfAOn+znxRYFZFbiJGojs
 KZ8H1pfMu+gEilKiElJv3eIr4LE4HfQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX9t7o31JX9cb6
 VPVawOC0XI1yJD512+f+ArXPoncA1XSVPw906llqKzLy3moI96t/uCQYWhExWy39StaVXQgJM86
 ezWdXDHyrOu4LAm9LVr//A8AJxkiX73f12B44FPqarM30Bkwbs5V1TZwgR/svSM98lRO84orlYy
 Y0nok5H7SQcmYDRJsEaGH76CjEWNkePe9GZi+Lq9iv2PjQh3xXTg32d1bfX8oW93P1bjaU0FQuh
 capLegSFb4QFEAnEEDGcV3Dea2f3236NxweGH9LRyGXwku29+Q1Cdj+LKaa27g74RFSQaqdnEFf
 4nlrbStFRe+3qQsH2e/ByVn0Wabzjf/BP41lhDIxoP+11r6MreXV2C7tXiA28/ttTh0U15t4Pfh
 YYaWNnjnJef49tcXm9kkbW9U5DZ0y3Gmirg7tiis0QDi0siGs5ez8pUz0LPJJS/2RWJGTYC/Lyq
 q66g2RQvdM7sAYq9Juw==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3b1fbc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=P7v9EdgfUgEVytVI3b0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230199
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

The function is used by hw/intc/ files that KVM cares about like
riscv_aplic.c.  Move it to cpu.c to be accessible for --disable-tcg
builds.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.c            | 14 ++++++++++++++
 target/riscv/tcg/cpu_helper.c | 11 -----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 483ac2e0d0..4fc0ee2823 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -566,6 +566,20 @@ target_ulong riscv_new_csr_seed(target_ulong new_value,
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
index b38f639dae..9237d2129b 100644
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


