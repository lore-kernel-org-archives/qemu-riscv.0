Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liSHL-0004Di-Bd
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 21:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSHK-0004DI-AG; Sun, 16 May 2021 21:42:42 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:42781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSHI-0000JZ-Qi; Sun, 16 May 2021 21:42:41 -0400
Received: by mail-yb1-xb30.google.com with SMTP id r8so6423457ybb.9;
 Sun, 16 May 2021 18:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hZC9YzraobgsATmHyP+Qv0ZyHKoBkn8eHYRGKhgNdy4=;
 b=IzXmqmZe/3vc+Owgj5cDC6WG2m/j4PTLT5KrYmzfyfEBBa79138f7jEFbZHA8MMpEP
 RIwq76xdPvIwiQoqYowRVofoqCtCb5mpGlWrsS3loFXhNFoTUc/kiXYLOWsnNSVJkJYJ
 PWf0eqqB//soGnnJQaDURoH+yW18t8hrLRH6vpdUDo4ta5Ke7LAb9ZphXSOX+ILJhVNE
 9NSSJjpJVthk44va/NSl20tZZoiatSbqXGlZcgTkyq+3gOvK8wQsadJ8BLJJkoDz7/yp
 Vewzc1html7NrHEo3czvoYlcSGS9jLNjlMry6mCe4kKTw3WpfO6m2SMHYriPBXUCbYan
 Hzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hZC9YzraobgsATmHyP+Qv0ZyHKoBkn8eHYRGKhgNdy4=;
 b=GHjH020q1dDWjDVrJWIjYO+WDMxLwIbrxqe41lhmnklf87ZAM3Fo5DDKpxIAzMMbMp
 JR8AGUxUguyEItHnI8Di1LoO/TzqbWvSVrdVCYDTp0yxP6EdnOlc8bjpaUP8bFdusaNk
 eUbAd7lPu6jsV6HhmiwGYKznOZVvXKU3VVbHup8W/p3E6GRwU10Ghi2+eu+5znHhD5Jv
 DX6Bby7RPqqnLZXqUqpCpZZbdwEHjk8D/UQMtMhbBZyxcZxbuWdFxeJQSnd//85DafKZ
 rjRz0fOW7RQe610pMoFg50+whlGrveYFQo2BXfeW7iMdjbojfghwSaH+iW8jzH6y+8bB
 1HUQ==
X-Gm-Message-State: AOAM530AeDDAt2SsRHg1XVv03PebKy8u33iXN/FJ3acpkRw352KddjPL
 adwI7TIvhiIz2hkB4UhwSbCZCMrSGLg74lblhyk=
X-Google-Smtp-Source: ABdhPJzxb1/n5wsH6AwdYpAx4VX8stHwhrZGUszSvXq/VickyCypsoWbHBElQJHGDJTl5Ap5gnwplmoQWGgD73z6Zik=
X-Received: by 2002:a25:820e:: with SMTP id q14mr19810616ybk.152.1621215758474; 
 Sun, 16 May 2021 18:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210516205333.696094-1-f4bug@amsat.org>
In-Reply-To: <20210516205333.696094-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 09:42:22 +0800
Message-ID: <CAEUhbmX3dGpDSfExi_i3pmR=YqOrUrj-oLyrVNVDAr74nma2UQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Do not include 'pmp.h' in user emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
X-List-Received-Date: Mon, 17 May 2021 01:42:42 -0000

On Mon, May 17, 2021 at 4:53 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Physical Memory Protection is a system feature.
> Avoid polluting the user-mode emulation by its definitions.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/riscv/cpu.h | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

