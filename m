Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1on8pi-0000LG-V0
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 21:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1on8ph-0000L1-SZ; Mon, 24 Oct 2022 21:34:21 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1on8pg-0005PE-9J; Mon, 24 Oct 2022 21:34:21 -0400
Received: by mail-qv1-xf30.google.com with SMTP id h10so7670690qvq.7;
 Mon, 24 Oct 2022 18:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LOfHczHFvZJYz3oP3hzXOgEC8HqEkHERW5/LaOeC2lk=;
 b=p3o5xAujF9Wy2mQrT1dWNqax65D3PpmjFJNY7WVsb4EctDnxfTTTuE7H2buxG+n2kj
 CBMwRvZXN6htl4hx7FlAM9O7Y7xf/asGsWxS+jTs1CARhx0imeTGbKibmMF1Z5c7kWWj
 96LP0N9e9OMMvTYfJKgM4csCnTCcBqrruhX8y4E9CEAR0B0K1wivtFlnT67n3uZUbpef
 9g/147yXkL1DPEWn4r41vUgPLeQ6cL6PPxfYZ4YHjugGvO2l/AAowxHhxMRtXdJoHNlD
 A9l6qn/5GS/lyIE2ETkCoxU19bVUylNFrHpn/MI9bgbofLRxn8XLN+n+54F//WC7I13a
 VHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LOfHczHFvZJYz3oP3hzXOgEC8HqEkHERW5/LaOeC2lk=;
 b=WFO/IqWZCuEqviJFQEWX56HqV3uBzTCh9zxtmCK35TudGtHyRZbKRn3uW8+QCUS2TF
 AM+siuK20cqR23S2OrmQHHV9txLS6iSIF27zN87rNo9heosqlKk06D2NWXWfyigauk/j
 7BEAu2MpOagrX3TN2WZMvWy+XABLDkIBWUNpjQEY+N9rD2QOOu2BQyZXW5lfdtDLreGe
 VJ7WC+ONBiGUPvWFe2XlcSERYI5VWwuHyj84hmNH9CRGmLOdIaw9XRaWckfYCa7Yrhpt
 QKVU8/trMubYWjzvnE21yZ1DEIhwlX7YTz3sD36pTbEaAQ82PDptdstcEWK0+NW4YxJ0
 gXiA==
X-Gm-Message-State: ACrzQf1XWCf3pmtWhXL7dthpdpv9kXoakmWMUj8s8hin2Y5Y/lqGAjkZ
 xcfdI1e0QwAWRNeTH1emYwMTGNqgXLVbn47CnCg=
X-Google-Smtp-Source: AMsMyM5rHkPXuRVshEaJj7e4qg8ig1KWhJyjNxowFxDX07FEFHxMhrJVpwwKOwfOlBuQOHHLg030sZWtLooE4biTD1E=
X-Received: by 2002:a05:6214:2b06:b0:4bb:5716:d1c3 with SMTP id
 jx6-20020a0562142b0600b004bb5716d1c3mr15429851qvb.85.1666661658586; Mon, 24
 Oct 2022 18:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221025011040.246503-1-wilfred.mallawa@opensource.wdc.com>
 <20221025011040.246503-2-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20221025011040.246503-2-wilfred.mallawa@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 25 Oct 2022 09:34:07 +0800
Message-ID: <CAEUhbmWzd86PpqNeuKjDZQ=9PW4AvSP4-AZ4imoN+dVqeh-Gwg@mail.gmail.com>
Subject: Re: [PATCH v0 1/2] hw/riscv/opentitan: bump opentitan
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 25 Oct 2022 01:34:22 -0000

On Tue, Oct 25, 2022 at 9:17 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This patch updates the OpenTitan model to match
> the specified register layout as per [1]. Which is also the latest
> commit of OpenTitan supported by TockOS.
>
> Note: Pinmux and Padctrl has been merged into Pinmux [2][3], this patch removes
> any references to Padctrl. Note: OpenTitan doc [2] has not yet specified
> much detail regarding this, except for a note that states `TODO: this
> section needs to be updated to reflect the pinmux/padctrl merger`
>
> [1] https://github.com/lowRISC/opentitan/blob/d072ac505f82152678d6e04be95c72b728a347b8/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h
> [2] https://docs.opentitan.org/hw/top_earlgrey/doc/design/
> [3] https://docs.opentitan.org/hw/ip/pinmux/doc/#overview
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  hw/riscv/opentitan.c         | 13 +++++--------
>  include/hw/riscv/opentitan.h |  9 ++++-----
>  2 files changed, 9 insertions(+), 13 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

