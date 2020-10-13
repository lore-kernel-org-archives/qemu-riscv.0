Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSHud-0001qD-9t
	for mharc-qemu-riscv@gnu.org; Tue, 13 Oct 2020 06:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kSHub-0001nw-AC; Tue, 13 Oct 2020 06:52:09 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:37341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kSHuZ-0005i0-U4; Tue, 13 Oct 2020 06:52:09 -0400
Received: by mail-yb1-xb43.google.com with SMTP id h9so15793896ybm.4;
 Tue, 13 Oct 2020 03:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Or3WP0ZKdf+p1cwJ47wb6hHQKvAUXX23Azj0Po8S2nk=;
 b=unSWyzn2QNJU7wOkaYsLtybZAsfcJfLOAP6Tw3JcIFt6yYMrPJEZ6jKvtHs7hn7eNN
 9kdI15AFCWzUYTc5Jcpo0r0DWCr2vFxVmcerKqvXRoMbHjpSm4nhRJwxwapcprs+rKSF
 HfXTUFlSyNs5Kd8wO2JU5cGEyGj6M18y/MgwlcFUR6mFomZORG0U4VkC8PkCa11/OSCG
 ulY5NnzTlc0wMvPeQ97KEKLs5gAaElnJpr/UR+q1aM/irt6nUKJZWPGc/sKKsrG/2cKr
 QyJkOksleVbATJIc4UDUj9bu7d5wHO567dp3mL390YM6nzSw6WPEGK0MhUmyTh9pWbsR
 ujhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Or3WP0ZKdf+p1cwJ47wb6hHQKvAUXX23Azj0Po8S2nk=;
 b=TYHlKLNeHxh/kX3bHpxS+haE2Ae1kflfmp5N4ET1bYmmId8GjiqkA8Fx9oVPgN0vw1
 EXCEqeDG+3Pr1N2hKM4bgEu8zYBUMtjsVsyaJ8FHGrlAuW0BJiNgmebeiLI60EGVwE9T
 X5gVP50clBGado1TS735uVwoBYUbABSTn+uZMHoGe6oHuOJ7N0LaNrRlSO2qXtVUdxpQ
 XjjWaljeAsvGyPmu3G9XxwIu8miBtRXHWCRE3074kfRtUkKH9+AkfmQXquyKpMQwhbsT
 9F5dABLHTISagFblzNPac+nDPRUql1bnu0UpYYmYPXHHn9Tnyu9F1nRzoBFrxkqMLxIk
 CU7w==
X-Gm-Message-State: AOAM531XXLzBS9St08YtboEvbabdo9K3mhZFbcjU1lDpvq3LJ3ou/2uS
 2o8/M8HzYnrDtsiPCZYZxt+9db7tX1aIfb0Fjyk=
X-Google-Smtp-Source: ABdhPJw9Rl5ie4vxsB7gxK9/N3/zgV7r8IH4jkOz66zL7hTbJRXLwVFueQy60ez1/NS5q3c2uUPUsza7iIP7U4rEBrM=
X-Received: by 2002:a25:328a:: with SMTP id
 y132mr13581285yby.306.1602586326487; 
 Tue, 13 Oct 2020 03:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200928101146.12786-1-green.wan@sifive.com>
In-Reply-To: <20200928101146.12786-1-green.wan@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 13 Oct 2020 18:51:55 +0800
Message-ID: <CAEUhbmUsX7RP=D=h+dp_U_QXCjDeaekNLO3nO0hUPJMXHqOhOw@mail.gmail.com>
Subject: Re: [RFC PATCH v6 0/2] Add file-backed and write-once features to OTP
To: Green Wan <green.wan@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 13 Oct 2020 10:52:09 -0000

Hi Green,

On Mon, Sep 28, 2020 at 6:11 PM Green Wan <green.wan@sifive.com> wrote:
>
> Changelogs:
> v5 to v6:
>  - Rebase to latest. (sifive_u_otp.* are moved to hw/misc)
>  - Put the example command to commit message.
>  - Refine errp handle when check backend drive.
>  - Remove unnecessary debug message.
>

I will try to test this soon with a modified U-Boot.

Regards,
Bin

