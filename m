Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDVYm-0001G4-8v
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 14:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pDVYk-0001FV-QL; Thu, 05 Jan 2023 14:05:50 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pDVYj-0002u2-8e; Thu, 05 Jan 2023 14:05:50 -0500
Received: by mail-yb1-xb32.google.com with SMTP id e76so4714930ybh.11;
 Thu, 05 Jan 2023 11:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=babYxNQH6OOhcedUNBfZWrCjRdVEeEd/QGpJxPR56jU=;
 b=cIoJqfQ6u59hc7RLZbxtk17QR2k65oAlKcrA/9uA3mcBpkKVDg6CyUMyVPZQdFmmSB
 UxdKYmDdvKDeedBkUKK+X8qkxCB9uZCb24ISou6SNAtFTwiLxx5k058UMlqD49WFfYo/
 dbEllhcyw8SaFESz+26pQsePusfnwrcJylVZtIasB2QnPuJ1ZbOOXwV3zCHu88kz9p0G
 GUurIfNrvQ4iGi9wP/pjvkr+l/HOcSKkMivNQjSIDy5rguJ03vJ/ehxOYVVO/lL0pJyR
 ingiBcxALpxU9qHog0audMD34CE/V2C8BRBo19pcpkhhUShsO1Szd/dSb/TAdERdT+AE
 Rt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=babYxNQH6OOhcedUNBfZWrCjRdVEeEd/QGpJxPR56jU=;
 b=23qDRi4cUewFLHWLEtetQ0f44Kcl+jz2JYEnCEALAaG+x2+opS8fLIa6Gdi1X3qFiT
 1sEwE3J4RMDU0BjwU4kGrFhxY5vXgnfDIvi5WNpi/JWYm/u/BCaGad+5s6XhhJwiH6qG
 ZiQeWudeUPmsAckum0ZR/IdN9RCGjRrUD/QwbSsesfj42Bflivuacqt1hzu1NFji3ba5
 tvBlmT3YSvaq7Rawo5ud00FOgSAGWyiolAZn943WVEuvQtoiOhZ0T9IL7bPSSIMK2Cia
 HDe0osLxMZCZtF/P7eIruVO9QcQXxVQirPCYE4g9rZh1fRC1mkcyrGh4bTziLAJzUNyQ
 a8kg==
X-Gm-Message-State: AFqh2koAK9nq1YP+ZBAOHDH245YsKSMcZGsE0DY7nBYG98C1o76uXgAG
 LakvoDCYYzWL17ACRmGaAp1nKuwnrjlepY9hZNY=
X-Google-Smtp-Source: AMrXdXtplYb0O7zDcrFOI1CE85l/ZRHfYN2a9K+44A1jrmWH7fv68M45G/DjDF1QV9chfGQjr9xfdMCOhqeRC8Eu2FA=
X-Received: by 2002:a25:fc6:0:b0:6d5:a304:b9cf with SMTP id
 189-20020a250fc6000000b006d5a304b9cfmr6607154ybp.293.1672945546515; Thu, 05
 Jan 2023 11:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-20-alex.bennee@linaro.org>
In-Reply-To: <20230105164320.2164095-20-alex.bennee@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 5 Jan 2023 11:05:35 -0800
Message-ID: <CAMo8BfJHddmWmj6H9PHBQXALG=mcCZzQDCdkL6rD0k9hMBsZzA@mail.gmail.com>
Subject: Re: [PATCH v2 19/21] gdbstub: move register helpers into standalone
 include
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@gmail.com, 
 David Hildenbrand <david@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz <groug@kaod.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 Marek Vasut <marex@denx.de>, 
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 05 Jan 2023 19:05:51 -0000

On Thu, Jan 5, 2023 at 8:51 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> These inline helpers are all used by target specific code so move them
> out of the general header so we don't needlessly pollute the rest of
> the API with target specific stuff.
>
> Note we have to include cpu.h in semihosting as it was relying on a
> side effect before.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/xtensa/core-dc232b.c            |   2 +-
>  target/xtensa/core-dc233c.c            |   2 +-
>  target/xtensa/core-de212.c             |   2 +-
>  target/xtensa/core-de233_fpu.c         |   2 +-
>  target/xtensa/core-dsp3400.c           |   2 +-
>  target/xtensa/core-fsf.c               |   2 +-
>  target/xtensa/core-lx106.c             |   2 +-
>  target/xtensa/core-sample_controller.c |   2 +-
>  target/xtensa/core-test_kc705_be.c     |   2 +-
>  target/xtensa/core-test_mmuhifi_c3.c   |   2 +-
>  target/xtensa/gdbstub.c                |   2 +-
>  target/xtensa/helper.c                 |   2 +-

Please update the target/xtensa/import_core.sh as well.

--=20
Thanks.
-- Max

