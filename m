Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHFsK-0004Wl-Jv
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 22:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFsK-0004WY-0E; Sun, 15 Jan 2023 22:09:32 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFsI-00035H-G6; Sun, 15 Jan 2023 22:09:31 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id w72so12767763vkw.7;
 Sun, 15 Jan 2023 19:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0vzSOL9B65JvMrf1IKT1Bz0DxHMHIcO6vJ6LNIpy7Ww=;
 b=K4YJHYSsUOmUUXb8HqsCtGRLVMhQmrAtYJlVmgRAn9obP+gXHzfbGfcDSO4hXX5Qnj
 Bob78rDONfR2uKQkNRaHJO5tO3WWfU/2Beiep+THPrj2W19coWw+bFh6gBWZshL5nnvY
 G7/PKAW+0XUYxtwA+rEuBxEJH82HNSVYafPSw3rbVEdPPCPY1z0kV0CgnxFsDSusfIhd
 sRvWCXyxAQNHbr8aDgbhY67DmZ/n4x+bH3SjolbIqYe7uT6K6doK/RKXhJ6g54bL7oDo
 zqhpMZJniadzjMlKDQnzkP2WmwGWofj1LSs3XCusYyI+dgIka30tDYNQ0EyhIXn4KxXL
 32MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0vzSOL9B65JvMrf1IKT1Bz0DxHMHIcO6vJ6LNIpy7Ww=;
 b=Py1gBgGcpAD21cn7XE1nvBle4HkN9SlJbuSp8i58ryRbNbjo44urKze1woBCIVzjGh
 uB7bZ6LSPBqOYqBHUTKXwr2GrSnuCfPzbOdeYuQBW+Y5RiQ1vlxbEgv6oSHXCyR6TcbF
 zW6k1AojKHFXtv+Qq80a/+dp0hfA0FksX4Chgo/1XW/dQx2cRVCER9zrekh/kZQPLVWK
 vjyUjxK6CnzsLRFtfHyTlEo7S78M1HHBizgydgWBvQzhsAb6IrA0VgIQ1FGe0xLxluCl
 plqOiEthhM6pgb9ecJ6JttcYJgEYAc9cblu9wcX0l/HOqaDEz4Ix/ScZfFDe13TkS4BI
 lOwQ==
X-Gm-Message-State: AFqh2kpU2TLcFxvi7Cwwykb1JUGTPsk0l/0EJaMUGsUxWzONFhVpTR9U
 NB9T8SsaDsBLHWKStL7p+fO+ylBKqmc8S95W2X0=
X-Google-Smtp-Source: AMrXdXv20ZB24QiNstr/Yw9kaRvl+98Lo9w52oEFSdZIXT3l4UvdD+s2+CodQvJFOq2C3Ndl0PmciS4g+rJkVWDXfHs=
X-Received: by 2002:a1f:3215:0:b0:3d5:86ff:6638 with SMTP id
 y21-20020a1f3215000000b003d586ff6638mr9122967vky.30.1673838568921; Sun, 15
 Jan 2023 19:09:28 -0800 (PST)
MIME-Version: 1.0
References: <20230113175230.473975-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230113175230.473975-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 13:09:02 +1000
Message-ID: <CAKmqyKM1ESUYhHs9gLH5-XddabPMZ5amV1mV16y3WPE2Wb9y-Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] target/riscv/cpu: fix sifive_u 32/64bits boot in
 riscv-to-apply.next
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng.cn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 16 Jan 2023 03:09:32 -0000

On Sat, Jan 14, 2023 at 3:55 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> In this version I fixed the commit message typos pointed by Bin. I've
> also added some notes about the code repetition the fix is introducing
> in the cpu_init() functions.
>
> The patches are based on riscv-to-apply.next at c1e76da3e668
> ("target/riscv/cpu.c: Fix elen check").
>
> Changes from v1:
> - patch 1:
>   - fixed commit message typos
> v1 review: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02035.html
>
> Daniel Henrique Barboza (2):
>   target/riscv/cpu: set cpu->cfg in register_cpu_props()
>   target/riscv/cpu.c: do not skip misa logic in riscv_cpu_realize()

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c | 439 +++++++++++++++++++++++++--------------------
>  target/riscv/cpu.h |   4 +
>  2 files changed, 249 insertions(+), 194 deletions(-)
>
> --
> 2.39.0
>
>

