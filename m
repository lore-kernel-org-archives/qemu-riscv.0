Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQx0k-0007vP-BY
	for mharc-qemu-riscv@gnu.org; Tue, 21 Apr 2020 13:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38194)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jQx0g-0007uQ-Uh
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 13:48:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jQx0g-0001PX-KI
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 13:48:38 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:45505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jQx0e-0001OO-Sb; Tue, 21 Apr 2020 13:48:37 -0400
Received: by mail-io1-xd44.google.com with SMTP id i19so15898791ioh.12;
 Tue, 21 Apr 2020 10:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+LsgN2AKvu9FhXafq6RO8MKOcIMOqI/FUsT8tM3w4bI=;
 b=sI1SwlR3X8puERa0Uk6lCRI++II6pKZVbmYmF8r4CrmJO3thit0H+JxpkNxvorn7wk
 MWr0OA+auYgt1SW1ApJNKG1nvL3hp+lCYuWJaC25EHFs+0i2cPsr/gT2R+U136+DGY4Q
 vSYeYKiHJ4ibfTeP8S2WBNDlhRF+oQb/Y1QtTh4t3HYItGfjbXVdVdc3W1iHu7EbEw7J
 oQGtij2EjxFL2VXFeB7Zb7pwAz0gJx3n3lW1LcHvIe6Nq7xSSctPmeuHwx9qOmoV/ZnX
 XHzdr7bYmyxGCSXtuVKbA2sxFAUo+ZARJnGRx/7P48MbKCztL2jK1GExfuEhdtNayjHX
 3//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+LsgN2AKvu9FhXafq6RO8MKOcIMOqI/FUsT8tM3w4bI=;
 b=a8u9c1LgXemjg0U7GbJuVgiZnjrkqQRl+MYIp5BRjSWWvcUQ5dGhUEsATEtfXNoA9u
 jz36tpv55rG5FsZzqFpUcfeRj9mQRW6hrfgI/wbj3Y/uXDykpoup/xjJrg0+jO/parcj
 JogVHaH5FC6pyRqRVZNDg8cdF8rq3wAH87oqu2VTaKxOQ1hshcge4x/JdPUvKnOGg+lc
 JENwhuE8cYcXsA3vcsNsbCU+9a67fZBsjdllideV7Snt1xmnmuZCRxjW1s1Q8XjveJQM
 odkjoDIYkzZ6ra1+e8NB1IFI83oKyeUfW/AgT3789GVP1SB5dlvnX0azbVEa07wOCCG8
 jxPA==
X-Gm-Message-State: AGi0PubExmo7y6sm0IsKwbARpdF63j0ZeG/PbZUJH+eOTy3DCS6UUiIX
 WlVmeOgqK524eMxDPepM1o7aDe25R8wjcTrYqCs=
X-Google-Smtp-Source: APiQypK8g6IQ7OkYOP6kaPhq6XP1cj3zwdcBTGzmWc2YqH6SzIgdosfpBl/ZIg09MBHM400W/GgwsDQUqSq98M54tBw=
X-Received: by 2002:a5d:984b:: with SMTP id p11mr21871048ios.175.1587491313913; 
 Tue, 21 Apr 2020 10:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583530528.git.alistair.francis@wdc.com>
 <CAEUhbmUHNLYoJutr3dg0hpEPehuzRD4r6eux1EStZxCknMst0w@mail.gmail.com>
 <CAEUhbmWEEBJ67R=kktq=93a2h_ROA0C45Baj+Za73jg251W=WQ@mail.gmail.com>
 <CAKmqyKNegLq5NG+qr_ayZc-_ks5cddZ1mGGWSPCEQ8tgSkOXTg@mail.gmail.com>
 <CAEUhbmW0u9-qOR_WyobeodLJ0jqEChSQNfrJ-ckT+up_fzgCMw@mail.gmail.com>
In-Reply-To: <CAEUhbmW0u9-qOR_WyobeodLJ0jqEChSQNfrJ-ckT+up_fzgCMw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Apr 2020 10:40:05 -0700
Message-ID: <CAKmqyKNvZYu0-VEf8HB_chbB_mD2DxsmCo5_p9Csx=KE8gbiGQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] hw/riscv: Add a serial property to sifive_u
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d44
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
X-List-Received-Date: Tue, 21 Apr 2020 17:48:39 -0000

On Mon, Apr 20, 2020 at 7:17 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Apr 21, 2020 at 3:26 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, Apr 1, 2020 at 10:39 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Tue, Mar 24, 2020 at 10:08 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > Hi Palmer,
> > > >
> > > > On Sat, Mar 7, 2020 at 5:45 AM Alistair Francis
> > > > <alistair.francis@wdc.com> wrote:
> > > > >
> > > > > At present the board serial number is hard-coded to 1, and passed
> > > > > to OTP model during initialization. Firmware (FSBL, U-Boot) uses
> > > > > the serial number to generate a unique MAC address for the on-chip
> > > > > ethernet controller. When multiple QEMU 'sifive_u' instances are
> > > > > created and connected to the same subnet, they all have the same
> > > > > MAC address hence it creates a unusable network.
> > > > >
> > > > > A new "serial" property is introduced to specify the board serial
> > > > > number. When not given, the default serial number 1 is used.
> > > > >
> > > >
> > > > Could you please take this for v5.0.0?
> >
> > Applied to the RISC-V tree for 5.1
> >
>
> Sigh, this patch was submitted on Mar 7 and that is before soft freeze ...
>
> Any chance to get this in 5.0?

That is up to Palmer. I'm only taking over PRs after the 5.0 release.

Alistair

>
> Regards,
> Bin

