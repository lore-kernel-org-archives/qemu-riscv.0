Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pP22s-0007kt-7E
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 09:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pP22r-0007jr-2H
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 09:00:33 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pP22o-0000c1-P0
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 09:00:32 -0500
Received: by mail-oi1-x244.google.com with SMTP id cz14so392598oib.12
 for <qemu-riscv@nongnu.org>; Mon, 06 Feb 2023 06:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JgFNmEGGQB/VE0c8nlGIIg26d3/0SlzSXUMALqRz9Jg=;
 b=dbDxWpUs0JA3hbgspWUxdTeyMfdfVZoyK8AUbxU160M/CxUhLZdJuWtDYBWyaXldPX
 8Xo6lCI9rECt0K+9BEjHu9LQIbbS7163Bx4dQ0j6KSuoeAL30NmqefHLV58fXKG27cJo
 HkXsoXmXVesDSP7+XTuIkYB1w6LBAlUxCVasJOW0Ce60S9+RGB+WFwEbspNHLmKnOfzv
 WWKBs0qnP0FkFAfZSgut3DMW+Ciw2YBjRVre06vwF9gCH4xoRQVV/DZpJKHm7EVXh+5K
 4g4yuOKbhptnx2BiCcBQqbenqMO6Y5Z0vA1G4TpOiwl6NI7jXIl+DS2ddQKdJnWSA+gS
 3yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JgFNmEGGQB/VE0c8nlGIIg26d3/0SlzSXUMALqRz9Jg=;
 b=gSQHmeanW0IvYN9XyUPgd5zNT4UnGu5OWj0dnbb8jKqeXSoqT8m3I6hsZp72FhVHwd
 G53uQADSswMqErJaFeJbjB2ogVoXNSd2bRTAIjfNgdeLeE8Y0DWUk69gWFXLkbXPGQLm
 0y1AVZJD+quXk6fwKxggVefwi639PHzNxm4LsIhf6p/Xhop2LhdDVOo6Nnu/4xqQI3rc
 Wdx8KxBws6HOJJ+4nqVfMqXbnTt7FJovqTzd1OZRkTafd5ZIWcheG6L3fVJjwb5OufrE
 ey94W7eDqdetkOFkkgNPUvLEPDVYDi2nbANaRvCWofUah6z/F3O5CKCyaU0awRIA2TKh
 KXaA==
X-Gm-Message-State: AO0yUKXPFSHxoeVh9bMFq5yB8Aj8gyi8rjYEBtkf+MKEf+/HsoYb2O+G
 0jp2XazKQDuGfYlduwGLawjobA==
X-Google-Smtp-Source: AK7set+Zab63WGQY2IugJ71cJMvEfgaE0ZgEyVQMCd0zwdWiG18pm76eOFp0D4dvYNyCdM9FDeYbiw==
X-Received: by 2002:a05:6808:2220:b0:378:2e00:6059 with SMTP id
 bd32-20020a056808222000b003782e006059mr10870725oib.1.1675692027603; 
 Mon, 06 Feb 2023 06:00:27 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s13-20020a0568080b0d00b00364e8f85c08sm4151177oij.21.2023.02.06.06.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 06:00:27 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v11 0/3] Consolidate all kernel init in load_kernel()
Date: Mon,  6 Feb 2023 11:00:19 -0300
Message-Id: <20230206140022.2748401-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x244.google.com
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
X-List-Received-Date: Mon, 06 Feb 2023 14:00:33 -0000

Hi,

In this new version patch 1 was changed to extract the lower 32 bits of
the 64 bit address when running 32 bit CPUs. The difference now, in comparison
with what was being done in version 6, is that now we're doing that for
all uses of kernel_entry, not just the one resulting from load_elf_ram_sym().

This will ensure that the current behavior, that is now based on the fact that
load_initrd() uses the target_ulong returned by load_kernel(), that happens to
be a 32 bit var when running in 32 bit targets, is preserved by doing a
explicit 32 bit extract of the uint64_t kernel_entry for 32 bit CPUs.

Changes in v10:
- patch 1:
  - extract the lower 32 bits of kernel_entry for all cases, not just
    the one from load_elf_ram_sym().
- v10 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg00529.html

Daniel Henrique Barboza (3):
  hw/riscv: handle 32 bit CPUs kernel_entry in riscv_load_kernel()
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static

 hw/riscv/boot.c            | 97 ++++++++++++++++++++++++--------------
 hw/riscv/microchip_pfsoc.c | 12 +----
 hw/riscv/opentitan.c       |  4 +-
 hw/riscv/sifive_e.c        |  4 +-
 hw/riscv/sifive_u.c        | 12 +----
 hw/riscv/spike.c           | 14 ++----
 hw/riscv/virt.c            | 12 +----
 include/hw/riscv/boot.h    |  3 +-
 8 files changed, 78 insertions(+), 80 deletions(-)

-- 
2.39.1


