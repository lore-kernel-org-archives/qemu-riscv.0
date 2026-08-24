Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464F4C5DF94
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:20:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wySj9-0000lY-V9; Mon, 24 Aug 2026 07:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySj8-0000ia-JG
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:20:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySj6-0006UC-VC
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:20:30 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99KSL2900989
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=; b=E5+xTKN2yuAoWHRX
 Y1JYTo0NFKYslrAa/Oc+I5r0oCNBZpfYwCbTRhMl7TknPRBnDQbamuWoPAZ3eCXw
 BMlRogW6lWwmVdYJM5KisTwL4xGY0e6+DF8S6CvKbCk2MUZhDxqxoKGvsPh4q6gw
 TOr+ZMXCmbM+HeJUjq0cOiJ01/9RHLND7nzc3hxwn5hKtj4M3I0+4sFpLYO+EEUe
 yukezxNXGOVU5sj02YdZt27R+S5XXCGdTJkAHmI/1H63ahDArmjL1i87BmXUXKkE
 7o8+sY3QiZqO7Sr6l2W4I75cfwoz6RI0E+bIES64Oekx5rXTWesYp+HwQxsHlaAW
 WrAAPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgry62-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:20:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52d28f8737eso62629911cf.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570417; x=1788175217; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=;
 b=OtQZ2g1jPNHXWHC+PKcfc7xR+OxcUphby+kOwNhsFmJ2Olkz5jxVkoJxXGoi8MNKwG
 wOHn9CnTq9/VabAFDYFZridzd5Z+dagHcLCV387gbtLF3xZIALpYJWCVLqIM0oMbZ7p6
 O8ne1hjmGKSg3VNA0kHYytl1BBEm5KN+MZ9ZeC1Sb2W0x93g5W4uUr1BynxQUMeM+CAH
 vXAyUJn9nogclOjd2o+weXes81I6SK8gXf+m4Aqnk070zlnzdnv7wXUBKxw918+0cyDs
 poxQmVVAvBRtGVD7xeDiDDiBS5wa0H66nLgP74tWxlVnmRsUA8z3quj8WaDlpCRJCsWD
 f4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570417; x=1788175217;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=;
 b=sj1v6vQg6pFbOFa1Hivr8eJuBh+jFvha+oi6VgYNjQJNG5hgbT0e9lWrff+5d7OLKK
 Rax7cUyWO0ddBTlQN5hV4SFtz8FpaX5acfKTfCl5WPHNXKIHEI82zzaP2gRj5+HlFQVU
 VbzUvZpedqtS05LV+KqygVd2PyRdJALUYUKG14d5rqUYKOLRLvTKBf91RtG2XPDuGorU
 EOH1bWhnAeE0uZ0v0WrzI6eky0iL4mLjjGLFRUGJ+xrBMwY7EVZgjRA1eblCsnL83UKp
 QXp/HtMeiJH7pGp2MnhCdTeZV0w3643SwZsjpde2VNPsJUNIGZc0FI0lO6QdOf+wIXzr
 bpvg==
X-Gm-Message-State: AFuF++lPD+/LhReIifCi8DMwIv9duvD2GA/ZbiXZoJIMdo7OkrbT9zos
 1VDmoBS1OwUwh3dFQrhqLqxidP38n1JMUfrkdu1UYlYzjqY9tNE2TpQQqF8XSB8j+jj8cq6zvHI
 RItVmKIqUBXwW47P8JFIwqUWhWEHUUCpP7DShaF48RGYecitFREwNawBxvA==
X-Gm-Gg: AR+sD11tpmDk5yCdgd/JV8XyJVQ7mqsdLd1s9IQiaY69tTjRB3DMUt+gUDpq/CBgRuv
 Y0q3h8qIgaAfVaxcOsSsE/lXoNbwsiK6LSRhSIgvLaeU0JIT6lnSE2vzve4Ze8VYb+MGljZ0AvP
 jZsW+C5DKbhLgnEU2Oz9ZzsDKpnbS4bLwYvQo4kzMsjEPmXtagGE/Pvr/JkU+tdfBTpThRBQWz6
 r4Za4sxjExpBStMlTdhRnPf0kiLLHjff9NI7s3YtgQ5GDK1xbwgMGdjCRN9VvaLrh8J0zuP2EQz
 N6K55mt5xr8CtpFVODl+Aq/Hw0/k5tQozp3NkcIV7T1U1Dk8xllZ3Gta0txnrjz2SvmDlUchsVh
 O6un7XqzuLpWlGoUM6oB7WYXd7n+fK0us43IbVAWDYJppLxn+hA==
X-Received: by 2002:ac8:7e8f:0:b0:52d:a151:10f5 with SMTP id
 d75a77b69052e-52e09ca57e5mr169643661cf.22.1787570416902; 
 Mon, 24 Aug 2026 04:20:16 -0700 (PDT)
X-Received: by 2002:ac8:7e8f:0:b0:52d:a151:10f5 with SMTP id
 d75a77b69052e-52e09ca57e5mr169643111cf.22.1787570416416; 
 Mon, 24 Aug 2026 04:20:16 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b208sm1135772366b.10.2026.08.24.04.20.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:20:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 17/20] target/tricore: Document architectural interrupts as
 not implemented
Date: Mon, 24 Aug 2026 13:17:06 +0200
Message-ID: <20260824111711.26297-18-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXxQLNxqM20Mox
 6dUm7rxv/n4Eez7M/uMCeao+z5c/IP00tfEpT3QGGybOmt6EcQlCJT8Q29CwTZ87xSbXSKBu5FZ
 0uRBQfTKyedUnur9E940xJGMZR/Iel8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX9Ux4llwKMm0L
 NTfMiw3aaSQGf0LOC3CIQPY+jaKEwx4D7kVb6Oclgu0+tAuaPxrmyCdHtSCD15U8SnRrNH8jhmy
 hKfeq1jgvCAfjqjLRGSMrEJ2+OJzbbG3ChUeKiJBb69dvVjjBmnibEK/rDQOxVnaiQEObFP3hfz
 FCpFMMgHUt1WOfLM0R/a1BUGJ6O7aZQNXktMdtQ1NIM1Eygw3GtDIZWSokY17oiRDPFdB70BgO/
 1y/Y2T2lP8G9nM1Weu1a9OKbswHmjhJl/YzyfOaCA1oaCWFdmUdkJqvUlvhlRXYKv+h3fdwmVAW
 do6Wnv9ebnBKzvHzW0IzjA3MdaiFNdLRNhy7KDKb977cuFMp/CTEsrQdZs33XphCNgBg4kSlM+y
 apL9nuvLlhFSXfXBGa6yuQTTc5LpBuMCyrCgsU5h+w/p+D1pvnFz1DamUuqjOb8ifHcXmyKK3k7
 1UzP2L7iW+9kvaYG59A==
X-Proofpoint-ORIG-GUID: Zz2V9-UCBjgCn43EfX9UPdBpD0a1OTgJ
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c28f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Cu_OB6cER5A0ZMY7a4UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Zz2V9-UCBjgCn43EfX9UPdBpD0a1OTgJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240094
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

As mentioned in commit de680286b52 ("accel/tcg: Make
cpu_exec_interrupt hook mandatory"):

 > Tricore doesn't currently implement the architectural
 > interrupt handling.

Add a comment to help understanding why this SysemuCPUOps
has_work() handler is simply always returning %true.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 6d448727005..82b56c3cd56 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -113,6 +113,7 @@ static void tricore_cpu_reset_hold(Object *obj, ResetType type)
 
 static bool tricore_cpu_has_work(CPUState *cs)
 {
+    /* Interrupts are not implemented */
     return true;
 }
 
-- 
2.53.0


