Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBD5C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:37:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7Y-0000g1-GX; Sun, 09 Aug 2026 18:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7T-0000d9-IK
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:35:51 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7R-0007G9-AJ
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:35:51 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2d032846c95so15776425ad.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314948; x=1786919748; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CPPVWOn9FFFAX/5uoowVC89T9mkv6F2/lyFHUHqzSYE=;
 b=o7KPsRsZhI8zMcRKiortqf9NKV5WP04e+4JFmQr0CTDQXkRru/urgrZEG8XVZl5Imo
 5zDCtknjJaYnP2vZLEB6Qrh4PR5rf8aWsKttG/HHIGHGV1fNFRxyTZdf1GjXvS/Qzufu
 pOvdS4JoyNanE/mwKAAieCjs0uBTue1pBLWe5U4ioPnvpbPvYnt/lGpp8NeE4lr+JcA3
 pbjXimNEjOliaZG79L9bEbfE6Q7GxWmRwQeT3Cu/U9reBX8RamW9FxEHW2yUQDUWkT32
 dZDh2Fi7rCVhABzG+Ub/nx+yUfyb2qyYQediw43pvTzu9WrQe9MXNwzVJGFDo56Xpda7
 TIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314948; x=1786919748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CPPVWOn9FFFAX/5uoowVC89T9mkv6F2/lyFHUHqzSYE=;
 b=LZV7TEwzq+2dBDg6P/KsAGzkL17e0glEYAu2GV/6YyoZciG7WOQZ3JWbzZOyiRqYxA
 wZ3leeCPAv0Fgc+IRAfCcoTN8YSUCRyG+WB4QycYMsbfaeavoV6g9JEhBgERb7Rj6rlT
 Ai7pjMQ44I7RlKeT9YCEYKYye5wTQmvvJg/T2xfGdPZI1ovUJEg3vDPpPZ3jx6bLoI4p
 2MxLUjYwpMNVvqptef6OdIlCLccGJuiNfEjC68U/Xr/gj+RKQjQmpdnNlYH0FB6Qh6f4
 UGL5Kam06+50EKLuXItY/Xf3nIo23ae/FyS6ikOVvPJ7i9niqmEoq5YTnCo3oP1YrvtZ
 GGRA==
X-Gm-Message-State: AOJu0YyIBCxvu5fhMrCK0JjixnEzHTIF/7AWqy3v0SFnjOgGyMCSKDSQ
 eXzEoJGREuXyOy4znQN9nEnB6VmB2l0mSOJVnSkuwY/6b5cij2lnon/cWAHGXQq0b9Q=
X-Gm-Gg: AR+sD13f5Pn8WwrEEopy/50B6cf6wF1s8cWq92LKpDbE1PaMH5EY/4k/bQ3fDLYRrjj
 O8PApq4NYIEHJwrbu4jmRmYiwZP+d5f+ofCUNzgXz1Iyfwr9TbCtjtyDoKTpgqEsgTen56neTIC
 Ualu5NCAG8RpcNEc3SqqybQCRX2Km74PmncF69rghkO8YbgonQN8VUB8/pSnhAOn+nkGm86q9I5
 C8uQLQxE9+Isl9OXHqjcSOgKUfYCAOEyLvwWwwMRfOG479z6wh8jGNBDnZcUkQdSg4dP6fNMx84
 kEHuVpZTebkzNBC+BwRS9yS3MGiYQa9bKCtsesuQN6kjQyN5QYXxl7BQ5Q5xZkpV27HjMRBmA/1
 BhUc3viuCBKdt3vn8zp3f0fF+fM4sb5+0effml4sDbxgwgf3yDAvh6ADgXgnmDo79wJzt9hq6WO
 PMBlVswsm4oC4hKgCR/c3TscrDB1EOrc38eJQ8P/4cbm7R9/E8ARzVZigZPBu19WWhEoU3igmpU
 mDcVNUAFMPH59UiSJ5JmG+dsGxl3N4=
X-Received: by 2002:a05:6a20:d48f:b0:3bf:d487:4b42 with SMTP id
 adf61e73a8af0-3cb86027257mr47336051637.35.1786314947826; 
 Sun, 09 Aug 2026 15:35:47 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:35:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, TANG Tiancheng <lyndra@linux.alibaba.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH 01/56] disas/riscv: Fix th.srri decoding
Date: Sun,  9 Aug 2026 15:34:50 -0700
Message-ID: <20260809223545.730664-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

From: TANG Tiancheng <lyndra@linux.alibaba.com>

target/riscv/xthead.decode defines th.srri as funct6=000100 in
bits 31:26, with the 6-bit immediate in bits 25:20.

decode_xtheadbb() switches on bits 31:25, i.e. funct6 plus imm[5].
Therefore valid th.srri encodings are 0001000 and 0001001. The
current 0000100 and 0000101 cases use the wrong funct6 value and
decode valid th.srri instructions as illegal.

Fix the cases to match funct6=000100 with both imm[5] values.

Fixes: 318df7238b9f ("disas/riscv: Add support for XThead* instructions")
Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Message-Id: <20260703-b4-disas-xthead-fix-riscv-next-v4-1-84c566330bc7@linux.alibaba.com>
---
 disas/riscv-xthead.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/disas/riscv-xthead.c b/disas/riscv-xthead.c
index fcca326d1c..2f2ddb8dd9 100644
--- a/disas/riscv-xthead.c
+++ b/disas/riscv-xthead.c
@@ -315,8 +315,10 @@ void decode_xtheadbb(rv_decode *dec, rv_isa isa)
                         op = rv_op_th_revw;
                     }
                     break;
-                case 0b0000100:
-                case 0b0000101: op = rv_op_th_srri; break;
+                case 0b0001000:
+                case 0b0001001:
+                    op = rv_op_th_srri;
+                    break;
                 }
                 break;
             case 2: op = rv_op_th_ext; break;
-- 
2.43.0


