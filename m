Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA107C02198
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 15:34:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tg3tX-0002Vt-R1; Thu, 06 Feb 2025 10:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1tg3tQ-0002SE-8t
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 10:34:17 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1tg3tO-0001F4-3Q
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 10:34:15 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38dc5764fc0so291471f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Feb 2025 07:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738856052; x=1739460852;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aN+4417yj64sAq5Mfzi8lgKD4spgoqn16QT2UJqP7ak=;
 b=GuL8sH704V6WvClEuwczeh3UnNTFW7jSbPQyXADSnQjyWw45ddgwE8VbaN8GoKON65
 ZU/jnkkXboOoNNW1Ea4VI5uvz4ZBYNpNFB7hj3dSr4fPFCjWYV3HIWHC4ficDbn2MgA/
 9yY8te0oeq5y+e3jV11mSOcin/YXoO8nfv12Uuyhg21wA9fwrSwcjNd0MppWDDgj2UCQ
 6IjvGDMUNJ6vSs4G0T75pTZYDxLA4Lyy2Ndntzr/c5POh/aLZfgOsLw4nQAFr2vMphqD
 LVP51JiuF0pDYJuRbDm5QdOfyMUONGkYJ1KsEz+zD6ieR3T5TCD6T3cFUq+9leKZpObC
 WvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738856052; x=1739460852;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aN+4417yj64sAq5Mfzi8lgKD4spgoqn16QT2UJqP7ak=;
 b=ITVClXK49ES4eELAiEF3k32mdO0ZP+liXhPtxvOC1y8fEHyR62mil9zOvVekxcXONC
 NmBhBuakhuMZvsqxhYpfNPMYadLMVwRDFvcNNdK/bUyDFNWO/N/PjkP32u58DOjnKGko
 o/OcPcXY5LiWucTuFRwweXTQrk98QgHDRGYH1h6c7VdJJglu5aJmzy9dugQF8itMKv7X
 +QvLdW0CeOAPnYcv8o0/hKFkEzMLayMZwMDxnZCYEhhNvA6zeVc2mlFfojL/gTIy9BIV
 nAWUeBJemVZ5UtoLR8OgzuZvxJoo+vbTTrmFzN6ZcvhOClLMh00ieOJAQip6lKOeRk/r
 VPaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx5MZrjqGR86086ChF19bZoqiI3k61aq+JCKRmVk8QP1ja4WIq9dn6iqYDC/GLxjET0+++8Q6ZxoPT@nongnu.org
X-Gm-Message-State: AOJu0YwLhZG1G0OvoLffnXOaOmXg4O/XUs7rcoQxyEEvSsPXMEBkXKkX
 YehCWsaU1FdwpSB6iLxDPu+c3UnQSWRVJ80JFzwQwKoWcCX235t+6t6XO7WX0VM=
X-Gm-Gg: ASbGncsdPAoyPHXRbythwDZhmis3y1lZ4B2UbcJiekGxr7bPKWkCBozk2hmQ2u+L91T
 VLY/JyLNRJXJ//6OTHt8aSikBPQtf4koQiqfR8SKxSC0/mXMpAofLRsHXJXvn4UCrcXRRkH5MgH
 R0zWKLxF/Tn+9UJnLwE/REeG8e+ZDL0L/vEFeNcfpREBgoEgk+uu5F/eLJ0U3NuztyecUpqTjOG
 WC0YjsaWgW1w5oF8CFXZc+Bbs006uMfrlBnygAw+g3tNw1jNGXDGvOrlgihMOTOmU5ctAAX9C20
 o9pMPKk5Qq2euHUOMfEb7FuEb7dIOd2wb8hJRV5qYT5AOdMd4nKfISkh2wYOSoRSw90=
X-Google-Smtp-Source: AGHT+IH/SU0aKmqTVXvQ+cZeS/9H8mZRfCBkZM0ZzmshlWRCdPmNOcRrJHFMjdIsmMuylEbuUqbB1A==
X-Received: by 2002:a05:6000:1543:b0:385:faaa:9d1d with SMTP id
 ffacd0b85a97d-38db4929c07mr6349270f8f.35.1738856051781; 
 Thu, 06 Feb 2025 07:34:11 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc45c26f2sm850516f8f.51.2025.02.06.07.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 07:34:11 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH 0/2] disas/riscv: Add missing Sdtrig CSRs
Date: Thu,  6 Feb 2025 15:34:08 +0000
Message-ID: <20250206153410.236636-1-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add missing Sdtrig CSRs per the latest RISC-V Debug specification. (+ minor
whitespace fix)

Rob Bradford (2):
  disas/riscv: Fix minor whitespace issues
  disas/riscv: Add missing Sdtrig CSRs

 disas/riscv.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
2.48.1


