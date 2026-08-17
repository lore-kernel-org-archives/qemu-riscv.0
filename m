Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C95C5B572
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 16:04:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvzoX-0002Ah-6t; Mon, 17 Aug 2026 12:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1wvzoM-0001vR-C4
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 12:03:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1wvzoK-0006x5-FG
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 12:03:41 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67HFZ0VJ2666635
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 16:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IN5d9diPA+5
 gtrEwQvCPi+67EjQ5+TqAioWBC9q16SA=; b=dWudoXbeTu15o58jemUaNumu6lj
 R0F5zWc5BD8RHQFCRi4n93hlf2hVhyC7ztk+ZwUGAU58I3G0NzErF0FP0cwKZI2b
 zlLfSfU8WEARh02yzHi5aeE6otqMDcAow0iAXjKzPRUMqGkQQrckrJabIicQg2AA
 t4dDmV7xyH2HRwO3aGLRNrVuJUMInucvn17Z6aeyemMIIAA1I1Yxx9XBuLmkKgM5
 2/tvxaBcvIaPmG1EzcgTwtW70rXG37fNg4x8DmzPABa3aD1Wq3TIJUIXf/jwj9cu
 AdHfEaE6I2QWTwOUeNaV9d3b16ft96AYgRbr9i6q67w0dXD7xkDwJBvYoeQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3vghtgsa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 16:03:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-84e1da97175so4538408b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786982618; x=1787587418; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IN5d9diPA+5gtrEwQvCPi+67EjQ5+TqAioWBC9q16SA=;
 b=Sl4rVid/7nd7LPbGVYwvaiI9YqMX7v9FhTc+DPXy7OWHyuv2dGq3qd4AIZM9P63OPH
 9OVCTfU0RoAdCzupvR1MhwF7F0ob7oy+/jzxK6IYS8RHAoD0qGWnGVtTiT3rOj0vb+5O
 vxELaABQGxcSSrCCVTWBW6UA3BkWFhQ/Dw2kVC/5uUQIbDVA43PEfq5Nn5YJi2MO/7ra
 1rVcwWOuhV8bNp1d+7eDnQGe8B1DgF0SeJL3PgToHAaNnw77ZrGnMuwXQiyJ2P+MQICF
 mFwiPm6umi4rVNhdFckp5bhZqHyZCBqjlfU2HOYaaLA0BYXCHSu84peUGfxwye/FUoQ5
 k45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786982618; x=1787587418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IN5d9diPA+5gtrEwQvCPi+67EjQ5+TqAioWBC9q16SA=;
 b=U7R/qJM1ODiASfIxYE4/eyqsCR22TeSxyD1Gl3SCCRVVU+AvvmZE4gHycumJ4dptsU
 B/ByAs6OW85GLPvke/Nmzg5UsnYK0SWxyO+J3iRxq7OcfsIO3PnH16YQGomkwjVy/kfg
 bhMOXFGzF741Fzi+SeRQXXIm6ABuGr/2WB4e42orawozw19CjUEYCqs31nccqvGXyhC8
 b+sTLrPHtGy6CsyntsEE7vr/U+VJhyx8rkXonzHEERRyZFzHVwod7LCK0K/BzBB5VmIn
 3KarjWVGc6XwS0eOAwHaeOkdglqQvUKGvJKWwVMio/yRws1LHCrH23zbJ1s7Qo6qEPlp
 LNlw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrdbRq/oTzUOaAQoGGuXyIzreNwIHE1vMQSbsY3LDj4VUCSRQlY3QLoQX/QNKw2MFd+A1HoRBBdDTzy@nongnu.org
X-Gm-Message-State: AOJu0YxkZw30azmy890PxBNZa0FVoBzc1GVNtoTZFp2s3QDaKebQjbf0
 VZMJQZlKtx3+GQMTnFLbFpcxXAFKqfw9ON/361JC0miFhB4Q7xrTfWFGupC4/np7s0DNOqATo1K
 NYIkjrohFZRXXPZSbikqD6IOcyegtp9+ZTTkbI+Szsif4XGi2SI1guW9SmA==
X-Gm-Gg: AR+sD10/TggUcnUoJaKc0kos0jf8hmHuq6TFloLeYESy3t99U6MO6XKbLLIEYD3sgWT
 LUivVyNSVvOGDMDn5ULWORwVPeeu0FJweeI3F66HtpJmhISblDSqs6DdZKzXpmfTL2cYMiLV1Xn
 /7McA8l9Om5KDOsUNewYpQPUr+kpK2BvxFVamssEURnWOZKlVAvmfqbS437mtsoDvte9HHNo/32
 t3qsJ2JdbGLnjqZtGBKq0kfjrky5F+Ow9TCSv9282KO8RPtzf1MhG3Ttej+Lmwtu0jrvQI6Tvt4
 /r8lWkjvzMXHuDYKTivVj4SpB5oDuaHTxnLlXLX/2z17Mr+tHlowLHJoJEoGJqSw/aTzS4vsbT4
 b8g+ASlE8FMRN0EI/QYBLBpYnXiHfUcFi/a8osM9ywsAyOXN5GZMh56j9kDqvT9mOwE4CPCk/bH
 kRqyOL0GLCeJe3LCGLLNEd9rYqAg==
X-Received: by 2002:a05:6a00:10cd:b0:847:982e:cca0 with SMTP id
 d2e1a72fcca58-84fde1fd916mr24445363b3a.19.1786982618337; 
 Mon, 17 Aug 2026 09:03:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:10cd:b0:847:982e:cca0 with SMTP id
 d2e1a72fcca58-84fde1fd916mr24445287b3a.19.1786982617735; 
 Mon, 17 Aug 2026 09:03:37 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-851b6f8c0f6sm545923b3a.39.2026.08.17.09.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 09:03:37 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] target/riscv: Capture Sspesa sample PC and counter ID
 on overflow
Date: Mon, 17 Aug 2026 21:33:17 +0530
Message-ID: <20260817160321.3313698-3-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817160321.3313698-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260817160321.3313698-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=6a8330db cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=DHycWIkPxntEYEsfrQ0A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfXzCBUa1jrNzDZ
 SE5HcVKH6PLSGbeputNl8Un0QP3qA83cYQckyLl87dHxtaPQbvgvdfJ0Ky4Vq4fc2wJx/1MblDt
 +a3ZQTKE0rfu6ZYHVY1uiGU6JgZsfEU=
X-Proofpoint-ORIG-GUID: 1ybULo-JoyydYy3FpoLV-mZf2-VkrFik
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX3jEH5Ywvml1J
 TPXAt0FYlJrR+LaQUtUxFHiHQf7dnfxSC3JJDSwMKyeW9E/q/mirf8puzqRmIZRLZXFEGCqqT4D
 LlWa81eHYT+RnVD4cvcmgQaAK3SpeGr+YCJXoZMdV6RY/HnUG75II4vGOO9lCa7P7VHNjzz/aP2
 77vCMOZtwnWW9H12Vifn86UpXT/3Kmda2L01xXfU7w1ZikgBOvFsZ2pkxNp2VaHiUDiP7goNs+L
 2HpDRQ+WfTT1aTw30UNi2suTWj2C974veuyO2vF8lnEgVTTscJ5Y9TFWDHuBnqQZPwqgAJ5uF+D
 SZjBNijZlbStwgZ+44Vaqj0jAyxq8+OrBQJbIK1BlXshJxGvaTKRPr5Y9haPhitdUuwsYLZb2vp
 jbQDbweEgGmNLeaks7tMqun9d+V5RsokotHQVcZe4MNdNyguBApQmTgtgrvpGCGMRT0y8CVhJuJ
 cM9AIxPMIkdy4qxBxmQ==
X-Proofpoint-GUID: 1ybULo-JoyydYy3FpoLV-mZf2-VkrFik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170123
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mayuresh.chitale@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On a Zihpm counter overflow and with LCOFIP asserted, record the
overflowing counter ID in shpmsdata and arm a capture. When the LCOFI is
actually delivered, the shpmspc register is populated with the address of
the interrupted instruction.
Capturing shpmspc at LCOFI delivery (rather than at overflow time)
ensures the sample PC reflects the correct interrupted instruction.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 target/riscv/cpu.h            |  2 ++
 target/riscv/tcg/cpu_helper.c |  6 ++++++
 target/riscv/tcg/csr.c        | 25 +++++++++++++++++++++++++
 target/riscv/tcg/pmu.c        | 27 +++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fe56a6afd1..36425c3605 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -473,6 +473,8 @@ struct CPUArchState {
     /* Sspesa CSRs */
     target_ulong shpmspc;
     target_ulong shpmsdata;
+    /* Capture shpmspc/shpmsdata only on the first overflow */
+    bool sspesa_capture_pending;
 
     /* Sstc CSRs */
     uint64_t stimecmp;
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 07d9222652..15af3262ed 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -2255,6 +2255,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         sxlen = 16 << riscv_cpu_sxl(env);
         env->scause = cause | ((target_ulong)async << (sxlen - 1));
         env->sepc = env->pc;
+        /* On LCOFI delivery, latch the sample PC to the interrupted PC. */
+        if (riscv_cpu_cfg(env)->ext_sspesa && env->sspesa_capture_pending) {
+            if (async && cause == IRQ_PMU_OVF) {
+                env->shpmspc = env->pc;
+            }
+        }
         env->stval = tval;
         env->htval = htval;
         env->htinst = tinst;
diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index ea49d28aae..e48c954359 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -1228,6 +1228,15 @@ static RISCVException write_minstretcfgh(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static bool sspesa_is_captured_ctr(CPURISCVState *env, uint32_t evt_index)
+{
+    if (!riscv_cpu_cfg(env)->ext_sspesa || !env->sspesa_capture_pending) {
+        return false;
+    }
+
+    return (env->shpmsdata & SHPMSDATA_CNTRID) == evt_index;
+}
+
 static RISCVException read_mhpmevent(CPURISCVState *env, int csrno,
                                      target_ulong *val)
 {
@@ -1259,6 +1268,14 @@ static RISCVException write_mhpmevent(CPURISCVState *env, int csrno,
         mhpmevt_val = val & inh_avail_mask;
     }
 
+    /* Enable the sample capture when OF is cleared for the captured counter. */
+    if (sspesa_is_captured_ctr(env, evt_index)) {
+        if ((env->mhpmevent_val[evt_index] & MHPMEVENT_BIT_OF) &&
+            !(mhpmevt_val & MHPMEVENT_BIT_OF)) {
+            env->sspesa_capture_pending = false;
+        }
+    }
+
     env->mhpmevent_val[evt_index] = mhpmevt_val;
     riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);
 
@@ -1289,6 +1306,14 @@ static RISCVException write_mhpmeventh(CPURISCVState *env, int csrno,
     inh_avail_mask |= (riscv_has_ext(env, RVH) &&
                        riscv_has_ext(env, RVS)) ? MHPMEVENTH_BIT_VSINH : 0;
 
+    /* Enable the sample capture when OF is cleared for the captured counter. */
+    if (sspesa_is_captured_ctr(env, evt_index)) {
+        if ((env->mhpmevent_val[evt_index] & MHPMEVENT_BIT_OF) &&
+            !((val & inh_avail_mask) & MHPMEVENTH_BIT_OF)) {
+            env->sspesa_capture_pending = false;
+        }
+    }
+
     env->mhpmevent_val[evt_index] = deposit64(env->mhpmevent_val[evt_index],
                                               32, 32, val & inh_avail_mask);
 
diff --git a/target/riscv/tcg/pmu.c b/target/riscv/tcg/pmu.c
index 38ad2737e1..337e255da4 100644
--- a/target/riscv/tcg/pmu.c
+++ b/target/riscv/tcg/pmu.c
@@ -147,6 +147,31 @@ void riscv_pmu_update_fixed_ctrs(CPURISCVState *env,
     riscv_pmu_icount_update_priv(env, newpriv, new_virt);
 }
 
+static void riscv_pmu_sspesa_capture(CPURISCVState *env, uint32_t ctr_idx)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!cpu->cfg.ext_sspesa) {
+        return;
+    }
+
+    /*
+     * Only the first overflow updates the sample CSRs. While a capture is
+     * pending, keep the lowest counter ID as required by the spec.
+     */
+    if (env->sspesa_capture_pending) {
+        if ((ctr_idx & SHPMSDATA_CNTRID) <
+            (env->shpmsdata & SHPMSDATA_CNTRID)) {
+            env->shpmsdata = ctr_idx & SHPMSDATA_CNTRID;
+        }
+        return;
+    }
+
+    /* shpmspc is latched later, on LCOFI delivery. */
+    env->shpmsdata = ctr_idx & SHPMSDATA_CNTRID;
+    env->sspesa_capture_pending = true;
+}
+
 int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
 {
     uint32_t ctr_idx;
@@ -191,6 +216,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
         /* Generate interrupt only if OF bit is clear */
         if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
             env->mhpmevent_val[ctr_idx] |= MHPMEVENT_BIT_OF;
+            riscv_pmu_sspesa_capture(env, ctr_idx);
             riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
         }
     } else {
@@ -383,6 +409,7 @@ static void pmu_timer_trigger_irq(RISCVCPU *cpu,
 
     if (cpu->pmu_avail_ctrs & BIT(ctr_idx)) {
         if (pmu_hpmevent_set_of_if_clear(env, ctr_idx)) {
+            riscv_pmu_sspesa_capture(env, ctr_idx);
             riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
         }
     }
-- 
2.43.0


