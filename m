Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE88C54E41
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 09:58:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rho1o-0002LT-1d; Wed, 06 Mar 2024 04:57:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1rho1m-0002KM-Qq
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 04:57:34 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1rho1l-0001zk-6B
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 04:57:34 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6e5a50d91b4so6451218b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 06 Mar 2024 01:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709719051; x=1710323851; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PsBQg45BkXspEsYBv9d108aazg1BmT0cKfU3Y12d4ng=;
 b=lCAjSVUVe0KdmQF0oTbDJZLPl/+iuM2jZmlauZebnXnttKziC7SzUXQavqXXp7Ox9J
 Nma3tvgUty7L7GkT6yPcDpxAF3TI+8SzIV/eL5cz+d1Xv4SL0V21EgzZojtrixjqFXcY
 s2Oyq/HVe5LXsjJWAhdgfgcVJ8JbVPCpU1U2cWQ5N/Ai8gySuzOXCSbCkhbEnKK29sqX
 el5pQGqwSFfdqVWqocPDXTFwFGBehyXJiBMNTO+1CxXvZEusydlfWCXLirIHN5VVuMrk
 ExL+Xr/KCnWLskeZAtFzkAUL6m5tAMoWU+PPWYl6v+4JjZwFHHWm5KcYVs/RlaJtcIe/
 O26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709719051; x=1710323851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PsBQg45BkXspEsYBv9d108aazg1BmT0cKfU3Y12d4ng=;
 b=bU0GPqUvgvJ3eNykzSkGSf40EiI4YbD7XHPuL9B1VcAN5tMo2w3rVrPv4ZoPiGCKCL
 Ygn9JTujAqya4viX4o7BKdNOn6AoyScAnHVxDQ1uLW5622EtFD9y+dKPss3R7bzQMqGa
 o7eEyuz9BP9a/kGHWkkCvqYBbO1EZU/9AMJ43adPf4/ETs6HaCY5ONRu1qDolT60jKGG
 n9CZKlxmO5NSRnrm14jwyW0b1b0J2BEOM51GA27zKTUUP96U5vQsrV5837ax06OFKsl6
 9gkSoIAGABdgH3tVtWLSG00zePJ5nHRFdzoFGsbx7AEINdZ6/IwS0eCKVzCnfBb8XyIn
 wO+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEEc9S1MGTYyQTuxRnYGebndcuYHWwu9lvwmajJPzmM2qGsR8DU/vbCjMuH8FIVBpLlmJ2W14cHVXgz1Sg667l7Kr9Rxg=
X-Gm-Message-State: AOJu0YwtbO5rpaQMNPA1irZLaF1FdW1PUurPlkls2o9zB4uJnXGh6gi2
 i//c5zDRj+COdxPsu2+g3UcghCX34w8lAVmtl62gmj6lwEWokTk16+975LvGP6A=
X-Google-Smtp-Source: AGHT+IFDa+pi0Wk3en6eSuuD7x+HXOXG7Vt6pXmJMuil3/+Yrc9+vcN8NeQ8JWDHK3YqpFHKY6788w==
X-Received: by 2002:a05:6a20:144a:b0:1a1:276f:6b44 with SMTP id
 a10-20020a056a20144a00b001a1276f6b44mr5061825pzi.19.1709719051275; 
 Wed, 06 Mar 2024 01:57:31 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.45])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b001d9a41daf85sm12126170plg.256.2024.03.06.01.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 01:57:30 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/2] RISC-V APLIC fixes
Date: Wed,  6 Mar 2024 15:27:20 +0530
Message-Id: <20240306095722.463296-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=apatel@ventanamicro.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Few fixes for RISC-V APLIC discovered during Linux AIA patch reviews.

These patches can also be found in the apatel_aplic_fixes_v1 branch at:
https://github.com/avpatel/qemu.git

Anup Patel (2):
  hw/intc/riscv_aplic: Fix setipnum_le write emulation for APLIC
    MSI-mode
  hw/intc/riscv_aplic: Fix in_clrip[x] read emulation

 hw/intc/riscv_aplic.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

-- 
2.34.1


