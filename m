Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mccZF-0004mO-Ue
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 20:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZC-0004f6-Vk
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:19 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:55129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZA-0001ff-U5
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:18 -0400
Received: by mail-pj1-x102c.google.com with SMTP id np13so13333968pjb.4
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bokkmTqu3PPB9lUNeGMuiR/uQoelWheprwGuLtvEEIw=;
 b=OUiOPg4+zVJ2nH/6xLZiBrwgcE/K7PCJ037FJdmrKuEU4EkRqlM+FQprzhR5xZ3QpL
 uiGAH29PTfcLMkMtLVTZBBdF08i242pRM+eE7hIel4fX7rjBFoJXuZOtvPsQBT7z/eVr
 1QgjDRfDWMNolkd3HEtlrfnSw1XyCZMocyW9hF0iptDu1K9L+bdiiE+3r10RvH+Q0qzA
 XIeKvsbnHIlYHUW48JtRGoJqeq8Gei6vz/rGAMDccQvaDtNNs29wIkmbAUxKUmjAT7dC
 OAwLBKukrF1lHzvFa4vqzqijqoTTd6DyiEavQ2xoU4l5wDP1YEoN3tmcZKOwCjMpJLuN
 pL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bokkmTqu3PPB9lUNeGMuiR/uQoelWheprwGuLtvEEIw=;
 b=P8Cmfb7d9g7Nvp4eY90D4XVwhCHWA6sd99ftNCkpY3Qc6KPwYIhPiPwkRJj0wmjqvg
 H6sjf63GOOqByZK6fiJt3fbrbWDhA8hqNYvZe5fC2yOgQX9cdtvbsI9Jh/FF64ej+htK
 Ttr/CCTiAfieToauYT39Ctx3vR0dnqoq20yhoxtIUxZqvo4/BEOBs6HhetVkpOKlmzAV
 SsZ5c36BkM8fzDcjKcNTVKgSl+g/Jh4WCjDyqhkpUEuuryLVBTOcuOOSnL3c5ZBd5mOP
 SlnogDcDADNyXXk07+N0E0eAJzmY9tzOk9j/gXrNrdwV066PO0RoU5dcMwjjD/GKT9uZ
 C7tA==
X-Gm-Message-State: AOAM531Pv8JlhgQnz/up8TsUVnjElNPvMr59rClZ+0dRBUes3sZAA4en
 h9Y7rxndVdV29ja0vL5ADofM0Q==
X-Google-Smtp-Source: ABdhPJyCaRjHx4XMnFlr5Y11TUp4JEUMfmmTfCt9mK3lNgs/oCQCh83fCdCMTOSmQvXXS4DqDytMsA==
X-Received: by 2002:a17:90b:1b42:: with SMTP id
 nv2mr2370959pjb.91.1634601673688; 
 Mon, 18 Oct 2021 17:01:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v4 06/16] target/riscv: Use REQUIRE_64BIT in amo_check64
Date: Mon, 18 Oct 2021 17:00:58 -0700
Message-Id: <20211019000108.3678724-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Oct 2021 00:01:19 -0000

Use the same REQUIRE_64BIT check that we use elsewhere,
rather than open-coding the use of is_32bit.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 081a5ca34d..d60279b295 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
 
 static bool amo_check64(DisasContext *s, arg_rwdvm* a)
 {
-    return !is_32bit(s) && amo_check(s, a);
+    REQUIRE_64BIT(s);
+    return amo_check(s, a);
 }
 
 GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-- 
2.25.1


