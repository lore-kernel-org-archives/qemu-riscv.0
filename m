Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFoQX-00049I-HD
	for mharc-qemu-riscv@gnu.org; Wed, 02 Oct 2019 19:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53081)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iFoQV-000493-Bz
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 19:53:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iFoQU-00033T-7d
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 19:52:59 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33670)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iFoQU-00032t-1a
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 19:52:58 -0400
Received: by mail-pl1-x641.google.com with SMTP id d22so616577pls.0
 for <qemu-riscv@nongnu.org>; Wed, 02 Oct 2019 16:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YSnlhCmlA8Qg+kgyP8DOZPiH3d/vplXaX6h7i1qGnXU=;
 b=jNYXMMMRYVEhEFJCocpxW0Zjy/I/YUITHiFz2TuV3ZJ9OuCkYq3Mz1RKVj7EzgvLnd
 wk2mzB2DH1NDNosztZvBVVl76p2qUQv1BfFPpR4XW0OVGclGbwpM8U8sW7TVF9qLS62k
 YEfmPjAXY+3d1Ay6lR17wDvOpv/UT1QE4ajM93ZTLwFUjvOPvVsxkmq6fAH8rcWJdLZ8
 /ffubBtjtHeOIZOCbI7GPQw0+5o/KU7VPz34UE1lbZrzp9b2zRwzbAQ3VJEL7lx5aXCM
 ta3zumIFqy/qmvWDboTyySSciQMJLo+gsLUi1x/kNfCQmj0w9CMl4wGFy7vgFN+iEiYa
 SXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YSnlhCmlA8Qg+kgyP8DOZPiH3d/vplXaX6h7i1qGnXU=;
 b=dOd0kw5rTErOvlPXijlxdl3LuBlPeMUhCH6gkQUlrGHmviSFFPC1MhJ/wgxSvGf10a
 9kfTijv+V8CxJX8Qxme+rlMx7GLvPoQFaN9Cedlk/wEEhRFJLUASXIkWlT6X8989nKYN
 FSYbaX2KZm+D0Ea6oFmKPKe0kiYf0MghaUsHRqvXIF7Fpz8ED/oYDFnLoQ9o1zNG1HZP
 BB5TSzMspu2fIJnCxxHIuRUzCuHn4ik+YisC7CGOqUkbZrJOvaWszbkLEV4Gg0KDTu/U
 3vGWCUGgCiEUdX2lc3jleCyIn7gRH9appLwkRvtmbgPS2IhEzsjVk+HpdEsS+nkT0Rfn
 34Wg==
X-Gm-Message-State: APjAAAV0k6SblMGbh5Yb3akMrsz8ncdCE4kB/e3ijXAtRiuW12Hrbnl1
 dfWAYlaW1GD50Tg53i1a8D7X6g==
X-Google-Smtp-Source: APXvYqwI6MqTDZKpKu6Uy5WraJcgejZvbSW4wIlI3hWpXDy8G4d16eBuc1A0TRtVKx4M8mE007G37g==
X-Received: by 2002:a17:902:b497:: with SMTP id
 y23mr6689706plr.82.1570060376372; 
 Wed, 02 Oct 2019 16:52:56 -0700 (PDT)
Received: from localhost (c-73-15-177-105.hsd1.ca.comcast.net. [73.15.177.105])
 by smtp.gmail.com with ESMTPSA id l189sm459098pgd.46.2019.10.02.16.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 16:52:55 -0700 (PDT)
Date: Wed, 02 Oct 2019 16:52:55 -0700 (PDT)
X-Google-Original-Date: Wed, 02 Oct 2019 16:44:52 PDT (-0700)
Subject: Re: [PATCH v1 21/28] target/riscv: Respect MPRV and SPRV for floating
 point ops
In-Reply-To: <8a628d1542d547b6d639cdba51db67590d0b56de.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-7c045b6d-544e-40df-95a6-e46c479e41c8@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Wed, 02 Oct 2019 23:53:00 -0000

On Fri, 23 Aug 2019 16:38:44 PDT (-0700), Alistair Francis wrote:
> Respect the contents of MSTATUS.MPRV and HSTATUS.SPRV when performing
> floating point operations when V=0.

I'm confused as to what this has to do with floating point.

>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 19771904f4..ea19ba9c5d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -750,7 +750,21 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->mstatus_fs = ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
>      ctx->priv_ver = env->priv_ver;
>  #if !defined(CONFIG_USER_ONLY)
> -    ctx->virt_enabled = riscv_cpu_virt_enabled(env);
> +    if (riscv_has_ext(env, RVH)) {
> +        ctx->virt_enabled = riscv_cpu_virt_enabled(env);
> +        if (env->priv_ver == PRV_M &&
> +            get_field(*env->mstatus, MSTATUS_MPRV) &&
> +            get_field(*env->mstatus, MSTATUS_MPV)) {
> +            ctx->virt_enabled = true;
> +        } else if (env->priv == PRV_S &&
> +                   !riscv_cpu_virt_enabled(env) &&
> +                   get_field(env->hstatus, HSTATUS_SPRV) &&
> +                   get_field(env->hstatus, HSTATUS_SPV)) {
> +            ctx->virt_enabled = true;
> +        }
> +    } else {
> +        ctx->virt_enabled = false;
> +    }
>  #else
>      ctx->virt_enabled = false;
>  #endif

