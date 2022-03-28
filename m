Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYt5Z-000895-0v
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 13:23:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nYt5W-00088m-UK
 for qemu-riscv@nongnu.org; Mon, 28 Mar 2022 13:23:30 -0400
Received: from [2607:f8b0:4864:20::42a] (port=33693
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nYt5V-00032p-D6
 for qemu-riscv@nongnu.org; Mon, 28 Mar 2022 13:23:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id b13so11431459pfv.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Mar 2022 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=P+xV2AKqkor2icib2kEL4RqAKhntsA7/33ER0irIoT4=;
 b=Nbo3YO8yUNK1oB+JI+9ogQzIB4/J7QhBQPOQIxErXHLPOJQr4ak+XzD8bHyKieC3aT
 cHJuoh8U244OQ+n8Rcq18lwxEvnmYxQ34uo6Ik+eK25Pv+SiA4CZYXO5tE2WbdWtYfCi
 BlmeAMzaVV5rxgAjygFVP0tAEp/jIaAuPviRMCjFWMCX1LVBnmN79QL/WHGStVX90DHK
 rdTzBo1NFJORf8Lp4jYSR2kLhKrhrFXkEobbML4rwylVreUoAKdIgV3fqEBVSirUwjLr
 VB5uJa6Jk5/zRvaE9CtXXeuW0xShwrVshS5YDH0H9NjSDC26KCXiDE3KAn1PsIiYzaza
 tsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=P+xV2AKqkor2icib2kEL4RqAKhntsA7/33ER0irIoT4=;
 b=Sx3SdmV/n3V3/Up5MaXY125HQHPB81v/fBkFtxE8sqvmPqkiYU+WmNg8QTOr9jMcjv
 pvRkFAGLEwQVd7rNU6qksPJ4KnbnwyoJfbQ5/SJ57KFKwTT0P/8YA64efvZUZMlTUAcI
 9lFr2yCUhsPg/CRodECcXKp96t0pBymcH+q02oVK1V+fq12OySUROFYoageIIKDL2ZW7
 N9LRM32/YMj7wj/RapvEcdJjNoXWW+zzLfhndj+T4mbukc0Qwv5jb6pAVdAHl3z01lSL
 VuECnsNBUr99vGHj6N7cwXIZGsakBiL8leerHkBW+x9wPtsb4NpvETp9M6a1Xwef2Uta
 y4dA==
X-Gm-Message-State: AOAM532P1zLbxYW7hI0K/nfNxFbvEHhFViEHms8sM+McsEkEfIQKApHP
 LQbXDj2IKi+foenWHvj+tmXpqg==
X-Google-Smtp-Source: ABdhPJzqbRLLLoEBjtLssQSOhRkFMSP9o9DWuZIMvQ5fWQ9YCnwVJlgiPaT9a+HDubTAbXLFLS8NlA==
X-Received: by 2002:a63:b20e:0:b0:398:5b28:e54a with SMTP id
 x14-20020a63b20e000000b003985b28e54amr3516716pge.443.1648488207342; 
 Mon, 28 Mar 2022 10:23:27 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm17802504pfw.188.2022.03.28.10.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 10:23:26 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v3 0/4] RISC-V Smstateen support
Date: Mon, 28 Mar 2022 22:53:15 +0530
Message-Id: <20220328172319.6802-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 28 Mar 2022 17:23:31 -0000

This series adds support for the Smstateen specification which provides
a mechanism plug potential covert channels which are opened by extensions
that add to processor state that may not get context-switched. Currently
access to AIA registers, *envcfg registers and floating point(fcsr) is
controlled via smstateen.

This series depends on the following series from Atish Patra:

https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00031.html
https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00142.html

Changes in v3:
- Fix coding style issues
- Fix *stateen0h index calculation

Changes in v2:
- Make h/s/envcfg bits in m/h/stateen registers as writeable by default.

Mayuresh Chitale (4):
  target/riscv: Add smstateen support
  target/riscv: smstateen check for h/senvcfg
  target/riscv: smstateen check for fcsr
  target/riscv: smstateen check for AIA/IMSIC

 target/riscv/cpu.c      |   2 +
 target/riscv/cpu.h      |   4 +
 target/riscv/cpu_bits.h |  36 +++
 target/riscv/csr.c      | 554 +++++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c  |  21 ++
 5 files changed, 614 insertions(+), 3 deletions(-)

-- 
2.17.1


