Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6WOu-0001Go-Ar
	for mharc-qemu-riscv@gnu.org; Mon, 01 Feb 2021 05:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6WOd-0001E2-AU
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 05:25:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6WOa-0004D5-Md
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 05:25:27 -0500
Received: by mail-wm1-x32e.google.com with SMTP id e15so12668848wme.0
 for <qemu-riscv@nongnu.org>; Mon, 01 Feb 2021 02:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=my+cruc2dBoFqSY8dVBluRTzfXBeNT8slTzI7l3tb5g=;
 b=R81M8izZm8JJNbtnQ2EmhyMptb0d1vIvgZ4qptj1kNc9zo7ozCk9aL6ki8LSZGxseu
 wpB0z8TXLUUMQwsOwuheeQaTzsVOM/5NAk8gSRyCIX/r0H7krM56RcyXalKEUhrHZlyd
 kpPwa4guHb2MbH3yZ6PV90dDmbHIA58iJYBF2viRbC+JgMGCXeDHqYTiU2qv3RM+ONKy
 +Tj5EC/SYEHwR9hxfJzlavXh45RxAzo5eR/PXHBxM55EGvybQ/S/QP15rCkjD4zaBE4X
 CMUBa0C6j7njahF5bF8M1h0xkRzUwZY+STT9E/fgPuS61TjMpRAo7VDcVFA/WKfsONfC
 upXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=my+cruc2dBoFqSY8dVBluRTzfXBeNT8slTzI7l3tb5g=;
 b=eS8bt5wkqH0M4+mhFcf/LWZwziFIDrcbixQBy3O22u2Y32nRX+VWcw19eJVhuKME8X
 DsD4SUY7tk5vJni0WGOONw1FDwBiP9vqa0bHeQSzskYDihYE1hOLYxGK0ZLvIimtGFAj
 Mb6ljZOe7mP71Ee89YXKtmxI5nJNLlW4jnFC02QZuCC4MYpwWr2RlFyA88v+21LQCHYi
 jRj2Gs4Ck94UgrTXkyYT2YFKmtzPZZzC5pz4zDbfC6195VYW9xRLiwhXMz6xM+qz69LS
 an/gaOF+b87s7KwnE9HwC+8BItQkuvqpmPKui9NK7AUtvPd3OfXwC1qUPKYgv0iHpSYs
 bW+Q==
X-Gm-Message-State: AOAM531v/M8AtswNKdibSXyoyu/mba/sVpgQRooAuPKLLodO7+zcV5tm
 MWYFKypd47GYTbkZi5KyDxIVsQ==
X-Google-Smtp-Source: ABdhPJyFa12/Qek6WRITj2IkgqpBYb5YP8V0uz0gUF3JlC5z8zRNpRtuCKni4PD8iafkuQM1e8yNfA==
X-Received: by 2002:a7b:c854:: with SMTP id c20mr14024965wml.127.1612175122539; 
 Mon, 01 Feb 2021 02:25:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i6sm27017928wrs.71.2021.02.01.02.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:25:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DF5D1FF7E;
 Mon,  1 Feb 2021 10:25:20 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-2-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Sarah Harris
 <S.E.Harris@kent.ac.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, Anthony Green
 <green@moxielogic.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Chris Wulff <crwulff@gmail.com>, Guan Xuetao
 <gxt@mprc.pku.edu.cn>, qemu-riscv@nongnu.org, David Hildenbrand
 <david@redhat.com>, qemu-arm@nongnu.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Michael Walle <michael@walle.cc>, Greg
 Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>, Cornelia
 Huck <cohuck@redhat.com>, Marek Vasut <marex@denx.de>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, =?utf-8?Q?Mar?=
 =?utf-8?Q?c-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 01/10] hw/sh4/Kconfig: Rename CONFIG_SH4 ->
 CONFIG_SH4_PERIPHERALS
Date: Mon, 01 Feb 2021 10:24:40 +0000
In-reply-to: <20210131111316.232778-2-f4bug@amsat.org>
Message-ID: <87sg6gw0dr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 01 Feb 2021 10:25:32 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We want to be able to use the 'SH4' config for architecture
> specific features. As CONFIG_SH4 is only used to select
> peripherals, rename it CONFIG_SH4_PERIPHERALS.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I agree with Balaton Zoltan that _DEVICES might be a bit shorter. Either
way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

