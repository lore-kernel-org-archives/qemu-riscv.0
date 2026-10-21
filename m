Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7C5606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 23:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQxytY5i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0VZ/Gmz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJfWE-0007r6-Gq; Wed, 21 Oct 2026 19:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfW7-0007hn-FK
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfW5-00052c-2a
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:42 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LKeMRc1723127
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=HziJ8UBV9UV
 9YJwY/KW+mHg4CspLb3r8IA/SuQ3F/60=; b=hQxytY5iFTX8JXM62vFQrSu3Yok
 0yCgrjzVsfZG/9M+DqjEWvUWu28z6ggVBYpjvoXe9I/l4h5aK320DMYYvIKrvzSD
 Ld69cqY0dWn0a2vUhXSaybXCmch5wehQeWezkj/dwvimGijxRx28pcuZaas7CPpl
 NKsC0gudTe34awRpWVnQfQLifLbA8oKN3iWdaqR5+9BfIZfVc/NZS1hhhkOPJymM
 ZljMmYSnhoOd57bMPlNNAM/HW1Z20CRgKguJcmuEJP2IoDpG/cgAEdbnFfAfDxb9
 NvQCgRLA4SRcweZzeu4CkTVAxnyuWzf1gMgLxAwPz8NZzbFtGJgfwIoDi+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj4b5dw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5351f1b26e6so19993561cf.2
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792624479; x=1793229279; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HziJ8UBV9UV9YJwY/KW+mHg4CspLb3r8IA/SuQ3F/60=;
 b=I0VZ/GmzTgIRfzuwxIgILftHxMhl2fGi8pxBws79Y2b7nlPM8UgDeOVS+zTkciJU5x
 CNQ0vLQbBtNkHoxlvFhA/Dv51XjXch5XT3F4vpO1PchgmCe6BT+FlgxC8GnAcgSfzLUw
 7jh8MtJhh8tflIJLEqRAbA8G1aIKvWjVFZdukXM30rsocU0bYRrQyuM8xqhTWDN0Bp9e
 qx4mjzdFnlo64CGDa7HNa9GBSs9pwtn7E7gzMKYxPXLyFUVYbYzPBXRycI176mZa4aif
 Kwa+aIoW4T4ccwlKz3Xc03/WLSNt6s3BPy+6YwE0La8OUu1GgAylO9MJ4kVdmRY/NED4
 kG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792624479; x=1793229279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HziJ8UBV9UV9YJwY/KW+mHg4CspLb3r8IA/SuQ3F/60=;
 b=L2iHXLRXsceoQjy9xgujS8rOWBfHC2XJUvrDyqY1cNRekE4ou65ca5KyCLrHzN+O1e
 tIcqcptdmqUXgX98wuyfeN1eUuQ8nQBwXMkfb9bxdciHe3LQwaEDK10PswIynXkimQQL
 +dS3yX6K2MX7kt8BlacOlRLAfdOjR9QkKeTRf+OT4nfFLtsxdVDqRoEiUp2SOYB99DPG
 Rl/F0ZD6DgEpB5RxjsH3fWuUoMV++0cpDwxt7R+pSa1n58f73+5vNKeW8PY48R7rem7D
 Nl1M9N0yvSLMXTPEY5Br+sCiqdu9wT8BfWxOwkQvJdnGwSLBnvUAL51HD5YV/FOmvdxo
 vZDQ==
X-Gm-Message-State: AFq9FYLc5mVR9vXcxOflaUuVfAz/5YsNC5o1i9VCqBDQUCSyS/mO0+1W
 /Y6qWjgSdf7AzbzhgVw9MlYbOEgEIkOwXv13WagOBfbhT8vB4yt0hhu3j7LbHEUWJTXAorPxIZM
 Ezwr758yAdewVEMKfIyYEep265QzIqZsf+E57jdx3NUHcdnW7YttF/92rDw==
X-Gm-Gg: AYBFou3ykR6odtQBxc0HvLAHYnvL43cnnJAlPLXaR3Pn9b0DrmtG+NcDrGYnqzSdNwL
 2feHBHT+2RpYvTIgBUehqlAew0jyzuVQHAR6/MdrAjPsmvea2tI1y7IZfTH9jhW9YtzbunB31fa
 /pEtctsCFiv6L0oYFgOBmvlDDRoDa2znXO3Bp0Dmsf5knM38q9HKt23oPRBFdkkmjsyjpq8Swwy
 2tN0g/kd6/4PACSd2iApKVsdWGc1QG7S3g3qrODAHN8awcRNqMH/PvBWkToJgMcWQsGonyIXPPY
 59UIRit+qMAZxjdr8Su1CcbwHCLkLJVq6tcKnXoeprl7laIyXqXNv0RihTJiU2Km0nRv2ALpadu
 FaAt6Kl4T99+A5su7U5fZ7Pt446NJ2M4TLl25D47NCAwQhV7TiO16zVOSlFdAQCKdnHjeEFf0wA
 ==
X-Received: by 2002:a05:622a:1aa5:b0:536:6902:db04 with SMTP id
 d75a77b69052e-5369bb9b16emr55840261cf.75.1792624478624; 
 Wed, 21 Oct 2026 16:14:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:536:6902:db04 with SMTP id
 d75a77b69052e-5369bb9b16emr55839861cf.75.1792624478067; 
 Wed, 21 Oct 2026 16:14:38 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com
 (200-204-190-237.dsl.telesp.net.br. [200.204.190.237])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536ab6cd0dcsm11995651cf.6.2026.10.21.16.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 16:14:37 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 antikostya2@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 14/18] hw/riscv,
 target/riscv: send resync updiscon trace packets
Date: Wed, 21 Oct 2026 20:13:41 -0300
Message-ID: <20261021231346.2452179-15-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zCDRRQWHNjGYkLTIPV0Aq-tnBlsJ3RGg
X-Proofpoint-GUID: zCDRRQWHNjGYkLTIPV0Aq-tnBlsJ3RGg
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad9475f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=v6o39jtdX7kFEx2kGjIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfX70YenivZM6mi
 IW+SQxT7cF0JnuXBMLHZXC8vRLdNiDhbRV6j9H4t+Nn0kmoB4yIhD9nSA9pn9myfqKVja97Y/kS
 oeMQT4q/cdTOICy5dkUWZdyr9u4QgWP+eQgDQ1AZdAYV7smNPAdoU6h6/N4K0if2HRAbSLesaLo
 pv5zkMNHzLKS4oPjFtck/t5kPbYx9hVVBZ/wCoELYyO62bQAqkzD7mwW3OWIx/wbiD7B9JA1thE
 9HFaiRiaPKANLQn8L47IPLSn/1oG5n7maCnsKWOv6OOUd9HT6P14p73qLiqHlCtngrJOnlTSCvP
 yOkrBdjFLtvggyomm02zhD/hkgK75t2iM4pnq71RgJ8Ygz09E1iFVHfn5xMvGLG25FPXCLXs5GK
 njSxG0c752IUbeh71Lt0+d4CIJ28ummcHlQI5rAeqOwcvOPnSlttSOrNkYZ15HHN+Z+5/0tjGUa
 +/L3Hwmut7Tznc1biwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfX82+OsflqWfer
 odtpIGJuSkxqMAgnKvEstC7guI3YZAq6TtBnce9hiULPiD33VsxXTrMJL1cbR8KZUVfHulgs85r
 KDjCCEg49Hl+14yZ/3Ny4dxIB9UVAfE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
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

Send updiscon packets based on the constraints already discussed in the
previous patch:

- We do not implement any form of call/return prediction in the encoder,
  and TCG will always retire a single insn per cycle, e.g. irreport will
  always be equal to updiscon;

- irdepth is not implemented since we'll always return a  package where
  irreport == updiscon.

Note that we're sending an updiscon packet if the 'updiscon_pending'
flag is set when we're about the send a resync or a trap packet. The TCG
helper in this case is just setting the trace encoder flags instead of
actually triggering a RAM sink SMEM write.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/trace-encoder.c                      | 37 +++++++++++++++++++
 hw/riscv/trace-encoder.h                      |  3 ++
 target/riscv/helper.h                         |  1 +
 .../tcg/insn_trans/trans_privileged.c.inc     | 11 ++++++
 target/riscv/tcg/insn_trans/trans_rvi.c.inc   |  2 +
 target/riscv/tcg/trace_helper.c               | 14 +++++++
 target/riscv/tcg/translate.c                  |  7 ++++
 7 files changed, 75 insertions(+)

diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
index b2e2707e0c..b9121d93a7 100644
--- a/hw/riscv/trace-encoder.c
+++ b/hw/riscv/trace-encoder.c
@@ -403,6 +403,22 @@ static void trencoder_send_sync_msg(Object *trencoder_obj, uint64_t pc)
     trencoder_send_message_smem(trencoder, msg, msg_size);
 }
 
+static void trencoder_send_updiscon(TraceEncoder *trencoder, uint64_t pc)
+{
+    g_autofree uint8_t *format2_msg = g_malloc0(TRACE_MSG_MAX_SIZE);
+    uint8_t addr_msb = extract64(pc, 31, 1);
+    bool notify = addr_msb;
+    bool updiscon = !notify;
+    uint8_t msg_size;
+
+    msg_size = rv_etrace_gen_encoded_format2_msg(format2_msg, pc,
+                                                 notify,
+                                                 updiscon);
+    trencoder_send_message_smem(trencoder, format2_msg, msg_size);
+
+    trencoder->updiscon_pending = false;
+}
+
 void trencoder_set_first_trace_insn(Object *trencoder_obj, uint64_t pc)
 {
     TraceEncoder *trencoder = TRACE_ENCODER(trencoder_obj);
@@ -410,6 +426,10 @@ void trencoder_set_first_trace_insn(Object *trencoder_obj, uint64_t pc)
     g_autofree uint8_t *msg = g_malloc0(TRACE_MSG_MAX_SIZE);
     uint8_t msg_size;
 
+    if (trencoder->updiscon_pending) {
+        trencoder_send_updiscon(trencoder, pc);
+    }
+
     trencoder->first_pc = pc;
     trace_trencoder_first_trace_insn(pc);
     msg_size = rv_etrace_gen_encoded_sync_msg(msg, pc, priv);
@@ -427,6 +447,10 @@ void trencoder_trace_trap_insn(Object *trencoder_obj,
     g_autofree uint8_t *msg = g_malloc0(TRACE_MSG_MAX_SIZE);
     uint8_t msg_size;
 
+    if (trencoder->updiscon_pending) {
+        trencoder_send_updiscon(trencoder, pc);
+    }
+
     msg_size = rv_etrace_gen_encoded_trap_msg(msg, pc, priv,
                                               ecause, is_interrupt,
                                               tval);
@@ -436,9 +460,22 @@ void trencoder_trace_trap_insn(Object *trencoder_obj,
 
 void trencoder_trace_ppccd(Object *trencoder_obj, uint64_t pc)
 {
+    TraceEncoder *trencoder = TRACE_ENCODER(trencoder_obj);
+
+    if (trencoder->updiscon_pending) {
+        trencoder_send_updiscon(trencoder, pc);
+    }
+
     trencoder_send_sync_msg(trencoder_obj, pc);
 }
 
+void trencoder_report_updiscon(Object *trencoder_obj)
+{
+    TraceEncoder *trencoder = TRACE_ENCODER(trencoder_obj);
+
+    trencoder->updiscon_pending = true;
+}
+
 static const Property trencoder_props[] = {
     /*
      * We need a link to the associated CPU to
diff --git a/hw/riscv/trace-encoder.h b/hw/riscv/trace-encoder.h
index 64e19c5752..9116fe4f56 100644
--- a/hw/riscv/trace-encoder.h
+++ b/hw/riscv/trace-encoder.h
@@ -36,6 +36,8 @@ struct TraceEncoder {
     uint32_t regs[TRACE_R_MAX];
     RegisterInfo regs_info[TRACE_R_MAX];
 
+    bool updiscon_pending;
+
     bool enabled;
     bool trace_running;
     bool trace_next_insn;
@@ -51,5 +53,6 @@ void trencoder_trace_trap_insn(Object *trencoder_obj,
                                bool is_interrupt,
                                uint64_t tval);
 void trencoder_trace_ppccd(Object *trencoder_obj, uint64_t pc);
+void trencoder_report_updiscon(Object *trencoder_obj);
 
 #endif
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 0832159adc..68348e5473 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -132,6 +132,7 @@ DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl)
 
 /* Trace helpers (should be put inside ifdef) */
 DEF_HELPER_2(trace_insn, void, env, i64)
+DEF_HELPER_1(trace_updiscon, void, env)
 
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_1(sret, tl, env)
diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
index e22df6fbe7..531eb40595 100644
--- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
@@ -26,6 +26,8 @@
 
 static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
 {
+    gen_trace_updiscon(ctx);
+
     /* always generates U-level ECALL, fixed in do_interrupt handler */
     generate_exception(ctx, RISCV_EXCP_U_ECALL);
     return true;
@@ -40,6 +42,8 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
     uint32_t ebreak = 0;
     uint32_t post   = 0;
 
+    gen_trace_updiscon(ctx);
+
     /*
      * The RISC-V semihosting spec specifies the following
      * three-instruction sequence to flag a semihosting call:
@@ -101,6 +105,8 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 {
 #ifndef CONFIG_USER_ONLY
     if (has_ext(ctx, RVS)) {
+        gen_trace_updiscon(ctx);
+
         decode_save_opc(ctx, 0);
         translator_io_start(&ctx->base);
         gen_update_pc(ctx, 0);
@@ -119,6 +125,8 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 static bool trans_mret(DisasContext *ctx, arg_mret *a)
 {
 #ifndef CONFIG_USER_ONLY
+    gen_trace_updiscon(ctx);
+
     decode_save_opc(ctx, 0);
     translator_io_start(&ctx->base);
     gen_update_pc(ctx, 0);
@@ -153,6 +161,9 @@ static bool trans_mnret(DisasContext *ctx, arg_mnret *a)
 {
 #ifndef CONFIG_USER_ONLY
     REQUIRE_SMRNMI(ctx);
+
+    gen_trace_updiscon(ctx);
+
     decode_save_opc(ctx, 0);
     gen_helper_mnret(cpu_pc, tcg_env);
     tcg_gen_exit_tb(NULL, 0); /* no chaining */
diff --git a/target/riscv/tcg/insn_trans/trans_rvi.c.inc b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
index cc1b5dbbad..2de67c1a88 100644
--- a/target/riscv/tcg/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
@@ -183,6 +183,8 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
         }
     }
 
+    gen_trace_updiscon(ctx);
+
     lookup_and_goto_ptr(ctx);
 
     if (misaligned) {
diff --git a/target/riscv/tcg/trace_helper.c b/target/riscv/tcg/trace_helper.c
index 5a6d725f56..a4c5720a65 100644
--- a/target/riscv/tcg/trace_helper.c
+++ b/target/riscv/tcg/trace_helper.c
@@ -28,9 +28,23 @@ void helper_trace_insn(CPURISCVState *env, uint64_t pc)
         te->trace_next_insn = false;
     }
 }
+
+void helper_trace_updiscon(CPURISCVState *env)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    TraceEncoder *te = TRACE_ENCODER(cpu->trencoder);
+
+    te->updiscon_pending = true;
+    te->trace_next_insn = true;
+}
 #else /* #ifndef CONFIG_USER_ONLY */
 void helper_trace_insn(CPURISCVState *env, uint64_t pc)
 {
     return;
 }
+
+void helper_trace_updiscon(CPURISCVState *env)
+{
+    return;
+}
 #endif /* #ifndef CONFIG_USER_ONLY*/
diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
index fb82a6b2fa..7f6dc6e9e3 100644
--- a/target/riscv/tcg/translate.c
+++ b/target/riscv/tcg/translate.c
@@ -627,6 +627,13 @@ static void gen_ctr_jal(DisasContext *ctx, int rd, target_ulong imm)
 }
 #endif
 
+static void gen_trace_updiscon(DisasContext *ctx)
+{
+    if (ctx->cpu_trace_running) {
+        gen_helper_trace_updiscon(tcg_env);
+    }
+}
+
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     TCGv succ_pc = dest_gpr(ctx, rd);
-- 
2.43.0


