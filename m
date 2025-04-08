Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E262C3600C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 10:41:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u26Nd-0005GB-Gw; Tue, 08 Apr 2025 06:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u26NR-0005CD-SZ
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 06:40:24 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u26NN-0008Ro-Jx
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 06:40:19 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-736b0c68092so4305320b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Apr 2025 03:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744108815; x=1744713615; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V3kIK3SPZ+6nNlN6c3rIDoA+sKT5kyUnVw4pY5gTecA=;
 b=BC3TBEVMoVoCxfCPlfSC1TPQukR+bh4D5h/JiJa/P95gfhkbuAHon2I0N+SASs+YMZ
 Ot74hJzTHdMswTCXgzf+HENR/cshyzoubLQUI7RXY07mWX5hgS2Bz7danIkOtKlF7vV7
 UfJDWweNOBWi/DhtzZNhR0Wf9yz9gCwGVFgaMuXvIY/G7gJksndjLfEtuYNOvtEhoYn7
 znD6TLonBKhtRZ4qF5Ag0N3SbvUmMdjMZTMmgwMKNhYepRJNsTDZ+rDjyElR+XDnKnna
 QOrIrkivq9DrRdDpVSXXsWZ6JqDDf6RHPyxm7Z8P/yWyIrBTkQbSfz0voC/iM1g5KRf9
 adyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744108815; x=1744713615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V3kIK3SPZ+6nNlN6c3rIDoA+sKT5kyUnVw4pY5gTecA=;
 b=pguXlJfhs86nhZo7mJCkOJwAoJyQySSK8yXNkSqlb84t3KrjiO97N9jq7BJ0l4Yt+R
 V8bGlybPAFsGZA+YznU26ubydFYUj/wjKRF5iogNlyeNRX16srLgtrUDpEJ7Rrncx+8m
 rHu6AJJxeSbel+cwGvdRsOLq117lAmtPJaCxcP6xOhMcrrfajLna3YaFXm6Zg6CimPN/
 s3d8/bc3CGedm6pv6aOoSNnbNnW4DSTbOe2aDfKZPb6HJSEil9CfIXLJinZB4B9isDH+
 uqKlEX0O7Tn6yvJA6a9YYqwk4MRNgfXh2vLs+3DSXTEamG6mInfefw0SMs15N1nWRW7m
 Nz+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiGvPaou7AfwpcDOi9/fmUmlevOuT6fewhzpvQ/1uaKSawOcG1PyIhB3QCk08lacAPUN1IC+2HAEjL@nongnu.org
X-Gm-Message-State: AOJu0YzG10PdlJvIJzobDUjUbreR8Rc2wnc6bGsl+WSuPsjKlbuAsq9b
 PSgawVFCKXWJb9zggwJCIN8ygD2cJ/t4ufy6BXuiWZUepuGYkbE9tYTwEqutmSk=
X-Gm-Gg: ASbGncuwCnRrECIoF8FwdwnDsLMdBU5a3UWWXTaP0Sdu+14kFCS9J5bKVMyfdz9qxLk
 jIk0+/88QigjqQbohMuEWfSzk0BPYJMoXvV0KaFxocke2ws/EB5DFwULiBEBMd9sGz23ekzqv0Y
 mWhBIpsm0sdyUl5LNLFeOUWmkS87twEwUG7BB+VEdq/EwI2i+yFpnyawYua+1W+wt6Txnt088Ro
 xXj1eerSSuIaci9ckr1EMb3ljVaNhA3rMhu25yNlw+FKmpL/8yPXW9XQbFFH/tYyrzX/LRZ8v4o
 jqC5CljtDEmdCjVmL2jUi09PSVhBgRXcIA3j0Q/IFrg7hCyjScQyxw182Ssiy20VlKXKaycj73n
 K1Yr9Wjjvt+Tltw==
X-Google-Smtp-Source: AGHT+IEvXWo0yvhk+JuMdsMB12/7jA6+6BVDdPzs0RuQQNvt3QjtzG+5W8qnFslMuCKwj2Wl79E1UA==
X-Received: by 2002:a05:6a00:390a:b0:736:53bc:f1ab with SMTP id
 d2e1a72fcca58-739e4b49b9emr25589340b3a.12.1744108815396; 
 Tue, 08 Apr 2025 03:40:15 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0e3734sm10532380b3a.179.2025.04.08.03.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 03:40:15 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v3 09/10] target/riscv: rvv: Apply vext_check_input_eew to
 vector indexed load/store instructions
Date: Tue,  8 Apr 2025 18:39:37 +0800
Message-ID: <20250408103938.3623486-10-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408103938.3623486-1-max.chou@sifive.com>
References: <20250408103938.3623486-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x430.google.com
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
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 2d067a59e27..445a0b72a56 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1043,7 +1043,8 @@ static bool ld_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ld_index(s, a->rd, a->rs2, a->nf, a->vm, eew);
+           vext_check_ld_index(s, a->rd, a->rs2, a->nf, a->vm, eew) &&
+           vext_check_input_eew(s, -1, 0, a->rs2, eew, a->vm);
 }
 
 GEN_VEXT_TRANS(vlxei8_v,  MO_8,  rnfvm, ld_index_op, ld_index_check)
@@ -1095,7 +1096,8 @@ static bool st_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_st_index(s, a->rd, a->rs2, a->nf, eew);
+           vext_check_st_index(s, a->rd, a->rs2, a->nf, eew) &&
+           vext_check_input_eew(s, a->rd, s->sew, a->rs2, eew, a->vm);
 }
 
 GEN_VEXT_TRANS(vsxei8_v,  MO_8,  rnfvm, st_index_op, st_index_check)
-- 
2.43.0


