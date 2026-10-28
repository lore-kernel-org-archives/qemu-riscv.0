Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17DC606A320
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TCgMt2CE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VHHZ647/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM4kN-0005hg-Rz; Wed, 28 Oct 2026 10:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4jZ-00057d-Kt
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 10:34:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4jX-0004WO-75
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 10:34:33 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SBe9E4692131
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 14:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UYLiJoSj3a6QnMGxFoEjx104u8TDNNh0P8mPph0Osfs=; b=TCgMt2CEcTpJDQCI
 Ea9CMDHDY+Sssg14uTBh6vwC3vzcUuZkJnS9ZcY61V8i0QzhrDZ6SJko2WGbfZqc
 kmD5QWuVrmrqyR/cvZ77KgXKVm7CyVsTIsukiT0KXH43R6bQ6xTEB48VeiUeh3A3
 f0/0VMZ4thUmbRuFP6JhYAGzmpN8aGx0x673CzwuAJspr9wvQokZ3oPXlmYVOUo5
 jzAUuHQZ0hNUqycpzprABvPqTZUBNc9MZg3Ke20I8pZEI7FfcC4tOXgKJe7+6Y6q
 HNaEj1wit8HgtAZIVg9TzMDfUTFXgELejVZEi1NtuEig+MdLj/cJ2TF47h2CZaMY
 O5QFqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be2x2q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 14:34:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-917baea8e5dso20072396d6.3
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 07:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793198059; x=1793802859; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UYLiJoSj3a6QnMGxFoEjx104u8TDNNh0P8mPph0Osfs=;
 b=VHHZ647/tQilj8Y/SRHV468Rq0ozqi3J5fX+905tW4vDiNcYBoJw5N/dux8zAW4hwB
 wZkdQ8lGD2erGkxQi5jrJ1HKZgrsIgVppy+U/frETT406la5ybsouBnvtJ1yDRKhBDiu
 nlFoC0DUNPtt3kM3PDenUtR7wyYBRXKWqpMibL3su9iFovgLd24+EvqyTQAyOz2dKdYS
 OWNMY/7sn68gfBXaQYIOaK2nmXnM0dJGmnhp6NEtDS6nkBe4x8DsI7hKHO4L8m4Tl0pm
 h5C5mPUVDXITEfWInJbNnq/VM14iMjJ2TkoKt1bWFMjlVbHtUdaOJui+qanUoRXm8J+C
 a/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793198059; x=1793802859;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UYLiJoSj3a6QnMGxFoEjx104u8TDNNh0P8mPph0Osfs=;
 b=dK114aNMs+Q7LhyP6ZBHTPdwC+Al0t5iBkBFT/GfaJ25NI7eaahhjBKmX+Q2hsaUzz
 b/h7L9Q++tT4KQd06ezYG2pxgzQ0l/HwHl9lv9lPzSyd5N5Mky6WirAFWwU+ETfXg4jS
 eRnmkcCaLExjc621qZsw/AwTq77sR2IWCpuBlOe4h0gTKhUZHgYSMyYj6wglp5+i2L3K
 ow5pfx35CUejkOo6Q9VM0Ec08ezxE53qU5YbgWhREc4/XwQgQcFKyTxa9dXdg1/9Z+HR
 AcFfCD+FbN54TkCPYy7G7W9fRfZ6llv6i/ipp/IQPkEX7FtlQjQgAwpS8RNZG70YfYhU
 DChg==
X-Gm-Message-State: AFq9FYK2wfrJ2DCxBwyGlOzZEyQgVKNn/bvTbZVxV97ehWl4EkcnSuEb
 NhqeAGtmCS3qZLb5ELDOYDDw411ZT9uh0OFRbzD8vuGXZsReDsiwLtOD7R6/j1X6qhQ+awGqqi5
 DbKIclm6KMHbYVXDjRmImmWOTVqWZA3wjHDwZM+hfZL3QJZ7mamqqMtx69g==
X-Gm-Gg: AYBFou3yET8C+dSANoxMJEQrd4G9LmxVXd3o7V6t3/lW4B8fgG7GKXz9wvhoPBN7iQn
 ko7qlOVtryHQdRSRYgJOc/ac37SO0bd1rQEhHETowAiAyrnNbH1gpeBLl7E1VfEKHOSQNGp7PPk
 yE6v6+/9TAMU1PaU2pSef0s39lld8mN6wd7sa7I5iIxe9kSALfV034sqMTnYVu7P9x+q6Jr+YNN
 AWlpmvf1P9tuWIXPvZzPnKWFAWRyhWxJ5hiSPShOn1lowh3LAcV3rHGJDsKhFjupJzZSOk/mJR8
 9rOj8KnavCWchRHP0LZMR6aUpu6ZYtQ8zOQcFioDMXtXhdrM1XcwLrTNLMMPLmvvFN5zBQh4gjj
 4PpVt5Xdiz6IEDQZdNww/1srcIRt3tiPXkTFl3u5R1Fy+MEHkIKa2LYJ4po99bwWH34mN36vo++
 57VhGZ0O1zzBvk7p+yc3PUyfv/MVVB9w==
X-Received: by 2002:a05:620a:4010:b0:93e:618e:a2d0 with SMTP id
 af79cd13be357-94408d883f4mr323298085a.60.1793198058927; 
 Wed, 28 Oct 2026 07:34:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:93e:618e:a2d0 with SMTP id
 af79cd13be357-94408d883f4mr323289485a.60.1793198057950; 
 Wed, 28 Oct 2026 07:34:17 -0700 (PDT)
Received: from localhost.localdomain (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecdfd8dsm27263752f8f.56.2026.10.28.07.34.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Oct 2026 07:34:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 6/6] tests/tcg/aarch64: Add vector immediate regression
 tests
Date: Wed, 28 Oct 2026 15:33:30 +0100
Message-ID: <20261028143330.6518-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028143330.6518-1-philmd@oss.qualcomm.com>
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: foITAuldjFx24cquSvKnT75AXugxPfI_
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae207eb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GbGmGPNHq4wrv3Bv-ccA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX7VRsCPBKXYRP
 ffJfkdjozdNm7422u1kf6jMQSyJ8Vy3qsYDt2TlDePa7cesMWA8UGkC96mlxqCLjMVrLnsWYM8s
 8AnE8tVrhimflT1b79Wt8AHfdu5UqLk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX0iNhIVH12Gcd
 8ac2rTuFw0qX1RHvX46b4DqMi/zAWcE7nL+xFgRntBby9hY+52GNxgpmJ/toc3Quc7+oZMIfueY
 wRel2/UqwLxTRiAGtNOOo1Uq5z/QXpT8CQIa9oUT8XszKHWuHjhltgwDTOd7upXphdITdiT3OGM
 WRaLlxKeO8YsWt0Ym/BUzMGXqxN9dcmQFCv3oNmoF7guswP7r+jPgaGBWNUTbOXDUG0WHxVBFvc
 zzZZiQvKd4bLGu1gpvOK7qFvUzm61s+1f8J8i3X51sQqB+MUsj6BWLpSlmrwwKJ3vDzE6ScFzoH
 CfBT/xVhJOgbYGiOoYFy3/+RSFOe8OhKuZmDBsQWHciSU+qMsEeFvMmZqOWT+yaGLLyabT0YSZg
 KGIgu2nMuJ83MkjKZ97U2ULyDox5NZVury3XFag2migY6cmspd2QfyPXLxZA0BH67ZWMh66NxvH
 LgnlbaBw2d2lwJYF/bA==
X-Proofpoint-GUID: foITAuldjFx24cquSvKnT75AXugxPfI_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280057
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Run SVE/AdvSIMD immediate operations after an operation
of another element size, at every SVE vector length,
against scalar references.

Catches backends encoding the replicated constant or
using a stale element size, as tcg/riscv64 did.

AI-used-for: Regression tests
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tests/tcg/aarch64/sve-vec-imm.c | 233 ++++++++++++++++++++++++++++++++
 tests/tcg/aarch64/meson.build   |   1 +
 2 files changed, 234 insertions(+)
 create mode 100644 tests/tcg/aarch64/sve-vec-imm.c

diff --git a/tests/tcg/aarch64/sve-vec-imm.c b/tests/tcg/aarch64/sve-vec-imm.c
new file mode 100644
index 000000000000..62391824946b
--- /dev/null
+++ b/tests/tcg/aarch64/sve-vec-imm.c
@@ -0,0 +1,233 @@
+/*
+ * Vector operations with immediates, at every SVE vector length.
+ *
+ * Each case first runs an operation with a given element size, then
+ * an operation with an immediate at another element size, within the
+ * same TB.  This catches TCG backends that encode the immediate from
+ * the whole replicated constant, or apply it at a stale element size.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/prctl.h>
+
+#define MAXVL 256
+
+static uint8_t in[MAXVL], out[MAXVL];
+
+typedef void test_fn(void);
+typedef uint64_t ref_fn(uint64_t x);
+
+#define TEST(NAME, SETUP, OP)                                       \
+static void NAME(void)                                              \
+{                                                                   \
+    asm volatile("ldr z0, [%0]\n\t"                                 \
+                 "ldr z1, [%0]\n\t"                                 \
+                 "mov z2.d, #0\n\t"                                 \
+                 SETUP "\n\t"                                       \
+                 OP "\n\t"                                          \
+                 "str z0, [%1]"                                     \
+                 : : "r"(in), "r"(out) : "z0", "z1", "z2", "memory"); \
+}
+
+#define SET_B  "add z1.b, z1.b, z1.b"
+#define SET_D  "add z1.d, z1.d, z1.d"
+
+static int64_t sext(uint64_t x, int bits)
+{
+    return (int64_t)(x << (64 - bits)) >> (64 - bits);
+}
+
+static uint64_t sat_s(int64_t x, int bits)
+{
+    int64_t max = (1ll << (bits - 1)) - 1;
+    return x > max ? max : x < -max - 1 ? -max - 1 : x;
+}
+
+static uint64_t sat_u(int64_t x, int bits)
+{
+    int64_t max = (1ll << bits) - 1;
+    return x > max ? max : x < 0 ? 0 : x;
+}
+
+static uint64_t ror(uint64_t x, int n, int bits)
+{
+    uint64_t m = bits == 64 ? -1ull : (1ull << bits) - 1;
+    return ((x >> n) | (x << (bits - n))) & m;
+}
+
+/* Arithmetic immediates (add_vec, sub_vec, saturating ops). */
+TEST(add_b5, SET_D, "add z0.b, z0.b, #5")
+static uint64_t r_add_b5(uint64_t x) { return x + 5; }
+TEST(add_h3, SET_B, "add z0.h, z0.h, #3")
+static uint64_t r_add_h3(uint64_t x) { return x + 3; }
+TEST(sub_s7, SET_B, "sub z0.s, z0.s, #7")
+static uint64_t r_sub_s7(uint64_t x) { return x - 7; }
+TEST(subr_h3, SET_B, "subr z0.h, z0.h, #3")
+static uint64_t r_subr_h3(uint64_t x) { return 3 - x; }
+TEST(sqadd_b3, SET_D, "sqadd z0.b, z0.b, #3")
+static uint64_t r_sqadd_b3(uint64_t x) { return sat_s(sext(x, 8) + 3, 8); }
+TEST(uqadd_h9, SET_B, "uqadd z0.h, z0.h, #9")
+static uint64_t r_uqadd_h9(uint64_t x) { return sat_u(x + 9, 16); }
+TEST(sqsub_s4, SET_B, "sqsub z0.s, z0.s, #4")
+static uint64_t r_sqsub_s4(uint64_t x) { return sat_s(sext(x, 32) - 4, 32); }
+TEST(uqsub_s2, SET_B, "uqsub z0.s, z0.s, #2")
+static uint64_t r_uqsub_s2(uint64_t x) { return sat_u((int64_t)x - 2, 32); }
+
+/* Logical immediates (and_vec, or_vec, xor_vec). */
+TEST(and_d_f, SET_B, "and z0.d, z0.d, #0xf")
+static uint64_t r_and_f(uint64_t x) { return x & 0xf; }
+TEST(and_b_f, SET_D, "and z0.b, z0.b, #0xf")
+TEST(orr_d_m16, SET_B, "orr z0.d, z0.d, #0xfffffffffffffff0")
+static uint64_t r_orr_m16(uint64_t x) { return x | -16ull; }
+TEST(eor_b_f, SET_D, "eor z0.b, z0.b, #0xf")
+static uint64_t r_eor_f(uint64_t x) { return x ^ 0xf; }
+TEST(orr_h_f, SET_D, "orr z0.h, z0.h, #0xf")
+static uint64_t r_orr_f(uint64_t x) { return x | 0xf; }
+TEST(eor_s_1, SET_B, "eor z0.s, z0.s, #0x1")
+static uint64_t r_eor_1(uint64_t x) { return x ^ 1; }
+
+/* Shift immediates, including counts above 15 and 31. */
+TEST(lsl_d40, SET_B, "lsl z0.d, z0.d, #40")
+static uint64_t r_lsl_d40(uint64_t x) { return x << 40; }
+TEST(asr_d63, SET_B, "asr z0.d, z0.d, #63")
+static uint64_t r_asr_d63(uint64_t x) { return sext(x, 64) >> 63; }
+TEST(lsr_s20, SET_D, "lsr z0.s, z0.s, #20")
+static uint64_t r_lsr_s20(uint64_t x) { return x >> 20; }
+TEST(lsl_s31, SET_D, "lsl z0.s, z0.s, #31")
+static uint64_t r_lsl_s31(uint64_t x) { return x << 31; }
+TEST(asr_h15, SET_D, "asr z0.h, z0.h, #15")
+static uint64_t r_asr_h15(uint64_t x) { return sext(x, 16) >> 15; }
+TEST(xar_d40, SET_B, "xar z0.d, z0.d, z2.d, #40")
+static uint64_t r_xar_d40(uint64_t x) { return ror(x, 40, 64); }
+TEST(xar_s20, SET_D, "xar z0.s, z0.s, z2.s, #20")
+static uint64_t r_xar_s20(uint64_t x) { return ror(x, 20, 32); }
+
+/* Compare with zero (cmp_vec), including the adjusted LT/GE forms. */
+TEST(cmeq_h0, SET_B, "cmeq v0.8h, v0.8h, #0")
+static uint64_t r_cmeq0(uint64_t x) { return x == 0 ? -1ull : 0; }
+TEST(cmgt_b0, SET_D, "cmgt v0.16b, v0.16b, #0")
+static uint64_t r_cmgt_b0(uint64_t x) { return sext(x, 8) > 0 ? -1ull : 0; }
+TEST(cmlt_b0, SET_D, "cmlt v0.16b, v0.16b, #0")
+static uint64_t r_cmlt_b0(uint64_t x) { return sext(x, 8) < 0 ? -1ull : 0; }
+TEST(cmlt_h0, SET_B, "cmlt v0.8h, v0.8h, #0")
+static uint64_t r_cmlt_h0(uint64_t x) { return sext(x, 16) < 0 ? -1ull : 0; }
+TEST(cmge_s0, SET_B, "cmge v0.4s, v0.4s, #0")
+static uint64_t r_cmge_s0(uint64_t x) { return sext(x, 32) >= 0 ? -1ull : 0; }
+TEST(cmle_d0, SET_B, "cmle v0.2d, v0.2d, #0")
+static uint64_t r_cmle_d0(uint64_t x) { return sext(x, 64) <= 0 ? -1ull : 0; }
+
+/* Vector constants (dupi_vec): vmv.v.i, 0/-1, and wide immediates. */
+TEST(movi_s5, SET_B, "movi v0.4s, #5")
+static uint64_t r_5(uint64_t x) { return 5; }
+TEST(movi_h99, SET_D, "movi v0.8h, #0x99")
+static uint64_t r_99(uint64_t x) { return 0x99; }
+TEST(movi_d_mask, SET_B, "movi v0.2d, #0xff00ff00ff00ff00")
+static uint64_t r_mask(uint64_t x) { return 0xff00ff00ff00ff00ull; }
+TEST(mvni_s0, SET_D, "mvni v0.4s, #0")
+static uint64_t r_m1(uint64_t x) { return -1ull; }
+
+static const struct {
+    const char *name;
+    test_fn *fn;
+    ref_fn *ref;
+    int esz;        /* element size in bytes */
+    int neon;       /* AdvSIMD op: only the low 16 bytes, rest zeroed */
+} tests[] = {
+    { "add .d; add .b, #5", add_b5, r_add_b5, 1 },
+    { "add .b; add .h, #3", add_h3, r_add_h3, 2 },
+    { "add .b; sub .s, #7", sub_s7, r_sub_s7, 4 },
+    { "add .b; subr .h, #3", subr_h3, r_subr_h3, 2 },
+    { "add .d; sqadd .b, #3", sqadd_b3, r_sqadd_b3, 1 },
+    { "add .b; uqadd .h, #9", uqadd_h9, r_uqadd_h9, 2 },
+    { "add .b; sqsub .s, #4", sqsub_s4, r_sqsub_s4, 4 },
+    { "add .b; uqsub .s, #2", uqsub_s2, r_uqsub_s2, 4 },
+
+    { "add .b; and .d, #0xf", and_d_f, r_and_f, 8 },
+    { "add .d; and .b, #0xf", and_b_f, r_and_f, 1 },
+    { "add .b; orr .d, #-16", orr_d_m16, r_orr_m16, 8 },
+    { "add .d; eor .b, #0xf", eor_b_f, r_eor_f, 1 },
+    { "add .d; orr .h, #0xf", orr_h_f, r_orr_f, 2 },
+    { "add .b; eor .s, #1", eor_s_1, r_eor_1, 4 },
+
+    { "add .b; lsl .d, #40", lsl_d40, r_lsl_d40, 8 },
+    { "add .b; asr .d, #63", asr_d63, r_asr_d63, 8 },
+    { "add .d; lsr .s, #20", lsr_s20, r_lsr_s20, 4 },
+    { "add .d; lsl .s, #31", lsl_s31, r_lsl_s31, 4 },
+    { "add .d; asr .h, #15", asr_h15, r_asr_h15, 2 },
+    { "add .b; xar .d, #40", xar_d40, r_xar_d40, 8 },
+    { "add .d; xar .s, #20", xar_s20, r_xar_s20, 4 },
+
+    { "add .b; cmeq .8h, #0", cmeq_h0, r_cmeq0, 2, 1 },
+    { "add .d; cmgt .16b, #0", cmgt_b0, r_cmgt_b0, 1, 1 },
+    { "add .d; cmlt .16b, #0", cmlt_b0, r_cmlt_b0, 1, 1 },
+    { "add .b; cmlt .8h, #0", cmlt_h0, r_cmlt_h0, 2, 1 },
+    { "add .b; cmge .4s, #0", cmge_s0, r_cmge_s0, 4, 1 },
+    { "add .b; cmle .2d, #0", cmle_d0, r_cmle_d0, 8, 1 },
+
+    { "add .b; movi .4s, #5", movi_s5, r_5, 4, 1 },
+    { "add .d; movi .8h, #0x99", movi_h99, r_99, 2, 1 },
+    { "add .b; movi .2d, #0xff00...", movi_d_mask, r_mask, 8, 1 },
+    { "add .d; mvni .4s, #0", mvni_s0, r_m1, 4, 1 },
+};
+
+static int check(int vl, int t)
+{
+    int esz = tests[t].esz;
+    int n = tests[t].neon ? 16 : vl;
+    uint64_t mask = esz == 8 ? -1ull : (1ull << (esz * 8)) - 1;
+
+    for (int i = 0; i < vl; i += esz) {
+        uint64_t x = 0, got = 0, exp = 0;
+
+        memcpy(&x, in + i, esz);
+        memcpy(&got, out + i, esz);
+        if (i < n) {
+            exp = tests[t].ref(x) & mask;
+        }
+        if (got != exp) {
+            fprintf(stderr, "vl %d: %s: byte %d: got 0x%llx, "
+                    "expected 0x%llx\n", vl, tests[t].name, i,
+                    (unsigned long long)got, (unsigned long long)exp);
+            return 1;
+        }
+    }
+    return 0;
+}
+
+int main(void)
+{
+    int err = 0, nvl = 0;
+
+    for (int i = 0; i < MAXVL; i++) {
+        in[i] = 0xa5 ^ (i * 0x37);
+    }
+    /* Zero, saturating and sign-boundary elements in the low 16 bytes. */
+    in[0] = 0x7e;                       /* sqadd .b overflow */
+    in[2] = in[3] = 0;                  /* cmeq .h, zero */
+    in[8] = 1;                          /* uqsub .s underflow */
+    in[9] = in[10] = in[11] = 0;
+    in[12] = 0xfa; in[13] = 0xff;       /* uqadd .h overflow */
+
+    for (int vl = 16; vl <= MAXVL; vl *= 2) {
+        if (prctl(PR_SVE_SET_VL, vl, 0, 0, 0, 0) != vl) {
+            continue;
+        }
+        nvl++;
+        for (int t = 0; t < sizeof(tests) / sizeof(tests[0]); t++) {
+            memset(out, 0xee, sizeof(out));
+            tests[t].fn();
+            err |= check(vl, t);
+        }
+    }
+    if (nvl == 0) {
+        fprintf(stderr, "no SVE vector length available\n");
+        return 1;
+    }
+    return err;
+}
diff --git a/tests/tcg/aarch64/meson.build b/tests/tcg/aarch64/meson.build
index 52eb67ae6ace..2033356e3625 100644
--- a/tests/tcg/aarch64/meson.build
+++ b/tests/tcg/aarch64/meson.build
@@ -145,6 +145,7 @@ tests += {
 tests += {
   'test-826.c': {'cc_feat': 'sve2'},
   'sve-while-ptr.c': {'cc_feat': 'sve2'},
+  'sve-vec-imm.c': {'cc_feat': 'sve2'},
 }
 
 # FPRCVT test
-- 
2.55.0


