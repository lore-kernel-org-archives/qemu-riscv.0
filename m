Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHGSj-0004eU-WD
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 22:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGSW-0004dn-LR; Sun, 15 Jan 2023 22:46:56 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGSV-0000A9-3I; Sun, 15 Jan 2023 22:46:56 -0500
Received: by mail-vk1-xa35.google.com with SMTP id w72so12790367vkw.7;
 Sun, 15 Jan 2023 19:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/ZgL6g3tzzrMslCgpZr3vadgb8PKA9WFOnNxCm/ITvI=;
 b=htmbcobEpHfS93Ks3RHW4DOSkq8KMoXf96WyCaoIp+8dcCl49C4fjhKcC+3VPp5gsA
 97UzodAaEANyhCgGL5cNXcj3PpZCfYD6rdIfRGybbbsm+VPYv1aV+gcZEVJilGhVhjMk
 juo8NYDT3dmF6V0yNu2g8YRwd+1fo3lCboul68FGpv359dnXOYY4A/SP80UDDs2bN9Ht
 0DaQN1GC6J8q7dVgX27Q+cGzsvP0Ypa0eQAhFOct97rbewjf+kPCuVfhtObqKKtLisPZ
 5RRx8GRdytT+WZvOQsCvNEC0x3qlbDOrVmod9gWkIkS0/CiRXD8ATQEqY7QXfif0m0JM
 OtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ZgL6g3tzzrMslCgpZr3vadgb8PKA9WFOnNxCm/ITvI=;
 b=39lEBspzdg3ArnsmtHKFtuj0JsIMZ18ax9O6/4g+cEazNH+hVBCiAuOCFLLn+VlqS7
 bYy0/6SF4cTv7493lRjYjuGBRhJbCzicpM4BqgMlmpWI5j5fIuOzCTMeln55rXf5cJxW
 eQiKnIZc4Ix+lKg/KFmSiqXstf92VPaE49VMewT5d0MRMySUe9BbJ5l6Y9AbMB10f8je
 c4la5/xjH/ETB1L+4U3+5yPOp1KQrYM19cTWn+ni0OMQfpnFhzB3jwKQY0p81dZiTAVN
 bLFbhbBKHQl3uOZGtWJyBdrttQr/N6JxhjWqMdfWIQJwzdjKxzgD5cX6ZhHoUQSTDP01
 zpsg==
X-Gm-Message-State: AFqh2kr74ByG6EG6d4iDqqcczb12+HJu4B1GYIGZnB2GqS/MTA5EWGFF
 LyCmOGp4+7BySi93Swl/3s3+1OAAFp01TklXark+PGDYcg8G9g==
X-Google-Smtp-Source: AMrXdXtvL53wz9NGlckclGMTwP74RrlGTym9tdiiRpWVuHOmBHhj8O7gKNiMCOpFLmeHFs1VX/sUUD1oQog6gFanBDA=
X-Received: by 2002:a1f:c703:0:b0:3d5:6ccb:8748 with SMTP id
 x3-20020a1fc703000000b003d56ccb8748mr9255079vkf.26.1673840805637; Sun, 15 Jan
 2023 19:46:45 -0800 (PST)
MIME-Version: 1.0
References: <20230109152655.340114-1-bmeng@tinylab.org>
In-Reply-To: <20230109152655.340114-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 13:46:19 +1000
Message-ID: <CAKmqyKPXfQkzM=R6cO1gNVFxAr9U_9u9s2bH2+POhkurk10_cw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Use TARGET_FMT_lx for env->mhartid
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 03:47:08 -0000

On Tue, Jan 10, 2023 at 1:28 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> env->mhartid is currently casted to long before printed, which drops
> the high 32-bit for rv64 on 32-bit host. Use TARGET_FMT_lx instead.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  target/riscv/cpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cc75ca7667..a5ed6d3f63 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -660,9 +660,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              (env->priv_ver < isa_edata_arr[i].min_version)) {
>              isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
>  #ifndef CONFIG_USER_ONLY
> -            warn_report("disabling %s extension for hart 0x%lx because "
> -                        "privilege spec version does not match",
> -                        isa_edata_arr[i].name, (unsigned long)env->mhartid);
> +            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
> +                        " because privilege spec version does not match",
> +                        isa_edata_arr[i].name, env->mhartid);
>  #else
>              warn_report("disabling %s extension because "
>                          "privilege spec version does not match",
> --
> 2.34.1
>
>

