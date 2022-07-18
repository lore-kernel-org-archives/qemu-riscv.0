Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDEsb-0005Og-BE
	for mharc-qemu-riscv@gnu.org; Sun, 17 Jul 2022 20:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDEsa-0005OS-DF; Sun, 17 Jul 2022 20:44:56 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDEsY-0007Y2-MG; Sun, 17 Jul 2022 20:44:56 -0400
Received: by mail-pg1-x52c.google.com with SMTP id f65so9231383pgc.12;
 Sun, 17 Jul 2022 17:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=siiUxJutTDBRVQ7npCgj+XdjljJVq2ZM3zfVroDnvko=;
 b=lr3KjxDhrCrwXWuz/S+pHDBtBMZkPDplpo4jI0FvU80vLPPzfJanbDyvxUlqSUJqEe
 /P4OwejBXtPvO/VkDXsNmENJn5yHN5sR6+8enEUnVJAHx9A8bXp32QXaddp22dHQwvLa
 otCcU7hgonzK5Ex0J85Um1mq1+5aRj2itV/xiLsbnQWEd2LSYnLiCJOrUc/41yrFdtl+
 K2ghiHRhxYADdnuROTxi3c8JseV1Vy1AM1297/VBqe+BDe/S7GjezDQ+Ms3a56xqxnVO
 jg6Wk0aI5LFR9D62JDBh6hHAiLoPTNZ9C8ZG0a0N72aSFqjBphVb3mC1hzlLOuxqki1b
 Xbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=siiUxJutTDBRVQ7npCgj+XdjljJVq2ZM3zfVroDnvko=;
 b=b7+5q1in787XdGNFrQrvLoCT9NCYUPueUfb0jHch8KiN1RztZiR20wBO89znxFQU4m
 yM3IqulSFCgJislrMa9dcd3/qxBg9HKPOtbE5VnAlF4Rcv4U1K34LlhL6ee1gRcGiDcw
 bsN4OINiMw3akTlC/ZMdspVzgcu1c11ioKXRVFjQl6o6L5SmrHvzyRtARpxUe8F+qYL0
 B16bWtThNHoYZdCGj8mYZ1LIqn+GzwLPtFab43akinFWT2jUNlrXqudqulcoXUbkV1Q/
 vhzd1234cgUlGaDoKU8U04WI9Pl4N/RrBg8dVoxNdRRfjn2YD7VlyVeZleiLLg9u+gXP
 I+OQ==
X-Gm-Message-State: AJIora92GIT+ar1M7MoUuSwYT0Pf9CXqY9pHDhhSctTWrdFnKn5WyNYM
 pbZ759GM+v5f6u/vkl8uiY3zwGRXpTN5L51sSbQ=
X-Google-Smtp-Source: AGRyM1sMhtVAhI2yI8/UU/AeK8r2ee5AM0pWwbpnNucXq+J/vDl/XsNrn5AepU0jlIKCb69OMpXdw8JrLOawxX5/Ngc=
X-Received: by 2002:a05:6a00:885:b0:510:950f:f787 with SMTP id
 q5-20020a056a00088500b00510950ff787mr25204373pfj.83.1658105092427; Sun, 17
 Jul 2022 17:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220714180033.22385-1-palmer@rivosinc.com>
In-Reply-To: <20220714180033.22385-1-palmer@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Jul 2022 10:44:26 +1000
Message-ID: <CAKmqyKP=uO6j7EoM5mVDgYAwHxfEjYT9iu5DaSiviMT4ScP1nA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Allow both Zmmul and M
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52c.google.com
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
X-List-Received-Date: Mon, 18 Jul 2022 00:44:56 -0000

On Fri, Jul 15, 2022 at 4:13 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> We got to talking about how Zmmul and M interact with each other
> https://github.com/riscv/riscv-isa-manual/issues/869 , and it turns out
> that QEMU's behavior is slightly wrong: having Zmmul and M is a legal
> combination, it just means that the multiplication instructions are
> supported even when M is disabled at runtime via misa.
>
> This just stops overriding M from Zmmul, with that the other checks for
> the multiplication instructions work as per the ISA.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db2b8e4d30..cab74faaca 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -709,11 +709,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              cpu->cfg.ext_ifencei = true;
>          }
>
> -        if (cpu->cfg.ext_m && cpu->cfg.ext_zmmul) {
> -            warn_report("Zmmul will override M");
> -            cpu->cfg.ext_m = false;
> -        }
> -
>          if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
>              error_setg(errp,
>                         "I and E extensions are incompatible");
> --
> 2.34.1
>
>

