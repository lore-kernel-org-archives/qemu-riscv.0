Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E1ACC6B2D
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 03:19:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHBzH-0006cO-LN; Wed, 14 Oct 2026 23:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xHBz7-0006a6-EA
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 23:18:25 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xHBz6-0006cc-2G
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 23:18:25 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-3ac847f9d78so125273a91.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 20:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1792034302; x=1792639102; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VmMMUAd6gA6U8M7wACz8JIPXiKmX69iwu/hMcHHU1HE=;
 b=RlwVUPvYt34eWSM57yKG29lg+jTWgbEPbQWEU5YbY1FGQCK8RXmlnEEwrG+X8/YbKf
 uEEBA7nNmWtR0OxeFrtAuTtmWtEjpT/sPASL/G7dr7RqOi4j92I4oABHXoKiqZOTjC1e
 85iyspILalPp64uPKitQrAlgQda21s9U7XcQwPM4bxUJeoyQqlLWq1EycNYRodvK2sy8
 lQ9rZB8BXEHhp4hgBMOPFNCBZNEENEirvy4QgsR/++FJ52iwzXvIaWNcoSLa6hQJp+rg
 FmWiklCatEyQRWkSxtI1uj9jyHpK1fx5A08p79HX6hpvJ2WrZhipDULjC7GIquFIeirW
 sfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792034302; x=1792639102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VmMMUAd6gA6U8M7wACz8JIPXiKmX69iwu/hMcHHU1HE=;
 b=KZzWhWx26AI8IA+7szl3u/7VAlooPIslexhhbpKUhlKZJJfkTvB05+KvF6uSYvExES
 9x0jdA6v0tlW1QFb7Cp3LybgInFJCh6dCS/l7TtZpUAgVsff0WQtfp9lrmTAxDPBB3PW
 IK5XK4OFI+Yyetbsa1CuattBJHaLZhE0XSi29cp9oniFrEjarw1FZt9bpGp+drH506qm
 hfbS8V/dQLy3u+QFeh5b25bfI0EHRB39k6lByO7FBnlhaawL3nuPBsgsddRi5S+5rPZS
 v1j0yktZziaFI6nY8MVvJMo508xR53GxwvB80fHQ3ap4eMbLr4ocxsESm56gX0WQbIB7
 NLfQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwXcvu8pEx+miqgb/hTXF93W0wLZ6/x+RaGT/3MwrV0XeCtBk4IQN+vhMBsm9GhGuUdBShjp7jvr2Yu@nongnu.org
X-Gm-Message-State: AFq9FYLzHjNzIGIkDIjjtuJd2wIJXmMVpdL/0g8B7/86hRZMNLbB7ET8
 dLn0GgbsD084FBAqI0ZDjm/Yb9K4l7n0REkmc4Ahqp3tuEFIGdzat8VvrHNIOV+beTA=
X-Gm-Gg: AYBFou3xc1mndRG1dW+8/FeKZ4xJbI2sZxW+bl8fkNnWfGfEL4sX5cLnLsVsqugBO9O
 Pbe3uBAbuEad8B+5KB5lUwGgf4yS63c3dlpyPTkx4qNQhznbtb3tIyaBCcpnMVGuY2zJoOIhxbi
 Y/TxCs1eWyWFmxQo228e/AaX25E866Qe9CgcUAqpQle6+OX2RlTgP5Q6JxfiOOJc3bez52wyEuK
 Unv5UYK4hiwN4Myyu2cPB2DfLIET4ahz51yW4lRU9jPcMyY+5ogdZpcN0dam4FHkZrPrWimbq5w
 OMY7ILtHWOMsdnTxJ7+y/LF3eN+p2g7w8ykDRYIbzADbwP4oGocSPyPerfBw4MeIvyiF2APoZsm
 jOXM+oTPGPcN6eqZ//ceD/LZXacyu38qjR+QQoztLa8CzDaSdA4OfRIokwsPFkA2mFLMaiLsBcS
 SlNk7LYE4cKgT1/6Ki8fLIQqCkOxw2B+GARfN7JNZ/0V9SlPB42FTQh913aXCuk4D5om0Inuhox
 gtLTzx4k1PmvnR29L8oMohW1C28KRqOayvv2+huzAnwQTZVY0l48q4x1dM=
X-Received: by 2002:a17:90a:c105:b0:3ac:e6a:1af5 with SMTP id
 98e67ed59e1d1-3ac0e6a4dccmr13978718a91.2.1792034302382; 
 Wed, 14 Oct 2026 20:18:22 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ac93049ec2sm1321725a91.1.2026.10.14.20.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 20:18:22 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>
Subject: [PATCH 01/12] hw/riscv/atlantis: Set valid_cpu_types for Atlantis
 machine
Date: Thu, 15 Oct 2026 13:17:53 +1000
Message-ID: <20261015031804.2406055-2-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015031804.2406055-1-portias@oss.tenstorrent.com>
References: <20261015031804.2406055-1-portias@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=portias@tenstorrent.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The Atlantis machine only supports setting the cpu_type to an Ascalon
CPU. Set the valid_cpu_types to reflect this.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 hw/riscv/tt_atlantis.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 311de64eda..ec52faf17f 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -76,6 +76,11 @@ static const MemMapEntry tt_atlantis_memmap[] = {
     [TT_ATL_DDR_HI] =          { 0x100000000,  0x1000000000 },
 };
 
+static const char *const tt_atlantis_valid_cpu_types[] = {
+    TYPE_RISCV_CPU_TT_ASCALON,
+    NULL
+};
+
 static I2CBus *i2c_get_bus(TTAtlantisSoCState *s, unsigned busnr)
 {
     assert(busnr < TT_ATL_NUM_I2C);
@@ -792,6 +797,7 @@ static void tt_atlantis_machine_class_init(ObjectClass *oc, const void *data)
     mc->default_cpus = 8;
     mc->default_ram_size = 4 * GiB;
     mc->default_cpu_type = TYPE_RISCV_CPU_TT_ASCALON;
+    mc->valid_cpu_types = tt_atlantis_valid_cpu_types;
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->default_ram_id = "tt_atlantis.ram";
-- 
2.43.0


