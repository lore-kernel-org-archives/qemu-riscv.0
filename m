Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D44C4450A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:36:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLJv-0002lu-DR; Thu, 16 Jul 2026 08:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJt-0002lW-RE
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:05 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJs-00076A-3r
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:05 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBjADh2506723
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=p41eQAD03Mo
 g206u+s1DnOIZYXGjLnr4ZfV6a5KwsaQ=; b=LVJjYPHJ9/zFzc86ccFvfnkKAiY
 0NB9SmvWNkJa+SyM57bXybDu01/1YN/ZjAPka8CYJe+gnmYNpJuipOi3BSwGr8rT
 ovlHLcsVhPG992Ipxpvhsl4Xf8U+ff8XJXJGi8aleAw8mF549iIOQlXlIWItzhdb
 h2xX/rPC90EHx6X61o4QbkKKlXq1eUKXdZ9d2ppMOgOE0eo69Aw3Jnv/hB5qfXDS
 uO9q8mdZ1v47oNeXRJgR9DM+yfg16AzoQLJ743GH/iwdXY7Cp7XsC5gAsmVo58lA
 XoLhOLWs5w9+/qfOQtTi4cq/yhhEnLmuROiJ4AmvEkXtw/7lfKE6Xh+E14Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvbsst-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e56b2b350so1297277985a.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205361; x=1784810161; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=p41eQAD03Mog206u+s1DnOIZYXGjLnr4ZfV6a5KwsaQ=;
 b=G9X1oEAqr0HeKaSQ2WhlnGa4UJXoOm86FyKhqoUE2b/GxCtnWQ+XejmRECIE4D5vgR
 RoGUlnqLA1NKTFkx7gMFYpShY1tCjKaUwUJj4GlwKFiWgFVlfGXHu1oUyRwx5qcLmezQ
 N6Km2/e7NQK/BWGCJ58wtiHIHTrX+UMsBq3l7/HhlqYUFgu3/qNftGx2ZCXsSvbAIM6x
 J+p0Z5uVOF6xPxj1twpccyCh9xrtNCwnnRnvRjxXTEsMQYnxNxwIfQeVeYgsRrGNBSwg
 U8tz3/fbRuHAptCTDeAq/q/uPoQlrKjTBsWE0fln7IZQbhmjcKoXIj3AYUmYs9+adYYv
 dbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205361; x=1784810161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=p41eQAD03Mog206u+s1DnOIZYXGjLnr4ZfV6a5KwsaQ=;
 b=Sr8cloE632xA21xCFyiXAxAIPLTmEbx8pBnUk8TPrvdnLu4sKAaR7yqWO1AMKGyU0b
 O5l52MYMHC7GHFfc6hzKHY7hOwpeEZZ2j3J4e20W+6MK1sZa08W0b4UEDEwwSkSNBGDY
 wb4C4RcUGUQ/YjgGXCGahvk1U/PG4LWknuis/cHDi2gcs4wXUxDUB14LC5n1xyEnCcBU
 +Zj0CVEi7dOxxx9t5BOsDYfZowiKkJcQyxvXATDejsIrzLO//kx6Jb6gVxFSPle92EZO
 PcLXlgg1qClT0V2584k6r9scydLLd2gwjUtMDhAR6cYRhZgSVRvaITWQnjlBZ+eiUgaR
 egHA==
X-Gm-Message-State: AOJu0YyMt4i1TNnJ6Y1y/GT+2UrY07aF2Jgrw2iV8yoTSdgwwOYe8J9z
 VJrV9rJ7Pstzi58DRime/azxGsBKvVH5tTyAxLfD1rC3KoI/BRABi0WGgmh3kSYGNntglqCQxYd
 U7XTAv1PXSfQnnb91I01gyBqfbxWmxjFH0/5km9IRWJG47MNhcBTt6VMZvg==
X-Gm-Gg: AfdE7cnH14NXU01cuu0INGgRJ6eUhIcLIac+i16h/EXIJ8s1fx45vT8PSxih2jSeMJz
 MHEzygX1zJe414L4wa96CBqNOzJAP3iYfH/EzhmI0iq9M3bQACfpof/OAu30NIdrCZ6OKQFDxtE
 QqrmN6TIINRClkKfiX3y31GS1JJUwENndHDMsxvaq25kgGyPApU+eZ+9vCaNeIuIIFu8Qc1qYsz
 fqYswMhZe00q9FgfuGGR4+Zes+laENB8Ec9qxTyDCKe/olhxsXw2dgk5TBy3mnqGHGgALWKcXPT
 dgpJie6TCAwcc1gj/VDkMG9w+r2ZlCFqJkcM6uWe88j7vOYkxPvLBfaKsSe3q/ErA9xcexYPJVv
 x0T5WophbC0VUl2lFedd2bJlxoHXSYwk/brE=
X-Received: by 2002:a05:620a:470e:b0:92e:cac7:9706 with SMTP id
 af79cd13be357-9309636ebd5mr786544585a.52.1784205361073; 
 Thu, 16 Jul 2026 05:36:01 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:92e:cac7:9706 with SMTP id
 af79cd13be357-9309636ebd5mr786541085a.52.1784205360666; 
 Thu, 16 Jul 2026 05:36:00 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:36:00 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 07/17] target/riscv/debug: Fix icount privilege
 matching icount_enabled() test
Date: Thu, 16 Jul 2026 09:35:24 -0300
Message-ID: <20260716123535.3709148-8-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58d032 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=3jnf9fXNQdWrf285FekA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX54wvodeNxT7m
 2WFSO9yypJBzYB4g46GAZpSr56xnItHz3rcZoYQeneNxA6ElmANBoBFY++e0u1BKzt6Whd5hCKQ
 gTtTeizCJxVEdXHrq9zsCrrONF8Ttz4ws37MGXJZRRsYQMdoA25Hk57bUqIHkv3jTt0+9+Z0irG
 AyZp4/+VGyLWyndrhTpRZNSQegBIxZI6wmyHcI8/zdn9n833Jq/7+xWjkcfwNqn/TnaWXaeQvD9
 1kL3JTogQubFhQ/RY2mBsOnVJM7aBNck6j37GDfSFm0znlFk0ASpqz9NMPpkoNwO9k/roevZVOw
 ZTCdV7gmEp3+13nu/isAV0Lt3xOb3hLF3yAaAoQAhOSc7NI1z7gBEqD2lP+ZxNE8JtlTyf2hiQC
 A44nb1RFcs+DGDi1BuEUmvg/66KyHQYzSezHQCG20YWNdQ2wBFfqVYgYABrBvlXPCCJl1ctI8y3
 0Jjv5bAL3ZBHnyESuIw==
X-Proofpoint-GUID: QrdQ_H56hODBGEdtKyX46l59HkYo60QD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX4HoKMpMtFbOn
 k0aKkc9ewqwC0SHDRlWLFNUg/QrDiJQY275gXrkMhZ6kAzMZX1j8GUsDX7vwJRnzlQw01oJH5rc
 fn9Tyo+RF9gDKKBZQdFaisBalLuhVjw=
X-Proofpoint-ORIG-GUID: QrdQ_H56hODBGEdtKyX46l59HkYo60QD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

From: Nicholas Piggin <npiggin@gmail.com>

itrigger_enabled should be set if the privilege does match. The test is
inverted.

Fixes: 2c9d747121 ("target/riscv: Add itrigger support when icount is not enabled")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 6aba7e9e12..3edbb591ca 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -681,7 +681,7 @@ bool riscv_itrigger_enabled(CPURISCVState *env)
         if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
             continue;
         }
-        if (check_itrigger_priv(env, i)) {
+        if (!check_itrigger_priv(env, i)) {
             continue;
         }
         count = itrigger_get_count(env, i);
-- 
2.43.0


