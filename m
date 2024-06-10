Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F84FC27C55
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 14:58:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sGgTQ-00087d-JB; Mon, 10 Jun 2024 10:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sGgTO-00087O-RS
 for qemu-riscv@nongnu.org; Mon, 10 Jun 2024 10:58:14 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sGgTM-0004Sp-VP
 for qemu-riscv@nongnu.org; Mon, 10 Jun 2024 10:58:14 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a6f13dddf7eso184185766b.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Jun 2024 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718031491; x=1718636291; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o8eaNBimhix7LgmChDvOxshj4kJu/rpPBQQkKpgcBpQ=;
 b=mfZbGdkf2VtpeFwzUPDDv00cOBWs7xw8XN0sQj3JCdMOJnDNPzPKHnnXvPpV8Gl2rK
 obzUvbX0UQnz5Ins9q0ek5JSjaEjcEE3Rfd+vEBUpg/g7QLa0Dpinb3QNP3s835K5Cl8
 z5hHAeEVxpTV7GN+9S6Zz6ZLl2jx+dBYmo+yDAtCdJkDXdoFTtpYezTU1MkPw8qwh3sW
 INrh7vbpD8jXx+bPzmGPXKkUfQyNa2lwSICcA9pRLYEw6X1aqAq6taepWVWIt5wolfgB
 w9Q+rgFBOh2xa9WtZqIweAp66VQLkHtW7CJUUh79UJypc9lPQBdCbXVQh/PKFvLu5Xgf
 qzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718031491; x=1718636291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o8eaNBimhix7LgmChDvOxshj4kJu/rpPBQQkKpgcBpQ=;
 b=g1f8QXtUsBiCoHhNOcLC5lJ0cpeOreNXutpjoB7MnD7gW6Fo2c1o7jLxIy75CgD6Ww
 lNxFpKStrqSK1pyIqvZvaKcw0LhFKb5WWBp6IR63nmR+py2Q2NwB+LLrd5hukDC5HKIH
 DFRY5HUTG0FCht6Scy9uhWQIusTyp0XpQe+ItyPTcHpuYwcFaojSHWTmgNxHyD4TD+22
 L1ceY+lhfFOgTw5BmnF7TcpeR5yoIZkYb4EaPWVZUYw1z29dIzn7D09gaXSZUOMq5IYM
 II/En4PBRsjqw3ePmka0Yx92a42flYXc35m+lcIifv++Had2dBuGXW9WDBAFdtms9CxJ
 LYtw==
X-Gm-Message-State: AOJu0Yy69OlLlaaFErZAZ5/MBxVVB0wvgd/Nl4acfddpCl2lq3o5mlab
 9d5jQ51IOFPEptBw6sv/DreEJsQarZ/+TPdXOGAmN7HeDLX6xAELKbFq0//IScU=
X-Google-Smtp-Source: AGHT+IHDW2tdip6DUSf9t9yqt+PbwfdDtEHN3KO20tpNQ0iFK+SYqIr5W8frVxAAdRNLCv2WWtxsWg==
X-Received: by 2002:a17:906:5612:b0:a6f:28f8:795b with SMTP id
 a640c23a62f3a-a6f28f87ab3mr92127366b.45.1718031491139; 
 Mon, 10 Jun 2024 07:58:11 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.129.242])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efcf350e0sm373840766b.156.2024.06.10.07.58.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Jun 2024 07:58:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/5] semihosting: Restrict to TCG
Date: Mon, 10 Jun 2024 16:58:02 +0200
Message-ID: <20240610145808.2267-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
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

v3: Address Anton's comment
v2: Address Paolo's comment

Semihosting currently uses the TCG probe_access API,
so it is pointless to have it in the binary when TCG
isn't.

It could be implemented for other accelerators, but
work need to be done. Meanwhile, do not enable it
unless TCG is available.

Philippe Mathieu-Daudé (5):
  target/m68k: Restrict semihosting to TCG
  target/xtensa: Restrict semihosting to TCG
  target/mips: Restrict semihosting to TCG
  target/riscv: Restrict semihosting to TCG
  semihosting: Restrict to TCG

 semihosting/Kconfig   | 1 +
 target/m68k/Kconfig   | 2 +-
 target/mips/Kconfig   | 2 +-
 target/riscv/Kconfig  | 4 ++--
 target/xtensa/Kconfig | 2 +-
 5 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.41.0


