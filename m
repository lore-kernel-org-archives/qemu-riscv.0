Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA36FC369AB
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 04:32:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u4Xyd-0005ty-9h; Tue, 15 Apr 2025 00:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1u4XyX-0005qM-U8
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 00:32:46 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1u4XyV-0007Qs-Rc
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 00:32:45 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-72c27166ab3so2756772a34.1
 for <qemu-riscv@nongnu.org>; Mon, 14 Apr 2025 21:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1744691561; x=1745296361; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sW6ujvpgCTt1mr8IAXfyzy+LBH/GOsJi+wyaMy6ptVQ=;
 b=e0TVb7gkFtSmsHP3HjAjAkfyYOuxHY102XQjyiC7/rBld5hQxmuOWfsnSGlufezqXK
 jXYMiJFrcx6AX3uRP1Nb/Yv5UA7uAL/Wh+WV6IqbC02JhHqfJFNwylT0EQpNDpU1Kpzo
 EuzjVb0DA/5fxkPToyrKtnn2NrGdf2cTtK+A1OIe0qK/izPKW4Ao2sPbfeNwuknN5Osd
 eeeOKDWDlcDi6iuu1pvhaDo05sdEmdXQIzUOT2OAvU2moWCgAmJ5U6tzL5liO6yl7ST/
 CrAp7xIXeiaUaCSet88gDyDskRfot3/4nEbrk74dJqNBGcrKcCxme3Vaqn+G6izzm3ym
 lG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744691561; x=1745296361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sW6ujvpgCTt1mr8IAXfyzy+LBH/GOsJi+wyaMy6ptVQ=;
 b=eCCrvG5WWVDhTvgtQA8qSVr75LBW6GfbErCg6lFG//mJd3qEY5oI4FRbl9Zt9NDtNs
 +H5Vkar+bpJZRIAUuZ9IW74IknC11JQ3uoe1/uvDsF82QGKCALIXxjD2NzpYYnSm4jkJ
 oYY7nQ+ZZz6QFTeVNhEkfivY9ItDB6MnaseT24tcW0k2BerBVhSGm16ttgA40sgYNIxR
 aNsS0Qbp7BffPXOl7965HmhRzmjPu+FM9o1N5MC0RxangC8F6uhD45wPs/nICb4urhAQ
 6yt58Wwdw5GqxtoRy76xpsCpoJHg30n9i3GXzM8QFVePTIfVMk4mWRzCCilr96iJGDVr
 ba8A==
X-Gm-Message-State: AOJu0YwrWJvyAPJN0fyOcu+1nAJQIPvi7ZEP7guDNUrvcgE8k6DxzrdE
 SMm85NbKwNRJJylnmjrTT1LN4BQBAS0P99IRpw7zUF/ZuNOqM1EKgq8IhaOtdeQFWkxQNtCw1pN
 N8OA=
X-Gm-Gg: ASbGncvD0HlodThf2Zf730COhofYHAoN7Xcg0VWKZz1JhR2ae4lWtSkj+ZL9OFA08UG
 JUXi+QFwsaHedp75qqVnuPG+Q7F1ekrOEdxFnyI9RCw3qJlf77SFql9YzB29+QrC5TRNeo1s2kW
 alNGPt1/6hXlyMxuDOF2+5I1GANovOCzVP9wax7T+gr9PEyORbWozM0EgKYwwDLAzlOuZZg7uP7
 shRrYP8J1QgaoKwq/qACEsdx4w9DnFZej15d93JNr3a5nJ8AJ6zUu5c2e4iiWqN+/FsO1Q8Jez+
 1M4eG9An08oC3MH1JU5b8WEkxIn8EgYvObmA9PLcBLXkTfVUb5t9qHALk7e+klZN8Nrokcolgt8
 =
X-Google-Smtp-Source: AGHT+IF9kHCJnJaFwelbqAset8vljVUDpl3xnrtCOMtU7VNX6YxFy/+1vWEcpApgkI9I+07AG2vuEA==
X-Received: by 2002:a05:6830:61cb:b0:72b:a009:db44 with SMTP id
 46e09a7af769-72e862d6ca7mr9031701a34.1.1744691561541; 
 Mon, 14 Apr 2025 21:32:41 -0700 (PDT)
Received: from ausc-rvsw-c-01-anton.tenstorrent.com ([38.104.49.66])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d096d4af59sm2728816fac.46.2025.04.14.21.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 21:32:40 -0700 (PDT)
From: Anton Blanchard <antonb@tenstorrent.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.or
Cc: max.chou@sifive.com, dbarboza@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, Anton Blanchard <antonb@tenstorrent.com>
Subject: [PATCH 2/3] target/riscv: rvv: Apply vext_check_input_eew to vector
 reduction instructions
Date: Tue, 15 Apr 2025 04:32:06 +0000
Message-Id: <20250415043207.3512209-3-antonb@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415043207.3512209-1-antonb@tenstorrent.com>
References: <20250415043207.3512209-1-antonb@tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=antonb@tenstorrent.com; helo=mail-ot1-x331.google.com
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

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4ba6de65f7..8f90f00aa3 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3009,6 +3009,7 @@ static bool reduction_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
+           vext_check_input_eew(s, a->rs1, s->sew, a->rs2, s->sew, a->vm) &&
            vext_check_reduction(s, a->rs2);
 }
 
-- 
2.34.1


