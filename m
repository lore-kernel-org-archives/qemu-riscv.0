Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9861BC3600C
	for <qemu-riscv@archiver.kernel.org>; Sat, 29 Mar 2025 14:46:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tyXR9-00086t-D8; Sat, 29 Mar 2025 10:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXR3-00083w-5X
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:45:21 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXR1-0004SE-Aj
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:45:20 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-3018e2d042bso3613052a91.2
 for <qemu-riscv@nongnu.org>; Sat, 29 Mar 2025 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1743259518; x=1743864318; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJYDev/cZ7hbKldzMhzdvTYiCgJzdwhs4Kyy76l5wE0=;
 b=ODa12ZPj96Xei0+eLDkY/jCLcArqKNmTHLV8WUPK66PBJauNfe5vfzCtF7IQ/AofMy
 PoP5OGEVDzPtgUcUV6osoFILgx0iJjU7pxQXsOaZSwhkvM2JjzA71wrVLpXw667tEw5j
 /nWhyDe4zv/W6rtgWiMgitr1yMX3KafDhlsSTTeP980/XIIJaYiIlWhBHtv8v3uzP4ze
 Z81KreW7Y0v6//gP80iou7yg7W18l5D9LxyeKPMcGZnGvvJos73DZuYH6yvZOc8MaOiR
 t1T4rbmvgko3ZJoiYU8x2VnLJeCagOnPk5d1k6xIzfkivlg58z2tb50VGKWINR8CjkA2
 eMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743259518; x=1743864318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJYDev/cZ7hbKldzMhzdvTYiCgJzdwhs4Kyy76l5wE0=;
 b=Nrkwoa0SVB2/fbhJVEYtfBTWxJDJR2YmiRETzbtQMfj0/pKgsS4JzBsorcuCacJg3Q
 O2PEgLN0+lC8vtSOFtUGz3YNBTfaIAReXRpGA9yBW88uvJB8eDuC1pFhzzlxcRmKA9jh
 B4YB7+v6oiX5iaMkYwYf7Eb4MBZ6S01zagQg1k6zZJeWBE3FBvpTGz6y4ZC+l6csYpwG
 UdX5/KozqK/GgmsmI4oFti7ZCS1hRxq5maf4Bbo/UP8q+eDIm+fEGd8X/qt76VljXFoJ
 YgdDV2wj7dDx2jdpgAFeMgaSYJa5i0RwEtZ3QHiYj1ICbDibZhy0dyIoWMf1yZ3WKIrk
 GNKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK5QEY3iQymNzhB9R8uv2INP1EMAfl7Zt5QzIDuOlqgVpGxrQe95CacLUSdgx6NFDPGkr4AcNAZLlx@nongnu.org
X-Gm-Message-State: AOJu0YzUdje/5aI1Xj5Rd9KGoMY4HZGsMHKmKUS5MINcOWbl3S5isdXw
 HObLgMJ22+nduRzjwkTc+ZE7VvnQ5lfO0tMd7/sdWBMKTDgdtP+P+FPd9RAxuWE=
X-Gm-Gg: ASbGncvaghRQY29I7FNCsz/lTt5a3/YHytd6mPbLvGJDPMywtX5y1nyOQ5F+Fz9i7Pp
 iEemUb3rT8D9ezOmiF333ObDKyyTVDmVOHQyzVqvQQXlSyoK0lFAAa596qO8eV3CFgH7k2VisJ4
 6njlhdnHDiNBOL5vyFS5QHAnPGWEV9988wJ/vdnw3zjOz8IC+ujdshZ8TWuOKTpf40oEfxHfukO
 nwwdUKH5bpwKpczJt8Uh+KiqSHN/LF8TkQss0scW77x84NFx16Wg3slZ18dIIr31iTCtvWgj12L
 /Tcj2Nt7VJS39+llOyRgXJyySZG1nhoyzEvo5By7GbaewbEHqCVVTfUzQ/LrYg5ny0ECP2Li2Id
 SDMDf+Hf9NxTvYA==
X-Google-Smtp-Source: AGHT+IGijYcF1tFClTlA4fzA9XD+7M0sYy7HpdV/xJSug/U7OzJEG67obK2mRRJdrFrdseXZBFuotQ==
X-Received: by 2002:a17:90b:534b:b0:2fe:afa7:eaf8 with SMTP id
 98e67ed59e1d1-30531fa4f38mr4604712a91.13.1743259517942; 
 Sat, 29 Mar 2025 07:45:17 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3039f6b6bcbsm6737196a91.45.2025.03.29.07.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 07:45:17 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 08/12] target/riscv: rvv: Apply vext_check_input_eew to
 vector integer extension instructions(OPMVV)
Date: Sat, 29 Mar 2025 22:44:42 +0800
Message-ID: <20250329144446.2619306-9-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250329144446.2619306-1-max.chou@sifive.com>
References: <20250329144446.2619306-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102d.google.com
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
index f397ae46446..728912fc1f2 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3660,7 +3660,9 @@ static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
         require_align(a->rd, s->lmul) &&
         require_align(a->rs2, s->lmul - div) &&
         require_vm(a->vm, a->rd) &&
-        require_noover(a->rd, s->lmul, a->rs2, s->lmul - div);
+        require_noover(a->rd, s->lmul, a->rs2, s->lmul - div) &&
+        vext_check_input_eew(s, -1, 0, a->rs2, s->sew, a->vm);
+
     return ret;
 }
 
-- 
2.43.0


