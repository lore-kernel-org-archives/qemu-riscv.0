Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4935EC282DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 19:31:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tsoGg-00025r-E8; Thu, 13 Mar 2025 15:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tsoGA-0001qc-LQ
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 15:30:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tsoG0-0001ff-VU
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 15:30:25 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso12592625e9.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 12:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741894215; x=1742499015;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKdxEPN0jl1qSlAU9JCgLxS3U91sP+GzkrHS5Ut6yAc=;
 b=mtZyX2wAwrd6y4Z1H9132fIc0Gdnzqa921C9okDZ9GLzYSjgYagZu96MwthRBX+je5
 i8wCLgwClFNO+eMC02QNJrTbBDKGHVO5gHKwovh9GzznjKpfFYA489JU30hvMvaII7Em
 2tkX0MCCP8MoCp9CO66oYLVckJSMmX0a65uG0WFFhZIKNY3cvNUAt8P7ojBbbTgB7I9b
 Df5/Ru5A2WJDjtkOe9wjDXYknKtIEtYORGjYLv3ccYSyB1SBmaDH8/D5aldtFJyvKsQW
 xihGdrTp9Z0qSobti9WzJ2KCNPmWk45S/f+SxQC/iyypWgJ/jyg9EGvvXydgN9Pl9COl
 SWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741894215; x=1742499015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PKdxEPN0jl1qSlAU9JCgLxS3U91sP+GzkrHS5Ut6yAc=;
 b=NmczGGTDaQPY7vZnfFY0EpdCMRyQ23FOhX9GSKyriCFQfHm6b5C8kbKsXl+FHuvZM0
 O9vKM/mu++4dHjpnST8vHaU/I7d+MYNpvyfYTAUTqJGIVwH805VIupwG+54E0k4O0ibA
 QhoPWU6adSaTrSvhYM6veJ3XuyXvvBTj5yLNlgVyiEG3brfL4di0cGaDF2eLSg8W0Xsy
 pKMmMKzPX9MljzkZDN6CAycRntvQowtvrWTQL97tfVCFOiPJKPwPm6w8wKR5N+X/rVYs
 XTISKZ6NpQimAy2B/dn9I0v1xikG4ua9D+TSHRPpr62C4ZxfKTS6yYFM6je6gNFLLSqs
 +q/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPgSeZTw/cD0D+E8qJJmsipHUR+NjKVm46ewUCkJgPso0BFLS3oYyni/2rNPfgRPbM9V7h8kxbuFVc@nongnu.org
X-Gm-Message-State: AOJu0YwmngxTCVJUOglj3TcOmGQFWiysZ4WA59Lv1QUhPmkAxK6sB8Z/
 ofctKlqmybcp0OOvKhDmvKNzbndf7YKuagGThldjxZ0YsCdYmGmjR9hwhn5ZcI020HJbZ3ZjNsJ
 83CsJ3CnF
X-Gm-Gg: ASbGnctPHJkfqrqqKuPV0JbHyoN53bK4J8MWQi6me3tmYHQPxji/HpcZCowX34sMc9i
 5qmFO6rfHa9ZNhzTvx2Ozty63jqhvvpy+Qy/5iw1wA95P3xDxginMv3cj2/KrWgXZlyDO65zW2/
 pDFE9hGWfNDfVPYGRUqA7/vRYSGaUg194FaBe8lRXN3yYcmpFqKoH2B6lusCKdsTCAst+6sdlU4
 aRCFhiTYVhP2XFhGCwfWS5rsgaaFGVCOAKICvJDyM/Pkww0SAK7MSw3BUcCAIMTujLJC/5QTBG5
 xktE6EQCEvT5eDX2+zy+JgCqmf6gWDVx9lEO1zFywIYayvtNSdJKXoR+3S1xTv9k5SL8R7zLNUL
 QJ5ICz6iIvWCpVVRU0UOge9kbFIX/IQ==
X-Google-Smtp-Source: AGHT+IHJU8nvG6EU4g4oS6ZIy9t0MqGjfuGpV12QHvEBIdRREKfFKnyR6hF6fpF7aMnc4zZ8q2Ezdw==
X-Received: by 2002:a05:600c:1c81:b0:43c:efed:733e with SMTP id
 5b1f17b1804b1-43d01be6389mr152298345e9.14.1741894214770; 
 Thu, 13 Mar 2025 12:30:14 -0700 (PDT)
Received: from llx1.ba.rivosinc.com (lfbn-mar-1-50-94.w86-229.abo.wanadoo.fr.
 [86.229.28.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c888152dsm3016421f8f.48.2025.03.13.12.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 12:30:14 -0700 (PDT)
From: =?UTF-8?q?Lo=C3=AFc=20Lefort?= <loic@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Lo=C3=AFc=20Lefort?= <loic@rivosinc.com>
Subject: [PATCH v2 2/5] target/riscv: pmp: move Smepmp operation conversion
 into a function
Date: Thu, 13 Mar 2025 20:30:08 +0100
Message-ID: <20250313193011.720075-3-loic@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250313193011.720075-1-loic@rivosinc.com>
References: <20250313193011.720075-1-loic@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=loic@rivosinc.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Loïc Lefort <loic@rivosinc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/pmp.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index e1e5ca589e..7d65dc24a5 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -31,6 +31,15 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
                           uint8_t val);
 static uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t addr_index);
 
+/*
+ * Convert the PMP permissions to match the truth table in the Smepmp spec.
+ */
+static inline uint8_t pmp_get_smepmp_operation(uint8_t cfg)
+{
+    return ((cfg & PMP_LOCK) >> 4) | ((cfg & PMP_READ) << 2) |
+           (cfg & PMP_WRITE) | ((cfg & PMP_EXEC) >> 2);
+}
+
 /*
  * Accessor method to extract address matching type 'a field' from cfg reg
  */
@@ -355,16 +364,6 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
         const uint8_t a_field =
             pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
 
-        /*
-         * Convert the PMP permissions to match the truth table in the
-         * Smepmp spec.
-         */
-        const uint8_t smepmp_operation =
-            ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
-            ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
-            (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
-            ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
-
         if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
             /*
              * If the PMP entry is not off and the address is in range,
@@ -383,6 +382,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
                 /*
                  * If mseccfg.MML Bit set, do the enhanced pmp priv check
                  */
+                const uint8_t smepmp_operation =
+                    pmp_get_smepmp_operation(env->pmp_state.pmp[i].cfg_reg);
+
                 if (mode == PRV_M) {
                     switch (smepmp_operation) {
                     case 0:
-- 
2.47.2


