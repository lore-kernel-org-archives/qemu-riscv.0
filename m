Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzLbg-0007oc-Vg
	for mharc-qemu-riscv@gnu.org; Mon, 20 Dec 2021 11:33:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzLbY-0007lO-Is; Mon, 20 Dec 2021 11:33:43 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=45735
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzLbQ-0005KS-1n; Mon, 20 Dec 2021 11:33:33 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id x32so30388923ybi.12;
 Mon, 20 Dec 2021 08:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oo8YARp/DN6toFCr0pSd09y+S8arKbsdWcxCLxa4sEU=;
 b=YpqY0jEaZLhLGJidhtd4n+PVzRW727FFzHT6ym+rwy/OqGb+V7eZg6SLg+1hlmn/Ru
 qxVDkO4k3iB9WLLnaYRp+wE7E+QOVGDNW3BNvm4A6y4Rh4Cfr8SVAc1ZOxAHqwUikzAO
 HhCrVf0P7gKSPkgb6FE5U5+JbrKbms8ySAK174W5CFHgT7o+WqW7bHTckX36LJC1BQ8f
 w904++IJo0cO/7rehjoogp/pOA4j8C33CYcu5N28c6xau7+VfywT26zFK9NfB3+mh7Bs
 NReMs9Z0yOOLsGhhVsD4rDtcweYQfGi8JGXACJ9zVS3n/QAOUaX/0xTBUdru2bHnla40
 w+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oo8YARp/DN6toFCr0pSd09y+S8arKbsdWcxCLxa4sEU=;
 b=4rmC2nECgHeMQaskokly7rN5Q39fczN6/A+GseNJ8JzOVLa+Wrn7V2BfCPEbtwIpa+
 XRI95gDe156JupMZrCseGSK1QMnZEw4z0EDTXBlQpyM7JJDj62vlBYQd2MqkxGSwWKwD
 jWZN6gwHAErUrL2snHKarnBgzL9E1Xecrkx8O1Q6NVZuaZ70W2BLWEaNkQ5CHr5tbtrk
 +2kiQLvTqioVBP7gwkhFmvMSnzHX4BYRmUiXep/aclaaaCYtmiR1dX7b/OW2AQZ9rrft
 +WXbseykJ9i/8bHZGDqbz4wSD/IHlS1nZy1kYfxoKBAJFXf0HHoJ0swhxZuO9+Wp7/5g
 lDjA==
X-Gm-Message-State: AOAM5326JjHn6BeJDKypeOelq/m9WpXi1NzblCyKDuRR0oiKnfQKL2Fn
 8Hxl96H2s38eVD8ORzEZtelk5tSuFnZeB9mhlg9w3NcYBU0=
X-Google-Smtp-Source: ABdhPJyRd3ERKY25H++U/bKxLq0AGYmmtHkdTm5w0ekMI3e/hc+zbyTkSM5bcePsXEJbSBW1YueRuP+DLs8eActUExQ=
X-Received: by 2002:a25:3787:: with SMTP id e129mr22207784yba.91.1639985904965; 
 Sun, 19 Dec 2021 23:38:24 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-8-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-8-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 20 Dec 2021 15:38:13 +0800
Message-ID: <CAEUhbmVrK3W4zRKnhkpq2e3vdSiNu2qaJe5y6nA+X_8ex3KLmg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] hw/riscv: Use error_fatal for SoC realisation
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 20 Dec 2021 16:33:44 -0000

On Thu, Dec 16, 2021 at 12:55 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> When realising the SoC use error_fatal instead of error_abort as the
> process can fail and report useful information to the user.
>
> Currently a user can see this:
>
>    $ ../qemu/bld/qemu-system-riscv64 -M sifive_u -S -monitor stdio -displ=
ay none -drive if=3Dpflash
>     QEMU 6.1.93 monitor - type 'help' for more information
>     (qemu) Unexpected error in sifive_u_otp_realize() at ../hw/misc/sifiv=
e_u_otp.c:229:
>     qemu-system-riscv64: OTP drive size < 16K
>     Aborted (core dumped)
>
> Which this patch addresses
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/riscv/microchip_pfsoc.c | 2 +-
>  hw/riscv/opentitan.c       | 2 +-
>  hw/riscv/sifive_e.c        | 2 +-
>  hw/riscv/sifive_u.c        | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

