Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FD5C61DC2
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 14:49:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wysRP-00012i-FF; Tue, 25 Aug 2026 10:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1wys35-0002z0-DF
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 10:22:47 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1wys33-0002E2-9y
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 10:22:47 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-39c86ce9e29so36811971fa.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787667764; x=1788272564; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LLdbykr++5bwM76buDIbQJ6X1nZUyGXveEMjxM/ZTkk=;
 b=g7sRvpHYzydvyKHRWMVO1F5axg2SrtCbJqp/cQY04r3qxHQwUlUlMz39c3xXoBI8K6
 ncehBrAtG2LxRNm6SoiMLErXGJzbrmTllTnsbN1bBTmamZSdSSH+sh89y1fjucEBwTEf
 ot8JP3k1+82wfjUa7Zhpbz9fHWD1kLtebsapR7TFexc+85CpFrHWDEi277+5/uBOTjAa
 KI7lvGt83/+xKVFKdwSjCR+psj+jMf/0TltiXsoi5FaWTGDrQDjjCtj//jqJ/2Q2UgFQ
 ZZ8PMnoclCYWFykG7d+v7BObR55+5Qyf6R7l2tqtL+nfFTJJPgcR04tZvspI2LjwNkLH
 37GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787667764; x=1788272564;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LLdbykr++5bwM76buDIbQJ6X1nZUyGXveEMjxM/ZTkk=;
 b=sQo1kh1BPGtowBqC3R+/C8S4eu0SCTuizGdqAGFYTN/rr/OnodlLutQNj5/ejSjlOv
 Ob4DGkICEQcugQesCEJsolr9er5c4hvzHotP5OBAYT0vmKFhyqCHTHT27P7PBNHxOWxk
 fLYHSJrje0VMpQibVhHPibBCiWrNBvv7TOBvoFh9yN4yr44Wa5TWPhORkefZzGX1A8Dd
 B2CTLc5bkvExmQWtxWMy0MB2eJRUoEqhwja34jW1nzof2Pn6hjZSLk31GcrAajmP1LZM
 mGjvXcPiOX2SAWXYFMhEBwOdrYHHCBgqLriDUyWvcyd7Q49xzsm3GW3kDHy6mpbfcXug
 +68Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RpNnjjpc4OfN0H4R6Sa9iDTb72in7ghEoeqO9x7e8lnaF5XSgC/iDA1AuXcKb0gkBTwKLVWJd8z/9XD@nongnu.org
X-Gm-Message-State: AFuF++mdnIauJn4ZWEn0nzUtGVAcWGNMtKgfC6krOD/w9kFdvH4jQgVC
 7EKMqcBZS6OY9e31ZwsDTj02/2ARMIowVV9r42MVZfKeojMiVA4FG/PP
X-Gm-Gg: AR+sD12SqiBUl680SxyEkc8vb8lPQjMCmDkgw6poDcyCHt5CKW78IGKQe6/eUnlEUCB
 57tKUXtvASJdeS8ek+d4OIOe7GIMFxy4VXx+ig9rraVTAQoNAHfFYnkESKvkXjALq79qAKwJ+Hb
 HgIxewgfaimJ+38kH5hgzjsoTxN5jVAPMti9J5leF9y2o3+1ux7G+rtlaZnHy6TkZ+no6FALI9R
 1YB27moX2KqylDHXEG2mMdZ30MoE/onEt1uxRsVAt5ENfwpa/ZKAB5kac/qfwdv5AXXfb86yznO
 XqioXgjZOERwa8HnS/Mu17RKER2ByDpQWdu3hAN059b1Fb0/SBiPJdkMh2P1LNbObncwt18qL0C
 uL6FGBn65Oiu58vJBCtB+dAGi/urjUk5sfZzrAsjRDP1bvk6/Sa00m6veOVz2aGrQt4plVfYJyF
 tqGLk3ytT3T1fqz0bcIONNqa2dZRsbNncEVIPadqarJhMlGCIoW53IGzcYhLkFD+CzxVJcb0cuv
 m3+galVHdyVn1Q4JuCKbbadt5StDA==
X-Received: by 2002:a05:651c:220b:b0:39b:374a:afb8 with SMTP id
 38308e7fff4ca-3a1ae863638mr87868301fa.0.1787667763479; 
 Tue, 25 Aug 2026 07:22:43 -0700 (PDT)
Received: from [127.0.1.1] (broadband-90-154-73-22.ip.moscow.rt.ru.
 [90.154.73.22]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a1c82f6b02sm22457551fa.41.2026.08.25.07.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 07:22:42 -0700 (PDT)
From: Konstantin Semichastnov <antikostya2@gmail.com>
Date: Tue, 25 Aug 2026 17:22:33 +0300
Subject: [PATCH 09/13] hw/riscv: add n-trace ProgTraceCorrelation
 rv-trace-message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-upstream-ntrace_core-v1-9-f8be2f40d2fd@gmail.com>
References: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
In-Reply-To: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexei Filippov <halip0503@gmail.com>, 
 Konstantin Semichastnov <antikostya2@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6795; i=antikostya2@gmail.com; 
 h=from:subject:message-id;
 bh=1Z8nYN1UHVYzP6GGa1UOZSzuTuIAwQBijSQnx5WMLyM=; 
 b=owEBbQKS/ZANAwAKAUiKpW6lUN52AcsmYgBqjaUjwJNzpwo2SKgYpUOt3oI5a8prZKbeflsVi
 rDvezupm9aJAjMEAAEKAB0WIQRMBWLx2o+linEPEBhIiqVupVDedgUCao2lIwAKCRBIiqVupVDe
 dgH7D/9v28OkyiIz9zBsNE26zFjNUpFwhXngCxBuumabnTAjvg3vS9PBqYS+BC2jiS6nFoING/h
 Poy7INsL+jeZOS4/SbaErEZv7rDsdTI3R8DHRZb0OIZOtL4EpDGN9qT2aCas2YRFWSM64ndcm9s
 WigG6nE1Fzw+s49UQ251H/fD0BZoo20OjLs7ojB8liXt0htuLDfByNV5ggMDnjm+5fvQoBg5fRy
 dmXPWGqg81xD68JJofQJzt8g3xUhvTNH+CT6oG7kGAVVqRQ7MnJnHR7XkTuL9SUMr/+NoRbN0cA
 RsQXlf1hu13odIxdM/S8TpBsQgAtRtZ1fjh7ZRWOnO8OYXcebWbeqoWESBWYmQNPLBV0PvsWFiO
 VI1EZn8j0Nbow3mr3TJsAyHNvgus7WHqPt9zdgHpM6em/I8kK7kPNvdvnUwNpdfdTun8fPc7ikl
 TDDpJRMn5/8mkDZOqr08EawZsmIpYLGBGQR4jwUSGPgzvPopQSpUlCGEe0+f/5qOy1Gqql8tvvp
 mGVU1X0QQihNJUeh+GSnRZpNsRJSvPLvzgzxYitoZp7YfGHW2fiSgMbx+f4cKj2OIU7E96qOKu7
 hKpM50Qfa5zc++frSQIU3jUiYiPCWXyhJO4ZSsFNPofL1TpUQvpWv7QsHjq9B4ZiN8VQwvgD3so
 EPVx7qkYRzKAN8A==
X-Developer-Key: i=antikostya2@gmail.com; a=openpgp;
 fpr=4C0562F1DA8FA58A710F1018488AA56EA550DE76
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=antikostya2@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 25 Aug 2026 10:47:44 -0400
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

Add generation, encoding and sending logic for N-Trace
ProgTraceCorrelation message.

Signed-off-by: Konstantin Semichastnov <antikostya2@gmail.com>
---
 hw/riscv/rv-trace-messages.c | 40 ++++++++++++++++++++++++++++++++++++++++
 hw/riscv/rv-trace-messages.h |  4 ++++
 hw/riscv/trace-encoder.c     | 28 ++++++++++++++++++++++++++++
 hw/riscv/trace-encoder.h     |  8 ++++++++
 4 files changed, 80 insertions(+)

diff --git a/hw/riscv/rv-trace-messages.c b/hw/riscv/rv-trace-messages.c
index 8a9a3c6955..708e48bbed 100644
--- a/hw/riscv/rv-trace-messages.c
+++ b/hw/riscv/rv-trace-messages.c
@@ -359,11 +359,14 @@ typedef enum {
     WIDTH_FADDR  = 63,
     WIDTH_UADDR  = 63,
     WIDTH_HIST   = 32,
+    WIDTH_EVCODE = 4,
+    WIDTH_CDF    = 2,
     WIDTH_RCODE  = 4,
 } NTraceFieldWidth;
 
 typedef enum {
     TCODE_PROG_TRACE_SYNC        = 0x9,
+    TCODE_PROG_TRACE_CORRELATION = 0x21,
     TCODE_RESOURCE_FULL          = 0x1b,
     TCODE_INDIRECT_BRANCH_HIST   = 0x1c,
 } NTraceTcodeFieldValues;
@@ -373,6 +376,10 @@ typedef enum {
     SYNC_TRACE_ENABLED = 5,
 } NTraceSyncFieldValues;
 
+typedef enum {
+    CDF_ICNT_AND_HIST_PRESENT = 1,
+} NTraceCdfFieldValues;
+
 typedef enum {
     RCODE_HIST_PRESENT = 1,
 } NTraceRcodeFieldValues;
@@ -432,6 +439,20 @@ typedef struct NTraceFieldPayload {
         .value = (val),      \
     }
 
+#define PAYLOAD_EVCODE(val)    \
+    {                          \
+        .type = FIELD_FIXED,   \
+        .width = WIDTH_EVCODE, \
+        .value = (val),        \
+    }
+
+#define PAYLOAD_CDF(val)     \
+    {                        \
+        .type = FIELD_FIXED, \
+        .width = WIDTH_CDF,  \
+        .value = (val),      \
+    }
+
 #define PAYLOAD_RCODE(val)    \
     {                         \
         .type = FIELD_FIXED,  \
@@ -531,6 +552,25 @@ size_t rv_ntrace_gen_encoded_prog_trace_sync_msg(uint8_t *buf, uint64_t faddr)
     return rv_ntrace_gen_encoded_msg(buf, msg_fields);
 }
 
+size_t rv_ntrace_gen_encoded_prog_trace_correlation_msg(uint8_t *buf,
+                                                        uint32_t evcode,
+                                                        uint32_t icnt,
+                                                        uint32_t hist)
+{
+    const NTraceFieldPayload msg_fields[] = {
+        PAYLOAD_TCODE(TCODE_PROG_TRACE_CORRELATION),
+        /* SRC field is not supported for now */
+        PAYLOAD_EVCODE(evcode),
+        PAYLOAD_CDF(CDF_ICNT_AND_HIST_PRESENT),
+        PAYLOAD_ICNT(icnt),
+        PAYLOAD_HIST(hist),
+        /* TSTAMP field is not supported for now */
+        PAYLOAD_END(),
+    };
+
+    return rv_ntrace_gen_encoded_msg(buf, msg_fields);
+}
+
 size_t rv_ntrace_gen_encoded_resource_full_msg(uint8_t *buf, uint32_t hist)
 {
     const NTraceFieldPayload msg_fields[] = {
diff --git a/hw/riscv/rv-trace-messages.h b/hw/riscv/rv-trace-messages.h
index 7ed8737d14..a4d14de59a 100644
--- a/hw/riscv/rv-trace-messages.h
+++ b/hw/riscv/rv-trace-messages.h
@@ -38,6 +38,10 @@ size_t rv_etrace_gen_encoded_format1(uint8_t *buf,
                                      bool notify, bool updiscon);
 
 size_t rv_ntrace_gen_encoded_prog_trace_sync_msg(uint8_t *buf, uint64_t faddr);
+size_t rv_ntrace_gen_encoded_prog_trace_correlation_msg(uint8_t *buf,
+                                                        uint32_t evcode,
+                                                        uint32_t icnt,
+                                                        uint32_t hist);
 size_t rv_ntrace_gen_encoded_resource_full_msg(uint8_t *buf, uint32_t hist);
 size_t rv_ntrace_gen_indirect_branch_hist_msg(uint8_t *buf, uint8_t btype,
                                               uint32_t icnt, uint64_t uaddr,
diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
index 302458bfba..c36d205f50 100644
--- a/hw/riscv/trace-encoder.c
+++ b/hw/riscv/trace-encoder.c
@@ -259,6 +259,16 @@ static void trencoder_te_ctrl_postw(RegisterInfo *reg, uint64_t val)
     RISCVCPU *cpu = te->cpu;
     CPURISCVState *env = &cpu->env;
 
+
+    if (te->ntrace && te->enabled) {
+        if (!trTeActive || !trTeEnable || !trTeInstTracing) {
+            uint32_t inst_len = get_inst_len_at(env->pc);
+
+            trencoder_send_prog_trace_correlation(OBJECT(te), env->pc, inst_len,
+                                                  CORRELATION_TRACE_DISABLED);
+        }
+    }
+
     if (!trTeActive) {
         te->enabled = false;
         te->trace_running = false;
@@ -658,6 +668,24 @@ static uint32_t rv_ntrace_get_and_reset_icnt(TraceEncoder *trencoder,
     return icnt;
 }
 
+void trencoder_send_prog_trace_correlation(Object *trencoder_obj, uint64_t pc,
+                                           uint32_t inst_len,
+                                           TraceStopReason evcode)
+{
+    TraceEncoder *trencoder = TRACE_ENCODER(trencoder_obj);
+    g_autofree uint8_t *msg = g_malloc0(TRACE_MSG_MAX_SIZE);
+    uint32_t icnt = rv_ntrace_get_and_reset_icnt(trencoder, pc, inst_len);
+    uint32_t hist = rv_ntrace_encode_and_reset_branch_map(trencoder);
+    uint8_t msg_size;
+
+    g_assert(trencoder->ntrace);
+
+    msg_size = rv_ntrace_gen_encoded_prog_trace_correlation_msg(msg, evcode,
+                                                                icnt, hist);
+
+    trencoder_send_message_smem(trencoder, msg, msg_size);
+}
+
 void trencoder_trace_trap_insn(Object *trencoder_obj, uint64_t curr_pc,
                                uint64_t target_pc, uint32_t ecause,
                                bool is_interrupt, uint64_t tval)
diff --git a/hw/riscv/trace-encoder.h b/hw/riscv/trace-encoder.h
index d1ff813035..55d53c2582 100644
--- a/hw/riscv/trace-encoder.h
+++ b/hw/riscv/trace-encoder.h
@@ -63,12 +63,20 @@ typedef enum {
     BTYPE_INTERRUPT    = 3,
 } TraceBranchType;
 
+typedef enum {
+    CORRELATION_TRACE_DISABLED = 4,
+} TraceStopReason;
+
 #define TYPE_TRACE_ENCODER "trace-encoder"
 
 OBJECT_DECLARE_SIMPLE_TYPE(TraceEncoder, TRACE_ENCODER)
 
 void trencoder_set_first_trace_insn(Object *trencoder_obj, uint64_t pc);
 void trencoder_send_prog_trace_sync(Object *trencoder_obj, uint64_t pc);
+void trencoder_send_prog_trace_correlation(Object *trencoder_obj,
+                                           uint64_t pc,
+                                           uint32_t inst_len,
+                                           TraceStopReason evcode);
 void trencoder_send_indirect_branch_hist(TraceEncoder *trencoder,
                                          uint64_t curr_pc,
                                          uint32_t curr_inst_len,

-- 
2.43.0


