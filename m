Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2A2606E87D
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z0gKjcbn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gvcL2UPj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMsE-0002EC-Px; Tue, 20 Oct 2026 23:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMqd-0000JX-0h
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:18:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMqa-0003EA-5I
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:18:38 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FGiK3988816
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tN/Psdg+xYNFE1sR78SY/F3GxG93c1pM+0fPtjv5xR8=; b=Z0gKjcbnqvpnB9AQ
 ml0TeflIA1bDFi7Bz6qxPJOjoCMRKFUT51wW64YiohxmJGyX+5/LqYvhAm38exWc
 QQIPiu7FdBlNZi8v21fcrG0rP6zlIWYq+290EAKVxFb+HbsB/UMiYvWmgnxQjphd
 zspiFvn/5AaITqLFC/hyVtixWYuzachQWkAQG2c7w79zX+GFyI36Kf35t2Sd1RM6
 R7KA9e8c1nxD3se8Tc1mbpMgpIFUkC/HELDWcVkFjCm0WqdBWK6L9IeP38D8hkZc
 GFI9f0su+3LL8WQMBMdubH6RJpiJvUjf8DAf1qkhzv7AgZrIb+DEgkPmxdSBt+Zs
 GO3+JA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajhrkd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:18:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f54f15b9eso69407485a.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552704; x=1793157504; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=tN/Psdg+xYNFE1sR78SY/F3GxG93c1pM+0fPtjv5xR8=;
 b=gvcL2UPj78qMjfLIpr1MOCyr1qeBEy357HlbZfuf++0BcUSHWRIBVFK17DAEFR/LZj
 /UwiltVPoniRlB07fpzGecob4z0kNB2JLZfmvJ7B300J2526CGgzxaYCJeR4DvY5lUC8
 XQ1miTtkon/W1pw1YH2ZsXfLFLKHlPOT9ys0Tq4Dp56APbgRxADNwDisDMrdNBV+tYqF
 LZMf9k4YOAQUPXuG0IRNU94JjWdeh55cu6yJLxFTIGQeHkvfrHbt5Qf0ORC+GBCEjut3
 ueNk7TxzqHl8XLXPpnOMBpV51aZFDwdOF890mIw9tZUnKPv+SNnq+2cy0wrCDgOsmdcz
 Is8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552704; x=1793157504;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tN/Psdg+xYNFE1sR78SY/F3GxG93c1pM+0fPtjv5xR8=;
 b=Dqc/KA9dztlMbdTI+vRJ5oCILo7dpYKcQPblW7fgBC1U/ULofkqp7nmludN8nn5x+v
 kclYp5NNcUaFd0Hgm4eaKFTn9owE9YPzAc+QIaXYRU89NoDHp8uZQ5YMEWImcwNIr7V+
 baMxXU/YneHMeest7xlU4M4kFy/03IjIc2sVgTqrejC7pqltABUNSfslhpi5RP4AcDzV
 S8JzDFr3AuYDe4Kr9mpGp/BLd77NSArFtgl+2heNMFski5xJb2LIXQFS3BnNldlmoyZi
 9wyLCyyZWYABoq5OPBwQfBCs71socVi72J2UhoN3F1zqWRmoqWeTWO/SOvmzjM63S6Lo
 nFvg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwgsIWoI3iOO6oMqA9kPzZ2QT65PAjS/p1SK7tZ625pEa5IN6/yAjqrnD6mLERi6fKJZcwVOv8fQRkT@nongnu.org
X-Gm-Message-State: AFq9FYJrM1lXX2YmHl867XhdZRwt6lxf9GvBp85/ZXVa+wq5VESDYX5F
 TEP1c28YKm+5qgI0qwIZVrA8K1YjsTIaTSborEhd1586NGdvXgYE6i+5SZs69MMeH5zDaJMk6dD
 rprBOdLfS/ecXqxPlp53vHPmeZTzGdGTeug+ZKMT+itTY5vMWovHLx9IDdu/YyCjw9ka4
X-Gm-Gg: AYBFou0Er72Aj2q0v3SXbbDdiWIS2XWncoHX7jL5W9qBH6fmoAbH+LKCH2QAqtReXu5
 k++Ed7ke3iGkVZKkwww4+346wEpLlb9y3/YValSZkcUBi17BhvpjHuXU1Jacq8CgWKILEy4LMy1
 Xy6gNHkuDOUSg5INaJNKH8nJ7Xq4bTOn5oAcQeh6/ulRndNzZvMQZvUogddXH5jLeoxqaSJNa0z
 qqqnQZOEZEwlEQFVNcmd68ylxO9Q38epL0pGbaCMSOSWtYT0PM0RaUy5SrLaabnr8GBdZursJ8j
 qHaBpTlAYLZq1+MxAR37tpShkR9ZPaJK0h+wIzOmVAfTM77dpUucf5N2ag3MgKRWVtCdDCvBu70
 TntXEkUxUIbdUT//B8IFTBYc15dLdM0X5K8bnl/ex
X-Received: by 2002:a05:620a:1d09:b0:93f:dea:3b7e with SMTP id
 af79cd13be357-93f57f055damr221204085a.24.1792552704472; 
 Tue, 20 Oct 2026 20:18:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93f:dea:3b7e with SMTP id
 af79cd13be357-93f57f055damr221201785a.24.1792552704052; 
 Tue, 20 Oct 2026 20:18:24 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2583523asm2456199f8f.37.2026.10.20.20.18.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:18:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 32/33] target/tricore: Implement and register
 CPUClass::exception_name()
Date: Wed, 21 Oct 2026 05:14:05 +0200
Message-ID: <20261021031407.24862-33-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX/BrVX4CVvwEz
 0i2YiCRRcbvikMejsHvLBQ3qkI6fDpmHcjhydy6SGLazqLsPRppz/9ZRgTYyobC5F3p4gzRmSC4
 cXWPOAHI9dJ9ljzOpxb56EsDtQ+gT6IEDKzH1seyfO/FUZJg0yddwvgJFRZlCLcedk14wwkUH6F
 kKTZubOpjfz27j5B8YFg0Bi1wD6HvXRanv8W8/dKf0aCEb0pMNhGwaTGveoTPTEgVtYZmmP9ajX
 qTq9qYxGCtsmwf9wvAQ2bXvGkIQ/h6DJXlmUifpphZ3hRXXLv+y7RR9au3I8hoK9aDGqcTPxP+N
 77U1pGfxzYjKGyXkfYDs01/ulCKUnp6lODnGTddVTpftsuwN/OPKHYy826tw6pTyfoLF0Ja0uET
 32aIqI0hCzvLSGLBOPfbHkuTxAsK1lcbIXsgJ5fkIxz8hcVIP1im6daGBNj/nhyJQEFQOYp6aqz
 ek6pChOnZi8zhYecJFw==
X-Proofpoint-GUID: MDCwLRazI6se_Vt-_8ana1GZHjC7qx99
X-Proofpoint-ORIG-GUID: MDCwLRazI6se_Vt-_8ana1GZHjC7qx99
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX0T7BJhQDq3Ag
 /ASiIpNzLk1b32VhfufHSDLc+7zwCf+mnZfZO9AHkZajgUMZ9P7QL72T86n7MTKdHqTNVxOOh+p
 jtj1jKQW/idHR0So4fCVmZHShR3IpjE=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad82f01 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=M3mzNYHUzacmDIfs9B8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
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

Implement tricore_trap_name() and register it as the
CPUClass::exception_name() handler, so the common exception
logging can resolve TriCore trop numbers to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/tricore/cpu.h |  2 ++
 target/tricore/cpu.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 12e497d2a7a..fb8d2fd1011 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -178,6 +178,8 @@ enum {
     TRAPC_IRQ      = 8
 };
 
+const char *tricore_trap_name(int trap);
+
 /* Class 0 TIN */
 enum {
     TIN0_VAF = 0,
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 84a05e3d363..632568a6544 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -36,6 +36,23 @@ static const gchar *tricore_gdb_arch_name(CPUState *cs)
     return "tricore";
 }
 
+const char *tricore_trap_name(int trap)
+{
+    static const char * const trap_names[] = {
+        [TRAPC_MMU]         = "mmu",
+        [TRAPC_PROT]        = "prot",
+        [TRAPC_INSN_ERR]    = "insn err",
+        [TRAPC_CTX_MNG]     = "ctx mng",
+        [TRAPC_SYSBUS]      = "sysbus",
+        [TRAPC_ASSERT]      = "assert",
+        [TRAPC_SYSCALL]     = "syscall",
+        [TRAPC_NMI]         = "NMI",
+        [TRAPC_IRQ]         = "IRQ",
+    };
+
+    return ARRAY_ELEM_OR_NULL(trap_names, trap) ?: "unknown";
+}
+
 static void tricore_disas_set_info(const CPUState *cpu, disassemble_info *info)
 {
     CPUTriCoreState *env = cpu_env((CPUState *)cpu);
@@ -240,6 +257,7 @@ static void tricore_cpu_class_init(ObjectClass *c, const void *data)
     resettable_class_set_parent_phases(rc, NULL, tricore_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
     cc->class_by_name = tricore_cpu_class_by_name;
+    cc->exception_name = tricore_trap_name;
 
     cc->gdb_read_register = tricore_cpu_gdb_read_register;
     cc->gdb_write_register = tricore_cpu_gdb_write_register;
-- 
2.55.0


