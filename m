Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6X85-0002fs-K9
	for mharc-qemu-riscv@gnu.org; Mon, 01 Feb 2021 06:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6X7y-0002b9-I6
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 06:12:19 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6X7k-0000Pn-JI
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 06:12:17 -0500
Received: by mail-wm1-x334.google.com with SMTP id u14so12802115wmq.4
 for <qemu-riscv@nongnu.org>; Mon, 01 Feb 2021 03:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ifXWw+fuSaZruoQc2hdEOrn5sC5jkN/Y0ScQhXiorQY=;
 b=V+4XnBaHKTHZtcSiJPfzpYuatny+M4LvZi8Jvn51auON/aCStPR/4XZoVwIu7ISm+4
 UkTi03jiyeDHMQLPh4wMAwtZAhiU2WQiesbOGi2IKmTIfgE7oly0oDZkCqgr6KQeR1ja
 FiL47SPNheTzyA5RYQJyM6lQiDbLTcdtPWMJYeqwjM1kOraEcaW9vS+0kdb4VFDDaARP
 set35xMYfKRARH+/APaQGp/05omm4lOlRAo+ouDVeMyKKs8SOnDjrx6DHoi1YCbSLmVo
 4mpD/lraIC3KO9oOlSn9mKh/npuomRVcF9Qc2RL/PHD682ZUH3KRHDeu0qrnujvTxhCG
 bTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ifXWw+fuSaZruoQc2hdEOrn5sC5jkN/Y0ScQhXiorQY=;
 b=hXLipkvUg+4CvkptPiQdJQCOQz7dge01G8oTmY06DSftnMAVwK7Gi6TL4JHPDMyYlY
 CUBTKFXptLgat9XjHe6fQGhcYncaC6QNxcHu7k/N+HxLuklmbugrKkTf8whGQFJrtcOo
 jXCPwjFw2+2M39DIYCGKJKhih7ucCwylITkAMe9b1Jv34dk4JXo+U6ZUOKODcSIbi1hl
 0gKodIm/yyn64SO9rxwCiCW8rKvAvBklvbh01NwM34v6IVt6GTmMyUjnwOGyIJkLD/yx
 SSatpxHHM2bn+TRGZv2m215jCc4+Pbr9Urfwg9XfvG3gdHxogzN9yZ6GK2yhCCICyIZ/
 g6rw==
X-Gm-Message-State: AOAM5316nrwfG73b4+fK0uokUyzBt0wMffHq1kbDd0CrJWhzPsYzmTGP
 2vAiQP2r0U756/tuAz87V10gww==
X-Google-Smtp-Source: ABdhPJzUVW6c0CBbXvCir5HCZkhSJXm6vW4/5xgPkFp0jzqeLqr6PjXJqu9YtKQW4Jo79pEvTGD8pg==
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr2691502wma.37.1612177920161;
 Mon, 01 Feb 2021 03:12:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v4sm30395438wrw.42.2021.02.01.03.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:11:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 13D1C1FF7E;
 Mon,  1 Feb 2021 11:11:58 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-5-f4bug@amsat.org>
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
Subject: Re: [PATCH 04/10] hw/lm32/Kconfig: Have MILKYMIST select
 LM32_PERIPHERALS
Date: Mon, 01 Feb 2021 11:11:52 +0000
In-reply-to: <20210131111316.232778-5-f4bug@amsat.org>
Message-ID: <87k0rsvy81.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Mon, 01 Feb 2021 11:12:20 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The Milkymist board requires more than the PTIMER. Directly
> select the LM32_PERIPHERALS. This fixes:
>
>   /usr/bin/ld:
>   libqemu-lm32-softmmu.fa.p/target_lm32_gdbstub.c.o: in function `lm32_cp=
u_gdb_read_register':
>   target/lm32/gdbstub.c:46: undefined reference to `lm32_pic_get_im'
>   target/lm32/gdbstub.c:48: undefined reference to `lm32_pic_get_ip'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helpe=
r_wcsr_im':
>   target/lm32/op_helper.c:107: undefined reference to `lm32_pic_set_im'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helpe=
r_wcsr_ip':
>   target/lm32/op_helper.c:114: undefined reference to `lm32_pic_set_ip'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helpe=
r_wcsr_jtx':
>   target/lm32/op_helper.c:120: undefined reference to `lm32_juart_set_jtx'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helpe=
r_wcsr_jrx':
>   target/lm32/op_helper.c:125: undefined reference to `lm32_juart_set_jrx'
>   libqemu-lm32-softmmu.fa.p/target_lm32_translate.c.o: in function `lm32_=
cpu_dump_state':
>   target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_ip'
>   target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_im'
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

