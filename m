Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhith-0002tC-Jg
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 22:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhitf-0002rd-UL; Thu, 21 Apr 2022 22:19:47 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:46712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhite-0002QS-Fe; Thu, 21 Apr 2022 22:19:47 -0400
Received: by mail-yb1-xb32.google.com with SMTP id b26so6355835ybj.13;
 Thu, 21 Apr 2022 19:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SiND2r5c6ThS1JyIBWyrP4Lrb7B3zGrsKactfu0OpG8=;
 b=Wsp+P1LKtXqZB9oBWj6sAkhGb6329XQ12XItUs/eXw9GjmMG8w7n3DKSkLD4Htp2g3
 Kuu/YJWA76/t9+wX/clufpcBTVWC4ZFLra9RDuv2yyrkoYq3ssEdLP6CSaCE1vTnVmcw
 IB2WOWIxqaaTRbPBZmU0WJzjvjJGLjPvv96VZvJ/3uRpEKgKqdq692XL+Ja6UnDNVsKD
 k/A0bVD+qmUiFCGESxmfMPgoiCnRXxU2XGc0g8MGGOlF+5RWuhhpGa6VinNLBnT46QWO
 3ftcxQg3HQXlCegjsXd3JVnemrnu5ZTCod+UhjIVRw1gTbFxzFSO2JolBV9DaQ9jAUJL
 fVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SiND2r5c6ThS1JyIBWyrP4Lrb7B3zGrsKactfu0OpG8=;
 b=7y1SFh5qbeUnz7qAx3zmdy6HO5hupi9U5+cbtEjnOVeEKTTNs5zBy4LdTtzvXC8zzR
 o9tHo5H6L9f7oQrEmn62Oi7ed8amCoU5p2oFWeUptq+94N8DQCqx/YbK5Oru7hNizZYj
 LfF/1186BtidwNWm2Z4O2cEJeoKXPAjlTmnWsdl98aEzwPqF3Gxbp0dqxnp1VFg9FnQZ
 vUIHcV5bhH7Z+cOg0lUmDQY+e1L91syKUF3qfxEsevwPH6XvtD+d7BZ5k7WHctDBOtB9
 2gcsxd49g/7Off4uJdqT2EknbD8VTNEMqtHusrD4swP78alpQk1oIe5H4/mwdFJt5p3T
 1pKg==
X-Gm-Message-State: AOAM532KF2zzmCTWx8qmWYiENlGVBoX3mB0zYjxhJV7VxAfbwScrUqm4
 K7cGtmbwLNq+cCmD784gvJ8SHo72zMMGZ8zIdgA=
X-Google-Smtp-Source: ABdhPJyyBX5Z3tEaF4GOWR4cp6Ra0rTHXhO8CTZDgoMb47ey7ThFtccx3w3MeSjiYVkI3yTqHAwK2bM2dTsZfk88glg=
X-Received: by 2002:a25:d244:0:b0:641:e40:4a37 with SMTP id
 j65-20020a25d244000000b006410e404a37mr2597045ybg.123.1650593985218; Thu, 21
 Apr 2022 19:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220416193034.538161-1-qemu@ben.fluff.org>
 <20220416193034.538161-5-qemu@ben.fluff.org>
In-Reply-To: <20220416193034.538161-5-qemu@ben.fluff.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 10:19:34 +0800
Message-ID: <CAEUhbmUAYtS1bshMrVceWe_B=uWVacty0scHUv9MoAfBQxeMKQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/riscv: use qemu_fdt_setprop_strings() in sifive_u.c
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 22 Apr 2022 02:19:48 -0000

On Mon, Apr 18, 2022 at 5:13 AM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Use the qemu_fdt_setprop_strings() in sifve_u.c to simplify
> the code.
>
> Signed-off-by; Ben Dooks <qemu@ben.fluff.org>

; should be replaced to :

Not sure how you did that, but you can do with "git commit -s" and git
will take care of the SoB tag.

> ---
>  hw/riscv/sifive_u.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>

Regards,
Bin

