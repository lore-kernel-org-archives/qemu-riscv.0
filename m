Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5B6CA0EEB
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:03:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1upTHL-00025J-GY; Fri, 22 Aug 2025 11:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGk-0001ku-1I
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:01:30 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGV-000506-3h
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:01:27 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b472da8ff0eso1458077a12.3
 for <qemu-riscv@nongnu.org>; Fri, 22 Aug 2025 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874871; x=1756479671; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOVnisglo5jzNI/INr1+W/vKqDDJp3WOe2RoZiFusOw=;
 b=LX4Jq8G/URrRA4zxuMDed21XxvKKKHCv1Cevk1thilAkoSxpuKYcHlw2eyRPZ9HcPG
 xaUapCAorHZb7WZaMbQ+/WYnc1yzQrggs3Et2/V5uB0qX46vgZ2q5GrStXFOoX/6CKUJ
 xWsuLBQNa3oQTP/Pjqbuv/+R6DwQ83GfOJzq9scQzSxd3orKqktN4jLm+IKtjuLEoiEg
 n51/fWgWXs5zngu2vmcgZRUKwHxKmqDwATiBAeWx6KuEp7fZJkjRnBZwMpopYNvV3Qyu
 d8iUot/mmYIa/W1OjIv6ZpNu8s6/iduCNO9or4i+S85HxhOKzOhc6baLNJ0Lbh5r66U1
 x3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874871; x=1756479671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOVnisglo5jzNI/INr1+W/vKqDDJp3WOe2RoZiFusOw=;
 b=YAvUWPhGItxJ+z9RkePBG77WzeqSXUWlW1VwGBaBMRc+KU6WbFg0fOSP/yFzVrgDQc
 j0Z+QnCD/9iIBRI7GKpkz0KnAuIrzMgMfscUcUOiUJvvZkx5JHcLWUpdBEoizR9Ox9Vm
 WOJHRCBNLrRcMNdi37mQZWxZkyZuOc3PGoP2gSIoaVT4F45/mxLih5dWbA3tvOeFufIP
 Eo6bYiBCSTkEnAEgyx+CdMgkQYtuIwjg0AwO3Boy08Cf2mB2p7Vy8roMQ+CXNwUJoUMv
 vP/U/RWMyzUQUtDwmClY2GPKj5lPz0qubYmKkrP1eempRmwojI/1AfrXlRghHrszqPxr
 Urxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIuIheZWvKzE9p3jUHb2hbrBYQnysI54uf1ZhRSHzhjrq0ufGRn7ACJJQIXBSbc2nDfLqnzzeoXejz@nongnu.org
X-Gm-Message-State: AOJu0YzbxM6Wuux4uZOKw3NHm1z1PHMW1QqzSHEX/LIBWUBcFZm4qX6W
 avuax3VMj7mnR0uMKjasN41I8kFZsL4ArWpjnyDv/FH9CI/13JHOjF+NbU7boKrEduQ=
X-Gm-Gg: ASbGncvbs2jAvyZexHJAydA4KaMAmXMpyaJU3gk0L3zdOK1Cxfqtd9H1/agKjPa676N
 QNo936812NSjIxMxyEoUKxAO0PlmMKfZyqlVvp1UD/FGEdERDGXtt0eW3/7eXaT5bPxEkN9ZlT6
 F/SI38JrvTzDDuE/hgA/KcLpk1rpueLXBz7U/V2x8oc9DT8P1+vwkkVdyrvoDe3mEBZWikj8wT5
 k6QXaXrsrlp+FLGs08/HDN0hu/CzcCVJ8IhI26alFHTXKFP3yr71OLlIOY3M374k6/bDp/M4msw
 bwFuXF5lQf9Zj1ACJwavVwIM1uccP+YhKpL0g0khRhHBER6lXVz8GBKlowBzy9XyNrjnM/69yOJ
 vMP8bQqZwg1wKVaoaDTwlvLt1yPLGvX+ee1Mll1+swmE=
X-Google-Smtp-Source: AGHT+IHG9SrUtbT4bltQf5ip7UYhwh2l2YL9y9U7JzczYp5hwsJvwbBP2bBw9V4Nqpj+yfm9QJrI+Q==
X-Received: by 2002:a17:902:e84f:b0:246:648f:80a3 with SMTP id
 d9443c01a7336-246648f8493mr3259795ad.50.1755874870919; 
 Fri, 22 Aug 2025 08:01:10 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:10 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 05/12] target/riscv/common-semi-target: remove
 sizeof(target_ulong)
Date: Fri, 22 Aug 2025 08:00:51 -0700
Message-ID: <20250822150058.18692-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52c.google.com
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

Only riscv64 extends SYS_EXIT, similar to aarch64.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/riscv/common-semi-target.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
index ba40e794dcc..7e6ea8da02c 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.h
@@ -25,16 +25,16 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
     env->gpr[xA0] = ret;
 }
 
-static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
-{
-    return sizeof(target_ulong) == 8;
-}
-
 static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return riscv_cpu_mxl(env) != MXL_RV32;
 }
 
+static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
+{
+    return is_64bit_semihosting(cpu_env(cs));
+}
+
 static inline target_ulong common_semi_stack_bottom(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
-- 
2.47.2


