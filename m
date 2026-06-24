Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586A6CDE000
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:11:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcB9d-0007fd-PI; Tue, 23 Jun 2026 20:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9L-0007WY-Lo
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9K-0003Db-2P
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:27 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NK0uE91177304
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A1ZLSHN4dBq9bPyOCHZ00O+eAxtNDiStcOtXHJAjF2M=; b=pGHAPBT/PIxg/3yh
 YAZn0cOCp2yPIpzS1YthJvfAc+E5ZWZZMscsgNFr23ARe46aUtyHVR9ctX5KVdUX
 HNtxYKi0nLmfHmUDmaeGYWOBmAmO9ML/jOQQ/5YhFs32DIsh5wd0qq0URRVnlkjU
 ZSoGKpnBjDMgVbrtEx9fU78mh94c3Bk/+4HxLL95bBoDan88LVYnVel6JxodOtQv
 lCU1bHN4WJjuxqfimZvPUQ8YYbxEeGtWdd7rZL5YOXrSsW6ONboOASdWj/2lMk33
 d4hAigKgK2qmZCzkUhtUeWAqmraKCX9B58hri6/XtuaUiL0+qzMJpSVlT3uM+K0u
 in/gUA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe6bd9c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8ddad6183f9so10558036d6.3
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259634; x=1782864434; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A1ZLSHN4dBq9bPyOCHZ00O+eAxtNDiStcOtXHJAjF2M=;
 b=hVH6eFdKA3HC68Bml9TpoEYfo9Ga4soux3QnCOzrM+bIjd/Qk54toIddSSkSWOeEYA
 1+xPpoPS5D/yQWCmRxCkh41ze2zVxMqxOOSY+50PF+1dKnbgrm5WMA4PZwt+vuNV18M9
 Qav6OB35SoIvbsI0BfbI3xdeoULKInvo9abgl/xp/qLkH/21fLXKP/JSrF6PATvQ0J8A
 Y+1/mrvXqbquAkGaMIE9NPYKGFN7RzHZyVJ3QmvYQg5PoN+RqWmB2yQLI4uFyZFFOgnz
 5jb2JaRqedpfzMmg7mbE7JzaaO6HYuH8CBct9+pNigmr6DygBVV+WgD+805TEInkamJz
 4D8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259634; x=1782864434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A1ZLSHN4dBq9bPyOCHZ00O+eAxtNDiStcOtXHJAjF2M=;
 b=YdkeAJXi74qC8so0dsoIXVSBzCu2C2mG6+gJzCBxaajT0dPHshQPyiH2YXbPowWGLd
 iIv6a52pNtW/9trZpRb+TJqMTTC8zQsuBNr5vfkDGj/W3HvEMpC+BlqOOMtH4xi7bX4j
 UDTx6A/bZIpRMV6+hl+5N169oKygm9igx+gTdykJ31/x0VdHXWafGBKCpLyIs8NOGBVD
 nyWlZ7FKziY8A8iSwasmxLMOvju5FOuY4GvGxPV9AP9tlFj65uJhWU8UyWexevli/6Vk
 F0/XsRoSZ+Q6CBbfn+l98j+USo7sCCFEKqBxPrthmFJNXZjOeD6f9TF5sS8uNXmIsJW1
 LILw==
X-Gm-Message-State: AOJu0YybpCW9qf2FunRyR99+50VXy7rfFYseYUpWIQEnxQwbRrPJchbj
 LHCuYy6uhzAe5kTOmW5Sy1+9EkTGoMmCsW63AMtsKmUzD1YzzW06s1A7jlJc0uUMswBiWwaoB9Y
 1qyk9m0HXUrArMDRBZvFRn9bAltw7BOlOhmXTlOTWa4FQfysZkyGnotk+RXUX9NzORw==
X-Gm-Gg: AfdE7ckHsh06CAma0AFuA8DgBkmfodj1Q+IFUWoog+UypjEqLax+b369I+qJU+EzqBi
 Zg9RQkR8wEsa59y4E+mnZv6Nz1jtaM8JFw31q8keAD0x3EpO9X4k2MfuMBdA22RfjiodAfiKZJL
 NtjC9N9S6JnRsNBR1ehRXB+YgHZwaR/0OiOEZcfyvpfq7F2odS3U1hmHyYzrIBbI/Wh8jBC8BZE
 O7zRr6TrVWmsA+PCcZk0QbeDfPMQXZa9nmEOjyNYIDE54JaGBDOSBhbolgHikVZw06fhNm8deCK
 /Nfp/nBuGZ6Kiu9ts7G9zB2tzY4GrocHDWHlA4yO99+6Y0c33+KconBAia2Qqpbdatp/KggWIM1
 nBaYwxl4HcU1C9NWTrgVjOqlc98cTqLy2T2Zkb6IXYrPo3Q==
X-Received: by 2002:a05:6214:e8e:b0:8cc:d066:54d with SMTP id
 6a1803df08f44-8e52f9bc79bmr25462686d6.24.1782259634045; 
 Tue, 23 Jun 2026 17:07:14 -0700 (PDT)
X-Received: by 2002:a05:6214:e8e:b0:8cc:d066:54d with SMTP id
 6a1803df08f44-8e52f9bc79bmr25461606d6.24.1782259633401; 
 Tue, 23 Jun 2026 17:07:13 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:07:12 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 11/24] target/riscv: move riscv_cpu_set_nmi() to tcg-cpu.c
Date: Tue, 23 Jun 2026 21:06:18 -0300
Message-ID: <20260624000632.2149359-12-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ktGfVT6MvRuYFbpZe4OnoEIKTQzguXjc
X-Proofpoint-ORIG-GUID: ktGfVT6MvRuYFbpZe4OnoEIKTQzguXjc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX/Fwc7aWfjfwU
 gH7e6Z8dDShibNUFhntZh+DGgp/qMdGai01uYu9FpezQeJjZhHb5Kw7/A21QWSnxV0I0Vb4aona
 20Z1kdUmj+prgu8fobY4ZFLsp6ilF6s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX9S0M9v4a90JO
 6hPvgTtdph4O5LYMOzkz+woXbj26BkSTKOEPzsCf79T3UUQ38q5BwmOnKxY/908v24vaH/uFlki
 QMQxdi/HhVuOdcgEi/wrUdTJQkc9d0TkeoiF3hpVPCQ49zTrlLo73FBN/hhfUu1EL9TpkYv3mHJ
 /Zb5w+D7CqC6FQqBmwkfE7xmlyuNLFKFU66YZwJuKWB0tA/onznnO3ETzPamOrkOZXvHtToXvtl
 SqJAGeUNPwfwh6WTN9vQlEBiQ5M3q26tCGWjS5OF8ASRa2UM2kxOOmHsUJccs2jRKFG7pptLE6/
 l8A2iECkoWPstZ7crkbzOfEmZ07fUNn2uFpQ1GLoK4Nq8nJcS1dQPbU/Lefv2X7Nkcc9JYvOm5o
 KtrQmbzzU0R1fbI+rQUAG7z1MMs5o4cjbNTKOGBBC04cEJq2+S/zh/JC35/7Me4zkycq65j8k3Y
 26GSMFeoWf2+EhAyZlQ==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3b1fb2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9Y5uhDEGy_uPjlLRjCEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
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

This function is related to Smrnmi and non-masked interrupts, firing up
interrupts via env->rnmip from riscv_cpu_local_irq_pending().

This is all TCG only code.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.c         | 8 --------
 target/riscv/tcg/tcg-cpu.c | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5e951ea19c..cba7d2502e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1160,11 +1160,6 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
         g_assert_not_reached();
     }
 }
-
-static void riscv_cpu_set_nmi(void *opaque, int irq, int level)
-{
-    riscv_cpu_set_rnmi(RISCV_CPU(opaque), irq, level);
-}
 #endif /* CONFIG_USER_ONLY */
 
 static bool riscv_cpu_is_dynamic(Object *cpu_obj)
@@ -1183,9 +1178,6 @@ static void riscv_cpu_init(Object *obj)
 #ifndef CONFIG_USER_ONLY
     qdev_init_gpio_in(DEVICE(obj), riscv_cpu_set_irq,
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
-    qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
-                            "riscv.cpu.rnmi", RNMI_MAX);
-
     if (mcc->def->num_triggers) {
         env->num_triggers = mcc->def->num_triggers;
     }
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index fef66557c2..4af5cd9c73 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1662,6 +1662,11 @@ static void riscv_register_custom_csrs(RISCVCPU *cpu, const RISCVCSR *csr_list)
         }
     }
 }
+
+static inline void riscv_cpu_set_nmi(void *opaque, int irq, int level)
+{
+    riscv_cpu_set_rnmi(RISCV_CPU(opaque), irq, level);
+}
 #endif
 
 static void riscv_tcg_cpu_instance_init(CPUState *cs)
@@ -1674,6 +1679,8 @@ static void riscv_tcg_cpu_instance_init(CPUState *cs)
     if (mcc->def->custom_csrs) {
         riscv_register_custom_csrs(cpu, mcc->def->custom_csrs);
     }
+    qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
+                            "riscv.cpu.rnmi", RNMI_MAX);
 #endif
 
     misa_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
-- 
2.43.0


