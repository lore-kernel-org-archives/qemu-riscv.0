Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D841C44500
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:41:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEdW-0007JA-1h; Sun, 05 Jul 2026 00:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcM-000583-SU
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:13 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc3-0004Io-4h
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:10 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2c6b67d5fa1so18032615ad.2
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226270; x=1783831070; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWeC8sovUKFGxLFpRs93xUZHyuZOaYN5bdNXTrhkucI=;
 b=hEDi+7u3fIlaO0ee8d3p8CphqACl3nBOz05ODKa75Cw87/tl2T0y8T4DbtV4iucEj4
 VZxLvV9uUCkctWf+CRXqKiZAnydLWRENFp3jMQNrHWl8tqLZ68AKeID+GjtqplSyjRrk
 +qF0kcLUAtpnDi5PWJyusGQxtZK6I0QAIfAcRDpozNRED3Mo3dz1F27CGXdqREZ2F5SE
 ORti29ZPsNbOpbfsmhtFVohHpGAijC2jqpvbxNGp0a0mvZalZAPlZocDSEJ0M5669Gix
 LgfQl7nS9XzPgMBqxHDvKMO+QcxcWnBcnu1ZkfRf7uFqDxG18nIznji6qn93gx6DddKR
 Cp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226270; x=1783831070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LWeC8sovUKFGxLFpRs93xUZHyuZOaYN5bdNXTrhkucI=;
 b=XijW+QDfTyax5DCX+lFf1GK0qz8zTlwsJSVMibQ16Nshd2lS8kxNSqKcOee3GFNUfh
 Q7YDOS8vdB+pY6hbB+86U/BskPGK8RWTl6j9lbwTonCALywLDK+jhU6kTRGT1I0stODM
 bVQekv5fjJ97S5W5wTqZEU7Og6Q2jSe/bAC6a7dWUobeUaMgMADck08SjRUYhNzYFiqr
 iJq3gR/3cTF2eDgLtDa97GEqjDhLpGUPLo1s28chitOxFQUn+JmRRiXJFjVyV+qemMjj
 ETW+Rbnw+tRiCRaYPGwhXJOJgWevU6BCkz0IPDdZzBLDWBzQiB4T3PUTATP1jMrE5q+U
 GWMQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RohE9i1/xQIzOMe9+C8u95KHDuqKLcTqC/CveWn0Y601yy5Uze8A/70L1dsyOhbfEoqWLtCRtDomJU0@nongnu.org
X-Gm-Message-State: AOJu0Yz5XyVFe7hI8o+JPuj/LrZG6AH8A5Y/z3F4OVASwMfN5KAWB7xf
 khcEpBVkOxRNGdLc4ns6tg9b5A/aZ11zexYoVv9RqcdhEz4/EjQUPG/VXjKDWIvX2nQ=
X-Gm-Gg: AfdE7cnaQpmuBMOJ1tqx+NCwiypwAfppt9rghL7anN9byb6l+ISFjBJ67lcfR0v0tk7
 2qFBR4CnIQLbyECghrU28maTeszbwRf6Bt+/Tiuzvvk+ds3zjIiUk/kYuH1tdL12MEMRzULjYk0
 xerKOVAWAPhH05hgkH6/gmAwDqaCto5UtbJLiQUfQD3wwND0HRfWZpAhRhfnOkossTdF2o8kAvZ
 VXfmODPxnqgB3VSDYYeJs79/GjtFvPQ5Yrnc58YLzmhzj+FQaNk9A0S25fxHNMYlggLan/xijsu
 tA92vijfLyso2sO96aFhZ8ISv+KmPIpQMl0sfpTOqWTg+sjdZqm7MN/zg5OrgQ40ODwS4IAMo1d
 pQBGniAAP1wAlooqgj3cB0lHTA/8Fhw+Tjvudgc7KQ9SIkUDxojhDTgZpnzYeh9VrGo0jM3efqk
 l/rQ4GC+EvEHqTjOByfXVbxRKC4hNJ7Hu57+GwQR2z+lNgVTw=
X-Received: by 2002:a17:902:d4c7:b0:2c9:e261:95ce with SMTP id
 d9443c01a7336-2cbb9ee3915mr50012645ad.30.1783226264680; 
 Sat, 04 Jul 2026 21:37:44 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 20/46] target/arm: Make check_watchpoint_in_range static
Date: Sat,  4 Jul 2026 21:36:59 -0700
Message-ID: <20260705043725.1373137-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This function is not used outside hyp_gdbstub.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h   | 1 -
 target/arm/hyp_gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 370876851e..53091fc73e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1966,7 +1966,6 @@ bool find_hw_breakpoint(CPUState *cpu, vaddr pc);
 int insert_hw_breakpoint(vaddr pc);
 int delete_hw_breakpoint(vaddr pc);
 
-bool check_watchpoint_in_range(int i, vaddr addr);
 CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, vaddr addr);
 int insert_hw_watchpoint(vaddr addr, vaddr len, int type);
 int delete_hw_watchpoint(vaddr addr, vaddr len, int type);
diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
index bb5969720c..456a09e766 100644
--- a/target/arm/hyp_gdbstub.c
+++ b/target/arm/hyp_gdbstub.c
@@ -182,7 +182,7 @@ int insert_hw_watchpoint(vaddr addr, vaddr len, int type)
     return 0;
 }
 
-bool check_watchpoint_in_range(int i, vaddr addr)
+static bool check_watchpoint_in_range(int i, vaddr addr)
 {
     HWWatchpoint *wp = get_hw_wp(i);
     uint64_t addr_top, addr_bottom = wp->wvr;
-- 
2.43.0


