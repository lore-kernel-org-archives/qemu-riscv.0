Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D3AC43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:55:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHqP-0003DT-3G; Thu, 02 Jul 2026 09:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHq9-0002ta-Ue
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHq8-0008GL-BD
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:29 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0lie539295
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i5CvciT5tad7yGydRdWyMF8oIxQptsq2RqDK/Jr9Fwk=; b=cF7jyUsrbSlXG8Az
 /tqZF1IsanqBQwl2YF7MLyrmkb3Xfs5HZI/oKtnRM1H4bgJguEVbUUmQyYDTC+g3
 L8qZ43hwmnw+RjI9qNKoiz2b1vD6R2FKyIdrkg4TlPqnCsIVmtXGKIWQnaP99J2u
 z17QS2yf0NMv8NnYhjDNqeEuIA56ew02WOHOd05nSypI4rTeSWa3tUFjf7PaXaUd
 tiHGQLNf21xM/0X1ZOyEr7JdbigTyb9X94CQ9CTTmxlO9z90KFNTFLarwFTHENJ3
 d5BtGEjn5v4esCTljmPDrA59kGygcTlvBsoDgjE2kF4n5tJl2BlTZcZ/0zbsA56C
 t5Wj8A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvws4ye-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:52:26 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7389d239cccso638750137.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000346; x=1783605146; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5CvciT5tad7yGydRdWyMF8oIxQptsq2RqDK/Jr9Fwk=;
 b=Qpn4c7zCyd2M6JUtcC00CUJeCdmR2PBQvGFd9PngokCAp0hmOBxXm5E97Ntac4Kcvf
 DFfQmPwspbIZioA/1XNI4oFvJ8HEl96TdB+N8OQIzirztBuLiYF96X/sSvKYzxcgy+5y
 /2v31jWq8ZOJDU4/NXrtignpUmvviZ0nfb931fiJoFiaIE0ihq/J4ato9/0d++mR8lZe
 CvPA+if+VenyRfr9+yWHgArb2gPkxMC6SXrAdxdyTxtNCEeuRwq0nSr9i2pO/LzUCDPv
 eMO+IejFNQYREfl1nLtnYcWKuxgbJ0AxB0PtWrDOSEWhaaeeJUKYFB3o1PMJc4EVO2nJ
 O30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000346; x=1783605146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i5CvciT5tad7yGydRdWyMF8oIxQptsq2RqDK/Jr9Fwk=;
 b=OIT/v1qse0uMLHV8KVayiqzmTd44/ZANA2KW4n3gu54Z7w7Ybx2lEjVugXaQXcafXv
 YnjKKeZUB8Dca8z2tdJD8xjtJ4NGbITCE60YVVAIYhjHEqJfkBJekI4/n/KGCsCTnoIQ
 G21fw9wRH5gekEopQGB9R+H/dfmYkK+Rl/YJU7Pyhym9M7LvBElbnXhdiUjyyg95UWSL
 ClDZGHIVruYWE6A7yPBw5Zs5msv+SooA0zoRJrooVkPWtZFCej78nKLqSHNIQNU/QjY6
 jYELOPrGiIB+E+oVzyKMkyZEoUxEVS69ZI3ymO1pjQbuUUIEzWRZNki2/0SesDroeK/P
 Qv1Q==
X-Gm-Message-State: AOJu0YzNm5I8b9uDe8DwNwnmkG7iPRWZn8ZP26hBVgPo4thrbuQjtm2b
 5kT6kvo6eW/tLjlZSzpzgtPe2kYQ4DAkLF2N1kPuN6ybybBCEA3exdBRDhSKJUalaZ0qydAh/VA
 eXJZGiWlBP6hfDf5CRfLhiQHE8D1ZlqUYGs3PWLlFKO2fk72NlW0/1GQtuA==
X-Gm-Gg: AfdE7cmlkHDGdNzhh+nS/1wWGnmTdsc6tIa/qv79iELdopBXHit8A+sjjhO99cZZCMO
 OLk5UzzD7uVa4iyyoKNz7ttmXjdUlrVF2ZPwwFAkTTuZe81qK1zdT4MF0xcCsZ4M7JRbfj+pqVy
 dBtt394lhVek6UtHLMQE6t/11DAjwmLdog4Khw+C7ZZLXSRgP1y7fWQkJMDd0mQV0ADgjdTSjMc
 Nxe68rxf4vOBXtNNOBvZEHez0QUDAHAaU8dPAPBZcSXJ4DRjvdQWs2x9GH6SU2SuiaPM4kfQeFw
 KSyJFtIjjvCDTW4vAu4PSjC8VtENYhxsfz+j4gXXuWTCGFotEi/rPnq+o6bsBqlc+8RuG5NTFR2
 W313sn9mEHrcpsPLUjhMUUMGm/orRjThbpOhax2RgW7+IJA==
X-Received: by 2002:a05:6102:5127:b0:738:ecd7:1984 with SMTP id
 ada2fe7eead31-73dbd608843mr2196465137.3.1783000346018; 
 Thu, 02 Jul 2026 06:52:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5127:b0:738:ecd7:1984 with SMTP id
 ada2fe7eead31-73dbd608843mr2196449137.3.1783000345537; 
 Thu, 02 Jul 2026 06:52:25 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:52:25 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 20/24] target/riscv: move riscv_cpu_set_rdtime_fn to
 riscv_aclint
Date: Thu,  2 Jul 2026 10:51:22 -0300
Message-ID: <20260702135128.1188021-21-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xpbX5oWT9Cq56wqVpJMvwMhI92EivHdG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfXwFbvSe8E8eki
 KQhJQ9r6/cFSy7w1Fy9z0GHbkIAzTKe+Ekwr0KsW3g+Hk2UMV463pglF6cTenm6wxrL3csPHepq
 /X0rCtRbCqXl1wRXzWzPSl88/FaQ4URounDwH1Xdja09vRrmKZgZ1+WK9X3umC51Fj15dCWgcdl
 lK1cD3IF+/lzFdNfoWKhBePN+Qj3r+Gt1/laEa6EEsHKStuwDodCugGavUe4fH0h9GxGpelceMF
 ZtCwAssTgRAWHrqORnDojKSlmBFAZfx7NKsaQP3IhHN92wNuKI4pmKLTWVvr0+24f2K5nbmeqOR
 lHQZMqLom5Q2QKS78NP6GP0oFlHB0/p+RwozOGOq+cz05iMldF0hcpqQ+M0jIkalIM/rPBULX8w
 /NU0kc+33tXlB3sd41xERKHa4BemYK2sFe/z8SgBJagdvEd7GI4JcieSlUspg0Vg59/BPCDVgDg
 ZmvlYWnle2Wnb0B00fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfXwa0aoFPKi7rg
 Zezm2vYiBNaa0b/9Nf0Pu9DEO02MQ8a80krU0MEbKXF6Ut7WC92M9t9bmlEXhjxJZNq7AH/JvHx
 YXoS+2svVWi4p/jl9Ioe/UI8IdXlTWs=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a466d1b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=u0cZ2EjT8PS4VQJ4ig0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: xpbX5oWT9Cq56wqVpJMvwMhI92EivHdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020144
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

There's no need for it to be in cpu_helper since riscv_aclint is the
only caller.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/riscv_aclint.c        | 8 ++++++++
 target/riscv/cpu.h            | 2 --
 target/riscv/tcg/cpu_helper.c | 7 -------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index e27e5fb394..361a8d1bcb 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -40,6 +40,14 @@ typedef struct riscv_aclint_mtimer_callback {
     int num;
 } riscv_aclint_mtimer_callback;
 
+static void riscv_cpu_set_rdtime_fn(CPURISCVState *env,
+                                    uint64_t (*fn)(void *),
+                                    void *arg)
+{
+    env->rdtime_fn = fn;
+    env->rdtime_fn_arg = arg;
+}
+
 static uint64_t cpu_riscv_read_rtc_raw(uint32_t timebase_freq)
 {
     return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 396d9253e6..d6c5d6c1db 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -682,8 +682,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
 void riscv_cpu_interrupt(CPURISCVState *env);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
-                             void *arg);
 void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
                                    aia_ireg_rmw_fn rmw_fn,
                                    void *rmw_fn_arg);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index aded995a7f..7a1ea53ae7 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -612,13 +612,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
     return old;
 }
 
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
-                             void *arg)
-{
-    env->rdtime_fn = fn;
-    env->rdtime_fn_arg = arg;
-}
-
 void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
                                    aia_ireg_rmw_fn rmw_fn,
                                    void *rmw_fn_arg)
-- 
2.43.0


