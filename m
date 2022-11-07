Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1os4Rh-0007dp-Df
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 10:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os4Rf-0007dE-On
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 10:53:55 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os4Re-0003tw-1e
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 10:53:55 -0500
Received: by mail-wr1-x436.google.com with SMTP id cl5so16863762wrb.9
 for <qemu-riscv@nongnu.org>; Mon, 07 Nov 2022 07:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=II7c2jrqx7KbWlYzrn+fLbqohcEO5c3Z24Bf5+33nyE=;
 b=x8VmXu38wF/xlUMbmDEU+k+MYjB4HauU3SOVdA5R1IZgXCcYmTjaw7VNVv8/6dLIEa
 yiTzT4IY96TDYLLTQ1rl49oR4pFaHzHEwrj54bCJA05412ubsBopIwGjFCwRQGaI5HH1
 rK1IEHxhzcug0V92oBRALXKv6VtQsHLuKZpsrQRac24mt+CEWugx9iWRzgxV9ZeJDZAd
 UluGIje1x856B8Jq8AgAjv06ae79r5CVa8ew8UTR+3wECalny+fxdx+JVM32ekR7eVz8
 Hbapz3w2dxLsSzUUHmmkKuAmV0vBUHhmB2bkPv1peBxuq4FQeIlf+z6qruPKe50q8EJi
 xqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=II7c2jrqx7KbWlYzrn+fLbqohcEO5c3Z24Bf5+33nyE=;
 b=oqb3niXNXqQ+sn6R7sPz/0lccw4suk5NQNnaiDKGeeD4n4mZn25EKPWdI7CKq16Gyd
 ePZZBiqdpT7O0equ6dbTFPlL0wI/txxkp3L/TQfZvPjj9HWeIYtTk7FMPXvAR4GBT6Di
 EpNBhFywNCzlzzz2wzJpbVeXxsrBRxm3V1S56GCwCFFb24rnvJbpXKH1yCjaG4Mw5ubn
 PwXin/xOcSRmlXZNKrP3hGVYNiD+9Gmkv78CBbJWcNf9YyxxvznkkBGXNXviIPlcYZYC
 sI8jxcqNk3n0hXWr2LT7Dssdx7jeBJviueD6jHfgnYxxaHBMDz7SVRNZ/oMF9ufhvTB5
 qhpQ==
X-Gm-Message-State: ACrzQf0o4T6IaEZANhnim56LPYfXilJk2dMAshdzWcTtiGjAq7OZvorS
 mDAlzHv67rrvit8UpHHYuSJODg==
X-Google-Smtp-Source: AMsMyM7Vf0fVjGb9wyzTsVd7ZLx3s48WS2jtyTA0IW/ksAZ2UpcKGAagpAWa2d3VUnSiinelU8/rCw==
X-Received: by 2002:adf:ff90:0:b0:236:cb5d:4824 with SMTP id
 j16-20020adfff90000000b00236cb5d4824mr27484252wrr.718.1667836432596; 
 Mon, 07 Nov 2022 07:53:52 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bx11-20020a5d5b0b000000b0023677e1157fsm7726125wrb.56.2022.11.07.07.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 07:53:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 73EC61FFB7;
 Mon,  7 Nov 2022 15:53:51 +0000 (GMT)
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <Y2kRWNnk7wDxPnBK@sunil-laptop>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin
 Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
Date: Mon, 07 Nov 2022 15:50:44 +0000
In-reply-to: <Y2kRWNnk7wDxPnBK@sunil-laptop>
Message-ID: <871qqehib4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 07 Nov 2022 15:53:56 -0000


Sunil V L <sunilvl@ventanamicro.com> writes:

> On Mon, Nov 07, 2022 at 01:06:38PM +0000, Peter Maydell wrote:
>> On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
>> >
>> > The pflash implementation currently assumes fixed size of the
>> > backend storage. Due to this, the backend storage file needs to be
>> > exactly of size 32M. Otherwise, there will be an error like below.
>> >
>> > "device requires 33554432 bytes, block backend provides 4194304 bytes"
>> >
>> > Fix this issue by using the actual size of the backing store.
>> >
>> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
>> > ---
>>=20
>> Do you really want the flash device size presented to the guest
>> to be variable depending on what the user passed as a block backend?
>> I don't think this is how we handle flash devices on other boards...
>>=20
>
> Hi Peter,
>
> x86 appears to support variable flash but arm doesn't. What is
> the reason for not supporting variable size flash in arm?

If I recall from the last time we went around this is was the question
of what you should pad it with.

  https://patchew.org/QEMU/20190307093723.655-1-armbru@redhat.com/201903070=
93723.655-3-armbru@redhat.com/

>
> Thanks
> Sunil


--=20
Alex Benn=C3=A9e

