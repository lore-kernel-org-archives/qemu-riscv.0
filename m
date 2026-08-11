Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B314C5B56A
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 18:37:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtrJr-000853-1K; Tue, 11 Aug 2026 14:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJo-0007yc-Vd
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 14:35:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJl-0002c9-RB
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 14:35:20 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BGOPp94121362
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 18:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 x6PMGt4n5YI3CyMrkjq/xqLMZCyo+mWskjfZ5KgT8eQ=; b=dxOcmhNYZn3IivWD
 6kxxx6a5XS2wSZWcHJ8uTt+2C0P5oLXOLReF0SawRTaidsR8qna4djDyvlTbnUXb
 anJnJpoBt8oSh5024afIswOzHTVXPT/vsvpwmXJxIBC/CDOmQYC/pwwbTzLVY5pI
 w4BsQgO6yI0DQBq0imc/B9zvS/3L7ui8CfoZO6ZqrETpZJydJMLhcTXAanXd2fG7
 Jy3OJ9ed2KiaMaVKW2MEe2EukP0DvK4BkPs9fS4qEkhJkNj5IZvCOx/XvnasTlZh
 fPpfBfa856o7jg/Bl+9tOuBcyNWwkVgM84HZT+cRYxNkb07/2+4iP+bNmWx8JYeo
 8dZ/Iw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxwettem-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 18:35:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52827090cc5so2420121cf.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 11:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786473305; x=1787078105; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=x6PMGt4n5YI3CyMrkjq/xqLMZCyo+mWskjfZ5KgT8eQ=;
 b=Djm+hd860lNHQ3BO95/bz6/ruXDF/KWBSih1xErlm8jWH+6vqD+mtdQp7EJhtWRxNV
 v8/oeQ29EEOmuDY/fxZhDJvGC0Xz/WPLFVwoTR169wVcIvmP4dUS/HVnABCwMvHfZpMM
 b69jL/0CUxs0ZjJ1iNIS+OiHdHHqCwg8oyZ7eZJq66bftqStNMYtQ9eBhyxs3wUpEmu2
 O3o3dGsfPF7bWXjTrDmx3YTsgnfRKUpMRwQZvWNvQ4cf7GI/m7UJFTipBjnrNYf6Jb89
 DSW7xT7s8I+AEK8l9mjjDi98890U5g9JCnHlJ3B8/es6Fc8/Sb1tfr/MASnxQtmD/O4V
 aGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786473305; x=1787078105;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=x6PMGt4n5YI3CyMrkjq/xqLMZCyo+mWskjfZ5KgT8eQ=;
 b=LptAEpNYaZU6Ck3k29aXCsSLSkuGrQTDJlwPq+fzMAcR7Nd4Hc2Eqa06q/Qe85Zzl/
 FQTPr10MTq2GYSYoWUBb3Gt44nA7+gU7E8KphMiBZm0GHfUH+cs2Qov/gISXZMpegV/f
 w9SChSP8K4HBs7c/w5F3ffHA4UbfpSoRCEfFMeAMYJljlIJWWQ/kdZjaEUVIFxRqhpfR
 LjDWcmrFWQkGsheAHR3LsczdtL+/U0Ao3ejP6bODFR8ZbfhqM82BO9o+ySNmg0jm55GR
 5TE3RD01rjkgzkoOOJ0luCZei5lAl5lyOKMT5Y3gXRzWutpd1d10Cg77mc+Ml6FhAiuP
 dkig==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp24EHr49IBhnf5JvMnKLZ82WeQ917AJKX/GEvhkhWE5zwANft7GpGP52O9lBL+3pN+/KpoUfP4Scv7@nongnu.org
X-Gm-Message-State: AOJu0YwDyTHFW3bzaSV1548CN3jfl3r7I0dSQuNBm408grpwqe4QJrKo
 y/9Hf5cerbnoV7ElNJn6kw3cVw1ZWiDmbMqLHCJypMV/VtFZbfHqg7CBuMI0G/M+15qKIlJUaeu
 3DIJJhPUpakNrtOHa9oZnNwTJc8AuL7xQocHtW6GTTfNydNFvEkNelkBYNFjm30Daxw==
X-Gm-Gg: AR+sD12znshWIIzKiW7MUSzfmhPNgQiAh6y3/kqrgBAZ3MUSD6acg5DFsBpUI1Pwnw4
 ClTLSo22EHMU2x2bTTe7+AuisuS4LzVLWhKgY2A4w9YYkDV5KuLpzapHUAwpfKr059ggDiF18mq
 XGeB8kp5ztpsR0rZIBKKpbdpZKNfO+tV7nmP5ABpwPR3TlRMuUpaQePwgtl67n4rP7Y82ih3HG1
 d+Fo1CXv4vyYXdDf5ZJdRyB3V5p2HKdRxR+mNFdoQsKFMFUZpYcrME3iMxkf7kt5RKfrrSae5Fc
 mi+It6gsoWsh6jEBxFCePHxaGR2v40V5lmAbSjbj9XvxgQg2kaur8r+evDwTlfTnalJtnSX67iC
 8FvMLoPBM1sArxKOWxJFfq8FrVK+ADnHqPCrO8Njk7A==
X-Received: by 2002:a05:622a:2505:b0:51b:f992:9e18 with SMTP id
 d75a77b69052e-52d601b392cmr30485431cf.2.1786473304995; 
 Tue, 11 Aug 2026 11:35:04 -0700 (PDT)
X-Received: by 2002:a05:622a:2505:b0:51b:f992:9e18 with SMTP id
 d75a77b69052e-52d601b392cmr30484861cf.2.1786473304627; 
 Tue, 11 Aug 2026 11:35:04 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d5dfadsm333703f8f.29.2026.08.11.11.35.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 11:35:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 7/8] hw/cpu: Extract cpu_exec_realize() out of
 cpu_common_realizefn()
Date: Tue, 11 Aug 2026 20:34:09 +0200
Message-ID: <20260811183410.22428-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811183410.22428-1-philmd@oss.qualcomm.com>
References: <20260811183410.22428-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SDQhM2vcTa-4z9iytYBXIXP8UByjWZu6
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b6b59 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3ZqzEhZVOs4yraokUgkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: SDQhM2vcTa-4z9iytYBXIXP8UByjWZu6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX7horAwgUxhDF
 IsrYVFwiWjP9NG3taTr55744qFZkssdmOL5j6SJbPwodERfMiD4mcB/WLyik51ihC7UdkU63rU1
 POmdlWO3fxMw/iNubahxNGN9jFAqWnQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX/BT+G04LEO1i
 eUfmMG6WMzFPqt97ik87v5HfbYu+lSCxwJoS3u4JjY4FQWvaVoki0OZbfM+3mvWp1YhtZDRm+t6
 p82yn+Uol22WHyRqT/LwOdkAz0/wwpWzCcfEfkllh9ZbhR4ANKZ1zAmlcIh+tPnBCM1NvoR79Bu
 nyhSXmnCZPVUzfUIuYvutp4K/YKTfFeHkFvgYJtC1KkCZgWQLkt9OMJ0Oq13BR7zGHErfz36GzU
 AW67yveCEos/3IdEfRE3ip19wFxpGNrniJiBzhtd4U9+WBaXoBjMSrEYZV2cClkenMAEuD5OLwQ
 qsefgnGvkk4oaZn8TLcu1QEK7poI104mo6l6G4uNy8M30Nqx68+1nJfuzbW5VB/DRlaSt3a1t3H
 eCXEvmSlLT33RVFOPlqvVrMno80+WcX48eXb+qR/5XzaaQWOt6UJHCY4d+9F/pKuR2rIGpB6BMx
 v1YbM7FkvRVd+DOO/NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
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

cpu_common_realizefn() contains code only used by system mode
emulation. Extract it to a new cpu_exec_realize() helper. In
the next commit this helper will be moved to cpu-system.c where
it belongs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/core/cpu-common.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 59cd489b713..cd7c8763cf5 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -246,9 +246,8 @@ bool cpu_common_realize(CPUState *cpu, Error **errp)
     return true;
 }
 
-static void cpu_exec_realize(DeviceState *dev, Error **errp)
+static void cpu_exec_realize(CPUState *cpu, Error **errp)
 {
-    CPUState *cpu = CPU(dev);
     Object *machine = qdev_get_machine();
 
     /* qdev_get_machine() can return something that's not TYPE_MACHINE
@@ -264,10 +263,15 @@ static void cpu_exec_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (dev->hotplugged) {
+    if (DEVICE(cpu)->hotplugged) {
         cpu_synchronize_post_init(cpu);
         cpu_resume(cpu);
     }
+}
+
+static void cpu_common_realizefn(DeviceState *dev, Error **errp)
+{
+    cpu_exec_realize(CPU(dev), errp);
 
     /* NOTE: latest generic point where the cpu is fully realized */
 }
@@ -379,7 +383,7 @@ static void cpu_common_class_init(ObjectClass *klass, const void *data)
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
-    dc->realize = cpu_exec_realize;
+    dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
     rc->phases.hold = cpu_common_reset_hold;
     rc->phases.exit = cpu_common_reset_exit;
-- 
2.53.0


