Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337D3D6E2CD
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 07:48:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tDfQF-0002PO-14; Wed, 20 Nov 2024 02:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tDfQA-0002OT-QZ
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2024 02:46:44 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tDfQ8-0006P5-Uc
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2024 02:46:42 -0500
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-7ede82dbb63so2446989a12.2
 for <qemu-riscv@nongnu.org>; Tue, 19 Nov 2024 23:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1732088799; x=1732693599; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HRHaR9pcBAF9H3M4At6noJSbZrF61K68F3kyhCd72IY=;
 b=lrS7t+CrvbCFK2mqbC9+w1JwKSW5F4rAzkie25UK0cdDn2QQCgM1LKGDIfsJdPByVF
 BGc/5XlySjTJ9LOnyR5NvmjSHjjqM/5ivve6m+6Ba8g0kukBHvE8O/sAHTZWFaIT+jD6
 a6iXLMT8O4ZGh87ZaKMvhroJhKAiP7qH2HLQMW9qoxF6zvRrcbOwEZ2673fVIGTS0exY
 wdBPUlQszHZAjzvZC4OrGiVzDfofqPJW5z/yK2T+O6Ni810100/y6t7J4fb4M+NBOBX3
 hMveU6JF466CAZxc4TxAPexBxoD/oZFk9083VjsSBCsXixIW6v8U7/me9yKQe1jFMeMh
 MooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732088799; x=1732693599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HRHaR9pcBAF9H3M4At6noJSbZrF61K68F3kyhCd72IY=;
 b=aO8ApTvna8aiWNmpvuSMEsogI7scFXDZptlCMiNBX+0EfP2DB4ApPOeG4b3la1gL0o
 pmUuJH278vP6MNyLLeNXRNMWNoWC4w3HTMxbCkG8URVxF9KwCrFGVbBjRSVCBsK3zUVv
 VFApgTq7Bj9B0KNd/BLEkXtazym3/lzXb9awSzKjX0H8TAMikZi5xmk/w52lFICSXKxu
 y+Fu9nmsu/VrJaNbEwordu7oW2e2KsnI+aNtmbmi3rtlsJzBLKjSVkUjEOT0B1458sW7
 LUhatjz6QkC6eSt3yL3sDt9Z5BqlImfE+TxFFe1+mrWviZivO2zZ/ASg99JTIvtiRwce
 xiXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKV9aJHSwev/dE9i14k9VFVQYJ15N1nfYU7G8hPNF1e87m6hhCXMBzn2+en8svWmLcy8Mla0ZIn6CL@nongnu.org
X-Gm-Message-State: AOJu0Yy29tNGo7ibnYmgxnS6bh4mXvxTazX320p0ufWIAf2wkuc71LxK
 EfpXxm7BSNFT+GrdIrJz3C8GM8jRwVCzKme7Y8ulI1dfo0YpSCIo91LerPDlHDE=
X-Google-Smtp-Source: AGHT+IHqhWv6J413TU13WsyC8gl1egXxQ/eIZHTFWmLXR4B4ToJ1WO1qNLAM8crBNbdRN1dvXXVaTQ==
X-Received: by 2002:a05:6a20:9195:b0:1db:e1b0:b673 with SMTP id
 adf61e73a8af0-1ddae2f047bmr2563194637.9.1732088799524; 
 Tue, 19 Nov 2024 23:46:39 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211d0f51fe0sm86206255ad.233.2024.11.19.23.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 23:46:39 -0800 (PST)
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
Subject: [PATCH v4 1/6] target/riscv: Add svukte extension capability variable
Date: Wed, 20 Nov 2024 15:48:49 +0800
Message-Id: <20241120074854.1767780-2-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120074854.1767780-1-fea.wang@sifive.com>
References: <20241120074854.1767780-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x52a.google.com
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


