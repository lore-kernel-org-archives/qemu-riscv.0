Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CDB606A321
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 21:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HxwGRW51;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ehz9dtDv
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQtJT-0004H3-Js; Tue, 10 Nov 2026 16:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQtJR-0004GH-Gk
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 16:23:29 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQtJO-0005fn-Qo
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 16:23:29 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AAIonur3136059
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 21:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ml2gggJhbDgkcyYKoCSjeLy7/VbIVg/vvKwp99ErNKo=; b=HxwGRW515+4s1vwD
 yWtiEKTPiMm+ahjmOZNyjQNTwUk4DqH1nBhEGQTXy36r34LbDCyArzc2252nCLyw
 auV+V6qRLLoqCpoLJZ4KKnQio4pNrUM10FqhW3WZuxyi0HP7HYtWDhiWFQEf/AnJ
 C7XXMQ44L9dHQh54BaHPeymeQS81EdpnBzmYLXlGlrXoWR7vGfTvR/AsWx9liY9b
 5Meuimp0/KUE2n/y7mc1wAeo1EJZghPWeqmjpLCA1J+UPhIaTwG8QLmV0cdom8me
 7KlzSX5J+kR8k2+F3yTRCbH7z19FzEyWtigmqqKi5rqg7FDHBJQ8PUlfnj/bw0sp
 vsO60Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5h3jq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 21:23:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91eb556c8a0so49887026d6.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 13:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794345805; x=1794950605; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ml2gggJhbDgkcyYKoCSjeLy7/VbIVg/vvKwp99ErNKo=;
 b=Ehz9dtDvSHTAYK5tp8xV37E4zQamPgDD1t27p2i63zYr/fBf9swGIn/bno4JYSDLFK
 GXfkf1QE7X12Bf7Kf+XGEz6zjBAfAAyJ1Eh+IPcGfxQM8GuPIiHoDbVUh5x3D0YLPkMs
 kgY4syV22ctknJ9oY/Seh6JQdiLYl1ygqL8W590aJUbdxypP6d6dhZ2I11/sWUbH4aXA
 vsJRx+Qi05AZ5zpfytp0o8fnedBG4KMn17zRkgniS5FHhvysHm0h8esY5LaqLTS5Q2xf
 O7jFM7EB9RCpMAAVYv6L7QGCM2WwR05KW7FEXXOchQISFkccXg0J+GtOAnNrQSMps3dB
 Cf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794345805; x=1794950605;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ml2gggJhbDgkcyYKoCSjeLy7/VbIVg/vvKwp99ErNKo=;
 b=MBUlJj9BoLO5O3dCvhSZdLUjigCYihLRthPY7GQ9RKN36uC4lLPtcl49AVDQmdnoKA
 zmPbonM4XMNUbpXbOQ8kDDQg+XnoaK+xmjDqo9I8FYeIpSATVP78i9UO6iESNqPZP6P+
 3TEsezsdtgx/s2NyJiq6q8A2eJ2ET8vDrBNRO6LMxGDp+OGcAjYbB6erqGXZdSAeJ8vv
 cX7+IWh1YMoXDtAz52ELyLqq6b12Wnq7pYoZHy5mGXdSqw5Y9Iie+xHXm+fQ5RfxBWa2
 Ass8j6wJEgnSrV220uMz6RereeuEdDj/KV01x0+3vex+5tV03lKRn/0u/xO1Fu0NGuQt
 l2PA==
X-Gm-Message-State: APuU4Z+4GcGyJzJ8mYzFOvEuWnQD3ccOes2JR41B+1pdJ8jV1RBCLeSk
 9qvvAR7E5HCKctdJomj1tH9au3DvUK7R+XLZV3h5GW9nGejpebUv7ZHyzcXxauylDrWUkPpTnHR
 BZIvYyUAWrdITrC2VsLujZtNGkptGG4fjlKFmuWkP/zqDY3UtNe2JpbznzQ==
X-Gm-Gg: AYBFou1gMIBt2Hfw2kj9IvYyijC/OkWzXT0AY6YrZnFgfhgWocvcLIW7/OL8SR2S7vL
 vwheoWxoTS1WxsLrtNbp/dF0A9tOyTRYszFJmLskczzvXgr6ElE2sQsCFnujw346zhqvxcrZ8vN
 Bu43yKto5eefgiL4PglZIyI25EolfwduKop8eG/BXGd3m/c8feYFCfst2KFREQSZ83g6ukH7onT
 ZWHrh+iRsg4Ueyw3bze2TVgcly/adWX2CjeLfciZRMybk7yjL8WdykFzESPNIfmLIOb8+/Jd/Zm
 7rERyvy/VsfEgB8mFaDYGuKQTlRcjFSNzjofiH2aHFIniMcSoon1n/JmtLtZ2cJnLlevrL3J563
 2bNMnrF6Y7aqXDvUZY2bvgJKYhPDts6j5TIKDnUJboKSbuR5idXWcYIFJlRwizTN9uuqPFH3igG
 UsQX9K0pforVo=
X-Received: by 2002:ac8:5ac2:0:b0:535:a5f9:7529 with SMTP id
 d75a77b69052e-556c1b5bb67mr1863811cf.72.1794345805007; 
 Tue, 10 Nov 2026 13:23:25 -0800 (PST)
X-Received: by 2002:ac8:5ac2:0:b0:535:a5f9:7529 with SMTP id
 d75a77b69052e-556c1b5bb67mr1863351cf.72.1794345804420; 
 Tue, 10 Nov 2026 13:23:24 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91efe5da1b4sm13117746d6.13.2026.11.10.13.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 13:23:23 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 philmd@oss.qualcomm.com, ZhengXiang Qin <qinzhengxiang@foxmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 2/2] target/riscv: raise access fault for Zicbom MMIO-like
 accesses
Date: Tue, 10 Nov 2026 18:23:12 -0300
Message-ID: <20261110212312.56809-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110212312.56809-1-daniel.barboza@oss.qualcomm.com>
References: <20261110212312.56809-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4NSBTYWx0ZWRfX9VV/2wa9ta83
 2KhZKUBb1Hxvg+orV2E7tqMww02SJtKrLyciUvLKFHPqGvXnY0/Bnr8cWsBeGc66HAWLn1IKmfh
 iJhMm9laRf5X98tnr4cXnFLzV/tfI/FNUUt76g35FsRhjW9+q5O484AUpIfFK7LyDT/9fzHOYTu
 G+zTDId8xp1ZfhatWU5WKttMxXgxrHedN1nTpv8vX6lbeLHZM/TC6A8qJPxldJsGmXvbOVeiVML
 i9rpP9M3VxJ7KBbR8lTK/E3L6qnGd9/KLtpWkrIzyMWGulUp10kEacDF/JrghBF3EbOjJgmrN2p
 vOaDcpaS1VC+7vQgmVTw/F1ELZWGSI/oK0grNBM89XnCAjuSZz2QhODuEBEHfelhXa9xxiBaWOX
 IHtKg/acdfOedSKEunspazZ2QSul5KIE9NcaiRq5uHhNiKasJ0ZLFuv0Fw5NlAE9JX+9vuzxgKi
 3uE1exC6TlDKUJOZH5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4NSBTYWx0ZWRfX6cz7Lqa/FYGY
 9wdoAD4BeghZrzcg0Z90ddukzuyj4RPWAoVq7mupP930/S+ebj2HYrK31uSB2dle0nsT8ZyhANk
 hVPNxrbgWZOKbLHz2bWRlvAwCbEPQGE=
X-Proofpoint-ORIG-GUID: EDYkNGqZG3DOIS0wyvMrWS68oJSFbCiv
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af38b4d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=p0WdMEafAAAA:8 a=bDN84i_9AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=f9I5WbiLg-2XRRu5Er0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=J2PsDwZO0S0EpbpLmD-j:22
X-Proofpoint-GUID: EDYkNGqZG3DOIS0wyvMrWS68oJSFbCiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100085
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: ZhengXiang Qin <qinzhengxiang@foxmail.com>

check_zicbom_access() currently treats any probe_access_flags() result
other than TLB_INVALID_MASK as a successful access. However, a result
with TLB_MMIO means that the target is MMIO-like and should not be
treated as a normal cache block management target.

Raise a store/AMO access fault for Zicbom accesses to MMIO-like regions
so that cbo.clean, cbo.flush and cbo.inval do not silently succeed on
non-cacheable/MMIO-like memory.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3501
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: ZhengXiang Qin <qinzhengxiang@foxmail.com>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/op_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index d7af56ef61..52aa545eec 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -231,6 +231,7 @@ static void check_zicbom_access(CPURISCVState *env,
 {
     uint16_t cbomlen = riscv_cpu_cfg(env)->cbom_blocksize;
     int mmu_idx = riscv_env_mmu_index(env, false);
+    uint64_t fault_addr = address;
     void *phost;
     int ret;
 
@@ -251,7 +252,10 @@ static void check_zicbom_access(CPURISCVState *env,
      */
     ret = probe_access_flags(env, address, cbomlen, MMU_DATA_LOAD,
                              mmu_idx, true, &phost, ra);
-    if (ret != TLB_INVALID_MASK) {
+    if (ret & TLB_MMIO) {
+        env->badaddr = fault_addr;
+        riscv_raise_exception(env, RISCV_EXCP_STORE_AMO_ACCESS_FAULT, ra);
+    } else if (ret != TLB_INVALID_MASK) {
         /* Success: readable */
         return;
     }
-- 
2.43.0


