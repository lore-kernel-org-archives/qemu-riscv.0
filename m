Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD39C47DAF
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:37:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQn9e-0001T3-Dz; Fri, 19 Jan 2024 06:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9d-0001Sb-7k
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:35:21 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9b-0007Tn-DV
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:35:20 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e9ffab5f2so2526195e9.1
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664118; x=1706268918; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQOkcaUpM1nuG7GogvbsKjXDm4q63jaSl49eYjwL8qs=;
 b=TWWaWAaFUL/aJWTt2pX0vHl/EAjgfFf/ZhlhNBPPGpTtwOXQYfmXs5CY6UTkdcZQgZ
 N5fY4OFJ4vbSdgyqeelKLwBh4td2D8GIvVgJZXBo1tQVprjg07ujGhfagYijBKH0sIlA
 PnDlBAWIu7obPRS4Kr1sTmhKQIsaDo1J1L533oIuSR3ZjbCIzK8LJxTrywZalMl7i+A6
 P2iZFmf9AyeXxtM8BAqG9JP303E/DCMDGEBRysE1DNveUiaPgJMaFBa/CVi3EW55N+G6
 b7BfOdU1g2dpGsBVKGVPlgb+ZtdHmRKKMXxNjYbPEUVx6yMEnj21I+0fgpKeWD0a5a1C
 FBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664118; x=1706268918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aQOkcaUpM1nuG7GogvbsKjXDm4q63jaSl49eYjwL8qs=;
 b=G2KMTVnqvHV/hWaaFB5kRFn/eYaSYggRri0YtCEaCZA6eEMxNE6BJFjGXk95524xFn
 +sQ3YmAvPIjT9+18CopN609d7VZeYB4Qv0G3ntcYVW2B1f1enaeJQ/JXa5bHML/gb520
 qV9ZaPON4XecJ3AAad/NXRvalb2qQwZbKVIxrLl3rX45SIMY7AhdJF7Ls4f5515rs3pv
 fih65mjAE8kQnamhNxkb9AjUlw9mIwRYrqjpBWw1jXwL82c5BD63YsqbNH0AZ9JjiQJB
 cpbsSmy+6qPXhbjeFIc0BTLlMoOY1HpxtFjWDy8iJ6N2EWzZB6aPwkJ+p8b91t4AhmAQ
 8OxQ==
X-Gm-Message-State: AOJu0YxXwfKuPpG2E9oMoreZom926gOCiNzZh2rjPIyPPO7kLXXp/lgm
 KGOgAs0it8Zq2i01cg8kwKJSkIrW6YJPtVPl409ZKdwx7O9q49vcn0F0XdWq8Ps=
X-Google-Smtp-Source: AGHT+IGUJtyGRx6RHOnp0YKsPGLwW1Z+KK30gL/lthBBtFqsUOrDrho62tbq3d6yLmt9SXkT2my7Rg==
X-Received: by 2002:a05:600c:3317:b0:40d:7c42:5de9 with SMTP id
 q23-20020a05600c331700b0040d7c425de9mr1478936wmp.126.1705664118017; 
 Fri, 19 Jan 2024 03:35:18 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 m26-20020a05600c3b1a00b0040e4c1dade4sm33037802wms.36.2024.01.19.03.35.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>,
 Gonglei <arei.gonglei@huawei.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PULL 02/36] backends/cryptodev: Do not ignore throttle/backends
 Errors
Date: Fri, 19 Jan 2024 12:34:31 +0100
Message-ID: <20240119113507.31951-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Both cryptodev_backend_set_throttle() and CryptoDevBackendClass::init()
can set their Error** argument. Do not ignore them, return early
on failure. Without that, running into another failure trips
error_setv()'s assertion. Use the ERRP_GUARD() macro as suggested
in commit ae7c80a7bd ("error: New macro ERRP_GUARD()").

Cc: qemu-stable@nongnu.org
Fixes: e7a775fd9f ("cryptodev: Account statistics")
Fixes: 2580b452ff ("cryptodev: support QoS")
Reviewed-by: zhenwei pi <pizhenwei@bytedance.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231120150418.93443-1-philmd@linaro.org>
---
 backends/cryptodev.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index e5006bd215..fff89fd62a 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -398,6 +398,7 @@ static void cryptodev_backend_set_ops(Object *obj, Visitor *v,
 static void
 cryptodev_backend_complete(UserCreatable *uc, Error **errp)
 {
+    ERRP_GUARD();
     CryptoDevBackend *backend = CRYPTODEV_BACKEND(uc);
     CryptoDevBackendClass *bc = CRYPTODEV_BACKEND_GET_CLASS(uc);
     uint32_t services;
@@ -406,11 +407,20 @@ cryptodev_backend_complete(UserCreatable *uc, Error **errp)
     QTAILQ_INIT(&backend->opinfos);
     value = backend->tc.buckets[THROTTLE_OPS_TOTAL].avg;
     cryptodev_backend_set_throttle(backend, THROTTLE_OPS_TOTAL, value, errp);
+    if (*errp) {
+        return;
+    }
     value = backend->tc.buckets[THROTTLE_BPS_TOTAL].avg;
     cryptodev_backend_set_throttle(backend, THROTTLE_BPS_TOTAL, value, errp);
+    if (*errp) {
+        return;
+    }
 
     if (bc->init) {
         bc->init(backend, errp);
+        if (*errp) {
+            return;
+        }
     }
 
     services = backend->conf.crypto_services;
-- 
2.41.0


