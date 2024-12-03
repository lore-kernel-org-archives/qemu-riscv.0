Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB550E6C5F7
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 03:39:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIJjq-0007to-A0; Mon, 02 Dec 2024 22:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tIJjm-0007su-Dk
 for qemu-riscv@nongnu.org; Mon, 02 Dec 2024 22:38:10 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tIJjk-0005Xv-Uo
 for qemu-riscv@nongnu.org; Mon, 02 Dec 2024 22:38:10 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2127d4140bbso47260995ad.1
 for <qemu-riscv@nongnu.org>; Mon, 02 Dec 2024 19:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1733197087; x=1733801887; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HRHaR9pcBAF9H3M4At6noJSbZrF61K68F3kyhCd72IY=;
 b=SudnvwiwK86ZulxBgB32KR9UJVThIt6MF8csleeW7RjNKbebKRWNJRUV6lyrL1gxT3
 9kMTpTqkstrfHDvgYeGSIDXY6zzvMd3rsgkzUVMM4FenKhVbAA6mW+evKDyFbtypuWCV
 MHoFK+AHsZc06HJDXCIJauZXEEFGPacpfip//V65hrtjwm4U7XI9vKVOHSZEzP5lYV73
 Rzz8bGSJ9qt6T3DVsYA2EMNBWbp8miEdzs8RJB7BbJulpmxTV9I39y5PQxjcfgjaRV4+
 CWM5A6CnqfinNec5cWdPbUNF8daGtolaPtvYmmcUk7xIu6wigLOMcUi88WXXzu/5vOkK
 I/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733197087; x=1733801887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HRHaR9pcBAF9H3M4At6noJSbZrF61K68F3kyhCd72IY=;
 b=KbX4u/n/UXRT/sOo/RzRoLwQtH3fsLtNlO1H2dRaAxrtCEREBWWWnAIeSMPX4vYHi+
 EuptGUzCklMYD+GZGZRCtv7I03ZO09745+xRzOt9Jqh6Qmlgw3L/diAil5NV+I5Q6aeq
 qS3niFvhTUDlBLIWkGzkjGuM1ReRoBs8eGy8QiT2fFUgs0FtHLebB/bEgXSPbe6JQ+X8
 ZDDdJ5hwCjTOq/qH45uGKJdfMLTQDqaXnX0QLUIq/gbT3y74jENuNVtKX+2yd2n2aacW
 VKFjAg0WYuAPZUTqxLC2Dz4F8Nmkj9M3Cot1tLg12DKyXFuAYRz1IK0HZNORg/4BFi2T
 YybQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD76sU262WBpEaIU9cs5Y1N+OperY4JfW30DSV/qenwQ/thS58CXVqLM5De94D/rE3w2YqR0cjqAx0@nongnu.org
X-Gm-Message-State: AOJu0YweV2y0W6yYp+yGRlzGw0jD5uiYAuLLsUmylma8JIoRpi7d22JX
 uZXYz0SJtyq6CD6tMzqqf2Ir86fDhOI/1gaNE5r02Zk6gAQbTe7ybxcqHB3MZL4=
X-Gm-Gg: ASbGncsor5n7zX3/QR3kuzYgZxNxLw9vCMsi1EIWJN9dgAoWQ0NnS6pRIRuBk4a7yCG
 H6aExz73KrfeWGR+UF2W0Obnf4Uz43i82uvbkZgS3428gfGXauT2Etw08I28AIL7GxLOu8ROK/q
 qVvH+PXKvjFynyiD7uYrRuxL/4SnDZuEP4Xu62YxD+eljHiAKwH8q1YClmKxUs09mgeqKfN1u4/
 UGM2L3LyFsioxHTTZ3xQ4woT2j161wCyfDgxbFBWs3KyGND7Urxl5uN20aupQeV11QwSL/1eP8D
 nKu7nwnY
X-Google-Smtp-Source: AGHT+IEXojA/sOEDHW1MM7Nmm2rTZq6wRWPJN6Ug3GKxIkgNleZTZey3K35LdsgOa+hNLhFLHeH1Hw==
X-Received: by 2002:a17:902:e747:b0:215:6afb:5b24 with SMTP id
 d9443c01a7336-215bd174cabmr11952405ad.48.1733197087714; 
 Mon, 02 Dec 2024 19:38:07 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21566732e1fsm47111135ad.134.2024.12.02.19.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 19:38:07 -0800 (PST)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v5 1/6] target/riscv: Add svukte extension capability variable
Date: Tue,  3 Dec 2024 11:49:27 +0800
Message-Id: <20241203034932.25185-2-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203034932.25185-1-fea.wang@sifive.com>
References: <20241203034932.25185-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x629.google.com
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

Refer to the draft of svukte extension from:
https://github.com/riscv/riscv-isa-manual/pull/1564

Svukte provides a means to make user-mode accesses to supervisor memory
raise page faults in constant time, mitigating attacks that attempt to
discover the supervisor software's address-space layout.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_cfg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 59d6fc445d..d8771ca641 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -84,6 +84,7 @@ struct RISCVCPUConfig {
     bool ext_svnapot;
     bool ext_svpbmt;
     bool ext_svvptc;
+    bool ext_svukte;
     bool ext_zdinx;
     bool ext_zaamo;
     bool ext_zacas;
-- 
2.34.1


