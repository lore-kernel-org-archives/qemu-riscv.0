Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0E2C9830B
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:14:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QXd-0006OX-Tp; Wed, 23 Sep 2026 13:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWt-0005jH-PO
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:13:11 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWq-0001Eh-6f
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:13:10 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGU6V1741679
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kDFRggGBgd+2DtAqNLeUqcVcpYvkyK4ydCRh++BAI8w=; b=MG1L9yb1SroUlmzd
 IEAy9uDQv6t4NB5f5hrPDui5SVyuJ3pgr8gECdQNzECU+q0DsHM/acz/lx2lundN
 wrycXat23eTCpR2bFGdX3Wxn2YZV9QvpTtWjqMoVnJ7JCFV9E4IgiU6Y1aAQAfpl
 EDl+tCTXt9W0COLJwCoToXeeq8D8SzEO6SFBdy5EElPaFK5h2DqxSj+h9Q7E0IYs
 JvNiLsrRN0klott2Kh6KikpzEHdLsQgBMnDFX1F8CE2zARURdZTf/9ezsjiTRNqc
 6Q9YmivgBWQi2bIPX/7ELwHDkQi4CyyGH+kEQX1rw8+WZg483To50X+TtjHBY9tf
 WsILYw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsh3ge-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:12:56 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-9806e283b0eso914262241.3
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183576; x=1790788376; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kDFRggGBgd+2DtAqNLeUqcVcpYvkyK4ydCRh++BAI8w=;
 b=IKkpb51tQoyYXu+mFJRzBbZxDPadESHE0rduUAGi6wsJjRaqRBq5j3YxnMLMYnF6Nw
 QUgZpXWWqMmBHbDTV466tzgS+N+RSjOj/DPEOVlWnYhb5MAnQG0urhzzZLb/RJ87Wc/f
 vva9ZLQA3vgfidHK4OcXANkWfdBM6s3OlEOClfa6Ya9MlVDgBWTAQt6Xa2S+4UlSd/AT
 mtFcaIBgqpmHzChWhNplEPD3NRtgHjh3iFLXj5AgeuuNF7U2W/CKgH0P6yThheSScwPi
 3xtwftRlHOOj4/cGp6K6+ad6ci+n6D6I4P4ZIZFMjX6+nodYl9+HkEMpeKGKJjjBQHZY
 x9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183576; x=1790788376;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kDFRggGBgd+2DtAqNLeUqcVcpYvkyK4ydCRh++BAI8w=;
 b=onlmPDhkS2iqnrufCqyYkDcWpfpw/RTxQmx226GrU7lFRRb+9omfFVWQRA9Z+OtmJ8
 p9IrdLNIADZqEnJeU6GyokUyjhKSQcpDYvPVcOjqhx8GIBMPOAo2bOc+BRQD8eWjj11U
 IkE44bq+6clwqvIe0ktf3HSUkFaW65CF50HQZZEc6rRQs0aE/VRnImiCBq05Z2QiEdHE
 6T12XlEjk7+ubYLPMZV9Zo4Uiyljb5N6VzwOTgVsg/MQm0wH/nK1kFyHrgs7EkqjmRoM
 f6QQULfmbHWS3DGWI/RNlrIJiKqNWXUPHovms2oh26kd9CRpnnje23KxeG/Jf4i/GfmV
 bhog==
X-Forwarded-Encrypted: i=1;
 AKwUvBxZzvaIZS3uLzAiDO+483kB7bT4jzZG0bDHeXBljcAY8qTl3+vVsgtWAPNzhsDUblCUQx/0HIcTR3N2@nongnu.org
X-Gm-Message-State: AFuF++ntohlRkxC61tsY417wpFR3WNmTd6MJuzOfoWLC190kRaohQKUZ
 HeuAF0rvoefZh3V8NU50tawKJbPtoZEiFXUGefTVoqdwVJNmkfugY6DtLA1+kbBikPFPpNyDvlU
 p14GqR3nIdsS6m21R6dOvGxwp54bGGLRjG6gStFFOy5Qf3Wp3VDpff9IxRQ==
X-Gm-Gg: AYBFou0T0mH+JHWgce2wZ3NS3hhqJEMQf1/xfe23wbit68ygbWNiDzM7KvxwatyFYV9
 FO81xwyb5Nn86mnk1XPODJ+tanhX3ANj9je/GSTPuX2sLdxQsX+jkSPNyVpRR9ZOkNDHl3lucd9
 BoYr7w4Jlj2szdmUB7hjg8LwATTFmJQwYrM9IV+zobdNndmjssTHPYO1UKY3bXYlHvwxFustvEz
 DiKKx/wXnUMBhcdo2OmurW3g3Hsk+WLgTqk1HWrr/cq7YpBthdWjWvJS5uR4U7CrsisrwfeDUK1
 LprOTopXkKDujaQVKRfzPBy62nBnpOWcK8401BtVdl4u0TV9PgxbPBPbtz52aZvsaCTtVry54an
 HbdXLDnqSkumgG2XSx27X3DAjaLIDgq7sff5snkvee7ghHVo50Ug=
X-Received: by 2002:a05:6102:808b:b0:7a1:f7e2:aae9 with SMTP id
 ada2fe7eead31-7ac1d914ac9mr2634357137.27.1790183575775; 
 Wed, 23 Sep 2026 10:12:55 -0700 (PDT)
X-Received: by 2002:a05:6102:808b:b0:7a1:f7e2:aae9 with SMTP id
 ada2fe7eead31-7ac1d914ac9mr2634330137.27.1790183575375; 
 Wed, 23 Sep 2026 10:12:55 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488684862a3sm7725749f8f.7.2026.09.23.10.12.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:12:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 13/21] accel/tcg: Refactor poll-while-halted flow in
 cpu_exec()
Date: Wed, 23 Sep 2026 19:11:07 +0200
Message-ID: <20260923171116.31276-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX+DcMtFcjE5NV
 wP2EjG2yf2S2Ve9KAHHVuo2yCxZUUicg1caZwoFgop7pEIijBlN/kbs9QMsgcdEblHjEoEj1ABk
 LZYypqSEhkyJII2r44iC3kjF/S2cdHR1rCyeHw3Kkd7TgglOYMUbXpz55eyxv6r5YjL8/DXZHFm
 We2hhvbTj8AeU2Z6lhsUNeujuchkfwjYBF3ytK0DHW07+3YOd85O5RdzzBx6J58T3XU7XtfE6Y7
 9a8qdD4rILhqwrPH/2rCWoXAbrU24OM3+xaTngjCTkYUYML4HKhAKcKKfqbeufo5VkEeTn8E3y/
 MT1LSElhcc4dNz1WX/Pri17xL0615ZVSW6QmuHUo9a4RpRuP5ZstTM3gbtClhabyIDExy45iMQG
 ArAlrf/DZZHFh5toRKgxLDv6fHnWXtVEQEeGfjv6mru+YIlB6AoqpRx4Z7r7HjyPLwgJmwtmBJB
 /z2ps68oifeapE718gA==
X-Proofpoint-GUID: p17FKnObUzlS1b2xJim6gIrcVfFIJUMj
X-Proofpoint-ORIG-GUID: p17FKnObUzlS1b2xJim6gIrcVfFIJUMj
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab40898 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xF3Xt6V14tk6trZ56bgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX25wzgJZ5nNIi
 ynuzAjfxRRis+IoYk43qEX3w2eQDXIShyF10v9LG47FqKbhc5DgUSK7bKeU4i3EjyTLPHidnZv8
 ELoqQhTlP7hniMt3/JEGL1XmsBWzMko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
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

Invert cpu_handle_halt()'s logic to read in cpu_exec()
as "if halted, poll for async events and find work; if
no work, return". Rename as cpu_poll_while_halted().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 46b723cb734..76182803592 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -654,18 +654,18 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 }
 
 #ifndef CONFIG_USER_ONLY
-static inline bool cpu_handle_halt(CPUState *cpu)
+static bool cpu_poll_while_halted(CPUState *cpu)
 {
     const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
     bool leave_halt = tcg_ops->cpu_exec_halt(cpu);
 
     if (!leave_halt) {
-        return true;
+        return false;
     }
 
     cpu->halted = 0; /* allow execution */
 
-    return false;
+    return true;
 }
 #endif /* !CONFIG_USER_ONLY */
 
@@ -1027,7 +1027,7 @@ int cpu_exec(CPUState *cpu)
 
 #ifndef CONFIG_USER_ONLY
     if (cpu->halted) {
-        if (cpu_handle_halt(cpu)) {
+        if (!cpu_poll_while_halted(cpu)) {
             return EXCP_HALTED;
         }
         assert(!cpu->halted);
-- 
2.53.0


