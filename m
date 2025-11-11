Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19163CD13CF
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 11:52:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vImrZ-0007UG-JN; Tue, 11 Nov 2025 06:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vImrR-00076s-NV
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 06:48:33 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vImrP-0004Xk-Sz
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 06:48:33 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7aab7623f42so4577820b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Nov 2025 03:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1762861710; x=1763466510; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxPxc4Md5C2Zqt98YWnguxmFjA/nPm3BgfgxgFswHjo=;
 b=AYRs5MEAVclXstsIpwefB8De95OYr1Y07zyM5mLdXsRD4/DsczZCTtdjt5hGDZeV45
 /weQHRtF3sbyNUzsKw6TDamMk1zUcGU9ar51DmmSzo2ZoMZPVGgWNrzn+zP2KScR4zMb
 8WsDvBOtyPYb3P0G0HMtdWpJtkaN8Kor9W8mJj8fIGy47ASLH8zdd53POZr+Q2plidt7
 nD1Zofk7wFYC35lhUrPcBB6Ue7UGmJibvkvf+0VChyABIwA3ZflI1Io7LmbczpTSPCrB
 W4IyNAGKk2s2zq5rr5tT5cIR6Uv3byzesAIGNvuEG8YvSTY+lYMbYLF+Tp0JX1CXjaz6
 zXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762861710; x=1763466510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mxPxc4Md5C2Zqt98YWnguxmFjA/nPm3BgfgxgFswHjo=;
 b=IM4cJyzAFwsjwuUTSrNzQQZwO/m2le3thwSBqN0JlZirFWyvO69XsiEFiNuVbp73/s
 bTCw4aJqkYGKaZtcaG1oXUyvmkh+iXhGLPKycKlMVzC9mSZBLqjvouUluoucIjAlUAGW
 O6NNrW1B9w8EJL4+L5ug6CQLWlLyIPurVJhIMDa1yXPku0Sl4dKbPxLNUm5fmAZljIxz
 tWtcgozngh3EmwgUnsNe1USnpJ8eZdSjAp9A+tPekJFiYe2xDKGm1CA4Uk31T4Nr6r/b
 LIxmh/uVxMhBqioFR953dzDc8o3HIwWJ9uDtLbOzAIsRKDI15NYMfu5Yb9x4D1klvVGU
 d0yg==
X-Gm-Message-State: AOJu0Yz+eOp2OXOoMbTUIic2C9ismgWPd28EjzDrqyVF9s3qrKqCQZ6n
 UN6OgWQzLNWS3vWFupD9eCB39PU6HGrEgT/6MPcQjBG3Ag1VfGdnqba1JMKvpfUtCgI=
X-Gm-Gg: ASbGncv8V4esbkl9S0yZxa7ue1Kz+P29OUfoUC+4gfxfojL1gcAC0JoOrjS6qjshnhs
 ZtsGQYxnRzc0J5pQyG7Icbt45/md7mwdAmXDuGmMXibLSjSMLb24kFyXUnx6dcEEZs69LgFcimH
 Cg16UZhyDchYbTI6oX0RotTcbbJMnSMx5YfvwTQDPQRXRGCtbR0IynYNzirANHsCrWadIuxdPVp
 F5Qj+/F3DZ/OkgrgFpy5STUxiakXkMH0P/NiYA8+cGuCqBNRaETYgrjN4+p/WBtZ4OAsnmI/Juf
 O3C5yoAVSPVBrxoC3d64/z/GKos2+XKPlgX6u5yWjM8pIcBtq9IMLkaBd7yplo5c6VZVyctokLa
 GZDmz+VQyx7ooDOfVAEQBq56G79whM4Llc4pZtG3l2FpmhSbNMYd2+9Eh0UCmTKcuR5dNU+WCth
 o2jLLNI1XxOeT4NcOD5n4qvQJjd5eej1cCH6meXg==
X-Google-Smtp-Source: AGHT+IE8QZIke1F04Lp/KHbgdXExP+qTG9cpfhkFw3BecV67MRYkgoWP/55R52wYRbC9WuCVAYkAyQ==
X-Received: by 2002:a17:902:f785:b0:295:6122:5c42 with SMTP id
 d9443c01a7336-297e5643bc1mr176402885ad.24.1762861710357; 
 Tue, 11 Nov 2025 03:48:30 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.233])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c747d1sm177533125ad.63.2025.11.11.03.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 03:48:29 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 13/17] hw/riscv/trace: add format2 msg helper
Date: Tue, 11 Nov 2025 08:46:52 -0300
Message-ID: <20251111114656.2285048-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111114656.2285048-1-dbarboza@ventanamicro.com>
References: <20251111114656.2285048-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Before handling updiscon (uninferable PC discontinuity) cases add the
encoded message we're going to use, format 2. Format 1 will be added
when we add the branch map.

There are design decisions worth documenting in this patch. For irreport,
the e-trace-encap spec [1] in section 7.6. "Format 2 packets",  says that
we should make this bit !updiscon if we're either:

"following a return because its address differs from the predicted return
address at the top of the implicit_return return address stack, or the
last retired before an exception, interrupt, privilege change or resync
because it is necessary to report the current address stack depth or
nested call count."

We do not implement any form of call/return prediction in the encoder,
and TCG will always retire a single insn per cycle. This means that
we'll never set irreport, i.e. irreport will always be equal to
updiscon. If this interpretation turns out to be wrong we'll revisit
this helper.

Likewise, irdepth is also not implemented since we'll always return a
package where irreport == updiscon. The size of the field is arbitrarily
set to '3' to avoid adding padding in the end of the msg to complete an
extra byte.

[1] https://github.com/riscv-non-isa/e-trace-encap/releases/tag/v1.0

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/rv-trace-messages.c | 59 ++++++++++++++++++++++++++++++++++++
 hw/riscv/rv-trace-messages.h |  2 ++
 2 files changed, 61 insertions(+)

diff --git a/hw/riscv/rv-trace-messages.c b/hw/riscv/rv-trace-messages.c
index 3e9466633d..3fa70ba81c 100644
--- a/hw/riscv/rv-trace-messages.c
+++ b/hw/riscv/rv-trace-messages.c
@@ -53,6 +53,17 @@ typedef struct RVTraceTrapPayload {
 } RVTraceTrapPayload;
 #define TRAP_PAYLOAD_SIZE_64BITS 18
 
+typedef struct RVTraceFormat2Payload {
+    uint8_t format:2;
+    uint32_t addressLow;
+    uint32_t addressHigh;
+    uint8_t notify:1;
+    uint8_t updiscon:1;
+    uint8_t irreport:1;
+    uint8_t irdepth:3;
+} RVTraceFormat2Payload;
+#define FORMAT2_PAYLOAD_SIZE_64BITS 9
+
 static void rv_etrace_write_bits(uint8_t *bytes, uint32_t bit_pos,
                                  uint32_t num_bits, uint32_t val)
 {
@@ -186,3 +197,51 @@ size_t rv_etrace_gen_encoded_trap_msg(uint8_t *buf, uint64_t trap_addr,
 out:
     return HEADER_SIZE + header.length;
 }
+
+/*
+ * Note: irreport and irdepth is always == updiscon.
+ *
+ * return_stack_size_p + call_counter_size_p is hardcoded
+ * to 3 since we don't implement neither ATM.
+ */
+size_t rv_etrace_gen_encoded_format2_msg(uint8_t *buf, uint64_t addr,
+                                         bool notify, bool updiscon)
+{
+    RVTraceFormat2Payload payload = {.format = 0b11,
+                                     .notify = notify,
+                                     .updiscon = updiscon};
+    RVTraceMessageHeader header = {.flow = 0, .extend = 0,
+                                   .length = FORMAT2_PAYLOAD_SIZE_64BITS};
+    uint8_t bit_pos;
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
+    rv_etrace_write_header(buf, header);
+    bit_pos = 8;
+
+    rv_etrace_write_bits(buf, bit_pos, 2, payload.format);
+    bit_pos += 2;
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
index f3e38b571f..50a4a0ef19 100644
--- a/hw/riscv/rv-trace-messages.h
+++ b/hw/riscv/rv-trace-messages.h
@@ -26,5 +26,7 @@ size_t rv_etrace_gen_encoded_trap_msg(uint8_t *buf, uint64_t trap_addr,
                                       uint8_t ecause,
                                       bool is_interrupt,
                                       uint64_t tval);
+size_t rv_etrace_gen_encoded_format2_msg(uint8_t *buf, uint64_t addr,
+                                         bool notify, bool updiscon);
 
 #endif
-- 
2.51.1


