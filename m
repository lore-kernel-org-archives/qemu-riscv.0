Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jV6R4-0007Tk-6w
	for mharc-qemu-riscv@gnu.org; Sun, 03 May 2020 00:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1jV6R2-0007Ro-HE
 for qemu-riscv@nongnu.org; Sun, 03 May 2020 00:41:00 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1jV6R0-0006sa-Si
 for qemu-riscv@nongnu.org; Sun, 03 May 2020 00:41:00 -0400
Received: by mail-wm1-x343.google.com with SMTP id x25so4606195wmc.0
 for <qemu-riscv@nongnu.org>; Sat, 02 May 2020 21:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RimjZ7WkFfKRUws7pVSN5jCnQogAheTvnqGcbUpcMD8=;
 b=ebDrmoyvEDObS8rmCedj/G+r7Wfc9AGGy2Bbo3lQlthh5YqsFXptNK7UgmQwpOl0rX
 BrOvTJVnX7GTs3veu27kdoaeSYRaALeb6to8CZ76/1q9V3XqelU16o29mTXJQZKYSSns
 RdLjBsLUx40v29nd2fpQPLEChIdUyNNWFLw5CDXU/zo+eaHVtg4NU0ZDVunF85ADIQok
 RNyX7q+O+mFV8GB30BxYWYrNxz66ik4uk4LamH5jKyV6AE59aHvBo/Mh4fWzvDmvnC+l
 LYv/rWOp7Z2aw/1niSquUmhyhiRa3wzz+qaOk2BwQ3Wyh90G2tnGoTTZgMTQwWdu8DvL
 NLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RimjZ7WkFfKRUws7pVSN5jCnQogAheTvnqGcbUpcMD8=;
 b=JFye7dNtew/+TV3iTYlApW/uhzgjTaP8vG2OwogfavpvG+79TM+oodm7jUTY9tu0m/
 D/F+gUjWkB5Mao85nm1FzCfenEmgVaaj5FQ8uuxxxywBw/xrAkas1/qWLMRj2f9eNQCY
 DWL3yEptktBSOTIUzH5P3ZDnxDB/OxJl83VdTjlyYnklVSHEax0fwUEnnhqTft7/K1eT
 QDUGVw4jTiMeJMnbFI/95IY7h+BXx+rH4GgQ+wcpTwTwRZfmA7w03M8uaH2AvQSXjzAu
 Cohw8nKxeO1GawbMvgOKQMgQfv9ZQD2HtG4k/Wx8zxW81Uu26sa27YnH39Vz4S857uC4
 5y3Q==
X-Gm-Message-State: AGi0Pua/GYslwou8EF2IWltgZr5c9SLqecJT3t7Wvm82CqhOrEl6eaXH
 WGjl95m2/rLug4JN/JF4/507Q149ipY5/EWmEUKbmA==
X-Google-Smtp-Source: APiQypK7QI5xRIXqLKxTvAFX6S4zUSPFRjZlcu3CA23SQFqVxI0HgK7fVnTnYxSqWlaquYG10ALjUJg+Rn7C3aB21kQ=
X-Received: by 2002:a7b:cc92:: with SMTP id p18mr8115154wma.26.1588480857385; 
 Sat, 02 May 2020 21:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <1588348254-7241-1-git-send-email-bmeng.cn@gmail.com>
 <1588348254-7241-3-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1588348254-7241-3-git-send-email-bmeng.cn@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 3 May 2020 10:10:44 +0530
Message-ID: <CAAhSdy3z8ezUx+ozdupR5c5AKLhsfonSFHgrk_Yco2ZH4JubFQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] gitlab-ci/opensbi: Update GitLab CI to build generic
 platform
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::343;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 03 May 2020 04:41:00 -0000

On Fri, May 1, 2020 at 9:24 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This updates the GitLab CI opensbi job to build opensbi bios images
> for the generic platform.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  .gitlab-ci-opensbi.yml | 26 ++++++++------------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
>
> diff --git a/.gitlab-ci-opensbi.yml b/.gitlab-ci-opensbi.yml
> index dd051c0..26092bb 100644
> --- a/.gitlab-ci-opensbi.yml
> +++ b/.gitlab-ci-opensbi.yml
> @@ -34,18 +34,12 @@ build-opensbi:
>     when: always
>   artifacts:
>     paths: # 'artifacts.zip' will contains the following files:
> -   - pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin
> -   - pc-bios/opensbi-riscv32-virt-fw_jump.bin
> -   - pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
> -   - pc-bios/opensbi-riscv64-virt-fw_jump.bin
> -   - opensbi32-virt-stdout.log
> -   - opensbi32-virt-stderr.log
> -   - opensbi64-virt-stdout.log
> -   - opensbi64-virt-stderr.log
> -   - opensbi32-sifive_u-stdout.log
> -   - opensbi32-sifive_u-stderr.log
> -   - opensbi64-sifive_u-stdout.log
> -   - opensbi64-sifive_u-stderr.log
> +   - pc-bios/opensbi-riscv32-generic-fw_jump.bin
> +   - pc-bios/opensbi-riscv64-generic-fw_jump.bin

Same comment as PATCH1

We should add generic-fw_jump.elf here as well.

> +   - opensbi32-generic-stdout.log
> +   - opensbi32-generic-stderr.log
> +   - opensbi64-generic-stdout.log
> +   - opensbi64-generic-stderr.log
>   image: $CI_REGISTRY_IMAGE:opensbi-cross-build
>   variables:
>     GIT_DEPTH: 3
> @@ -54,10 +48,6 @@ build-opensbi:
>   - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
>   - echo "=== Using ${JOBS} simultaneous jobs ==="
>   - make -j${JOBS} -C roms/opensbi clean
> - - make -j${JOBS} -C roms opensbi32-virt 2>&1 1>opensbi32-virt-stdout.log | tee -a opensbi32-virt-stderr.log >&2
> + - make -j${JOBS} -C roms opensbi32-generic 2>&1 1>opensbi32-generic-stdout.log | tee -a opensbi32-generic-stderr.log >&2
>   - make -j${JOBS} -C roms/opensbi clean
> - - make -j${JOBS} -C roms opensbi64-virt 2>&1 1>opensbi64-virt-stdout.log | tee -a opensbi64-virt-stderr.log >&2
> - - make -j${JOBS} -C roms/opensbi clean
> - - make -j${JOBS} -C roms opensbi32-sifive_u 2>&1 1>opensbi32-sifive_u-stdout.log | tee -a opensbi32-sifive_u-stderr.log >&2
> - - make -j${JOBS} -C roms/opensbi clean
> - - make -j${JOBS} -C roms opensbi64-sifive_u 2>&1 1>opensbi64-sifive_u-stdout.log | tee -a opensbi64-sifive_u-stderr.log >&2
> + - make -j${JOBS} -C roms opensbi64-generic 2>&1 1>opensbi64-generic-stdout.log | tee -a opensbi64-generic-stderr.log >&2
> --
> 2.7.4
>
>

Otherwise looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

