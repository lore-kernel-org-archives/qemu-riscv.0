Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E0CC5CFEB
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 14:16:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuWEW-0001vD-Cn; Thu, 13 Aug 2026 10:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1wuVfa-0007sW-PK
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 09:40:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1wuVfY-0006CA-Av
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 09:40:30 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DCK1WI2414731
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 13:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=7WQjczii0kmht1jrY9U/8fYerS6jcI4YNXV
 mdT1tbhY=; b=fHgLj7KxRFXEmEB0C5D3WsyE1vxghoyanDsCmnW6/4SJVi1GWmV
 Sg74O1v8Gt/WPOcLoQ4PvyJ+/cAyN5sJ2QFXcCabh8PZoPfEoW+JwBYNnfSwQiXm
 /7Q9yFTjYArYmE8zYlWdXf0lGsMXjQeQ8NtGGV2OEGJv9+Cnds9BiNQXwToPWOdE
 xAKS6nWKW/Lm99R9DfEl2UJdb7YYriLsuyM/BXcSSLaXBqtEJ3d7y0ra6lRseUdK
 p8+7ppQCTvsKVFG+TCiRNMvvPZYDIGw944QRUfb0NyHVGhgHIUrHjGkMALOO6ip4
 4jXVHuvmlKp5E8DY4ZNaZ82J21H5WXEt8QQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g143htq48-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 13:40:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-cb835525b10so906633a12.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 06:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786628423; x=1787233223; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7WQjczii0kmht1jrY9U/8fYerS6jcI4YNXVmdT1tbhY=;
 b=EZi15AJxLVHY4UpIXCvZDJkF0smvjJpwSGDew+uFkJWO5KN2bcCB4IQUsI9E+GyNAQ
 EXRD1zDDODr13gcrpU/V+NU+Nh9Dmty/EWRBVS/C1IJv66CLh1qxxeJiYVUcw3LsfvE0
 +fmp3spwUI8Hu3B6wYqqiyKsqPCJWOeVV8ibH8fW5b6El+IN368Gczcc8TeIWQb0ycHw
 FcVMp2xP1y7cDwlcHFVmwfRGq8RfJLDmBXeYGoEzHBkfjOK4tAhLKfQjV1CaeYuhwwJT
 42NSAD+FwvPkS5h2FSOukDaaS5mUPaegG5hIGbG55t7C4ZULbRlEyD/GPUvuBpsXHjo7
 wfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786628423; x=1787233223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7WQjczii0kmht1jrY9U/8fYerS6jcI4YNXVmdT1tbhY=;
 b=F4MUL+NAlsscd4pfkMcFPCYOuFNXyFOHa/fZiDF/aLE0OwBgUYoK0gVGtXGcIDmn7g
 N1EcQDH2r6J8xxHHN3M3rTqprwGgOUnVlNfrR+MUh9QPHoMzuJat0jLfcYg8NTEO4xG6
 zVlAIbylDk/ITbC7kaAMDObonU5zu3CrfJEI8g8sFQqsVWwwjdIsrgZuJmbhcQQeEC/L
 mNrc45REYEidfX3SnYRjZZIMPfEtWQad09HlO7LiwvquDSFsHcBNMsBPWD2q88dHsdBp
 aKTXMsy2iAsVkJiOdcaJCWstaGBMYG4QmqCaZ0EtEkxfCUO3twfFQ00nvoCo18vmYfH4
 topw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrQr3tu+Ri7qcdHGTVmdKAWLjVmoY9YmW97ZUyKxeXarKoY4/jHe8bYULYRFQQFS/0xtuJSkjmOod+L@nongnu.org
X-Gm-Message-State: AOJu0YxHWVnlxknA5ISNBn5vPeqmWvYM6UjCJaTFPkRFu8ZmYUP+4Pdm
 hd7MoRfbllmZhnitemZaXFsS+ahH8c1Kg4B5tgE142TqDwpMAW8TyQBxBZ6OWjjrOFDsFDIRtu/
 0x0xe8OCv35jLUpSLy8SIOjKLds938SwEg51wrPEc+OqO3DsogKnziMqOuw==
X-Gm-Gg: AR+sD13zPaGs7y6Q4PqjP6/wVvtQc3hnmQ+hdEqH7uwbYRqu7RDKnHKDVeZAOK6Oc8J
 XhefuNwV5WhAIBgYwPfCqTfezKKBIXkc7udcL3jQRLlVgSTzBtuohjwdmuUc6UB9pkXuvOWCsGI
 EZfXw6lV9/lym//L1Qv3+uPrHiWiGiodqQ1WDiPlSD/ExRTVuZje6YKSyBIUkd9lHLmNkgmRcX6
 95CWVJW8+1n44sgfjVX7Ig0RypchL6a7GrnK4l8EEFeJz1o/xfBX2YTWnZt81wCJsW3me0gQw85
 nB2hb6zRbGs/DLytbr+IdaSGsv6cwO57o/Esl6cE3ee+9rrhuMnVat6vKqsQ7cOSzlnz4wMaFop
 uiQzlCgTeiobsDFVpErR0T2QnXACFdgLcugjN4G5JX9pj/waneziVNTSDLH8/WYLB51OiO1DpyZ
 Lzsk0xLOt4EiZDTIPvRX/ru2OcLg==
X-Received: by 2002:a05:6a21:38e:b0:3c3:92ba:c61f with SMTP id
 adf61e73a8af0-3cc54f46294mr8302214637.8.1786628422521; 
 Thu, 13 Aug 2026 06:40:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:38e:b0:3c3:92ba:c61f with SMTP id
 adf61e73a8af0-3cc54f46294mr8302152637.8.1786628422101; 
 Thu, 13 Aug 2026 06:40:22 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-31ebf732166sm13676384eec.18.2026.08.13.06.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 06:40:21 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] target/riscv: Fix LCOFI masking in sie/sip/mvip
Date: Thu, 13 Aug 2026 19:10:01 +0530
Message-ID: <20260813134002.862578-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R5oz39RX c=1 sm=1 tr=0 ts=6a7dc947 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=aWkNX-pSukNysjBq-6IA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA5NyBTYWx0ZWRfX9mhr0ohpOw8+
 750k0VNaZLHLKo+ZeeL1i8OOkQChCdLJsm3pW/FYcUgBfuhCfGQd/ti0Uz30FAGHC2uwzkO/IIn
 QQPBZAIUe3NRXvlufpXPn937EVkfBkIVnX5zuE/DPrdzy5Gh8KkYv3wW4/V2EjDrojevTxRgQ5r
 0MjRcsQIyqOeZpQI4kwQPagq2WDP3q6nEPVHSnSpJYxSt6JKGtL+eB7XpUOaJc7LpfC0Nz08f2P
 38GFsmHFJ5sQRGHDVxSUlBVTFqaMo6agmmsUJOspyxz4VeFcQcrrD/D9TCHqHTnV+LeYmBMzgNV
 QyK0ksBnbkj2Gkarb9ogyHNeKajVWQHB6sSmAdfcTrPO/RWrPFu2skeF4WyWlSuY/RGEKVzC975
 0bzEVRbaXTwpxszsYFeiF+Eg4yBQeKCBCDbYiFsWchAxEfdJNcSx59KO1WzrtSmHoHtGTnep7vw
 fyaHzsydOUBEjXRADbQ==
X-Proofpoint-GUID: bNx5QjeRk8m5D-LYs5i8B3Am6835T3qD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA5NyBTYWx0ZWRfX83EW7LK6PM+u
 UcAd1t8DUU9g1oStxoaLFZ+vHbNYCZDLntKDr3zOpYV/kiTfPmv5Io1MzK1fJz37gIoiPTvshtf
 avoXaMI4q72jjUn7t/kNg6s6/31DBFo=
X-Proofpoint-ORIG-GUID: bNx5QjeRk8m5D-LYs5i8B3Am6835T3qD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130097
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mayuresh.chitale@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Aug 2026 10:16:34 -0400
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

Commit 27f9566dcd98 ("target/riscv: Update the local interrupt mask")
dropped bit 13 (MIP_LCOFIP) from the supervisor-visible interrupt masks.
As a result, with Sscofpmf enabled and LCOFIP delegated to S-mode, the
overflow interrupt would be raised in mip but never delivered and hence
perf sampling stopped receiving overflow interrupts.

Re-add MIP_LCOFIP to all_ints, sip_writable_mask, mvip_writable_mask
to allow it to be writable again.

Fixes: 27f9566dcd98 ("target/riscv: Update the local interrupt mask")
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index c05c8ee076..ca68c1f5f1 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -1890,7 +1890,8 @@ static const uint64_t delegable_ints =
 static const uint64_t vs_delegable_ints =
     (VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & ~MIP_LCOFIP;
 static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
-                                     HS_MODE_INTERRUPTS | LOCAL_INTERRUPTS;
+                                     HS_MODE_INTERRUPTS | MIP_LCOFIP |
+                                     LOCAL_INTERRUPTS;
 #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
                          (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
                          (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
@@ -1936,11 +1937,12 @@ static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
 
 /* Bit STIP can be an alias of mip.STIP that's why it's writable in mvip. */
 static const uint64_t mvip_writable_mask = MIP_SSIP | MIP_STIP | MIP_SEIP |
-                                    LOCAL_INTERRUPTS;
+                                    MIP_LCOFIP | LOCAL_INTERRUPTS;
 static const uint64_t mvien_writable_mask = MIP_SSIP | MIP_SEIP |
                                     LOCAL_INTERRUPTS;
 
-static const uint64_t sip_writable_mask = SIP_SSIP | LOCAL_INTERRUPTS;
+static const uint64_t sip_writable_mask = SIP_SSIP | SIP_LCOFIP |
+                                          LOCAL_INTERRUPTS;
 static const uint64_t hip_writable_mask = MIP_VSSIP;
 static const uint64_t hvip_writable_mask = MIP_VSSIP | MIP_VSTIP |
                                     MIP_VSEIP | LOCAL_INTERRUPTS;
@@ -3953,9 +3955,9 @@ static RISCVException rmw_mvip64(CPURISCVState *env, int csrno,
      *  alias_mask denotes the bits that come from mip nalias_mask denotes bits
      *  that come from hvip.
      */
-    uint64_t alias_mask = ((S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
+    uint64_t alias_mask = ((S_MODE_INTERRUPTS | MIP_LCOFIP | LOCAL_INTERRUPTS) &
         (env->mideleg | ~env->mvien)) | MIP_STIP;
-    uint64_t nalias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
+    uint64_t nalias_mask = (S_MODE_INTERRUPTS | MIP_LCOFIP | LOCAL_INTERRUPTS) &
         (~env->mideleg & env->mvien);
     uint64_t wr_mask_mvip;
     uint64_t wr_mask_mip;
@@ -4188,9 +4190,10 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
 {
-    uint64_t nalias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
+    uint64_t nalias_mask = (S_MODE_INTERRUPTS | MIP_LCOFIP | LOCAL_INTERRUPTS) &
         (~env->mideleg & env->mvien);
-    uint64_t alias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & env->mideleg;
+    uint64_t alias_mask = (S_MODE_INTERRUPTS | MIP_LCOFIP | LOCAL_INTERRUPTS) &
+        env->mideleg;
     uint64_t sie_mask = wr_mask & nalias_mask;
     RISCVException ret;
 
-- 
2.43.0


