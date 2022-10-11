Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oiO2S-0000GL-VJ
	for mharc-qemu-riscv@gnu.org; Tue, 11 Oct 2022 18:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oiO2O-0000E0-Qd; Tue, 11 Oct 2022 18:47:48 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oiO2N-0002IL-Aa; Tue, 11 Oct 2022 18:47:48 -0400
Received: by mail-pg1-x530.google.com with SMTP id b5so14020076pgb.6;
 Tue, 11 Oct 2022 15:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JNSFSo/tU2B/IZHtWZrE1Nhh6Knjfk3qbnOYraD9jzU=;
 b=gWFkMXh40Rtha2Cc5gSdgn+OYC/pp7aW5GenS9Iy308NBynU8eRnv0rykbhoaGC/cl
 kmzVmAqOFrZKR9yuZTa/cO3lkN2lMU493OAmQLmWnDQ1nSaBDPNgrGNKibwYlvNb5Ct+
 XpfHdWFJjZkKou+mL/Z7EWpvd/x6zzKbgtoLk9vq/GqWYoRfEoT3wUf5THY0ZKJ80f74
 lLtW/H78EujKt775ghUycLhklNaV69LgPScy9HGINsB2J2eWhRpOOBsG1KFQLdlZQH23
 LrVo/9ppro4SqWlXaHKuWn0cjB0BazxK2VlRiktHrdwtW25t3nWeuVdNB1OBYO+DO+tF
 dKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JNSFSo/tU2B/IZHtWZrE1Nhh6Knjfk3qbnOYraD9jzU=;
 b=EKvpXyTrIH0GTmCagUr9K9cOdd9Ba76FYFnVtT0pbHJI9adjHzsyoukiYd0kzUFT1i
 phldNw7cS64txdR6ns9voXdnt8S4SQ10o/rOBnhrCNjdughXstqOtdFttJg+hYlk7SkC
 foKXFlRYcTLKexYiaP3gQ7vyeKwlkDqbMSSQ74aX5M+OtPKEgPbyYRBUx72wDPJrKgzr
 MOTiwssSN1W8MFx3Q8HA+ubfO8QDM9wyOMDSpjHsG5lHEHdQxgMQ8rWP2RNfrSpkYD9g
 zaL6PbB+ktmBEghXLlyZK1oEbvGkIUaRIjV6vxexlc3wNYQj0kcVNQQG1UE/A/OzpQXb
 RPGg==
X-Gm-Message-State: ACrzQf30+hFeVOS1n/oL2edhn7rG2tE90oulsp5ehPPBm+5If46nZu4S
 aqwglaYPPK1xiIQgq626h7ADUgr0KDBKPwC3abc=
X-Google-Smtp-Source: AMsMyM4CNY6SUTj2jz2+kPZPtzJsUp2pEW4iPqh/fiuz02wSR9sR4uhGSb5UNdjYM1nzizmfe4dv0DIuHGcdP+pxC08=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr22698829pgi.406.1665528465803; Tue, 11
 Oct 2022 15:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221003041440.2320-1-jim.shu@sifive.com>
In-Reply-To: <20221003041440.2320-1-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Oct 2022 08:47:19 +1000
Message-ID: <CAKmqyKPz6TK0H3erMChb-PNB4Vtiu8-W3QY+H7BiemPN+QkMeg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Enhance maximum priority support of PLIC
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, chigot@adacore.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Tue, 11 Oct 2022 22:47:49 -0000

On Mon, Oct 3, 2022 at 2:18 PM Jim Shu <jim.shu@sifive.com> wrote:
>
> This patchset fixes hard-coded maximum priority of interrupt priority
> register and also changes this register to WARL field to align the PLIC
> spec.
>
> Changelog:
>
> v3:
>   * fix opposite of power-of-2 max priority checking expression.
>
> v2:
>   * change interrupt priority register to WARL field.
>
> Jim Shu (2):
>   hw/intc: sifive_plic: fix hard-coded max priority level
>   hw/intc: sifive_plic: change interrupt priority register to WARL field

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/intc/sifive_plic.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> --
> 2.17.1
>
>

