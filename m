Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D343606A321
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DotVG5zx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gIsKRSj9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMpz-0006ne-Lo; Tue, 20 Oct 2026 23:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMoR-0004NG-6C
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:16:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMoO-0002qY-T9
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:16:22 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2F3BF3256711
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2IbJWKdI1MQqjzY2GFXVwHaUDrLg2miYkaJxglFSvS8=; b=DotVG5zx5RSMHcwP
 1SGEbMnSZ/ZAZYCTncGTUBEXCsOgOuBmnVlQBBZWmFC7/jHE5FQ47Xik4gvWHRj8
 LOhis4mKXGAqKAm2+8d1oGG336JMTiU53Y4cLShXazxgw22bXnpf4vu+Xs+dNiOF
 LYAPPD/7FYKTMR1v7MvfQnCmzU2PgJFu/DXxqwour9/019u2D6jDUHR8OPJOV84R
 5s69s6nc4ECGwWoLPn1+qS1YilHY2OCdTIqkQD/fzESdvX6U3/SmliekhQE9qo9m
 p59qjGX5vtTgGHdr6yYykNOvHuJAo6EqotVkofM0xVOWH3xxrR6FxHJRIeE7Zrwd
 lJKfYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v1rr6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:16:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f2c0e6653so59833585a.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552569; x=1793157369; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=2IbJWKdI1MQqjzY2GFXVwHaUDrLg2miYkaJxglFSvS8=;
 b=gIsKRSj9zsgsNP4i7XGj/DEAr8cKF7FXfNkfuyTXbJOsCFJsnYKL01CPt2Kbk164fK
 aLfTolvQa175P78irJUEG4fE6sAtZvYI/KAtdCoZe0r88dfgWImOJha3YhoJvC3yRGJD
 2ic9FEjaWdkHCU6tr4ZJODIymK76sLem1+J6JPtvXR+FDVKBFuPw1rl/PNXpYEDPYPyS
 8d+6LkhhHzRgx7UJo669RVS8ildMszMQFk7n5poPnb88fExoCay3Muw1L9B/Ip8oH3vE
 SBZIAyejeMYQyizPh1wETEC/Kodj2L2ic2aWW3ddz2q+09A/Nyuk0EVAfTClWkehsVZ9
 K/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552569; x=1793157369;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2IbJWKdI1MQqjzY2GFXVwHaUDrLg2miYkaJxglFSvS8=;
 b=u8vm+rfS7LF9C3JVsfT4oNT6Bg4+H8YUnv3nKHg2G1exoWsmsEgD3y5FsFUFL4lFGZ
 VwxAyJcmeH/Bsw/0sWdz0rOuYhqCWgKs6ma8D85xxNx3kFn03qVbvgzzPrmlZWuJjkX2
 6jtNj/4foEgFZRmojcJEH14c4xa0HEfD5TXNWPcoMETErjouAC3JwtOQSXgIBmzV/+aN
 VTHopVihunzdAzfoH8VLSejoVLX8k49geCGIhshxWZIuMrMRQoltMnBuFHyVgWr5yRpr
 o46e3CYw93KDynPt1jLpnJEOJ9fJk0cGUfzvtjbU7/v1PhDWV6TRHvazsTklUnTiQV5n
 KZuQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx0NwlAMIA0bUfwgr4/7aZXhFLFXUlSudMALxdXBdUaGwZwSeGybQME3HOKs73c+c7l36ydmVV6oqxh@nongnu.org
X-Gm-Message-State: AFq9FYLj393FpPwmDj5e/0N1aUWwWUp2GTv4Cw/vL04RwmL8x4BHIBI0
 479G5ckZQDiNaoJsiNz+UTNk3Mkt1NCMPYIheeqEzSkvAe2fQmUlH4YanPzLz0v5JiAKN/8L71J
 tOcOdl9lHItM2+0fw3FUOm88Pcwjrtj3q8Hmr9j57guuqYgulDcBw1DaWsw==
X-Gm-Gg: AYBFou24xGdx74svlj1FcAiX3uJgdWTkUoRPQFCuXPYrLsXPF1bfQzSuoJsU2uZTgYa
 jv4+EPo86OBSHSfjtZHyyqwhWULT8OrqZ50JRZgUHgowhHPQFjLq+Gg3VuuICBR0UAaguLeMeTu
 MlYmdqoopSmEQc8T9MZwEhgrkBcRJPZEF/KivjiCTAur5nOMF+QXqpeUmfkAqWfsThfl4NsoR5s
 JEKA/ZR9qVKbzhkD/58nlWfeNC1eHou8TLfVWXvcX73a82teWJakrY1FWllgJ8Ng9KIM2klOqRG
 8di7p2Pcds7K/Wj544PYg8lmfOWNM+McFgPzoHiolo+1CiH7RmKrOhOPGrJSWHbxFWP4sz4Ifm0
 2PeWYiASODfuIgY9KZqJleLtX/F7NjesfXm1yt2Vq
X-Received: by 2002:a05:620a:371a:b0:93e:c12c:f13d with SMTP id
 af79cd13be357-93f57f646b9mr213538485a.71.1792552569255; 
 Tue, 20 Oct 2026 20:16:09 -0700 (PDT)
X-Received: by 2002:a05:620a:371a:b0:93e:c12c:f13d with SMTP id
 af79cd13be357-93f57f646b9mr213536285a.71.1792552568813; 
 Tue, 20 Oct 2026 20:16:08 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25828caesm2312844f8f.29.2026.10.20.20.16.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:16:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 15/33] target/microblaze: Implement and register
 CPUClass::exception_name()
Date: Wed, 21 Oct 2026 05:13:48 +0200
Message-ID: <20261021031407.24862-16-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX+vgafXLBa9qA
 OwLQAMlqKVi7fDh0jGMVMpSrQuSIpI0B8MOVrmbX+4o4aPwvNYpf5OpVhMppOZ8h+PEolK/JmAF
 Vf8SmkdTh7W8FOBgodbQL3aqSxTAPMU=
X-Proofpoint-ORIG-GUID: J_iZTWLDOTIn5b3_Pv6kxyw9C-cdEwxS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX/O2CriY4lAUG
 JFOMwKLbDFlcEWs+2W8CtQfdqNT8amDmuKJcSspmhD0fRk7pQpVOYdgQHJJQzLNkkBBA/B8oMkp
 J2rULT+g2n2AxvtxB7a2o5PLtF/jpOIW2r6HZmGWR43W8VEZ0Yww28HylmJdJSTGOqPkZrCGiKN
 2cx8c3pA3YVHVzoH7QTuJMVvUg/qIKP9PhPuj5XIQwO6qjoXKC0SgNe/f5BDywSxSfVlPmdky6e
 fEF/KjgZZS15U0pR3TKDtIvPtF0DyajlShF0BpQC5ppw5QNTE1PKg3VKr0R9G+e/cVD4thK5y4z
 hiByyfS9GYxZNN2dfyeZdqUjXvwG0JG6PNiPrQQSC5FtPNhPIzhvmTx+Ehf+xWDEfIn/BoFUGXq
 xk3YkFZkPTV/wwDFHJ9JTQT3cf+Rcef9EJRKSK33EhUZ6r9h2EXewJBSCqsbhwRHKdYBr0x24or
 V2f4AxdhTiR13v7NBOQ==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad82e79 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_ZqrUhsafL45AmjA-XwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: J_iZTWLDOTIn5b3_Pv6kxyw9C-cdEwxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Implement microblaze_exception_name() and register it as the
CPUClass::exception_name() handler, so the common exception
logging can resolve MicroBlaze exception codes to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/microblaze/cpu.h |  2 ++
 target/microblaze/cpu.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index b9602f72b94..fc2783693e3 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -36,6 +36,8 @@ typedef struct CPUArchState CPUMBState;
 #define EXCP_HW_BREAK   4
 #define EXCP_HW_EXCP    5
 
+const char *microblaze_exception_name(int excp);
+
 /* MicroBlaze-specific interrupt pending bits.  */
 #define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 389a5124b12..f64488d0a08 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -79,6 +79,19 @@ static const struct {
 /* If no specific version gets selected, default to the following.  */
 #define DEFAULT_CPU_VERSION "10.0"
 
+const char *microblaze_exception_name(int excp)
+{
+    static const char * const excp_names[] = {
+        [EXCP_MMU]      = "mmu",
+        [EXCP_IRQ]      = "irq",
+        [EXCP_SYSCALL]  = "syscall",
+        [EXCP_HW_BREAK] = "hw break",
+        [EXCP_HW_EXCP]  = "hw excp",
+    };
+
+    return ARRAY_ELEM_OR_NULL(excp_names, excp) ?: "unknown";
+}
+
 static void mb_cpu_set_pc(CPUState *cs, vaddr value)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
@@ -469,6 +482,7 @@ static void mb_cpu_class_init(ObjectClass *oc, const void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = mb_cpu_class_by_name;
+    cc->exception_name = microblaze_exception_name;
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
     cc->get_pc = mb_cpu_get_pc;
-- 
2.55.0


