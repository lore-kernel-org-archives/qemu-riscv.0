Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C81C5CFEB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:34:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUW-0007HF-0u; Wed, 12 Aug 2026 18:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUT-0007Et-2A
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:05 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUN-0000yF-Al
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:04 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-ca00f126b7eso115577a12.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573918; x=1787178718; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=rkePQPUUXtRHHdSKj45U3IJ+J4cLzKFKY59IlGVxIEo=;
 b=qybIsgwcIYFLSshmP6nqH7cHOS/joi+wHrvF4YTKCHVEcBz38qyYdknh/2tzV7MigA
 DES2ywSraafth0BMHLzaE+YGrkaaOBZD3bhat7SkJuMrnEs6wEzhM6jpMRV80nMXiKq4
 Cz+PCQCW5DYmsEI+Ts3JWPj+QhlC6eJ87dA5FuX3NGcDk6ngb9qISReGx/ncbdq91uik
 4mQvBQa1wBtBXhgyrrLEaUNcwEOammZJn99DDm3yFoWOU02zvIYpf5pqsLLpUELfwvNK
 8tQj4KQQpsG/G5uEScz2f0xsAh+i6LqLJHiVpG5LN6R2eSZJ7abXo3g3nq20X5sxvhOR
 8JdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573918; x=1787178718;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rkePQPUUXtRHHdSKj45U3IJ+J4cLzKFKY59IlGVxIEo=;
 b=NqLJilg9lDN3GSVSF0rQjimR1woGw9FNXNJkR0gqrKGE3r2dis62/7TfAJBM39BzIX
 ihmw9itf3HNOO6zGAxiw7Tr0Hwj8J9sSsPzcTlxfTlUcyKf7FqZsfEB15ayNvDgPMNZH
 s+SCTt1/UKrrtArXNba4WJxk0CQWMVZDZuJje+rBDUaz/G93UMYS0UcQbUWDFOI8X7zZ
 OTYsJP53QKQKpU+TTd4xK4e71wjdzPa6nEiUqK8DEGdbpGDyOTJLO0AqmBRZ8ynZky92
 Yoh/DM2O6YFtNEWinXAjE5FZjbmFnOJuz0p5/oXHmYzOavc4mOc20By/nMB5Lc9LZDgk
 7kpA==
X-Gm-Message-State: AOJu0Yz4PMoP5Xqeoycz0o7GRB4Qr/EVjOKjFFA3jhoihHIzOesyV2Lt
 8ndmurL1AIu27oGZ3KtyOypiJ3ZURc6EVrIBrYBwL7rHtHnuQfC9yhyZjDJRi+NDFTU=
X-Gm-Gg: AR+sD12/YJqBYpieLJzmT9gpWo9U7GD9AgsOAUEmRH/s5lWB/hI+8UwPutSkTz8c4s9
 8dBQzeyE/M32Mf806wbaJh7rGEAvTKuQYULCPu3+YLpnc3hxf650OXI2l9XGR8tYk1vnNXMgLmG
 qA3Xt+veZN5il8UjBGxBoGqDOz0jAFgRK/nZUU63TII06hIoTKbp74mHQF9QKFhSx9M8nK+J1a4
 +n6MKnrJtNhTgnZjuBtntCs9lldT5KpvBRvhIAMzpsrwXmV7BT8evrbVwbvqE5i1Q/v1nrrTRMf
 F6oZKiue1/mhHV0MswyXOplOxag5dmUvA3SkAuXue+lx3Rm3s9C2p440se31kzbiSDBomovyFoX
 rf9u1Dn3M8Ek/brvCGwVTD8BTC+nELGnarUI46ZaA1d9iY8YOJKgaLoYWBPqCF3y2Li/GO30Pnc
 YWqMkSE76b/1OxnGhfyMDTIDlkimggdR0zyfSdXLMDKwl61yoMsGEvpHCFH5V54BVFOAjwAXwNo
 xm7UPlj3x8UXs3ToDgu
X-Received: by 2002:a05:6a00:3a19:b0:846:7507:4e07 with SMTP id
 d2e1a72fcca58-84fc7504fd3mr1121194b3a.39.1786573917864; 
 Wed, 12 Aug 2026 15:31:57 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:31:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 11/52] disas/riscv: Drop useless const in structures
Date: Wed, 12 Aug 2026 15:31:01 -0700
Message-ID: <20260812223142.349142-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Individual fields should not be const, only full structures.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/disas/riscv.h b/disas/riscv.h
index eabe193b4f..3325b7b4ef 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -174,19 +174,19 @@ typedef enum {
 /* structures */
 
 typedef struct {
-    const int op;
+    int op;
     const rvc_constraint *constraints;
 } rv_comp_data;
 
 typedef struct {
-    const char * const name;
-    const rv_codec codec;
-    const char * const format;
+    const char *name;
+    rv_codec codec;
+    const char *format;
     const rv_comp_data *pseudo;
-    const short decomp_rv32;
-    const short decomp_rv64;
-    const short decomp_rv128;
-    const short decomp_data;
+    short decomp_rv32;
+    short decomp_rv64;
+    short decomp_rv128;
+    short decomp_data;
 } rv_opcode_data;
 
 typedef struct {
-- 
2.43.0


