Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBCFC02192
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 14:50:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1texlR-0000sh-8e; Mon, 03 Feb 2025 09:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texlK-0000pF-HQ
 for qemu-riscv@nongnu.org; Mon, 03 Feb 2025 09:49:23 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texlH-0003H9-Jf
 for qemu-riscv@nongnu.org; Mon, 03 Feb 2025 09:49:22 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso920536366b.3
 for <qemu-riscv@nongnu.org>; Mon, 03 Feb 2025 06:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738594147; x=1739198947; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYLUPD3P/9Yhc9T5gc39GsuYcITC/cYJ3+WE96RAZnc=;
 b=ZJmmiEU2YwO8sK8ZLu2i4XWkVHGOwJjSYb/KkJBq0O8xhynSIjoJFsOP5ZT/LwXx/Y
 htZnbgWh4HjGGwu52JTSk9gNHm/c6nFc0xd6G2Ben1p6bJ4fp2w+L/IKQiMZLgvrJG+j
 T7gSlaJ8WAbB9U29hKGg9tlh4bw9MQvAslEna7eBWi+nNLIRxu5dbPPwMOUyX7c+8S8B
 zDe2qocimYGbfvw5F0ld3Inw5OFQ0cv1UpAh4P3Y1F6CRo8bapurCVx4vydseGZfvjno
 3DI4hghj69rNW8Uz257xo9Q0nNR966dv7hKz2+9iOWPx44LOoVR3VjZmI78Hk+TL2AKw
 B6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738594147; x=1739198947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BYLUPD3P/9Yhc9T5gc39GsuYcITC/cYJ3+WE96RAZnc=;
 b=RfTiXmAbjJkjJL6duXDBduYkpCUtEdROQkFD8JdzYdmMiyz7Tex2xrbvlAKPo5Tj8v
 HEiVfjXOeTGaYIr3k0Uy3rYUlXRZ4sWuwcdSTyUr9gFb0W+aPsvxpnszQNnytUIEFJ3T
 nnbI/Ix3YTOxmQmARTnDBPj6nzk+Q2Huz3BFlSjVdX9Ye9QEpy8HCSBLCLcWKdn53RkR
 xEl8PF6Z02/A54Ooh86qxMjvQNe26hwilTS0x7JaarOk3HXyc4PUsEcGDdkNJfE5avMu
 +omBeN7y8bUTZeUTLhpCp2O3mZ4kdeJXThF+LfNpZibceT+j0ILL/wGT7SovzAX6EWyH
 h0Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCp3QKj+K5D639XdGdT2I+jY6Bmt+7jLo8DfJsA2cmMKwZl4GJuuso/mm8+uv+SmhlMlz5X/GDHKWx@nongnu.org
X-Gm-Message-State: AOJu0Yx7KUqeZc1QHPJV0Wkx09S76K92Z/N9xw1QPNPX9OBdfFHNMhK2
 eGMqZJweBGANY2pQn1yJ3N7/SzrTzcElktFAJeFw4ztBnyN7Wil7nqN/lhBi58s=
X-Gm-Gg: ASbGncufbasKO+u5rAjDd/Av26cgl/REY7wmvwgbW4KxA1f0NJqGBsK00ns1YElybGl
 KjySM+7F5Z1xpnoPdQVzzOLboWG8LIadRTv6uYoQQ1U2sVNa4iC0/c9WT1le8jACFVPfEA+J9sa
 PyhnYGXMfTrJfM9c+NbCnY86TdBhFTH4hr8MsLlMSNjvxRF0rDwmjMLsFTc8lPHRlIZx4EBgilv
 BL8LNyWCzIlfCKbg3j90GJfop7jbiykACZkDYCBJ7mhk2fXQQXm/GFkiXCAA+rIxoCqlrgkdVrN
 0/mqscB6SzNOkJq3pA==
X-Google-Smtp-Source: AGHT+IHgsx6VegpQf/B5RuOCVkQFxqV47V8mc1V6eFUOyK0LWGPsQGdoL7+XE026OxIOUgxH9LTjpw==
X-Received: by 2002:a17:907:72c1:b0:aa6:ab70:4a78 with SMTP id
 a640c23a62f3a-ab6cfda4254mr2919815166b.37.1738594147146; 
 Mon, 03 Feb 2025 06:49:07 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab71166a8e0sm404508566b.158.2025.02.03.06.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:49:06 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4D79B60C3D;
 Mon,  3 Feb 2025 14:40:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-rust@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 16/18] docs/user: Document the %d placeholder and suspend=n
 QEMU_GDB features
Date: Mon,  3 Feb 2025 14:40:46 +0000
Message-Id: <20250203144048.2131117-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20250117001542.8290-8-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/user/main.rst | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/docs/user/main.rst b/docs/user/main.rst
index 80a77f0a0c..9a1c60448c 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -54,7 +54,7 @@ Command line options
 
 ::
 
-   qemu-i386 [-h] [-d] [-L path] [-s size] [-cpu model] [-g port] [-B offset] [-R size] program [arguments...]
+   qemu-i386 [-h] [-d] [-L path] [-s size] [-cpu model] [-g endpoint] [-B offset] [-R size] program [arguments...]
 
 ``-h``
    Print the help
@@ -91,8 +91,18 @@ Debug options:
    Activate logging of the specified items (use '-d help' for a list of
    log items)
 
-``-g port``
-   Wait gdb connection to port
+``-g endpoint``
+   Wait gdb connection to a port (e.g., ``1234``) or a unix socket (e.g.,
+   ``/tmp/qemu.sock``).
+
+   If a unix socket path contains single ``%d`` placeholder (e.g.,
+   ``/tmp/qemu-%d.sock``), it is replaced by the emulator PID, which is useful
+   when passing this option via the ``QEMU_GDB`` environment variable to a
+   multi-process application.
+
+   If the endpoint address is followed by ``,suspend=n`` (e.g.,
+   ``1234,suspend=n``), then the emulated program starts without waiting for a
+   connection, which can be established at any later point in time.
 
 ``-one-insn-per-tb``
    Run the emulation with one guest instruction per translation block.
-- 
2.39.5


