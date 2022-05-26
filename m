Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nuAPc-0001Vp-JG
	for mharc-qemu-riscv@gnu.org; Thu, 26 May 2022 06:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nuAPb-0001V5-W3
 for qemu-riscv@nongnu.org; Thu, 26 May 2022 06:08:12 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nuAPY-0001GG-Gz
 for qemu-riscv@nongnu.org; Thu, 26 May 2022 06:08:11 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 i9-20020a1c3b09000000b003974edd7c56so62556wma.2
 for <qemu-riscv@nongnu.org>; Thu, 26 May 2022 03:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mex3jujLcFnHOX0MHAdq1ojjhSaZFUjaYYrvdwZkXL0=;
 b=IeDnkAFcO+lZOsReTVSfivd8O0/LR/mrtoCdFdrwtRLfYH8rs7NMuph467MMP/cq5E
 UsYNCxrKb6xMBvo3gMS11JMiftpoBfjYXGtRdzaQ3qSIH5vMtt8nWu0V8fzZTgZXdM5t
 xngZ2iFsgRGqJVYNEUI8Mtai0ffwveC3ulkI50V1aWM7XPmehI3MpPNb0EZA8B6gFbTD
 jbHQCpGLVX7mhWivBlRIFohYNTfWc2mODzMjsKHhhh6DtDVWBV4AG7+ext82ZD+XzJDK
 9ae6YIpRvpf5oVl1HR6u4PMxKpEEoie7SrzGrVpzVGiY5Vn9HbntuInt1W46Aj7rxXs8
 +Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mex3jujLcFnHOX0MHAdq1ojjhSaZFUjaYYrvdwZkXL0=;
 b=p69cCIIsQ6eGhy441R6b0QFVFzjHV5HPnG8BTBYB+P7/pIml7wIfOCtgEXVoQhSuO6
 Qql1ObeKWiRJK/220/kCDQOS9P0EGPFysr06+VU6PaX4uLlnLaB9jI96a5E0pL8lJY5n
 ef/IDzBMM28oRBwXa5Jpu7BNyyl4GnCjtT/VfNMLvLXEsypwwC0qHjbg0XNoLtufTe89
 QQXu77No3f2VM9N+YhXVmKYmCohpbjai+nQK2105d0ToaWbn1qGnIg1rEmjDpQRhK30d
 f20liN6xEa5dfKQi7eODByx4l53ArvcZ1fb1bNTB4vPtxmxcLEr4qniHkdiT5Nw8lZ7T
 OkKA==
X-Gm-Message-State: AOAM532AIH88VHtfop9AK9NQStofHMFiP0oBlt21dYvo+rjy7g17ea1/
 M2VYI4w71UIJ97wkt+8PJK1RcBIv4jrd6HN7cFaTlA==
X-Google-Smtp-Source: ABdhPJwV8Oo7ctLu9L2jSzpIUGh8R4Xr/2B0JI1AZhdpA11hLUw7Z4B6tf+aY7fQNI2Sxs06g8xQLkXqrwxkB5Nkt34=
X-Received: by 2002:a05:600c:5112:b0:397:53f5:e15b with SMTP id
 o18-20020a05600c511200b0039753f5e15bmr1635053wms.93.1653559686754; Thu, 26
 May 2022 03:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220526084240.31298-1-nikita.shubin@maquefel.me>
In-Reply-To: <20220526084240.31298-1-nikita.shubin@maquefel.me>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 May 2022 15:37:54 +0530
Message-ID: <CAAhSdy0YOp8RY+V1hzf9KcdpEnVZpB5PuuSODDgpQ41GChMjxA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix priv enum
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Atish Patra <atishp@rivosinc.com>, linux <linux@yadro.com>, 
 Nikita Shubin <n.shubin@yadro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::329;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 26 May 2022 10:08:12 -0000

On Thu, May 26, 2022 at 2:15 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> Add PRIV_VERSION_UNKNOWN to enum, otherwise PRIV_VERSION_1_10_0 will
> be overwritten to PRIV_VERSION_1_12_0 in riscv_cpu_realize.
>
> Fixes: a46d410c5c ("target/riscv: Define simpler privileged spec version numbering")
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>

This breaks the CSR ops table because with this patch most CSRs
(not having explicit min_priv_version value) will be associated with
an unknown priv spec version.

Please check "[PATCH v3 1/4] target/riscv: Don't force update priv spec
version to latest" which I just sent.

Thanks,
Anup


> ---
>  target/riscv/cpu.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f08c3e8813..1f1d6589a7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -91,7 +91,8 @@ enum {
>
>  /* Privileged specification version */
>  enum {
> -    PRIV_VERSION_1_10_0 = 0,
> +    PRIV_VERSION_UNKNOWN = 0,
> +    PRIV_VERSION_1_10_0,
>      PRIV_VERSION_1_11_0,
>      PRIV_VERSION_1_12_0,
>  };
> --
> 2.35.1
>
>

