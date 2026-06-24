Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719FFCDB479
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:09:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcBA5-0000Ej-TZ; Tue, 23 Jun 2026 20:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcBA0-0008OI-Gk
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:08:09 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9y-0003Ni-9R
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:08:07 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NJwqfK613897
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=novCirPSAB+
 Ybo1QyBdlWXtDjYfXG49M7VvGodoMtJI=; b=MxqoyS5E0opbuHwGMPJbRD7EnkH
 FJrHR2nB6GcNJLUCaeFhOwNBExhmU/78LhM/EQaet3r2V3wiz9zxISDaR/zu3IUE
 8iJqSF1tjMN6w3hjaDJVvy/xpQeV6KnCvD3dQuhXq58/h+9R5nrcxoZwhO7pMcew
 X972x98REP6zJyYAqETjaI/sX/V+NwVEVFt12TLyOE3Ua4RQ7dHRXLct1vGqQSjk
 XkGkQEqGqUJLmMIkC0GnhDn9wCZjt4g83MwlyoXSQbPkwvzeJgu+xDWrVOwQS9Nf
 5i79ur90zJj5vogKBkz1gOq5Z9LT4jC2Lr4pRrWoiCg8y6NkITouvAXRzaA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppykjgt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8dc3be1ebb4so31610416d6.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259672; x=1782864472; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=novCirPSAB+Ybo1QyBdlWXtDjYfXG49M7VvGodoMtJI=;
 b=Dq550JMq1ea9J9BEK47Qa11op59a/FYDivf3XMM1NA/v3s+rYUV8F9TI4bOrVrIGLs
 TAhwYEuL8UhMKe9QIaXEBIMyfYFTMNBb7/C17YJhAJHSlnyIbiR9kcccADSe6jMuAV0L
 iAJ6K90JEUDPKzjEZV/A6i0xHGOSPmOpI26XuwsFw9J+5r5R//XXJAu7adG3jRXZq5+y
 sFJ8hURI5ktBOrzZboW4bJte0KAOuIQDNX1aOh62mq19ctmPsF0xu9kEXSwUr/O9EUOA
 giaOkUHn4THn3gcBUE8goZX0mHvSGJ5GCIV+seweTtHmhFgafgQWoTa2QpLrLwjtv8kx
 EGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259672; x=1782864472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=novCirPSAB+Ybo1QyBdlWXtDjYfXG49M7VvGodoMtJI=;
 b=oRjVwpugB7oCpIUltI7QMX5HReJlAjouomvGE66UaoQL2N6xQyolT7ztO4Y0S5MHym
 EsH2ci6U2UdOcVgP5jJvKzx7X+wKoGJynwVv+MA2uVK/ZPL45wO9pMVQEMuKBSTrj+DX
 mfvtElsgMUz2voQ10yX51n6263mMafFXf2VcLZupCq3sJmi/P5cI/M+uivg/Y/3raa/H
 wbWk8RGhghav8FuDcn/G0FyPyPms9M7RXSMdlpXWPuoefhhqv50ozXv0DvKAIc4QpNl+
 r/+f0NrpTorXcKDrikrsFmj8iqkkpp/cZH/VMkotxZMAjgIgbuACS876NP5TCgJTwYrz
 t1Nw==
X-Gm-Message-State: AOJu0YyhA6Q0Ump9H6OKouFIbyzreLrxGB/n6r3dE96n3ol//7hxdGsx
 GV1L5yDyGEIr8W+kASS18yIXPNa0McUaHnD4Ym8/5zhrtrmyVkmrBZDLLqfKZBFXRknASKYdwPM
 WxwbUJA8PeW1PvgJVYmlEn3QqgZFUIUPiCI/ViUoB2b7jZHiDhSb3jvbW0g==
X-Gm-Gg: AfdE7cnVf/L46DwdCsUGz3fVJ82oQCz0CP7iW6mhkHJm1lfumVp0sW3J3K+Yf0x8LJW
 CE5wA+Tsh67OcSAGEBRsuuUktnuZ8GNhCofQpB6A04uSUxURVm9qvacdq9WGX1vnZlazc76hGg0
 aIxA2GJ/2kXMjooclJgj28leclDLrzpec+LY7Oglf5/sSRuzwBs2VzGfVR0afu88cc0HFwJmnmO
 Jxtd6KzkVXkalewwnR9TjWN/YPTgbAlehqi4NnKlkiUAKchse/4X1c93M5RgnUCrCYLSklXDFQm
 LzGewqVHivzSe28g2KfnmqcIkbF0uVXZapFyrcRQ+kCnHeEtO9BfMNdJMin08x5rBDxQFBgYCZH
 dVCn4h42tudIQnLZjhEk16OBqv4gYa2p8csRRLhbY41UCXA==
X-Received: by 2002:a05:6214:8087:b0:8cc:d74a:8dff with SMTP id
 6a1803df08f44-8e3b44488b6mr86597946d6.5.1782259672388; 
 Tue, 23 Jun 2026 17:07:52 -0700 (PDT)
X-Received: by 2002:a05:6214:8087:b0:8cc:d74a:8dff with SMTP id
 6a1803df08f44-8e3b44488b6mr86597616d6.5.1782259672034; 
 Tue, 23 Jun 2026 17:07:52 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:07:51 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 24/24] gitlab-ci.d/crossbuilds: add riscv64 KVM-only build
 job
Date: Tue, 23 Jun 2026 21:06:31 -0300
Message-ID: <20260624000632.2149359-25-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfXz0Sv4iNQl8pv
 DMBJUvCRstyhW+EVVY/o0qXOg2HXExAGWVuT6RZkEOgKcDQzZDIfcDGg2CnpRXtok+h6/3TIFll
 gsgukRMocaX/FLvEKbPiH9f1GuaXjI7ujMukiR0iqxC72pkQEcjLVwKf9TRvoI9vKP7TrU8mvK6
 Fzv6rXRkFfMB0OoHTXvpHVU9JYrJniF6REIdNinZQbnOzdA59YBEfROCuxbhqp7bvIpdNbwD7PO
 9431xMoC1RSYbG7A8DM0GPIcCenJjHmv5HFN26L3qwQMkDpIzK74IEkCEIpuaPJ6PrPVzK9xfZ2
 00PrZMHTjSflzhRYyncV+CzuKOfu6bDr3V5QwxaGHG8GoXu0kQbVOGOWWWcfYag/xwnkxSwPG+e
 2M8NR8Qnplm26CM0y15mzrYutsn6XQ==
X-Proofpoint-GUID: llDHF7RtS5QCPqj0sB3HMpPsaQjGwyua
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3b1fd9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=BEvAcZqKd-QGyfCP7A8A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfXxvB6KvQDn0Nt
 /CWO6Sn0MNI3mw/YIs9mW6i343yWflcpvsLC0kyj02xGjJAUemhnlB3hRvy7Z9SOa0w9ZjgWSVm
 MLsjRuuIFxsnzyTMVuB+4E0PwI4NkCw=
X-Proofpoint-ORIG-GUID: llDHF7RtS5QCPqj0sB3HMpPsaQjGwyua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230199
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

From: Zephyr Li <fritchleybohrer@gmail.com>

Add CI coverage for a riscv64 --disable-tcg cross build. This ensures that
RISC-V no-TCG/KVM-only builds keep working and prevents TCG-only code from
being accidentally pulled into common RISC-V sources again.

The cross_accel_build_job template enables KVM by default via
--enable-${ACCEL:-kvm}, so the extra options only need to disable TCG.

Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index eaeeb533ce..a823aaaa21 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -59,6 +59,14 @@ cross-riscv64-user:
   variables:
     IMAGE: debian-riscv64-cross
 
+cross-riscv64-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    - job: riscv64-debian-cross-container
+  variables:
+    IMAGE: debian-riscv64-cross
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --without-default-features
+
 cross-s390x-system:
   extends: .cross_system_build_job
   needs:
-- 
2.43.0


