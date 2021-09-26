Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUPZT-0004Oq-6I
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 04:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUPZO-0004Ks-Dd; Sun, 26 Sep 2021 04:31:37 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:35436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUPZM-0007dm-OW; Sun, 26 Sep 2021 04:31:34 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id z5so16304241ybj.2;
 Sun, 26 Sep 2021 01:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Y0HK1rJKDyoeTRUfaeyMj0UTrjs6A6YDjRb6bkBrW24=;
 b=guvtfDoKj9cCIs3Vs+WqjU4jfsm7cIK8icHXItuGCYkt65t6CbvW/a+ya7WoBz0osB
 ZPUekzGL6wh7ZxOadBs8e7KTB/cY0REYmT7UMHZCSY6GQEn6Jhujt0GTcJOrSabjN+8o
 c0oQIdV6vSNC+G3d5sibEp8wx5wqr82ukRUuprG62lz5X1iF2TwHggNsF9KEThegJ8Ix
 4XpT9aPUmFDNri+2BpitAUxUn6t1BVHbMPxc9xxUWDLnGsVvwPzpPTtgg3r11jXyGW4+
 mwaOr5zQDg/U3Z5l8x15LVpXP+eJRhDweCyC0iUPYpWf7egy5ecHWdvF/NV9P3Xxsz5O
 OmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y0HK1rJKDyoeTRUfaeyMj0UTrjs6A6YDjRb6bkBrW24=;
 b=eHdVwxIbY4ML9R5B64ziFVR9dIxWw4RAiIvCITdGBuvqUCQSER3Jw63ZYRmfwmFjSf
 6SDD4V2oLrgIeXJzO+9urzeDH6rexukG6IbJQ9PwAFhZ1PWrKZzJxpJDAA9CF2z2E3Nr
 eqZvp0rpgngpO2hQ5HN0qciorSODD7DTHEEhtcCKanImG46iDBR1a3+68KULmUGP82el
 21D3KNbS6tV6vXFx7TYtDP4hHltMa3i5V9xLsamhxxgo3Wl63GY6V05fuqdwg2CqP7p/
 AhiNc7Q0g7Oq/T0CxtX1+fuytJlJrBtUO3O6asiJkxI5FXl6wsMAJyc39YAmUazwd164
 E+vQ==
X-Gm-Message-State: AOAM530YAPTsiSc9pi+GCeLd8ViFk5yxh6OtRt5Do/EUhkgsxZq4F/O9
 0XX5s4NcxWFLeo7Zzp1FvOY4Ho+GzOhGwMEm8fw=
X-Google-Smtp-Source: ABdhPJxdz6L4OyNv040FVubQxi/Bm/K57rsCkmC8L6agayhMFLqZRctVThCBPArJ2RAkqJtEBNt1fKsbAqjNrBuZkas=
X-Received: by 2002:a25:ad52:: with SMTP id l18mr21191673ybe.453.1632645091366; 
 Sun, 26 Sep 2021 01:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210925133407.1259392-1-f4bug@amsat.org>
 <20210925133407.1259392-2-f4bug@amsat.org>
In-Reply-To: <20210925133407.1259392-2-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 26 Sep 2021 16:31:20 +0800
Message-ID: <CAEUhbmWRpcBub4BZu3j4b31jTQsrWEQB3MNw4xv7T8z7PZ+UBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/char/mchp_pfsoc_mmuart: Simplify
 MCHP_PFSOC_MMUART_REG definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair23@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
X-List-Received-Date: Sun, 26 Sep 2021 08:31:37 -0000

On Sat, Sep 25, 2021 at 9:34 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> The current MCHP_PFSOC_MMUART_REG_SIZE definition represent the
> size occupied by all the registers. However all registers are
> 32-bit wide, and the MemoryRegionOps handlers are restricted to
> 32-bit:
>
>   static const MemoryRegionOps mchp_pfsoc_mmuart_ops =3D {
>       .read =3D mchp_pfsoc_mmuart_read,
>       .write =3D mchp_pfsoc_mmuart_write,
>       .impl =3D {
>           .min_access_size =3D 4,
>           .max_access_size =3D 4,
>       },
>
> Avoid being triskaidekaphobic, simplify by using the number of

typo? See https://www.dictionary.com/browse/triskaidekaphobia

Learned a new word today but I have to say this word is too hard for a
non-native speaker :)

> registers.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/char/mchp_pfsoc_mmuart.h |  4 ++--
>  hw/char/mchp_pfsoc_mmuart.c         | 14 ++++++++------
>  2 files changed, 10 insertions(+), 8 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>

