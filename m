Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLy1R-0004Gy-Hf
	for mharc-qemu-riscv@gnu.org; Sat, 28 Jan 2023 22:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pLy1Q-0004Gb-1z; Sat, 28 Jan 2023 22:06:24 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pLy1O-0000sV-GD; Sat, 28 Jan 2023 22:06:23 -0500
Received: by mail-ej1-x636.google.com with SMTP id ud5so23284582ejc.4;
 Sat, 28 Jan 2023 19:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vIYkdqunurwh8P2gFKYHKvjT4itwtXwM5y2oVwh82PU=;
 b=ZqTedarW6/Am/0vYwCMO8kyXyRRNx7VVuVC/0cnPLtbKbCVGcc423f5UwGZmyDgIg+
 Heiq2qqZb4NOavP63LK/EOs9cih7M6E9Tjf6+qZLaoPHqNjHBFiJ0HJaDd7HxgjxgKed
 T/S/lYVXzbypEDFl/SyqoUekLRPSBYroHrBvpC0dkaPKXr9PC3bUSvBNDebRYoLPrzmB
 LZR+E2N5Dog2lQYSzzSOiEGT3J+2i8ozn9goznyKg2z0h0CG6+S56OoM7CNRo+RKYZd1
 tHN2suOk+zwGQd5cWQXY4t1sd9qEC0aeVU3eSVp1Zh6ULx9mdeJ8HmN/+tM9rfTB40Df
 GU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vIYkdqunurwh8P2gFKYHKvjT4itwtXwM5y2oVwh82PU=;
 b=FQUceqDJ8dWNXzQOfuabxURfxtd6GbxZJmBruTMgf10nEhNdqbnKRc4SmJ5NCtkuZh
 bQIJZtEGwfG7L/nTgx5tDiGz4Hx8ZejMykVoDHGKuTsgio+fNMt4FOMaiJ6iXJ2vpQZG
 u6leslccpVcOEoY3NRWzQfxrBvmQpd1TX8iokiPnOoUN1CZtvJwZ+fTkfM+8pI/jnCum
 fru0SZrQxS3ZwOLqRUwTnSoft/HUrqD4lAztI77QuS5/NBmPPgKoV5CCBxUAuZ0u0lFK
 5OLZafyLI3YaFUzY3P7IUCvEMtlTobEnzXBbOhKPQ5Pr6nRXnjHcPQCDSZrOG1vD1xao
 hnuQ==
X-Gm-Message-State: AFqh2kpMokvVOYpzvHyVGKffz6BCg5PSXCx4XILIESffEH4HPORkMi8x
 KXUYOUEqhUxYSMA0OyyYp6ZdAv2I5mBjggkqNkg=
X-Google-Smtp-Source: AMrXdXuf6EvYoNPeTHX0eqOQN79Y4OJnA5lK3IIX1GqJzwC5RQNpbZ9x40fXEvUY3ra2Oe1oRDKgJWSMShZyqz4hzQI=
X-Received: by 2002:a17:907:a2c4:b0:877:5ff6:e340 with SMTP id
 re4-20020a170907a2c400b008775ff6e340mr6647540ejc.163.1674961580392; Sat, 28
 Jan 2023 19:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
 <20230126135219.1054658-2-dbarboza@ventanamicro.com>
 <CAEUhbmUyG1_6Aea-kt_dWNvqJtFMojuuUwABBOe4oPrecwLdOw@mail.gmail.com>
In-Reply-To: <CAEUhbmUyG1_6Aea-kt_dWNvqJtFMojuuUwABBOe4oPrecwLdOw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 29 Jan 2023 11:06:09 +0800
Message-ID: <CAEUhbmX6cGb6rCgp0w4Jv2HquE3kxb2rQ4siUtgH3t3BxaYAzw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] hw/riscv/boot.c: calculate fdt size after
 fdt_pack()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 29 Jan 2023 03:06:24 -0000

On Sun, Jan 29, 2023 at 10:20 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Daniel,
>
> On Thu, Jan 26, 2023 at 9:53 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> > fdt_pack() can change the fdt size, meaning that fdt_totalsize() can
> > contain a now deprecated (bigger) value.
>
> The commit message is a bit confusing.
>
> The original code in this patch does not call fdt_pack(). So not sure
> where the issue of "deprecated (bigger) value" happens?

I see where the call to fdt_pack() happens.

I think you should move the following changes in patch#2 of this
series to this commit.

-    ret = fdt_pack(fdt);
-    /* Should only fail if we've built a corrupted tree */
-    g_assert(ret == 0);

After that, your commit message makes sense, as it describes the
problem and how your patch fixes the problem.

>
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > ---
> >  hw/riscv/boot.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 3172a76220..a563b7482a 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -287,8 +287,13 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> >  {
> >      uint64_t temp, fdt_addr;
> >      hwaddr dram_end = dram_base + mem_size;
> > -    int ret, fdtsize = fdt_totalsize(fdt);
> > +    int ret = fdt_pack(fdt);
> > +    int fdtsize;
> >
> > +    /* Should only fail if we've built a corrupted tree */
> > +    g_assert(ret == 0);
> > +
> > +    fdtsize = fdt_totalsize(fdt);
> >      if (fdtsize <= 0) {
> >          error_report("invalid device-tree");
> >          exit(1);
>

Regards,
Bin

