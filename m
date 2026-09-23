Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7C4C9830B
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:13:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QWK-0004Gz-LG; Wed, 23 Sep 2026 13:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWH-00047s-EI
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:12:33 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWF-00018g-Il
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:12:33 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTYav595297
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cPI4u8D2Q9v1+gVhdHXRvH7AunA7t3f8oFHcIsaooIc=; b=RlHGiP1sPjt6raDb
 5g4UxVyePqgD3anuIE0//FmTjsL6VSXtuZ1nDvG23KgHtYQWvhYS99ILMB57e98/
 //KNBbynArxiTSVIpbs1KX0kjU6VgdcQAeC+1ZBCapbynJqIuDa8KexUea6dWtyP
 fc72xpOh3YuXkbMd8dFse/yL9EJsu7UGOibg/5IRT850H1Lcg8zVZQXvsZSUhFNh
 +H7XFQtUKHsrtTo8qUnZ5SH2dXMmstc5Ztao6s0VHLh8WRe2EJ/KMguXzrbOeiFD
 s8MJUAkleXGdBEHPDAKjUgviZH7DdXv+fIur5rSNy/VL1c/qTtHshGR7NSDlytK0
 3lznqg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxs3dq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:12:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-78580a6b2fbso458183137.3
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183539; x=1790788339; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=cPI4u8D2Q9v1+gVhdHXRvH7AunA7t3f8oFHcIsaooIc=;
 b=RoTQGvkgd3G7FF9rcw7VbjI0J3JM1YHtNjuPZtYBoxnCu1dXF795xILFlviRsSI+IA
 ARuqUHV0eRV2zujc5eKESpR6ZqB6m+wNuL/qHFsKjfQVu24fNJKohjk1D5qxmtepKYoY
 wo6Sm6umAek6G3pqbR4Llb1nHxyDqvIUAaTTjmxNcDlFN3VbyjpwJD+bjU7mY8H+onkU
 cMLoxTg23RdiRTj+8TC0UZMdM0kKPLb+kvmELQiw2e8ygJ+wSp6Yu0Cvi5wZW0oswvku
 vQC2nfeP+A0ATjEPZNiXmEh19W01TiTzWgUkLXq6E4CXtIjrpdYqaRxAoFuKGKw4Auud
 jjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183539; x=1790788339;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cPI4u8D2Q9v1+gVhdHXRvH7AunA7t3f8oFHcIsaooIc=;
 b=nHFdXS744t2cwqGJmAHWGRKZCFUgOZuu37P+JEQra8KWhfZviO4VtOY4fUfpUkOSJ9
 ijVOdydIzLpi+0pgqNb+lGM6fnuPwqdzcgFlyKUpk8VBELAm46INgSy4J4fEOnc/LdCY
 k2fzKxdLfWqhs0pCPCE4doSMNujFQGCLp0pp6qljG0qZ2v60hh+Sc/sLKBovvjzUuUYa
 4DNZp5dEuRsyFssk8Araw9fvP2IlYS1wldtSAUVUvGZAqdgagJc+t3tIpJlv6K9YqU2s
 655irop+rgW8A1nTHkUkRB2xroaF1CD701zvMHeKzdbb78u334eA9Z8h5aHW2JEpGe01
 Yw/g==
X-Forwarded-Encrypted: i=1;
 AKwUvByGTpRKMAYhtf81bHtFVF8bkbonMY4WitCVQGYh42s3pYHDH3X9nEl4I7xeI5pX6zQrFvMULtcppRMX@nongnu.org
X-Gm-Message-State: AFuF++k+a5ulcNAqc1bZtwKU4AdAjlRBMOvQEG+TbnibrQyYnApiQTBS
 rbo8sjLCldn7o0EhwRCLB3NH3ANTuF9biuQASDXGUjWITprcydhKwarG23SBWIfVUakPW2F89yo
 GoBNJxegCvU/yA6xc07+CeuLlZLWH6mMQGHF3BrTb7gJiOLDbauJJJbd3ig==
X-Gm-Gg: AYBFou1HB3bZlKd27nKMCe+smHo3Hp0xE2KFa47f7OqbzGZhyUxmx1BLWSOJ7A1HvD6
 vp3InqxySZLgBAdp6mCgobfptn+GfcayEoyUPopBmlDVZeP/GrkcV9jGXfBvLCXSxqUX2Bx4xTe
 pt3TlXmWlD0r7C9Na+2SNFzGsmSJtqMd2pMjs7MrHC8PxGdq4dGXWi7TGt48r81M4fqu4k9JCqr
 Rjm8dfS/MiSzHdTRYjEpeQpE+JVgDEME1Vd0iP3HIJkVNHui98srpqWJ11h9AtQHeLBk+IvtjxP
 jQ1uPHqk9B52dNmN0IyrqO1OuXeew6PpjVLfraehPpxPnieJBbnlOyPt1thSnIIsl5n7xLEBngY
 Jfqmb9S9/Jl/sfjWPep1bagM+CLqjv8HbHM6/mDu7
X-Received: by 2002:a05:6102:390e:b0:79c:99ea:2c9a with SMTP id
 ada2fe7eead31-7ac1b61699cmr3225450137.11.1790183538973; 
 Wed, 23 Sep 2026 10:12:18 -0700 (PDT)
X-Received: by 2002:a05:6102:390e:b0:79c:99ea:2c9a with SMTP id
 ada2fe7eead31-7ac1b61699cmr3225434137.11.1790183538621; 
 Wed, 23 Sep 2026 10:12:18 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48868486461sm8168991f8f.8.2026.09.23.10.12.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:12:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 08/21] target/arm: Access PSCI state atomically
Date: Wed, 23 Sep 2026 19:11:02 +0200
Message-ID: <20260923171116.31276-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RAbNiWnUpBTvhTtUp0eCeLBhma3WpvFs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXxoV74dG8LVMz
 EEJdxkzKTHb4XlWVy/DMb2c3L5dGspy09sG7Z1Yqf6S+wXZTS3SAC+dSAsX4mITHV/3iCyrX8Z8
 YWG5hD5f8Ez6gw9irxi0wxYgFB+bOIx0RC9wszrGaIwxMvMLiMvuFBr8uG/Tz3MGnxheZ7ycOuD
 5xokGizGc/hVVzl5aZDyIpI62H1qT+4gNizmLHBwaNubCNi+yvkkgIk5buSH5w7Hq10LAjhQYB2
 SuxNsAIP0qVdk+KaOP57r/wXO4pHJT8nWdnHC9yjbZ14Ac4FtSCKqkHYH1Nv8vfSdDC3f4ydfrz
 8jq83b1V0mhcRrHqSfbWfmn9yeNowjNvwhMwhKkZbgi7jaPRgfOFXbpPKUVK3VFDBLMVxb919A9
 DD5Lh/ciZfuvVl8TvsJ3hEhE0B8EUUxGJ7v7WnT4qVOzYgPom+WfRAQn2v/0lXI/tc0lrV0K84r
 Hned+5NUY0OJRzWkP0Q==
X-Proofpoint-GUID: RAbNiWnUpBTvhTtUp0eCeLBhma3WpvFs
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab40874 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=MMc1H2EL_fK9NYWBrJgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX0+xcEsxHpsUR
 97KreFyl9YIB94lhZL0YbSUfn3VTkiS3jiDY2fEddc0F5czcKsqp30clhYx+xYAOIi27HnIdJS/
 iC7cdaowqbqNUX98WJYZtkIigsaw8sA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Use qatomic_set() when updating ARMCPU::power_state and
CPUARMState::halt_reason. Read ARMCPU::power_state atomically in
arm_cpu_has_work(), which can run without the BQL held.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/arm-powerctl.c | 5 +++--
 target/arm/cpu.c          | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index 1bd8a549cc9..fcac26d9190 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -50,8 +50,9 @@ void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
     CPUARMState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
 
-    cpu->power_state = state;
-    env->halt_reason = state == PSCI_OFF ? HALT_PSCI : NOT_HALTED;
+    qatomic_set(&cpu->power_state, state);
+    qatomic_set(&env->halt_reason, state == PSCI_OFF ? HALT_PSCI
+                                                     : NOT_HALTED);
 
     if (!qemu_cpu_is_self(cs)) {
         qemu_cpu_kick(cs);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 76aa47ac503..5cfd3bcfc8e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -149,7 +149,7 @@ static bool arm_cpu_has_work(CPUState *cs)
      * Only another PSCI call can wake the CPU up in which case the
      * power_state would be set by arm_set_cpu_on_and_reset_async_work()
      */
-    if (cpu->power_state == PSCI_OFF) {
+    if (qatomic_read(&cpu->power_state) == PSCI_OFF) {
         g_assert(cpu->env.halt_reason == HALT_PSCI);
         return false;
     }
-- 
2.53.0


