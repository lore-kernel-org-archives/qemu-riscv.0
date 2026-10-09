Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704B1CA6019
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 14:16:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xFBOP-0005E3-F1; Fri, 09 Oct 2026 10:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1xFBHA-0003Uz-DV
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2026 10:08:51 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1xFBH6-00080N-Hw
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2026 10:08:42 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-3a9841363b5so36403271fa.2
 for <qemu-riscv@nongnu.org>; Fri, 09 Oct 2026 07:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791554919; x=1792159719; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ft0tcGu2gGawbMzaoRRdiqTE5DGODgbTUY11kMyRl2g=;
 b=fTWz6pSE43s3kcESoIbdmuchF0boc/PVypAoP2KqOVTRFwsL7xGyuGQ9UH50umZnk+
 3WWDiJSFKV/h6jvuSnxDNRVkYJnKvtnrr4GuMJUtRXtkXFyqxRKz4RzJoQTiQ8DODdHl
 y/7zBptxk2F/2wXqyEFx5rysqPy38bC9vzulV3oTabyGRFRnkT0sarXns8rX7Z/cTaCU
 YGJVQ+YG3F+RpoAwQ7v4lqJnn4F3DDg62KVKrXf1KmN4bM8VBY3eIM7ZreVm18qZvJbl
 MnLME+/CZbCn+D1i6Knu5EtJhTkT2f24mNicTv3WwpTa9fMiAMBdFaBf3dYiYAx5GkOw
 ZQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791554919; x=1792159719;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ft0tcGu2gGawbMzaoRRdiqTE5DGODgbTUY11kMyRl2g=;
 b=lazATN45/8te9L3Jf04tY/sH2tvFQX2RdEYXdKLxeJTzvU+HN+8zX5UtBwB9fmbbDs
 wpJmNLvDTe3R60VmAVFRst5W52KyjJux6pyxQoy3yto2KIsX0DAB2ICay8UWkpNbu/Et
 qtRqpJMEghxFzW6K7zSMw3iOY1NJhvgRKzHkQ8KjY1FA6yfKVkIQwXp2P7FdugTwgMP/
 S8P4Tg+q2iHqqll71k/C1LRkFsN4c8lhC8hNZqiIvLvwnTt5rP3hLC7SqpNdEMq2VvWa
 poPMKKFFhIiUgZv04phTfLhO+96cUt3hCSyFOMfxL/a98/IZeE1tJBoL+n9AQS9mR9t8
 vg4w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwJ4cyTOlUL/bBuiEslPKcxg9p43mUZ7i0JqhhA3DM9U2rLoWpYMYWGqH3dXr62odenrgR1+MPEqar9@nongnu.org
X-Gm-Message-State: AFq9FYITxXk7AP5NGQ7Ob/DIhUgeCMSHRNnQlCHjuiT6C7FWZvWF7N7T
 cbZbzn6ktss2hNbrdvh+1UW/HiHSZujkbTy5EZRo/68TYcwu6Fnjt2HW
X-Gm-Gg: AYBFou0PWpvKydV4/6NKFP2E+UJsxuRueIQBU9FyJKjFJzscn8ihexGcFNERWzMu2ku
 UtRV2nc0UQ111O9rSLpt7a+QoEJOlU9kuntQU6eSiBMWLpc7IVFi/m6aL013UF3PLRjwKhO4lEf
 5lAHLhz8umgMZ5JFRZtSUuttmQrRiymNeueO5BnTiPx5CrJVPHLcCYwUI/luLQNH1p5lNEHetNz
 EFaCXQikiSeQuQkp/tHfyCQsub2C1Yz1b9uoDdclIijiRl6Ak0ly+Tvjx5m5ULTi6gxXppsTBdT
 Lm7SUZrojc3aDzR+RRtBOtQs3jdaMDFvwB5Yvy9BseOpZ844vIGijGANehJNwpvecyfLYSdkYXp
 eEY3Z1foyCGGEhi8RaNfumjJ1xzIPDlqBXalSWaYuLmPXjt13j/Dff+KcwL5UavHjOM+/dQcsdx
 +SFYzffW9Bdv9zxW1X7x6MYbzjq1StqZC1PqrBgUY6koJSToTht2kLwYPeG5qdxgll7H1oyn7zq
 m8o/F4mRBlqYfO7sGzpmTlG5nE8oA78SiGrkb9ZEnqw2UzN
X-Received: by 2002:a05:6512:3c90:b0:5bc:b531:51d7 with SMTP id
 2adb3069b0e04-5bcde6b3fbemr697761e87.12.1791554918479; 
 Fri, 09 Oct 2026 07:08:38 -0700 (PDT)
Received: from localhost (broadband-5-228-114-10.ip.moscow.rt.ru.
 [5.228.114.10]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5bcddecfc20sm655991e87.84.2026.10.09.07.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 07:08:37 -0700 (PDT)
From: Konstantin Semichastnov <antikostya2@gmail.com>
Date: Fri, 09 Oct 2026 17:03:07 +0300
Subject: [PATCH 6/6] hw/riscv/trace-encoder.c: emit PTC message when trace
 started disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-upstream-ntrace_filter-v1-6-8f061c9b24da@gmail.com>
References: <20261009-upstream-ntrace_filter-v1-0-8f061c9b24da@gmail.com>
In-Reply-To: <20261009-upstream-ntrace_filter-v1-0-8f061c9b24da@gmail.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 Alexei Filippov <halip0503@gmail.com>, 
 Grigoriy Bereznyakov <gregoriy93.gb@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=antikostya2@gmail.com; 
 h=from:subject:message-id;
 bh=hmvihcwYPu69+wUJJkFwl77m6Awy3R/i9UzfXrnluqQ=; 
 b=owEBbQKS/ZANAwAKAUiKpW6lUN52AcsmYgBqyPQWFssTDmJO68YDYwr34WnSfp+ZM60PtMaCA
 SZmQpRXhHKJAjMEAAEKAB0WIQRMBWLx2o+linEPEBhIiqVupVDedgUCasj0FgAKCRBIiqVupVDe
 drIkEAC+eP50uXN994TEd5F1mJPa5oxIxYxHqebs5IXniaFN77Dg3KV8Iv0uTkmSLamcIVYfBZt
 P6hNHPvwipS5cb9Wqhm3eWR6HIX8nTWlqjXRfDzjrbMU4BxyMidQ5hIK6gCobtZ9EoV1fphIQvn
 Nrvh1j5TJOWD8B2TB9Hh/ImKYwYg+QgxlSsj0UoYRBafZd9bXtpCTroyH9x+NehcqLs+7R9Mod4
 X3UwIol6XnQOuUcBUI/CD6Pssq6ZEKYwJusTYxCs+YYgdC7yk/qkn2ewFyPI2OWyGTNeGwgsl5x
 Xd8ioTMbQJMEzMEDgqu3ISGv6lN/SANkhknklnQlh6K9W/tO4wEOOcDCEVfvtaa3KyRPTu7g2+y
 VbaPpt4MUC47p6urhrYyToHb5dokNan1Ag37ED6nCGF8KIilaIXrrEk5p/DuIsCWFsqaSuZZHXW
 wsygMfdcVdtIi5WML6aCPMMqem8HDvO+psCjzYXTlKc1O6P5oYRQ1Yeng5KDbIUm3VRFreOIbIQ
 uW7rVREvAgy+i5wsHKhiIoxcJmjpeeBSQtsgUK7q/5aU8qbEDLN03ZqZ+BXKRgaxbetP7uta6+J
 +FOZwQhL3PDcWbEI+m5vW4nxpIWzDwHEi4mrTO6SVPdTQA2dHu23fIHF5al6kTO/37d+GI/zIIw
 RtYmmWAr4atxjEg==
X-Developer-Key: i=antikostya2@gmail.com; a=openpgp;
 fpr=4C0562F1DA8FA58A710F1018488AA56EA550DE76
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=antikostya2@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

If we will enable filtering and enable tracing, we will see
nothing, but according to RISC-V N-Trace (Nexus-based Trace)
Specification v 1.0 p.8.6 Table 26 - if Trace starts disabled
ProgTraceCorrelation with EVCODE=4(Trace Disabled) should be emitted.
So, lets do that.

Signed-off-by: Alexei Filippov <halip0503@gmail.com>
---
 hw/riscv/trace-encoder.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
index e42c92d03a..71feefecd9 100644
--- a/hw/riscv/trace-encoder.c
+++ b/hw/riscv/trace-encoder.c
@@ -43,6 +43,7 @@ static void rv_ntrace_update_sync_msg_cnt(TraceEncoder *trencoder);
 static void rv_ntrace_update_sync_icnt(TraceEncoder *trencoder, uint64_t icnt);
 static uint32_t rv_ntrace_get_source_transmission_msg(TraceEncoder *trencoder,
                                                       uint32_t *src);
+static void trencoder_send_empty_prog_trace_correlation(TraceEncoder *te);
 
 static TracePrivLevel trencoder_get_curr_priv_level(TraceEncoder *te)
 {
@@ -449,6 +450,8 @@ static void trencoder_te_ctrl_postw(RegisterInfo *reg, uint64_t val)
             if (trencoder_filters_match(te, INSTRUCTION_FILTERING,
                                         env->pc, env->pc)) {
                 trencoder_send_prog_trace_sync(OBJECT(te), env->pc);
+            } else {
+                trencoder_send_empty_prog_trace_correlation(te);
             }
         } else {
             te->trace_next_insn = true;
@@ -1317,6 +1320,19 @@ static uint32_t rv_ntrace_get_and_reset_icnt(TraceEncoder *trencoder,
     return icnt;
 }
 
+static void trencoder_send_empty_prog_trace_correlation(TraceEncoder *te)
+{
+    uint32_t src_msg;
+    uint8_t msg_size;
+    g_autofree uint8_t *msg = g_malloc0(TRACE_MSG_MAX_SIZE);
+    uint32_t src_width = rv_ntrace_get_source_transmission_msg(te, &src_msg);
+
+    msg_size = rv_ntrace_gen_encoded_prog_trace_correlation_msg(
+        msg, CORRELATION_TRACE_DISABLED, 0, 1, src_msg, src_width);
+
+    trencoder_send_message_smem(te, msg, msg_size);
+}
+
 void trencoder_send_prog_trace_correlation(Object *trencoder_obj, uint64_t pc,
                                            uint32_t inst_len,
                                            TraceStopReason evcode)

-- 
2.43.0


