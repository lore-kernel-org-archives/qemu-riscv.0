Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jwrGf-0006rP-M4
	for mharc-qemu-riscv@gnu.org; Sat, 18 Jul 2020 14:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jwrGe-0006py-2U
 for qemu-riscv@nongnu.org; Sat, 18 Jul 2020 14:09:00 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jwrGc-000126-Bd
 for qemu-riscv@nongnu.org; Sat, 18 Jul 2020 14:08:59 -0400
Received: by mail-oi1-x242.google.com with SMTP id 12so10886476oir.4
 for <qemu-riscv@nongnu.org>; Sat, 18 Jul 2020 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A02sUf5KerPly0JllcyobIZWivbq/FtEb5MKa3rSKXg=;
 b=DuCxpvPPmSl6ToVHV8ZMIKQK3eHf3oGoP9a7MQibKWxqPRPz8USIPf8A1IlyiHT+vM
 5ES5hrLTSeNjynSlRUzNB0JsBGHeIRU+x8TsN16F5bzYjYrMQwffKb89wDAWddzK2D3k
 LT551/XczM0khN8zXZPXDFAUrxq0T/HmKbaj0md5zNYmgVnaNIP2HzeR8boW5vzVCmDV
 TdlSgsgmqK+57Vcp6dPqR6+YSYkFIvh+FVGNhj2X69028IjqyXZfbx6PFh0IRyFH/L+u
 r4CCF9fUv3D5EHKtkuu9+2W95yFMCL7L9fky6ZPhF6OUx/RMn3wqDleV4eqlYVcrmJaq
 /l2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A02sUf5KerPly0JllcyobIZWivbq/FtEb5MKa3rSKXg=;
 b=YVf7g7r+aZ9bHTRfJBJeC1R250A01Vp2sa5brvOVQ5l1JilRx/t78KlIzE64APc6JF
 haOZAk3yvqbsLC4tg44oJORV3RYJ+ftWRhlCywxd6/XS3jcD/53m7+V/uE4x7rgfJcS/
 VGmFpAr2r4j67H7FzEIv6Sqx7VLvuHq08l13M0mu9jkAgHuqk7yH0iN117ypxuJnaYe/
 R6up4wKIVbob2110tlwJv4Xh7zEYbWrG8Z84xS5iFSuIWINMsPCgNyNqDb1rh60eM0C9
 i48FxvzJLcq+SK67TfcM2qQRRxASzRAXC/A9H4mpbapJsS+9/KA5Cyn4HJ8bTj1/gLjC
 6qNQ==
X-Gm-Message-State: AOAM533bswgSxbHyHeCgqjL+Z01eTocqur9lSFwwirrgWlYmuypwaIEE
 IebzXISJpdqbJQbaRw8o7o0KcghdalikAdk1crwRFw==
X-Google-Smtp-Source: ABdhPJyj5irJziOjo/uhQ5iuTWMSaQDLgoYe6fcmZUYZB4DpgHthvlOGDr3clKRmtXGXpMDgLUakC8Wce4/JWx4RTCE=
X-Received: by 2002:aca:1706:: with SMTP id j6mr11546933oii.146.1595095736427; 
 Sat, 18 Jul 2020 11:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200718002027.82300-1-jrtc27@jrtc27.com>
 <20200718004934.83174-1-jrtc27@jrtc27.com>
 <569659ed-7b03-7440-9167-855e92301f13@amsat.org>
 <92816800-F7B8-45CB-9863-96B8DF526D29@jrtc27.com>
In-Reply-To: <92816800-F7B8-45CB-9863-96B8DF526D29@jrtc27.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Jul 2020 19:08:45 +0100
Message-ID: <CAFEAcA-EHOVEQLGaF_wu3d-LVvC3+bDHo0=xyvzG+769Kus7WQ@mail.gmail.com>
Subject: Re: [PATCH v2] goldfish_rtc: Fix non-atomic read behaviour of
 TIME_LOW/TIME_HIGH
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup.patel@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Sat, 18 Jul 2020 18:09:00 -0000

On Sat, 18 Jul 2020 at 15:45, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> On 18 Jul 2020, at 08:42, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> > Maybe easier to cache the whole u64, this matches RTC_ALARM_LOW /
> > RTC_ALARM_HIGH pattern (goldfish_rtc_vmstate change not included):
>
> We could, but why waste space storing an extra 32 bits you never need?
> I don't think saving all 64 bits makes it any easier to read, I'd
> personally even argue it makes it slightly less obvious what's going on.

You could go either way. (The original Google-written version
of this device model went for store-the-whole-u64:
https://android.googlesource.com/platform/external/qemu/+/refs/heads/emu-2.=
0-release/hw/android/goldfish/timer.c
but we don't need to follow their implementation.)
Since "save the high half" is the version you've written
and tested, I vote we go with that :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

NB: this is a migration compatibility break for the risc-v
'virt' board : up to Alistair whether that's OK or if the
more awkward compat-maintaining vmstate subsection is worth
the effort.

thanks
-- PMM

