Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75FECCD18D
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 15:44:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8KiJ-000718-R8; Mon, 13 Oct 2025 11:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jelly.zhao.42@gmail.com>)
 id 1v8KiH-00070h-Ak
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 11:43:53 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jelly.zhao.42@gmail.com>)
 id 1v8KiE-00079F-KW
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 11:43:53 -0400
Received: by mail-pg1-x544.google.com with SMTP id
 41be03b00d2f7-b550a522a49so3604274a12.2
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 08:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760370227; x=1760975027; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vrXMV/TPclJ2oNHwrYzf/NqliMCZdXD+QzV31j52NQ8=;
 b=C4KILe/uTX0Hh4v7u4HT9pZwUfMVlIGBZCag3KYd8mR+pvfmrXH48IS/II10EPvbjs
 XmJ/QwZuQhBi7pA00icnnlYtN473zg5m2TZ1An6zIpKFbZCyuPIbHZx6wMKywHIJ0/70
 zWrgfi0bpNyL0d5cHhQkTaKuYdXbM6u3iD06o2PMQi0SpA2TEe3xxaokU5FTHnlPHib6
 dDu1jz4it1h6xcfTE8UHZZrtYNefF6ke6wtdPcN3X74+afVJfSMIvA21BtVFvSny/DHt
 ZKjEE+KIlz4/JMypn1Wosod6vcTSwG7VDnyt5TvyjPnMDSqq/V2XN0D9vZnpouvLN8Iz
 KKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760370227; x=1760975027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vrXMV/TPclJ2oNHwrYzf/NqliMCZdXD+QzV31j52NQ8=;
 b=DY/abme6BIXTBQfaJ1B1Zh8Y0YLTzPn+bJdu0zQq50hCnGruIkhfiepDKL1zoWAsGc
 ddz6RW3QDkaScsjwNenLFIZLjKYk6xA4aZ3GJG9lUu7/Q9j7234Xgjj+1kguE1W13IxK
 9f+1es4vNbbsXMFO8B1WoYuYV2ZhPImRPDkFnVzDSCJTtwWtt0p1kp6q4Ek+QPnmhw6t
 Wwni3o8rDX8WMJWU6/1kb2WgeMUJJG5pVcfd4kDcslGaVE9+mkaYihJpjMlJEjKhDTW+
 PHmgCrpFIMssSdFo/5HmG9I59qEEix3OcbM7YbVuzKd4JiMqWk82TYBf66MjLUX4bdou
 R37w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJzkVd7zcgdPVTlWmwZtLpkmvwbdQzkNuMvphiPo0B3YipwDNOaUm+jGW6UIbWOI6CyfdjfggXXKqw@nongnu.org
X-Gm-Message-State: AOJu0YyBRWkOJkKv7xqYgMDt8cZqgNOGWCUtqUEqYpnweByY4JHwBbr6
 K3c4TvIxwC1SauFajXGN1/GMuxOGZwh8XkyGUsYh82Rol5rWpHmEoUkN
X-Gm-Gg: ASbGnct4fmWe7YV4bvTH6i1KgJAtt65VtNyb9iZNEFGNnjzKhA35EwgqMtN4tjr1mJa
 TXzGHlirYOhtVeubrt0j+s+Sho/I/9nVrDCqdJ3CF0YE1y32ZbTUX2reIpD65MSN4FwB1LtcCcM
 ExGyZ6ZFfTC5YKW/hiKinWswSCRGAQE0TItCxJAhPdEVnLbGXZKjT+K9wVKvbFnU/8RReSXF3Pz
 EiikR9XDt1F5zsD0u6nQY8fXfEK5jDOab1Km2EE106s5Av9q8nTZzfWuHf3nrmf8XLEw1EBdHZu
 VjsjZLWaKCJZ7WNmMYKWQ9slAP5ck8jJNXea+/MzV93X1mXN5u7NPu2o5oStkXCPD0Y2FF3wTgk
 q3pMsw1PqpVEcdnAjoobRYuvzcuWXSH8+3dbjtqrMQbhJT3iAPUxMGA5WJ2cFJrKVJFnZ/ZWlG1
 rxqI/M
X-Google-Smtp-Source: AGHT+IFia7eMzum+06Q7CowkYvu7/z2nQvX9Ip+9NuY4N1HVgIZHsomGjFFrMYugkKa7QTdg5lcOtg==
X-Received: by 2002:a17:903:4b46:b0:27d:6f49:febc with SMTP id
 d9443c01a7336-290272159d1mr282145305ad.1.1760370227425; 
 Mon, 13 Oct 2025 08:43:47 -0700 (PDT)
Received: from localhost.localdomain ([103.116.72.131])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b529cec1esm10041015a91.3.2025.10.13.08.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 08:43:46 -0700 (PDT)
From: Zejun Zhao <jelly.zhao.42@gmail.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Max Chou <max.chou@sifive.com>
Subject: Re: [PATCH] hw/riscv: Correct mmu-type property of sifive_u harts in
 device tree
Date: Mon, 13 Oct 2025 23:43:35 +0800
Message-ID: <20251013154340.1989427-1-jelly.zhao.42@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cca1b0f7-8063-4d53-88f7-a56eb56b3eca@ventanamicro.com>
References: <cca1b0f7-8063-4d53-88f7-a56eb56b3eca@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=jelly.zhao.42@gmail.com; helo=mail-pg1-x544.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Mon, 13 Oct 2025 11:38:48 -0300, Daniel wrote:
> But the documentation I found [1] seems to indicate that it should
> support sv48.

The second paragraph after the referenced Table 9 from [1] states:
> For RV64 architectures on SiFive designs,satp.MODE=8 is used for Sv39
> virtual addressing, and no other modes are currently supported.

And here is the same statement from [1]:
> The U5 has support for virtual memory through the use of a Memory
> Management Unit (MMU). The MMU supports the Bare and Sv39 modes as
> described inThe RISC‑V Instruction Set Man-ual, Volume II: Privileged
> Architecture, Version 1.10.

So I believe we should not try to support Sv48 for this hart. Hardcoding
it to Sv39 should be fine and correct.

Regards,

Zejun

[1] https://starfivetech.com/uploads/u54_core_complex_manual_21G1.pdf

