Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B8FE7716A
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 09:08:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNTY9-0008Q4-OW; Tue, 17 Dec 2024 04:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tNTY1-0008LU-2L
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 04:07:21 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tNTXz-0001XV-8s
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 04:07:20 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so25917155e9.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Dec 2024 01:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734426437; x=1735031237;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vDXbH9qomW/Q4GKFB0TQ2dx6KKw+IDmW71uRbjSPDlI=;
 b=qVAMfr2KKoh2o5FQrhqmYn8nEbzNFztI4ccRHFoRici95oEUaiEl1gAP/lWCv/IGfB
 4AbVB23oyVJUO7o+azhO2SY7G8ztbJfTYYyhh4nkMeP6D9PcdKv/saQcj/7BIUJmS8/f
 Wpy97PNNBCmwTxO7pWKj9TPxmUZqc9mGpW2xinQdkaUfNJom0VB16l6SepZHuE6u8+3Q
 AAod8S9wSVYkTDHDgF/Bp6xdlxdpjQZIeeduLD73ehsxN+9OdM/AFilCh9rTMzMBYvGG
 txHNhxRHATlbVI4mvL15EMkkvv1BQV98ZQg7+l/6Do8/vClhpzH9q9DPs6z6HNZ0GJWK
 x1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734426437; x=1735031237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vDXbH9qomW/Q4GKFB0TQ2dx6KKw+IDmW71uRbjSPDlI=;
 b=wm3vfhlG/ISfvLD0HOfyS6ed5A1XGNFKNNcVZMKSfqznU/OvKqku2FNvJhfgMBbOJt
 yCH3X9KJOeae6mFXX3YU5F3uOoVXlyEQOepiolxPj3I5LT0jpfxDdNqCXBQTlfUk9cYO
 JzNl1Lo+aqzyKXPOhYdZFiZYhHLIq+TkX7yNa+UsiTnzJLTvfMjf9+yD6X1ujOWSZTYQ
 sCatvVZsxK8euRKVO5IzhyOyzD/1UQ7l/hlPObBmLv4ROs+wrXuIuoj5JWB8z6DV9ncu
 4Y797ULzqbV8KGmc42jxiwPkYcuIglzMl2+IGs3KHKNzmH+b7HHK+0JoPgTW6BGuYJEV
 dfcg==
X-Gm-Message-State: AOJu0YypmphD+xZL8lxtctykqNDmmzhsogKFVbIMm/ypEHK9NZC8XW/2
 APXM7YgOgz1uf4PUnSe/D2GBiZm54K4D6glaDFs2qgfjcpvHizVu0Dw4BMeh/rpYJgLchX1vqFl
 C4FY=
X-Gm-Gg: ASbGncvmh46Ce/gUVhEC5p5uv0b7j3GKEcOW0UMxQoTETaEQrLDeMY/EfP3sv3bACLB
 oS5J/61JiraFCtxPfpC26Ub1BNjAku+qV+YeWpXJ0P4yACCOwmJpfuzSjogBsVmLB5J6han5nkE
 QypDmup0kjEAegMUGuMjkhoCsccPjbqSWHBZZD36mQdPiE/f0b8VMbtNlTR/y6xvTo2ZXaWkKSK
 84mX0thMR3Me4FsckKrwldjiNwN34sLWP9ovTGNfjwiGdVQamDlln0sCQ==
X-Google-Smtp-Source: AGHT+IEdAmAnTz9Feere8hqkCwNEEu8KX7WKAdoR3mA9qMicvSiTUHWVsmaPOQ852n2tfrQvJWHPvQ==
X-Received: by 2002:a5d:6e64:0:b0:385:e88a:7037 with SMTP id
 ffacd0b85a97d-38880ac6091mr11421555f8f.6.1734426436785; 
 Tue, 17 Dec 2024 01:07:16 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8046c46sm10704122f8f.71.2024.12.17.01.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 01:07:15 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 5/9] target/riscv: Add Ssdbltrp ISA extension enable switch
Date: Tue, 17 Dec 2024 10:07:01 +0100
Message-ID: <20241217090707.3511160-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217090707.3511160-1-cleger@rivosinc.com>
References: <20241217090707.3511160-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=cleger@rivosinc.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add the switch to enable the Ssdbltrp ISA extension.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cfb95eab14..c856a95593 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -199,6 +199,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sscounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(ssdbltrp, PRIV_VERSION_1_13_0, ext_ssdbltrp),
     ISA_EXT_DATA_ENTRY(ssstateen, PRIV_VERSION_1_12_0, ext_ssstateen),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
@@ -1625,6 +1626,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("smrnmi", ext_smrnmi, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
     MULTI_EXT_CFG_BOOL("ssaia", ext_ssaia, false),
+    MULTI_EXT_CFG_BOOL("ssdbltrp", ext_ssdbltrp, false),
     MULTI_EXT_CFG_BOOL("svade", ext_svade, false),
     MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
     MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
-- 
2.45.2


