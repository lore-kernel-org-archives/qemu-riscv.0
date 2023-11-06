Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10EBC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:25:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxRT-0002G7-TQ; Mon, 06 Nov 2023 06:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxQw-0001Zg-VX
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:06:19 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxQe-0004N4-V3
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:06:05 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4083f61312eso33513655e9.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268759; x=1699873559; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WdevyuV5vDNMMgKGndHL1Lb3pKI2mM3BGOnKiVXcZMA=;
 b=n3lXasjQ9MspPMWhijtRr4yhgrqcXudFV+laNDcjzm6qh2crncIb9f+EJ/kuD4ysZm
 lh6s1TCnhg7o6kEpnYmMu6NtyWeV92AwDVMlyUuyt/9rTZjnSpivQeSL53GjwtHk4OJ/
 w6rKCxxoZqZZAUZsO7TBsF+HL5ZslLAiXHLkJuh9Oq04jPQbzfyXkCZrUFsJ8LD+T4Vt
 eAIZ76tWpwd6o3tV7JYmP1F58AgdV9CI+YfST+2ODpcL9j9gyNu5/fyy+Wbm4Su2noTv
 rG/frpzoMandao0+A3GXnecPths2LqPBno3N1/fkOfLFJ+JleIHjkT8hkBrFcHk2TjUO
 aKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268759; x=1699873559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WdevyuV5vDNMMgKGndHL1Lb3pKI2mM3BGOnKiVXcZMA=;
 b=jpkBWDY+Cc523I5EUo96prOg5wUQgyKHLFSoH4u9ESarbQw6x4AOPl0bDfOvnCpGYM
 Uq7EFuO60LZlHmW5RFvPHZEhBlSB/0fOwSXKGqVaRYV+WNHXDekyJaQGn8kv8Zy+TyKw
 s47tGONgnxn5puKX9qhbx86MzCXmviRdtx5Z99d38/5snOvDrXys/WihrP0gaV504YpH
 T9idpt7fr02k/5603hap4U62RqSJSLEjui1P4kfZVj4kjDUnvd/OYMX8D9hw6I0rKTdn
 0wKEdfVdtD9pqOLfeuJD90UX9kvtlLic9XmWD1y75MmhPVsruvk/p704kXBqqavVMRgh
 TPNw==
X-Gm-Message-State: AOJu0Yy4B/2E51hCLZ3+A1yPnrAo+stsJ6+vg7l731N5NRTgdaOgkgC0
 6Neja7WeAEtgDY6uUIW88Ob7uQ==
X-Google-Smtp-Source: AGHT+IHx5XXxhtGZu6ZCbciI1JQ5kvGzt8XZDokYAdmWLiQ+Wf2MWQYdjQaCgeHE7cevbJyqEkuPhw==
X-Received: by 2002:a05:600c:1c9a:b0:401:d803:6243 with SMTP id
 k26-20020a05600c1c9a00b00401d8036243mr25577656wms.32.1699268759004; 
 Mon, 06 Nov 2023 03:05:59 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b00406443c8b4fsm11744176wmo.19.2023.11.06.03.05.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:05:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PULL 20/60] target/riscv: Use env_archcpu() in [check_]nanbox()
Date: Mon,  6 Nov 2023 12:02:52 +0100
Message-ID: <20231106110336.358-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When CPUArchState* is available (here CPURISCVState*), we
can use the fast env_archcpu() macro to get ArchCPU* (here
RISCVCPU*). The QOM cast RISCV_CPU() macro will be slower
when building with --enable-qom-cast-debug.

Inspired-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20231009110239.66778-3-philmd@linaro.org>
---
 target/riscv/internals.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b5f823c7ec..8239ae83cc 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -87,7 +87,7 @@ enum {
 static inline uint64_t nanbox_s(CPURISCVState *env, float32 f)
 {
     /* the value is sign-extended instead of NaN-boxing for zfinx */
-    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+    if (env_archcpu(env)->cfg.ext_zfinx) {
         return (int32_t)f;
     } else {
         return f | MAKE_64BIT_MASK(32, 32);
@@ -97,7 +97,7 @@ static inline uint64_t nanbox_s(CPURISCVState *env, float32 f)
 static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
 {
     /* Disable NaN-boxing check when enable zfinx */
-    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+    if (env_archcpu(env)->cfg.ext_zfinx) {
         return (uint32_t)f;
     }
 
@@ -113,7 +113,7 @@ static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
 static inline uint64_t nanbox_h(CPURISCVState *env, float16 f)
 {
     /* the value is sign-extended instead of NaN-boxing for zfinx */
-    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+    if (env_archcpu(env)->cfg.ext_zfinx) {
         return (int16_t)f;
     } else {
         return f | MAKE_64BIT_MASK(16, 48);
@@ -123,7 +123,7 @@ static inline uint64_t nanbox_h(CPURISCVState *env, float16 f)
 static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
 {
     /* Disable nanbox check when enable zfinx */
-    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+    if (env_archcpu(env)->cfg.ext_zfinx) {
         return (uint16_t)f;
     }
 
-- 
2.41.0


