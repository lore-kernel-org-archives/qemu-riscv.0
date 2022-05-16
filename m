Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqjrY-0001o3-EE
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 19:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqjrW-0001mw-Eu; Mon, 16 May 2022 19:10:50 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:38496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqjrU-0004r1-Si; Mon, 16 May 2022 19:10:50 -0400
Received: by mail-io1-xd31.google.com with SMTP id z18so17658407iob.5;
 Mon, 16 May 2022 16:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UTpW7LraWGxyr9KS93aOR8pAmp8yojNon6kkgvdWlJE=;
 b=ngssiSi6TaUPyIK362crg6c7kyiJELNN+iHX3fM/ApJHkq7TxuSOkSuy+iAkMNlMwA
 QoohLY1wjTM4BYIFNmeLPUo8WmWYibuR7nV3eh9ikU7Ywevjaj/B/+nFaHTTpFa3jKDm
 v5ZZQuBDbeDpRZMCmBDWDqESY3PL3TLDSikQMhK7Vn3fhnqD/y9XfL5uGuBYN2xFMUhB
 IZwzyvUR0mijKwwef1cOYrv29uHuq0LizQGFYC2iM/qrc1nxn3sPNAj6giTxgHS6DeFJ
 4wZ16l/2TWGpU7ckgxWdhFz8CE7vPNwEj37bRbhHNuaaNq2Ea9QgLVuBqjPfTih/f6nD
 HRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UTpW7LraWGxyr9KS93aOR8pAmp8yojNon6kkgvdWlJE=;
 b=vjKWeO3PwN3KfDGMF9Rw65k/uyuWlNP+yCMTLqxS5OeVF/GqS1LoStpYZtnCIYQHfE
 8Cc49Ph8a9csJWSeR9ywVsQBDXCj9HRzL+Kmlu5skPgiV6zxOIPcY7bhOyeWtO9crrCt
 cn25Zh2Z2Qk25wLeAglCrpboEOoky6lCkgholNGmSzNTuPqEaMsBnNbSLNvr1Jy+sHsP
 uVTPIoEsfFnKxwe5oTsn156kqQtW1Cx15zNl1TxbqJZ/OnCJnnd2sf3Ne45PgH6kcb4n
 6/iZKMXHZY3edCYjzhdmfP8nfLhhMpkfTAmsng5a5Hi5aV6+4L0556oY2+Ml34+XYzdv
 wJ7w==
X-Gm-Message-State: AOAM5301cP1ZdA/nImXn+5tHg37UAwqoTl8g22L1kYcgcxSD7pOscifQ
 c0TKKVcaJUXI3My0TRx+KNbxIxrT6DbhupGfoUY=
X-Google-Smtp-Source: ABdhPJw2qPEei8STwLFz3Kk+neO4UFHcvGVatSYGHbS6fhjlxvnhA/7IkZiz2YfVpK/MX7cGojb3W3UjuApDkW1aeb4=
X-Received: by 2002:a05:6638:3711:b0:32b:ca0b:8a32 with SMTP id
 k17-20020a056638371100b0032bca0b8a32mr10882677jav.267.1652742642967; Mon, 16
 May 2022 16:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220513221458.1192933-1-atishp@rivosinc.com>
In-Reply-To: <20220513221458.1192933-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 09:10:17 +1000
Message-ID: <CAKmqyKOym3ageg3ps=CY5sJAGGZpKHtn4eOAKjR0zbyT7+KcTA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: Pass correct hartid while updating mtimecmp
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Dylan Reid <dylan@rivosinc.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Frank Chang <frank.chang@sifive.com>, Jim Shu <jim.shu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Mon, 16 May 2022 23:10:50 -0000

On Sat, May 14, 2022 at 8:15 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> timecmp update function should be invoked with hartid for which
> timecmp is being updated. The following patch passes the incorrect
> hartid to the update function.
>
> Fixes: e2f01f3c2e13 ("hw/intc: Make RISC-V ACLINT mtime MMIO register writable")
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/intc/riscv_aclint.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index 0412edc98257..e6bceceefdbc 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -233,7 +233,8 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>                  continue;
>              }
>              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
> -                                              i, env->timecmp);
> +                                              mtimer->hartid_base + i,
> +                                              env->timecmp);
>          }
>          return;
>      }
> --
> 2.25.1
>
>

