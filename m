Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB83CA6002
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 23:25:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEb0J-0008Lr-6T; Wed, 07 Oct 2026 19:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEb07-0008Eb-S8
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:24:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEb05-0001SV-To
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:24:43 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697Luwlk2099386
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 23:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tsnVUAP+pbvLMtF7sOjGpQpgFCG91UZrM4+D/rMxAyk=; b=j8t32LonpHqWNDoH
 DAZiuxwOm7DeMTWQlCT5Py8lbYzON62D2gikR6I3gD0w5JDVp1phYU7/tXkbCUq4
 INPnzCCGsXLjyYVx8wkYyeTsZSSobxeigXumjtLOFylSIGBYDHC9AvI4MOk+a/HR
 ArZQdFX1wWIJ7V1IDCvdaLnKuZ3rt9YOU2lyUDyblc6zOD4hRbirilhs6GT76Y7k
 kyIVtfLHPC2vWOmifWmj6n7/G7H8giVbkLVKGApEFbew1M/C6CgKh0/eiZv+6z/g
 vjK+EAaZU/zD9wPf5qrYAi/4XS3yGZNPK3NoL3eQ3yeTouqX+/iw6lKScHTy7Nna
 9AY0DA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xefg81n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 23:24:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93ce7a85f04so879345885a.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 16:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791415480; x=1792020280; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=tsnVUAP+pbvLMtF7sOjGpQpgFCG91UZrM4+D/rMxAyk=;
 b=Ia/bXlXRcVBsc/KsZYUJglIaAcjoCzrnEbpziPiA6XIgxNxXiOQ3NBqkDAYXOLgCDv
 wfRU7Dr/VTmr/PDdVM85p2xXZxDgBOiJdSiovDL3K9860QX92hRmGwgJtVYVxEvrpvbi
 mcHNEwO3hNYAiMhpTHVNChiebIdE1cC3CsDBQ1Xw6NErAw9V30sry69Qowg34E47wada
 P17+v+/ZrM56niwqjol/rWcGhgKj2xFSpGt/6OKn/1TaqpLzffN+mkyEaDmNyl+OSxeG
 3uy4RRd6L8WP54kLerDbWFgMCzw7fr9ZhP9x+sGn+T59BSYaB9uUdOZW84OYKvbG83TH
 JMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791415480; x=1792020280;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tsnVUAP+pbvLMtF7sOjGpQpgFCG91UZrM4+D/rMxAyk=;
 b=a3cm+QcnzzqTAPjWUn03lFeN5bg47rP/IgLcVentvMGF7fcvLlKi6UPcSqR1e2TO8n
 tZKIrz7VbjhEVsPyI8NAigMURRW6n6wLj7efn4ivfMekC5MNcwrt0iwrmRrR+6/bT04t
 KpDlsoYXAT7N5jreNKHKwmP5IDBiedHpJ/I9PBUPCm6fBAnDWZlgYeBTwhN77PbJMot3
 fEqw6TMa1gwTDmGHKcv6SavWjlA2paxf5L8a+bWxbkJrPSYR2wxgCkVIvNmqxP6NzD/K
 RAQUPMCXwX28vB/iH3OPOs8tBiPoRksJbF2mPA24DJ1sOA36EZj2/As9EblQGikeUJdl
 c1rw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwmLxgh+5bDwuAodfKhZGDx2Ke94uYjf4Xtgr3STbjywxKr84PkXDLz7cqSY25Y2a37pn5ldReYcTNE@nongnu.org
X-Gm-Message-State: AFuF++niLvSOxvAAhnUc5GEme/6WfrOA7AkZgL2Vpd6o6M3q1CGON54Z
 CKYYa28YzCkBzspDG71Inyt0Bsypvq43LZQAsZ114NKbslCDpos0lBhp29gEBfNA8srJeh/eTK8
 psPTvsdaWL8cCSJGTkBeye9lY4g8hDxrwaKkEm388zJzGxC1X/6Xzp00YNw==
X-Gm-Gg: AYBFou0Cv0ks4eXtDFhgRifPAIDLIVKXUXJow2fEv60Vf7AemqkyrVyDSKPnuidCuHv
 RuLmBVtk18GXrCs7d9LQayh+Y6NAeLn6brVSUrQ78BBigrGNzm2VABLKxHEqu2/KOmN8NNZCkrS
 BYwlCf+0Aa8xv/Zep1mVgaQqHKts0+14FmrUvDfQE27ppUjrcuOLjF2Z9LNZQmsDoxMfqrBOrfy
 /eOQxUkFp5MCQTDT2jeGWtXLm3QBNeuU0oiClov2D6ThaqBecqa1L8vEZDhWS0xSeXxg8/BBjFF
 SaDHFzi4au7j+HOAJllPI1tJ1vizViJnCq9bVNc26soi78pofU742cRm1sP44afbR1CgZiAtAN9
 vjMV7HpyQwcChfYop0hTzkPLHFOKuBtv3nfFXmW+q
X-Received: by 2002:a05:620a:2947:b0:93e:9808:8d6d with SMTP id
 af79cd13be357-93e9b84e340mr739670485a.71.1791415479561; 
 Wed, 07 Oct 2026 16:24:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2947:b0:93e:9808:8d6d with SMTP id
 af79cd13be357-93e9b84e340mr739668585a.71.1791415479119; 
 Wed, 07 Oct 2026 16:24:39 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f4482c4sm176238625e9.0.2026.10.07.16.24.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Oct 2026 16:24:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-ppc@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH 09/10] gdbstub: Remove unused gdb_get_regl()
Date: Thu,  8 Oct 2026 01:23:24 +0200
Message-ID: <20261007232326.66240-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007232326.66240-1-philmd@oss.qualcomm.com>
References: <20261007232326.66240-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX6YJFj/dGp8gM
 /FGSUb3buyg+s7NWCayhU3KulzPDOh71bSo4YWedSwHrxOqKjnrQlKRW9oD9aFtaC0UrixdQqeG
 TNsEZI0F4KDeEoq94zhHu5/DiFyeIdslPtWoc/zUX4DYP1dxGwsvyhuv6hO+UPBtuBomd9nIMo0
 EPG10ssXHNN5Y4QhYdR3W+VEK+Ov5SbrnmRpm1UhsqEkrLJSrLXD2st6ptsBBiI9sKsNRnI7nS2
 R46mcPgcV/LuBL8BWHs8wZ3cCAC/oaiYXspaNRK5Is/Mb1OSIla436hmkuJW2YA/i2zVToWQqe7
 7AFg0WDa6LtnT+aD+CrGf08e4SnpN8KI7d7SVaqhdlDdZAPdtowVTTUS52dByMqJPLbhkTrvS+L
 EbVM3N/ok3tBQbLKdahdNnS5vp2RSH5Jir2xwCgWrg+0pSFQ2S18lUxX99/vmAD6ML0LRtbCEN2
 BkXKwJpgrgh7UTurLWg==
X-Proofpoint-ORIG-GUID: nBj-xmLEfIiTHsTqTbyJqZAJToGXyVVh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX+iEPiK21ErLR
 U3YVFE87NLnMDNyGcGcr0ELTACpmQlzhT3sKVofhpyRnSiniYAkD5dfIgKqs5gCRSoB7p9OszYC
 njDtsAyH43G7xBDmzH10QXHu4Q/MMhI=
X-Proofpoint-GUID: nBj-xmLEfIiTHsTqTbyJqZAJToGXyVVh
X-Authority-Analysis: v=2.4 cv=YbwodARf c=1 sm=1 tr=0 ts=6ac6d4b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dptnKJBBxpfCNAqMoRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610070093
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

All callers have been converted to target-specific helpers, so
gdb_get_regl() is unused now. Drop it, together with the
"cpu-param.h" include that only provided TARGET_LONG_BITS for it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/gdbstub/helpers.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
index b2f41d6d280..9833725b611 100644
--- a/include/gdbstub/helpers.h
+++ b/include/gdbstub/helpers.h
@@ -15,10 +15,6 @@
 #include "qemu/bswap.h"
 #include "qemu/target-info.h"
 
-#ifdef COMPILING_PER_TARGET
-#include "cpu-param.h"
-#endif
-
 /*
  * The GDB remote protocol transfers values in target byte order. As
  * the gdbstub may be batching up several register values we always
@@ -88,20 +84,6 @@ static inline int gdb_get_zeroes(GByteArray *array, size_t len)
     return len;
 }
 
-/**
- * gdb_get_regl: append @val in @buf using 32 or 64-bit, depending on target
- *
- * This function is legacy and deprecated, thus should not be used in new code.
- */
-static inline int gdb_get_regl(GByteArray *buf, uint64_t val)
-{
-    if (target_long_bits() == 64) {
-        return gdb_get_reg64(buf, val);
-    } else {
-        return gdb_get_reg32(buf, val);
-    }
-}
-
 /**
  * gdb_get_reg_ptr: get pointer to start of last element
  * @len: length of element
-- 
2.55.0


