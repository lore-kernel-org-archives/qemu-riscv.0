Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCE5606A319
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 23:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AcMS8n/o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PKX2MZfR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJfWp-0008Bt-TU; Wed, 21 Oct 2026 19:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfWL-0007vh-8w
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfWH-00052t-7P
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:54 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LKeHsi2160539
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=xA/2MIE1awN
 saQNlpuYctPhOBgSBq4Bdh4il8/V7pIw=; b=AcMS8n/ours/VRvN+LA3QXRA8Dx
 Wkjc7KGyTsBuDZl8RSvXczCcMGPUKxaDGyl+DDynM0GkGNRa8qamQHvxZBKzLEc8
 HcmR9nNrM15yQJLIUvhFAxt4TT1YMtome+l4MyX7Ou4rjUYMjanN6HNdgDZVtUOg
 Npa5QTWFHC3KjgaOLX4ICTluVaSTVLRUjem74Dhy69Uai4/C3wLEjverrjfTlLDU
 Biz+qcExHP2Hvb8xhsPSoBPQTU8qvmsUxLZHFA3+Rqox8KiNhkSN1oQVE3imNPpR
 h6lD3AI8XHXMF0i2l7O+OkbKIKPA88qmFHDWf8z3KIgmIKUC6bGW5x2A+yw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf1u3h35f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5337ed1ba44so25948471cf.3
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792624481; x=1793229281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xA/2MIE1awNsaQNlpuYctPhOBgSBq4Bdh4il8/V7pIw=;
 b=PKX2MZfRev9/+DC3O+F6EHaeFAMLaZqB+QaR0LaN5/Zdb+ZXEGM90X7LKCYmorzheL
 FWPkJyzeATVjnfBAiY+z7QxAtBMtuA4bCMZ+6SGwGGPLH2U+vOmJD0JxXImkiYQA9Clv
 Kiu3t93gP9znn/JRLBnCqRI2DB8AYXSJYaZ/EVGSYurt4j9KGHwM41Kjt0BMNJjxzI/R
 Zj8Bya/0IbaS1d+B/z4pdlWmlShlJVyDd5UM68zXTnmCONfH3DhXA4WJrnw/6wQiNSTU
 x1WEMd2bVM4js1/w2x2YaP6kkIf2AynfyXTLxLPcPNaoftYnT5yNTHOVuqaacrjM8jVY
 fdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792624481; x=1793229281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xA/2MIE1awNsaQNlpuYctPhOBgSBq4Bdh4il8/V7pIw=;
 b=TB+WNQCORKWUmy/1zpR6DDi+mFH+oMcgXvVNtXux0Xc6y2UJU9PNGCzlFTR8Edy5yb
 YnBigrPVtRjtRLXM4tCNw78U1WbQo1NjxAjzHXZeEwizduGI8dFwJsBqCXrAmgFnTMjp
 pI0xFdjcUiOH6X0fafs3bZXVzwspG3I9xSv/NQGbPIn7OlFM8bO1fd4Ysue6xPcGJzJb
 GXzMg/MP/maBIa6xzX1hnc6O1ayJHODc4O2K0NDFSKGhTmA/w8nSJURE751l0o6vXbnB
 u7h1Um2sjqKUIP8nzFwRaZTWnU6h5qvET+xVI12/2gi9FFmPWFJY7KJYzmQX5zm1LFEd
 qr8g==
X-Gm-Message-State: AFq9FYJ0sTijq04dZ9jE2SNBaFYzG99sjiPhQhi2JMvJ9G2Mxb2zTxwI
 hX7IZS0z4XwHxALvYic5mEIUAoH8Yk6ckTrWMOGpx5bf48Jm/fuArrD0YOhOCRfoCRKswanpzb5
 LXxmQ/qDW7OCnoeKpV5QPbhvFfBDKb+21q5X3ukn/nZX2J8ZY6irOirUing==
X-Gm-Gg: AYBFou09zQrMg/vBwtgHhvcKkSufIZPf1JNS7AIVSJwOTAB1570j9oybVzDX1GWPqE4
 OU0NYY+bgsBGFtgsqkpIodw6oKp9Wg9u6xJMKP+xdwJ6VLBCBT8d5nPKhEDARZkr0cUUzOhSCEO
 VwqYk0aYoQVVBvbAigNtuCgmcoctjL3Srkah5RJwFsQ0AJwu5ouB0ekSbyzNOmJnKS+3N8ju2B/
 /23MojAxXRyrMcJK1vnPq1e74AtgPuapvaHsuccJ4oEw/f0tCrrCO2h7VN5/Gab3O5ithNaG8D1
 oc01c7cNKnvue2VZARwWniPifojZTekip3xQmJhuYS0PLmEEadTeR2tZfvh4A0v3sbLeVD1Pndn
 IH1jDZl7gmiuI9ski60dAnWkcQoMMLU4khHQss3QpIEg/7Q8QixBQrAb35Rspglv11YVoy7HXnw
 ==
X-Received: by 2002:a05:622a:164d:b0:536:65fc:1e with SMTP id
 d75a77b69052e-5369bb41760mr55646341cf.62.1792624481150; 
 Wed, 21 Oct 2026 16:14:41 -0700 (PDT)
X-Received: by 2002:a05:622a:164d:b0:536:65fc:1e with SMTP id
 d75a77b69052e-5369bb41760mr55646021cf.62.1792624480633; 
 Wed, 21 Oct 2026 16:14:40 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com
 (200-204-190-237.dsl.telesp.net.br. [200.204.190.237])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536ab6cd0dcsm11995651cf.6.2026.10.21.16.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 16:14:40 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 antikostya2@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 15/18] hw/riscv/rv-trace-messages: add format 1 msgs with
 branch info
Date: Wed, 21 Oct 2026 20:13:42 -0300
Message-ID: <20261021231346.2452179-16-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S8ZMU4sP c=1 sm=1 tr=0 ts=6ad94761 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=26Pa0hPBu1MJQ4wyLl0A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8lyx5h4aMbENR25JuMt3tioKXk2OgKsI
X-Proofpoint-GUID: 8lyx5h4aMbENR25JuMt3tioKXk2OgKsI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfXxxRDYpxx955H
 0W6fIMO3i986cGeH/kuUxCgwprcZdQxNwbxXyr0Gc1XR0Vrr2h+Ez5Jgm0kEKtAl5wPBEnwnudm
 Iu7WxvcOKgKB/WALi9LNBcX2a8imMwRq2AxUP70S6wFCf1iQVn/hmfpSwvt/W9ZeCh3wiUI6psM
 g8YxFrXO1l/VUWxk2qZft1rVyGiRu6uANFVk3wP14t8tsoSfkcyPdeg1XmLNzBKpv/g65WLpp+N
 u8/N+ILoAxptTk9wW6TViz4dMaO2oygQXHvlUho5QRj32I9vVPLUcyL7zZ5oyIl8tasVeNXD+kz
 KGgZvavkH7EXtwQHPeqMHfMRSXpX4U1ni4SfBhjY1cyMG4XxWYNJjw6q7XCRjOzkUREOQARAIJn
 xpnGPTByyETXV6DLWVOHak3lbLEqJRE6alpP3zj/jsi6nIcrDpibmn4jfRaBT/JiaxmWm9rupFN
 MhhMoK7TjobdlLNDXJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfXyWwfziA64TV9
 w0xCyq39BVHq/hGPakADpP0nKwg3q0yuviMajXG3mPgsjk58LNk1TYVxTTbU1F8hmBGWZXD79l6
 +opi7Me1B+4FRar0T+xd2HYbRbiJdvs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
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

Add encoded message helpers to send branch information trace packets.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/rv-trace-messages.c | 126 +++++++++++++++++++++++++++++++++++
 hw/riscv/rv-trace-messages.h |   7 ++
 2 files changed, 133 insertions(+)

diff --git a/hw/riscv/rv-trace-messages.c b/hw/riscv/rv-trace-messages.c
index 83d3436e2e..46445a47da 100644
--- a/hw/riscv/rv-trace-messages.c
+++ b/hw/riscv/rv-trace-messages.c
@@ -64,6 +64,31 @@ typedef struct RVTraceFormat2Payload {
 } RVTraceFormat2Payload;
 #define FORMAT2_PAYLOAD_SIZE_64BITS 9
 
+typedef struct RVTraceFormat1BasePayload {
+    uint8_t format:2;
+    uint8_t branches:5;
+    uint32_t branch_map:31;
+} RVTraceFormat1BasePayload;
+#define FORMAT1_BASE_PAYLOAD_SIZE_64BITS 5
+
+typedef struct RVTraceFormat1Payload {
+    uint8_t format:2;
+    uint8_t branches:5;
+    uint32_t branch_map;
+    uint32_t addressLow;
+    uint32_t addressHigh;
+    uint8_t notify:1;
+    uint8_t updiscon:1;
+    uint8_t irreport:1;
+    uint8_t irdepth:3;
+} RVTraceFormat1Payload;
+
+/*
+ * FORMAT2_PAYLOAD_SIZE_64BITS = 9 plus 5 bits of 'branches',
+ * plus minimal 3 bits of 'branch_map' = 10 bytes.
+ */
+#define FORMAT1_PAYLOAD_MIN_SIZE_64BITS 10
+
 static void rv_etrace_write_bits(uint8_t *bytes, uint32_t bit_pos,
                                  uint32_t num_bits, uint32_t val)
 {
@@ -245,3 +270,104 @@ size_t rv_etrace_gen_encoded_format2_msg(uint8_t *buf, uint64_t addr,
 
     return HEADER_SIZE + header.length;
 }
+
+size_t rv_etrace_gen_encoded_format1_noaddr(uint8_t *buf,
+                                            uint8_t branches,
+                                            uint32_t branch_map)
+{
+    RVTraceMessageHeader header = {.flow = 0, .extend = 0,
+        .length = FORMAT1_BASE_PAYLOAD_SIZE_64BITS};
+    RVTraceFormat1BasePayload payload = {.format = 0b01,
+        .branches = branches, .branch_map = branch_map};
+    uint8_t bit_pos;
+
+    rv_etrace_write_header(buf, header);
+    bit_pos = 8;
+
+    rv_etrace_write_bits(buf, bit_pos, 2, payload.format);
+    bit_pos += 2;
+
+    rv_etrace_write_bits(buf, bit_pos, 5, payload.branches);
+    bit_pos += 5;
+
+    rv_etrace_write_bits(buf, bit_pos, 31, payload.branch_map);
+
+    return HEADER_SIZE + header.length;
+}
+
+/*
+ * Same reservations made in the format 2 helper:
+ *
+ * - irreport and irdepth is always == updiscon;
+ *
+ * - return_stack_size_p + call_counter_size_p is hardcoded
+ * to 3 since we don't implement neither ATM.
+ */
+size_t rv_etrace_gen_encoded_format1(uint8_t *buf,
+                                     uint8_t branches, uint32_t branch_map,
+                                     uint64_t addr,
+                                     bool notify, bool updiscon)
+{
+    RVTraceMessageHeader header = {.flow = 0, .extend = 0};
+    RVTraceFormat1Payload payload = {.format = 0b01,
+                                     .branches = branches,
+                                     .notify = notify,
+                                     .updiscon = updiscon};
+    uint8_t payload_size = FORMAT1_PAYLOAD_MIN_SIZE_64BITS;
+    uint8_t branch_map_size = 0;
+    uint8_t bit_pos;
+
+    g_assert(branches < 32);
+
+    if (branches <= 3) {
+        branch_map_size = 3;
+    } else if (branches <= 7) {
+        branch_map_size = 7;
+        payload_size++;
+    } else if (branches <= 15) {
+        branch_map_size = 15;
+        payload_size += 2;
+    } else {
+        branch_map_size = 31;
+        payload_size += 4;
+    }
+
+    header.length = payload_size;
+
+    rv_etrace_write_header(buf, header);
+    bit_pos = 8;
+
+    payload.addressLow = extract64(addr, 0, 32);
+    payload.addressHigh = extract64(addr, 32, 32);
+
+    payload.irreport = updiscon;
+    if (updiscon) {
+        payload.irdepth = 0b111;
+    } else {
+        payload.irdepth = 0;
+    }
+
+    rv_etrace_write_bits(buf, bit_pos, 2, payload.format);
+    bit_pos += 2;
+
+    rv_etrace_write_bits(buf, bit_pos, 5, payload.branches);
+    bit_pos += 5;
+
+    rv_etrace_write_bits(buf, bit_pos, branch_map_size, payload.branch_map);
+    bit_pos += branch_map_size;
+
+    rv_etrace_write_bits(buf, bit_pos, 32, payload.addressLow);
+    bit_pos += 32;
+    rv_etrace_write_bits(buf, bit_pos, 32, payload.addressHigh);
+    bit_pos += 32;
+
+    rv_etrace_write_bits(buf, bit_pos, 1, payload.notify);
+    bit_pos += 1;
+    rv_etrace_write_bits(buf, bit_pos, 1, payload.updiscon);
+    bit_pos += 1;
+    rv_etrace_write_bits(buf, bit_pos, 1, payload.irreport);
+    bit_pos += 1;
+    rv_etrace_write_bits(buf, bit_pos, 3, payload.irdepth);
+
+    return HEADER_SIZE + header.length;
+}
diff --git a/hw/riscv/rv-trace-messages.h b/hw/riscv/rv-trace-messages.h
index 89f30e7d36..f8f1830852 100644
--- a/hw/riscv/rv-trace-messages.h
+++ b/hw/riscv/rv-trace-messages.h
@@ -28,5 +28,12 @@ size_t rv_etrace_gen_encoded_trap_msg(uint8_t *buf, uint64_t trap_addr,
                                       uint64_t tval);
 size_t rv_etrace_gen_encoded_format2_msg(uint8_t *buf, uint64_t addr,
                                          bool notify, bool updiscon);
+size_t rv_etrace_gen_encoded_format1_noaddr(uint8_t *buf,
+                                            uint8_t branches,
+                                            uint32_t branch_map);
+size_t rv_etrace_gen_encoded_format1(uint8_t *buf,
+                                     uint8_t branches, uint32_t branch_map,
+                                     uint64_t addr,
+                                     bool notify, bool updiscon);
 
 #endif
-- 
2.43.0


