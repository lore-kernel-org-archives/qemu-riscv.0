Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB1DC36013
	for <qemu-riscv@archiver.kernel.org>; Sat, 29 Mar 2025 14:49:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tyXR6-00084T-Lq; Sat, 29 Mar 2025 10:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXQx-0007zE-8q
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:45:16 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXQs-0004R1-Jr
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:45:12 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2ff69365e1dso4128698a91.3
 for <qemu-riscv@nongnu.org>; Sat, 29 Mar 2025 07:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1743259509; x=1743864309; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c5JU9bzTfuCe3JCqpsVwAv8DXEG/Oah/zXXLHIR0A80=;
 b=Cl1wlRFAnLdnS4hMtONnqTuDPd3dgAQaAcHMcBDPg1QIwB2P2xu6RqyMepfJoNkAGm
 XPrHtCJsekNNyGHA1i7r32njzVoHsm17D1cwUl9CVoaasuog8DK3qmIVxAaObqbPtd3K
 KT9wDyMMJqrRneIQ6ergvbqMUf9wzA477S0+/SvCnYKEKxKNcMT9EZJ6g7yQq6KMLEtl
 Mtcj0TlTKtZ7rjXSgagYYWOyGfdikoY+N+GJY3AN/Z0wumE2e6Liacyq6KoQMkCUjD5G
 DuN+C6LPCpMU4385wJnZ/oGRWrVTH7JaLvz7NxmisPOaL3uuK2lNUdBAOOQBINaFKhY+
 iQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743259509; x=1743864309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c5JU9bzTfuCe3JCqpsVwAv8DXEG/Oah/zXXLHIR0A80=;
 b=CckcYpFY55UFxfTuHMx1F91h4NZqBs3qKDrLsm0Kd7nMcY5G2ClvOGA3ZN6FNZSBV/
 pOows0dQJ74fx1zoPkImhutGKaYtlM1jnxu2G+0LlJdeTAGB3iDwSoEQZ1QNhyABYQxr
 pdVfOdURdbaxfensbroQi/6IhwvStw8MUiXGPh5Kc2XU5mBUaIfH7sdT6w9hNPdXJyPc
 QC0Bp5zBRAEBzLdkGWYNdGxIkvThk2d5XN6AJR9pv/gupoC9BsW5LsHjx2uwvaEE1YRf
 /paEqxGi9EYkilsMkF1yT7+df9SsfpTjAnd4yTurbrAja/AccAYs3WLHeIgtLltBs/Vp
 Znzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsmYyW2e5EjEWOnGIp+v1OhQkJO4/qf73OHKtvPYjy3fKBmf4ZPNbqOUKFR5CYtcgfYusZ7dmvznBu@nongnu.org
X-Gm-Message-State: AOJu0YwY2wGLOa1KzOLMQh/d++FYupDtdXv53PXQhgk24npF5YiyBQ/B
 XWYKLiaIEojIRq5WQl848n51v/b2gcIian8ELNY6IfTkeslTsbYW5l/uEozYbpY=
X-Gm-Gg: ASbGncuWtJcZdJL7vOpvfy4+6cufmt1mOEMIScLRRAemj1gues61H2uxwFgJLb4ARO7
 +VsMIYkVLXgmgcQjFTkOG7ecE0XlbsUfiEBgD64takwVXMfGyQWTSFP1l3PAGrAYMPu4rbCQeT9
 a1qXZnjcCjOJs344FTWNrdSbFG34MsZ4O1XN+gtQKjpm1OAXCPXycJh2sNLLDOkkDYZw5geYKa5
 3KvPMa9OStrFDUDS8ApQqJxDyZeahafmWR0rCW8MMCR51eb9XS/oMh4FLAV6wPXsJlrJkrZ62V/
 MK/TPel3hDJlOw5pNgPzMg/klYxihTWbBt/e42mEagmSaZIPlnVnhmg2DYKBWsFNF3xgTWED1pn
 CQxITEQTaFWdUJGMg36kJvw9a
X-Google-Smtp-Source: AGHT+IEk2Bqqm2dIRxdjJzsOKbKLV+jFCsZo3jvFw975u6TXTDT/qsbeNpLp8c+pGe17hGYKlwRZyw==
X-Received: by 2002:a17:90b:17c3:b0:2fa:e9b:33b3 with SMTP id
 98e67ed59e1d1-30531f7e2eamr3929769a91.6.1743259509086; 
 Sat, 29 Mar 2025 07:45:09 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3039f6b6bcbsm6737196a91.45.2025.03.29.07.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 07:45:08 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 05/12] target/riscv: rvv: Apply vext_check_input_eew to
 OPIVI/OPIVX/OPFVF(vext_check_ss) instructions
Date: Sat, 29 Mar 2025 22:44:39 +0800
Message-ID: <20250329144446.2619306-6-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250329144446.2619306-1-max.chou@sifive.com>
References: <20250329144446.2619306-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1032.google.com
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

Handle the overlap of source registers with different EEWs.

Co-authored-by: Anton Blanchard <antonb@tenstorrent.com>
Co-authored-by: Max Chou <max.chou@sifive.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4a0c9fbeff3..3d02a2f9ec8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -412,7 +412,9 @@ static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
 {
     return require_vm(vm, vd) &&
            require_align(vd, s->lmul) &&
-           require_align(vs, s->lmul);
+           require_align(vs, s->lmul) &&
+           vext_check_input_eew(s, vs, s->sew, -1, s->sew, vm);
+
 }
 
 /*
-- 
2.43.0


