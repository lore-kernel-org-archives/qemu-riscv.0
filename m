Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcV4K-00018L-Gp
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 12:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcV47-00012J-4y; Mon, 18 Oct 2021 12:00:44 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:43689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcV43-0007jV-TA; Mon, 18 Oct 2021 12:00:42 -0400
Received: by mail-yb1-xb36.google.com with SMTP id r184so2402724ybc.10;
 Mon, 18 Oct 2021 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U6/BE4kCNRlojG3oJvEZkH3b3t3nkH+/FN8D5NdgLmo=;
 b=XqHcbj1n8x4yrSa5suZ/ZWk4A6Yfdm2al+Ivkj5dUB9IxK2oZw4EhdUevUXoPrSOfz
 PDkSqcCWB1pHgkZRCt/nteyNr+qh9Ws5deDE4tZuXLiwMsBhFpjyQf74RZGuE/VpqNsy
 9n4MrpK7T5YZG/2K/o8L0H1CrjCk800hNwmWTuRCipuNX34ocrcaVHCMkDT7cKWz1cLY
 7JT/Iju3/WLBnRSemyPHZSO0DfuT+RugiO8Ga2QWcs8iqMg+Me5AHnFOaO/PsBv4caHe
 VadSKwK9MEDxAwD9yGyHTVLZ5qDKv5fc6JfsOIOCVocYAw1MC8Tx/PR6MOF8PBDeHTba
 VKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U6/BE4kCNRlojG3oJvEZkH3b3t3nkH+/FN8D5NdgLmo=;
 b=RRyL3dzttlJbg8Z2/pN+c3IjlnwXHUuLLGO85UyjjXgw4y5R8jANlSAgylz3GTThLa
 vVvHfnvgGLU3oDxchy4KVIuE8IwCfXwHPffibUW8Q3GzRmB2TxRzTI6BtgDKlbi0pXLF
 jcFguc74Oudei4cSBA/i+A4nvbXN7z2dwzjOkdImf80JcceJ4vnRPaqZ1Ym+t0sh9Ugd
 LdcBedW5JmKQHA4SIsSLaZz0IjO+JSybpbMMQMe/WD5HEf3vczNxd+RFBYN1ZN15Dw1n
 oBzDdPzwPkydLvdFiAWte03yUhCZtyCX8i2JXko6hBi/OjrWfQB9VDgrzy98hQXYA0X1
 pQLg==
X-Gm-Message-State: AOAM532BSTzEnXAPvvar1DQ9YYnvuRpgAXLhr+bpPHKb/dzobnOYpWXb
 5PGg6qmp1c9d4HjtrSB/xwvBnSpmsIBqNc/qST717U5D
X-Google-Smtp-Source: ABdhPJzK9waUV5sWsTYSc1Kxzf1SIG++rl8me7R2slYLuzQxfNojkOVlnPS3q4gv5Op+2onl2orPV1pm/bLXvoOtd5E=
X-Received: by 2002:a25:c0d2:: with SMTP id
 c201mr12733775ybf.467.1634572837449; 
 Mon, 18 Oct 2021 09:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
 <b51c604b-8f5c-c5e3-7deb-6d6830b30299@redhat.com>
In-Reply-To: <b51c604b-8f5c-c5e3-7deb-6d6830b30299@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 19 Oct 2021 00:00:26 +0800
Message-ID: <CAEUhbmV-LE6R96N2kC4O84ty858nSJ0EuJ-wNBo5wgSEdX-_-w@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/riscv: microchip_pfsoc: Use MachineState::ram and
 MachineClass::default_ram_id
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 16:00:48 -0000

Hi Philippe,

On Mon, Oct 18, 2021 at 11:51 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Bin, is there a cover letter?

Sorry, I did not include a cover letter. I will need to remember this
next time :)

>
> Series:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Thanks for the review!

Regards,
Bin

