Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E470C55ABA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 18:26:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wrgJU-00009c-IL; Wed, 05 Aug 2026 14:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrgIu-0008VM-98
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 14:25:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrgIs-0007ed-3q
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 14:25:23 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 675HSH0C3889904
 for <qemu-riscv@nongnu.org>; Wed, 5 Aug 2026 18:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=zpTq8m8yans
 XiuzePHJBQKT4ihkudLV2rjyap1lEZfQ=; b=FfP94iKZKYomcRKfZancagW0xjU
 gU7yhJEx+eVtes6b4vnVmQ48XqyV2gfwp7S/geEB7d5gly5ZDAeGZzTNaxu9K3Yw
 Ox/DBb4fZV7D5sLnOysdHQd6Qm8QUunRtXTygqzs9FEih3WrAAc6nMyue1PuL3ft
 RSxA2a8CpJtWhHnAtixCpV/J4bgmkGEWjrTo4T69DiazX3nuI0XywixkznnWziOk
 +g7GMeh0a+m/27buZoPrVMsiv10h3KZ3UHx0cvaW77F4ScLlI7xSQurxYeT7FvJZ
 7A5ARfVS5ebjj2k3Lx+woUd6EJDGe8sLMZvDuLPRsE34z/OKnNg3sSwRv0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv14waxa1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 18:25:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92ac0a54110so135887485a.2
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 11:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785954319; x=1786559119; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zpTq8m8yansXiuzePHJBQKT4ihkudLV2rjyap1lEZfQ=;
 b=SXzWHXCh3fz8jQFVrbxYoUgWYZMcOq0pvFuLn/4iFrbWErIMZtuDsbbhqtxwyVo6Rh
 ePDt3NYo9VzoTJpmJJIODSIi89tvWwRIDq2myFm85LXcP1v2sCDBgWrx2XKRHBLpp1iQ
 P6C7v0h34bJJRupTjd6nATzbFbXSGGXQ60d3LKJgZGx/JFWBri9il4ImgxDgtgYt2HZC
 Sxahu8hiGa9GDPaAHhCfke4I/EV/g4nVq8ubnPf99F+NeNC9RbvScHrAN/6tooDb5BFX
 nrAHMn8IiW7t2C/mdCVUyRDFNi0fUAqlgB1Fg/8bB50BgF/tcU7qS3F2bneFhc6S3MW6
 NeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785954319; x=1786559119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zpTq8m8yansXiuzePHJBQKT4ihkudLV2rjyap1lEZfQ=;
 b=dOt1A4lyVBf3BcfFxIfPpU2YnKo0aPQsMNeTp1mojIUc4FpUZ96E43YB2Az8MufJ9e
 rQENG+pKbCNXYg0X6oW5QzTCQG5WX0Guu9dxVMw0GHZSYXPR+AbavlQI01PSRfH5aisl
 iO2ItR+SFde1ulpdxeENnU874h7geUq58cnoXG06svInPkQFJKHU5uWjIgcQ+NFSbtVt
 ZbSp7PNfH8EmnxN/UHOC6Oc1ZAaj+Pf62IoF+Xfzfxrkg+7AWsd1LE1F+BT7hTemJy99
 XIeU4bEKdrKs2C5i6PruSpKttBjf89lAyt+tBYG/RSjxhGjtFxEeG/ZYCvN0BLhAqn5K
 hyWw==
X-Gm-Message-State: AOJu0Yw6XUb87phla14A1NdKLg6MJXYrhW6DswUbDia5Rvc/gglldt2i
 ONX7H/UjjjwZgGXXoaemm6OZj6wxAshsN8GuJiIQIbr6XMls3JhKlanl+yO+mNwjHOU+9agXvgy
 RSG+Fo8xJ+ROt7ebau789rvowcj56IApsBN60mk6NzXzODJgWnOy9DtCrqw==
X-Gm-Gg: AR+sD10NVGr+4EkKDL1CtF39YAv3RZnlVxx9tifQEL4+Y3A73pL4hzqV2kbIgTGYI5W
 0l0oqwhT19KPDETl9MmNHdonlzGrPbdFxs3ELD+SBalPiG5wJvjyspoB2bE1hdVJJfk2ZRfAY8C
 A2euaH2shXSWkaVRD97nzbFuxQMSMmIsG3dw3jEGaK2h1E/zueMeKQMxBJp6KdBhCk6SnxBYhru
 /NvLTbTLavMYePF/3z06oURIsdCgd82KjqLsxfdDhlw/AGf3B1ngsXGmOWeh86CIKFdraFyu5kN
 oVASC4NLPj8ZlVSK5bo1k6fF1rypxUW6anvD9k9CPMgBPvCYM124UzvS7fvn3itXfMd8o3YM1oD
 bRBaJERSJTRCqAbf4Z/LzvRhTkjlYiBKt6ii+pQ==
X-Received: by 2002:a05:620a:2616:b0:92e:4927:1ff9 with SMTP id
 af79cd13be357-936491302dcmr860160585a.40.1785954318794; 
 Wed, 05 Aug 2026 11:25:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2616:b0:92e:4927:1ff9 with SMTP id
 af79cd13be357-936491302dcmr860150985a.40.1785954317968; 
 Wed, 05 Aug 2026 11:25:17 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9364a3fc901sm209387885a.6.2026.08.05.11.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 11:25:17 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 2/5] target/riscv/tcg/debug.c: add Debug 1.0 'pending' bit
Date: Wed,  5 Aug 2026 15:25:03 -0300
Message-ID: <20260805182506.2943757-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805182506.2943757-1-daniel.barboza@oss.qualcomm.com>
References: <20260805182506.2943757-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE1MSBTYWx0ZWRfX/cN43uEmdQ7L
 Mlkynh8w6NzBo92QBJ+AG1KTM4pA2JY1yRf/i3Aw0mli9KzV39F6A3SmdPl3WpHJ3knGPgGfDf6
 QZOpA1ETN0nfKDkBoVxol7tuPdvT6iQ=
X-Proofpoint-ORIG-GUID: TmalCMZ7T5K9ek9XamFnnZik1u7X4f-E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE1MSBTYWx0ZWRfX7OVeh5adiP2Z
 7aR7XcQwy9bfXLrz9hYTQZ8R98wVgK3JV0TKLGn8Pu0iKhjB2CBN8dlC+iC0fQm6JHco7XLPVSo
 09NNQyfOdJ/b1LQQJxPrv3POHSf8sXdxbiCtj0gp36Rxn9/6ChVYVynkFx3IlbWBwzag7kZ2he+
 spbpUm5osFh2r4HJgaMMlbZxwRfbQePcM+a8DLt5CgWk+iMBs4WnDrWAoLsLrcxNM2U0R4yl3Cr
 nNkctf1oih5Q++MiZDucKT7K3Cfy3RPNAcurx9vA8GXTQxhzi6mCbGMH8dbMV7o+8dZ33KRs7f1
 u9XjY4PtcqiyqpLROhJgvLoZ8odd4GXVLs6XgFWrMTOK2xG1Niu8nB+yDa8yY1GBZPDHYoklPUo
 npP5NxkEem1IzPS0lViAPSlEkcCPkhhwqpiftiReBXkTv5nSzpVzayymBNA1tWJ4jEiKPpWBCzx
 L2upe/qikDCgNuQoRUw==
X-Proofpoint-GUID: TmalCMZ7T5K9ek9XamFnnZik1u7X4f-E
X-Authority-Analysis: v=2.4 cv=Cu+PtH4D c=1 sm=1 tr=0 ts=6a73800f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=MeNw4mndUgOD9sKrnOsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050151
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

We need to set the 'pending' bit when 'count' reaches 0, clearing it right
after the trigger fires.

This is 1.0 exclusive behavior so no changes are needed when running Debug
0.13.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 3c0fe70101..2191928761 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -77,6 +77,11 @@ static int access_size[SIZE_NUM] = {
     [6 ... 15] = -1,
 };
 
+static bool debug_trigger_version_1_0(CPURISCVState *env)
+{
+    return riscv_cpu_cfg(env)->ext_sdtrig;
+}
+
 static inline target_ulong extract_trigger_type(CPURISCVState *env,
                                                 target_ulong tdata1)
 {
@@ -684,6 +689,17 @@ itrigger_set_count(CPURISCVState *env, int index, int value)
                                    ITRIGGER_COUNT, value);
 }
 
+static inline void
+itrigger_set_pending(CPURISCVState *env, int index, int val)
+{
+    if (!debug_trigger_version_1_0(env)) {
+        return;
+    }
+
+    env->tdata1[index] = set_field(env->tdata1[index],
+                                   ITRIGGER_PENDING, val);
+}
+
 static bool check_itrigger_priv(CPURISCVState *env, int index)
 {
     target_ulong tdata1 = env->tdata1[index];
@@ -735,8 +751,25 @@ void helper_itrigger_match(CPURISCVState *env)
         }
         itrigger_set_count(env, i, count--);
         if (!count) {
+            /*
+             * From the 1.0 spec: "When pending is set, the trigger
+             * fires just before any further instructions are executed
+             * in a mode where the trigger is enabled. As the trigger
+             * fires, pending is cleared."
+             *
+             * And: "This bit becomes set when count is decremented
+             * from 1 to 0. It is cleared when the trigger fires,
+             * which will happen just before executing the next
+             * instruction in one of the enabled modes".
+             *
+             * Note that itrigger_set_pending() is a no-op if we're
+             * running debug 0.13.
+             */
+            itrigger_set_pending(env, i, 1);
+
             env->itrigger_enabled = riscv_itrigger_enabled(env);
             do_trigger_action(env, i);
+            itrigger_set_pending(env, i, 0);
         }
     }
 }
-- 
2.43.0


