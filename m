Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2SW-0004ma-J4
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SA-0004c9-Ev
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:05:49 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2S8-0000Xd-Ld
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:05:46 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o2-20020a17090a0a0200b00246da660bd2so569239pjo.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UYA/jGhRJM+9A6MoPBOmAbOd+q/t7vvHeLmOB409P8=;
 b=B6TJ8Z0ba9bPDMcLox4pHZf40PR7hGexYOR/detzeeFIsrzZtO4UVP6Hl0GHxezuGX
 H6Z2w/iSMUYvH0BsGVr8ko/cW8/IS7MGrBVr3VXyD1ryTaz6VdZV8+dOGiMZA9SAvVAn
 iB/ieVoJAPYHb7zzOEcEhNuSPlg/bKcSHH+6kE2nA3IvahGvz2rVpzdeYPu91UGv8MD3
 iQfKFv2fOV522OJPCwSjoHNhMHkUMTQxM17TpzcY0MiFkMQfCkjWRAZlg5hF6JmcrI+b
 /iZ/MgFXx/+HYaSkNKtpFg7Z849d9H+35oEq0a9ktsaDG+QIBLHaEnd+HiIKfknUH7uD
 05pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UYA/jGhRJM+9A6MoPBOmAbOd+q/t7vvHeLmOB409P8=;
 b=YibukUIHlBjj1ZxMRYb2uWkqZyVMWe4m4qSk4XZ73R8wkhhnTVR1c4ddSly01OzHY6
 jv8CkFS7BKRwBeuTLb8VLAEAy9/2F3yJC1dtMpvZYzLW/ccf8kifie69FINeocLRzrH/
 PXATmhpQ6zvmZ7pk8zgKVBrBCDCG2/MZ6rZ9PLsZWSjJvtk8jMzFyeHSjC0aIHWZwTAa
 YBaC9SyjZWJtq2FkGP6O/+2OlGGtH0Ew61KlYU7bq3V6c9uR+hgkIqNDqpyuDLpG9FWU
 snHdijTszAFDK47tMASlwsBlAVmKJ9ak/qTsIWBWjdVeMjxkj9X7E8LDbYQH0cGdpRoX
 TrdQ==
X-Gm-Message-State: AAQBX9dArbkMTtUergr1HdB49YDDwp2Ece94YVySEo0AG52QE2t6aQE3
 9L/YtDv6LAgnWoBTX9Ex3kJ7Mw==
X-Google-Smtp-Source: AKy350YyUFa5tQiVND856mDS4sq4p2ne1GiK3BTNqV1JhTAQPeTkeZFqNlw9V4z2ABFwVDOiGYce9w==
X-Received: by 2002:a05:6a20:9387:b0:e8:ee27:8ade with SMTP id
 x7-20020a056a20938700b000e8ee278ademr12396249pzh.22.1681175143328; 
 Mon, 10 Apr 2023 18:05:43 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 11/54] tcg/mips: Conditionalize tcg_out_exts_i32_i64
Date: Mon, 10 Apr 2023 18:04:29 -0700
Message-Id: <20230411010512.5375-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 01:05:58 -0000

Since TCG_TYPE_I32 values are kept sign-extended in registers, we need not
extend if the register matches.  This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index df36bec5c0..2bc885e00e 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -582,7 +582,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
 {
-    tcg_out_ext32s(s, rd, rs);
+    if (rd != rs) {
+        tcg_out_ext32s(s, rd, rs);
+    }
 }
 
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
-- 
2.34.1


