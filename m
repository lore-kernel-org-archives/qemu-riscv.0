Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGfoS-0001fq-BG
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 07:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGfoP-0001dw-Nr; Thu, 19 Aug 2021 07:02:18 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:40636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGfoJ-0001rM-So; Thu, 19 Aug 2021 07:02:17 -0400
Received: by mail-yb1-xb35.google.com with SMTP id i8so11582479ybt.7;
 Thu, 19 Aug 2021 04:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m9jJk5MSEmgw6EWKmhJRpWGF85WIOQl1fDLAiczqVsA=;
 b=WRP5qGkc/di9x27Pq0AOROo8gzu/sW9+MMQMy1rAtCyhSRtFB9rbScR8ymzEq6bVzI
 sARQlAztzcf+jM25eUAeVaaDiNKIZo3rB6F5WTzFowYjjj0Zzzb40EcxzystNkWBXaRr
 Ib7X1KyVAyPvevOpHnkfucoXaYv40cczeml/JPVy9YnKAKSb9NS1dppa7nRvNvYbyapo
 93RpcUtnW+DV+WYkmKQbeMoEaQnJ3vsGO6Crn7no33k7fPETYt/QSNtyHxVf/Se5bUm7
 ISmV1yzbwQmlMcqUbSdzEhqkXc0u3G86C4YqbmyMRRXUKYEjYr6p+ra/41fBn1UP3wZl
 d6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9jJk5MSEmgw6EWKmhJRpWGF85WIOQl1fDLAiczqVsA=;
 b=ZSKT8sCYwSYzR4YBuU7wwRyXbGKQkWgKebboAhodviCW6DKk1UShgrN0p0oMLva6ui
 LsKFtIiBe12dSE1QZ55UqLhP9Mqmfg4CeMYmj3PrPJcUlahxL/s94nz2cKZXyyGbO60F
 1QRSyvrSkZxutXRmP8senh75YhLHMtRqeFsH/RaoJ49NzKxEUB8waUb0iI8DHT2TXCQT
 uQxuGXlDXh8EohqtP3tjvm+oFMEAqdwoly7j9iKRAwzblE2pfQ4O4QMfMISn9DGQKwoP
 gQbkqmMXlkyXxDDkbPu3UP68nUayYb2Zrt8I9YEOxmEDFoyTXhj5D1u3+rcYwn6hqAZL
 4Slw==
X-Gm-Message-State: AOAM5324crDVP2sk1zUm94amx+JMI3OVWb3MMqEYdnhs+UJLtNJ3chrS
 CaRwcIXuYfgpWA4DBL46mOBzwNK40G5ZjUag9Dvy5oxP8ptYRw==
X-Google-Smtp-Source: ABdhPJy93pGlB8QdU7uCMIlf+ZHH3AWECZV6lQG8nItD1hyIpfCSPOHJ2h9d1Z67Nlipm68bos+yjjAAWXNxAzfmPhs=
X-Received: by 2002:a25:d20b:: with SMTP id j11mr18133624ybg.332.1629370930429; 
 Thu, 19 Aug 2021 04:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210819090502.428068-1-richard.henderson@linaro.org>
 <20210819090502.428068-5-richard.henderson@linaro.org>
In-Reply-To: <20210819090502.428068-5-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 19:01:59 +0800
Message-ID: <CAEUhbmU1bXV9s+qpz=AL-VAfnuWsHSNMBbvyVs3vUF5Ei61x4g@mail.gmail.com>
Subject: Re: [PATCH v3 04/21] target/riscv: Introduce DisasExtend and new
 helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 11:02:18 -0000

On Thu, Aug 19, 2021 at 5:05 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce get_gpr, dest_gpr, temp_new -- new helpers that do not force
> tcg globals into temps, returning a constant 0 for $zero as source and
> a new temp for $zero as destination.
>
> Introduce ctx->w for simplifying word operations, such as addw.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c | 101 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 83 insertions(+), 18 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

