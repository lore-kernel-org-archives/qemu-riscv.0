Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG8sT-0001Rw-QR
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 20:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pG8sR-0001Ph-0P; Thu, 12 Jan 2023 20:29:04 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pG8sP-0002YS-5Z; Thu, 12 Jan 2023 20:29:02 -0500
Received: by mail-ej1-x62e.google.com with SMTP id qk9so48973704ejc.3;
 Thu, 12 Jan 2023 17:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9A1ZZW2o7YNRm6qWBBlZkKmOqbhIJuRs6thTCITuwEU=;
 b=FR7UVVraxh14X29L8+KryP397lnzkobLwlyfzTtphYHUcNQxh+Yf36Lb7LV8ZMQaei
 cbXIZV9u+C/IpX65oJBNarhol1adjVemp9MRuWrVJaTJpHFFqpHiwyHhcEndRTX59v9z
 NbqsXp6+mnqnXIqyGcmWB3KNCMtYuz/EcDGrTX68b0lxVmod+TqxY23DTAeor2X43TkA
 GW80RfHQ9fT+TV76lwvfg0I/y9ZXbQrPZOI6bdxkXMyfUKnRF4z7cvI0vOWG7R6jewC3
 rH1Ls0mx2dER93iBU/QVYqtljBZopETOFwIoDQyYeyqwlifAXvq64yD6AXeS3x9lnrzU
 HsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9A1ZZW2o7YNRm6qWBBlZkKmOqbhIJuRs6thTCITuwEU=;
 b=RF1eL4SDRsRJTgtqSOkYvB3b9LsjfxF4ZZqYSpjkALxrwCwhLj53hR7u90B2KAcvjH
 zS7yJxHfintwR4Orc0K18knkZ+ENdVD72OYL4V+TkyIIVGdgrIZ9cSqM19cTu4aN1PId
 oufHfHA+UVjYCrDLDglIi186btrxrDF61FkhIrX6ur3Bm9eyy5fb0ToohmH7gkyrQl5m
 M+3R94yO5y5YTkVc198Il3fEUqwrEB+1LuPV4O6wHg2VRMHUvtxKTw0kc2MNypl+cDAn
 iZ7RTn5iKIwMDjjbrKiWdxxNPfMLC1xDUyqXenhynZvcWRy4YcB+eqefb2HXYhu6j7eh
 H4Ig==
X-Gm-Message-State: AFqh2koQXRyxBnITlFNnJHCzPqbPe7exPoFIZOJF8JNGZo2uh8u5oTzv
 OECnqyjLaHnhqQ31xUlMXf4oCUIlOtx3/6d4uKU=
X-Google-Smtp-Source: AMrXdXsaTbzxk+401PKXru+axyeK5eKwYNpvB+MOw8VVvc65tF0v4WSsf5Ds+Xr2ITdMQ/3VEEIpOFhpQ0K4hCnZ93A=
X-Received: by 2002:a17:906:1945:b0:7c0:bb4c:e792 with SMTP id
 b5-20020a170906194500b007c0bb4ce792mr6334293eje.618.1673573338504; Thu, 12
 Jan 2023 17:28:58 -0800 (PST)
MIME-Version: 1.0
References: <20230110201405.247785-1-dbarboza@ventanamicro.com>
 <CAKmqyKM=7Ld0FuZ7FfzTKznpM5Zq1xzAKd-iVxqjk6TPbred2g@mail.gmail.com>
In-Reply-To: <CAKmqyKM=7Ld0FuZ7FfzTKznpM5Zq1xzAKd-iVxqjk6TPbred2g@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 13 Jan 2023 09:28:37 +0800
Message-ID: <CAEUhbmWbcWNQxP8O+56qYjUPsmgyP+qhOTYRRmDUimXV6s42_Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/riscv/cpu: fix sifive_u 32/64bits boot in
 riscv-to-apply.next
To: Alistair Francis <alistair23@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 01:29:04 -0000

Hi Daniel,

On Wed, Jan 11, 2023 at 1:03 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Jan 11, 2023 at 6:17 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> > Hi,
> >
> > I found this bug when testing my avocado changes in riscv-to-apply.next.
> > The sifive_u board, both 32 and 64 bits, stopped booting OpenSBI. The
> > guest hangs indefinitely.
> >
> > Git bisect points that this patch broke things:
> >
> > 8c3f35d25e7e98655c609b6c1e9f103b9240f8f8 is the first bad commit
> > commit 8c3f35d25e7e98655c609b6c1e9f103b9240f8f8
> > Author: Weiwei Li <liweiwei@iscas.ac.cn>
> > Date:   Wed Dec 28 14:20:21 2022 +0800
> >
> >     target/riscv: add support for Zca extension
> >
> >     Modify the check for C extension to Zca (C implies Zca)
> > (https://github.com/alistair23/qemu/commit/8c3f35d25e7e98655c609b6c1e9f103b9240f8f8)
> >
> >
> > But this patch per se isn't doing anything wrong. The root of the
> > problem is that this patch makes assumptions based on the previous
> > patch:
> >
> > commit a2b409aa6cadc1ed9715e1ab916ddd3dade0ba85
> > Author: Weiwei Li <liweiwei@iscas.ac.cn>
> > Date:   Wed Dec 28 14:20:20 2022 +0800
> >
> >     target/riscv: add cfg properties for Zc* extension
> > (https://github.com/alistair23/qemu/commit/a2b409aa6cadc1ed9715e1ab916ddd3dade0ba85)
> >
> > Which added a lot of logic and assumptions that are being skipped by all
> > the SiFive boards because, during riscv_cpu_realize(), we have this
> > code:
> >
> >     /* If only MISA_EXT is unset for misa, then set it from properties */
> >     if (env->misa_ext == 0) {
> >         uint32_t ext = 0;
> >         (...)
> >     }
> >
> > In short, we have a lot of code that are being skipped by all SiFive
> > CPUs because these CPUs are setting a non-zero value in set_misa() in
> > their respective cpu_init() functions.
> >
> > It's possible to just hack in and fix the SiFive problem in isolate, but
> > I believe we can do better and allow all riscv_cpu_realize() to be executed
> > for all CPUs, regardless of what they've done during their cpu_init().
> >
> >
> > Daniel Henrique Barboza (2):
> >   target/riscv/cpu: set cpu->cfg in register_cpu_props()
> >   target/riscv/cpu.c: do not skip misa logic in riscv_cpu_realize()
>
> Thanks for the patches
>
> I have rebased these onto the latest master and dropped the other
> series. That way when the other series is applied we don't break
> bisectability.

It seems these 2 patches are already in Alistair's tree.

Richard had a suggestion for patch 1 and I had some minor comments
too. Do you plan to resend a v2 for that?

Regards,
Bin

