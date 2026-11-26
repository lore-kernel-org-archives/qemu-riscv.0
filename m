Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0920B606A329
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g1yUZ3sN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWab1-0008QS-GD; Thu, 26 Nov 2026 09:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaaD-0007fI-Qf
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 09:36:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaa7-0001hN-Hv
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 09:36:21 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4bb6057b333so34026905e9.3
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 06:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795703774; x=1796308574; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+CjRTWznI/DieEMibp13lhrGBosFJP3Y8S+JTPO6RbU=;
 b=g1yUZ3sNHFlP5trFnr064Y7GXBu8UIfGKCR5QZDj9agZqbcx9jWbWQDPCeASKCR1av
 jQDN/MJB8jZdinXZWQjtfakdjf/7fqjuJ8AdeF1xObgQ/klGV1r022vhfRhPsdnOypmN
 FMLzF+osb1N/hSu687bmzLA6y/IgNDjJl4ai0qm4V1HgYBIYaJhobJLMdSc9UbzFxtOd
 OxWhYea1DxDioY2qglK8wEXyYFxVGWEgMej676O0k6uj7pzI6psbZAQMxU3ffWS9RiVI
 0qfbAep39sCPLc5iz+F3UyPQYD2kE55+XbuLfEuM20+3W1sueu47sUaZWwnj7jllRt/f
 cPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795703774; x=1796308574;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+CjRTWznI/DieEMibp13lhrGBosFJP3Y8S+JTPO6RbU=;
 b=BVWCWXOnJGdLfLVgpx6mYkBtmrMaxzYshz1NxPB3WapobR3MXMdQ4uKdIT4KoVwLWh
 TLnwlLb/kRaTqZSfheVgReQSxYDZqh6cR1zv7/0elCJhKM+5Lw8enIS9rhMvT1y7eI7i
 xx+Xz8mfBO3qiSw6SeRkY8Xd5Tis6W73Vs8yC0i9CJbPBd2pKaRWYt5ZGIwSg2VdK8ZG
 o70DjKwXiGMP95W/vJDzXQiXCMp4aWD84qTZR+sUAQd6PXWZ8kimM2RqpjrefJYm5sby
 wOZ2jnRUhKZBiWIbBZpBL/SjYHecXUx+AQP3gV5gZZxZBu0jSvE4Q8D2SfP2oBHWN3xR
 hSMg==
X-Forwarded-Encrypted: i=1;
 AL+hErEc6pV737Y96z6O69PhGKSZvNkR/Kx+61YvGAdgVzyU3wDogtgh2Ldd8gnvzVGPuyGI+1SkBx+jyvvz@nongnu.org
X-Gm-Message-State: APuU4Z/KVPorNGdvpoyQRGEqOZos85JMFoC0G5UzbG7gcl4Ognxm+s0s
 4/fa9MOR9054PSgDDLvMGvWYfvndvTI5NOckt4GS0RMk1knGEMjkdRmWhh6lwM6ikSo=
X-Gm-Gg: AZFdTZcTPFhsaW9zfhDaMggpW2+9Abr9o0J75AhGhYX7xBQFZDACxQUDE06OwWIxpiP
 EuvCsmHXkbG/IU/bSXfbXzECNFC6cBeFOakCH6toX5MCD82HtoPx2MrvVhYjga1uymusR8OPb1K
 bmMyehSY25H2qnKatZp7n58lxeR+PP7UzA2tGwI2L9h2zghZVPmqc+wtyVwupE8A4z1JzhwFJjn
 0VZnD6Q39u1bTVq5nZ4VT9bmQx/dqhDyYPZqT1RxkB7WMnArFmiZjXnAxZv94d++DuDE0/kUDEh
 H6OdCASAJvOkrFPLT8r8jI+HMdX1kF3ZY1hXrRp3+5qcnEj5EQWCcR6CULDcP3G/MI4/aIYXPcy
 eQNcr5R3fbXHIqugVSSoIGE6t6bS6At2hU/BeF9KZhxLvI+W9lWjS6IvJeTy5JAHyBpvW04TlmK
 btC5JEFZ7ZnL7a0XgEedhrCE0+nrJdoBmZQFFFLQbjpF13T4Td/tZpVMq3o+vpFFVJ6EenxuBNR
 R5LoZELQBVifUo7qm2pMmTeTiwpMUTAHWJSrWgB9LTkW+ZQkYH80TFMKAIeMNyFdA+QyYWQxl5p
 OFJxVumE8xw9gghSEICLEjiYWDtj
X-Received: by 2002:a05:600c:1115:b0:4bb:abcd:4233 with SMTP id
 5b1f17b1804b1-4bbabcd428bmr31205905e9.19.1795703773893; 
 Thu, 26 Nov 2026 06:36:13 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c340df4sm47005957f8f.55.2026.11.26.06.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 06:36:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2EA235FAAB;
 Thu, 26 Nov 2026 14:36:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Zhao Liu <zhao1.liu@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-riscv@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Chao Liu <chao.liu@processmission.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH 7/8] accel/tcg: update stale comment for cpu_io_recompile
Date: Thu, 26 Nov 2026 14:36:06 +0000
Message-ID: <20261126143607.2374676-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126143607.2374676-1-alex.bennee@linaro.org>
References: <20261126143607.2374676-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

since 18a536f1f8d6 ("accel/tcg: Always require can_do_io") we always
trigger a recompile when we detect i/o mid-block. Update the comment
to reflect that.

Fixes: 18a536f1f8d6 ("accel/tcg: Always require can_do_io")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ea8257935ed..59991339620 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -566,8 +566,10 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
 
 #ifndef CONFIG_USER_ONLY
 /*
- * In deterministic execution mode, instructions doing device I/Os
- * must be at the end of the TB.
+ * Instructions doing device I/Os must happen at the end
+ * of the TB as they can change system state affecting following
+ * instructions. When we detect mid-block IO we trigger a re-compile
+ * with cflags
  *
  * Called by softmmu_template.h, with iothread mutex not held.
  */
-- 
2.47.3


