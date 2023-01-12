Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG69z-00008h-9q
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 17:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pG69y-00008F-3X
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 17:34:58 -0500
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pG69v-0008II-Ke
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 17:34:57 -0500
Received: by mail-oo1-xc42.google.com with SMTP id
 d9-20020a4aa589000000b004af737509f4so5162420oom.11
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 14:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OE84YYKjoFuqo0u9NWqw6q7gCrIwMHdGUeaSVIGT2ls=;
 b=CviH951q7QV7L4hrftd9zhLpv571+bGcqypr6RtQpfbeVP+dXSbzW7xFTlq5HHvMC+
 9EmdW9DidyO6/IkcV32Sev7WcZ6NPYn1FADmYtP9hfSPisC57mzMbAPld6mQT2k9A4SP
 iQIc8pQIgPo5370RgCw2rJTxreALMZWtGc4V/1dXwOjfC8M6BOZTwqaia/fVHS8pAP0c
 XNPPdLHsj4knvKu1e2SgOvEAsh+Z6XzfIdwWXL8aI6RcIZhS73O/1DWIeyMs+0rECkU5
 MCPUCxNzr2LtzZHRpt2eqICaWIV80Chfvga3bIC1UJeinuA00Gjc8Qz8PmmeoW7q/iEg
 YcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OE84YYKjoFuqo0u9NWqw6q7gCrIwMHdGUeaSVIGT2ls=;
 b=XCJkD1ntwE5nrabqcq0DNBqfP6i3+PHL+bToaF3BYDgN2tRqRwqryeSQDaVgXGqR/V
 5AtQrYU7kRrnXhg1Zc9yBIj/hnabaRJMdmtdnZUvRmHvpd5mq5YkmCOdqRE38B0mY0ID
 5X/UTR1LLEiPNkWDsimFqtvXxOEZpedXQlPCRKrJhuaEH0zySMP+P4K4yQym3NR4M6Cw
 fPaoUduS2Vknj4aG5gWmlUnwsmLinBVWh2hX9A3IEy3MYbeWhKC3x6uWgak9TO1RBQs3
 NbNaR0zIy/fdaJHNCDTJ81vfx0R/fE3S+qccUMV96PYsyTr5DMEdJlsXVNajEpM8NM1m
 aOgg==
X-Gm-Message-State: AFqh2kr5DGnTj8BI0TMzxN+fRqFgU7UALpoWjrQmUuM7WELoXTkqXgbM
 j4EkqHcBRIxDq/fz+BWVrka2gA==
X-Google-Smtp-Source: AMrXdXsjqmveLeam8IXE5jHe5PlwxIQRUAG9R7bCFW7i3BvJa73ql1Uz4gY6n3md5rDhiA0AEvXOhA==
X-Received: by 2002:a4a:97b1:0:b0:49f:dba7:5e65 with SMTP id
 w46-20020a4a97b1000000b0049fdba75e65mr31872147ooi.3.1673562891394; 
 Thu, 12 Jan 2023 14:34:51 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 h4-20020a4a9404000000b004a532a32408sm8946830ooi.16.2023.01.12.14.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 14:34:50 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 0/2] hw/riscv: consolidate kernel init in
 riscv_load_kernel()
Date: Thu, 12 Jan 2023 19:34:42 -0300
Message-Id: <20230112223444.484879-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc42.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 12 Jan 2023 22:34:58 -0000

Hi,

These are the 2 remaining patches, patches 10 and 11, of:

"[PATCH v5 00/11] riscv: OpenSBI boot test and cleanups"

The first 9 patches are already available in riscv-to-apply.next. 

The only change made was in patch 10 where we're now handling the case
where load_elf_ram_sym is padding the resulting kernel_entry with 1s for
32 bits. Patch 11 is unchanged.

Changes from v5:
- former patches 1-9: already pushed to riscv-to-apply.next
- patch 10:
  - added an 'is_32bit' flag in riscv_load_kernel(). Use it to eliminate the
  sign-extension from load_elf() if we're running a 32-bit guest.
v5 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00051.html

Daniel Henrique Barboza (2):
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static

 hw/riscv/boot.c            | 98 ++++++++++++++++++++++++--------------
 hw/riscv/microchip_pfsoc.c | 12 +----
 hw/riscv/opentitan.c       |  3 +-
 hw/riscv/sifive_e.c        |  4 +-
 hw/riscv/sifive_u.c        | 13 ++---
 hw/riscv/spike.c           | 10 +---
 hw/riscv/virt.c            | 13 ++---
 include/hw/riscv/boot.h    |  3 +-
 8 files changed, 77 insertions(+), 79 deletions(-)

-- 
2.39.0


