Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43A8606A31B
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 23:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HZLqwk38;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KI3ecIP5
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJfVw-0007ZL-Ck; Wed, 21 Oct 2026 19:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfVu-0007Y0-EU
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfVs-0004yv-Hk
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:30 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LKeMdL642461
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=0wAwNnGA1An
 hgYl4GsTBuva13Lc34eYJ/f76Bd8PFqI=; b=HZLqwk38yGuWDkPkSfNenHF/XaD
 WRWpWnHcD+8HkkcZB6shR1C7yhGsc6kr1UwGWRTg9014vBiL7IW8QFDbp8jRbTFa
 f1TuMATJh+P6ajiDKG0TVvbV79UGoKUht4zZb50AQhHzRu8NUfS84vShJsmQd2w7
 ZJh+WvCivn3VmEbNkTAUmqpaFv2xy9aO8Hhn9GiskX1NwX0V0sgKxdk6ZPIorT8M
 A37JBmmSwbHmaBJgMKeyodOkM7fnBjMh5uV01s/tjZAIw0sKmdcFUegEBxBgFgPd
 7Y9ijLL7HWZIw8UfXVWS4ttgAe/IpDjUUvWifme+RzadDpr1H/hp/KcX9og==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5qa750-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5365d95f4a1so22453831cf.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792624457; x=1793229257; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0wAwNnGA1AnhgYl4GsTBuva13Lc34eYJ/f76Bd8PFqI=;
 b=KI3ecIP58E4DPToREr+P0VJ6b+ZAHXz3Ntz6xYxNPMB4QXAa3juoSOta9qpWB6nZsM
 eiiQppRFrIez1Q84VsAD9u8PucoNq7CZnMXyQRzGpj2lL0RFhr3PyLAWeGP30SPXCfMh
 Ukp1/qQ6EFxHEeTS8dmDLPzmgwThv6HWN53P4tKremlf808kgvmFbzhnvVTsnkbqYBTF
 pckrqBgONo0kZLot5hfKJY9WK/suTNLWAVFBfW+nRQAlu/cXu79d2+hfE00GhtNlgGA1
 FOlJtTHT92RLwTvRetBlREC6mVJFraQkLaE9ln3ukf2Rec7AAtdvvpHHR5CDYM5bSfxD
 nRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792624457; x=1793229257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0wAwNnGA1AnhgYl4GsTBuva13Lc34eYJ/f76Bd8PFqI=;
 b=0YmhyLV2iOD48kwmpqZ248JhMr5cxkMsTa0e2LD5XAAp+c2AXXmHyCFNmt3PHj7h9e
 Em53nHXgkdDYo8qf3MmKNfa8flb+xas7DdMRHVeWHmDrDD7wk266GLvtF2wKO6JHVIBv
 7b4BLwhNa/G1ftfWbivB5bhGkfKOia/o9BWiGe46mKQXg6oxnhjP4sfkI692OHwpbpAk
 HRco4BCz9VryqOGUVtMKGRbiVkNnHrIvIpKEVuA4d4Xfrdzcx9ypvbXh13H2b2NfDSgG
 Kc9fKj5ybeW0Kh/sMmfmhtK/RtKM3ILzts5tS1BzmkIUiU2n7SiI1KpYIE05w7MAbDzv
 CQOw==
X-Gm-Message-State: AFq9FYKqJazXdZzYgU8gvYLO/TfXztBzqWZHSRL0egkMElZDqqCuUQhz
 02356sKls6jqLq85c1md+12qe1+manpoVWsSESUvirdac4+gNUndtjk4FuQAkVMUMEx3RTNKjzd
 iqySTCzWPDQwUNLRTXqA/mkdYq7mBYINb/g0/w/Mg9FqpnazguKl72AgqexUADjHM7w==
X-Gm-Gg: AYBFou2GwZBU2dYnFW0HV3vk/rs/6o3oA/mt2QSM8RuWNIo+R5eqwk6P+tQ49SOOkuz
 JSCI+15nnxrzKIycpALG+AMLOxTcpjxYL5lid8hJIGNIrK85yO89ws+uFo0PaDv2/njeEMscLNU
 Hm1oexrbi2AQE8lwPNOVcH06/Vhdek6MgL8i+xMt4KvLto9Gzz3DCdoqcP83GnJq5YIM4LuNJq9
 7Me8BseW0SIrWPkqbydlOEaR81im+1M2awaFStfRR5Gfz7cfDDcKAkrK6KGgviBbMN3C0WHBMEP
 0T+SVUzHlLJwbcsEcWeUx3HKh3qagLxR8SbSpmt7qUIm/E1xM7UDCMWCJDgETEKyptDirVqS9X6
 mO4o6J/CRvX286y1rGtZvLPjPuj6oTwSAeapo7AR1rrv04XhBTcJDr86XiQsWATYa1P9R2oGQjg
 ==
X-Received: by 2002:a05:622a:14cc:b0:536:566e:6b55 with SMTP id
 d75a77b69052e-5369b7db958mr58530621cf.25.1792624456791; 
 Wed, 21 Oct 2026 16:14:16 -0700 (PDT)
X-Received: by 2002:a05:622a:14cc:b0:536:566e:6b55 with SMTP id
 d75a77b69052e-5369b7db958mr58530091cf.25.1792624456102; 
 Wed, 21 Oct 2026 16:14:16 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com
 (200-204-190-237.dsl.telesp.net.br. [200.204.190.237])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536ab6cd0dcsm11995651cf.6.2026.10.21.16.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 16:14:15 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 antikostya2@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 06/18] hw/riscv: add e-trace message helpers
Date: Wed, 21 Oct 2026 20:13:33 -0300
Message-ID: <20261021231346.2452179-7-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfXyXRiag8SXrs4
 95Xh48IB7MjftsEcS2wjEewDkcxuf3bAkh8Hm7PySOrlV0MZDiNB6kpsSLLMmcUHxFmwVzZgEKO
 c9ctIsQzPJlBnnJCPJXnsu6OOLdPrN0=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad94749 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=uV1mE13EG8jhzT-pKI0A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: yrRFh4IY3IVA0ElvqS9RBkGXXiBtLfqp
X-Proofpoint-ORIG-GUID: yrRFh4IY3IVA0ElvqS9RBkGXXiBtLfqp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfX7uR+EY5ZuOCN
 pZrdHQjzfGfla/45eAWKOkcI92ZmQjIvZYt+78fVXmierEodZLsQm9hbLdylyIpKLyscB9dRHnh
 JurmOn6sniPMJP6/acRlUh+PfEiYgVadFBEHc7TjgVVsu8FBq0iedUoo4TQeoON2HYMrq8irjBg
 AwNk3amwXrgYej1ZJ2qSOl8HdhuC90a2fXoHFTD3ExNWlMyEErhfQxsjxDEOwBjsF20MuR/rP8f
 pIgakZpF9vbWmX4UcBiCtACi6R9EolvS+2Vlz7iiUdxUHQEDqcrs1UFUHUUCsKfutLqX+zcTWaP
 F/YPbN4fwH5Xcaf3/Zugu8EaUvw+1Y9UTB/J1mKWUdA+VZr2+z3PJpoCBLGqHDVjlr4uVY8lXFK
 b3ptpgTZleca6mQQ+/T/VlExxJSYcWda+b0mOEJXQ0olCSIa2uEIO8A8hv/qXPnwYq7u/RyPuka
 lrJtjKMrN1eHSpljGpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210092
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Before making the trace encoder writing into the RAM sink we need a way
to encode the messages/packets. The encoding is LSB (least significant
bit) based. The doc "Efficient Trace for RISC-V", Chapter 7, mentions:

"The remainder of this section describes the contents of the payload
portion which should be independent of the infrastructure. In each
table, the fields are listed in transmission order: first field in
the table is transmitted first, and multi-bit fields are transmitted
LSB first."

The "RISC-V Trace Control Interface Specification" docs, Chapter 7,
states when talking about the Trace RAM Sink:

"Trace data is placed in memory in LSB order (first byte of trace
packet/data is placed on LSB)."

This means that the LSB encoding must be used to write into the RAM Sink
memory, which is our goal.

The design we're going for is to have all these encoder helpers, along
with the message formats, in a separated file. The trace encoder will
make use of these helpers to blindly write a byte array with the packet
desired, and then write it as is in the RAM Sink.

We'll start by modeling the synchronisation packet first, adding more
formats as we increment the Trace Encoder capabilities.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/meson.build         |  3 +-
 hw/riscv/rv-trace-messages.c | 94 ++++++++++++++++++++++++++++++++++++
 hw/riscv/rv-trace-messages.h | 25 ++++++++++
 3 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 hw/riscv/rv-trace-messages.c
 create mode 100644 hw/riscv/rv-trace-messages.h

diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 97a39f85f9..87ac6d73b3 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -22,7 +22,8 @@ riscv_ss.add(when: 'CONFIG_XIANGSHAN_KUNMINGHU', if_true: files('xiangshan_kmh.c
 riscv_ss.add(when: 'CONFIG_RISCV_MIPS_CPS', if_true: files('cps.c'))
 riscv_ss.add(when: 'CONFIG_MIPS_BOSTON_AIA', if_true: files('boston-aia.c'))
 riscv_ss.add(when: 'CONFIG_K230', if_true: files('k230.c'))
-riscv_ss.add(when: 'CONFIG_RISCV_TRACE', if_true: files('trace-encoder.c', 'trace-ram-sink.c'))
+riscv_ss.add(when: 'CONFIG_RISCV_TRACE', if_true: files('trace-encoder.c',
+        'trace-ram-sink.c', 'rv-trace-messages.c'))
 riscv_ss.add(when: 'CONFIG_SOPHGO_CV1800B', if_true: files('cv1800b.c'))
 riscv_ss.add(when: 'CONFIG_MILKV_DUO', if_true: files('milkv_duo.c'))
 
diff --git a/hw/riscv/rv-trace-messages.c b/hw/riscv/rv-trace-messages.c
new file mode 100644
index 0000000000..01ff51c715
--- /dev/null
+++ b/hw/riscv/rv-trace-messages.c
@@ -0,0 +1,94 @@
+/*
+ * Helpers for RISC-V Trace Messages
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+
+#include "rv-trace-messages.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+typedef struct RVTraceMessageHeader {
+    uint8_t length:5;
+    uint8_t flow:2;
+    uint8_t extend:1;
+} RVTraceMessageHeader;
+#define HEADER_SIZE 1
+
+/*
+ * Format 3 subformat 0 without 'time' and 'context' fields
+ */
+typedef struct RVTraceSyncPayload {
+    uint8_t format:2;
+    uint8_t subformat:2;
+    uint8_t branch:1;
+    uint8_t privilege:3;
+    uint32_t addressLow;
+    uint32_t addressHigh;
+} RVTraceSyncPayload;
+#define SYNC_PAYLOAD_SIZE_64BITS 9
+
+static void rv_etrace_write_bits(uint8_t *bytes, uint32_t bit_pos,
+                                 uint32_t num_bits, uint32_t val)
+{
+    uint32_t pos, byte_index, byte_pos, byte_bits = 0;
+
+    if (!num_bits || 32 < num_bits) {
+        return;
+    }
+
+    for (pos = 0; pos < num_bits; pos += byte_bits) {
+        byte_index = (bit_pos + pos) >> 3;
+        byte_pos = (bit_pos + pos) & 0x7;
+        byte_bits = (8 - byte_pos) < (num_bits - pos) ?
+                    (8 - byte_pos) : (num_bits - pos);
+        bytes[byte_index] &= ~(((1U << byte_bits) - 1) << byte_pos);
+        bytes[byte_index] |= ((val >> pos) & ((1U << byte_bits) - 1)) << byte_pos;
+    }
+}
+
+static void rv_etrace_write_header(uint8_t *buf, RVTraceMessageHeader header)
+{
+    /* flow and extend are always zero, i.e just write length */
+    rv_etrace_write_bits(buf, 0, 5, header.length);
+}
+
+size_t rv_etrace_gen_encoded_sync_msg(uint8_t *buf, uint64_t pc,
+                                      TracePrivLevel priv_level)
+{
+    RVTraceSyncPayload payload = {.format = 0b11,
+                                  .subformat = 0b00,
+                                  .branch = 1,
+                                  .privilege = priv_level};
+    RVTraceMessageHeader header = {.flow = 0, .extend = 0,
+                                   .length = SYNC_PAYLOAD_SIZE_64BITS};
+    uint8_t bit_pos;
+
+    payload.addressLow = extract64(pc, 0, 32);
+    payload.addressHigh = extract64(pc, 32, 32);
+
+    rv_etrace_write_header(buf, header);
+    bit_pos = 8;
+
+    rv_etrace_write_bits(buf, bit_pos, 2, payload.format);
+    bit_pos += 2;
+    rv_etrace_write_bits(buf, bit_pos, 2, payload.subformat);
+    bit_pos += 2;
+    rv_etrace_write_bits(buf, bit_pos, 1, payload.branch);
+    bit_pos += 1;
+    rv_etrace_write_bits(buf, bit_pos, 3, payload.privilege);
+    bit_pos += 3;
+
+    rv_etrace_write_bits(buf, bit_pos, 32, payload.addressLow);
+    bit_pos += 32;
+    rv_etrace_write_bits(buf, bit_pos, 32, payload.addressHigh);
+
+    return HEADER_SIZE + SYNC_PAYLOAD_SIZE_64BITS;
+}
diff --git a/hw/riscv/rv-trace-messages.h b/hw/riscv/rv-trace-messages.h
new file mode 100644
index 0000000000..c7226b50a9
--- /dev/null
+++ b/hw/riscv/rv-trace-messages.h
@@ -0,0 +1,25 @@
+/*
+ * Helpers for RISC-V Trace Messages
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef RISCV_RV_TRACE_MESSAGES_H
+#define RISCV_RV_TRACE_MESSAGES_H
+
+typedef enum {
+    U = 0,
+    S_HS = 1,
+    RESERVED = 2,
+    M = 3,
+    D = 4,
+    VU = 5,
+    VS = 6,
+} TracePrivLevel;
+
+size_t rv_etrace_gen_encoded_sync_msg(uint8_t *buf, uint64_t pc,
+                                      TracePrivLevel priv_level);
+
+#endif
-- 
2.43.0


