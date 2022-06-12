Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o0X9J-0005u1-Km
	for mharc-qemu-riscv@gnu.org; Sun, 12 Jun 2022 19:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0X9H-0005sI-6R; Sun, 12 Jun 2022 19:37:39 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0X9F-0005Vc-Oq; Sun, 12 Jun 2022 19:37:38 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o17so3725322pla.6;
 Sun, 12 Jun 2022 16:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vtPSde7SeGtGh+gB9Hjs536A7KAXDoEP2LUD/D8/daw=;
 b=pplZElV3XsgMzNP3OLysRtMd5TOvRhgSMbj0NyK490yRw49qOkxdXyTfSzFYB/QMem
 wU84r8C0A8hzS9PTGLWAoS+C8LUjB1mDIhTfzgDHZ2r6IMiq5P4dnLeuJSNtUOi47O2I
 zFj168s7oF3hklH5iZd6aydEhGA4ATP96WsNAS2NketDgbvP0j0NQK9LNC6OwB2U+lrG
 VdYMHsVWndEFYp5CySyfwtLolQTK5ScFsk49TlvoGPZ5Ssnijpy/TO3sCiICSK5SdcBS
 /Kv4dtUg82Pk6euSKFi6HzPrp6JEy4J2B6djvJ7didd0jo45dSqrPxEW7awTKrrrvxaa
 dmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vtPSde7SeGtGh+gB9Hjs536A7KAXDoEP2LUD/D8/daw=;
 b=WlSt3lv4xfJrU+PinexSAi1ANl0dV770bexEoqL/9PyA8RcA4z6Ike0o39KLciqgVO
 74L0LlB6nRrFp5/lVRGCAvgyB7W+aMAIFHACahP8KXh8vXwj4nC/gslFlJfWepT29I8m
 lOxxltyC0DnX0ccMpA2PHTY71JleLmU9QV1wCevJTpMBru/9dFNFaedVTe/nxEQ3gJ/4
 pzzJBXYo47ba0A9YwVc/x2CR1mdbghiqHWIus3P8JgsOaVTEARd2hlxuZc8lU7cDNNkI
 1nCtuVV/GZ0tWDxdd3dSAOUFPinPAiv4FPr6pm12YaEZkvWtZ6CvPWFZvbLkN1rejMFL
 +wAw==
X-Gm-Message-State: AOAM532vPBkFjL1h/Oaf7TnNWscyGo4H2TXB6aFTnU6w1MewmXXGAhKX
 XIPp/N3eDQCS3Hyy1CIiXs/x/Q2Fhkz7HvqK5CQ=
X-Google-Smtp-Source: ABdhPJz4rrf4Zuh0g4duDW0wm6w6r7CIcXInxX2RlfdX1jrfmqCptIk8DJpxiJt/ChTJ6aeCFg9gue/Qkcw+hTyc+xs=
X-Received: by 2002:a17:90b:3e85:b0:1e8:8f2f:bd2f with SMTP id
 rj5-20020a17090b3e8500b001e88f2fbd2fmr12493581pjb.120.1655077055518; Sun, 12
 Jun 2022 16:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220610165517.47517-1-victor.colombo@eldorado.org.br>
In-Reply-To: <20220610165517.47517-1-victor.colombo@eldorado.org.br>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Jun 2022 09:37:08 +1000
Message-ID: <CAKmqyKPB5PwV1W+dpU8dakuvYL+SXTC-N3ho58HYBt-7YvYZTw@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Sun, 12 Jun 2022 23:37:39 -0000

On Sat, Jun 11, 2022 at 2:59 AM V=C3=ADctor Colombo
<victor.colombo@eldorado.org.br> wrote:
>
> Commit 57c108b8646 introduced gen_set_gpri(), which already contains
> a check for if the destination register is 'zero'. The check in auipc
> and lui are then redundant. This patch removes those checks.
>
> Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

