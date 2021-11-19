Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo3d2-0006b1-JI
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 08:08:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3cy-0006RP-LG; Fri, 19 Nov 2021 08:08:28 -0500
Received: from [2607:f8b0:4864:20::12e] (port=37612
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3cv-0003ui-Qb; Fri, 19 Nov 2021 08:08:27 -0500
Received: by mail-il1-x12e.google.com with SMTP id h23so10161198ila.4;
 Fri, 19 Nov 2021 05:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0rWVR7VCNe/zsK2mWlDO3KyD+E2zjCjZTO+qf5mpQKQ=;
 b=kslCOPSfrmJG78DzaVm+SDS2OtMvYJdwDd56Gls4BCKez5+jEbshFLQn+dzuzYiyfA
 9SW68K/U31hUP5g7/4UKaHJLMabirro4YKUbvgQ/HsILvgV5Bq4bu10JDAiyAts5MS2K
 N0agw53XulMDKRURf7s0W23ljg62fEKLcE5Q22N1DiHY3V7Miyx9TBWFY0udD/ix25UN
 Azs0fQ9vsBDtOgVAUXWvrZ+87ePcVsd5kQNv3gh2oKM4Oatn6nEgSVd+MDW+EHxVlce0
 c5Zl0zh9z9Zku7XDFWDigWGudXwqaPcteVSlJqtN/ulMSzvqqZs1SrHWhLxV1jjeXd1T
 deog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0rWVR7VCNe/zsK2mWlDO3KyD+E2zjCjZTO+qf5mpQKQ=;
 b=Hhd1jq03M2xfPLQJAoqs5XUId4gugtcHvs82AirEfTyviiFwQ6VGJsEMg8EcFO90uB
 VsNzE7ay5VQKDpLjQ9KBhNXOhBe0Uy2aqUjINGMg8FVPM4z0t9cItMqdMoOnJcii9XLz
 UJ8oKojhnfZfTpETcrMi7K9cVbA7EN+WVs7PwnMR5ODyT+BiVYp/yzvqzl9WEo/Fu/cp
 pnOUl1aZf3VAbh6SpO0BB1AB61F914+xJSRKHuKVBq6UYfVKFNjFVMI91pYqMunLAH3p
 crWaNNHUkW7gy5QoYyKsc1DJmLmRN77r/mK3FZEffJ3ecL04snON8BkXk/IBFhTb+mr6
 BcXA==
X-Gm-Message-State: AOAM532QlNS6BOSDkgmbKi//z+Sqh96DEVoIeEpijPISwLpfsgVfYr8s
 8n/8f/mSTQimZKaYe3ItK1YYS0ZARrHBxGWuHWc=
X-Google-Smtp-Source: ABdhPJxH+5x9zYF51cIpzf6PJWxV+ZTW8Oc11TmOpztljOesEOGZotOo5ZQZyY3a2rvywGRsWtGm83Dy31SalcNbWHo=
X-Received: by 2002:a05:6e02:1bec:: with SMTP id
 y12mr4349864ilv.74.1637327304050; 
 Fri, 19 Nov 2021 05:08:24 -0800 (PST)
MIME-Version: 1.0
References: <20211119104757.331579-1-f4bug@amsat.org>
In-Reply-To: <20211119104757.331579-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 23:07:57 +1000
Message-ID: <CAKmqyKPzirPWG-o4EMxiBZfyjk5kw3zQtryDyua=2JKF+pn82w@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.2?] hw/misc/sifive_u_otp: Do not reset OTP
 content on hardware reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Fri, 19 Nov 2021 13:08:29 -0000

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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

