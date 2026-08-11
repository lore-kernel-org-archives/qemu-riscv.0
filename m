Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2211C5B56A
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 18:35:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtrJb-0007Jm-NQ; Tue, 11 Aug 2026 14:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJP-0007Gu-Pq
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 14:34:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJO-0002X0-9f
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 14:34:55 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BGNwxT1490924
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 18:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0idV0Y0FQ0rdA79Ll+RTIzajE1tmGZqrGlMbn9c++Vw=; b=Tz8u2WDkxr3uN8qi
 GOewG40Oie4BM6+9iR35R94uCboF6wDBSnuSWEgNXPufnIVQKs7VIlWCngHlw7Sn
 qkJMhwIWzEYDtpHXWnNmSFlD+52LHtguiZ6XCrs6J3ra2vVKSQQzsSTXpRTddr+F
 qOzqbc6gg54YpQmBG9TziC2Ztz7d4xuR0RYL1zCspg9PWwzqi2zY119SKilC1rsq
 i0HO6uXiFqd/niT1Kbfhv0mrgI9f+Sz6NYVrs8SK4TfhWqhlAZjJj1Wf4MTNgtux
 m4oo78gd6DktIPw0k/9W4t3lgU+/90XGdapiHwRauRR6OOgRwaEoWtbYz+42ZyLz
 ibf7lA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049eshuu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 18:34:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c083f1818so2914101cf.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786473283; x=1787078083; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0idV0Y0FQ0rdA79Ll+RTIzajE1tmGZqrGlMbn9c++Vw=;
 b=LXwkbEOrrIBBsSlJdwSKio1jYFR/RfQzP9w70xIQO17TJuPkjJvgT2JbvGp6ZbRYZK
 HmFRwlsWnJde7FdzP0N7HbfH3Dh7fkUHAPOoeyPcWYgzhweYoTVo9zjsDfgFqdthQdFI
 8ULCOMORI06yySJ6kxVpI0RCY7783T3mEUnxvKH6JXgJQ6RK13EKnunIWeB6ju0n3k3Y
 m4O7jmSJlPjjzm4uZiPbJczLfinBJUct3e5s6ECdwuIvtPy53Gpr7Oof8RU2qx0PDC4C
 UocxG4xTQ3cHFJ2xLMpZxJUDXj7cb/aCJDMD4oc4NNk65s8lEqsL8yvUnHLMQow9ZYZo
 c8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786473283; x=1787078083;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0idV0Y0FQ0rdA79Ll+RTIzajE1tmGZqrGlMbn9c++Vw=;
 b=smUA/VfRE6DiSNvpvFX3kwO2AW7uYtygqs8ssQqG8//XDFYqWz+SXexgLUHnosD7T4
 HXUBNoB1oi7alb3jlmMOVfc1d93gxrdwvnpspbZGI78AdJZUVvMyM07z0XAQXmEiEkp1
 AlAz+SMYaXBJZlY95UYKkzNuIamqnFvhVGvXP8SYfPy++7n/cS2CDCEMSyN8eV9B+cIT
 iDEqVgQh6qHxV3NZ9HJhC2gCsN+Tk37Eolf0QBt+QwUDQjqs2FH28TIPqRbBaIV1sz4l
 w74NHmJZ+Dud0jO5EzqJQTggXidOBtlMp86nY93uMWhgri3CQo8kBtpBah4eHKHONmgC
 jYsg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro2hukTjMgdfx2Zxpa2cuXxqZd/fVOiJNrnCl7XUsq//QoaN0KaVflOPF4NBUPVbRUIMtKA7ar/xmqW@nongnu.org
X-Gm-Message-State: AOJu0YwAYkNdluP7VzuNexlInpDYw5oZlRhmKkNM6U7/nQrLuc5I75az
 ujz9r2V4p9QSoHZ6gki8F16JUZuA7Owk9qH4IjWGxmBzQy72TFOGUvs+SYLShJLBvqYOZwhOhg/
 Z2i+L3vg/Uu3l10QWp75hKhjhceK6xweZ8E32/d7yGUSSzrTAHw+llTh5Dg==
X-Gm-Gg: AR+sD10kKEntXT1j9ShfzUIfgfgFPiaYrVEtx0YqlLQEy//niQK/Ao9NXoTaoqDMPk8
 2heQkuwYCHmPtoM8OEpL0WcKGdTYgfGuHdildoKq8VdtYTD1IO9Wd0I444/yO/gTXfVytRY/Gar
 xb8/retc+L8ObDyD6KEcBJVwoLrmoUfu05bJ5BednyZnjvUTvB0xuq9CyzxqQ1uB/2JV+uquKVc
 +z9lnB14R4yzpsFADhYRZuf7YlfhZRAebFcMfty2sbmS8yH+Emhx+cITN4BEh1Y93CrxSmqZkg7
 bbgexj8d1XngoMeWEjzkyvMkmxAhXHek3hCG21eoQpMM7sMWg8wUYjQS/Zojme8c+GADsrDDFRx
 x5HUGUQekD8/pCN9cniMUhxeGRbgN6jMTf+zVIPcqtg==
X-Received: by 2002:a05:622a:5517:b0:51b:f640:2a4f with SMTP id
 d75a77b69052e-52d584a8c47mr53649871cf.4.1786473282749; 
 Tue, 11 Aug 2026 11:34:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5517:b0:51b:f640:2a4f with SMTP id
 d75a77b69052e-52d584a8c47mr53649221cf.4.1786473282237; 
 Tue, 11 Aug 2026 11:34:42 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d5ecbasm299929f8f.28.2026.08.11.11.34.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 11:34:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 4/8] hw/cpu: Rename cpu_common_realizefn() ->
 cpu_exec_realize()
Date: Tue, 11 Aug 2026 20:34:06 +0200
Message-ID: <20260811183410.22428-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811183410.22428-1-philmd@oss.qualcomm.com>
References: <20260811183410.22428-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX5kvreBG+IVLG
 TK4imDQg9/0PLcMLJDuDMrUqkW3qlExGEnJanaf8ZYsXI7K2haasx11ICflKLvVGNZkUlZsU5qk
 Is82UuWgsC37yC4t3MyNCl7JijksFjY=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7b6b43 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_LLhLsGey2oFb-bfptwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: VYhFDN6v9vYHhIVa0_Eh7OdNP-MX9S4N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX9EFBLv/PsYt+
 gLVltY4sPgbO8TifSPG2aE5AD7wozmrPS16vuFIYRL88pemQHdPXsvV4gyKzLCwB2BbMm3lolrR
 +VokSodO3F7wBXsuR6ah/n59qq3zmE1riUBDlievuO6VH2KiBHC7FJN7d+2ggNNOjKkTqVcnhBm
 Bzt0H01J4KbOf35tCoEXzsdRfVUyI/hMIyZPVDj4rGXrfXjpGO5ECFMLauHEPdmh/a7Ajf/cvX3
 m1vP+NkG/EP447k5pE7S15bUNVG1oQK08g9iscme8/wtdvosrUXTuh0ABj5trXIC0QizyD943NJ
 W6qJ3H8Sk3lr6CYiOlpJ0cD3x9UeOvTzuu+YS0GiIkx2i+gYid3nZUwKSLa2ku3HdphsxXpK8Pf
 TaWF7wcoao0Y7rfRsAKskkKCWecqCKwVBFxpE2WTRik+QRacGs3FAa8DydDa9TeVbp4o0uCue+/
 uc5P5zUH2wgtcuxT5fg==
X-Proofpoint-GUID: VYhFDN6v9vYHhIVa0_Eh7OdNP-MX9S4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110155
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Keep cpu_common_*() pattern for publicly exposed common methods
used by target code. Use cpu_exec_*() pattern for internal ones,
mostly to distinct between system / user mode.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/core/cpu-common.c      | 4 ++--
 target/i386/kvm/kvm-cpu.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 17d76580930..33e349d4402 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -246,7 +246,7 @@ bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
     return true;
 }
 
-static void cpu_common_realizefn(DeviceState *dev, Error **errp)
+static void cpu_exec_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cpu = CPU(dev);
     Object *machine = qdev_get_machine();
@@ -379,7 +379,7 @@ static void cpu_common_class_init(ObjectClass *klass, const void *data)
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
-    dc->realize = cpu_common_realizefn;
+    dc->realize = cpu_exec_realize;
     dc->unrealize = cpu_common_unrealizefn;
     rc->phases.hold = cpu_common_reset_hold;
     rc->phases.exit = cpu_common_reset_exit;
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index c34d9f15c7e..e164cef2036 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -63,7 +63,7 @@ static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
      *          host_cpu_realizefn()
      *          kvm_set_guest_phys_bits()
      *   check/update ucode_rev, phys_bits, guest_phys_bits, mwait
-     *   cpu_common_realizefn() (via xcc->parent_realize)
+     *   cpu_exec_realize() (via xcc->parent_realize)
      */
     if (xcc->max_features) {
         if (enable_cpu_pm) {
-- 
2.53.0


