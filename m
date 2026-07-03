Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA38C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:08:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiJ0-0003Tb-6Z; Fri, 03 Jul 2026 14:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiI1-0001oF-Pb
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:07:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHz-0002Qi-1K
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:07:01 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663HiO5k676040
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=4Yvu2Fw4Lme
 yR/bMRwzcwj89l/JCaFfxPkZEgK9zj/8=; b=ELyvaYosEH59XRVNqG2gRd36zW8
 Diw5AE2GUMwlhy7lV/fqg8AoDSelzk/SGqfr1H+vX/kfzOr3vPPwBI8SMBCaEuCD
 J/KYApczt5NW4wgmsziBM/tHWsqhLanIPNqKHQ4xahCA66LA1oi1HwURILrVShus
 3CBbts8kLkzWSRmR/aQX9zU5opCjFrF8e186d5858NsAKlMF8p9PY7kp2L9DARyD
 fKMP+0iImBHry52rESx+AjMOynQdtGcLNJRrM4a3abgc+VPRhRSVu8hGNGcLAFIp
 4DV2SLNJ/OCk/8lBHZNwPPhzCLTJQthm38tSiTUT4qR0cfDAv1YAJM7yWLQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkh081-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8eac2620cb0so10271496d6.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783102017; x=1783706817; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4Yvu2Fw4LmeyR/bMRwzcwj89l/JCaFfxPkZEgK9zj/8=;
 b=Q82kh9S3rfqdpkWqo5Zb6kUEFeUAJFDe+88NTdnl4IHeSrpdskPmmY1DNwP4XiMBzc
 upWhcngmz2GEkM7oMGc8yklkeWPE9CCLDT5PBPhfhm8sURYgnrZFm9NmMSQZ43U6Hr32
 3yzs4chn4WN4bU5DWkIxmWWQDnZhSO/QecnlEKSHIDv0UcYRjTkxDIKxnqKl8FXrIxV9
 Ov1FEEhRAGj0ujNDq3eNwngTYRBdbQZTwAF0Ayi3hcYRXVAJYiMCTpYk+r4qdI93nhIB
 y+jD5uLAXscyPBvg3baO3oF7Rnp8pEwECJVd8eE0pa6CDHnJMOeXG/CZyHmrW3yqby+H
 sZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783102017; x=1783706817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4Yvu2Fw4LmeyR/bMRwzcwj89l/JCaFfxPkZEgK9zj/8=;
 b=hRjAyRDDyN7IN/AhDAxu5vcb9ZeOtJ5VzTuJxqVXBvv6kXei0nBSCm9Xa8DAinkZy5
 uVZU6BTJPka+H06pt/NWT+c9Cyn1UHMTMEn7A4+tQOOEt2WvkC2eQrr/hkeacB45k6TL
 EV/gjWs67SibwXoyd6Vvunrr7Zgw5jbx/OaoDOBUfzvPi9F6UVUx5sVKdQqYMkKDawxO
 fzepQpYrcI6q1cJ/B/SlRulAGBy8wH3rDlyWbcceLaUtr2kSr6cky4x6VxNyczfklvyW
 B9J5JjtlK/RR6WWqhcbg8nBaJ0UHJFyBfzD4fHGT13MfrIG87UFQ3pKhhlsbor0FkxBq
 0CyQ==
X-Gm-Message-State: AOJu0Yy+KR0Tij7CwqY+67btZkpZtLAIrA3ESEHl1J2CXWguvCNOIsw+
 Tl2uyCnh9Hmy/1zfE9cPD3SGf/Fr8jtDvQ454BR2lZ2dBIrc8balCYiok5P8aYSZ3wVtWbrR8uI
 X+3DX5K72BnBB3tVK04urmNe08Yr7U2QmB/d3eRWQ1SBPg3AUA44UbJssvA==
X-Gm-Gg: AfdE7cndiFnVPT8QUunuH/bKO2sTVhgoBns1kITjrnZKfBlmpSEUcirTwA3Joe4RC+t
 01Z5EbxiQ8BloXf8BJg2n0n/dJEpxR/8gaEwUvbE8iXqeHfmCFv/RUjlBkCN10VqhY0F7lojDRc
 fgULiRD3TLc8iHdn9DHOjkkLzD+ZiVqzSo+TU0csCE/QUiciudoVrVmjLP8u0QYCtwoQ2Vm4wyT
 yaNz30bcW48D9NgtIW5hqSp/RKTKP9sT5JBtS9uf1iZChhKGGI85i7SjXBcLv5To93avUUZiGWX
 S3aSwebh+GJAXEOVy2+pyV6GXG/xfSgE1PmGmmriIGl18Y8ou+O8bnzqfGM/8AreCJeKnsSUtHA
 WcPCxChbKGFDvmHOzNo8Ogq74A4f+NLbfxTq1owaMxZ9Vkg==
X-Received: by 2002:a05:622a:214:b0:51b:e60b:f27c with SMTP id
 d75a77b69052e-51c4c23ba77mr9048731cf.5.1783102017354; 
 Fri, 03 Jul 2026 11:06:57 -0700 (PDT)
X-Received: by 2002:a05:622a:214:b0:51b:e60b:f27c with SMTP id
 d75a77b69052e-51c4c23ba77mr9048261cf.5.1783102016972; 
 Fri, 03 Jul 2026 11:06:56 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:56 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Zephyr Li <fritchleybohrer@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v4 24/24] gitlab-ci.d/crossbuilds: add riscv64 KVM-only build
 job
Date: Fri,  3 Jul 2026 15:05:36 -0300
Message-ID: <20260703180538.3346781-25-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX24kZ92dFHjXL
 PzGWR+B8+1X829yjYjmXelDUcwOw1u0H4CLDXdGYWMeogppgapq+SaOKJA4m2is0OC2RrJJEPkZ
 G1wZyEROi0Lg3+JKshKUA1ly8iEOd18vwxCJb1Oaofv8s2WA2MFzPhPUZ9oWpTZBc/oUYZlTAO5
 mMsJ84Otch0O0dnPXxWzDBDzr4bQfjcdHuZ4RSLToMgDEEFx3F++CSBqSsxLXUxCiAm99J1SVdE
 pC6BxRDv4Po5bYP9GCwCzS8PI274Pi8fi3NqMSKYeVn4k2lciwiavXojHT9+nad1tKhtaejNnv5
 YSxi0F/Akkq46V4K8kxq7ltv2XGPG89Wijpidn3d6MMPpQJ5vdca3GpvdvS5vDqybfWLID6d61o
 RlaDBLPZjtrFLH/Nz2kYBM+w/U4EfKrpUFvN7pkBrkPsdo6UL4bthYsnUGdLH6hPBsh82mDK/iG
 wz83pF5LaHQPmVLNxjw==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a47fa42 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=BEvAcZqKd-QGyfCP7A8A:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: mw2xpojGjNrl7BUdcq3zcLCSYKsrzWDh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX8RC7IagQ2q4E
 hmS7rsMP34oNnGPD6aBRv7eKkPvfEOjkhioHLuV/5WvHlzFqXn+8jBO1SweGzcWgqggSw98oADk
 ZuDSTSK/mWsWD58qJzFx6lX5uOcDn3Q=
X-Proofpoint-GUID: mw2xpojGjNrl7BUdcq3zcLCSYKsrzWDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030181
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


