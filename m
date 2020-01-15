Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ircD0-0007yT-QA
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jan 2020 01:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1ircCt-0007us-1g
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 01:31:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1ircCr-0002Qt-RJ
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 01:31:10 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:37319)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1ircCr-0002On-3U; Wed, 15 Jan 2020 01:31:09 -0500
Received: by mail-lj1-x243.google.com with SMTP id o13so17202433ljg.4;
 Tue, 14 Jan 2020 22:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fT4DwVAI/XW7iNya/ESjlANaFxvSSdI9/CPID1PVCf8=;
 b=P0eeMYRkJEyAlW7HdptlfN+hSTvc2SxMZKpY9rY7KNoy6hkpEHK3rTp6w9SUbaTEn2
 iECsLSJJ7gzWOzwYXLthxbgEFRHs1/OYBFl219AEaDiD0NZvUoQj7YH3H0JAtUgP7w9c
 zbne4Ck4mmTGP9X5p71clJ/MIv+6SPjUn65taY90bS9KldAI/cg9UvnAGpUs2vYpOgcT
 htPweawp+R3a3T37nIyGpu27Qp/6aFyEh2gSPEjsWm5ACwIM0ReAtMHtaFCGqr3Q34LF
 8SUjjpHqA7HyD4GHcoiIfqcZUlRQgUwal9sm4MEqKB9LC8oMHrljHmJxFMD1dcAnUILe
 xU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fT4DwVAI/XW7iNya/ESjlANaFxvSSdI9/CPID1PVCf8=;
 b=RjAtJu1sP8xvDi6SD6dlHwAPTOUZwr+WtpiMNlRJ0/A9tD9bf2a5sNw1enVfLNRivR
 QP7qaAWNp1HsbLBGfVFjZClUddutqTtPYW/bTCC4r6fqF/wagA+b+NZgTUr/rcoHmftG
 AKM+wJRFst8rxmnpJ5KAaceviYm2uKc3q1Y73Dx5Eag+VU0luLRXKarnse6M7Ug6Eotb
 LtPsowlWAtLB5hhQwqpEeMnki0KJzPwtIaAQwtUdrASNVfaPwVjxHQPJn9JNa8Uu2Bd4
 lqnbLMfiiGwBekWHgayHNht0p/0o3OBQGqC2iVjPk8vEHvtVN5AkoRuYWsuqZtMza5CH
 9ksQ==
X-Gm-Message-State: APjAAAWf+EwM9p3KXvSzcDTfHCTYX/whC5WUBoI2+b4ZRfYTXwpfLWfq
 vqIpYsSWCWLNNIHAJG+PwlKZ+QnlE4TiRhmNafQ=
X-Google-Smtp-Source: APXvYqysio9N7NP4msiHzlak3JGQ29K2MRiodbD/wLaUNmaBD28PSwPRGt73y9oIc+jw7V9xcTvGFLc7zTd+Yo0CTCk=
X-Received: by 2002:a2e:9157:: with SMTP id q23mr816611ljg.196.1579069866433; 
 Tue, 14 Jan 2020 22:31:06 -0800 (PST)
MIME-Version: 1.0
References: <1579069053-22190-1-git-send-email-shihpo.hung@sifive.com>
 <1579069053-22190-3-git-send-email-shihpo.hung@sifive.com>
In-Reply-To: <1579069053-22190-3-git-send-email-shihpo.hung@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Jan 2020 16:30:40 +1000
Message-ID: <CAKmqyKPuuKXPwPoZ7dWQ9QR0zN2RkcXXCwFhKLV8jVSmX84Oxw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] target/riscv: update mstatus.SD when FS is set
 dirty
To: shihpo.hung@sifive.com
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
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
X-List-Received-Date: Wed, 15 Jan 2020 06:31:17 -0000

On Wed, Jan 15, 2020 at 4:19 PM <shihpo.hung@sifive.com> wrote:
>
> remove the check becuase SD bit should summarize FS and XS fields
> unconditionally.
>
> Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c       | 3 +--
>  target/riscv/translate.c | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index da02f9f..0e34c29 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -341,8 +341,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
>
>      mstatus = (mstatus & ~mask) | (val & mask);
>
> -    dirty = (riscv_cpu_fp_enabled(env) &&
> -             ((mstatus & MSTATUS_FS) == MSTATUS_FS)) |
> +    dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
>              ((mstatus & MSTATUS_XS) == MSTATUS_XS);
>      mstatus = set_field(mstatus, MSTATUS_SD, dirty);
>      env->mstatus = mstatus;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index ab6a891..8e40ed3 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -394,7 +394,7 @@ static void mark_fs_dirty(DisasContext *ctx)
>
>      tmp = tcg_temp_new();
>      tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
> +    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
>      tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>      tcg_temp_free(tmp);
>  }
> --
> 2.7.4
>
>

