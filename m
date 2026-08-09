Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD3DC5AD7B
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:41:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7W-0000fC-RJ; Sun, 09 Aug 2026 18:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7V-0000eR-M1
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:35:53 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7T-0007Gm-RV
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:35:53 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-84a652535dcso645256b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314950; x=1786919750; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N8nB778mxKXBFIQx5c1AJr7lK8xWaRtXPXn1L5JIuWU=;
 b=N7WLcGXKDcgYSQaX1QZ5n7LSk4FD7DGzyhLQWPhuAVdxUBcWQ6bAGwDFSAQjSKkyPd
 c15eUbFGz7/WawCKHJsRYusflOAvV/Kqyb2ytupvIVAB5thl7Vhw9BVMGxDl2Vtj53tv
 HqMqM9NWGJEruci1p7dZzhqZ4+t2AfxDaor+cdspARo920G4BwT4qiQ+0OYzCIN8ZGVp
 1iHzYc2oZDiUVyLSijxZ0cIrV946v/VsFgFCrf9VoaPHDZ0l/MGCKh5iL17ZgAgHuJlp
 5cPTd+Phq/GYBjmAeJa8G77zEv4PkjqAzsdrhRppSqT2pKw4akxAzFeDsS6JBy0uEzQD
 Xcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314950; x=1786919750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=N8nB778mxKXBFIQx5c1AJr7lK8xWaRtXPXn1L5JIuWU=;
 b=l/mtT+lX67ZX4SGP/ZfLjryzy89ewl0csVimUXnvHEhSvgNIypIpn1HWtUoZBwf0E9
 Dm52jfFDu57VUFWbG3g93TiK1YKQnsBtH52HAR9i9Sv1+INXhhA3CnVnabD5yV07QyKq
 Z6+OKR0nsT3PaDC9QfshzsokjyNFcwSmcix+7A6JsRzZ9h+tVMASiEyxswniKWsU8l1p
 Uu1sajbZGoDn1AdsVy4DEt5o0bVImwHKYLQawgkrGjIWVaJwiDKnuSzk3jiGNJR9UYSB
 tGLMbiWM3YDY326Tk2oIL+SfOwI0uORN7Nexef8CsoQdGZ1v7Md5NOHEEc//CJJtRVvJ
 Iebw==
X-Gm-Message-State: AOJu0YwGnm6tmtg/R0ufFptsZYByT4CsxP2+ZR8xwW3gXNmiKn6R+GBw
 B3v6rYTnJ0Cw/7uCoFdZJI9XihHRKRJj/LVkJQoFvN3DmuhD2JhPt8zebPnUu34gL6g=
X-Gm-Gg: AR+sD10RmMs1Vicf/RI+LvOfVrHxQlX5kwcRG6KKfPLGckav/+7CAGYjW76/Gc8icgb
 btgdhbDgeTdXtBDh2Zdyz6VAWHN+xT3+JAUnvjLPmRBkmTSluruBHtAkNYDXWnrgDIWS+H8p/As
 5ao65Z5YkM+Q9jj59PerbYBUBSlm/XEF654lVOMIZfteLsRBB4zjASX9Ip4re901eOqaLEzTJto
 yTMCgFNz4VNnlQNfeqQ4cbeFMrT6+cZIhnOG9z3YMIKFxuPCuHTKD2Vp2/jhwbkv2kNmVmL6Kht
 vKRbcPguSYjztLOF+qGdkSgDt51my2csi8IDW2iSfJ2C0e7n68/B1zn7YWbQckKpOMEGtQEtb2l
 FVcxVXqNKnrke4O/a+JkiwRlsiJ7ILCp9JBuKlSIpv0tbwBy25USzhwzLKUkaCFPX5+KtLO+Uco
 CMR5JvHriQVsb9Nmnh3VuBEyxMtW44OY7E0qleBgDdQwokw2inmtYzsSDwi0bsSxZBfpn9LDZii
 s6x5h+i7qWcQTp7r3Dq
X-Received: by 2002:a05:6a00:398b:b0:842:5da3:9b89 with SMTP id
 d2e1a72fcca58-84f697a6761mr15500918b3a.38.1786314950456; 
 Sun, 09 Aug 2026 15:35:50 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:35:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, TANG Tiancheng <lyndra@linux.alibaba.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 03/56] disas/riscv: Use signed type for vector immediates
Date: Sun,  9 Aug 2026 15:34:52 -0700
Message-ID: <20260809223545.730664-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

From: TANG Tiancheng <lyndra@linux.alibaba.com>

operand_vimm() sign-extends the 5-bit vector immediate field in bits
19:15, but returns uint32_t. This sends negative immediates through an
unsigned type before they are assigned to rv_decode.imm.

Return int32_t to match the signed value extracted by the helper.

Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-Id: <20260703-b4-disas-xthead-fix-riscv-next-v4-3-84c566330bc7@linux.alibaba.com>
---
 disas/riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index fdf75a12ef..967739bdbb 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -4487,7 +4487,7 @@ static uint32_t operand_cimmq(rv_inst inst)
         ((inst << 57) >> 62) << 6;
 }
 
-static uint32_t operand_vimm(rv_inst inst)
+static int32_t operand_vimm(rv_inst inst)
 {
     return (int64_t)(inst << 44) >> 59;
 }
-- 
2.43.0


