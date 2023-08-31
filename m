Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375FDC83F32
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:16:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhLK-00088v-Bh; Thu, 31 Aug 2023 09:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHa-0005wZ-BW
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHY-0006aG-0D
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso620870f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486818; x=1694091618; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P4pW4nemJPjYVIP0e99/LIoCEfzLbBmEnwZT8fz868s=;
 b=hJ6sI9/4HSDKBSTO16wg0rTnjWmvUVNfisH6ktdhT9Gh/G+aUqG9kc3uGqnchdfel5
 HBoK547xNHslLv8Unw+u66bczl0KmhJi1jBxgzk1OOsvQGpfI61TyL6fbrbfflnyhybh
 4aLnVWajOQD3CsdVKoSk62yVfqHM1zPZd3r1D5apTRilU74f+pUftO3sfXSpUxVjNWdR
 HvxZ2Jv8CwTxkgW+TEW6/EABeHm3EauG0vZTZmH/GS4POwRSbSORDM3MbOo+VriES+BD
 M38q93MwaWw3JKXv/sJujxWXxUqDmx542S0/IHxyD2tf/LAU8BcBXMSmHNjb23dbTUmT
 XN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486818; x=1694091618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P4pW4nemJPjYVIP0e99/LIoCEfzLbBmEnwZT8fz868s=;
 b=TJSxzmNHcMNDXySeK13GNvV1/loMJreLq334fGpeS6G6N9oufCrYNY/bKD/9JNdhLF
 oItJjz/F3i0bAhNZI266PA7avJ+CzpWm/ApiDgKqME5f940GuSCyYRBM7KWjqbFl5DUe
 g6KirVOcOye3xamw935+IqnpPHSzwvIB3rKn8hTjXNjjIXYl4mvTCy25TP5IBA/UEJOE
 qTSSN6P+oSgyz/yDPUxMbIOVp0bzth7szMDje1cSN+chMEDoMsg4lxncUPA2fRbTsO6q
 RGbir7rG8BfRpthfHUQpP87tz/YDx+yHjh6Ne61b29sSpD5rYmmU0D/Al1GeVSeJ8nUk
 ch8w==
X-Gm-Message-State: AOJu0YwffpNhCt5VtGd4I3j4C1FZwDIkCJfj5xGH0a2dtL62QE5c4sMl
 fuucf3aboR+P/ECPWw2Xyz+5Hw==
X-Google-Smtp-Source: AGHT+IHMRgh4uEGvXy36inVdMqMO2SdZ0cczkAdfEZ5cpCBkqfsNCWZjiOdku26vSaBEojoinu+cbg==
X-Received: by 2002:a5d:6884:0:b0:317:5747:b955 with SMTP id
 h4-20020a5d6884000000b003175747b955mr3642041wru.17.1693486818448; 
 Thu, 31 Aug 2023 06:00:18 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 c17-20020adfe711000000b0031773a8e5c4sm2141968wrm.37.2023.08.31.06.00.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 06:00:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 35/41] util/fifo8: Fix typo in fifo8_push_all() description
Date: Thu, 31 Aug 2023 14:56:37 +0200
Message-ID: <20230831125646.67855-36-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230522153144.30610-2-philmd@linaro.org>
---
 include/qemu/fifo8.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
index 28bf2cee57..16be02f361 100644
--- a/include/qemu/fifo8.h
+++ b/include/qemu/fifo8.h
@@ -46,7 +46,7 @@ void fifo8_push(Fifo8 *fifo, uint8_t data);
  * fifo8_push_all:
  * @fifo: FIFO to push to
  * @data: data to push
- * @size: number of bytes to push
+ * @num: number of bytes to push
  *
  * Push a byte array to the FIFO. Behaviour is undefined if the FIFO is full.
  * Clients are responsible for checking the space left in the FIFO using
-- 
2.41.0


