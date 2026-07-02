Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC41C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:55:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHq7-0002qH-LN; Thu, 02 Jul 2026 09:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHq5-0002ns-Pg
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHq4-0008DC-Ag
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:25 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0c7W522265
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=HvA+knPHbaA
 9bnWMtQEYjaoJjnLoQbaJzpAbT7IhYlU=; b=Fqnofq+xfmBgTN5sVhYHPuOV3zS
 pfosklGz5osVA0mRmn/H9DlpMmv9vtCeFjKSIBj41QQmX149ZGuY/C+wAz36nh2k
 z/3Xk5y0GxXNUbpTdTr1ZBEB8Kk8jc5ne2Pmvxl+FOmFVxOVH/ZTkgvB6EvEFPaD
 vx4WgQ4sLxN+XCr0xRiBvi2pVoMne9cRXo0GfiKT9ed3G+ZKM7A7oDIPd3MhUX1h
 YUKTQLrZmLhB0y/+npxcIUUbKWxiee1BpLVk5KuRPV/axEJzIDTT3I7w5/2JC6au
 bCHZ3YI9Y96wMSi1CnXW0tEn+NP7rR2XPX5S2YTLKjkPUBztdRXbW/FPzcw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc1ghx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:52:13 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-969289fca9dso387342241.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000333; x=1783605133; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HvA+knPHbaA9bnWMtQEYjaoJjnLoQbaJzpAbT7IhYlU=;
 b=eOD1fbzOiqFXm/1XKPxs1bQH0r3NscB+41STodV54nTHMRNnSFbJzmSmulb4+RuViJ
 gSIFcB+iOv7hXOewIm+SAsX9VSExAx973pClxeszgDaeQAvKXR4EgXgP2c3uDt40TXdz
 zulh4xpc7TKHbsvgDHpTpYacIZQEofZh71AeCHl/oOO8liRf5JO8Vz8DmyUQpxYEwuxS
 6dFqwjBBMdSF/3ZPbaahTjKB+vX6A3tGW7PPJFQNHBcbfj6m0if/Iq0J0xXdPuF1ItnE
 oj7Q0quBged65KLg6ypuoCaeJbg0rVrxCxYgdPuY2Ng28o7oMVrsk8IXYgp38NrDq2OA
 J1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000333; x=1783605133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HvA+knPHbaA9bnWMtQEYjaoJjnLoQbaJzpAbT7IhYlU=;
 b=jm+LUOmTtCkaMZZejXiZkTGEd4jIxsdCCZr78vnR1fjn28KkXkx85YYi4huWTVWQ0R
 dDYg0r9NyEJ7QNn2VNeUOc/OUo5Wf7/X8ymJ+b62aPw9kDYKI+QX8CeQ27krEBMZhLPm
 HOjvoMRJpg+vFPJsH9bGWn+Rh11Pet4qh5HwNdxjK8LTvlhKWVqbi3898QXq30hpPlwg
 N1MC4rN0RnvNoIXEjiRmPPxHuTUF9MDHgNIAB5goNf0M9GkEBRtOzfLqZOO15dRByx4V
 0EFbR9Kw8lGpj/2BlBUYE5FEF5roux9lnr/3dm7fkJybi1utG8Zi3mqpQSUj0elVc5fp
 emYA==
X-Gm-Message-State: AOJu0Ywpfr7rHyVd/Y/UVVr04JOw6+er7Gi+jyvJCMQquARPzfUrFiOB
 MInj1LUZZleJMhrRBnUUYeDz0ADnGEDKlyx8EGX8lsA9o9cmC0/olVTuh4fg2C7DDQj4wGZM0cd
 0tjtKbxHXd/5sdLF0xAbaK7BMmD+bHlEJ9A7vJE9WTBrAHC6dkyhHY2ot+Q==
X-Gm-Gg: AfdE7cn3RAQjd6Y5q5SOWSEyc/R6AX8fQIK0LOSQLYQ9uFnPG0QrYdzx9zeoJlClXpn
 OKhf+jSWwZl1eBuTvY9Xzsi9JPe6cUu1RZZ+SIjrtZw3l1q1DXl2qxLiwUTTiiIU4HbJoVXdfwB
 bo3Kw731kYIURCpbJuXcWX0xg1gxO+UMPE4+JkmWy7a4W6Qf2JOA6hob/7b1klmfKBuSBiMp7XK
 37tbvdbVn0wL9jgjTHatJDsWYQ9P3YNoY4mHGS15ma5aHR+03++qiidhbCvJ/yS5c66JIlMVbJe
 HivSow7PnJI3PBWAZAh+PjhBem2YKrUx8gZCx38++My8+JBkvEg4FozfpTqiXKDrkzhjMicRH4H
 f24v7ywKV5gcwea1S1UY0d3nj22/mUnLde14avZlT81I2qw==
X-Received: by 2002:a05:6102:1497:b0:728:68cf:c76 with SMTP id
 ada2fe7eead31-73daa339c76mr2325533137.23.1783000332676; 
 Thu, 02 Jul 2026 06:52:12 -0700 (PDT)
X-Received: by 2002:a05:6102:1497:b0:728:68cf:c76 with SMTP id
 ada2fe7eead31-73daa339c76mr2325523137.23.1783000332214; 
 Thu, 02 Jul 2026 06:52:12 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:52:11 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 15/24] target/riscv/cpu.c: handle TCG bits of
 riscv_cpu_dump_state
Date: Thu,  2 Jul 2026 10:51:17 -0300
Message-ID: <20260702135128.1188021-16-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cYNbmbrlo3Hnm4jFdGszpHN7qrH38uJG
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a466d0d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=n_Gjmr79VRyvsDPUZ2MA:9 a=TOPH6uDL9cOC6tEoww4z:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX6YNkbRNQrIQJ
 BB3gza0BKg/M3tUQiu21YgspLnma9f8EuzmkfgipKKb4m9qCkLGWKDg8XhC29hzX8HKAkfe7FFu
 HUkbFFRUM23rc5qNv5yyRkPiBWIDmCTGHj8Ku4itetJnUvn3FLow69iEiUVfGyLdBdl57eJqB87
 4ldgSLITPX27k5/Wygb52RgSLSzKlNmFMnqoukrMOUrEzGKOt0qXIRON9NctV8wX1DZxZUValF3
 ndtECDIT70qxMwwuTYkCtqTT2mlBYQrumzCw2Ll0e5U7kEftXJUO06VsIszMN3Eq2tkhTJ4ZwO2
 uIPoT03Uoo5IHx+ll0Bs6DYufQBMJD80kaCxPZx54/vZS3Hy9CjYrJtWOFFo0Ausif9lUBUY4Hu
 cLlO7bs6JGiqxkl0FNTuc+xDmOs4uEYMWnrCUClyc7/oWying3vtVK1Npq4dPalIJNCP/4m7Gmj
 RBJuGWHJ+sNE46Iroqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX5+md33LP9aQi
 gImZWuVNaPC5Ol9nBkS4vU+jbTmXg91zh35QTKGCxomI1VlUDpiMzQOFT0S5pcgqvjzZDe508p7
 D5ojYCn82zAIM6tsuSywUzMpVw4XYxw=
X-Proofpoint-GUID: cYNbmbrlo3Hnm4jFdGszpHN7qrH38uJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
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

riscv_dump_csr() is a TCG only function but we'll have to implement it
at some capacity for KVM eventually, therefore put it under a CONFIG_TCG
ifdef while making a note that this function is unimplemented in KVM.

The csr_ops array is also TCG specific, thus the for loop inside
dump_state that iterates it is also TCG only business.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2741047769..db18c52656 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -612,8 +612,10 @@ char *riscv_cpu_get_name(RISCVCPU *cpu)
     return cpu_model_from_type(typename);
 }
 
+/* Note: this function needs a KVM implementation.  */
 static void riscv_dump_csr(CPURISCVState *env, int csrno, FILE *f)
 {
+#ifdef CONFIG_TCG
     target_ulong val = 0;
     RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
 
@@ -625,6 +627,7 @@ static void riscv_dump_csr(CPURISCVState *env, int csrno, FILE *f)
         qemu_fprintf(f, " %-13s " TARGET_FMT_lx "\n",
                      csr_ops[csrno].name, val);
     }
+#endif
 }
 
 #if !defined(CONFIG_USER_ONLY)
@@ -662,7 +665,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 #endif
     qemu_fprintf(f, " %-13s %" PRIx64 "\n", "pc", env->pc);
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     for (i = 0; i < ARRAY_SIZE(csr_ops); i++) {
         int csrno = i;
 
-- 
2.43.0


