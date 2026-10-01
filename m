Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063ABCA5FC1
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 03:17:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xC7Ie-0005jJ-Ah; Wed, 30 Sep 2026 23:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xC7Ib-0005iK-BB
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 23:17:33 -0400
Received: from mail-pz2-x29.google.com ([2607:f8b0:4864:3b::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xC7IZ-00076x-PZ
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 23:17:33 -0400
Received: by mail-pz2-x29.google.com with SMTP id
 41be03b00d2f7-cc7d1debf1eso157481a12.1
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 20:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1790824649; x=1791429449; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bKsUVYi5OYZXTphp2hhFJTPWUeZTpBr7eEqvss/OvMk=;
 b=WmOFADnwy8MxjycOWu9P060PV9kCJkXoVJIW21qcPSjNpR7wxlKXBuZPl0X6Hdv37B
 j3hOh2yAokUgV6IryP0p7K49ZucDZIPQ0DuxpO0ohhFZ0RBlvaSqsN7sCD2lM1NC/0Jk
 T3Ihb4F8de7s/+9eYc8ZPuhsh7nbHkdxwvWhoN9jFfvq2SoKCMLVzpbrrtJ1ePLkIjvd
 hUxjv4//hslj13GzrXOvkJ75mKKrEmIUQ/0k9VBui0MLlSaamNSYJ23pG8Slt4qVpYw2
 EJ1+GSJ32zSzOCMFA463TZGNLEcHKrPiClG1r4FQWah27pE9yIbWi72PwJ2FGzxarxTs
 R2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790824649; x=1791429449;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=bKsUVYi5OYZXTphp2hhFJTPWUeZTpBr7eEqvss/OvMk=;
 b=GZMpA2psx5BlVp1aZbgPpde7M8cf5nNZ0R6vGx2umW43UcVdR57kpw5h8vaC8X/q58
 u5kHTPP181NJnonItA2coCi15Ng7D4o3pnFWYeoGB3nqDCLhZk8+wURgtZijHF1hDAap
 +8WKfDxf/QMzOtt8SvLBn5TTFE9DcdS7dFJK0s6kJLeXENdMyhUIHJ0xieT5fNwJq1Pv
 T6wY7HGoSbhEb03jpzqAhAndY93MEKfIcj4pog6lgjg5QmivFxpxQz8YzuZ41t/kEMzh
 9GbTyJUA8WPp6Ll1p0M2mqYOy/H9UO1t0SnKLGvqHKFjKsQ/Fq5ibcGP12Ki1rwN66du
 OTRQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwLoalMnH1qwjCTZogTBkd7+2dOvPLF3VmLh/xsWRaq2OdrwpfEry3rEMJEx6LArsa75MfTZD+mW9Ps@nongnu.org
X-Gm-Message-State: AFq9FYIHLP5BTv/ciI5dA+XEjI1xZqScIRpnNr7YoSIWZvRUUeikroLu
 FYfpJm6KE4s2SXyw8QOrV3Tk7FoJhrqVNnbAMi0aipk45cx7d34/mgb0beUva4J8M+o=
X-Gm-Gg: AYBFou2zbqhd+8ThsHqGVG1VrdC2cLWErLG3+FJmYDJ3yDtjPKvprcA+LWVv9cqo+74
 mtg1J7x1b4r0mlNStEqKmEoY+sICHjCqraQ47wxBKsicPpMWrE5gnbTAmkoYg7y2zND+jmiLnpQ
 I4dNuVxgBzwJXWM0LeZ9oM84RVggyfyBm/IPnQI4F8E1zNqYTPiG4Ak5ziN1ppL7GBef2XZ88HU
 tiFY4v1zLN+KL92oog2ExbjsT/u5WqvTRF98/rJg2W4gAwp2eZ2yGITsHUqf5qzVTujiDHhVunY
 5oBLU2MOqPsjek5qSkvOntcgM6UXIHYOZo5JzqP28URqofIK8bIrENUkYe0fAhfAAaHOIlS13jz
 5BQnKeIP241ybHyb9XLbstaaodlG/n1028erSw64/0AKczQ0ILfYUgllKhdz0qmoeks0obt9q8z
 hXbyKR6k/9i+UCpRcwknYjQSxeAjVBJ6+jlAodGipJRurjWRHsT9YsfeICZOW/GIopqVwtV/sLv
 zWCn8m6UzGn585VcoUe776Vvu61vRgqBTNRJDLjDtS1Nmg=
X-Received: by 2002:a17:90b:134c:b0:3a0:45f7:b361 with SMTP id
 98e67ed59e1d1-3a4d178a7aemr4771916a91.3.1790824648689; 
 Wed, 30 Sep 2026 20:17:28 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a4f43f833asm2255552a91.6.2026.09.30.20.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 20:17:28 -0700 (PDT)
From: 'Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Chao Liu <chao.liu@processmission.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>
Subject: [PATCH v2 0/4] Improve modeling of the Atlantis UART
Date: Thu,  1 Oct 2026 13:17:16 +1000
Message-ID: <20261001031720.2334056-1-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::29;
 envelope-from=portias@tenstorrent.com; helo=mail-pz2-x29.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

From: Portia Stephens <portias@oss.tenstorrent.com>

The Atlantis SoC has a DesignWare UART compatible with DW8250. Previously
the Atlantis machine had used the ns16550 UART with an unimplemented memory
region backing the DesignWare specific register space. This updates the Atlantis
model to use the now modeled DW8250.

It also adds the remaining 4 UARTs that were not originally included in the
machine along with a machine property, console. console allows the user to
which uart is being used at the console and will be mapped to the first
serial interface.

Changes from v1:
- Drop DW8250 fix, to be squashed into original patch which is not applied yet.
- Use qemu_fdt_setprop_string_array for creating compatible string
- Change machine property,console, from string to uint32 and set default value.
- Documentation fixes

Portia Stephens (4):
  hw/riscv/atlantis: Use dw8250 UART model
  hw/riscv/atlantis: Add all UARTs for Atlantis SoC
  hw/riscv/atlantis: Add machine property to select default uart
  docs/atlantis: Update Atlantis UART documentation

 docs/system/riscv/tt_atlantis.rst |  19 ++++-
 hw/riscv/Kconfig                  |   2 +-
 hw/riscv/tt_atlantis.c            | 133 ++++++++++++++++++++++--------
 include/hw/riscv/tt_atlantis.h    |  14 +++-
 4 files changed, 128 insertions(+), 40 deletions(-)

-- 
2.43.0


