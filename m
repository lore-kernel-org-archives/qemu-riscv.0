Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DCFC282DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 19:31:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tsoGc-00020q-1B; Thu, 13 Mar 2025 15:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tsoGB-0001qn-U4
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 15:30:30 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tsoG5-0001g8-Up
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 15:30:27 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3912baafc58so1194575f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 12:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741894217; x=1742499017;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5KZ6mlLQ5iqHKgw3b50V+8bSbwFg2xs+/9RS+Up0IxU=;
 b=JGQqX2B9+CbWV8VjppOPf7jBhO/sdm4kU7DY/lkoITDSbnYkUSDB+PAc7HTUBPQwaJ
 mfS+cr0q2OzW4RG3Wb1eTUflNjXld4cyhZzEwqfhRCl6jaJrZ9NwgolPXgK5i2zBORfg
 e1vFxtJ4SgUKW7+LY/qvgIQN1fbEebtWRLVreFtd6eyhJd2G8vtPeNTxp30W5nBL7TiB
 c2w9U+YS3BZLbEDeHj59LXcUl7CrKXq67Cltyz+fYrgjm57ZzftXCXvfoDYuMy7pckkh
 KqG3Wr+a0RN63QWo/asZA6ZfQ5cEItLtE/lP+XfoOhSawC2fh81iJHUPZcmx5raf0m8l
 58ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741894217; x=1742499017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5KZ6mlLQ5iqHKgw3b50V+8bSbwFg2xs+/9RS+Up0IxU=;
 b=V5AfyEbprMdYH5DN9cjpj9YZyiOS45a0Wul1Jie+FDsvM7U8AFfRhjikjnJos95/Ls
 gGhahWtRhBxl0F7yIf7FMLWTyRBtIkMhgoGff9Uc4NTNO+KnG4m1mR+6MFrDb6Jbe80+
 F/PYARzuwpFXlTv5+hVXktf21tJF3A3DW48OU2kDw1JT5pvuciJDQRJWX3bJUHYiyVcw
 MX4Ed1ZSnvP7j/04Tz0X1XMZ0zKHHfe+JvR0ziwyvfhxvm147PvEVZOf6PJHUlkH9HMp
 aay3IxeN7F9ksBXaKgCe620BwA40Ztfc/6ZsH2xhVCvCsLdiUy31vejsaZKI3D+PBbd4
 1rWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5RWxpCDL8X9e1BbPfp2+bQWMU8sLJQsEHvVAssyoaRocY0OkYnJSCXe17nBvaqQAS69XpOu7MnQhk@nongnu.org
X-Gm-Message-State: AOJu0Yz1oAixahNJmZT9Wa710Hz76kLpUAb322mBawvgoROAswOQ+4O9
 RiQCVoLOwgI4ALDqIvr5vij11hPxf/1GR5fS+wLNHiLxrLFd6KEil2pP7mepbi4=
X-Gm-Gg: ASbGncsjsMMaUTeSdnebeacLTErWxOWIozgEpXKCdpAV3e6U0UP5Mn9PmhM9OiFK7ve
 LFBY1uJ2yveWWdwpJbTVwvBSqctzo2lIcLK8cTRc1pyNu9RP6DhwWyBk1aV+oUCeZoxD2VLCeRZ
 Wwl1j3TbcXkIbjVR6X9Ercdup2Vm7ZIELk+AsJjSQfNR7vSF/02RkRy4NE2bUb6/mALa867H06o
 WBNGS5hPiyai3tI17JtqG+aDkUBUdlUjqNcBPWAXYnQiNZ/3hdchXz+lu4hTaK7RICCC5mpqPdy
 tqrMo8QJkABumkMsyf6Ugy2zGjk7WcptpN2qv2ruMsLdsiqCiGKy0wA1l08kCdxQzK88x6Wynp8
 e+TQHjc4et83flug5Q3R9Sq3oD1dYww==
X-Google-Smtp-Source: AGHT+IHtdilhlkrW2izwemoMVyS8mP2IaakjlHHWZP2cFNURjZOj6mfFIxgWZly8CHmD1r0c1Hwn2Q==
X-Received: by 2002:a5d:6d85:0:b0:391:2a9a:47a3 with SMTP id
 ffacd0b85a97d-396beefa3bdmr1218996f8f.0.1741894217618; 
 Thu, 13 Mar 2025 12:30:17 -0700 (PDT)
Received: from llx1.ba.rivosinc.com (lfbn-mar-1-50-94.w86-229.abo.wanadoo.fr.
 [86.229.28.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c888152dsm3016421f8f.48.2025.03.13.12.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 12:30:16 -0700 (PDT)
From: =?UTF-8?q?Lo=C3=AFc=20Lefort?= <loic@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Lo=C3=AFc=20Lefort?= <loic@rivosinc.com>
Subject: [PATCH v2 4/5] target/riscv: pmp: exit csr writes early if value was
 not changed
Date: Thu, 13 Mar 2025 20:30:10 +0100
Message-ID: <20250313193011.720075-5-loic@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250313193011.720075-1-loic@rivosinc.com>
References: <20250313193011.720075-1-loic@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=loic@rivosinc.com; helo=mail-wr1-x42c.google.com
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
 target/riscv/pmp.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index c5f6cdaccb..845915e0c8 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -141,6 +141,11 @@ static inline uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t pmp_index)
 static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
 {
     if (pmp_index < MAX_RISCV_PMPS) {
+        if (env->pmp_state.pmp[pmp_index].cfg_reg == val) {
+            /* no change */
+            return false;
+        }
+
         if (pmp_is_readonly(env, pmp_index)) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "ignoring pmpcfg write - read only\n");
@@ -528,6 +533,11 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     bool is_next_cfg_tor = false;
 
     if (addr_index < MAX_RISCV_PMPS) {
+        if (env->pmp_state.pmp[addr_index].addr_reg == val) {
+            /* no change */
+            return;
+        }
+
         /*
          * In TOR mode, need to check the lock bit of the next pmp
          * (if there is a next).
@@ -544,14 +554,12 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
         }
 
         if (!pmp_is_readonly(env, addr_index)) {
-            if (env->pmp_state.pmp[addr_index].addr_reg != val) {
-                env->pmp_state.pmp[addr_index].addr_reg = val;
-                pmp_update_rule_addr(env, addr_index);
-                if (is_next_cfg_tor) {
-                    pmp_update_rule_addr(env, addr_index + 1);
-                }
-                tlb_flush(env_cpu(env));
+            env->pmp_state.pmp[addr_index].addr_reg = val;
+            pmp_update_rule_addr(env, addr_index);
+            if (is_next_cfg_tor) {
+                pmp_update_rule_addr(env, addr_index + 1);
             }
+            tlb_flush(env_cpu(env));
         } else {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "ignoring pmpaddr write - read only\n");
-- 
2.47.2


