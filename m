Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F26C0218D
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 07:24:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbwyX-0005DR-P2; Sun, 26 Jan 2025 02:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1tbwyJ-00055Y-TS
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 02:22:20 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1tbwyI-0004KZ-5V
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 02:22:19 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-29f88004a92so1635906fac.1
 for <qemu-riscv@nongnu.org>; Sat, 25 Jan 2025 23:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1737876137; x=1738480937; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkUKOc7f63KB4f14kvcHLVtKZmUeheB4m0b4nPBkZmQ=;
 b=YsmuNnrg87+4JZTZf9IDiSVMUVFRWd2nWdZONovbT2y7fEtA/EAAehWfF1z2xfzMee
 wfpVsmGHz3vq3wOsp94640TsqI1kHs13vvIsv2T3/zIlLjQlPfpF/NLkTiBWuk3VxWQi
 U0qp2XDka8re4IYDmtnHYVaxyd6syrBRBXXRxTPoFI0xKiUaA9dQ5dFI/TO5VR1uflby
 ZnlkzcgTcn+oQQVsa5uczXXDgEFdiU3oul6jkoATVg2/g1z0z6MO+AQTuOMz8+L8oqz3
 tqijxLUR6eds744a1mRoePyD0VrAoTKALmQAmkfn8oPignax3NOgGRaadQxOn9KVA0o2
 GS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737876137; x=1738480937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NkUKOc7f63KB4f14kvcHLVtKZmUeheB4m0b4nPBkZmQ=;
 b=FuoxdnRTL9Abw9aYhoH00P6yqiHUght/ngVl57hEA9Pc703I43l3C58ARpmybjbOIL
 ZPoQ9gZYsTxQe++Mv7sEqWzjVUc2s250GqNw2T3NIgOPh6ZaoNSlxz1ULvLO134nMMwE
 DPEq9w8Se8R23hVe/m7NB3ZTl8+uVJT8cCf+kMuBJxVK0nHS1qRrfAnXoo/94ryOIE6k
 RzvR1jZdUVveTnDWMyKR4542DymQkC/TpbFtu96GWaoeEa9CuU0NkWq+GqWcBGRfutQ5
 3mS08jXzmWcFTTjLBFObnaSdghIAfWWLQKluvwn/e2pfokUmcio+tTv48u7qtKseg7XR
 EYyA==
X-Gm-Message-State: AOJu0YytqUtSU2UUt9pImOQ99KPk6YeHw2TdpLqVf6S3S94sSGZCM93q
 umfd6YR9mMWmCG7U+hUh/omJRTwQivywEqaJKJaGTsGb5AZTHR2b68ZiGNCYGQiKnTQe8h2fY65
 XsvUCzw==
X-Gm-Gg: ASbGncuPhcZPQF6Qnp34qmIVf0ToZY112cCmoCDGR/s9tpXMrLgcfSzGvTKv4Rm5yh7
 NZxK1Fq0/dCUk9IoxUNj4AjZwyMy9ddrw5v4kLnILvUDyEWRQzukzTmF3V4N4slJ5SvcGEKGXwV
 +U/gbBGoK8U88lAQy1n4f9660wu2LzN/z4YI4IExSfhsNTUaPzYiDFoptvPXe3Bq8QFtvouAipD
 rmULQLUqv3amo7Wb/Gfih1XmXWhosDdE1Aq60OSE5gcqn8wUHKZRjQTytYA68Ja95tZcGB/EtuO
 +KsoW1ZKdvl3NJppE1mOGjlUwUscF3c5dvTNDE8=
X-Google-Smtp-Source: AGHT+IHNHVDGpgKNAjncmJpniOQhZ7IoyN3jJ02THXQjklV9Z+0+ZOR4+BiJ/5G0o5zzj+LRgtbyfg==
X-Received: by 2002:a05:6871:538b:b0:29e:51ca:68b4 with SMTP id
 586e51a60fabf-2b1c0932297mr19341253fac.19.1737876136854; 
 Sat, 25 Jan 2025 23:22:16 -0800 (PST)
Received: from ausc-rvsw-c-01-anton.tenstorrent.com ([38.104.49.66])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b28f1d887csm1814281fac.29.2025.01.25.23.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 23:22:16 -0800 (PST)
From: Anton Blanchard <antonb@tenstorrent.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Anton Blanchard <antonb@tenstorrent.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 08/12] target/riscv: handle vwadd.vv form mask and source
 overlap
Date: Sun, 26 Jan 2025 07:20:52 +0000
Message-Id: <20250126072056.4004912-9-antonb@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250126072056.4004912-1-antonb@tenstorrent.com>
References: <20250126072056.4004912-1-antonb@tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=antonb@tenstorrent.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index bc22b42801..45b2868c54 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -525,6 +525,7 @@ static bool vext_check_dd(DisasContext *s, int vd, int vs, int vm)
 static bool vext_check_dss(DisasContext *s, int vd, int vs1, int vs2, int vm)
 {
     return vext_check_ds(s, vd, vs2, vm) &&
+           require_vm(vm, vs1) &&
            require_align(vs1, s->lmul) &&
            require_noover(vd, s->lmul + 1, vs1, s->lmul);
 }
-- 
2.34.1


