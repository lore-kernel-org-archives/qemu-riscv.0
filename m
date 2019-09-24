Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iChBP-0000xa-G3
	for mharc-qemu-riscv@gnu.org; Tue, 24 Sep 2019 05:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55031)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iChBL-0000ux-Dk
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 05:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iChBH-0006tY-CY
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 05:32:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37416)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iChBF-0006sU-BW
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 05:32:21 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 03B2A81F07
 for <qemu-riscv@nongnu.org>; Tue, 24 Sep 2019 09:32:18 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id c188so554459wmd.9
 for <qemu-riscv@nongnu.org>; Tue, 24 Sep 2019 02:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gt4nkXocCUcTz/iKG4/H57HkiQCiCBPpE7cI9pNF/UY=;
 b=RvcAmCe38QFq3jsTgnkapWdHo2k+w2AaruyO8vsJlWmcoXsQxT5dE+NQGP/OKO21hO
 FJzSsYxhI5bdydHMiFm2oRep7yNEYLHqNhyViCJZgWNm3vQyvRAHsLcI9p130qz/Iv8p
 uBlKJrZifCzLIru72nn0ChZ9KiEOtD7/quQNW7NIbJMEZ/evbHsc303bOEwbw4NXpLqm
 jTjx2kcWxRZhWYShY0vpo9HceuZz4e+E/iOKXoYmoYZ7wtOrFo/eg/62xajHqPhl6XPS
 mmWTCKr4KIMPBbgOrBUSAOKa1XmQtxO7pXPSbSLH8+dd+83U1Uby3DrBLw6Bv49Q5lus
 6SQA==
X-Gm-Message-State: APjAAAVF3mJ/5Pyg90ajORHyIRZx2wh32qLUCe6JWn4WBvpmQBytbZDi
 7BlmM6/afRnz2M4lzuDOmHQcZjtiYsRd9hg3T9VsxE5QOoR2IFbeWQmhkw72R5OXVkh4zf61Nnt
 cinlHAIYyK0ZQ0x8=
X-Received: by 2002:a7b:cb0e:: with SMTP id u14mr2050882wmj.115.1569317536652; 
 Tue, 24 Sep 2019 02:32:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxlkLiFaH7aBkkyTDpeqEXUmPUj8g9fIoOVe0yipFXeX6PC07o8+q+Z6sQvLP4grvlkxQHxg==
X-Received: by 2002:a7b:cb0e:: with SMTP id u14mr2050867wmj.115.1569317536437; 
 Tue, 24 Sep 2019 02:32:16 -0700 (PDT)
Received: from [192.168.1.115] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id d193sm2150901wmd.0.2019.09.24.02.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2019 02:32:15 -0700 (PDT)
Subject: Re: [PATCH v1 5/6] riscv/virt: Add the PFlash CFI01 device
To: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair23@gmail.com>, Laszlo Ersek <lersek@redhat.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
References: <cover.1568931866.git.alistair.francis@wdc.com>
 <0a5c141a26fada6d93d06e996a2f24e1b269ec50.1568931866.git.alistair.francis@wdc.com>
 <CAEUhbmVvDKQqQYE-riq=cvSrCe_NMoW_KDsLjh8CVHRUhJvk9A@mail.gmail.com>
 <CAKmqyKOofA3U+8kjMkzQ0sNd1=uwJHq3c9eaLZdoNCb7=e-PAw@mail.gmail.com>
 <CAFEAcA-uFPGf4BiDXH=Om3Df-xXrt7QwjzVF7E3kY4aMWMP4YQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <16bab4bf-b91e-ef0c-2d22-53538f74cfc4@redhat.com>
Date: Tue, 24 Sep 2019 11:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-uFPGf4BiDXH=Om3Df-xXrt7QwjzVF7E3kY4aMWMP4YQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 24 Sep 2019 09:32:29 -0000

On 9/23/19 11:46 PM, Peter Maydell wrote:
> On Fri, 20 Sep 2019 at 23:23, Alistair Francis <alistair23@gmail.com> wrote:
>> On Thu, Sep 19, 2019 at 10:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>> I don't think we should mirror what is used on ARM virt board to
>>> create 2 flash for sifive_u. For ARM virt, there are 2 flashes because
>>> they need distinguish secure and non-secure. For sifive_u, only one is
>>> enough.
>>
>> I went back and forward about 1 or 2. Two seems more usable as maybe
>> someone wants to include two pflash files? The Xilinx machine also has
>> two so I'm kind of used to 2, but I'm not really fussed.

The Xilinx machine has 2 because it matches the hardware.

> One of the reasons for having 2 on the Arm board (we do this
> even if we're not supporting secure vs non-secure) is that
> then you can use one for a fixed read-only BIOS image (backed
> by a file on the host filesystem shared between all VMs), and
> one backed by a read-write per-VM file providing permanent
> storage for BIOS environment variables. Notably UEFI likes to
> work this way, but the idea applies in theory to other
> boot loader or BIOSes I guess.

IIRC Laszlo's explanation, the only reason it is that way is because the
pflash_cfi01 model still doesn't implement sector locking. At the OVMF
emerged from EDK2, to have a safe ROM vs DATA storage it was decided to
use 2 different flashes.
When I understood when this config layout started, I suggested Laszlo to
use a real ROM to store the OVMF CODE since it is pointless to do
firmware upgrade in virtualized environment, but he said it was too late
to change the design.

If you don't plan to run UEFI "Capsule Update" on your Virt board, I
suggest using memory_region_init_rom() with your firmware CODE, and a
parallel/SPI flash for the data VARStore.

> I would suggest also checking with Markus that your code
> for instantiating the flash devices follows the current
> recommendations so the backing storage can be configured
> via -blockdev. (This is a fairly recent change from June or
> so; current-in-master virt and sbsa boards provide an example
> of doing the right thing, I think.)
> 
> thanks
> -- PMM
> 

