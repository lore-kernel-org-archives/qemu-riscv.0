Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCvfa-0001Y8-Jn
	for mharc-qemu-riscv@gnu.org; Tue, 24 Sep 2019 21:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iCvfX-0001W0-Nr
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 21:00:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iCvfW-0002IS-Gp
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 21:00:35 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:43621)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iCvfW-0002H5-8y; Tue, 24 Sep 2019 21:00:34 -0400
Received: by mail-lf1-x141.google.com with SMTP id u3so2810788lfl.10;
 Tue, 24 Sep 2019 18:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OsLAdtOJ4d4XRcWVNX29HP2/TvlvaQtk0cleys/zOx4=;
 b=iapIuslDOar4kgK9iNJfswxluQmM7W6VDlA+S7dR3GdwSoStMuYBfa5G9I9kQgGzKz
 JZBsio62aErG1SNcit31Uy35b3xkW3/NOOZpF/4m2VjvtOlTnPsjykoBFBtmMF/nsAec
 YXl8Ms7NZDty2KcQI0seEQeWHy/o76CqiCpmj8f+K5Pjf5LVC13Ctn/AczqiCMGWd6qw
 KSEQyJuPBtB1yb7EDP0cznOUtHVtQz4s0zq9jseho7b572yPAJ8DjY9o75XEKSYuz6wI
 ep5KtrfEUXWLkwucQs3DXYGYt7vMeQ+dKEdtzUG0NKbUhRF5BH+zctrejCZYCzWWhMR5
 kzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OsLAdtOJ4d4XRcWVNX29HP2/TvlvaQtk0cleys/zOx4=;
 b=ahc027xsb9w01V2cKIgqwMi3PdO35e6z0QpVGT4OsKPCAgTfthUMXA2zkfLrEMDiHh
 QTWKj5STq0T+ZAvDLMnUQmDcLVsmnNkFJuc8XbBhYOzy5XRt49CbFbhbB4Ni7CWz/xQh
 KJITkUVV+CWUaHWPEjIsPHe6FzdcyXSBnAYoH1eOxyn0KSTPueHuuHWwQLu8K//woZcy
 lsG6bgVXN0ugVlhIeVtiBSajahksvQUt1wTLzNMdSgM0AcnR+FbSvLGkuqFbz2tOxox2
 oYd5bmeAoOa9X5Vy2r4zX0IKix5iFvHLizlewTcr0FLjecO9ZqTo19Dv2fVq1AHIdUrx
 NCqg==
X-Gm-Message-State: APjAAAWyD6jomtVsMQuSDYxQmAwfVZpsDjL0tAeMOvqqlnSDvOF5KC77
 9I1IXMqnLhPbb4DN7y2vDE9Sld6SRPoun81A6Xc=
X-Google-Smtp-Source: APXvYqycuilbOIFwHcvLzaU7giMAv7YuAF+TkxXbGTWGOoKzMtIm8vpFFXHUeCoUjzlwSH1+9EamvUC0+Fwi2W4oJC4=
X-Received: by 2002:ac2:5e9e:: with SMTP id b30mr3683371lfq.5.1569373232985;
 Tue, 24 Sep 2019 18:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568931866.git.alistair.francis@wdc.com>
 <0a5c141a26fada6d93d06e996a2f24e1b269ec50.1568931866.git.alistair.francis@wdc.com>
 <CAEUhbmVvDKQqQYE-riq=cvSrCe_NMoW_KDsLjh8CVHRUhJvk9A@mail.gmail.com>
 <CAKmqyKOofA3U+8kjMkzQ0sNd1=uwJHq3c9eaLZdoNCb7=e-PAw@mail.gmail.com>
 <CAFEAcA-uFPGf4BiDXH=Om3Df-xXrt7QwjzVF7E3kY4aMWMP4YQ@mail.gmail.com>
 <16bab4bf-b91e-ef0c-2d22-53538f74cfc4@redhat.com>
In-Reply-To: <16bab4bf-b91e-ef0c-2d22-53538f74cfc4@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Sep 2019 17:55:50 -0700
Message-ID: <CAKmqyKNitR4YCLh1y8YThfVZqZj603pat3C=i=86Wx8=SWV3Wg@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] riscv/virt: Add the PFlash CFI01 device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
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
X-List-Received-Date: Wed, 25 Sep 2019 01:00:37 -0000

On Tue, Sep 24, 2019 at 2:32 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 9/23/19 11:46 PM, Peter Maydell wrote:
> > On Fri, 20 Sep 2019 at 23:23, Alistair Francis <alistair23@gmail.com> w=
rote:
> >> On Thu, Sep 19, 2019 at 10:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>> I don't think we should mirror what is used on ARM virt board to
> >>> create 2 flash for sifive_u. For ARM virt, there are 2 flashes becaus=
e
> >>> they need distinguish secure and non-secure. For sifive_u, only one i=
s
> >>> enough.
> >>
> >> I went back and forward about 1 or 2. Two seems more usable as maybe
> >> someone wants to include two pflash files? The Xilinx machine also has
> >> two so I'm kind of used to 2, but I'm not really fussed.
>
> The Xilinx machine has 2 because it matches the hardware.
>
> > One of the reasons for having 2 on the Arm board (we do this
> > even if we're not supporting secure vs non-secure) is that
> > then you can use one for a fixed read-only BIOS image (backed
> > by a file on the host filesystem shared between all VMs), and
> > one backed by a read-write per-VM file providing permanent
> > storage for BIOS environment variables. Notably UEFI likes to
> > work this way, but the idea applies in theory to other
> > boot loader or BIOSes I guess.
>
> IIRC Laszlo's explanation, the only reason it is that way is because the
> pflash_cfi01 model still doesn't implement sector locking. At the OVMF
> emerged from EDK2, to have a safe ROM vs DATA storage it was decided to
> use 2 different flashes.
> When I understood when this config layout started, I suggested Laszlo to
> use a real ROM to store the OVMF CODE since it is pointless to do
> firmware upgrade in virtualized environment, but he said it was too late
> to change the design.
>
> If you don't plan to run UEFI "Capsule Update" on your Virt board, I
> suggest using memory_region_init_rom() with your firmware CODE, and a
> parallel/SPI flash for the data VARStore.

We might run that one day, who knows :)

Alistair

>
> > I would suggest also checking with Markus that your code
> > for instantiating the flash devices follows the current
> > recommendations so the backing storage can be configured
> > via -blockdev. (This is a fairly recent change from June or
> > so; current-in-master virt and sbsa boards provide an example
> > of doing the right thing, I think.)
> >
> > thanks
> > -- PMM
> >

