Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oPyDq-0003kx-1Y
	for mharc-qemu-riscv@gnu.org; Sun, 21 Aug 2022 23:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPyDo-0003jg-UO; Sun, 21 Aug 2022 23:35:28 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:33282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPyDn-0001kO-90; Sun, 21 Aug 2022 23:35:28 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 ds12-20020a17090b08cc00b001fae6343d9fso4937085pjb.0; 
 Sun, 21 Aug 2022 20:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=/YXgJtX1zG4Y/XEzXgjAM2Md3fX5lW2S4LUS7dbSdLk=;
 b=l2GX2fzSLXyI87nq1OZFQ9PX3nZexbq9JA3WgTWQclOfXbsbMYdirlM1ktVMDpWmWJ
 SdKO/4w82svkn8gTDo61LUbCK0GwesP+eNKs/pU9xwcKYHlbWdORYsXHwEbwDO5MCZN6
 doGq+0VldV4khnU7VrA1EYCZB0eRhJufjIaAbryGSJT2kHXMzHE3GApgSw/hzoRmrK+P
 r0METwiuagmWwuMfKdDTXPCF0R3U6EiZz9HqXOiWL0GyeHRGeW2ad80tUUhJA89u6FCH
 3YzcJJAdwdaRtdh9GSqDChGdlbXUr1uxR4LBKN7RgiFuz2NyaQOyDPzNsDd1zEyQwYFy
 iQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=/YXgJtX1zG4Y/XEzXgjAM2Md3fX5lW2S4LUS7dbSdLk=;
 b=lvEp6W0ck01s5635SfI8jKd25hrw1XZtES+jUZ103XWGUYvVKGcX2TC9+1N6r65TLd
 9aRHy5tD5qtqsMHe3WnR4RLf0MXeF5tqlNCdq6PVHJ7xZiMlVgCGo3eBrwTHan+vU7in
 LM+rvxriopM29jG6qXcT9B2ntGDqU6lotqPQNhKre3V3W5yUdoj8KzjrrXqDI3c6J9pi
 tCNx21mMrJNFH8UM7IzEiKVjrIA3e+LkwAZ0qdHFVNexPnlY+t8Jjf017D1Ht66KiBfm
 //AzB/BibVl0aK8ogSL1UiBIoTJcoQ0qkFVxnOZyuH5COTOoIujZ0mP1g75WCOqJx8aW
 kKJA==
X-Gm-Message-State: ACgBeo2CbFFCa3GhuQZjsQIlis1aQir1EQ4s3GqCK8r74cfidnDUo+Ue
 sVgQc+XSm/iU4Lk74N9iOiK9TX5t3PDN2lwcZHk=
X-Google-Smtp-Source: AA6agR5k7A4UV7ZDAX5IP+0c/5x94DAHUudBjlBU4Q+EhzG7bJuC/8IxTuChAUTgqiDm/nweduu+VQzNGK/MNDmZndM=
X-Received: by 2002:a17:902:aa4a:b0:172:f24e:2e54 with SMTP id
 c10-20020a170902aa4a00b00172f24e2e54mr1101316plr.25.1661139325478; Sun, 21
 Aug 2022 20:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220810184612.157317-1-mail@conchuod.ie>
In-Reply-To: <20220810184612.157317-1-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 13:34:59 +1000
Message-ID: <CAKmqyKP0Cs-cpmX2rdNfi4UACoHzA2VOrc-ejR9cDrow2-mjMw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] QEMU: Fix RISC-V virt & spike machines' dtbs
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 22 Aug 2022 03:35:29 -0000

On Thu, Aug 11, 2022 at 5:09 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The device trees produced automatically for the virt and spike machines
> fail dt-validate on several grounds. Some of these need to be fixed in
> the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
>
> I mostly opted for what appeared to be the smallest change that would
> fix the warnings, partly due to my inexperience with the QEMU codebase.
> A "sister" patchset for the kernel will clear the remaining warnings.
> Thanks to Rob Herring for reporting these issues [1],
> Conor.
>
> Changes since v2:
> - move the syscon subnodes back to the top level instead of into the
>   syscon node
> Changes since v1:
> - drop patch 1
>
> To reproduce the errors:
> ./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
> dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
> (The processed schema needs to be generated first)
>
> 0 - https://lore.kernel.org/linux-riscv/20220805162844.1554247-1-mail@conchuod.ie/
> 1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
>
> Conor Dooley (4):
>   hw/riscv: virt: fix uart node name
>   hw/riscv: virt: fix the plic's address cells
>   hw/riscv: virt: fix syscon subnode paths
>   hw/core: fix platform bus node name

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/core/sysbus-fdt.c    | 2 +-
>  hw/riscv/virt.c         | 8 +++++---
>  include/hw/riscv/virt.h | 1 +
>  3 files changed, 7 insertions(+), 4 deletions(-)
>
>
> base-commit: 2480f3bbd03814b0651a1f74959f5c6631ee5819
> --
> 2.37.1
>
>

