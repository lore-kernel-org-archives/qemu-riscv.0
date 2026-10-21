Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58477606E847
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eUxLcP34;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J8AzBIPw
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMp1-0004cG-Jg; Tue, 20 Oct 2026 23:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnt-0003GV-HY
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:15:49 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnn-0002gp-TV
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:15:48 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2EuEt3469263
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YfBbz1ntshu7HTJMMRGMbG70uprZA/xRojya9HsrRiE=; b=eUxLcP346bJ9nyE0
 VDN9BEmJ7YEBDJMyzf0p+DeAbNsyExWygj3eHLz3dNkEQCzE+KGce51T7+fFDVK1
 MI9FKbNt9s1cc5wMueEV0+m8BWzwDmXoXXGFrUNdShf6ekumOxq4Z53QuvbgT2VG
 l8dW79OH90zxmFZThI8hIzqk5x7lJtywNBQaGriwh0lqCVwJi06R5HOlDd6k6m4Q
 Kl+pC07Q69qzUze7CrMVXeelArpxo6b4ggVBtHoecGb6lpUjXAnU5N9uOzAfsUFX
 U5RqagfPTlBA9gjDNIPQsc2oZKMGK0tpKpEEuw4uWzIP6vPm4EJU6j0ctxVNLizf
 ZS5wqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2ba75-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:15:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91c01778cefso7879426d6.2
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552530; x=1793157330; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=YfBbz1ntshu7HTJMMRGMbG70uprZA/xRojya9HsrRiE=;
 b=J8AzBIPwwVFCjbOTnwbxLJMel3vWm30fsS3vaBOjc5Kw0DvXFC/md9Pv4RAw7F2HCQ
 CE5/Y0oJI0ZU2V2/VSBPcXnbfNMCoGInwY2CsfcVNh10+FDYytHckb8NiSUxJUtP27dO
 zqoHZpRwvBMe5z6LuIiTQw6QVHR9enJF92tKG14TiM5NSx6kHzCoNY3RALWYFI3OEr9a
 Me8xQj/sR1AMa+pCY0BG41gW7j4gXvRU2BIu8HeKw15+LKtbgKKXdD6M57eWMi6l32CM
 8734dB3VQ5oPAA4UqJdHHxvO/alrA+pJlOTedYg/j971ltWtqmySz2zFf1aGC5141gTB
 Irhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552530; x=1793157330;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YfBbz1ntshu7HTJMMRGMbG70uprZA/xRojya9HsrRiE=;
 b=CzMoItdmcQi+gP8yTjb3sQezKSxjc7gUmKI5y70TpXveg/5rBuoSYDg1Gmd9hKszxH
 ysOZ35lH0M09wG5gF20/KjwW3qcrEF3XRdG56u4iD/CKOc0HwumLDaoe+mRi4KSX7XYZ
 N2ZCMGWg/H6z4zKbzWPGBb+7KfyVlP+WEY1JdF0B3B9Y8VCOEoK/fgQhHo3yaZqqhzuz
 +hnKOD97WqSZxlWELg9VdytE+OpxP7yy7C5DI8UmcEJbWFtlpevkFf3XiLNiBm07+uCK
 GtZoLEKOugWRwd9x8j+qmKIQH3WmJahWGVkwkVwqulLExbpU/myCgHLvMCeFc+SDFklX
 VM1w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzrS9Cmnk17qf3AjwFRTtD1hmQ6etf2B8otdql+v2jrBP1qRzbw+2osR3QeaaD2DVYk+zdUZejY6ssE@nongnu.org
X-Gm-Message-State: AFq9FYIOk2yXtKp9w96UczfGeVXJE4k6rDuUTdItP33wz9ONICnzLW3Z
 SGd1DbBeONtzIAgq3wczc+DMc8y2J/rWlTaJTEGz4zrxTsefTeNy6o0/7XMQpU9yyDIX6INR1LP
 4sQLNbg5JN8TE8Zk+fSebVBADL0X/AcIivD/Y3TcXVQkyOztHiVevP8SqLYFqAlPmGgns
X-Gm-Gg: AYBFou0y09VqcOQu5svjhJCDojFTtLWvc899PlFQppGk6Xz5MIx3mzJBz4Sth//VQMs
 q1MsoS7/RP7fjvscUTpHnlSqBfV62XBZ/wGXeyj0M20HQfd0pJ9zoVrdPUcsDdVBbAVPFvhXZ40
 1VhZewCL4paSzqzbIWPWW36utGfApwuCoNTsFGsdAbzYmfRfggJA6SjxjhFyOLJkrniHCZK1zsX
 MIcKfBmKnjhUPvuinxRD/FyyZBfGSIvUD49WlXn+pFuhLJbp4NJzB3jhHb0ZEvukVDM6ZhAvxxu
 C+abwsiYPPQtyNvG5i5bt4w/UUaGbd3Mz4zIKJuFNxxMuxODMIbMnz8mky+c7CrJ4UOUrHLpoMP
 bZw/1RpJhF5MW5yNm03Sz2MbNt3bqzZkLvQ0dkDwq
X-Received: by 2002:a05:620a:3703:b0:93f:1dbf:6cfc with SMTP id
 af79cd13be357-93f57fb8621mr221123585a.36.1792552529805; 
 Tue, 20 Oct 2026 20:15:29 -0700 (PDT)
X-Received: by 2002:a05:620a:3703:b0:93f:1dbf:6cfc with SMTP id
 af79cd13be357-93f57fb8621mr221121585a.36.1792552529285; 
 Tue, 20 Oct 2026 20:15:29 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25827087sm2413903f8f.21.2026.10.20.20.15.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:15:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 10/33] target/i386: Replace magic value by proper
 EXCP0E_PAGE definition
Date: Wed, 21 Oct 2026 05:13:43 +0200
Message-ID: <20261021031407.24862-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AxBKLgIJcsJLbLLmciRP5NkKiKaqi23v
X-Proofpoint-ORIG-GUID: AxBKLgIJcsJLbLLmciRP5NkKiKaqi23v
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad82e52 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2cblKrENZZ9LBr9VnxsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX6MHd/w40BjrI
 oznoXRncVbLcZO6QGDz0N1+vUUI+pNtLykCBWOl4vZvVruoiE+cSVruIWbvsggF+VPiyvseao4g
 HFmXfOejUJjBpQJPTpoWElQ/nyZrN4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX2qjPV3k6T1cu
 uMvp49lE2Tkui6+s7OK94AAONolHpORp5WkMJKDgmn2VDs3jbSvlc9Z59SDZT9lbABKDPUg9ihl
 aN4thkvXeatkoCfP+kOT0iFC/FDQfgOTCZonYcjqdy0i8vGWQNQCs2tuTh1ox5OF8xrhhlW7Oyi
 s8sC0Bf33/1K9BDLXuzZnS9OUVG56m2+ip9HdW+xPUwInz8sEvdRxJtVE/vlRAMz3FMfcIwEinS
 hYWh0+uWXIqqMc0L3pXvQbkFWonR9o5LF1gBuut88Xhk/f1sJhICJSjPFOPOzjv+UqZ1XepI5Me
 XokzVl9zTle11JYAME0MUug5VWIpDkZKkVun4p9IRD8CJngTDp33uEUVOPSZR8Y6uivRqjTB4H0
 /IFoGCRboT45zDvkmWGb2OaC/1KqDbe41ecHqL5gIhm35bKjl1lRfapCZDhZN8IGw61QqlPGyi7
 WE0ILK6fOieKzNFIiQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

No functional change: EXCP0E_PAGE is the 0x0e page-fault vector.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/i386/tcg/seg_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index cad19f9ca6b..c89d97e022b 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1215,7 +1215,7 @@ void do_interrupt_all(X86CPU *cpu, int intno, int is_int,
                      env->segs[R_CS].selector, env->eip,
                      (int)env->segs[R_CS].base + env->eip,
                      env->segs[R_SS].selector, env->regs[R_ESP]);
-            if (intno == 0x0e) {
+            if (intno == EXCP0E_PAGE) {
                 qemu_log(" CR2=" TARGET_FMT_lx, env->cr[2]);
             } else {
                 qemu_log(" env->regs[R_EAX]=" TARGET_FMT_lx, env->regs[R_EAX]);
-- 
2.55.0


