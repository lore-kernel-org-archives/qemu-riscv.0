Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDE0CD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:34:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkP9-0001yS-RW; Mon, 22 Jun 2026 15:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkOR-0001SG-1I
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:33:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkOO-0001w0-Jc
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:33:14 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFXWYD1571448
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=novCirPSAB+
 Ybo1QyBdlWXtDjYfXG49M7VvGodoMtJI=; b=hKYKoW6wQjpTP15CRsMrZ+0r7C+
 qqHdPsCrWoLpVs1RPrrqd5o7sMISAsL8404/1K2nXK4aa02R0UcSP9JwVL/AGRO+
 QN6+k14odJYBgIfi5wO9Sdzi/v2Tqn2mK40MJh2tuKXTgxSLof3EOHpkSKMUtkd2
 MY5n43zyykVJLLPYRksgDqFFtvNI/zNaKn8/JcHzMBO6zO8S9AiyfccwQm1Lw+5v
 A58wAsQt08uPiXr/XPC4e5fJ5wr5p+BFxKv5nVNJkbSz2RVO++5JXPbc4/fXSpDa
 xbPbH5s5z4L/ptarxtH9YlMhZHIEOQjkERFJjgZJJY6ewaJZAScotosK8qQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb9x6x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-91579011fd1so703986185a.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156779; x=1782761579; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=novCirPSAB+Ybo1QyBdlWXtDjYfXG49M7VvGodoMtJI=;
 b=WX2Qh9BEl+uM/6jb1WU3b7NfQYvLn05vaCGlrJHvlIXbaNF5ti2o51HyNdVS5GmlRY
 tQykE3TAN9jEIaBiiWi8avW0jA+StLBa8SzaonQWMlKZyxYSjftkP1Z7OQ9dGW2wWkco
 aaQJ5vGitglhihYtIHD0RJN6t+v98uIX6KvyBufWnQbuTey11TVGMpfQZFDLS2HsCB/v
 134pZ2gfUIWkUbraflOakZqrvLezkSITc1vrp/JhTPTPu0u0ZtgdZwkFga+ZmSAm2Meu
 VKyO5aXbEGlELxh50F6ohyC1Umw9LfJAnmVXRIDCNcgjX1n37MaBOtsdInQqHPYnlfoA
 am5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156779; x=1782761579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=novCirPSAB+Ybo1QyBdlWXtDjYfXG49M7VvGodoMtJI=;
 b=o547IWcLs7NfOuqMH/akkFsoMqaz9QxB2A/M1f1miGdOcw1E21XatgdzZzKcEIxAY5
 Lk/Odvx6sLC2u826CTM0bPL1bBf3y5LO5qd33POUiegVhxzMbtKexQwvjjiKzi+7lm+D
 63PeGatCufxN3sRmgegIW/Cb4TaEspgKZBP6gKOjFdLiPUw+z+6QeZN9v2nadebYpX/M
 5OY2W3OvGQX1MWeKe320L9/xxd53kvDb0Vk1g/nbtLXxwMCpxsRqTHItvOultTe8Diku
 q3X7I5eWuP5HzMsa1cavMAgpejhkTVkTgeKbukfN0N/IYeOyFmuqnIJpN/i+rK8o6qBl
 SEWQ==
X-Gm-Message-State: AOJu0Yz4MRexZQNYP6u66zWNmgYf9gnducRm8gUIdNjreiz+Sx6SHChU
 YhYNdUpgwV7yiYbRl3V4WYUnCBs9Rfm7pGMyyzqxs/EhkfupeUcJH7GjUkomQcNiy2Hb/CN9mrN
 fCzYdYjWye4ikGnPphOaxlzH+eDFH2+eZD+M5eTYu3Spu7EJhYOTGoL+VTA==
X-Gm-Gg: AfdE7ck+tzDNs5okgXFjL9cjjYOcBY0s0q+aLC3kEjLDuz62vq7ACyF1HkPWpbI6RgN
 psdBP1COOZc2sEJW7UvdTfmZhDfFz86njSMapuobOm1gL/TQKBclcz5iri7XThKxUq7vwLmLGF/
 8OqTIdpWfyoEqK4Qqc0L7kf8O48z+E0cWgEnrG3lJVUhT4wrZxfno0RZCqhMLzkoEDCxMeZ2iCz
 VjPJgXfOYkwFM0Jpb2VUgqiQIEE+7T+poIlswnz7MTINpa05L46awtXEznlscPkid3yakMe/cGU
 9HB9Wk5E8zWJpVqpGUAVs9qxPHLs17zbze/elS5UV0VWSu1ArRuYLuWtnMi6mEO3MHTW324XUpA
 kysIULOY0YRc11p4jxkFe3WDrX/lCShbSNW5d9Ncacfi4aA==
X-Received: by 2002:a05:620a:4386:b0:915:a811:1707 with SMTP id
 af79cd13be357-9208f05c719mr2351407485a.5.1782156779193; 
 Mon, 22 Jun 2026 12:32:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4386:b0:915:a811:1707 with SMTP id
 af79cd13be357-9208f05c719mr2351400585a.5.1782156778633; 
 Mon, 22 Jun 2026 12:32:58 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:58 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Zephyr Li <fritchleybohrer@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 24/24] gitlab-ci.d/crossbuilds: add riscv64 KVM-only build job
Date: Mon, 22 Jun 2026 16:31:40 -0300
Message-ID: <20260622193141.1449724-25-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX7ozDgtECPCMR
 I6F8Qy0X4oSh5ly5RpTQZwk6M8v1XHZlPhfsiAnTKp6wABtICgRuqh1DIMX4armvoRd/WO2j3se
 Gyie+WS6ttxqJnU27rWR3UMp3y4j37E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX+1WV37hve0Sa
 XEsEZ4lejDSGUwbAo8SoUPtLxHdjAV+rNrOdqSOpGl/xdzmdQK3ITE9BqF3IHEkoTMh56yWVhH7
 PstCEeZxB7J4O800rFwbo06cYY4NpJvFzb6ca/ygnEk/b0xneG7nY3BT11oftkmMSTdjQWqZPvw
 xc7TetGprahG86tCQM8Fcfzq0KruSjJ8cL1HVoGqs9VWtdTV64bbE/rFKhlF9M2JfxRKbaMkPte
 BcAAHriVLZNCxwFTAuz5CfrOV64wF8Ej55NEbgbcCQafK4OS1YgFizib4FBChUcWi8+trdejBmI
 Ygkg8pUFrMQP22MnMYwaWicPUV2dBaPS0saas5Em83FN4M3K9tnzvnmdR3JukrVmfcvQG1n4J5V
 IFu2n15gjmx9tomaDLQYmuSMe/tR/dqEpr90cvammjjT9w4ymhdeFLk29EXFaRTG/1Oz1RCbIRJ
 9E2q8WweFICozBV8OIw==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a398deb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=BEvAcZqKd-QGyfCP7A8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: P42rgzLu-BkJNP7d1fnfanXseJSqzniq
X-Proofpoint-ORIG-GUID: P42rgzLu-BkJNP7d1fnfanXseJSqzniq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
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


