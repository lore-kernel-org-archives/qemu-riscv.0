Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lt6WP-0002AF-Qx
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jun 2021 06:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt6WO-00028H-IE; Tue, 15 Jun 2021 06:42:16 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:42558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt6WM-0007bY-SR; Tue, 15 Jun 2021 06:42:16 -0400
Received: by mail-io1-xd2e.google.com with SMTP id s26so13741456ioe.9;
 Tue, 15 Jun 2021 03:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rtiUA0A/59Z5rvCaTYBAA8BF21quKgoZxIEYA30Daq8=;
 b=fxC8wT9mMlQcSSGkWwgsKkUIeUhuGe+PpxauCX7NMNbL2vfQuF5h/Mh+aJnPRhot8H
 datpC8EfBwQ+Rl72arvqGYIY7QjZX6J/034BIm3bXIt67yY7S1ieR0F7ItoTJKUGM7wY
 UwruHNEc7ODmMMePoX9mFsVAOBwxSZnE/s4TLo2E6PiEQ0vfB3/FUeGbs/Jd/NR2r3Bp
 r9TaEcylzoLhZUCFIky72S/9s+UIxs+6BHOAkt+pBtn4JNqiEuj3QHv6wh++mtDfp5nw
 VZNIoMk68t1fpCVi4K7bazNGPTVrUpcWiQ45Qe502L4m/iQ5qqGU51LNPHyM7XLbUX+C
 huaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtiUA0A/59Z5rvCaTYBAA8BF21quKgoZxIEYA30Daq8=;
 b=mXIGwB/9SyZCR4psoTAREUCy86z0sgDHDNsPN+G0VmLgJ2fRpE8+PRnnZWsAG0IqsG
 HUs5gzEJ1p2vs5geWUXLbIu1suq3qOj4ttACC+uiSiXVRtSBQxCBWdCLyPUUVSJIMayY
 4EeowlH/q+WIh1+qDmtefjS7+RmddgWC7g1zSZoD9o1EueWq54lzI4EepG9aaqftkr+K
 v5lJSEDNzwj4A+XqzsHt+WKcBXyAhcAJjcD1OwXR8E4SxEBWzguHNNFqzab1HHyhNVwK
 XDqAJGPMpvyQL/ujh+Uj+dWVmB9T3BkeveB7lPrXVnTfcxVOdLWN3htmJ9LmDoHqi/id
 mOVQ==
X-Gm-Message-State: AOAM5307qxz31fSDZJy4oiEzjc47opg5fVX1+Kogh3wZ0wZkmn/UU5rJ
 v6ILXyj82/s2GRzCOLX3iY+/deXVQBeLOkKM530=
X-Google-Smtp-Source: ABdhPJxdUOPiJ55O3A9mWoOvKg4gQDEvxAphPSpzYkOG/0OfNcQr/CgiXLMvOTI485Nw5IgDFC+rf+LBj0aV4cVBD+A=
X-Received: by 2002:a05:6638:1355:: with SMTP id
 u21mr2641132jad.106.1623753733358; 
 Tue, 15 Jun 2021 03:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210615085133.389887-1-bmeng.cn@gmail.com>
In-Reply-To: <20210615085133.389887-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Jun 2021 20:41:47 +1000
Message-ID: <CAKmqyKMrENz2X0W14KG-p+9ZMpTxVCfE_YYLSXBqHcGBUryxHw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: gdbstub: Fix dynamic CSR XML generation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jun 2021 10:42:16 -0000

On Tue, Jun 15, 2021 at 6:51 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Since commit 605def6eeee5 ("target/riscv: Use the RISCVException enum for CSR operations")
> the CSR predicate() function was changed to return RISCV_EXCP_NONE
> instead of 0 for a valid CSR, but it forgot to update the dynamic
> CSR XML generation codes in gdbstub.
>
> Fixes: 605def6eeee5 ("target/riscv: Use the RISCVException enum for CSR operations")
> Reported-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Tested-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/gdbstub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index ca78682cf4..a7a9c0b1fe 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -170,7 +170,7 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>
>      for (i = 0; i < CSR_TABLE_SIZE; i++) {
>          predicate = csr_ops[i].predicate;
> -        if (predicate && !predicate(env, i)) {
> +        if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
>              if (csr_ops[i].name) {
>                  g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
>              } else {
> --
> 2.25.1
>
>

