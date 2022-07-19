Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDhJn-0006EO-8F
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jul 2022 03:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDhJg-000694-GL; Tue, 19 Jul 2022 03:06:48 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDhJd-0003ON-Vz; Tue, 19 Jul 2022 03:06:47 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 q43-20020a17090a17ae00b001f1f67e053cso1370485pja.4; 
 Tue, 19 Jul 2022 00:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EdgKVLq+rzuZgmL5mOQJWpwaz1CcdYDDFO+KF9Ww9MU=;
 b=e9EuLwkeoZqFjNkWT/WTPhzz4Sf6x3hU0CcCgnsjVOfflzNynGVP3N6XeOzbgwyktp
 rD6JBctI5jfv/ZRrnBQ81ChLD5/pTOdVBoom1iikILqQvQ57Zw4hcs7Xf+09xMWEZSF5
 l3M/Z/jeNQoV0hEyBdpewAT+J2CjpFEV0xXiQkaBsP6xNVxL+q7+MPQWGyamPtY7A0Dz
 trTS+xIa8fREdimUOTG3WiXeDhzBBf/cQgwRNhM1b+g1d3Ooo0WoMrZXerENgR7fO4Vm
 2+3L8U0L6XsJmLd69d0SlSzZw0w0tGOcUp7EKzrpGNxpUd9I9cqwoI/RaUQ/5qxBh9kY
 h+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EdgKVLq+rzuZgmL5mOQJWpwaz1CcdYDDFO+KF9Ww9MU=;
 b=PNAvNWoUiK5kFbBbVLHQSjxcsnqo3PNzyXLTDVx6Cro/ZqrZGkYHEAvTCvwvKEh9OV
 hIvPxRmenuGgfjYPJRAa43vPiod3p4vRXiBD+szzvB3ECD6xiZ+lLcoUigaYldIaJ/uy
 hcYRpUBa3/6uUK0FL8bt7hC1eqEBwbqaZJC/rvl8F+Gb4/L5F9Z0NO28TB6eCSovuNsy
 7oYapbmuqTHue+++cQt24Z0m4vBwzcAevhx62l9Y0LbhixkyY60LOTxQ44cB7kFk3P4l
 rGKlUXV8/88BrH8l+b1qAGwP1mXYFWsRvEbMUM+zCB9OyYFqKvFgevo0ifSoL5WCAQAh
 omTA==
X-Gm-Message-State: AJIora8sSyTXgkS5BA2OfMjdlP0beyAHLfWJqqKVRWsr5p/+CKZB8pq+
 l5tXspMqT9Cu5hsiFFK/xjoHG9oZ7Ngfg3EenTs=
X-Google-Smtp-Source: AGRyM1snBxgETJr8XCKc4v57I46yw1HDkHU3m6gEp1pohBSkakVbPe+4cA4ceGIL4y9++1xmRAarar7CDfgfAHtkrzM=
X-Received: by 2002:a17:902:690a:b0:16c:f877:d89d with SMTP id
 j10-20020a170902690a00b0016cf877d89dmr5789876plk.25.1658214403830; Tue, 19
 Jul 2022 00:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220717101543.478533-1-space.monkey.delivers@gmail.com>
 <20220717101543.478533-2-space.monkey.delivers@gmail.com>
In-Reply-To: <20220717101543.478533-2-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jul 2022 17:06:17 +1000
Message-ID: <CAKmqyKOKVm9yXrMLicHka1H-p6ZqCAE3+wy5qE=kxHNwDGgT1g@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: Fix typo and restore Pointer Masking
 functionality for RISC-V
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 space.monkey.delivers@gmail.com, 
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Tue, 19 Jul 2022 07:06:49 -0000

On Sun, Jul 17, 2022 at 8:17 PM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> From: Alexey Baturo <baturo.alexey@gmail.com>
>
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 63b04e8a94..86c19ea74e 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -544,7 +544,7 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>
>      tcg_gen_addi_tl(addr, src1, imm);
>      if (ctx->pm_mask_enabled) {
> -        tcg_gen_and_tl(addr, addr, pm_mask);
> +        tcg_gen_andc_tl(addr, addr, pm_mask);
>      } else if (get_xl(ctx) == MXL_RV32) {
>          tcg_gen_ext32u_tl(addr, addr);
>      }
> --
> 2.30.2
>
>

