Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FF2606A319
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 23:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DYXpREhF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKzwnbVk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJfW3-0007dW-SS; Wed, 21 Oct 2026 19:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfVw-0007Z5-7I
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfVu-00050f-AT
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:31 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LKdwiI816938
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=zs3SY315D8a
 /Zw/QdtK2fiSbIXP7gnfs6y7WyCjT/qc=; b=DYXpREhFrUJJ36hplIj1k2+hbIq
 4OO18kAXGCBYv8ejguwEcsStCHGFvD/VP0vT+ikfNQtywnL6drvja9RGNpo1tt98
 86z9++NZpgL7oX3TPOk0V+R1FknRGWOYXAO39Z7UsN6+aAUPperzli6KWgkvWeFh
 aCXR4EZCcgeLPQZ2tJL4uW2ar3Ek+j9QxPWdYKD1/BH/LrJVJHjMWhbL9B7yWdMh
 lIU26ebPhkTIXhqbA9L+8KIZ2M27RbAJlhTkCM2ub6y5X5GTPPCCOCSewzFWS2rf
 7HTz7VRffzRt5O/BWVwH9rAr7goTIizqwaEwN9u1B7nS9MuR4zcEBpvcj7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex58a929-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-53661e036a2so24621041cf.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792624468; x=1793229268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zs3SY315D8a/Zw/QdtK2fiSbIXP7gnfs6y7WyCjT/qc=;
 b=FKzwnbVks+S8W8hz0Dophb9BCy516wvsMwER8g1M5iUCUN+21OHnTrAPi2EEqwXlLH
 1sp9LgI/U3+BULl9ZJlzOFHpEQSo0BVk9lkGUgypqFNLloE3whzFmLvaqbHHSOx71nW5
 hdmd7f9pMd9+weDfvQpQPJPA2wQdJwP+o8IS4mHyXNk2D20fpfkFYBXRh7gZDQIGvV1h
 AAfJXalIGt6WremEtb08wVIF8gDDxuIlEqECfOg6VVLh+7bh/b9xArePpJqjPAz9Ggyk
 73rvahpXmkVYO/72zZ7/qXjy1UAZH5j3wnO0OpyKXfgg+5GsdrajeXV9V+RsQVOOihsv
 2Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792624468; x=1793229268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zs3SY315D8a/Zw/QdtK2fiSbIXP7gnfs6y7WyCjT/qc=;
 b=DOrZYn3k1lstxe09jRyYxseBz+hFQpubVs/Pc8ame9LA7TuLXxeFNlVnQ1UYcGmOUL
 f5kEEQrjzAOvNkZhoUtGMEh/ZOLJSz8ERKkQ90GYsrrvCrvQIxpkmu/79QpMtZOF7yGp
 JH1R0aUmuczF422tEp7SjhbzD036pts9kdaXuUusiGoqfWzyjahphfn29nuxeVl59TE4
 UiM2gneOOJL+VLeEWLpK//LzDU7tEhzrrWxml5WgmFdYVkmxewLNbPxEzDYrIRTR9uHy
 g6HBlrDXh8eL0JDoSFiDtBLl4Z7Ba9xsQJG3KOq1csOV18Jx8MHNh7nh+PiOAAXe5rnE
 fxfQ==
X-Gm-Message-State: AFq9FYJ7nBs2UoR2wG31qtpuM/hEtsrbpZqoSNC3mDL8TLFcdTjfJCun
 MMecOidVc3xLMLrJa91st0TKYMJKTJb/y4T0WI/ozKF2vtxfLAs7e6FeeTjQ8ey2bg8tlIe32pw
 3GRyaz9YOtGrdhPrxB8NQ/WnQD4M+0cfxfxUpvSjlOu66SEvAywSrUg3Cvw==
X-Gm-Gg: AYBFou3J5q9BGSiBAJtykw2ZMtQmAwCEzXH8XCgvjDZgoW7vNiYkJTsvvpS9BkRxVjN
 gm6wAbq+egaoPBsDWssoTDKSp+sUwXzQHd4pS33+9mlt5qC2bnkNfGmIh5TdVZW1ZAUkdIvEiTm
 7BAbgc33YGojgRNSdpF/QZ05YIC42GAEUgIQBgiapELuwsFggb4qcvofgZI3sPZlXPjD8D5d3gK
 BBjlygzhBQxTcO3qvWwwiaLiy8En7JlPJygN5by+cHIY1pCPuZ/MdMsRlnHL+AgNzeBB7W3nXbf
 +PutFGzSLMyptPVJG74thp1+xShIWcqYgOcMymyfimGPX5s8C3TikC3xRT/qWukJgGMqdao6IJo
 eKngNdB/Bw9cWEkOSx31OqkmKS30jv+PvirhepCJOlHhqFSPvkvKKH+YAh09gqLQFJFIr7CJ2qw
 ==
X-Received: by 2002:a05:622a:544c:b0:535:a5fc:3b5f with SMTP id
 d75a77b69052e-5369bb2e57dmr55251391cf.75.1792624467757; 
 Wed, 21 Oct 2026 16:14:27 -0700 (PDT)
X-Received: by 2002:a05:622a:544c:b0:535:a5fc:3b5f with SMTP id
 d75a77b69052e-5369bb2e57dmr55250931cf.75.1792624467124; 
 Wed, 21 Oct 2026 16:14:27 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com
 (200-204-190-237.dsl.telesp.net.br. [200.204.190.237])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536ab6cd0dcsm11995651cf.6.2026.10.21.16.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 16:14:26 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 antikostya2@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 10/18] hw/riscv/rv-trace-messages.c: add encoded trap
 message
Date: Wed, 21 Oct 2026 20:13:37 -0300
Message-ID: <20261021231346.2452179-11-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfX2nrkDhFlHhfS
 H7PzWreUcf9lUcDL6jVGJUn/3KOiA7b09T49//ov7zxSaH2e/gn1ojwrEJe6pJGHEeETlZPCJ6V
 RmWHoQTeT1hv9wRhOyb9cmlV4HdTf1U=
X-Proofpoint-GUID: kMogy8TZmwwiXn8fkamkhvHcpl-xgbRF
X-Proofpoint-ORIG-GUID: kMogy8TZmwwiXn8fkamkhvHcpl-xgbRF
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad94754 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=wHbgKFqcilCShCF3WtgA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfX1vB31RvJvCOe
 8/TUVQtny+ZxEy6xt03Z8YkkBpn7+EJbiesyUxpRk1+hNczDYcClAQ/99fXbNVF/5WnyA9rlBpz
 vmfPmkQxXfWrlN4+xZZ5sPkGeC7nb9e1VBwgqab6EroUb/GF/FAxTb9Tuo9edjMWs2Ju/dHkSKm
 JOdG7ZjZjx25XHutH8WzQMK3aCkG1B+HxA9Ind0Jmwg+FNHP3wp4ahUATc76dVFjFZxtNvprf9p
 YbsQsu3hnfFnEoJx92UQ3HdBglEfw3NRxM7THYwXLQVjfa7XAjM6KVQdDB3nOyP7irgrF5i9Q5y
 DC2cuI7DYxihbsgNlDgfz/f6QSBri94xGeVhRWWLxHSfN85nyakF/u/8yzuSFaRLwJE0155TpH7
 tzohnYQJ24jwCZblHBxww8JSYfsZNQPXAAddlKO29BJlP16ljbd8vrdaJAQLHrWShqFW5o/+8lo
 d4W8ANROZ960Qn/hyDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210092
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

The trap message consists of a Format 3 Subformat 1 e-trace message.

According to the Efficient Trace for RISC-V spec, section "Format 3
thaddr, address and privilege fields", the 'thaddr' will be zero if:

- we can't infer the EPC after an uninferable PC discontinuity (like traps).
  This doesn't happen in our current TCG backend - we'll always know the
  trap EPC in riscv_cpu_do_interrupt();

- a second interrupt/exception happens while the handler of the first
  trap hasn't exited. This also doesn't happen in TCG given that we do
  not emulate a multi-insn pipeline model, i.e. we'll only retire one
  insns at a time.

This means that we'll always send trap packets with 'thaddr' set to 1,
thus we're hardcoding it in the message helper.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/rv-trace-messages.c | 94 ++++++++++++++++++++++++++++++++++++
 hw/riscv/rv-trace-messages.h |  5 ++
 2 files changed, 99 insertions(+)

diff --git a/hw/riscv/rv-trace-messages.c b/hw/riscv/rv-trace-messages.c
index 01ff51c715..7ea1c87fff 100644
--- a/hw/riscv/rv-trace-messages.c
+++ b/hw/riscv/rv-trace-messages.c
@@ -35,6 +35,24 @@ typedef struct RVTraceSyncPayload {
 } RVTraceSyncPayload;
 #define SYNC_PAYLOAD_SIZE_64BITS 9
 
+/*
+ * Format 3 subformat 1 without 'time' and 'context' fields
+ */
+typedef struct RVTraceTrapPayload {
+    uint8_t format:2;
+    uint8_t subformat:2;
+    uint8_t branch:1;
+    uint8_t privilege:3;
+    uint8_t ecause:6;
+    uint8_t interrupt:1;
+    uint8_t thaddr:1;
+    uint32_t addressLow;
+    uint32_t addressHigh;
+    uint32_t tvalLow;
+    uint32_t tvalHigh;
+} RVTraceTrapPayload;
+#define TRAP_PAYLOAD_SIZE_64BITS 18
+
 static void rv_etrace_write_bits(uint8_t *bytes, uint32_t bit_pos,
                                  uint32_t num_bits, uint32_t val)
 {
@@ -92,3 +110,79 @@ size_t rv_etrace_gen_encoded_sync_msg(uint8_t *buf, uint64_t pc,
 
     return HEADER_SIZE + SYNC_PAYLOAD_SIZE_64BITS;
 }
+
+/*
+ * Note: this function assumes thaddr = 1.
+ */
+size_t rv_etrace_gen_encoded_trap_msg(uint8_t *buf, uint64_t trap_addr,
+                                      TracePrivLevel priv_level,
+                                      uint8_t ecause,
+                                      bool is_interrupt,
+                                      uint64_t tval)
+{
+    RVTraceTrapPayload payload = {.format = 0b11,
+                                  .subformat = 0b01,
+                                  .branch = 1,
+                                  .privilege = priv_level,
+                                  .ecause = ecause};
+    RVTraceMessageHeader header = {.flow = 0, .extend = 0,
+                                   .length = TRAP_PAYLOAD_SIZE_64BITS};
+    uint8_t bit_pos;
+
+    payload.addressLow = extract64(trap_addr, 0, 32);
+    payload.addressHigh = extract64(trap_addr, 32, 32);
+
+    /*
+     * When interrupt = 1 'tval' is ommited. Take 8 bytes
+     * from the final size.
+     */
+    if (is_interrupt) {
+        header.length = TRAP_PAYLOAD_SIZE_64BITS - 8;
+    }
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
+    rv_etrace_write_bits(buf, bit_pos, 6, payload.ecause);
+    bit_pos += 6;
+
+    if (is_interrupt) {
+        rv_etrace_write_bits(buf, bit_pos, 1, 1);
+    } else {
+        rv_etrace_write_bits(buf, bit_pos, 1, 0);
+    }
+    bit_pos += 1;
+
+    /* thaddr is hardcoded to 1 for now */
+    rv_etrace_write_bits(buf, bit_pos, 1, 1);
+    bit_pos += 1;
+
+    rv_etrace_write_bits(buf, bit_pos, 32, payload.addressLow);
+    bit_pos += 32;
+    rv_etrace_write_bits(buf, bit_pos, 32, payload.addressHigh);
+    bit_pos += 32;
+
+    /* Skip trap_addr if is_interrupt  */
+    if (is_interrupt) {
+        goto out;
+    }
+
+    payload.tvalLow = extract64(trap_addr, 0, 32);
+    payload.tvalHigh = extract64(trap_addr, 32, 32);
+
+    rv_etrace_write_bits(buf, bit_pos, 32, payload.tvalLow);
+    bit_pos += 32;
+    rv_etrace_write_bits(buf, bit_pos, 32, payload.tvalHigh);
+
+out:
+    return HEADER_SIZE + header.length;
+}
diff --git a/hw/riscv/rv-trace-messages.h b/hw/riscv/rv-trace-messages.h
index c7226b50a9..f210e048dd 100644
--- a/hw/riscv/rv-trace-messages.h
+++ b/hw/riscv/rv-trace-messages.h
@@ -21,5 +21,10 @@ typedef enum {
 
 size_t rv_etrace_gen_encoded_sync_msg(uint8_t *buf, uint64_t pc,
                                       TracePrivLevel priv_level);
+size_t rv_etrace_gen_encoded_trap_msg(uint8_t *buf, uint64_t trap_addr,
+                                      TracePrivLevel priv_level,
+                                      uint8_t ecause,
+                                      bool is_interrupt,
+                                      uint64_t tval);
 
 #endif
-- 
2.43.0


