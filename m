Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E38C61DB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 14:49:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wysRL-0000zv-El; Tue, 25 Aug 2026 10:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1wys2u-0002vZ-8f
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 10:22:36 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1wys2s-0002Ao-Bs
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 10:22:35 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-39c94fccf3eso42981831fa.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 07:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787667752; x=1788272552; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UxmpAQ4p41B4A/aNtId4HsemUVtqDwwv6IPxghI3qK8=;
 b=JBSHl74VsdSb6YcpH7uJmZtCuSUSPps4HZy+6fS/IurDSosDNvkJ5H/1UBwKAAJaIa
 Ta3g1KvMEleSxrxCGvvsDimhmRvhnLn5TxNf2fbI7jgmxJbMjbremu3SyH0o9EqVRq9k
 QIvBl94g6YUSIXJ8xCggqkpiAt6/6FMP/3ZP1fwNHI50LDgogpch6vj93FZU85KB6TPK
 2CL3vR1k3+EK0/FhtSc4YZIQdaf4xBhqfcIvv/lXPLnObmB9zAP/tDHYh1f3mAmngF1V
 cKjMUKZ9ZOn5ui+tQ7w36xDGBWB56oNsee2M0CQJpHvGz36PaMBDlxaGdcBNVrdcS1c6
 mq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787667752; x=1788272552;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UxmpAQ4p41B4A/aNtId4HsemUVtqDwwv6IPxghI3qK8=;
 b=sGFggE7Y7R3jeGg6+80SxbUXDJcNr0EvFY2kmYkwx1YvajBI6IY5BJxWe9wLQqSQ+S
 BLgbzAHIW6HrPAEHEH2jZAHO9IodHoxHr8UrM06336ri/6KxOB7TKJIlVQOFdOypsuVo
 GN5k5zUI6Hb6ZG0ux1zpZtSVu46ksy793UJ+EQLqylVT8kXGF3ebDYxprgxuM4fgK0+G
 cxpWjMUzaCUKsb+NtVUG4be7L2NcbSxdfMG0SF+zQmBbKlAlGZ+cb/X80KefWFIpZKhK
 BthqDlV+a3ovm0ScdRoDwbGxOPFoyMNYE/Ejs4LQdRjm51OUxE/kLfAnLQFZQ4e/Dl9l
 p4sw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqbpGZUTr+4TkngqiZoX+cqKsGp+7aV2Rx+UTJjTnKnP/82Aux1KaPea0A2YRLLdRy83qXdQopcfufi@nongnu.org
X-Gm-Message-State: AFuF++l2G6ntZVrYxLYsZpiUhUso48pmmEYWWJLUms2I2c7FGUETVwGf
 ljwnt18D4u1nRlmfcm5NfV6qjn4DMQ6PcJT9OM5ZwCFmcqJpZYHW+OuC
X-Gm-Gg: AR+sD12H4WJqdYGTZoa+KUlyGc2bn/5EuIvTUbIfT8cYXTKZGlLjBce9QdR3uuua2Q3
 4ytK1+qgZH4jU44aFLw2Y2stwD5uygGTd5SEXvf/XZmu+DW+FbJwPOKmWI1QmnJcS6iClWm8YWg
 xHSiJkXKz9lOqdTysP4u7Sh0OTHby05F2GaBlB3J5FcUBPYwB8ofy7wPYgDNe/8LN4x9IHFBv/W
 dX6+RJIlCkAOtnplaBkqGpOnvL9yRzYZ9fxMb3uzvO4G7ajhEkJnt4JLe2F9/jj1oXjepXZgxBM
 cAO1VQ0gO5lmf1aXmkjVGx9nR/qXVzrL/X1JrD8LGgKSZaYkeM5rmykeJ79RY9xzdbnAKDE+nRl
 CrkUclY8t7a90PiXx4XcLlV1zlWD/mZPeK64CTYqXwIqgvZ3UdzsNJPpVuNP3zLicj5luqY8D+b
 k5/P0kpCTvmdZb3yhiTD3PmwmimIeMy9gWfBQVl9SNypO24Ei080EXfDZBGdGhp/4sewESuyQ9f
 0jHgWFvCi1X8FeFxLwxhWKaWrbtEQ==
X-Received: by 2002:a05:651c:2205:b0:3a1:534e:249d with SMTP id
 38308e7fff4ca-3a1c1e03253mr60095171fa.4.1787667752156; 
 Tue, 25 Aug 2026 07:22:32 -0700 (PDT)
Received: from [127.0.1.1] (broadband-90-154-73-22.ip.moscow.rt.ru.
 [90.154.73.22]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a1c82f6b02sm22457551fa.41.2026.08.25.07.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 07:22:31 -0700 (PDT)
From: Konstantin Semichastnov <antikostya2@gmail.com>
Date: Tue, 25 Aug 2026 17:22:26 +0300
Subject: [PATCH 02/13] hw/riscv/trace-encoder.c: add trace ntrace/etrace
 selection logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-upstream-ntrace_core-v1-2-f8be2f40d2fd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4258; i=antikostya2@gmail.com; 
 h=from:subject:message-id;
 bh=iOuVN5s3606uBw5VmjkyaRTVPL4JqFZaPnUIboojA0Q=; 
 b=owEBbQKS/ZANAwAKAUiKpW6lUN52AcsmYgBqjaUi0XR9ddupQ/s7cIBmjr645wiNlBsXay/tv
 YyfOVusjmmJAjMEAAEKAB0WIQRMBWLx2o+linEPEBhIiqVupVDedgUCao2lIgAKCRBIiqVupVDe
 di5REACZzsWPujTbI7fYm3QvcazU7UE2EVphk7/Dvwnqc2AkfvU0v6f2K2zRLlhI+bO05yJ2Yaz
 wy32r/iqxBN+VRduJo519tIeGKtMQ/V/fYyBgrjUqDx0pO9JB2S+Pi/O1/FcWzgfcy67bcFyU9/
 +AcAlouuGJtk3EYmaI77QC48S2wmnNd5m8H8UMQbY2pkBQgAgcoSJcjg3OtskVjmZAlVtHeMRYl
 JnlDAGZtZBEK/l+yZ9m8KlHLI5pXm9gEWC3pcLcNplVv6eQFYLKSGunGI2wwhA35o/pKwYb8DGM
 rxipvmmQdET0pg9iTot0h7NH+ixbufezaJDgGlkggJxdrCCJGbQGToWfs5eXJqzdX//ktKUrI6z
 v6/dHY/HYV9PgSxwEKGcb3RIGW9ll33hXhr8zVZLxbvlKKzAXsuI9KKQyQa/DYCXKew9Ak5Jthx
 wenAntQs2Dyb1IYmRhUpHVNMgkBzoMqDG8iKFw3jVf2tRGIeacep3eqRabqlK2UAvPz1FxhxzNB
 5siMPZww7roeSfgN4TxKn42zqIxIIuUtUAr/fERkOG93/Wrzy/ByEPvYFDjOfMWzaGuoR7iQJx2
 ZveqmhkXzRnMKkOUdLUHJEEdVUEOqyHJPNJJHxQwohC7dMnGCToYSyzkFJOEENuNADQO0O43wmp
 jtZnnVnK6a69vCg==
X-Developer-Key: i=antikostya2@gmail.com; a=openpgp;
 fpr=4C0562F1DA8FA58A710F1018488AA56EA550DE76
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=antikostya2@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 25 Aug 2026 10:47:37 -0400
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

Selecting trace message format rely on `TraceEncoder->ntrace` flag.
This flag mirrors trTeFormat bit.

For now only two values supported:

 - E-Trace (trTeFormat = 0), trace format, described by Efficient trace spec.

 - N-Trace (trTeFormat = 1), trace format, described by Nexus trace spec.

For now we not yet implemented any N-Trace messages, so currently
`ntrace` field only disables E-Trace messages competely. We will reuse
this field in following commits, when N-Trace messages added.

Signed-off-by: Konstantin Semichastnov <antikostya2@gmail.com>
---
 hw/riscv/trace-encoder.c    | 29 +++++++++++++++++++++++++----
 target/riscv/trace_helper.c |  8 ++++++--
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
index 53345a478c..34c8f60ce1 100644
--- a/hw/riscv/trace-encoder.c
+++ b/hw/riscv/trace-encoder.c
@@ -254,7 +254,11 @@ static void trencoder_te_ctrl_postw(RegisterInfo *reg, uint64_t val)
 
     if (!te->trace_running && trTeInstTracing) {
         /* Starting trace. Ask the CPU for the first trace insn */
-        te->trace_next_insn = true;
+        if (te->ntrace) {
+            /* send ProgTraceSync message */
+        } else {
+            te->trace_next_insn = true;
+        }
 
         te->ramsink_ramstart = trencoder_read_ramsink_writep(te);
         te->ramsink_ramlimit = trencoder_read_ramsink_ramlimit(te);
@@ -442,6 +446,8 @@ static void trencoder_send_sync_msg(Object *trencoder_obj, uint64_t pc)
     uint8_t msg_size;
     bool is_branch_taken;
 
+    g_assert(!trencoder->ntrace);
+
     trencoder->first_pc = pc;
     is_branch_taken = trencoder_addr_is_branch_taken(trencoder, pc);
     msg_size = rv_etrace_gen_encoded_sync_msg(msg, pc, priv,
@@ -458,6 +464,8 @@ static void trencoder_send_updiscon(TraceEncoder *trencoder, uint64_t pc)
     bool updiscon = !notify;
     uint8_t msg_size;
 
+    g_assert(!trencoder->ntrace);
+
     if (trencoder->branches > 0) {
         msg_size = rv_etrace_gen_encoded_format1(format2_msg,
                                                  trencoder->branches,
@@ -485,6 +493,8 @@ void trencoder_set_first_trace_insn(Object *trencoder_obj, uint64_t pc)
     uint8_t msg_size;
     bool is_branch_taken;
 
+    g_assert(!trencoder->ntrace);
+
     if (trencoder->updiscon_pending) {
         trencoder_send_updiscon(trencoder, pc);
     }
@@ -508,6 +518,11 @@ void trencoder_trace_trap_insn(Object *trencoder_obj,
     g_autofree uint8_t *msg = g_malloc0(TRACE_MSG_MAX_SIZE);
     uint8_t msg_size;
 
+    if (trencoder->ntrace) {
+        /* send IndirectBranchHist message */
+        return;
+    }
+
     if (trencoder->updiscon_pending) {
         trencoder_send_updiscon(trencoder, pc);
     }
@@ -525,9 +540,15 @@ static void trencoder_send_branch_map(Object *trencoder_obj)
     g_autofree uint8_t *msg = g_malloc0(TRACE_MSG_MAX_SIZE);
     uint8_t msg_size;
 
-    msg_size = rv_etrace_gen_encoded_format1_noaddr(msg,
-                                                    te->branches,
-                                                    te->branch_map);
+    if (te->ntrace) {
+        /* send ResourceFull message */
+        return;
+    } else {
+        msg_size = rv_etrace_gen_encoded_format1_noaddr(msg,
+                                                        te->branches,
+                                                        te->branch_map);
+    }
+
     trencoder_send_message_smem(te, msg, msg_size);
 }
 
diff --git a/target/riscv/trace_helper.c b/target/riscv/trace_helper.c
index cd57641d9b..9b43aeac09 100644
--- a/target/riscv/trace_helper.c
+++ b/target/riscv/trace_helper.c
@@ -34,8 +34,12 @@ void helper_trace_updiscon(CPURISCVState *env)
     RISCVCPU *cpu = env_archcpu(env);
     TraceEncoder *te = TRACE_ENCODER(cpu->trencoder);
 
-    te->updiscon_pending = true;
-    te->trace_next_insn = true;
+    if (te->ntrace) {
+        /* send IndirectBranchHist message */
+    } else {
+        te->updiscon_pending = true;
+        te->trace_next_insn = true;
+    }
 }
 
 void helper_trace_branch(CPURISCVState *env, target_ulong pc, int taken)

-- 
2.43.0


