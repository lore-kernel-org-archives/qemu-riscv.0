Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F5EC36008
	for <qemu-riscv@archiver.kernel.org>; Sat, 29 Mar 2025 14:49:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tyXR6-00084n-UN; Sat, 29 Mar 2025 10:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXQy-00080Z-MX
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:45:16 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXQw-0004RJ-RY
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:45:16 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-301918a4e1bso4156546a91.1
 for <qemu-riscv@nongnu.org>; Sat, 29 Mar 2025 07:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1743259512; x=1743864312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wI3WGjdzB/nV7QTfWxa/O65tEI33+q/RVQcoNGfCbIw=;
 b=njUgTFGdt1AqsIktZdUMPz17xLOtJwR9TDlE39BHK0MT8sm0CnEaTfsNp0nYJMCEUl
 iT2CyFf5ZfmIligxzaZSn+0XV7wCfpBU5EkHeV9Yz2muDKcJXc9EAhaMD21aavO80pZy
 /uWVeAjtIT8X9w2/DueaFcKPS2XrfAaREE//knyVUEgN9DSCLz8moGllpPbr+yfZC+Kc
 prbKopAy/Tven4n1BabfMxra0GiuRVDLfMiHrTmzQou6fcyHzDp90ILOADkfFfuY6emR
 MBSCR9nG8gBKezjxBYT94WQPv8jp8TY07HhMT0Q2AE633Gp2l2LFtz6Kn6+CZB6B2M5b
 EwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743259512; x=1743864312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wI3WGjdzB/nV7QTfWxa/O65tEI33+q/RVQcoNGfCbIw=;
 b=P3uM1JuaX23y0S5o3GfXBaFGS0kis60rn9m/gnJizLMD3XGaHTBbSKMr+zt4y4N9G3
 hLjqbTNeneN0m1H1jax+sblH4Fi4UJdPT7qzB6OarEC8GG3IFoAWhMwo7XsQPeUdaByd
 QWnA+RzHK0nAvVKlSv0Rfi2BailpKBd6RVVXy6haaRXWCfJuXL3IqwjzOdFLkoFulAkU
 bNqIBVjiETJRMlSjG2coUJT3t/wUHQ6r7ipcU8t7pgVQ/8npfKRQUKyO270F3Gmv5kux
 3qkfg4LjSE5fP6n4fzxL/EJViN9WvQHNcs4LxigTveEIqb+TO8/hHYRKkjsRHoi/2GOO
 Ji6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXikD/IRO/IznN+EwO3PYmaPgFl/Qquz9hTbLYcg3YJ/pNG/eeoAvHkgYSTAOhXn0DYyIafpaSimHc@nongnu.org
X-Gm-Message-State: AOJu0YzYO99Bl/geyKc6gS4PyFxZ+kBPuBqkE6OnqAaPwyJFbL6L6pjF
 3v2sGgRLQeVJ6MbhfbxM66TejJ2GUnLHQEunQYrnyS/H4FzgyMe72gvrxsUKtHw=
X-Gm-Gg: ASbGnctq4Po2/zcLou/eq8d5RvjG1v6UnChlPK5sJ1F+mlf/9r+R8M44QJpZ76FeUI5
 YasiyhLPdLQBhQhZDQZkR0qAP0mhqX/xP34wXgYjy1PPTWAkO2fqpv0Ux6rpSyhxcHlaEsdD6uy
 k3/iJzWR2LztF76MPdVRaMSzA640hb+be4MxCKpESwWk0mCDmIOmM/9e4l38F92uORXMn0PGGsB
 sqQ7/BDicVJCHd/vwm6JPWpKG+EFTiXdOsdAipfHZKp8ei6beeKBYXlU05BbkRN6RMUT3qXy2MQ
 wOi8phZdTOGLsUxkoQiBctQF812DYcz6l7cyuyc9sRsONXpICTApxjtgVf52u62WYpIdknheiNW
 ESQ5IzOXWQcvlCg==
X-Google-Smtp-Source: AGHT+IFBaJ60tN0FxEOjZUj5m2tHwisPIt8QEytWikW/Lf0mLEBZSEhWf9Rji9JNXkn6Rn748s09yw==
X-Received: by 2002:a17:90a:d2ce:b0:2ff:5a9d:9390 with SMTP id
 98e67ed59e1d1-30531f957a3mr5213753a91.8.1743259512130; 
 Sat, 29 Mar 2025 07:45:12 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3039f6b6bcbsm6737196a91.45.2025.03.29.07.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 07:45:11 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 06/12] target/riscv: rvv: Apply vext_check_input_eew to
 OPIVV/OPFVV(vext_check_sss) instructions
Date: Sat, 29 Mar 2025 22:44:40 +0800
Message-ID: <20250329144446.2619306-7-max.chou@sifive.com>
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
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 3d02a2f9ec8..2282b89801c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -433,6 +433,7 @@ static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
 static bool vext_check_sss(DisasContext *s, int vd, int vs1, int vs2, int vm)
 {
     return vext_check_ss(s, vd, vs2, vm) &&
+           vext_check_input_eew(s, vs1, s->sew, vs2, s->sew, vm) &&
            require_align(vs1, s->lmul);
 }
 
-- 
2.43.0


