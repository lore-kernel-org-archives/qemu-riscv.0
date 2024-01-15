Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F831C3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 22:28:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVPE-0000iA-1w; Mon, 15 Jan 2024 17:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPVPC-0000dQ-EF
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:26:06 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPVPA-00066y-UG
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:26:06 -0500
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3bb53e20a43so6415250b6e.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 14:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705357564; x=1705962364; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MWHeHV4OEo1q9eMddE57J21tzGp1rowPk1kJmzHf7hA=;
 b=MY6hUzKy9+VxM7KrQuRWWCCJXH+8lMlNj3mE2lydrqikejPL0vtTKLEU5ufCpSIEvp
 nUMfsmlPzHiTuS7Y/Q/YEmJByg5NoECgt8R6qekuQAWNePOuJ9x3SyAsZhECnCe+TurY
 vBsxhcpwhs5nD3V6jx2GDnNefN9WwJihs0KLM4vRtVvZNaPGl4hrEmcX1ialSYCx4MYL
 6ZpqrztIpF+rNVsbo6WbO9S+tIT4+uPhI5YcNJXoNB/FPzo0f+xwoG6WXK2uZ07TjVGk
 iUQDstPc8IfvksLX+1Pn+5Nwt2Vw6rqleBqumtLYYzr/beSS96MbQP1E9J1hUL5ggXiL
 vYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705357564; x=1705962364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MWHeHV4OEo1q9eMddE57J21tzGp1rowPk1kJmzHf7hA=;
 b=uiJFMKB4RCoV2GOit9S/Ez2PmdMqV6FEaOHQGt+cRSkctO8pCDaqdMc67tkgoF4+CR
 sjTLtbVmyI799h7yR34RumkFRvUCmXCXbtCASvOJwKI+j1VDK6FBKT74cni+yFU8DJfy
 oGtT29LuBimlj3XfEG9Gi4HhjHKtMy+jTNinn5j3h+/sF9vvgA9PyVLKxx/JHtwWdSpG
 6oLOoOoI5Yadg07FRxlA1HYzGm8r9lv+L8CAn9sUWpMy6kjR7B94yn8uQxKcKEd9tjgD
 ovotMLytgMFrd9FuoG8ADSR9WqrnDPLTRgMgTiDkYetSytjRl8VBa8Qsrl6AudvhCZmR
 Aj+Q==
X-Gm-Message-State: AOJu0YzDWDPldbPWpdUwtsbO8MT18JG8cL1OeZqsgkcn0LSlctcgGj4j
 wm+2p50VTJbYHEJnaZdz3bBbZDp7/3uIMg==
X-Google-Smtp-Source: AGHT+IEGdJgc9ja1YZyF5ojj0Trd8JIRYj/XLhDl5SjeUXNIS6UWh2Vg/2yB2dLImkdaBg+dLr5l3w==
X-Received: by 2002:a05:6808:1a09:b0:3bd:5fb3:7f5c with SMTP id
 bk9-20020a0568081a0900b003bd5fb37f5cmr7882913oib.89.1705357563938; 
 Mon, 15 Jan 2024 14:26:03 -0800 (PST)
Received: from grind.. ([152.234.123.64]) by smtp.gmail.com with ESMTPSA id
 ks19-20020a056a004b9300b006d977f70cd5sm8125940pfb.23.2024.01.15.14.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 14:26:03 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 09/12] target/riscv/cpu.h: use 'vlenb' in vext_get_vlmax()
Date: Mon, 15 Jan 2024 19:25:25 -0300
Message-ID: <20240115222528.257342-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115222528.257342-1-dbarboza@ventanamicro.com>
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 11df226a00..7304e478c2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -692,7 +692,11 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 {
     uint8_t sew = FIELD_EX64(vtype, VTYPE, VSEW);
     int8_t lmul = sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
-    return cpu->cfg.vlen >> (sew + 3 - lmul);
+    /*
+     * vlmax = vlen >> (sew + 3 - lmul). With vlenb,
+     * 3 less shifts: vlenb >> (sew + 3 - 3 - lmul)
+     */
+    return cpu->cfg.vlenb >> (sew - lmul);
 }
 
 void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
-- 
2.43.0


