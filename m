Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k93y3-0000ZV-96
	for mharc-qemu-riscv@gnu.org; Fri, 21 Aug 2020 06:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k93y2-0000Yb-H9; Fri, 21 Aug 2020 06:08:14 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k93y1-0007y0-2f; Fri, 21 Aug 2020 06:08:14 -0400
Received: by mail-yb1-xb41.google.com with SMTP id x10so739209ybj.13;
 Fri, 21 Aug 2020 03:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ihHtQr1Sf+MQb3GVixUkYYl7KZnemtzdyyxzIMhuvXM=;
 b=XBx8GUoeefJrMQkl1QPN+kfMmmvTktCkEsSwl8gFBl6ExraZcldvKr2RJDFiuIcaNb
 rterZR6qPCSzI2KTsH+4I3sF3a5QtX3zY2KbfSoqqh1RSlySox+15lfOfC6E2xT2tntl
 mOtpgMJw9PWSp+9efV7cROCQwRFI7UnkgDEVGgwGzuKH6XRQLhGOeajlNW6C77bN2k8w
 18C5d3SyNxpnwMglZU6IUvLX7l4uPDn4e1Bs3o4ohCQ9xA8ps142kdnXYcc0V3GxnMDq
 gmxX3sauVBRqNfuwLhysQNXBk3N6VXj+vW0SnO0XHZUlVj6lI/HOo6fOU9THUvbpRqxH
 FS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ihHtQr1Sf+MQb3GVixUkYYl7KZnemtzdyyxzIMhuvXM=;
 b=ZGL3zeJcxutP8LYgaY9lA/a0iN/WIQEeyEValTWVIUgv6pdcrd2K7M6+5e8OnrDy7v
 sxbkMSFI0D1/vj7D26x9tUl3qyTN8jQy+Fk9fJ3iBj9Ds1OcmR/ZN5/6qb3Kxmapp6HA
 9Z6c63+x9uqo4DkF1iTOY77nehK1MXlVzw+iIDx+AAJ84U6guowiiYmOvMHeL3zj5lbh
 arM480RfXc8c4uws9+pqXiJw4toCl/QtFNm0AMgXF5y8ICNAg6Eh05vdRmvpJBAvxr2+
 LZLeH4S/xQW6mrY2C3SJW4YLZ6YAy7ewEOhtPvP9lDi1RDazdENE3k/dE4EB7VL0CZ7e
 DiGA==
X-Gm-Message-State: AOAM531dUMS1KeKpoNPcrmuY4xy57dlS0iKyg8BMAyiNRBE5tDDy/gQM
 /KFs0eFuD9KRk53c/tspZwS5DkP8E/iRl9jz98o=
X-Google-Smtp-Source: ABdhPJwQs+pLJaS76RAjNqXTOYNDpWAQJ9r97JhLqE1F6gdiy0i9SzMovYFjuReDdrFpdHF5nLkz5kiuvHnQpZCAqjY=
X-Received: by 2002:a25:f20d:: with SMTP id i13mr2607894ybe.152.1598004491447; 
 Fri, 21 Aug 2020 03:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
 <1597423256-14847-8-git-send-email-bmeng.cn@gmail.com>
 <565d9936-3eda-db2f-b390-05f675cf6644@amsat.org>
 <BY5PR02MB67720168B25F53370840545BCA5C0@BY5PR02MB6772.namprd02.prod.outlook.com>
 <20200821100940.GA30457@xhdsaipava40.xilinx.com>
In-Reply-To: <20200821100940.GA30457@xhdsaipava40.xilinx.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 21 Aug 2020 18:08:00 +0800
Message-ID: <CAEUhbmVX7_+SeVJpn_qPMoeLZXH-E3232ggVnq55UeskK3bDGQ@mail.gmail.com>
Subject: Re: [PATCH 07/18] hw/sd: sd: Fix incorrect populated function switch
 status data structure
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, saipava@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 21 Aug 2020 10:08:14 -0000

Hi Sai,

On Fri, Aug 21, 2020 at 6:04 PM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> Hi Philippe,
>
> First two patch of SD look good. Tested them over zynqmp and versal
> platforms.
>

Thanks for testing.

Can I add your Tested-by tag?

Regards,
Bin

