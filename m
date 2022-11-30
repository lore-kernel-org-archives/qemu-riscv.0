Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0MMC-0006MB-4z
	for mharc-qemu-riscv@gnu.org; Wed, 30 Nov 2022 07:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0MMA-0006LT-Rv
 for qemu-riscv@nongnu.org; Wed, 30 Nov 2022 07:38:30 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0MM7-0004tR-PU
 for qemu-riscv@nongnu.org; Wed, 30 Nov 2022 07:38:30 -0500
Received: by mail-pf1-x436.google.com with SMTP id h28so3115040pfq.9
 for <qemu-riscv@nongnu.org>; Wed, 30 Nov 2022 04:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+op9WxRRkXJ+LjPnK84cqiJ0WQi5cT6x57OVRmVw6hc=;
 b=SRZzCYR5PSEF59q2de27fktl/1KRCJdZKg4YCdK1uioTHMAEMhg4/KWHOwOMzh3P21
 NgZXhynwjWYQpBl//Nbe0M1E/H/uGgEZSgQll/EHE9ECLLZag1YC5Tv3QXDod4yBh6Qf
 pYQPjR+In1GFp9pU8BQJiSTZTGgP6T4mU7mLP/RmIyFGsf0jh4lI67GoZb6pJOkS/lPc
 DTB7RrvB6eyj4cv5gvTA8RyL2Vub+5F6GXL7GOvOnfbvcODrquBz3JIHenVNqLsZP4mn
 rKKxvG1PcKTmedJNojnPqJvFaBZbsHwDavHeSywf7pXEkZ8cSVcL1jKt1NUmLk+T75vC
 GZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+op9WxRRkXJ+LjPnK84cqiJ0WQi5cT6x57OVRmVw6hc=;
 b=VzH5ZYZ2XUbp5G4v7ANQdqq/ZZYonhaGSUbuM1QCPEILKeW7yYHOGERDEh4+eNFG+9
 l9W2zg3TUBlBkYs1Ezr3JiDyeIAP+Eh1AL+Wek4HmYFnkchS+sr9fB5uG0oRsrwi27HW
 oHPoPk2AqQDxBkWlxwl2hvZYT+6Dpo77O1gTL9mAN3G9+0eJJDGVMfgOz7Cu9MQPyA9I
 U2IjCbuRT/szmvToODhDk2cIWHUAKIp0+hGNOPC3Yb5SABVTkB2LN2VBrjcqi9nXYafn
 ZGxRlzDBFpggeqdfvcpBAgWN19NHkJpx1DG3Sp/cO+fP54DZqLfW2Vk+UgeVnbYs4sNg
 lwDw==
X-Gm-Message-State: ANoB5png3kpvPkP13z7hJiJNeLG1+vuAdw9a1yNu6e7DDN98Pp9IcRkj
 SuK4i24aw53RhJ1x+bHf/cjZCKLp7Ae+SZsKZDUNIA==
X-Google-Smtp-Source: AA0mqf6D+3SL1q6YtKN8DxBkRG7YwpNaRUshfWB+DgefZt72wX98TlnBiiYRBn1XZXdheUX3NN/UYzUYkCceov7dF/0=
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr38521448pgr.192.1669811906124; Wed, 30
 Nov 2022 04:38:26 -0800 (PST)
MIME-Version: 1.0
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <51024464-6fd6-4181-633d-1e261c19917a@linaro.org>
 <0f9b0728-d6b5-a37b-2dcb-7b7fbee876a3@linaro.org>
In-Reply-To: <0f9b0728-d6b5-a37b-2dcb-7b7fbee876a3@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Nov 2022 12:38:14 +0000
Message-ID: <CAFEAcA98mDNWMhT+-2rsevpXAaAUzF-PF74LJ4871yxJcAKFNA@mail.gmail.com>
Subject: Re: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, 
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 30 Nov 2022 12:38:31 -0000

On Wed, 30 Nov 2022 at 10:51, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 24/11/22 14:46, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 24/11/22 12:50, Peter Maydell wrote:
> >> This patchset converts the TYPE_CPU base class and most subclasses
> >> to use 3-phase reset. (The exception is s390, which is doing
> >> something a bit odd with its reset, so the conversion there isn't
> >> going to be simple like these others. So I'll do that one
> >> separately.)
> Note, we can then remove scripts/coccinelle/cpu-reset.cocci.

What's our usual practice for out-of-date conversion coccinelle
scripts? That particular script was "we'll never need this again"
pretty much from the moment it was checked in, because we did
the conversion of all the targets in one go. But it's still
useful in some sense as a "this is an example of how to do
this kind of change with a coccinelle script"...

thanks
-- PMM

