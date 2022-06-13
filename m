Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o0XxH-0008Nl-5v
	for mharc-qemu-riscv@gnu.org; Sun, 12 Jun 2022 20:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0XxG-0008NX-0P; Sun, 12 Jun 2022 20:29:18 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0XxE-0003Km-Ha; Sun, 12 Jun 2022 20:29:17 -0400
Received: by mail-pg1-x530.google.com with SMTP id h192so4203089pgc.4;
 Sun, 12 Jun 2022 17:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hoWvhIBJmPArlqrvYazYx8szKvXFUAEXiZFrtkEYUYI=;
 b=E1VzcVko4R06PGzyKyvxvjhZPKcnPMBiyPUi6rk7+ux5b1k93R7F9cANQ1zW3A5CxD
 9z8xJLYxs4ewP4GnpVE4g36vqb8uU+feF9L/oDOLXqlQVUIDuj6cTHsT2t7kvOrGcp+/
 SJEBkyaLkSZa150gVhyATZRnxRnoGW7SRi2v1yUUIIxSiTkuwtVF3TtZm/eNJh+I9MEe
 9DVmlDl0oERYQIDgIpZmAXKuqCgBo/cvwxk/K7rh/Ms1CQGCoZ3Evi9fsCI72Qy3AFcX
 5e7osgTb5hUXqeRJN1d3F66Rkcl4oNqRGdm4n4TsZfmIg/Vq4cUqXlEbSFJga+BVmnll
 n/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hoWvhIBJmPArlqrvYazYx8szKvXFUAEXiZFrtkEYUYI=;
 b=otQcULnVcD6Oe6n9Po0oL3p3+dQkp9deNtCIzNa8KSic9xd4FoOnROps3X7hhgD1J0
 dUswpe76C+6XdLexWrZ3ka1qddfMVhYTZb6DqS5xBv8x2csDn4Dxjvh21y9aA3awyoMc
 5zZpJDZWT1Fz7NIJ0ZRQuTT0oaqMOYxdtw3y58olWxHWy+dAaW5KeC6l9p0C15TfcC2W
 g/1g2KBoHBfYjRWvZtfAogcLWXOwt7adFp570Yyk4ZWwXs/RUr621SMNBU72rGbM2Hbh
 ed1GEc3GGiQPpIXdxYmyrfo/5YQOFrGfSe3wExuBSlRJVAlKfibHT0chDL9GA0kzFQ0w
 poBQ==
X-Gm-Message-State: AOAM530puEaw31KyEAz94WhfXZcRNKrHvBj6wM+rdIV6AtmbAhLzot7K
 BuJxC8v6b2Hc2gb0XYAAPBLnl9UBRgrz84ipSS84kWTuvIJz7cfc
X-Google-Smtp-Source: ABdhPJxnYbZKZav/4xKinLDkAF8TYzh0cHcdgtrUo8gZoA/MI3z5/N09B2xQ+cI9s1zqRvzi4xMMPnMjG+7fD1gr6EI=
X-Received: by 2002:a65:5385:0:b0:3fa:52e3:6468 with SMTP id
 x5-20020a655385000000b003fa52e36468mr49840262pgq.366.1655080154786; Sun, 12
 Jun 2022 17:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220610165517.47517-1-victor.colombo@eldorado.org.br>
In-Reply-To: <20220610165517.47517-1-victor.colombo@eldorado.org.br>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Jun 2022 10:28:48 +1000
Message-ID: <CAKmqyKOtwoeYJRKA29PC4e9UMbALyPBE_K+s7X_7S+-nCde-+A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Remove condition guarding register zero for
 auipc and lui
To: =?UTF-8?Q?V=C3=ADctor_Colombo?= <victor.colombo@eldorado.org.br>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Mon, 13 Jun 2022 00:29:18 -0000

On Sat, Jun 11, 2022 at 2:59 AM V=C3=ADctor Colombo
<victor.colombo@eldorado.org.br> wrote:
>
> Commit 57c108b8646 introduced gen_set_gpri(), which already contains
> a check for if the destination register is 'zero'. The check in auipc
> and lui are then redundant. This patch removes those checks.
>
> Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index f1342f30f8..c190a59f22 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -32,17 +32,13 @@ static bool trans_c64_illegal(DisasContext *ctx, arg_=
empty *a)
>
>  static bool trans_lui(DisasContext *ctx, arg_lui *a)
>  {
> -    if (a->rd !=3D 0) {
> -        gen_set_gpri(ctx, a->rd, a->imm);
> -    }
> +    gen_set_gpri(ctx, a->rd, a->imm);
>      return true;
>  }
>
>  static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>  {
> -    if (a->rd !=3D 0) {
> -        gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
> -    }
> +    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
>      return true;
>  }
>
> --
> 2.25.1
>
>

