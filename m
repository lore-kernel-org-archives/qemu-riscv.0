Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2F5C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:10:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxRw-0003mG-4x; Mon, 06 Nov 2023 06:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxRh-0002zG-7d
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:07:07 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxRX-0004Y3-4O
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:07:04 -0500
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c509d5ab43so62467791fa.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268812; x=1699873612; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6pej+XFgeNy8hwy7UMk7tmyBIA+j/BAJUFV7Aiq4os=;
 b=BF/h/iH5toYq6bgJK2C9cjSw9pTCx7hrQEt9nxL3J8TaoAEpOol1ecp+8WN4bFsmJ4
 q3KIJEG/SdfTtGuKzhKpvy4YPcdeF9Nt28L8UDdbE8Is8GiCPwWZWsDUgn29r7cwaKxN
 MpJEnaV+G8zgZS8GFX+EXpeY6rSt0D5oNrTjGOw92Y6t6oJvldyINIHZY0F4jjdZArRK
 BUgKmuqC9F/S7qjZNkeOY2FjHQ9wMhxI+PkdX5I4clObXoyIwemE92m+ywm+IqyvPwVK
 oe42Rl0A5opalJPXZdW3am0MtjbWU637zrfgofZ+uWLIeYYPpjV2tzcZ15I8EIIiv1T/
 SfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268812; x=1699873612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6pej+XFgeNy8hwy7UMk7tmyBIA+j/BAJUFV7Aiq4os=;
 b=jbOhL3qKy1PdSrWIPc5GMfxOfM6Mod0m316gRWnCL2XkAgr5eBFjmGwg/gprlIRGgM
 03DmUkEra6JVfeb8mcKyLGG/nohS47iWdFW9X6cIirXP4hfBglNQX9mJTl9ZxYsMEM/9
 qtkRlQkhWBAudxcNZynZdfComO+vcvNMBjuvq0IUGufVOBR5oFUOoNSVaFcNh0B9cU+W
 WtdQGSJ/AptK05ELA9WtGjINMUmeADb3vzEo3R+Or8yiFp7XgYz0yCxsTpB/iAYZANj0
 UyT/uaUKnYnZF7coAc1cvel3A1XCiSfrYz/dc03hWnKqEMZYqeVvDm6R3VjekjYcvn43
 om3w==
X-Gm-Message-State: AOJu0YzOZ3DmAjUUF1oo9QchEODjHDVkBglBCvuZOrQw/1PF/PZvAK2Y
 yS3wGLOHzvxGSd78EMVD4j8WEQ==
X-Google-Smtp-Source: AGHT+IH9cDYwLDc1MRsfDAEGSPwPoLCFIf+s8baeSOuvBOTKWXUgUmhGOWDpYJxS4pQKbqZtqaKfYw==
X-Received: by 2002:a05:651c:200c:b0:2c5:2d7:412 with SMTP id
 s12-20020a05651c200c00b002c502d70412mr18916048ljo.19.1699268812592; 
 Mon, 06 Nov 2023 03:06:52 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b003fefaf299b6sm11914693wmo.38.2023.11.06.03.06.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:06:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PULL 28/60] target/i386/kvm: Correct comment in kvm_cpu_realize()
Date: Mon,  6 Nov 2023 12:03:00 +0100
Message-ID: <20231106110336.358-29-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230918160257.30127-4-philmd@linaro.org>
---
 target/i386/kvm/kvm-cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 56c72f3c45..9c791b7b05 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -37,6 +37,7 @@ static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
      *  -> cpu_exec_realizefn():
      *            -> accel_cpu_common_realize()
      *               kvm_cpu_realizefn() -> host_cpu_realizefn()
+     *  -> cpu_common_realizefn()
      *  -> check/update ucode_rev, phys_bits, mwait
      */
     if (cpu->max_features) {
-- 
2.41.0


