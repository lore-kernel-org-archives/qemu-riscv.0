Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E10C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:08:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiIA-0001wv-F8; Fri, 03 Jul 2026 14:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHh-0001bN-Dr
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHZ-0002Cb-7Y
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:36 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663Hj3Uc686440
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Kng9bpxyRwdgZbGNRYVhTygs7OAGZbgpVlMBL4NTKG4=; b=LnvBW0R3RfXnz+ln
 rhfxSPJ4kBv2UMoOHiHwoTEwEhgpyoSLXd4fK84qTHgw1ohDBoFWqT4EyMDANdG3
 OXY8damUBJmjLPIOtcvE4t2bQ/5Hi7C3JqNFXkqeBpdnwlF4D+6IIEkCuUXLtlSF
 QXsyi5V7JAF2g5rVaViJPrsx+yOR3OidGU8EeD5OMcj7XeTlirD+hQCo19gL8e1T
 ACyjXx+53qAt8MDtKjW0N8FNZb8sFkDIHUm0bNZuPwyxUDRgZDeN4/Oi0b9xqI97
 14qH4xEMW0fVtcDmBGR69ctHAaAexlGju46TrKhMGGdrUhdFKUUf8+eIWMxypVD7
 P1+gkQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bfj4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1ada6c43so11018951cf.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783101979; x=1783706779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kng9bpxyRwdgZbGNRYVhTygs7OAGZbgpVlMBL4NTKG4=;
 b=FWmhCHd2/ftNHfXiw8nhEDQk8HRW8w84gcNUG3PZ4va3Mgf70Z6vk1BRqo7VbedaW7
 Mc4WGN2f6rlA33PlhpyrZ+l9qDpP05xI3PCryNrfq6ZO8sd3T/aNKkVEltWPkgVwsOjN
 NX87I5ToqSbwfNugGJXRolKyea+vFYgrJieT326inAliy/nHU+aksOUmzK+zW10fJTOQ
 8AL+b1Y2z2P8t+xe5eTp5OxN+nEOcA+8KYw9V4bfHWBPfRgsyc4RfWpTYhpOUaDx0tB7
 49qutqOIlQcV/d0RX/nMj5sCCVE1xaYYOkp4mcHa3HgSQXVrF+zZ06Fk8KqemZhftBfL
 sLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783101979; x=1783706779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kng9bpxyRwdgZbGNRYVhTygs7OAGZbgpVlMBL4NTKG4=;
 b=Imq13Z/LzLyxObLBScIxYsd61L+0rdt3eI2bYGgWXVBCyBFcdqxXknxUhoiUNVsQUP
 nHQIPo63Jw+2f00GzU76mGKI1QfyrHgFg/s2HY/ASGLzody9nEM3HDYHN74B8Rko60sU
 W28GhrhOby8+22Cw3oXgQ0DGjbZtMF7+/8jQikUSlWaqwmX6pqwf7dpfy02dk42s2jPA
 CAPuYcwb11vJwd1JVWlMzX0Sc8mewdVMpw86HRpuEcOLnmLzJMKVoFmzM/AQ2dXKgKXL
 /C3FhH3XQBZUUc8hHm6VRCwWbCXjDAOIp0M+Hc2TqHzbqXKFyZ/FFVY7vwP8sNsoFOzc
 6GxQ==
X-Gm-Message-State: AOJu0Yw2DqLRkO57x1TV6dfeuG972GIKHUVpSru0P5oo08ETb+TXLwfC
 NYc6YXNMC0n9qrS6/+ybVo3i8yRbmjjQ/k7jBpIjIyIWEefeMiLRS3hF4f6/JDy7qoM/gj69aAN
 GSsuZfB8oVPLx3ZB3ZAcKOoTJKgjmJxrfL0NrD/0wCm3bmNZG5V88xAn8QA==
X-Gm-Gg: AfdE7cl7MP/IPV5cDFlU9CFL/fyz3ZMMSca3RU2xt7L3MB3v2NeaDlQBEgtV9/zb5Ps
 dUt8GrVpsfaTk391vVU3Ri//TVq/uuXU5mkJCy7gs4hF2f2XBw1AfjGRnYlw0F2XRNteqT2UOWh
 M2nag1kYaFA13SvnKNrBnLAB4HJPHF4A8rhN5Okokt2GbNYIq8EGBfh41jqRt3WrMwqfVYp803C
 u5UJm7/E6LjygPitJ1sekYEsqu6KULzE7lM66+5k+pL8eXEOuSQ1ZAI6Lm4hTSWkSmSrzI0xcvZ
 w5FQd7ApCNMivY9YoJFlXZALIv1h2brWX+1sjHCpoXnPY4VLi3/U5o6mtRgOGjubQ4KaWaC3llm
 lV9whQk+IYF4QQKOvh4iPnP2OfQx4bMWzp+GKtqoFdhJ5EQ==
X-Received: by 2002:a05:622a:4a8d:b0:51a:8c86:bd48 with SMTP id
 d75a77b69052e-51c4c365523mr9163891cf.69.1783101978663; 
 Fri, 03 Jul 2026 11:06:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8d:b0:51a:8c86:bd48 with SMTP id
 d75a77b69052e-51c4c365523mr9163161cf.69.1783101978131; 
 Fri, 03 Jul 2026 11:06:18 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:17 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 12/24] target/riscv: move riscv_cpu_set_nmi() to tcg-cpu.c
Date: Fri,  3 Jul 2026 15:05:24 -0300
Message-ID: <20260703180538.3346781-13-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX3mJcQz5gzbN9
 3EZaK2wj7d1I1MEZReIeq4r1zmwSj3MXWHdFJ60mHm3Qv9+hZo2uJt1bTv1RER4/dsnTOX0qiCR
 ZK9WGLPIc4yw5x0+U1XvgnPzqfhBzjA=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a47fa1b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=9Y5uhDEGy_uPjlLRjCEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: JX69ZFtrW66lTtzmJAwBLsLAxhmWjf-s
X-Proofpoint-GUID: JX69ZFtrW66lTtzmJAwBLsLAxhmWjf-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX9TQ7pH/H7Ws/
 3WQy4fS7mmJIkImWfIQhMveN5CC+6S7kM4Y22JyhFgJTpksvLncj3YrHrU4gbJO5gsqiBGGlcSZ
 ubwhIlVozv2OHwvDXcNX7PczBX/suuqa84xW2/TIiWUsgApWbwicY2+osbXfXUSaXkk8j6v/PqT
 tlBbyQKKVchc5GIqgN069FKBg3uuPfR8rKTYZ+tuGolYUHRlZcAFUcdCLkPuerURrb+mJq3BhRZ
 NoxmH8d9QWBmd/XuZb+MoQauaeNt6UYOgnFtpwwAGiCO4nEmBJYdKo97d5hqXlcg6vBCS6g1Tf5
 9tXNBD8x6UUfjGC6vJCuBQeBiq5Xrv/SzSrrn8NoEml/yM4KqDZO4oFNMX1Ga4ZXdEFApLYfrTd
 CW1iC2C5o48bqTWKA8Yz/5G+rKVNjbJFkETgme62+CLHxwmc0dxkXzLIJK0MoNbId3A0/FXNQpR
 LQeKjLK7AQVgELgjEFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030181
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

This function is related to Smrnmi and non-masked interrupts, firing up
interrupts via env->rnmip from riscv_cpu_local_irq_pending().

This is all TCG only code.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c         | 8 --------
 target/riscv/tcg/tcg-cpu.c | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bbce58ee58..508e8dc03e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1180,11 +1180,6 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
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
@@ -1203,9 +1198,6 @@ static void riscv_cpu_init(Object *obj)
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


