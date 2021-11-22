Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1moxSt-0008Vz-39
	for mharc-qemu-riscv@gnu.org; Sun, 21 Nov 2021 19:45:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1moxSq-0008UF-Hx; Sun, 21 Nov 2021 19:45:44 -0500
Received: from [2607:f8b0:4864:20::12d] (port=34586
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1moxSo-0000RV-Me; Sun, 21 Nov 2021 19:45:44 -0500
Received: by mail-il1-x12d.google.com with SMTP id i9so10858701ilu.1;
 Sun, 21 Nov 2021 16:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IHAPvGAbLx8l896aeyb5D4iMB0sIk+1NYDgX0D10BuY=;
 b=jebSDD5Gdkn7oJQX6oNToXrSp4yM9ZsJus7mSbSwROwybG3pLjx91e0rUkbZFzy7A9
 1lIayy1wxNn17Jy6GO3BSUe9hRG2CkFWVf3F4DW3VZtAjZnUK1+kc/TkgNuSJarne9PY
 fBiTkXj9EUggXaWIQ7NkZ07Ih1gWFpY6uHYbqFPL+aUh1GrHUdHgtZclOfzQVSBv9S1t
 9reMXrkTGvNgEcuPBgVnrR8cTOFRsYKMzSuW/e81Cacd1EtWeP85jcniErQWWby+PeIQ
 iqVKrkSpUBh1zlbQmQBE5g0BDGiRIpMyyDaZApfexVGqxjXmuUnyT3VdpPV4S6Fn3C6R
 kRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IHAPvGAbLx8l896aeyb5D4iMB0sIk+1NYDgX0D10BuY=;
 b=GL0/mXAiCxT9Yia5JOr2igXIBPHk3ru0pfcKFXGGE5RoP/8r7ailBqtaSIuXzpjxU9
 ISnQsafPuuE8CaLczEHXqf7Et5SVuGGuoyT6zNc85GBfn83J4YegoE1ISH0A1fKIpDAM
 XClT6PeP1OwKbwNCXzX/TUufvwuVE2hCCbg5MaZMb6jwAbc4AyQ6qEPWrddoAT8OJclT
 Vdga0xSh0ee0h6foiaNKPD2EOFT9rbJfJ5x0l14/gYUgqekEFFUagi+rqaIgn34gvssx
 3kV9oPCgsNuOxr9Fa50DJeNzXhuKcYWVrswX3K6sAFk63eGX/CA82sLAxhYrKEowtEtQ
 aFzQ==
X-Gm-Message-State: AOAM531/NCHN91pj2YMtgZNKOPu2zXpFtFNfzO7vtq2YJAYw1TS7g3l4
 HOaTOx/G0JwWsC79Rwyse6/HcqXxPp464ovAaqE=
X-Google-Smtp-Source: ABdhPJwCHfekWals1eSmFAtoaaqxeP9Qa7L5TiAtZew0qc5YfEE9MrWe7CadA7+1ON9HlKi/bcARAuuulOfTTyyFK+E=
X-Received: by 2002:a05:6e02:546:: with SMTP id
 i6mr5349839ils.208.1637541941434; 
 Sun, 21 Nov 2021 16:45:41 -0800 (PST)
MIME-Version: 1.0
References: <20211119104757.331579-1-f4bug@amsat.org>
In-Reply-To: <20211119104757.331579-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Nov 2021 10:45:15 +1000
Message-ID: <CAKmqyKN=+ZXTAcXMCjvpWEGq6KAxeM9d7DsGfmyHUok=aYy8YA@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.2?] hw/misc/sifive_u_otp: Do not reset OTP
 content on hardware reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 22 Nov 2021 00:45:45 -0000

On Fri, Nov 19, 2021 at 8:48 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Once a "One Time Programmable" is programmed, it shouldn't be reset.
>
> Do not re-initialize the OTP content in the DeviceReset handler,
> initialize it once in the DeviceRealize one.
>
> Fixes: 9fb45c62ae8 ("riscv: sifive: Implement a model for SiFive FU540 OT=
P")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/misc/sifive_u_otp.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
> index 18aa0bd55d8..b5adcfa7cb4 100644
> --- a/hw/misc/sifive_u_otp.c
> +++ b/hw/misc/sifive_u_otp.c
> @@ -235,14 +235,10 @@ static void sifive_u_otp_realize(DeviceState *dev, =
Error **errp)
>
>              if (blk_pread(s->blk, 0, s->fuse, filesize) !=3D filesize) {
>                  error_setg(errp, "failed to read the initial flash conte=
nt");
> +                return;
>              }
>          }
>      }
> -}
> -
> -static void sifive_u_otp_reset(DeviceState *dev)
> -{
> -    SiFiveUOTPState *s =3D SIFIVE_U_OTP(dev);
>
>      /* Initialize all fuses' initial value to 0xFFs */
>      memset(s->fuse, 0xff, sizeof(s->fuse));
> @@ -259,13 +255,15 @@ static void sifive_u_otp_reset(DeviceState *dev)
>          serial_data =3D s->serial;
>          if (blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
>                         &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
> -            error_report("write error index<%d>", index);
> +            error_setg(errp, "failed to write index<%d>", index);
> +            return;
>          }
>
>          serial_data =3D ~(s->serial);
>          if (blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
>                         &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
> -            error_report("write error index<%d>", index + 1);
> +            error_setg(errp, "failed to write index<%d>", index + 1);
> +            return;
>          }
>      }
>
> @@ -279,7 +277,6 @@ static void sifive_u_otp_class_init(ObjectClass *klas=
s, void *data)
>
>      device_class_set_props(dc, sifive_u_otp_properties);
>      dc->realize =3D sifive_u_otp_realize;
> -    dc->reset =3D sifive_u_otp_reset;
>  }
>
>  static const TypeInfo sifive_u_otp_info =3D {
> --
> 2.31.1
>
>

