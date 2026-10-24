Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA7D606A31A
	for <qemu-riscv@archiver.kernel.org>; Sat, 24 Oct 2026 07:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cq+uPelJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IDn4FL3u
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKVjF-0006JJ-3j; Sat, 24 Oct 2026 02:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKVjC-0006J2-RR
 for qemu-riscv@nongnu.org; Sat, 24 Oct 2026 02:59:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKVjA-0007k3-Oe
 for qemu-riscv@nongnu.org; Sat, 24 Oct 2026 02:59:42 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69O4C3Wr048138
 for <qemu-riscv@nongnu.org>; Sat, 24 Oct 2026 06:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=6ql3tJi85y24LYD6lUerNQRTKlNLRlL0XIl
 tX4M1aZw=; b=cq+uPelJ+o8Wcn/bJK3/uGXMaqT7C08pf+L+iLpoWO5f+PlqkxJ
 IV/9AmyXsZyDieZOn/DQm5XrskjUHo1LnS/0BRp+iB7Z5bfGaJjpX8dJkn89lXLO
 SbQri9wCWcEbzC3y5eF2xkwsj9mDkAxRtAXw81NF1ADGvvMecuTHmwYnBz46l7FV
 T8VuO8IVQUFz5Noxp87DxZzQ1E7scEKr+Cj0jVQs2LdXnpip2A8bjxr2gW6+zSVw
 woFdLSDqJA4XtGclr8uGzCxiOlpzj0l0onTRdEHNf01qPSWaKFBFzCvdTvlUozpy
 1j2QY3hNVgpEJywWH+/tdIQ9oWZsVjT7a8w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnehg9a7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sat, 24 Oct 2026 06:59:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f13c143c8so289804585a.3
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792825177; x=1793429977; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6ql3tJi85y24LYD6lUerNQRTKlNLRlL0XIltX4M1aZw=;
 b=IDn4FL3uvffr19IWblSyO8AyPPlczGDW1ihX5ME8AcrA5X2PiUJ3mqmZ3AmJlOrZ9G
 qsCQOgSazWRqpYwkRKuXto3+wA7VjqSsWtORPYTjmbcsmyAIfWlmkLuxygAM1RpzdSqF
 ScnJ+0A2sIAimfNLTy5gJIby/S/pBJtQV0Xu9XmP10eZG7yOYqJBrDz78+GCOdboUfeX
 4W9mn9L+xGagH0/HC6sbrzgCxvZd5seulItIfHO7aOh1p7lBZA7dVwchLx155qYFLGOt
 oLQhqzn/KHoPRj3hzO0OK4jA+kRlYNA5vrZ95aHBV2dyx3ekQbiL650gzm375sbuoKB+
 2/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792825177; x=1793429977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6ql3tJi85y24LYD6lUerNQRTKlNLRlL0XIltX4M1aZw=;
 b=0EwMimncckX7NdiSGmEuy81zXUcoKPaq4D2ZJowvd1bkoVWyPLMICNQtWiOpzIrnI8
 cuT71MQeHCL67UoXf8qOXcjSae0I+nFm9SyBCybaUfDYlarYjoz3CawR22QGit8bqFIp
 uySafsLmWKk6ARmw+e4ggDXJ+C/eDc2LNAC/dKRDFNiPmPXDQmxM8gZGmGXUzGExz9I/
 kjZoGRJA5aJZW5bY+IHO3YJdm2y9I3p0lRMMKZJG45f324WAmV0SQHjg/w5IuzXJ0Pa0
 WG0uNzZk0y4glrc3mpqeLTLo68mIgFXMn26jv7NyJBzDfj6PlXX17XVW8LHU+uC1u4sY
 mHqw==
X-Gm-Message-State: AFq9FYKLT3YZwsd3GaHZ5fXB7FO/6QpP9hoSVzM827HnN5+QrSWq+NrO
 PRrt3S48I80Oo/ofYDFgEmtAWzrnXY4F6QD5b91apnl/5998muRrbktKhqGknkRjqCRfATTj62k
 p1yHDyeWVe9QC24QxWIjexzqnwGoP+JV4jcbSez/JYXR8i8DzWpqNgO3cOQ==
X-Gm-Gg: AYBFou0o75PHCRAgYQy0YXQKZCIdYrsC+suUBR13Yzdvoh7FYan8fZ8oUd85ksHvFVe
 yq6iunCGakEfVB/d9OB2VdzEp+CqlWg/Vkr51ngGujaNUYc7iDLSomM3BpzVNKIHA9i+uUSxXoz
 k+5yPF8IWy3KBmqQdnlzpSQt9mmGAAmh9nVp3lYAHwuVetBG084IVB3OvGcMyjfqSYyDo36+p0F
 BY4WubBuMIezaEtnKyEXrp2U8nAB8LzT/bBMR6Uci9OTF3LG0A/TgC4dtEbHtQ79QehbCWvWqPU
 bDBDHppkskcnosTRlWhHs3Fv9gHeBbnA78cSfGDRO2DU21rS8xWOLwjhl6XOmYXyC7jM5IFn/ww
 7kHjqgsaN7/IWvMv6LZjyH9Y0bWd6wXc4LxjPWA==
X-Received: by 2002:a05:620a:4408:b0:93f:1936:b206 with SMTP id
 af79cd13be357-940ef9d4881mr159173785a.83.1792825177274; 
 Fri, 23 Oct 2026 23:59:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:93f:1936:b206 with SMTP id
 af79cd13be357-940ef9d4881mr159170085a.83.1792825176392; 
 Fri, 23 Oct 2026 23:59:36 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.125.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f0a9720csm112753785a.42.2026.10.23.23.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 23:59:34 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Fangyu Yu <fangyu.yu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] target/riscv/csr.c: allow regular mstatus MPV/GVA writes again
Date: Sat, 24 Oct 2026 03:59:30 -0300
Message-ID: <20261024065930.26750-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAyNyBTYWx0ZWRfX11RZ2ZLue3Jm
 BQUTP/Tyr7DhEPWmfyQhtIPnIMvx56jcypfrUMGu284T9drKl2zKP7r3b2mUx54l67uG/iBC5F5
 I6fAvOvT818nPdq9XTNTNf3B6hZrDUU=
X-Proofpoint-ORIG-GUID: JVOxfom1fiIfANnifgF2Y6S67muJyrDX
X-Authority-Analysis: v=2.4 cv=d5tgWhjE c=1 sm=1 tr=0 ts=6adc575a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=AgQEunjic7gIBKSbIeB6Ag==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=2-HHZJNMt9pQZSuXdbMA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAyNyBTYWx0ZWRfX+LfGmved36kF
 YCq6JAIF/5QRGstKUE4AEOAysabBgtuQbHHfHBnJAg4MjVabTwaWdjh+Vs2to8EOAVhyzJrosEm
 OD1j9OS7pHqeZnn2Fuw9d5bXUrfmBLeOcNc3wzXyi81n7xU36wsr4aOKfgTFmcqN8r8L31yJ2RO
 qEYZ0y2ZpntrfG1Hfgqd36eYgYqQZAsU0SvCqyI+FG82JjnIcf7iY9mOHn/BJ+tagYatTOlxZoY
 G4L9OOemNg9ApruTMfUq1AW/IMKFngE+dy0FHJPcNB/E8IUuj2J31HgmRFTTbGVvFj9FutKfs9i
 bacTNOnMuyXOh8iMxhYrm+5boxiwWede3GYf4RUVHq241PlScssEN7f+nWWtbDRMr+nddg4DBX/
 UvuhR6zk5aHQu3ELjptU8+3cFwD2VDyzYnj3X67SjS0+IBJXSpYVhCnypMsLvbssCOXcBE14Lnh
 ykPEqU5NoPLMq157iTg==
X-Proofpoint-GUID: JVOxfom1fiIfANnifgF2Y6S67muJyrDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240027
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In commit 18645f195789 we removed the capability of MPV/GVA writes by
software, claiming that the ISA says that these bits are changed by the
implementation (i.e. hardware).

This fact alone can't be interpret as "so software can't change them".
The ISA never mentions that, and we shouldn't just assume read/write
accesses based on whether hardware updates it or not.  M-mode software
can do whatever they want, unless clearly stated in the ISA, and that
includes mstatus MPV and GVA updates.

And in fact existing software is writing to these bits, as reported by
Fangyu in [1], and that change ended up causing real problems in the
end.

Revert "target/riscv/csr.c: do not allow mstatus MPV/GVA writes".

This reverts commit 18645f19578955ec5ff2c40cd2c8753d6bc460c2.

[1] https://lore.kernel.org/qemu-devel/20261022120111.24298-1-fangyu.yu@linux.alibaba.com/

Reported-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 13675b4a84..af444e3e6f 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -2108,6 +2108,9 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     }
 
     if (xl != MXL_RV32 || env->debugger) {
+        if (riscv_has_ext(env, RVH)) {
+            mask |= MSTATUS_MPV | MSTATUS_GVA;
+        }
         if ((val & MSTATUS64_SXL) != 0) {
             mask |= MSTATUS64_SXL;
             val = riscv_write_uxl(env, val, MSTATUS64_SXL);
@@ -2150,7 +2153,7 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
                                      target_ulong val, uintptr_t ra)
 {
     uint64_t valh = (uint64_t)val << 32;
-    uint64_t mask = 0;
+    uint64_t mask = riscv_has_ext(env, RVH) ? MSTATUS_MPV | MSTATUS_GVA : 0;
 
     if (riscv_cpu_cfg(env)->ext_smdbltrp) {
         mask |= MSTATUS_MDT;
-- 
2.43.0


