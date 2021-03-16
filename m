Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMFvd-0006Mh-Ib
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 16:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMFva-0006JL-NA; Tue, 16 Mar 2021 16:04:31 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:46305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMFvY-0003pn-Bw; Tue, 16 Mar 2021 16:04:30 -0400
Received: by mail-qk1-x72e.google.com with SMTP id a9so36576639qkn.13;
 Tue, 16 Mar 2021 13:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bWJzvR03iQXQ9WGmQlNkmjZ5o0XymkPhxKV/ibg2mGU=;
 b=N+zOB0GHstFXfnOJwaL1Ejauw26FSDj54goPR2bAIlpbQq/RGbu4l/eLJOnpY/Dg8W
 dtO/ZU+xWkVpa2EltWyzEACHWhawJjERVKQ4f6muYb1ex2nGZcaKmuAdW4aheKxMOUvt
 pa1tqa2DqZ3boh8Xf1Y4XxTGbt6CbHykBj+SqXSSiGpbbyoCMgTL3uwSgEYefSTHrjcr
 RlzFZWQlmdCEBKD3Nq5cMyWf0ES1qvsjd4b54KC8ybFYcTDj3de82ZZ+G4Ifcgt93amu
 SDalJYoxcTRAK4EVDQVzc93aicUzU+wRumreL+yhwSCnwLXhgKXUn74lYG9fLekpK+AI
 Oqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWJzvR03iQXQ9WGmQlNkmjZ5o0XymkPhxKV/ibg2mGU=;
 b=b3TvGLVnTRJm9n652cCjDn+DkgsRKJDdaT69kvN/C4IBwysbrZneTKIBJIWsNudF92
 ZqsTYZDC6cSUa032fG4pKgDUhM6ftzHm6524G3/X/QvB3gE/D6zBjQmoVuSAFFrDhm1j
 MSy8TmPoud4bRdge4OZ4YzGBIxfJ570eRkcUKaFhTnkGPV7DJQS2UKz1xWwnkDwaceP9
 nQU7szVzlqzU3LoRbnw6QszRaE6KcdqTGbiq8zi+kQ/ci1ZQhzu4l8lEMIIlSi+6pXfn
 Auv9ggg5uU9NERhHarPH04B0VZUvBQDxDdyHRgURioLsjWOvu3QLLGnkfqg738b7BZTX
 NbPg==
X-Gm-Message-State: AOAM532uPepi31L3QAmSGmAwTX2D27PWv4tOUqc6yTivE3PpY3gtfxUj
 9GMENAyYzqVbTGTDwS/Kc2kWKNSI8OsbJqJLjEw=
X-Google-Smtp-Source: ABdhPJz6M/+dQMYZtCU6KaZNhIXpJU1+ZrArlgkJcYbHdPc5hMoyaDhI1fAvzHbdmBXgBHK27zYnifBnElt4Qpe0UEs=
X-Received: by 2002:a05:620a:1483:: with SMTP id
 w3mr791919qkj.339.1615925067069; 
 Tue, 16 Mar 2021 13:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <1613916082-19528-1-git-send-email-cwshu@andestech.com>
 <1613916082-19528-4-git-send-email-cwshu@andestech.com>
In-Reply-To: <1613916082-19528-4-git-send-email-cwshu@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Mar 2021 16:02:50 -0400
Message-ID: <CAKmqyKMYkYcDVpnMtQ9oJuLzDB0Wn2DreevMkJA3wsCbpqJKnA@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/riscv: flush TLB pages if PMP permission has
 been changed
To: Jim Shu <cwshu@andestech.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x72e.google.com
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
X-List-Received-Date: Tue, 16 Mar 2021 20:04:31 -0000

On Sun, Feb 21, 2021 at 10:31 AM Jim Shu <cwshu@andestech.com> wrote:
>
> If PMP permission of any address has been changed by updating PMP entry,
> flush all TLB pages to prevent from getting old permission.
>
> Signed-off-by: Jim Shu <cwshu@andestech.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index ebd874cde3..cff020122a 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -28,6 +28,7 @@
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "trace.h"
> +#include "exec/exec-all.h"
>
>  static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
>      uint8_t val);
> @@ -347,6 +348,9 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>          cfg_val = (val >> 8 * i)  & 0xff;
>          pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
>      }
> +
> +    /* If PMP permission of any addr has been changed, flush TLB pages. */
> +    tlb_flush(env_cpu(env));
>  }
>
>
> --
> 2.30.1
>
>

