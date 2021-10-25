Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1methR-0003gj-Sq
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 02:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1methQ-0003eo-4E; Mon, 25 Oct 2021 02:43:12 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:45942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1methK-0005tH-Hc; Mon, 25 Oct 2021 02:43:11 -0400
Received: by mail-il1-x12e.google.com with SMTP id i6so11649906ila.12;
 Sun, 24 Oct 2021 23:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QVEpYRKLXZQahOc2YgQH83gu0IvJN6M0iKf6LgMjYXY=;
 b=lwhtrUPWjOjLlK315QMbmtHkob8HLFC8/ew9GNzwI921UwpjiRWUikwmaAA+kAdzjg
 9LJXSqVJIjXbN/PzlSPJPqwO5rAmSK6igroZewrOX7WB8TliPZhfGAIHH+hpTbzrL4p9
 58TS9QrUJyyxY8b+QzYD0c4XgtxGDxhiKK2xu+OEIZlliaOIJ8by6VqPT9/Edj7ldgLm
 +sNNiwBRHJWdnSQxP7pasjbESbQ3jv8f0rhccz+O+fxY9CtM6SHeg70tsraM99ol5oVI
 IIhQMbZ1Aot53DE0P2vy5DO+0F9qBtfRtvfkgPGC7ednFI+EFZYkkVPYbiN7REKua2I3
 ZWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QVEpYRKLXZQahOc2YgQH83gu0IvJN6M0iKf6LgMjYXY=;
 b=euK+OS87kC47RzZX9L6VfYoZnKpnBMPAXVLQo+w0oumS31opO1tSqPd6Fv3nTT6HlU
 GpaZpaE0mpB1qKh6jgFlBP7X3LB5f1XCJIo+vpXxTAbJvCgV4JZtU4Xjtj3dGadlrPVo
 kO1RE+mP4dPpsnF90kWOaTO34z61jG1L+KeHrIGlZRVUZnhxyOu7l3U7G4FU1PmabFbk
 LtTIesy7vntvFKx9jgCrsvhzGMvBNVfMvyvuDlCzLiZDP/S8562bgJPbdKE5mcUYXrLQ
 xlUTWNi7gHf3sq2m1LjcV3+nGEJTAnVzmYQRjxT4BbG+bF0mekionHbdvQ5vcfZcrzb9
 LqDw==
X-Gm-Message-State: AOAM533/VzUN8hNfTQebq+hr2rniaVb0uCdV0zLOwv9HFP9VBq9Z8OJ/
 R4KLLdm7EWibQCD40CRtv1U7q2SZogiR4VxL82Q=
X-Google-Smtp-Source: ABdhPJzHoIVKt3z8VsC/PaiQBrT1kFMfMzdyxmgllYdM5lHNnIWLyOP6bp43dgYmXjROSXzr2hQi2ZecharxPViQERo=
X-Received: by 2002:a05:6e02:1b81:: with SMTP id
 h1mr5093447ili.290.1635144185265; 
 Sun, 24 Oct 2021 23:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-80-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-80-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Oct 2021 16:42:39 +1000
Message-ID: <CAKmqyKOPmGc-j9x9Zf2Dm1KJ5v5RCU+GGNfH+e3-YFyNHGR0jw@mail.gmail.com>
Subject: Re: [PATCH v8 72/78] target/riscv: set mstatus.SD bit when writing fp
 CSRs
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 06:43:12 -0000

On Fri, Oct 15, 2021 at 6:44 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Hey Frank,

You will need to rebase this on the latest master branch.

Alistair

> ---
>  target/riscv/csr.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9f51626a3d8..3929abb112a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -224,7 +224,8 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->mstatus |= MSTATUS_FS;
> +    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
> +    env->mstatus |= MSTATUS_FS | sd;
>  #endif
>      riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
>      return RISCV_EXCP_NONE;
> @@ -241,7 +242,8 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
>                                  target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->mstatus |= MSTATUS_FS;
> +    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
> +    env->mstatus |= MSTATUS_FS | sd;
>  #endif
>      env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
>      return RISCV_EXCP_NONE;
> @@ -259,7 +261,8 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->mstatus |= MSTATUS_FS;
> +    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
> +    env->mstatus |= MSTATUS_FS | sd;
>  #endif
>      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
>      riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
> --
> 2.25.1
>
>

