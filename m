Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A64EC5DF81
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:20:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wySjJ-0001Ep-KX; Mon, 24 Aug 2026 07:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySjH-00018A-Mv
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:20:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySjG-0006bo-2t
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:20:39 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99BOE2448713
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 moIOwYFYai3NnlfAbgOQRMXGHJfvZC6nBcjOaLv/HnI=; b=TK23fj6RucgPUomh
 aP47k2O8UpGSTi1C7wN527nbpiL7ynsXTObam2ydXuxZvekTjJpDx8G6H0GTIS2M
 FoEN6+zvVxkB7m115HrKspk5uyWFDpgxz9eJy5P3Ejy9XDgffwAvivuSeU9yrsKR
 SW1pNUkx61gGZjOWPJqoASFmjw69w2QNXYzFSFp36PUF2/C965ElQnAuwbJBhn8F
 3bdkVSMem+ET7nXNSCTUtNRrINSl3hw1V9vPKRuKzJAA3Pti/1Ft3Vxsi470AQP9
 X64u1lwTrSkh4/gb0UEXc/MQsC2HQbPfWDR6/Pvv5kZuzu1E8FQPT+uPTeCgro6s
 QthdoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0t30-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:20:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c01ff996dso37046551cf.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570426; x=1788175226; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=moIOwYFYai3NnlfAbgOQRMXGHJfvZC6nBcjOaLv/HnI=;
 b=D1phnN6najEc2UsDLO9MRZJC3FFM/slZVhOZ9k0wI8ljyctx3R+wqyCPQLFjlkR/Ya
 cPZQT/fpWJqLVO2t6kOYRnozRxDtRp3epRRrfnnvkjWJjUZPJoA7fejG7t0khc9VRwro
 mvZM+2s3smF9MmnN2v9AT1ki+sRvP+gtrt1/1zKxqpmUrhnMYhEXqRdlCdbb9WLUOetR
 o9MtOI9kAai3RPURRU+ToEnJtidIoLi0vThABLBtNne5wp7zNeUN8TMSFhEG0piX7bc0
 Nq4S3GxAYLlFCrsNTA6RIDtzrz9POL4KdE+zo5wfr4uQ9jdXHcgp3q8sgWVQSZWjrrlX
 PKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570426; x=1788175226;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=moIOwYFYai3NnlfAbgOQRMXGHJfvZC6nBcjOaLv/HnI=;
 b=F7DZF8tQ6CRCgnANvXhyDPbgzvfudDKRIkk42DBXakOhoWy4L+izYoskBhoBoMxKkj
 9vcJcaXlPY//p+9O80iA8pYLRilftOZlWqeO1k8o0lju7bNPLCL19zyhO7sbZWETwJD1
 AXkhxx56+jBr5tuL929XRKl0KOfdYS9duw2hsgGSHh3kAKq9vRNPSo+VtRhuSSSNeptd
 pDAGJVxLPyL4eGgw2M1/b2PgdB2KhBT8QhPlGFAWfhO8YB7g5tNGxkQZ3/XP3YWnfPbe
 7l277bH83VAMMWLHPe/bhzr5JNXX6/eLt4Zhm/vFyZRel0by9gKp2kC3V5/OAEnY0ZPh
 ei2A==
X-Gm-Message-State: AFuF++kYjZSHsQe8ZPgOf8k9f7t9on7DP8H0lcEMIZpo9Cyzd7Tm2oSC
 h8Wp22RnTC5uZAjwOKGccza46+05Nm0krTSxvtAukhDe3Bp/sJShgSrVam3CPxbbpZ8+SOqEOpK
 EAUAO7K/gN9yawyHEFTgenWETH9sF/+Ym13cRc7ni1FXt7K36jPo5sctnaQ==
X-Gm-Gg: AR+sD12KXLzpNDY1oiCAEN8Y3e7U8ftF/EKWIB8W0RvXhSXdxWjoStjYJQJ/Zs9rpUL
 EETAN+2VRyy4WDLExLFL0Kc7e0heKRhdm9HEHzVEjTixX2UvBUYNk6Dy9yBIzlBLhwseWiCZiwg
 FFde7bWS57sLn2J5LkXtI8Zwh/7nrW5c2QDhCYxKzG9P7pn0WBHheDqYU4bNUasTIwfNmXjGh7x
 R+K2p7V19kVUe+YbogCC6IPJTS1xJyK+0hu+Q4tOYMMtLKCMkmQroSpHbVnlvxi7FHkJN7w7mI1
 KbJRN7ZmHjSW+Bu3iaTc62fyJvnwZKoexg/FQV7A+Jc3PPzpC3wBezw8eUqXPoDm3H5mtX8D4j5
 bFd0nC+Wfj7Kb4jlzjQCLV9AM4rKC1wh23KLEJcoVs2NiJdk16Q==
X-Received: by 2002:a05:622a:4c0a:b0:52d:f4fb:8baa with SMTP id
 d75a77b69052e-52df5a57d2amr244522351cf.35.1787570426455; 
 Mon, 24 Aug 2026 04:20:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:52d:f4fb:8baa with SMTP id
 d75a77b69052e-52df5a57d2amr244521861cf.35.1787570425991; 
 Mon, 24 Aug 2026 04:20:25 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b5aasm1217813166b.4.2026.08.24.04.20.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:20:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 18/20] target/xtensa: Constify CPUXtensaState in
 xtensa_replicate_windowstart()
Date: Mon, 24 Aug 2026 13:17:07 +0200
Message-ID: <20260824111711.26297-19-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX/HM3vbIIT+Un
 /UtWqtZz+H91FgLy+L4ekQ0jhx0JRYYdVY8UeNgbtEmbE4jGynwFIMt1NdXm2+1gImTZbsxEZ97
 mztX/6AVz+wcCyyZfI/ms4f50yqZG/oMVBpW3mwVafl8trXVwOWpzAYO88tpA/6GGpMKwsECqRP
 mG2vY/hc4zMbJjTMXljEE+ivSo/DUX1EZetdEeJIqpeY1J5AlkrWWSazlnFUpE9zWO3lsjHEzni
 uXbd9Nk761yXipW6cAyWyYeMtwHVRhJUCU+I7WpZcEHfVuk6E9BFKjEALgtLTcM9ntsXfAePAYf
 oJTOz3XexwFGiQZWiTzMTR2S8k1oqYbnYt1DcQoWpIuD5MTZFZZkj01piEZDvS2d5J0aR1PKQAq
 SwhvnMCRcrrqhc2SAgqaKdKyyWEbxCK/BUgG4JAfmwpescT/dVZnSx7Z8tk+UcHQXTum4cEszdn
 c+HM9Wiz65FnMURwwEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX26P21DMUFHdm
 oDTip5NuBOoCs1rD3vYUUMmhA5MtIIxr3FPb5AmeSDbSTKqkPTAFzziXvqbFUWGD3RLKDehlIkb
 4HHUrjI62pAZWo3oXgZoriVwKPE96/w=
X-Proofpoint-GUID: yUzA33FYO55hSGXJRy_NuiSahTvxpnkO
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c28fb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=i4eqDRyDUUk0pEqmao8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: yUzA33FYO55hSGXJRy_NuiSahTvxpnkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
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

Add the const qualifier to CPUXtensaState when the
argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/xtensa/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 442e98bd1ba..49d6ad9083d 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -708,7 +708,7 @@ void xtensa_set_abi_call0(void);
 bool xtensa_abi_call0(void);
 #endif
 
-static inline uint32_t xtensa_replicate_windowstart(CPUXtensaState *env)
+static inline uint32_t xtensa_replicate_windowstart(const CPUXtensaState *env)
 {
     return env->sregs[WINDOW_START] |
         (env->sregs[WINDOW_START] << env->config->nareg / 4);
-- 
2.53.0


