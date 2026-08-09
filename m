Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FA1C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:46:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtCBC-0005qh-IV; Sun, 09 Aug 2026 18:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBB-0005pn-2r
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:41 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCB8-00081u-6s
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:40 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-38dc69c74b8so1140515a91.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786315177; x=1786919977; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c4YWKqyY4eNXi7PgeIWNzfK2Wfxn5QCYHY9ARlmugvs=;
 b=e/8qTw/zg+iV6ZZLQnmQcg2OfZXvHddY9i3i8KhqzJ83hoPQLMZSg9a8hSfJxdj3dU
 Q1nJ7RI3zfEmI73n/Sl3VS5zvmQWygEaUa5JrkVyRHIYOLh7goyMN0iwScPOQHdKDSrL
 8QWj/fiZ0r0+WHQW4etjBdGKHfVm01dHIlk64FsUNcTlIDKrYtmmmHWSIJP514+PXsOe
 /002ScxFILnEZMBbo3FcHHs2GU+TnIMswzCpvJ63Q+W+DRmxZhU2SkYcrAbNY2rxy/iA
 /nmsy9m82LZF6XsytToHSru3PpBwvceTMgkLPzZ5msg0plCl2Vu5Mv6+yROZD6n6qBcs
 tuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786315177; x=1786919977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=c4YWKqyY4eNXi7PgeIWNzfK2Wfxn5QCYHY9ARlmugvs=;
 b=YSqvGgXHrbd/WmdHla+WsPk/tCWt9cDQZXbXrEh5ihEHeOSlEGHI9I9wYRAOIeTYYt
 U+DoX1xENad0tFZZrdJT7lpkbuF77xkHQQoqOrOMQCwQiHvCSXa5KwPc/4htFI+5O3IM
 TkVo0ytDkOJqSE5lwMj9XiVX9InGLYn9jeXK3BDTPF/G3tj9YUsiXCWIgI1UljK6jbho
 zeJCwf1vr6vAPpLU1VvLSzUZ81TrKrjeaykGXPIPaPiwilGo8HhDZ6yydsJ7LvFgFa8k
 4eKipHIf7dOnQqPfYCZjmVcikD4hEhcxKzbMOplDTCq/DAe6mniCV6uQh6XJfkc9m72F
 gYYg==
X-Gm-Message-State: AOJu0YxRHDqxu2vOn878a7qzId8fuxCUB5x+Yog5OtNtnEAClBBeh9T3
 OBGuwLK5VsPpu4ESe1zl8qkf8yu4XhyDOJN5CVr6CGBeUzz9mqmrnCvonFe48PZe5CY=
X-Gm-Gg: AR+sD10V1aEuNctGTIhePtuH5u2EecoAkqGZ0V3uFRl3wWQPOQSgvGxPAcuFch1N9uL
 7eGSvsjAjag+LbUoqoRQWY4DTVf9rydLjgGch9PygrLt/wRT4UiU118OjIjdZpYh7cOsqs6vfJz
 MY3HzHiOdEHtSRYqDWu6okTVsB1rcfv4galX9Ds6yrpCRYDtoja2aq6RK7/s5Sy4VsbPDD5Ck1L
 jBDe9LUlfW/7OzfSthixNPknEYDSwhLINdmpymTk054smonxZIG8qodHXFJ4fC7MTiUbmQOpKXw
 xSslDblNlYTiXUJQck41dTAaEXdiwlGZS/MjvLhTBYDNH87k41nCt+8DMt8ENvC5S0JGPd1yvO6
 fOTBAs6iPTVpWaZM4VMdBS7hZyFNG2CSyyJwueljGL6zOmq6talBwv8nXVSPmHtLMS0fREiS4qp
 wXo6JzXCN0M38PXyUjBARgSdR9Fo1sI6NB+HaGGQjoMJUKgwjs54E2xp1oqfUMpzrvzyjZ+AMEF
 /S2fn45IE+srUZcQhzNLkRpt5YJGLaf
X-Received: by 2002:a17:90b:52c6:b0:38e:75f3:ad4d with SMTP id
 98e67ed59e1d1-3903c5381efmr36280712a91.7.1786315176678; 
 Sun, 09 Aug 2026 15:39:36 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-390b1573defsm4264430a91.1.2026.08.09.15.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:39:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 41/56] disas/riscv: Reject all of OP-32 and OP-IMM-32 for RV32
Date: Sun,  9 Aug 2026 15:35:30 -0700
Message-ID: <20260809223545.730664-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

These entire base opcodes are RV64.  Reject them all at once
rather than one at a time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/disas/riscv.c b/disas/riscv.c
index c4b8ee7d07..f51d45674e 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -3311,6 +3311,10 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 6:
+            /* OP-IMM-32 */
+            if (isa == rv32) {
+                break;
+            }
             switch ((inst >> 12) & 0b111) {
             case 0: op = rv_op_addiw; break;
             case 1:
@@ -3557,6 +3561,10 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
             break;
         case 13: op = rv_op_lui; break;
         case 14:
+            /* OP-32 */
+            if (isa == rv32) {
+                break;
+            }
             switch (((inst >> 22) & 0b1111111000) |
                     ((inst >> 12) & 0b0000000111)) {
             case 0: op = rv_op_addw; break;
-- 
2.43.0


