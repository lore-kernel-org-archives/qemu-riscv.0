Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98758C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:56:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHpv-0002SQ-RE; Thu, 02 Jul 2026 09:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpt-0002P9-SM
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:14 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpq-0008B9-FP
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:13 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0Zho417184
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=kCMThYvE/fH
 ManL2Sr5tYS0axu8TItu5IBhY/LlVIdo=; b=VFVpQTIW9LqmtlDgc8rJDYKKK5/
 7xQHRfqHnSnsbtH8jIi9uQ7CKxbabjAOqKrxqGkxJo0DTlur5OD18RNqz9wHTcG2
 mEjHXPQx//5T3AuorECYuvj/hpJVyvbuNS3Ji51nh+TFZ1X+okAUaVPMB/9/cQz0
 x3Kd/CJE6HQZJKjr7w7WDiZM/MnsVv0Il7Kv7i7f0QM+DKG3McjnsJNwg0fO3YrT
 OXyMaYq4DdP1NuPM5CRbNr6tR7dcicYy2T5UjUR1Vfp9C6GHaFyfEDJbt8NAGBrs
 YV3C0xD5jg8ZtzcGtnGUf6avh49txUWb3atZ1rN/hUbdGMAkf+/AxbhZvnA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bh1gj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:52:08 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7377e2f1a62so740937137.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000328; x=1783605128; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCMThYvE/fHManL2Sr5tYS0axu8TItu5IBhY/LlVIdo=;
 b=cWFjwuaVZv10avzpqPpAvwWJn0a9kZdfY5bNV7cZfIBSrFrzqc9xYTt32kEgno+qlN
 RDmmBQjjxwBz+6BG8Ap1oFTjaPeQmWmFxy4elAxeJfA0L/pyqKmmCeGzSDka/WOl6XU0
 SVEYvjdsIF5T1ZnXOJ9+uDABy2FeDCLb/3ROc31VegGhxf0eW+yKSrwo1twuG27I8AE+
 71eR7TG3HQQAg6miTK5X5UdRVOsFzOzBS8rXZ8YCgnkPa2yntqWNaK59EVuxyBd5TWoB
 nm0SbUmj2pS2p3pnpLLVbWWDM3uo3qCWzeHYTCfx7HdGMJs43xne1Vbb52RVXXp9oiTn
 mUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000328; x=1783605128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kCMThYvE/fHManL2Sr5tYS0axu8TItu5IBhY/LlVIdo=;
 b=bewzr8rCkOsYugBVrUFTrkkE9q+tELgd8S0ohvEu5dKWeuTRs94kB81ulEvdvBDW8v
 D2YwOuDmcSsRkKFuFjPHw90Mb4QBsifnGrjC3X+kN8wNqbcaj039gHUbRn6guJZ2H1Ev
 w0HBOc8CcTU/qmH3rCWHot5WdAkrCM4GovuqCLqE0Xu/8LV+DTrqAeztPN0SweJoIQY4
 MFu3lj0rsQ90alu3UaGWxE44K9KWrU7Tca4VWJDbAgi2TOvAgp1025XMLgpKCBtx2ZNK
 Exhqw0+u9iZw/e/ltqcFuR1BHhuPoXm8LZ6rBKEvseGKXFCPBXAYBgiKOyh2AQXx3nWe
 5UZQ==
X-Gm-Message-State: AOJu0YyKRAAshLHHTtUpU0oCzs2CiGb7oIoSRTzk8LfcPfmNbQRy7sH+
 8KzJ0RdMQ34OewCTZRBFamyOS/76NXgMO+w/1IQhcQskWRePuZeSjPaV7IjXY47uQPD22TyTYlc
 qTA+euxOwYhz0v/uVVLevT6Lh6sZq4jrkMfJNioAcQSm71wwm6cn0TcmjFw==
X-Gm-Gg: AfdE7cljY3AUwsZvEdZXy8MUyECUYeOz0AV4GnWdieBxMVVaIS5mgY9wYxOWlvuq34A
 PurvHJ4cY74+eNa99BK/Nf5zCus7r/SbK987FxoStj519IHWqHPrhQl7pcafGr2ash0XeV/ttnO
 PHJ1eYJCIT4RAPeXepZ8HUnBNWlZo0LogdfCOMmlx90qBJQLP65Z3GT+Ogum+FZDzX+IJ+54iYB
 9GLlJMPaTjK4VgawV7fD+pLZfLW6agL2sajR34U781yUh7f0bygBzkztHm4Z2wopD0vwV3u6Ael
 +Pth7xH/Wnksz/9Ly8TTQdOYnz2K6AIqxUICBjz5DK6JPGQPmTWhk5OD9OckDaLFQZYfT3/zyfg
 d9Aqx/zKTGMG2dk/yNJ9nlTENXLGO6lNprxjCh7Jy8+UOMw==
X-Received: by 2002:a05:6102:a46:b0:738:bd0b:7560 with SMTP id
 ada2fe7eead31-73dc00b10c6mr1914256137.23.1783000327648; 
 Thu, 02 Jul 2026 06:52:07 -0700 (PDT)
X-Received: by 2002:a05:6102:a46:b0:738:bd0b:7560 with SMTP id
 ada2fe7eead31-73dc00b10c6mr1914242137.23.1783000327050; 
 Thu, 02 Jul 2026 06:52:07 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:52:06 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 13/24] target/riscv: move some irq helpers to cpu.c
Date: Thu,  2 Jul 2026 10:51:15 -0300
Message-ID: <20260702135128.1188021-14-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZiPaEfTX6mbTgD531OODkQquHOMBSOaB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX9/F4yWn65zAi
 vaJ07ZIoesu8rx2C9SaZirqJ/46M0algDP83dWjBuloIvx7baYAhPLVlr/z8nWYv00Ku/2ZQvSn
 5/bmwkssqGKkZMh78YY3e6Tm8ihaJ38=
X-Proofpoint-GUID: ZiPaEfTX6mbTgD531OODkQquHOMBSOaB
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a466d08 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=GPi4zPIJMbMzHxplyksA:9 a=-aSRE8QhW-JAV6biHavz:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX5Qy3SML8BYd4
 Wjigp7KW0lnPEHDk6HQGi+4PfnYjbvGn6co8J3xsVWy8QSvOnMkWEyeSvKI6bCSfcBlNXnX1GEx
 C83Dry28l+ik8St+YvkXgEZHAryuW38FBLTNzoNND9ZEly92O3H5JqSKubdVxTQVBG0zx/uCYxS
 2CtolYRCdPBbTKKpPLlbAmgBIh+ZduqtdOmjGJB+tA5rw7Azd/KKBAhgtVJ73jhqBFXuvYEgnHt
 FRMfno9kXonqLDkSJ/joxbcZQv3hsOZWQhVjpVFGNk1lkUn9ddrsodgnElbGZqpGzWGAWED3YKK
 MddQ9yZ9N/ydBE2W12bHnjdbDGGU7541DGTMvpI14ieDzuVp5LgFt3Y0R6LVa8bqDXuKNGCdQXz
 oBOMEhjiCqzL5AFDiwySNV6yiXtjKcPUDC4V49hc1ybpuDM+oNF/+CfX1MLjFRRndLsesOkdqOl
 iqYIqEmrm3ROJlgerNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
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

riscv_cpu_has_work() uses a handful of irq pending functions from
cpu_helper.c.  There is a very high possibility that KVM doesn't need
the current implermentation of has_work(), but the common accel code
needs an implementation of this callback (see cpu_exec_class_post_init)
otherwise the KVM driver won't initialize.

Move the relevant irq helpers to cpu.c to allow KVM to keep using the
current has_work implementation, allowing --disable-tcg to work.  We'll
circle it back to evaluate a proper KVM implementation for it in a later
date.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c            | 187 ++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h            |   5 +
 target/riscv/tcg/cpu_helper.c | 187 ----------------------------------
 3 files changed, 192 insertions(+), 187 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 508e8dc03e..fe24751379 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -745,6 +745,193 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
 }
 
 #ifndef CONFIG_USER_ONLY
+/*
+ * Default priorities of local interrupts are defined in the
+ * RISC-V Advanced Interrupt Architecture specification.
+ *
+ * ----------------------------------------------------------------
+ *  Default  |
+ *  Priority | Major Interrupt Numbers
+ * ----------------------------------------------------------------
+ *  Highest  | 47, 23, 46, 45, 22, 44,
+ *           | 43, 21, 42, 41, 20, 40
+ *           |
+ *           | 11 (0b),  3 (03),  7 (07)
+ *           |  9 (09),  1 (01),  5 (05)
+ *           | 12 (0c)
+ *           | 10 (0a),  2 (02),  6 (06)
+ *           |
+ *           | 39, 19, 38, 37, 18, 36,
+ *  Lowest   | 35, 17, 34, 33, 16, 32
+ * ----------------------------------------------------------------
+ */
+static const uint8_t default_iprio[64] = {
+    /* Custom interrupts 48 to 63 */
+    [63] = IPRIO_MMAXIPRIO,
+    [62] = IPRIO_MMAXIPRIO,
+    [61] = IPRIO_MMAXIPRIO,
+    [60] = IPRIO_MMAXIPRIO,
+    [59] = IPRIO_MMAXIPRIO,
+    [58] = IPRIO_MMAXIPRIO,
+    [57] = IPRIO_MMAXIPRIO,
+    [56] = IPRIO_MMAXIPRIO,
+    [55] = IPRIO_MMAXIPRIO,
+    [54] = IPRIO_MMAXIPRIO,
+    [53] = IPRIO_MMAXIPRIO,
+    [52] = IPRIO_MMAXIPRIO,
+    [51] = IPRIO_MMAXIPRIO,
+    [50] = IPRIO_MMAXIPRIO,
+    [49] = IPRIO_MMAXIPRIO,
+    [48] = IPRIO_MMAXIPRIO,
+
+    /* Custom interrupts 24 to 31 */
+    [31] = IPRIO_MMAXIPRIO,
+    [30] = IPRIO_MMAXIPRIO,
+    [29] = IPRIO_MMAXIPRIO,
+    [28] = IPRIO_MMAXIPRIO,
+    [27] = IPRIO_MMAXIPRIO,
+    [26] = IPRIO_MMAXIPRIO,
+    [25] = IPRIO_MMAXIPRIO,
+    [24] = IPRIO_MMAXIPRIO,
+
+    [47] = IPRIO_DEFAULT_UPPER,
+    [23] = IPRIO_DEFAULT_UPPER + 1,
+    [46] = IPRIO_DEFAULT_UPPER + 2,
+    [45] = IPRIO_DEFAULT_UPPER + 3,
+    [22] = IPRIO_DEFAULT_UPPER + 4,
+    [44] = IPRIO_DEFAULT_UPPER + 5,
+
+    [43] = IPRIO_DEFAULT_UPPER + 6,
+    [21] = IPRIO_DEFAULT_UPPER + 7,
+    [42] = IPRIO_DEFAULT_UPPER + 8,
+    [41] = IPRIO_DEFAULT_UPPER + 9,
+    [20] = IPRIO_DEFAULT_UPPER + 10,
+    [40] = IPRIO_DEFAULT_UPPER + 11,
+
+    [11] = IPRIO_DEFAULT_M,
+    [3]  = IPRIO_DEFAULT_M + 1,
+    [7]  = IPRIO_DEFAULT_M + 2,
+
+    [9]  = IPRIO_DEFAULT_S,
+    [1]  = IPRIO_DEFAULT_S + 1,
+    [5]  = IPRIO_DEFAULT_S + 2,
+
+    [12] = IPRIO_DEFAULT_SGEXT,
+
+    [10] = IPRIO_DEFAULT_VS,
+    [2]  = IPRIO_DEFAULT_VS + 1,
+    [6]  = IPRIO_DEFAULT_VS + 2,
+
+    [39] = IPRIO_DEFAULT_LOWER,
+    [19] = IPRIO_DEFAULT_LOWER + 1,
+    [38] = IPRIO_DEFAULT_LOWER + 2,
+    [37] = IPRIO_DEFAULT_LOWER + 3,
+    [18] = IPRIO_DEFAULT_LOWER + 4,
+    [36] = IPRIO_DEFAULT_LOWER + 5,
+
+    [35] = IPRIO_DEFAULT_LOWER + 6,
+    [17] = IPRIO_DEFAULT_LOWER + 7,
+    [34] = IPRIO_DEFAULT_LOWER + 8,
+    [33] = IPRIO_DEFAULT_LOWER + 9,
+    [16] = IPRIO_DEFAULT_LOWER + 10,
+    [32] = IPRIO_DEFAULT_LOWER + 11,
+};
+
+uint8_t riscv_cpu_default_priority(int irq)
+{
+    if (irq < 0 || irq > 63) {
+        return IPRIO_MMAXIPRIO;
+    }
+
+    return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXIPRIO;
+};
+
+int riscv_cpu_pending_to_irq(CPURISCVState *env,
+                             int extirq, unsigned int extirq_def_prio,
+                             uint64_t pending, uint8_t *iprio)
+{
+    int irq, best_irq = RISCV_EXCP_NONE;
+    unsigned int prio, best_prio = UINT_MAX;
+
+    if (!pending) {
+        return RISCV_EXCP_NONE;
+    }
+
+    irq = ctz64(pending);
+    if (!((extirq == IRQ_M_EXT) ? riscv_cpu_cfg(env)->ext_smaia :
+                                  riscv_cpu_cfg(env)->ext_ssaia)) {
+        return irq;
+    }
+
+    pending = pending >> irq;
+    while (pending) {
+        prio = iprio[irq];
+        if (!prio) {
+            if (irq == extirq) {
+                prio = extirq_def_prio;
+            } else {
+                prio = (riscv_cpu_default_priority(irq) < extirq_def_prio) ?
+                       1 : IPRIO_MMAXIPRIO;
+            }
+        }
+        if ((pending & 0x1) && (prio <= best_prio)) {
+            best_irq = irq;
+            best_prio = prio;
+        }
+        irq++;
+        pending = pending >> 1;
+    }
+
+    return best_irq;
+}
+
+/*
+ * Doesn't report interrupts inserted using mvip from M-mode firmware or
+ * using hvip bits 13:63 from HS-mode. Those are returned in
+ * riscv_cpu_sirq_pending() and riscv_cpu_vsirq_pending().
+ */
+uint64_t riscv_cpu_all_pending(CPURISCVState *env)
+{
+    uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
+    uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+    uint64_t vstip = (env->vstime_irq) ? MIP_VSTIP : 0;
+
+    return (env->mip | vsgein | vstip) & env->mie;
+}
+
+int riscv_cpu_mirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs = riscv_cpu_all_pending(env) & ~env->mideleg &
+                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
+                                    irqs, env->miprio);
+}
+
+int riscv_cpu_sirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg & ~env->hideleg;
+    uint64_t irqs_f = env->mvip & env->mvien & ~env->mideleg & env->sie;
+
+    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+                                    irqs | irqs_f, env->siprio);
+}
+
+int riscv_cpu_vsirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg & env->hideleg;
+    uint64_t irqs_f_vs = env->hvip & env->hvien & ~env->hideleg & env->vsie;
+    uint64_t vsbits;
+
+    /* Bring VS-level bits to correct position */
+    vsbits = irqs & VS_MODE_INTERRUPTS;
+    irqs &= ~VS_MODE_INTERRUPTS;
+    irqs |= vsbits >> 1;
+
+    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+                                    (irqs | irqs_f_vs), env->hviprio);
+}
+
 bool riscv_cpu_has_work(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 82430ecec6..396d9253e6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -640,6 +640,11 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env);
 int riscv_cpu_mirq_pending(CPURISCVState *env);
 int riscv_cpu_sirq_pending(CPURISCVState *env);
 int riscv_cpu_vsirq_pending(CPURISCVState *env);
+int riscv_cpu_pending_to_irq(CPURISCVState *env,
+                             int extirq, unsigned int extirq_def_prio,
+                             uint64_t pending, uint8_t *iprio);
+
+
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 uint8_t riscv_cpu_get_geilen(CPURISCVState *env);
 void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 310c18db46..250bb20481 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -330,193 +330,6 @@ int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero)
     return 0;
 }
 
-/*
- * Default priorities of local interrupts are defined in the
- * RISC-V Advanced Interrupt Architecture specification.
- *
- * ----------------------------------------------------------------
- *  Default  |
- *  Priority | Major Interrupt Numbers
- * ----------------------------------------------------------------
- *  Highest  | 47, 23, 46, 45, 22, 44,
- *           | 43, 21, 42, 41, 20, 40
- *           |
- *           | 11 (0b),  3 (03),  7 (07)
- *           |  9 (09),  1 (01),  5 (05)
- *           | 12 (0c)
- *           | 10 (0a),  2 (02),  6 (06)
- *           |
- *           | 39, 19, 38, 37, 18, 36,
- *  Lowest   | 35, 17, 34, 33, 16, 32
- * ----------------------------------------------------------------
- */
-static const uint8_t default_iprio[64] = {
-    /* Custom interrupts 48 to 63 */
-    [63] = IPRIO_MMAXIPRIO,
-    [62] = IPRIO_MMAXIPRIO,
-    [61] = IPRIO_MMAXIPRIO,
-    [60] = IPRIO_MMAXIPRIO,
-    [59] = IPRIO_MMAXIPRIO,
-    [58] = IPRIO_MMAXIPRIO,
-    [57] = IPRIO_MMAXIPRIO,
-    [56] = IPRIO_MMAXIPRIO,
-    [55] = IPRIO_MMAXIPRIO,
-    [54] = IPRIO_MMAXIPRIO,
-    [53] = IPRIO_MMAXIPRIO,
-    [52] = IPRIO_MMAXIPRIO,
-    [51] = IPRIO_MMAXIPRIO,
-    [50] = IPRIO_MMAXIPRIO,
-    [49] = IPRIO_MMAXIPRIO,
-    [48] = IPRIO_MMAXIPRIO,
-
-    /* Custom interrupts 24 to 31 */
-    [31] = IPRIO_MMAXIPRIO,
-    [30] = IPRIO_MMAXIPRIO,
-    [29] = IPRIO_MMAXIPRIO,
-    [28] = IPRIO_MMAXIPRIO,
-    [27] = IPRIO_MMAXIPRIO,
-    [26] = IPRIO_MMAXIPRIO,
-    [25] = IPRIO_MMAXIPRIO,
-    [24] = IPRIO_MMAXIPRIO,
-
-    [47] = IPRIO_DEFAULT_UPPER,
-    [23] = IPRIO_DEFAULT_UPPER + 1,
-    [46] = IPRIO_DEFAULT_UPPER + 2,
-    [45] = IPRIO_DEFAULT_UPPER + 3,
-    [22] = IPRIO_DEFAULT_UPPER + 4,
-    [44] = IPRIO_DEFAULT_UPPER + 5,
-
-    [43] = IPRIO_DEFAULT_UPPER + 6,
-    [21] = IPRIO_DEFAULT_UPPER + 7,
-    [42] = IPRIO_DEFAULT_UPPER + 8,
-    [41] = IPRIO_DEFAULT_UPPER + 9,
-    [20] = IPRIO_DEFAULT_UPPER + 10,
-    [40] = IPRIO_DEFAULT_UPPER + 11,
-
-    [11] = IPRIO_DEFAULT_M,
-    [3]  = IPRIO_DEFAULT_M + 1,
-    [7]  = IPRIO_DEFAULT_M + 2,
-
-    [9]  = IPRIO_DEFAULT_S,
-    [1]  = IPRIO_DEFAULT_S + 1,
-    [5]  = IPRIO_DEFAULT_S + 2,
-
-    [12] = IPRIO_DEFAULT_SGEXT,
-
-    [10] = IPRIO_DEFAULT_VS,
-    [2]  = IPRIO_DEFAULT_VS + 1,
-    [6]  = IPRIO_DEFAULT_VS + 2,
-
-    [39] = IPRIO_DEFAULT_LOWER,
-    [19] = IPRIO_DEFAULT_LOWER + 1,
-    [38] = IPRIO_DEFAULT_LOWER + 2,
-    [37] = IPRIO_DEFAULT_LOWER + 3,
-    [18] = IPRIO_DEFAULT_LOWER + 4,
-    [36] = IPRIO_DEFAULT_LOWER + 5,
-
-    [35] = IPRIO_DEFAULT_LOWER + 6,
-    [17] = IPRIO_DEFAULT_LOWER + 7,
-    [34] = IPRIO_DEFAULT_LOWER + 8,
-    [33] = IPRIO_DEFAULT_LOWER + 9,
-    [16] = IPRIO_DEFAULT_LOWER + 10,
-    [32] = IPRIO_DEFAULT_LOWER + 11,
-};
-
-uint8_t riscv_cpu_default_priority(int irq)
-{
-    if (irq < 0 || irq > 63) {
-        return IPRIO_MMAXIPRIO;
-    }
-
-    return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXIPRIO;
-};
-
-static int riscv_cpu_pending_to_irq(CPURISCVState *env,
-                                    int extirq, unsigned int extirq_def_prio,
-                                    uint64_t pending, uint8_t *iprio)
-{
-    int irq, best_irq = RISCV_EXCP_NONE;
-    unsigned int prio, best_prio = UINT_MAX;
-
-    if (!pending) {
-        return RISCV_EXCP_NONE;
-    }
-
-    irq = ctz64(pending);
-    if (!((extirq == IRQ_M_EXT) ? riscv_cpu_cfg(env)->ext_smaia :
-                                  riscv_cpu_cfg(env)->ext_ssaia)) {
-        return irq;
-    }
-
-    pending = pending >> irq;
-    while (pending) {
-        prio = iprio[irq];
-        if (!prio) {
-            if (irq == extirq) {
-                prio = extirq_def_prio;
-            } else {
-                prio = (riscv_cpu_default_priority(irq) < extirq_def_prio) ?
-                       1 : IPRIO_MMAXIPRIO;
-            }
-        }
-        if ((pending & 0x1) && (prio <= best_prio)) {
-            best_irq = irq;
-            best_prio = prio;
-        }
-        irq++;
-        pending = pending >> 1;
-    }
-
-    return best_irq;
-}
-
-/*
- * Doesn't report interrupts inserted using mvip from M-mode firmware or
- * using hvip bits 13:63 from HS-mode. Those are returned in
- * riscv_cpu_sirq_pending() and riscv_cpu_vsirq_pending().
- */
-uint64_t riscv_cpu_all_pending(CPURISCVState *env)
-{
-    uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
-    uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
-    uint64_t vstip = (env->vstime_irq) ? MIP_VSTIP : 0;
-
-    return (env->mip | vsgein | vstip) & env->mie;
-}
-
-int riscv_cpu_mirq_pending(CPURISCVState *env)
-{
-    uint64_t irqs = riscv_cpu_all_pending(env) & ~env->mideleg &
-                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
-
-    return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
-                                    irqs, env->miprio);
-}
-
-int riscv_cpu_sirq_pending(CPURISCVState *env)
-{
-    uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg & ~env->hideleg;
-    uint64_t irqs_f = env->mvip & env->mvien & ~env->mideleg & env->sie;
-
-    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
-                                    irqs | irqs_f, env->siprio);
-}
-
-int riscv_cpu_vsirq_pending(CPURISCVState *env)
-{
-    uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg & env->hideleg;
-    uint64_t irqs_f_vs = env->hvip & env->hvien & ~env->hideleg & env->vsie;
-    uint64_t vsbits;
-
-    /* Bring VS-level bits to correct position */
-    vsbits = irqs & VS_MODE_INTERRUPTS;
-    irqs &= ~VS_MODE_INTERRUPTS;
-    irqs |= vsbits >> 1;
-
-    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
-                                    (irqs | irqs_f_vs), env->hviprio);
-}
-
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
     uint64_t irqs, pending, mie, hsie, vsie, irqs_f, irqs_f_vs;
-- 
2.43.0


