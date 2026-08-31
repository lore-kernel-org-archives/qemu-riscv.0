Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3333C624A4
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 02:16:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0rZJ-0003a6-8w; Sun, 30 Aug 2026 22:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0rZH-0003Za-RM
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 22:16:15 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0rZG-0007ae-Bx
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 22:16:15 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2d6e954afbdso19564285ad.2
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 19:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788142573; x=1788747373; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=angXpW714AxLO7bEvAuoyzYf+yVTyNqRpHReJaAGMI8=;
 b=B08+pYY1M3pKUXIqYnMT+jS+8N/Rz3C2FccXt03SVl9BIOsIcbq2WGcedSjwM/43us
 4Xo9DZnijw3dyabPhtP/eIcz/Uik61lkUJ9zYTRU6uVJCdze2QaQL8ThUK9z8xVzQOB+
 3QUwJHp2ceWVWXErrSh/RgJVe+tUNdK5yPZkdDAmWfzK4i90UEDCz+gUkc506B8lDhNM
 N7POCEkppHhaASv23kljQYAqfFyouXGgCVXZVDygHhaIOy+4z/39uJxcSBjfCxGkA4G9
 yCbxTEneQ0rF8kF/vpkXngno1iB+KeZtsmrRk38Z7SvN47FvFiEwFecVhHeQPw23ntWJ
 7SIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788142573; x=1788747373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=angXpW714AxLO7bEvAuoyzYf+yVTyNqRpHReJaAGMI8=;
 b=cfYWA5Vw/yTGUlix/UlYKUBzzB+y9jHq+D7oaVKgEwYuUVrWEFliN1EfhMb0WkZfqq
 iQRvyqEmZDcODC45wP9ad9ATC+XqIMRVRquIawxZ8XC9KySBFi5tQmt1Aj44DQJVGSwS
 Tbe8KpgRNY1HF54ulNnFnUocaxIj8sctBYG3v4RkLcrP0wCqDtdHidNuu1worg7mkU96
 j45bXEkNG3hzSBiSipVSzCK7Ss+87w/+ujC0uy2J7aDYUrIHYuZ/sUkQe1Kpk8YxBU7/
 zXAZS/aS2Ls/VOXW6eGUUqt3DOebG8YYk++kyYvNDMJXdsipw7YBPkrHzuu3/1mJcgHV
 00Dw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxPW4frgSX95xdmgH/rwIITjNGiwRI5wpo65IFJKoh8NBA4HnnAFciXbKAHXbxsxzRSatsrcw1SIKki@nongnu.org
X-Gm-Message-State: AFuF++koAAqG3lvLgu93BKKA7f97Kn731lZNPapkqJonMzQTwFR/TdVz
 TJD0iMv/DUfT1ucvrbgEKE2k8IHff7cT97X4wmhzlOF3vLGnSKgj+wH5
X-Gm-Gg: AYBFou0+7fVxNGXQjzlWcI1sgiKIDUj88DGtvNl5M3doMtDAG0vrPpxen5PWNjEGnhk
 jXxaHDhTyLpTdoDQy1m1tOsH6PseHcCqVoFSJ77qLydNl+cSIQA+iYKXgQfN3uhpm5nqoF7lZ8n
 aTTAcfz34o0y/KD6Lv06rnZier39H+YwW0mEQbeeTO/Jt7uLiAISsSX4wd/ApjJ0GIWWIl4VQc9
 b6g/nB9dSHD6N8zabV9DA5/vuyBLpluopTUUJipZbb5t6vl+86bgjYQ4i5nOv0bV/GolrhjFDg3
 LvU0FoKIx+DI614747Ne3MjBkiE5gruJvYKuVCmW5FvxO+47DcTIkWEe7V2BV/6B65Ma7i+t6++
 TGXE7VqVZhPRI6KJ2NobIsW9nRdJnqx1C746qjJ2xPwuXfRK2twy5ivI9Kuq9tpB82YsGjDFRm+
 k4YCfBoQgaeWbjFtnEQWrBz060a4PuuQBtpAhDAMq5T8o5O1cG8lz9cj3nd7rjisMGvR8Muy9Pe
 4eb4cIP0Jsr/fyESLSODP9dCaonq0WBDpC5wXAPpNafqBEYjs0Tiu/x/LPxxX5R+EPpT+lRNAxl
 RaRzLOMBeBnWo1hsWjJX
X-Received: by 2002:a17:90b:4a8c:b0:392:6638:2e6a with SMTP id
 98e67ed59e1d1-396d0f69d10mr29683665a91.13.1788142572843; 
 Sun, 30 Aug 2026 19:16:12 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396b186807bsm20071240a91.12.2026.08.30.19.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 19:16:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 08/16] hw/riscv/atlantis: Remove unused fdt_size
Date: Mon, 31 Aug 2026 11:44:49 +0930
Message-ID: <20260831021500.82565-9-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831021500.82565-1-joel@jms.id.au>
References: <20260831021500.82565-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The machine state carries around the FDT size which isn't used by
anything.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/tt_atlantis.h | 2 --
 hw/riscv/tt_atlantis.c         | 6 ++++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index c9308aa57017..d0cca3b02424 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -33,8 +33,6 @@ struct TTAtlantisState {
     DeviceState *irqchip;
     DesignWareI2CState i2c[TT_ATL_NUM_I2C];
     UnimplementedDeviceState uart1;
-
-    int fdt_size;
 };
 
 enum {
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index acfd0d31b368..127c89be4f60 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -366,9 +366,10 @@ static void finalize_fdt(TTAtlantisState *s)
 static void create_fdt(TTAtlantisState *s)
 {
     MachineState *ms = MACHINE(s);
+    int fdt_size = 0;
 
     ms->fdt = create_board_device_tree("Tenstorrent Atlantis RISC-V Machine",
-                                       "tenstorrent,atlantis", &s->fdt_size);
+                                       "tenstorrent,atlantis", &fdt_size);
 
     qemu_fdt_add_subnode(ms->fdt, "/chosen");
 
@@ -384,8 +385,9 @@ static void load_fdt(TTAtlantisState *s)
     MachineState *ms = MACHINE(s);
     char **node_path;
     Error *err = NULL;
+    int fdt_size = 0;
 
-    ms->fdt = load_device_tree(ms->dtb, &s->fdt_size);
+    ms->fdt = load_device_tree(ms->dtb, &fdt_size);
     if (!ms->fdt) {
         error_report("load_device_tree() failed");
         exit(1);
-- 
2.47.3


