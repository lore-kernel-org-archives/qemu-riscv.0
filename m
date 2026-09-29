Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93863CA5FA1
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 03:17:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBOKx-0004ew-6o; Mon, 28 Sep 2026 23:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xBOKs-0004cp-MX
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 23:16:55 -0400
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xBOKr-0006u8-4a
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 23:16:54 -0400
Received: by mail-pj2-x2b.google.com with SMTP id
 98e67ed59e1d1-3a49902b698so73016a91.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 20:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1790651811; x=1791256611; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wQRpqb30JdS927aEFmUSHnoj4SoVnjZFUmdr6PiqntE=;
 b=OmOOnhrrVO4dRFCneSbl59C+RFH79Sw8GTnOXkB8OHJwK/L22kIoYg4trnuqy2XMYC
 9Le6CLv/bZzPsbM1UGuO0TB2ZAtxBKpZvhm8J0PFUpPusPDnkz9pYQaxJgGIq0zysZIC
 nXDAM2pU9b3uLylQ8Q92Aaj6s2aQyKrzI3QmjBY1rTix5LfT78FQLfTHEddokieiRgQF
 I2kkwP7YW3d/TDU8yWBXbLxeFFYM57Z/EPN0lhKDIhoejjYf1pCR5EHFPwFNCf8x5Lxl
 x38Wuv340rjCYT3y7x9sg5cTJhqGL3DD8l7kDhxNgrndfO0i/G3bF03gOF6Y1MGtIqYE
 ojMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790651811; x=1791256611;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wQRpqb30JdS927aEFmUSHnoj4SoVnjZFUmdr6PiqntE=;
 b=KEVQnkkuCRaHvv+SxtYEkMxCs/jnhpX5/nazCfkytN6UstL8yi4BBEiZTHIY57spTM
 U+X8Wwy4CtR9lKhWFmaSTweyzbEikT0nrP998g6ug8TGN9IUK4rxl5SCOS3VsoHOhmKX
 uNnky/+WCUytNSRyhCqkHudAZMp+X9qzkQ42aa1fLCPSk5WimKuXqyeAdGV+p4v8J6wl
 oKVlleV3w+TZS4cM5OWIuBKsBUW86tsuZPGEeMRIj6rPuzKuklquOCFD+K/PAu8Uluwy
 ED4AAK0Of5A4skxAo6ASk2xw8fZd35nYJu+WsBPlB0Q0eobd7LhQc1mvpj4RDe3sONan
 0Zbg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw50dlqaEIRInnIVxSJzXJ0L6BTm9dUXEr8dmRU+6P+4XtCmgIjFUvHjk03CSBJNddJpjeqzIjJgryo@nongnu.org
X-Gm-Message-State: AFq9FYKmW8J8xFRzX7b0glClzMO9l1o88MwwTcR8yX3/eyy5t8U13kUJ
 Py/wfQx9uevLt3sOK62kbMohRI6SrNDFYKNpTvCodtcmeidlsi9Jf32p0pu0I/VAbqE=
X-Gm-Gg: AYBFou2azXwJaIj55E7GHIZMxANcan45A3PeNmxQosoCoXb2YkN7lqz2NZbhh3o0NS0
 DAN3O8eIuZF4mMLvFz/Q3rfnbjCKFgeDwS5M0ZNMMoj3WxWYHjIckC0z5jeYjkLEKFgHsRNgS9+
 SIWh4jlS80JG56o3vvch1wRXSAoEdZO2px2g3xOOFojPr0RbxAhzC5/gzv36H5+/JOwT36YYpTN
 MadUcju7Miq6Vnk60wji4uei5XTfhuKTRJfFsMwM/xR0rD9499ZqWiYHHI9vWHBZUyBZ6uctW+O
 wNcsDo3jMWdDzTK6L/lE6C84ITlHgut7jsBjcc3yYWLOJG77EgpxSEa8aIlUWVy+2E7BVh2y0Ku
 2OiGwBVbri2A9JG7koglIaZX9VqIcdKHAyVRkD4h2qupENwBqaRcJcx5sqMmWedes1/UwZQvcSR
 OT1f1SF+Dk7uxB+iN4oFrzPR7VbQqBcBjzWocAx7abRrnhL4mm9AzpHY+PUD3pgAPv0sCogTjOj
 n53Jm/Kn8QrRaQOJUWm9EZQvwGN50J1rJI9zGbHqDMVdA0=
X-Received: by 2002:a17:90b:4c81:b0:39e:3728:3b11 with SMTP id
 98e67ed59e1d1-3a0b2507f4cmr17299719a91.3.1790651811235; 
 Mon, 28 Sep 2026 20:16:51 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a492dfc5absm1563641a91.3.2026.09.28.20.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 20:16:50 -0700 (PDT)
From: portias@oss.tenstorrent.com
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Joel Stanley <joel@jms.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/5] Improve modeling of the Atlantis UART
Date: Tue, 29 Sep 2026 13:16:39 +1000
Message-ID: <20260929031644.1016354-1-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::2b;
 envelope-from=portias@tenstorrent.com; helo=mail-pj2-x2b.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Portia Stephens <portias@oss.tenstorrent.com>

The Atlantis SoC has a DesignWare UART compatible with DW8250. Previously
the Atlantis machine had used the ns16550 UART with an unimplemented memory
region backing the DesignWare specific register space. This updates the Atlantis
model to use the now modeled DW8250.

It also adds the remaining 4 UARTs that were not originally included in the
machine along with a machine property, console. console allows the user to
which uart is being used at the console and will be mapped to the first
serial interface.

Portia Stephens (5):
  hw/char/dw8250: Fix leak when creating child device
  hw/riscv/atlantis: Use dw8250 UART model
  hw/riscv/atlantis: Add all UARTs for Atlantis SoC
  hw/riscv/atlantis: Add machine property to select default uart
  docs/atlantis: Update Atlantis UART documentation

 docs/system/riscv/tt_atlantis.rst |  17 +++-
 hw/char/dw8250.c                  |  11 ++-
 hw/riscv/Kconfig                  |   2 +-
 hw/riscv/tt_atlantis.c            | 130 ++++++++++++++++++++++--------
 include/hw/char/dw8250.h          |   3 +-
 include/hw/riscv/tt_atlantis.h    |  14 +++-
 6 files changed, 132 insertions(+), 45 deletions(-)

-- 
2.43.0


