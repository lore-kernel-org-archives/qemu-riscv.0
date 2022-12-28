Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pANac-0002tT-8N
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 22:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pANaV-0002rN-7p; Tue, 27 Dec 2022 22:58:44 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pANaS-0004N8-Sb; Tue, 27 Dec 2022 22:58:42 -0500
Received: by mail-ej1-x62c.google.com with SMTP id x22so35848674ejs.11;
 Tue, 27 Dec 2022 19:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=17b4FKF3xfVsARcz6NQz4B7syHWjCW/yqd036cr3Z/k=;
 b=HZWEO6PKdyaWYW/LSqv5Ft6qxVIIhoryMJo63mRcs0yCYDGgJDiH4jKEV6sxqM2ykO
 Ka4988L5T5L4AYa/iVGcRGmTjmWlsu9q6yTp0pgoMMnK487P3Eg1nXs6syBRzPsz63hs
 JDqukouTNcFEAjAxLJHPyAF+jA9B3ten4bYDPq/Sat9Ap9aU3Uz3FikJhJgugQggBtny
 nKVwvqpKJZ498r6nV7+NfUSGYYTvwe3e/vS7mTFS+0M4zdcZGfZ3CY4GSl/f0Nr/HGwg
 uTYWUQTgQZLmSs+aObA0G5tLN3az2inFCy/C0+bz1Du89XQUOn60OrD2RiiCpkv+R88z
 wd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=17b4FKF3xfVsARcz6NQz4B7syHWjCW/yqd036cr3Z/k=;
 b=tUjiVVo/BpMMANBNp5+bbfBXGdHyiBMv6zEFFJyuaKo29scS4rCaFGJrDd/CQnWd+N
 c/R0QFWebtr73LhhA9nHguoHtKRq+JlEe1bdgh+og/kX4NoWlT+0bdiaHOlP1a323h7L
 5n5UJVQr4qnrVU2kU2JaaXJnBh7T7RvHXOdtRJ9PAvmnMJOApC5Mg0kETVTwpivIDERL
 eP32pDMZ1VeNXA8O3fhAwvkAmuLMMsTFVPZHOK2vXdoVW/0uZ52T52i3fQ7rL7COoAmZ
 4LKCGyVKlpGj7Y5SFd+lEryqDtm767sMHuwtcKBT8DvXnVAN1kLCmhHWvYftZ1eXM3FD
 gVoQ==
X-Gm-Message-State: AFqh2kpWwvSxpTDi/uM63hzt+ovlYtz7sxHqwjzqySsiDSba944sY+HN
 HY5+83h08kS4gNKvs+2SDOgHWXSGVfPBWEJ7pgU=
X-Google-Smtp-Source: AMrXdXtNkjhj5OJox41BXc9injrPpLWqvXKl5NaCw2uPEOXm8bMMuh3jvx6qa63eZtBAeHM4qFND/xQzgYw60Mpka3g=
X-Received: by 2002:a17:906:824a:b0:7c1:6f0a:a2d6 with SMTP id
 f10-20020a170906824a00b007c16f0aa2d6mr2673092ejx.337.1672199917713; Tue, 27
 Dec 2022 19:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <670a96f5-b703-5c20-3cb6-c95f55249e4e@ventanamicro.com>
In-Reply-To: <670a96f5-b703-5c20-3cb6-c95f55249e4e@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 28 Dec 2022 11:58:26 +0800
Message-ID: <CAEUhbmV4z_CD85Cr8phySXR8Ts69e13Si4TVmz6z0j-Cg0+7HQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] hw/riscv: Improve Spike HTIF emulation fidelity
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org, 
 Anup Patel <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62c.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 03:58:47 -0000

Hi Daniel,

On Wed, Dec 28, 2022 at 1:52 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 12/27/22 03:48, Bin Meng wrote:
> > At present the 32-bit OpenSBI generic firmware image does not boot on
> > Spike, only 64-bit image can. This is due to the HTIF emulation does
> > not implement the proxy syscall interface which is required for the
> > 32-bit HTIF console output.
> >
> > An OpenSBI bug fix [1] is also needed when booting the plain binary image.
> >
> > With this series plus the above OpenSBI fix, both 32-bit OpenSBI BIN & ELF
> > images can boot on QEMU 'spike' machine.
> >
> > [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/
>
> Aside from a nit in patch 12/12, LGTM. I've tested with a patched version of
> Opensbi including [1] and I can get terminal output with riscv32 spike:
>
> $ ./qemu-system-riscv32 -M spike -display none -nographic
> -bios ../../opensbi/build/platform/generic/firmware/fw_payload.bin
>
> OpenSBI v1.1-112-g6ce00f8
>     ____                    _____ ____ _____
>    / __ \                  / ____|  _ \_   _|
>   | |  | |_ __   ___ _ __ | (___ | |_) || |
>   | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>   | |__| | |_) |  __/ | | |____) | |_) || |_
>    \____/| .__/ \___|_| |_|_____/|____/_____|
>          | |
>          |_|
> (.......)
>
>
> Speaking of [1], it seems like the fix went a bit too late for the opensbi 1.2 release.
> Assuming that [1] is accepted, it would be nice if we could bake in this fix on top of the
> 1.2 release when updating the QEMU roms.
>

Thanks for the review and testing!

Regarding whether we can cherry-pick the fix on top of OpenSBI 1.2, I
am not sure if that's allowed by the policy.

Alistair, do you know?

Regards,
Bin

