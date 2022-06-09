Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nz6qU-0003tu-7W
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 21:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nz6qR-0003ta-Iq; Wed, 08 Jun 2022 21:20:21 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:46941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nz6qP-0005pm-Av; Wed, 08 Jun 2022 21:20:18 -0400
Received: by mail-qt1-x834.google.com with SMTP id j8so13429738qtn.13;
 Wed, 08 Jun 2022 18:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EEmtnEFwLTmyn1ltLw6Zztha5nqQ3keNRDRZzj7s/pY=;
 b=mXB4aWHSLs7UE4Ntg/vibxpVmyoVRpyxri03ATp7wHCyoQlkLrgO18fBTr2IXwouhK
 HSDKNoLjgNPvjzII6u4fTjmwu/I4xJlxo49ny16rqSW/hjOAm1/rq2t+t9JoC56CIr7h
 cRHv5wcvid7cQRvdbbg1F7EUhFsgLCIgce8VUqu7JRt57QzaZZkPzYo2L5v/oBJa8ZHx
 4pN6sDoAvUTgBr/+JiDCkN4ypHo2EsSME4ekyZ0OjVabcZuaQQ3RSRtqU3iqTqhf8wYe
 twkNaani0MnADDNAE1ZZuFOwTb/3Or8Rb8j0N8M7McMF3kD7UswLGOBY7Iu2UCSpROnq
 QM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EEmtnEFwLTmyn1ltLw6Zztha5nqQ3keNRDRZzj7s/pY=;
 b=u0h7kuYK46RP/vtdI5IKMuU8KyCb2bcm/0dduMgksWqeI81+8TpHvbcvl4/0bZlW+9
 LJMZ4t5bkyORZWo3zZF6UWVqyLBwat2B/qrKWWn09mgrgSiNslV0whtM/54dwHGyq9qD
 CTAJ/4ndwKgdk+C1ph+w5XS9Yg08V+0N3AqdXFEuOPwXrzYUlAdsL+OcnEx/8cBnGtFn
 3/S2npMIFCcmM2EGxUBoetmZRML6vo1gpuD29kZhCeHfRGedV21Lw09rxX62nuf1TLt6
 wxWG1kHBD5pr7Q6I68DZFlJqlgKyEAbYy9YCsOHFObQMA2K1dxHWmCAmRxhmnEq+gQv+
 XErQ==
X-Gm-Message-State: AOAM53258S4rPD5DFOu5KsfHQpI8l5/iUAOZ/fVQflf+HydBh3KaEIz0
 kXW1GRIWcW5GH/vryCtNO8sRkEdXSKQ/2SYvCzk=
X-Google-Smtp-Source: ABdhPJyD17jN3+9UEwAeb/LkXWSiWR26cn/2afE7o0Mts7gPZV7ZgcSBl2WsZ3hGcSiQ/YDMUG9ekaCAaafyGzDzwek=
X-Received: by 2002:ac8:7d55:0:b0:305:732:680b with SMTP id
 h21-20020ac87d55000000b003050732680bmr3744165qtb.391.1654737615506; Wed, 08
 Jun 2022 18:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220608161405.729964-1-apatel@ventanamicro.com>
 <20220608161405.729964-2-apatel@ventanamicro.com>
In-Reply-To: <20220608161405.729964-2-apatel@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 9 Jun 2022 09:20:04 +0800
Message-ID: <CAEUhbmXP4dKRdEFUMtk=ZBCrDVBxgNmfkNBitS3pj7+HoNmCYA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] target/riscv: Don't force update priv spec version
 to latest
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x834.google.com
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
X-List-Received-Date: Thu, 09 Jun 2022 01:20:21 -0000

On Thu, Jun 9, 2022 at 12:15 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The riscv_cpu_realize() sets priv spec verion to v1.12 when it is

typo: version

> when "env->priv_ver == 0" (i.e. default v1.10) because the enum
> value of priv spec v1.10 is zero.
>
> Due to above issue, the sifive_u machine will see priv spec v1.12
> instead of priv spec v1.10.
>
> To fix this issue, we set latest priv spec version (i.e. v1.12)
> for base rv64/rv32 cpu and riscv_cpu_realize() will override priv
> spec version only when "cpu->cfg.priv_spec != NULL".
>
> Fixes: 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

