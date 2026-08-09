Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84682C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:43:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtCBI-0005x7-T5; Sun, 09 Aug 2026 18:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBG-0005vT-Sl
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:46 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBF-00084k-88
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:46 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2cacf197759so22714675ad.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786315184; x=1786919984; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0lRDNSDUDQZKTjH9ncofcENwlBstnuafbn8Teum35fE=;
 b=D+bQk6HYbx0iEc6MXp08aWl0/TjbyfP93CaIU8wdTHRdbZ+hJTjNUcHE9h1QTNfGRs
 ipXXSmb4RMeQgTcB+XttUPLhxHm0io20WB51skZAGKdbGbtgbQLqDMhKUhZmQkRczXcm
 6opbfCva6joKzqEy55Bjh6SK/KZx75KquDaC/KGhBDDtPerDverGMCm9unN0Qbwa/nD/
 ljTgC9jgp8i7Z3QPL6G18Qzt11soC5no5euznXn+ga+GwXNOfFmyNUwrvADWfDYRjcpJ
 8frkP5WmNyVc4qEEoy5k0XBOMX6ixeHQ6l0kZFwZuO/EoiCY2UifaHc6HaMBaRjpwBsx
 E2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786315184; x=1786919984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0lRDNSDUDQZKTjH9ncofcENwlBstnuafbn8Teum35fE=;
 b=bAc4wleizY0ZXQXEA1thgF+mNXBJenMc18fECq0squZP6TyesYi7DAeZZiTpKIzCAC
 HJ3j+1AXFPpNqaXPDvZ0kz/m3ZZ/itKtMCTXirltSP1wfLbBovopspNwJR+PakDvGBnc
 PPcRJ937RPbpYQuRF5G0IvM/1fDZTTMvLtIAtVetRDegVclKaGdz88zTMvaH0/vWppBm
 lYCrdz8UWgi7mWvpuzNvkIRVAOlFOUWyMCyXC+p6/czvDEtwUoqE5CGTvtI2nOPS94qm
 PbahWeghFYvtN1o5oA7EsSAxSrI/Vy6SPVaw0SriDZheJxkCfgqRc5qa/kGOl2a8l402
 HScA==
X-Gm-Message-State: AOJu0YwMhkJZRj+d+DWnf0ohrj9OnCFEnUthX55Zyac/bzqQ1/EG+wNB
 cm/8DGCt4HzpbT0oyyMNuRF79CLJrTpfI8VkH+7I5YuIZOVPUskRBUafNVx7n4qgbGqT7lp1Cen
 NhAWC
X-Gm-Gg: AR+sD12Q3si8lmNyV6UCmxYYjjegmHp2CsPu6wL1FDUMyzct6JTTgVcHL4kUtnuOl89
 Gu2YolH/yulzcseWe2M3GU0rPyY4FLXulhLUpby1BImL6Aupet1zUdTTt45wcUv8XYpCtg16MLZ
 75zDJM2jfs71DzvetzNpltDEVuEqg30LJMNOj7ufUtLTuOV232Pd7zjVTPXBowiYKdYBU36vbUj
 7gyguO3+57a+s9NVYaQJ9R/FoU/3PTjq9gkvL5UuuyF6lcCVptvGIrLutfZuGDAa0EXTvp0Tmm9
 NwsfGHE0RQVAkaYxcPwrzUbFoyNLLXbvtz6cX5nFv2Wda7Gl5eJPWGO0T7bIAyomSnR8rcJQnn0
 VzstXT1taUGI0hlv18idcEG53hlbM70+nTTbY8HhFXIkqSPzYeN/J/TvAHjJhTSjYgJ37MqXnTl
 C7GnJf2LlRlTdddCp68hIHZMwew1FTbyMiVajSSNIvkYnl11GhM3YQBcI7ECPY7kh+b2oz3pM1W
 63JdWwkIIZigsQTLfSO
X-Received: by 2002:a17:90b:2788:b0:38e:64b0:8bce with SMTP id
 98e67ed59e1d1-39262309a8bmr20357489a91.20.1786315183785; 
 Sun, 09 Aug 2026 15:39:43 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-390b1573defsm4264430a91.1.2026.08.09.15.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:39:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 48/56] disas/riscv: Move rv_op_illegal to riscv.c
Date: Sun,  9 Aug 2026 15:35:37 -0700
Message-ID: <20260809223545.730664-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

illegal is no longer used in other files.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.h | 4 ----
 disas/riscv.c | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/disas/riscv.h b/disas/riscv.h
index 241dd47d7f..5ac8c41616 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -200,10 +200,6 @@ typedef struct {
     uint8_t   rlist;
 } rv_decode;
 
-enum {
-    rv_op_illegal = 0
-};
-
 /* instruction formats */
 
 #define rv_fmt_none                   "O\t"
diff --git a/disas/riscv.c b/disas/riscv.c
index 4141741d79..f0b3bc6be7 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -29,7 +29,7 @@
 #include "disas/riscv-xlrbr.h"
 
 typedef enum {
-    /* 0 is reserved for rv_op_illegal. */
+    rv_op_illegal = 0,
     rv_op_lui = 1,
     rv_op_auipc = 2,
     rv_op_jal = 3,
-- 
2.43.0


