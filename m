Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCECACA5FC4
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:45:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xByNL-0006G0-Ab; Wed, 30 Sep 2026 13:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByMz-00066A-OK
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:45:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByMy-0000pS-5A
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:45:29 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHf4mC3566613
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VLVXmNhi+na25vh7Z7IIMAPP2/NgNIO3GRC5DFZ+geE=; b=MbeV/XYxAGFROPH/
 uiecAT97UlJclMy4SItx3k/FnonzupJhCMzLiOpvncO9LuUXDQ9QALw4cdZo1ksQ
 MjsOLXeojvSQdCDGOq856W6dXloGQK360O+dTbTSapUvzyW/vq+cnqqD10B0/xGx
 Y1Kd6CZh+HTSzPJKqrKAtN4MuT/wFJ3tsMr7kSTcwvWXubVEtnslcnxan+DhexE9
 iGkiu38VucGS5D5VOQPjy0YaiyB4HfgUqI6Ol5OAklsovNWMzFMCRuR77dyyqrkf
 s8TnRG+tluldulR0KrI+v3U3FJM3G1IUDpam12KFS1CBUM8S8pFEXyA81YOw3a1j
 WtdzBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjky6a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:45:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93c5ab5c136so750013385a.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 10:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790326; x=1791395126; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VLVXmNhi+na25vh7Z7IIMAPP2/NgNIO3GRC5DFZ+geE=;
 b=StViWst1SAreY4sN/40YqnpFmCO5IyRK8gDh4QTvPbRwq7juWrdbySGxSU8mB2nF2s
 VAzYTceKGcjLFaMIdULc2wxlv1lX8c6ZLUOiRnsDeqt5/qoeNMrBDQcyBUZWYRYuWdfD
 uPIxtOU+ZeDzjmNgnjUL/ncf9KChi7sS0nE1hY9ZMtBNufi2G75yis/0BeTfhU45rqh6
 5qwAN+S4XjaInmrMmsFCD9Ztp3YIBnBPaMVMbKCRri16mZwoWf0eumsf0DMrA0GI6NKJ
 atWoNaPAN2xDYRkbpV1k0Vnva1GsbIUhZHab+j4zmQwFlvRaIqjTlzcH8EbzIa5CgQAA
 p9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790326; x=1791395126;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VLVXmNhi+na25vh7Z7IIMAPP2/NgNIO3GRC5DFZ+geE=;
 b=UZMj9bILSjQkzpy78/CZ/LL/0k0RIZbaiiNvrOnUAtKuat9J15wZMVfWAYesGF564f
 BiY+6y+VUjnWWc7VUztfAwy+8MiC9JIMumUirfngVyi7tUvAMsPzVG9PNt44fQtOVAjw
 lYVHi4Sz8h+ujdemVs7IVZ/NWjNiLENbrasBF/Q1u3CYIwJB6BQQSsLZ84XJUy9pl7AR
 Hvv9XllKcqYjBSEi+QEXT+XYZAZ9vwcuwsrvXF5pHjOm4XfVAAuyH+tSFB1LVQs/sCBM
 l18DxTiD3OaQOgDuO4rjynmB59Mu6erOijwi3cfoQqCBGZcaPXjDTYgGnqWBzqQAeqxL
 ZgWQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwtD6J4pZRniJFyAH9SXDf6y6DYbbTC5K2Lc7/elUZnconE+VvMBXoofJ225fyqWcavZrcRKmD0FxtV@nongnu.org
X-Gm-Message-State: AFuF++kN2n+5Dxn+Vj5pxyrtrSBf+5GEuCaJHJg86CUY5dXkrZzgbpeD
 XkTvqVtpSH2e1kXxt+aNKo9NSOXCCOQdT0EyunhBWCC7WSzMZICNGtjtuO7Sv7yB9EweB94MriM
 lqKD4LN77ItDvE/rNr0erf7mNhlGys4ZyQixAsvRIBDPV3KlO9UYLhg+ggA==
X-Gm-Gg: AYBFou3WYKUbzrbsYXJzCXvTs6OnMH4J5/6GrhCKV5pksruzqNQaIYpPJGeGxNxMO/5
 16D1GXaYe1BFx1XRGDurDq/c0qF91EIL0Sc1HbpQk5hjQd0XrK9pSs3Ds3L4SK3AR34kQSRq2P4
 G78W4fkvUJRWiZRJd6jrHywq6YTl+R18ON1BRZ/8xZqbgtZmW/eZnJSvHtodv//hnyYplR58nhb
 hdWfoBhNIQ5EcoMpeINE1qRROfN7tyn2Ggo/6/drnZCmpbZtpMkXwGxeNY+xUEBTyRShK5mfPb5
 b12Dd0ZA9diNyChMFHPRoDRZDkJxKqlCl3tkjHfSY8wtbXD+UD8JsNCWhj/JN2McsTt3b3pohNZ
 lXdfkyMv7xeWZWpqsPkWraDLgw6HO2L2t7SEnF+4D
X-Received: by 2002:a05:620a:454b:b0:939:b099:d52f with SMTP id
 af79cd13be357-93ca9650a87mr392454685a.20.1790790325345; 
 Wed, 30 Sep 2026 10:45:25 -0700 (PDT)
X-Received: by 2002:a05:620a:454b:b0:939:b099:d52f with SMTP id
 af79cd13be357-93ca9650a87mr392446385a.20.1790790324631; 
 Wed, 30 Sep 2026 10:45:24 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b0692b5d7sm600467f8f.28.2026.09.30.10.45.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:45:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 2/7] target/riscv: Document kvm_riscv_set_irq()
Date: Wed, 30 Sep 2026 19:45:02 +0200
Message-ID: <20260930174508.81497-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174508.81497-1-philmd@oss.qualcomm.com>
References: <20260930174508.81497-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfXwx31D0Yyy/wT
 iUioPpcemgT9igc1tLB+bhCV0jz/7ypJAhBC817uL4I2blsVUK3Dr7mNNIQ4QdR3bBIEq9Yh5I8
 iCbp8/JEJoIE//qdBmpvpRzhqh9eaDE=
X-Proofpoint-GUID: 9zaNyCnEQaBzKv2nvdvNEksiK9VeCmw5
X-Proofpoint-ORIG-GUID: 9zaNyCnEQaBzKv2nvdvNEksiK9VeCmw5
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd4ab6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7UhsabeAiQZP5p8CUgUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfX0LwHULXB4E1Y
 U79kPbaIxgpN/n5dFs0VTy3SqgLy0P6aHvNYkXu0MZ+hodmnOIgXVfAFyqSd0OBn+nfnuGvF3rK
 U13oIZZ5BY9rOdOODiPUuzqyh0a4gEfJKWA5E4iwTmtRwdEBfKoy7D2/UsEFbrxQXXeS6FXvTjb
 9/3F8Map5uU29EDhuZBE9+JH3Nslz3waJNrfL97xBuYDOnYAQDNpjzzjbAlgVL9KkSt0uXnhFcS
 a/9HIuJBtUBxjavMVCxHPKB0gxk9z4jfga85Q9b+A57o3D9INgLnxCAsFwow4v2Yojf1rvSevce
 qlGyIX1JD9EeNasp22Z53f2TwvM1QyLGDMD/5eukpu/ySEldT974EomFOhPnc8c7irqCCUZCeeq
 tE4HfpbjWJQ3ovrQYV8pEizlHrGQFeAQEGTsBGNkvUOddl3C0tb3Rv6QDmkFzn9jKNdUrfi+f+a
 M+UN3tv29qvFvAp06EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300070
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

Describe the supported interrupt and the effect of @level.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/kvm/kvm_riscv.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/kvm/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
index 61eaa12443e..7317255cba2 100644
--- a/target/riscv/kvm/kvm_riscv.h
+++ b/target/riscv/kvm/kvm_riscv.h
@@ -22,6 +22,12 @@
 #include "target/riscv/cpu-qom.h"
 
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
+/**
+ * kvm_riscv_set_irq:
+ * @cpu: RISC-V CPU
+ * @irq: Interrupt to set or clear (only %IRQ_S_EXT is supported).
+ * @level: %0 to clear the interrupt, non-zero to set it.
+ */
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
 void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
                           uint64_t aia_irq_num, uint64_t aia_msi_num,
-- 
2.55.0


