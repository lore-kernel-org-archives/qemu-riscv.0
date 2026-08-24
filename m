Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EA7C5DF81
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:21:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wySj0-0000Nx-RO; Mon, 24 Aug 2026 07:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySiz-0000I5-HE
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:20:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySix-0006Sf-QE
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:20:21 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99ckM2572109
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=; b=Tm4ho5i5yqP0R+rn
 CxIy7K+Lk3SHSHsiZBt8R3FHrJqioeVsToOHCZjhGlhm8a5ziQZ5wvxOhVyxpoo6
 g0jXoHQkcIDbUMhWzDBgC1957+eIc5m9f5TNMk5YkYNyydSP7Ld/rjpqunjbEDlx
 eqIuocC0Nz0NeQlhegVQUC12ziFkqRrYSUXKAy1Rgw1PkFjxjiVnBLrY+VvxTQvf
 SbRt5Jtx+9OKqxJbgi42yyuVZYunJKJQ0BvZ3nU/DDVBamGsrtKTq4sm4YNxnwav
 tpXsWYmefewSJXgSukqiaDce4es20wyEn9KRweN9OFAYRwtZ/Nci3C1tAdbIfnF0
 OPn3KQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr25xf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:20:08 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-754acc61c68so320621137.0
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570408; x=1788175208; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=TYosCrY56WaZYBuk7DUxO9c6LPpvhCJb3Q+hE9bw+Id8R4n1cjyics95H38r6f8mcr
 angrSAB5+oP2fi2UPo0bKWS15NwIkKLdURN0/hKE/FwAurLKpRLFTHFGb7nzRR5QKZ9E
 zmlScsLCgL6Hqb6aJyOGiDliAJ9bI9lNlcmBkflvLotOaC7hBFtWGKz7psKSokzM/5xr
 SL8SdMBRSSPhh8oCEdH359pvXM78zD2WsFsV9i6nT2iLhzXVNAseqP4Z1cKYlbNjZQUP
 xe8CGRlqRWwBVWMfzlRZI+RqEHFMaYFkOG9Col/DgnNr3ydwulbdfM9SlFx4uu9nHUbk
 tGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570408; x=1788175208;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=ZwZ0gVCcjblw2GVB9MJ3nmxKjl0pORyxDEqetpvVdzNaADiq35j6UuHD6D3dYS4I+R
 kwIsAvBs253XvMdUS5eXFfQKxXgoG17aOBNDtNcrHG9CK0d6HL2W+jc176AD1IubJkFi
 qqEcjMJI/oDXYmK2842Dt6lxKNNISFxKvYoX/U6x8emb46aIWobR4uoqezvmiS2D4rrX
 sWaUQRxPJrFj1dFnHOlTKlVZSI5rAl1zJGG6kuKL0wtw6q8kCenB8Xn0zr1JSXTkCAit
 utq3WSndLv3wAnLIfe+19DrsHT1T5LMwlS7SkQ39hjyKXd4plXGNW6NjfmKSLpqB1afU
 YJkw==
X-Gm-Message-State: AFuF++kdh8DVV32fzDFvVAWjflzP0QZ7mIhZxbqj7Hd/5KGS/vFcU43E
 x3fDURuRPlIaWr0xeTyCt+T7pxi8neWZNz47etHCTRUyzrufU/AZYA5mdkuMmGapRAWdrAQ+vG3
 5V+SRHPh12RZHGVfRIe3OAxURs3OufQWiidXBm6xZ7BVDgcasv49+x0dLsQ==
X-Gm-Gg: AR+sD13Y3uYT/eA+LICnSC4BVi3tLEitspt01Z1CqISVQeBMOv8HPSEQKvpa90IDxyV
 o9Y7leGDD6Tz0dN0i9mg90ziAxU39Ty8nEehlJytnFaD8yIQKMFJAJA2q+AE6DEy4HKFytBfwBQ
 fkHthzAKqNrrDS8PBnNbPXf3+4qQADEIvopQ0e7b1a8H1MjZuTDOz/nwTt2aXmf2vei0nOHb0Re
 rxHpH7c3ld+nkgZzH+NfnSeMFqG+206vET8a1FjGdXAODisT2BUPPl7YYoGeJ0q7tZp/zXnOZVH
 7AVt9KTaVpkdNHAHNPRh9m13S+blNpuJ2rKCY1RYbn8PST9XXEVV1oG/TRRrtfMMgZ48BNZxQ9u
 8QDBqmRkhC/zM/KfHW0AlPCzLhzmxFGTu6kWULQ1rwVUC7i2iYg==
X-Received: by 2002:a05:6102:3bec:b0:77c:dbae:f9d2 with SMTP id
 ada2fe7eead31-77cdbaf06e0mr2820087137.9.1787570407812; 
 Mon, 24 Aug 2026 04:20:07 -0700 (PDT)
X-Received: by 2002:a05:6102:3bec:b0:77c:dbae:f9d2 with SMTP id
 ada2fe7eead31-77cdbaf06e0mr2820068137.9.1787570407398; 
 Mon, 24 Aug 2026 04:20:07 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5ba19e053sm1697032a12.12.2026.08.24.04.20.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:20:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v4 16/20] target/sparc: Constify CPUSPARCState for various
 cpu_*() getters
Date: Mon, 24 Aug 2026 13:17:05 +0200
Message-ID: <20260824111711.26297-17-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXxdPh9sekknmo
 JTfM43rPrbKnwsYHurr1hpcLGUEBl8mVVbFvj/vgWDnQss/Lz3Kv1HTmbO5Jj0jB7FA/4+csNia
 sTIo+VLAhH7iIOGNiR5nXM3qdGqPizKLFLlohsDHRhFpZoeRlLXT/hMQGEF3d0Vc14celCZXYCj
 By7b/390AhgeSHZIgjSDgeOhJfxbFS/IqryLwLCWxaDUyPS6XOS1nWPvFT2gxdHdguNo6rC68zE
 P5HG+rLK0QQjk5md6vQDnquH36P71OxduYq12dISVvJKKcCTsfyOHhD0HmTQ/B12cveR9oKL/aN
 pH96yM3JDLc+NKaTCWIsFnumACtRsPmWkboB5XYeyqM5EG2Qhmwpzsi3NXSX4voqR1D4qT8y1HM
 jmtwmOBwOiAjo6vJWVopJzETN+pbT/GBXxLZjZkIt/8uMhXQozTUYv1Il0u2mczAwg6cpTZfnRt
 QumQX/MBd6dWIlFUXJg==
X-Proofpoint-GUID: ES97f2iwldEOQ_qMZMdiUIL__2VEiqie
X-Proofpoint-ORIG-GUID: ES97f2iwldEOQ_qMZMdiUIL__2VEiqie
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXyLvZ9n+zz5Cq
 2xhDzrfxsdhgc6m++FCZ/xvaapASrqn0EkzqcQyYZKX5n1TARywpMz381LjiOzYi50TvSwDg7W+
 1Kzndia6lI/UXMRRDlP7/41dSleYHzo=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c28e8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240094
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

Add the const qualifier to CPUSPARCState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/sparc/cpu.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 5f583ed9de2..31a16c2af03 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -680,28 +680,28 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
 #endif
 
 #if defined (TARGET_SPARC64)
-static inline int cpu_has_hypervisor(CPUSPARCState *env1)
+static inline int cpu_has_hypervisor(const CPUSPARCState *env1)
 {
     return env1->def.features & CPU_FEATURE_HYPV;
 }
 
-static inline int cpu_hypervisor_mode(CPUSPARCState *env1)
+static inline int cpu_hypervisor_mode(const CPUSPARCState *env1)
 {
     return cpu_has_hypervisor(env1) && (env1->hpstate & HS_PRIV);
 }
 
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->pstate & PS_PRIV;
 }
 #else
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->psrs;
 }
 #endif
 
-static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
+static inline int cpu_interrupts_enabled(const CPUSPARCState *env1)
 {
 #if !defined (TARGET_SPARC64)
     if (env1->psret != 0)
@@ -715,7 +715,7 @@ static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
     return 0;
 }
 
-static inline int cpu_pil_allowed(CPUSPARCState *env1, int pil)
+static inline int cpu_pil_allowed(const CPUSPARCState *env1, int pil)
 {
 #if !defined(TARGET_SPARC64)
     /* level 15 is non-maskable on sparc v8 */
-- 
2.53.0


