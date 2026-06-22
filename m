Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8374ECDB466
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:36:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkO8-00011P-Bx; Mon, 22 Jun 2026 15:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkO6-0000ye-Hf
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkO4-0001ue-In
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:54 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFXXxg1647519
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=aSo2kC2MH7h
 pLxfCMiCuwltWVVJs8yBNERrFBxnLqA4=; b=klSavXZ1HesCnmT+jx/BPtG+a+/
 jS2ayw7tEiuZXm+DLL/ndX9U30vbH24Z7pldK/dFG9AyTs2Tb1IZRozM0eQJ7Eg5
 BhKxRgVm68gkhXUJvZM2Zv4L1PgosbDLH4fprliQJVms3EZ3fC5OiKXGfwhHAIzz
 oCta56X66w6A0ohdKC8km1jI2NQdtxpGecG0/sKccEqwezhUd3bYjrFkgbQbAScE
 4KL3oAZv8LF4t+9H/8wtB4e9a4L3TdNjc0aBw77rxN0Mkq4pgoZn7RkKmv/Be1NP
 Eoawt6lqpAtWzQGPRFezjrzj4NGClGQFFB09d7cQEFoyzQFd3Y9ZMGQcdjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey37h9yc4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92158791d14so340034885a.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156771; x=1782761571; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSo2kC2MH7hpLxfCMiCuwltWVVJs8yBNERrFBxnLqA4=;
 b=dPq6db4CvXHVDpdk4crFdVZEhQZG7/juaLkVSoTdHWstlrKEdMueDkXnLAlAJDZCA5
 jXxf7Fbu2ckT3FNim4OIZLmn1qysbOK3uXXyT69xVlIG8WvvFkW+DtgUAEgcNh2X8BNp
 JlSor7R9kDPvsZniKI6PE9ilKIK2nySfQ5B+rROO2jD/+ZKeSStxG3OwQAfdFQVcgdod
 hIt6jJYDlFUmNC2iyeI1MAYAx07+V++m597RrS9VsC9SybB22F+c142A7ECSY/LCgF8q
 8ZkcK4Iaig2DakjQM9XDMvF/kPO1FUOcS5JOXYUr3NcE+c7zsYRWjHpayfBIof17g1n6
 268w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156771; x=1782761571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aSo2kC2MH7hpLxfCMiCuwltWVVJs8yBNERrFBxnLqA4=;
 b=stfY4TQEtgEi6DEJ8KwiUnWxXzz8BDS1zWqvNctKPDtBoHJen3X4Ft6YFDIFfgSJ60
 00GfYav7PNvn1g7CQzTuFEKf69wVFquPbtuuVfQ8m21l4LPvjRPuDY1NamM+VWF9GrIJ
 UaNkB6vpNaIlYRQJewgddT+WrpttS1puXwc3huScbXMrpwkauq2sf727wf2po4qYTyy0
 fWb0RENHdjTJl00Axy7kbVfsvZgG6wI3jBDjM1KWTJ6X2/1GbMGtqnwlEXYWOQTaBsiz
 l/NQIILYF6V4VbWtFPm0HzRm/vPUFjGe1izhQjbSqK9t/yKebvTcXDCkTeKmcJGj/MEF
 opBg==
X-Gm-Message-State: AOJu0YwIL/kbCUaWZLmjGwvn3orMv/CU/V9abx5m5kerBgRdUyvEVRWA
 pwkdg9qVF+371qy/EtTHAxKidrx8Iwsb0yqklmusjR8l0u5GdSTKL4XCZwDDHG0tmLxVMAnWq3Y
 59Jes3ZHVLMUIfZRvvEoQ+jZ18T2nSZhQ2lVIv17QC0GYx3xbho7tGAb0Hg==
X-Gm-Gg: AfdE7cmX80Kx9GTQLMKze45MyI7cBesyWDy8iGiRE/Z2ARBS/Rd5clsQb9rhxHXDwU8
 cJ0eRuBd/EDP8UCxXuP0LxjF/wEW3WkBTrVqxuEH8sLo+mQDS2EMrRfUiBSJhRNn2pPV09v63HK
 IYnhwqdBsNEnIQG2oaCkGZcNa0Ef8zytQZJQXvq8Bct3yWP2jJzhO/1HINV0lvpVnVtBGyqvnow
 D2teTfNb/kUPd4B0o5Sh8SkPToQqyVTygtyas4juoy1Jq7PbhHp79FV+HtMXwp019KYA8fakwpC
 /5S5Bk1YoSKRIvphyaxPntXJt/Jn++KxnRCuzO/MIuh3tpPcTMsVjJZtJUF9/MVo6pTHBO2lmwu
 UYqnZj8fwKqN7YRYuL5oIuG2f7U72hVQSD0/rAwcUHrkKJA==
X-Received: by 2002:a05:620a:2947:b0:915:a101:48d with SMTP id
 af79cd13be357-9208ddc3d63mr2663182985a.56.1782156771017; 
 Mon, 22 Jun 2026 12:32:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2947:b0:915:a101:48d with SMTP id
 af79cd13be357-9208ddc3d63mr2663176085a.56.1782156770516; 
 Mon, 22 Jun 2026 12:32:50 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:50 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 21/24] target/riscv/tcg: remove unused riscv_cpu_get_geilen()
Date: Mon, 22 Jun 2026 16:31:37 -0300
Message-ID: <20260622193141.1449724-22-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7cN-NmYPwFNKo7e49-UaM1AT6678emhF
X-Authority-Analysis: v=2.4 cv=ecANubEH c=1 sm=1 tr=0 ts=6a398de3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=tH4yzZzyKPjBQqKxX1EA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfXzhLBmAlAana/
 ssxoyPPuYb03dMi4YBMEl/u7ZX0qwtVuLl2DaFUJ5jxYRn9v6mf5xjCxk7B3ZzuhyrKqHH/VFmh
 6PwBEu4E2Yw6CrSV3SwfWMmikoT/7E8=
X-Proofpoint-GUID: 7cN-NmYPwFNKo7e49-UaM1AT6678emhF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX0OOxpdKovV6j
 pcxj152KgAq/dC74n7DGIILNlpeNrc4Edm3L8ps7UzvS24kAm+hig92XLvEf0dcWe+O8eyvSHx6
 aSMU1cSZ4RYPYXLPn4EMJkeuaqijsdTlO+JPpy1bwOZBdD30iznHpI3UjeEhg7xsmODbOjKrx3b
 qgqZx0bxHj9s7GtWD6fvSM47ymrCI/oqxpfLcppE5nqDQQXxqtvEKe4wsKre0osUWH/6/OmzdYo
 an4pICqEolMQky7n99be/6zQA7MpvZI0Gtf+DbPs/uJmaqQXuxLkTio6Ze4YfvBnRlFVH8mFGCp
 LKnPOhYeAZUL4agl8F7iRXZBv+ZnrRL5gRfyIAvBjDi52fXw0Bp++BNkybnBQoMC6RkVJ07NOIF
 fNDv9f/0XoQ40XfBb/irRfhwfX3dOutopX7Iz9SFyVaCg7Ew+7bSgG8eT7AM0E3BzqVFYRur4+a
 HPUly/nLhYPJ3rLg8uA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
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

No one uses it.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.h            | 1 -
 target/riscv/tcg/cpu_helper.c | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9ec86069a6..aa67999005 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -644,7 +644,6 @@ int riscv_cpu_pending_to_irq(CPURISCVState *env,
 
 
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
-uint8_t riscv_cpu_get_geilen(CPURISCVState *env);
 void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index d0d74c3597..1f13d257f6 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -526,15 +526,6 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
     }
 }
 
-uint8_t riscv_cpu_get_geilen(CPURISCVState *env)
-{
-    if (!riscv_has_ext(env, RVH)) {
-        return 0;
-    }
-
-    return env->geilen;
-}
-
 void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen)
 {
     if (!riscv_has_ext(env, RVH)) {
-- 
2.43.0


