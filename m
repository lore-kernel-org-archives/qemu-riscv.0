Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6B4CE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 04:31:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkdFB-0002rY-GI; Mon, 25 Sep 2023 00:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkdF9-0002r8-Gj; Mon, 25 Sep 2023 00:30:48 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkdF8-0007WI-16; Mon, 25 Sep 2023 00:30:47 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68bed2c786eso4132161b3a.0; 
 Sun, 24 Sep 2023 21:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695616244; x=1696221044; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=quOcfMT3Co7SEqVqYNSyCwXYD43DzXY03xaAdPbNQGY=;
 b=Kv+CQWF+I+/rGzl1Fp3KDN8u/PY4/FPsP4L85EnFO4av2yVOJT4HSHmO8kPVzw7vWA
 VOo9WYvOxT34KyuS66Skyy2Xy5FIfBqoc1OaKnZSMQvA/WqAIM8XK2aARLIFBZMJHHDO
 EAMhVbmBJoWhlBa0MXysLvOEJok2o4pPFyhKTbJB/I8tm3HtI4mJv58zLwRKu/OWJgGK
 3+3RY8GnOHnVGwb/na1M4PR4EHB7HDRJxeZUBP12mWUzqud1XHGmi/0JRgmFBhKchIiQ
 NeZmmfe3q6vzMeUwj5J/1t7YfFHKibviTXOuQ63Fnefcdqk3BUdNNvjhuAb4jS3NPvs6
 9hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695616244; x=1696221044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=quOcfMT3Co7SEqVqYNSyCwXYD43DzXY03xaAdPbNQGY=;
 b=Z2bQoADYEIackgLrDn8GHHUDnlsssglAcJDnbzThKg6IO1PfcucGkCoLOv8dnXQZPb
 oCc8yeaBmkZpuI5ZHrtWeqkhKVvCOJlBKh0fq+Nioac3ZnAtmqNT53P9EjfnZYpqB0gc
 ZsFnJqou8h018SebgsBRvHG3I/KREbCBvxEPUkOh9XNa2WZTb38wEjBCjwU/bVOurDid
 ax+ivDW4AVThdm3CLFK1lBWHUI2Q0gmgJicIWEH2qHrAUMIJ+6o0JHnbfgTKNiGv1OuS
 OULeKAlMioBf2xWNz4CtTCXD7TvupTa027aReY/E3lzrnlSaMflbxxOSj2qA8y9m/CQu
 Y7Dg==
X-Gm-Message-State: AOJu0YyLkUqVu20u3C7/NAs0RwvVBn9G8wUc/4pbTa6CgoGvnD8RFKL9
 gS0XXp0tHytUTgbM76qGshY=
X-Google-Smtp-Source: AGHT+IF/rhJonP/PIzMqWZ9YfTIVFksAkVeEsWddN4snDQtI5jiV5abSjfA7sMu180uvVsNhcPwllw==
X-Received: by 2002:a05:6a20:1451:b0:134:a4e2:4ac8 with SMTP id
 a17-20020a056a20145100b00134a4e24ac8mr5117016pzi.39.1695616243803; 
 Sun, 24 Sep 2023 21:30:43 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a17090a134e00b00276fef82025sm6002161pjf.35.2023.09.24.21.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 21:30:43 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: david@gibson.dropbear.id.au, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair.francis@wdc.com,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, palmer@dabbelt.com,
 alistair23@gmail.com, dbarboza@ventanamicro.com,
 Alistair Francis <Alistair.Francis@wdc.com>, liweiwei@iscas.ac.cn,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 2/4] target/riscv: cpu: Fixup local variables shadowing
Date: Mon, 25 Sep 2023 14:30:21 +1000
Message-ID: <20230925043023.71448-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925043023.71448-1-alistair.francis@wdc.com>
References: <20230925043023.71448-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Bugs love to hide in such code.
Evidence: "[PATCH v3 1/7] migration/rdma: Fix save_page method to fail
on polling error".

This patch removes the local variable shadowing. Tested by adding:

    --extra-cflags='-Wshadow=local -Wno-error=shadow=local -Wno-error=shadow=compatible-local'

To configure

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index eeeb08a35a..4dd1daada0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -699,7 +699,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             CSR_MPMMASK,
         };
 
-        for (int i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
+        for (i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
             int csrno = dump_csrs[i];
             target_ulong val = 0;
             RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
@@ -742,7 +742,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                     CSR_VTYPE,
                     CSR_VLENB,
                 };
-        for (int i = 0; i < ARRAY_SIZE(dump_rvv_csrs); ++i) {
+        for (i = 0; i < ARRAY_SIZE(dump_rvv_csrs); ++i) {
             int csrno = dump_rvv_csrs[i];
             target_ulong val = 0;
             RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
-- 
2.41.0


