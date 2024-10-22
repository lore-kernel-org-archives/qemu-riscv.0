Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DE9D17148
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 00:13:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t32VQ-0000Cj-Tk; Mon, 21 Oct 2024 20:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t32V3-00004q-2P
 for qemu-riscv@nongnu.org; Mon, 21 Oct 2024 20:11:49 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t32Uy-0005Uv-Qr
 for qemu-riscv@nongnu.org; Mon, 21 Oct 2024 20:11:48 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2e31af47681so4006822a91.2
 for <qemu-riscv@nongnu.org>; Mon, 21 Oct 2024 17:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729555903; x=1730160703; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dv6u2nNWkqx2QinOJ+QPs2qTyVh0lqH2PTx6QeDWZY8=;
 b=K2eCuVLtYdc7PDtSwGVw3nmfVEjUmqDNV3m1ZyRnmO69jAr9bc5JL3tZtwAH7Ub6BG
 mDzWE0nQ4ib6hcRyQX6bkUkqNOWKO5fz3TrqhjnYShQabdEX6f0GpuRcIalK1/JjUhJM
 ROcwigyqxczEYJehsqjo7tNbp3YcIeYzaMa+C0x2KyBICGpIukjKWvnvN4ENcysTm9tk
 jHZhOYn0X9JSCuk6/ID+xzLJtt8c/o9MxXe4RmzNaUAVY6SLL8vnjPeXZorjYt6Jpcsm
 r59yu2WWmWrdAI4AHDQOF/28JqMOkaQo/w0yH2yT1HX84vlpzUgwxnSCjMMUajf2kk73
 9lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729555903; x=1730160703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dv6u2nNWkqx2QinOJ+QPs2qTyVh0lqH2PTx6QeDWZY8=;
 b=lOR1CSQi5iHhdCSnOIelOw4YbmcbcgpdyUiii9GbFK/7GDLt6NTDFtIutmo6a2DQRi
 LMgGCFujG04QjPzXFrszlUWPbvUfXP9rLvAqfrKmXHWPkOYsaLRaiuX/yz7PsjwmUMfi
 39uE5W3nTpCTAyvAlH7H0ItEB+cGbdAnV5mdo+IgEO4SEdOWmvits2CaAe3rWR9r3vfJ
 MHf4gZDKnCSz6quyPy0E2kQZ/XkGyCm0beU2ozGajOHAs2j0nWHbTEeEZHQSP9HHFC7c
 vT4j8faxu9mHK3REVndQG9l7vKgB5jThtKALX9/EirEh7kaufWhD0JCG66QlsujXg6DA
 wA2Q==
X-Gm-Message-State: AOJu0YyhV/upAOtYBhFc3341pMJZSe0oYDUwjzFTxmSPSisXAxvf7rjG
 Z0i4QNeF6Z2pcH9upbfyuNPYuF/cHeST0inqf0eVyMAdu3SDP5/xo3kw7biTfSc=
X-Google-Smtp-Source: AGHT+IFYt7qO3L4aZLm82DXtIv46XdB150Lxv7BmdamU8N9lMNBDh+zQpqoBe/vPF0E45CAPy5rn+w==
X-Received: by 2002:a17:90b:4ac1:b0:2e2:abab:c45b with SMTP id
 98e67ed59e1d1-2e5ddbb901fmr996602a91.21.1729555902953; 
 Mon, 21 Oct 2024 17:11:42 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e7f0f6462sm31681145ad.272.2024.10.21.17.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 17:11:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	dbarboza@ventanamicro.com,
	alistair23@gmail.com
Subject: [PATCH v7 09/14] tcg/riscv: Accept constant first argument to sub_vec
Date: Mon, 21 Oct 2024 17:11:29 -0700
Message-ID: <20241022001134.828724-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022001134.828724-1-richard.henderson@linaro.org>
References: <20241022001134.828724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Use vrsub.vi to subtract from a constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h | 1 +
 tcg/riscv/tcg-target.c.inc     | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index 97e6ecdb0f..d8ce5414f5 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -25,6 +25,7 @@ C_O0_I2(v, r)
 C_O1_I1(v, r)
 C_O1_I1(v, v)
 C_O1_I2(v, v, v)
+C_O1_I2(v, vK, v)
 C_O1_I2(v, v, vK)
 C_O1_I2(v, v, vL)
 C_O1_I4(v, v, vL, vK, vK)
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index ce8d6d0293..1ce2f291d3 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -2350,7 +2350,11 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_sub_vec:
         set_vtype_len_sew(s, type, vece);
-        tcg_out_opc_vv(s, OPC_VSUB_VV, a0, a1, a2);
+        if (const_args[1]) {
+            tcg_out_opc_vi(s, OPC_VRSUB_VI, a0, a2, a1);
+        } else {
+            tcg_out_opc_vv(s, OPC_VSUB_VV, a0, a1, a2);
+        }
         break;
     case INDEX_op_and_vec:
         set_vtype_len(s, type);
@@ -2565,7 +2569,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_xor_vec:
         return C_O1_I2(v, v, vK);
     case INDEX_op_sub_vec:
-        return C_O1_I2(v, v, v);
+        return C_O1_I2(v, vK, v);
     case INDEX_op_cmp_vec:
         return C_O1_I2(v, v, vL);
     case INDEX_op_cmpsel_vec:
-- 
2.43.0


