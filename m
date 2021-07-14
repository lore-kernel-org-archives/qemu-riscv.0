Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3aXH-00041F-Uh
	for mharc-qemu-riscv@gnu.org; Wed, 14 Jul 2021 04:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3aXG-00040j-0G
 for qemu-riscv@nongnu.org; Wed, 14 Jul 2021 04:46:30 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3aXE-0003ZW-Ev
 for qemu-riscv@nongnu.org; Wed, 14 Jul 2021 04:46:29 -0400
Received: by mail-ed1-x531.google.com with SMTP id k27so2026566edk.9
 for <qemu-riscv@nongnu.org>; Wed, 14 Jul 2021 01:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsASkpMH2Xzm8avyWRpMBEbjWH6i2fQvU+VKO6Pg0kk=;
 b=yLTXjR2vGT/DdCJugTf6TuMYVz9uPWNuqeLMEel3JLoZRoHh34uWP3aNyLmLDuqJyR
 TXLgP1JgGAT2+dgkO9JUrVGJRpYc2o7vh6TLXgizblUOcr5SaG4WZ0LBWG43gojd7CvK
 p/Rd5QAa5xI1KfwPq4SDnmx+JuwUBnc+iPMSoi8yqG1Bxod2/Pr6CHZZ44nSpI5S9FIz
 iSKx7QbhMllPA1/qgEwUO0xh6eAcpt84Yp/GAhqziAyvYOuFC7TP2IKZ2kv6v0jKToiT
 Q5kAziJpxulVUL8UgJ9+B/g2mnUkQUDsTl0DdGZJMPmcm5QGpGRNinCer802daG3qPB4
 bvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsASkpMH2Xzm8avyWRpMBEbjWH6i2fQvU+VKO6Pg0kk=;
 b=YtXqUPMLqWS7rNwouCxVeiUTQCR1KTOIJTbowSPblqNr/4IBT6kaPWS5WOBitEeqQY
 /CepchcNitgD0vCswggEkq2Gpxy3TfcSDSlCzBzGtEWOrtGf3rRFCXYHnEybu6Yry6gS
 NpTF2c15MPUVpTmMi/wGh3WomaRMJpgMlBZK6QhNulPyi7IJ+dIqnz0mi2IwKpqoWkxa
 GcwWUcWqXV/nR6kyifdpi6KBlDqf0wztyz6BBpQyFnkVAGO4GlXbwaVKeDSxCP0exRt5
 t9I7ZW97P/LxEPC50xR6eXLb36rhvQ6PCRDJCBJtRZci9tFMyRgBDybMfhI1a6iih2yl
 PA3g==
X-Gm-Message-State: AOAM5330qdPvHKlbbQj9elmrJDfwc5sgD+8t0rmSVujGp3AkVFzQq5kC
 TgrAMGKutue2k2zwKhpp/ky4/ElrDS2LOise4vt5yw==
X-Google-Smtp-Source: ABdhPJxVJWZtJRs+qlsyNgZLGNo5FRG3vVM94Hl94a1zPLUF+QoaKzud6P8vjLP7KI98H5FJyxHbiQqWRu1n7KI6VNQ=
X-Received: by 2002:aa7:d809:: with SMTP id v9mr12242316edq.146.1626252386681; 
 Wed, 14 Jul 2021 01:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <da5acadd07eabd5a6e9fc8870fecb435173b8f47.1626247332.git.alistair.francis@wdc.com>
In-Reply-To: <da5acadd07eabd5a6e9fc8870fecb435173b8f47.1626247332.git.alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Jul 2021 09:45:47 +0100
Message-ID: <CAFEAcA_naB0ysANAZYhEEVG4XgN0He4zj7UTwUrKHY4SxJ76UA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/riscv/boot: Check the error of fdt_pack()
To: Alistair Francis <alistair.francis@wdc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 14 Jul 2021 08:46:30 -0000

On Wed, 14 Jul 2021 at 08:22, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> Coverity reports that we don't check the error result of fdt_pack(), so
> let's save the result and assert that it is 0.
>
> Fixes: Coverity CID 1458136
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/boot.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 0d38bb7426..25406a3f67 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -182,7 +182,7 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>  {
>      uint32_t temp, fdt_addr;
>      hwaddr dram_end = dram_base + mem_size;
> -    int fdtsize = fdt_totalsize(fdt);
> +    int ret, fdtsize = fdt_totalsize(fdt);
>
>      if (fdtsize <= 0) {
>          error_report("invalid device-tree");
> @@ -198,7 +198,8 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>      temp = MIN(dram_end, 3072 * MiB);
>      fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
>
> -    fdt_pack(fdt);
> +    ret = fdt_pack(fdt);
> +    g_assert(ret == 0);
>      /* copy in the device tree */
>      qemu_fdt_dumpdtb(fdt, fdtsize);

Are we in the same situation as spapr.c where we believe the call
will only fail if the fdt was corrupt somehow? If so, it would be
nice to also have the comment from spapr.c:
        /* Should only fail if we've built a corrupted tree */

thanks
-- PMM

