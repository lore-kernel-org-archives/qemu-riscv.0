Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E07C5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 10:59:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxMxy-0005U7-Fm; Fri, 21 Aug 2026 06:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMxx-0005Ty-4w
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:59:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMxv-0006dS-NC
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:59:16 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9Mj67791502
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=; b=LZMRBur2BnzdxrxY
 WQ/HJ3LO1jCULINRSgYOR8F8XzeLbvRpc6icFlkKM8qyHtST9VvaUNehZE6tbzTk
 Lsxn6lIIr2YW//SzudAjFITBT/HadmKvuoSX4mlCwyf2CN1AXG7f3QtjG41W+o4D
 5kdSfP/nXYGdB99JEvRxtIrKUSkBmlHMa2VrpdD0KUEnHPqC0mwJczAVCT+GrGMX
 JBwfS3ON0HNfjw9rvnh5b6Bccm5NPAjiQkAcFlHjvG/uJ3+iCvsnzj7w1UyLxL35
 Ud2SRu8Yg+x4mQOgJO+yN6aC2Jc+8Ks/B86qGO9x/s0gYk7vt9BIJwkMzQgQxfdd
 nOusGA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebuskfv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:59:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cb4bd11ddf8so1181733a12.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309953; x=1787914753; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=;
 b=i3ONunU2Xe8bdaxkHRxE9kpZPO4aF+JC2yRV52gNA3wiUectiv2UGpA7QfrmfsVc9u
 3fcqsA27WM6bkyFTkzb6hYinJV4/KRBwFwgNIdKRNMKLCa9cH8Ht/R+ovgLm4US8ZCGY
 ecWDKniuSKyByeT5zRHdDNWDPeMZflNSOdEYWA3taV20e3MlHdHpfmox6Tiv9eunW8UT
 wzr9OHbs+B+cERJzCiqRShiS8YcPGAjFHHB9wSUdktxXrdUIfcpFouT6ZUL6DOSprR1r
 azaCb6pCEWFdtaQhJ/8peI/qwzv7brL4TeuvQGqVSSJhuoj0M188A13dV8I1G+7NcvE1
 Ydgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309953; x=1787914753;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=;
 b=G6ham7JvGhB7NmSeyvZJorgbZRdIQxAZIOpV698RY0yRa85VFspSpO2mLRBpZzwfdZ
 +6tox6CbKX9tmvzRNM4IGSa7i3Mknxhu9VtlFEEp3lgkV7Y3+bhEfEbrRaKpMFBPBLiY
 cNq1FuKw/H975/azC21TeqbAV97XHhoHPKUlK//83olPHJBXIKZb8LEopMbyNGpwnGq1
 lt4LbOq1zV7Ip3slBygO0FCHjBWT4zKQM2ePveqjbcCEWGTlOM0RzMKnpYLIIzzaSbkq
 Wekc34s9OKStQzBZAbj5J/2KRkYXopWZYV1uIKqcFxB//nDnWvbOFO2yWgxquf8jwggz
 C3WQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RobP6wr1PaMqu3qdlkZB8BB4kFik6DXFAO+PwN62Nohl6uOFrzpDunAmK+8fXgVG/BrX/Hksk0hpK3w@nongnu.org
X-Gm-Message-State: AOJu0YxEowYM9wkEHQk3ktsClitIKFQyx94RqQvhOLqOC2XpzxEk4+Kx
 2YfNGkxvOvJ3uk0822TbO4w2Zn4kQK+HZttzLYCzr6oyjGr1PPHoJstCz6tVVYRRtd5wxPy/Bwr
 /7UJZV/J6NoonOxZ2smimcvgUleWjdtRKoJ27VMeJBL4lxaZGvJZXOozWUfA2XdnU8DCl
X-Gm-Gg: AR+sD12sy2Dtx0ac/ti2N4LDJDVuGthPxlDm70o7FVB6eOrGVMG+neNiCv54hvZoOIw
 uS/veyheiNU+0tCMWHScYXvXJ2X9Apw/7h7hV/gN74rh8/7dZM4Mbd9lbn3oeMSYFJThsG65i8C
 uHDMPy+Ophwrt1VQParpCN+qRt/a6/D1NMIgKYhR951OQkLdWPvtqThwXnA20kObB7/uY7X0HVG
 Mb5t7KtNzVBex2mJBXCsPmzvry3QgwCelEwhx4658/BzLa2aO2+XH/Xd0juFPsNVwA4/XudMFY1
 xSBKVjgi4Tkx950gDE3qOPHc2/YIC9N/q/gjb5+64CAzYj7Zn81pEd2vKurfR0aRfy87I/TaQEy
 28SqIIzJf0QD3TpJqjb18uNgk/iVy7u5JZzoGZqI3Ig==
X-Received: by 2002:a05:6a20:3d82:b0:3c3:89cf:f3a with SMTP id
 adf61e73a8af0-3cd2fd7c560mr9118321637.5.1787309953105; 
 Fri, 21 Aug 2026 03:59:13 -0700 (PDT)
X-Received: by 2002:a05:622a:144c:b0:517:a7ff:935f with SMTP id
 d75a77b69052e-52df565f835mr43038381cf.9.1787309474684; 
 Fri, 21 Aug 2026 03:51:14 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b9a89572sm16631315e9.0.2026.08.21.03.51.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:51:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v3 11/15] target/riscv: Constify @iprio argument in
 riscv_cpu_pending_to_irq()
Date: Fri, 21 Aug 2026 12:49:45 +0200
Message-ID: <20260821104950.32108-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TM-la6pfXKhbAAuRkAYXr5Ij_V_FfZXZ
X-Proofpoint-ORIG-GUID: TM-la6pfXKhbAAuRkAYXr5Ij_V_FfZXZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MiBTYWx0ZWRfX0PfzTZ3dhaFY
 o4HcvIoGAmsXr4nXLAp8qEtld7pFP5Dc28D7BQdL9XGaLkFwcCdQkwakbeE8ukv/Qew2BB6tSNK
 YhnyyGnsCa18LZeM43cumvr8u5bgjVY=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a882f82 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MiBTYWx0ZWRfX4vPYfihgQubi
 ldJqFMq7UcOtwyBDwo3E12/XHHBumt3A91gdkDAJiE/qv47gF4Bsx1HVGdFDF/R/brTJujTwbAv
 kGZmLOqDNX+xCkrYW5H9Zb3/RvOvKgy426glaBssR0Bn55ShXfZU3OsFzSkAZ8QxHkdYH8HC1zV
 4B9C8KWAAP8Ptx/E1Z4yNvf+BAiiyxvU6FyW2F0U+NFOMTMCInbQ5s+qkRsmA7zcuRh1jGbswk/
 e9cOZq2ciWeJ8ab6UiC/4guwKvEEmsGTOeqcKEwmieulqNYgkPh0GHGB06w/FmbnxWoM/i8dchX
 U4E4CQNJdxr6e33Zk/Zis+cIZbruJ8h6Sc93K7T2Cf0e3+LZcYD8svPllf2uj/Vp2vpRixy/mtL
 Xjkv0qmNewB3hqI1ldvmr1SomMTv3sAMcObNP8oJWghD/303P0k4l3rN9QJh+HuXrlFymAV8ZTP
 B8HHIHBxxGCaVY/Qp5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210082
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

@iprio[] is an array only accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/riscv/cpu.h | 2 +-
 target/riscv/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 376cff656fa..bb4c8563554 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -642,7 +642,7 @@ int riscv_cpu_sirq_pending(CPURISCVState *env);
 int riscv_cpu_vsirq_pending(CPURISCVState *env);
 int riscv_cpu_pending_to_irq(CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
-                             uint64_t pending, uint8_t *iprio);
+                             uint64_t pending, const uint8_t *iprio);
 
 
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7bf098319f8..858fbf865fd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -866,7 +866,7 @@ uint8_t riscv_cpu_default_priority(int irq)
 
 int riscv_cpu_pending_to_irq(CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
-                             uint64_t pending, uint8_t *iprio)
+                             uint64_t pending, const uint8_t *iprio)
 {
     int irq, best_irq = RISCV_EXCP_NONE;
     unsigned int prio, best_prio = UINT_MAX;
-- 
2.53.0


